if not natives.are_natives_loaded() then
    natives.load_natives()
end

local MENU_NAME = "Ultimate Menu"

-- Weapon names (the Gun Van section fills WeaponNames)
WeaponNames = {}
local EXTRA_WEAPONS = { "WEAPON_GRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE",
    "WEAPON_SNOWBALL", "WEAPON_PIPEBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_FLARE", "WEAPON_BALL", "WEAPON_ACIDPACKAGE", "WEAPON_PETROLCAN" }
local weaponByHash

local function PrettyWeaponName(name)
    name = name:gsub("^WEAPON_", ""):gsub("_", " "):lower()
    return (name:gsub("(%a)([%w']*)", function(a, b) return a:upper() .. b end))
end

local function WeaponDisplayName(weapon)
    if type(weapon) == "string" then
        return PrettyWeaponName(weapon)
    end
    if not weaponByHash then
        weaponByHash = {}
        for _, name in ipairs(WeaponNames) do weaponByHash[util.joaat(name) % 0x100000000] = name end
        for _, name in ipairs(EXTRA_WEAPONS) do weaponByHash[util.joaat(name) % 0x100000000] = name end
    end
    local name = weaponByHash[weapon % 0x100000000]
    return name and PrettyWeaponName(name) or ("Unknown (" .. tostring(weapon) .. ")")
end

-- Each menu section loads on its own, so one failing section does not take the rest down.
local function Section(name, build)
    local ok, err = pcall(build)
    if not ok then
        log.error("[" .. MENU_NAME .. "] Section '" .. name .. "' failed to load: " .. tostring(err))
    end
end

-- Session state
-- Natives are not safe on the render thread, so the tab reads this cached state.
local Session = { ready = false, online = false }

script.run_in_callback(function()
    while true do
        Session.ready = not scripts.is_active("maintransition")
            and ENTITY.DOES_ENTITY_EXIST(PLAYER.PLAYER_PED_ID())
        Session.online = network.is_session_started()
        script.yield(250)
    end
end)

-- UI
-- Page = one tab (pages nest as sub tabs). A page holds boxes, and every box is a
-- titled group holding features, text or custom ImGui drawing.
BypassOnlineCheck = nil

local Page = {}
Page.__index = Page

local usedFeatureIds = {}
local reportedRenderErrors = {}

local function NewPage(title, parent)
    return setmetatable({
        title = title,
        path = parent and (parent.path .. "/" .. title) or title,
        tabs = {},
        boxes = {},
        columns = 2,
    }, Page)
end

-- Adds a sub tab.
function Page:Tab(title)
    local page = NewPage(title, self)
    self.tabs[#self.tabs + 1] = page
    return page
end

-- This tab (and its sub tabs) only shows its content in GTA Online.
function Page:RequireOnline()
    self.online = true
    return self
end

-- Number of box columns on this page.
function Page:Columns(count)
    self.columns = count
    return self
end

-- Starts a box; everything added afterwards goes into it.
-- Using the title of an existing box continues that box.
-- column (optional) pins a new box to that column instead of the automatic left-to-right fill;
-- column 0 makes it span the full width above the columns.
function Page:Box(title, column)
    for _, box in ipairs(self.boxes) do
        if box.title == title then
            self.box = box
            return self
        end
    end
    self.box = { title = title, items = {}, column = column }
    self.boxes[#self.boxes + 1] = self.box
    return self
end

function Page:Add(item)
    if not self.box then
        self:Box(self.title)
    end
    self.box.items[#self.box.items + 1] = item
end

-- Registers a menu command and places it in the current box.
function Page:Feature(name, create)
    local id = "UltimateMenu/" .. self.path .. "/" .. name
    local unique, n = id, 1
    while usedFeatureIds[unique] do
        n = n + 1
        unique = id .. "#" .. n
    end
    usedFeatureIds[unique] = true

    local feature = create(unique)
    self:Add({ feature = feature })
    return feature
end

-- onClick runs in a script callback, so it may call natives and script.yield.
function Page:Button(name, onClick, desc)
    return self:Feature(name, function(id)
        return commandmgr.add_command(id, name, desc or "", function()
            onClick()
        end)
    end)
end

function Page:Toggle(name, desc)
    return self:Feature(name, function(id)
        return commandmgr.add_bool_command(id, name, desc or "")
    end)
end

function Page:InputInt(name, desc)
    return self:Feature(name, function(id)
        return commandmgr.add_int_command(id, name, desc or "", nil, nil, 0, function(value)
            if value < 0 then
                commandmgr.get_command(id):set_value(0)
            end
        end)
    end)
end

function Page:Text(text)
    self:Add({ text = text })
end

-- render() draws with ImGui inside the box. It runs on the render thread.
function Page:Custom(render)
    self:Add({ render = render })
end

local function RenderBox(box)
    ImGui.BeginGroup()
    ImGui.SeparatorText(box.title)
    for _, item in ipairs(box.items) do
        if item.feature then
            item.feature:draw()
        elseif item.text then
            ImGui.TextWrapped(item.text)
        else
            local width = ImGui.GetContentRegionAvail()
            ImGui.PushItemWidth(width * 0.55)
            local ok, err = pcall(item.render)
            ImGui.PopItemWidth()
            if not ok and not reportedRenderErrors[err] then
                reportedRenderErrors[err] = true
                log.error("[" .. MENU_NAME .. "] " .. box.title .. ": " .. tostring(err))
            end
        end
    end
    ImGui.EndGroup()
    ImGui.Spacing()
end

-- Boxes fill the columns left to right, then stack downwards.
-- A box pinned to a column goes to the end of that column and is skipped by the fill.
-- Column 0 boxes span the full width above the columns.
local function RenderBoxes(page)
    local inColumns = 0
    for _, box in ipairs(page.boxes) do
        if box.column == 0 then
            RenderBox(box)
        else
            inColumns = inColumns + 1
        end
    end

    local columns = math.min(page.columns, inColumns)
    if columns <= 1 then
        for _, box in ipairs(page.boxes) do
            if box.column ~= 0 then
                RenderBox(box)
            end
        end
        return
    end
    if ImGui.BeginTable("##boxes", columns, ImGuiTableFlags.SizingStretchSame) then
        for column = 1, columns do
            ImGui.TableNextColumn()
            local filled = 0
            for _, box in ipairs(page.boxes) do
                if box.column ~= 0 then
                    local target = box.column and math.min(box.column, columns)
                    if not target then
                        target = filled % columns + 1
                        filled = filled + 1
                    end
                    if target == column then
                        RenderBox(box)
                    end
                end
            end
        end
        ImGui.EndTable()
    end
end

local function BlockedReason(page)
    if not page.online or (BypassOnlineCheck and BypassOnlineCheck:get_value()) then
        return nil
    end
    if not Session.ready then
        return "Waiting for game..."
    end
    if not Session.online then
        return "Unavailable in Single Player."
    end
    return nil
end

local function RenderPage(page)
    local blocked = BlockedReason(page)
    if blocked then
        ImGui.Text(blocked)
        return
    end
    if #page.tabs == 0 then
        RenderBoxes(page)
        return
    end
    if ImGui.BeginTabBar("##tabs") then
        -- A page with both own content and sub tabs shows its content as "Main".
        if #page.boxes > 0 and ImGui.BeginTabItem("Main") then
            RenderBoxes(page)
            ImGui.EndTabItem()
        end
        for _, tab in ipairs(page.tabs) do
            local hidden = tab.hideToggle and tab.hideToggle:get_value()
            if not hidden and ImGui.BeginTabItem(tab.title) then
                ImGui.PushID(tab.title)
                RenderPage(tab)
                ImGui.PopID()
                ImGui.EndTabItem()
            end
        end
        ImGui.EndTabBar()
    end
end

local Menu = NewPage(MENU_NAME)

menu.set_menu_name(MENU_NAME)
menu.get_submenu():add_category(MENU_NAME):imgui(function()
    RenderPage(Menu)
end)

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Globals & Locals & Variables (Enhanced 1.73)--
--UPDATE GUIDE: cuts = planning script globals | force ready stride in [] | finish/lives = mission locals--

-- 0. Core --
FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
CSg1 = 1575048 -- change session (type) 1                   // Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false); in freemode.c
CSg2 = 1574589 -- change session (switch) 2                 // Guide:   MP_POST_MATCH_TRANSITION_SCENE in freemode.c
CSg3 = 1574589 + 2 -- change session (quit) 3               // Guide:   MP_POST_MATCH_TRANSITION_SCENE in freemode.c

-- 1. Apartment Heist --
-- Cuts (board) --
ACg1 = 1936406 + 1 + 1 -- global apartment player 1 cut global
ACg2 = 1936406 + 1 + 2 -- global apartment player 2 cut global
ACg3 = 1936406 + 1 + 3 -- global apartment player 3 cut global
ACg4 = 1936406 + 1 + 4 -- global apartment player 4 cut global
ACg5 = 1938374 + 3008 + 1 -- actual apartment player 1 cut global
ACg6 = 1938374 + 3008 + 2 -- actual apartment player 2 cut global (FIX: was missing, caused crew to get 0)
ACg7 = 1938374 + 3008 + 3 -- actual apartment player 3 cut global (FIX: was missing, caused crew to get 0)
ACg8 = 1938374 + 3008 + 4 -- actual apartment player 4 cut global (FIX: was missing, caused crew to get 0)
-- Jobs / Cooldown (direct tunables, no FMg globals) --
-- Finish / Hacks / Checkpoint / Lives --
AIFl1 = 20412 -- apartment instant finish local 1
AIFl2 = 20412 + 1062 -- apartment instant finish local 2
AIFl3 = 20412 + 1725 + 1 -- apartment instant finish local 3
AIFl4 = 20412 + 2686 -- apartment instant finish local 4
AIFl5 = 29326 + 1 -- apartment instant finish local 5
AIFl6 = 32785 + 1 + 68 -- apartment instant finish local 6
AFHl = 12239 + 24 -- apartment fleeca hack local
AFDl = 10527 + 11 -- apartment fleeca drill local
AFPl = 10233 -- apartment pacific hack local
AHSo = 20412 + 2 -- Apartment heist skip checkpoint
ACDg = 2686124 -- apartment cooldown global
-- Force Ready [stride 468] Global_2658296[PLAYER_ID].f_270 = 6 --
AFRg = 2658296 -- apartment force ready global
AHDg = 4718592 + 3771 -- search in tuneables_processing.c for J("HEIST_DIFFICULTY_EASY") then search the global you find in fmmc_launcher.c then take the global in switch state above it done
AHLIVESL = 26838 + 1325 + 1 -- Apartment Heist team lives local

-- 2. Diamond Casino Heist --
-- Board / Cuts --
DCRBl = 219 -- diamond casino reload board local
DCCg1 = 1973762 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global
DCCg2 = 1973762 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
DCCg3 = 1973762 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
DCCg4 = 1973762 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
-- Hacks / Lives / Finish --
DCAg = 10713 -- casino autograbber local 1
DCAs = 10713 + 14 -- casino autograbber local 2
DCFHl = 55028 -- diamond casino fingerprint hack local
DCKHl = 56098 -- diamond casino keypad hack local
DCDVDl1 = 10567 + 7 -- diamond casino drill vault door local 1
DCDVDl2 = 10567 + 37 -- diamond casino drill vault door local 2
DCLIVESL = 26838 + 1325 + 1 -- diamond casino team lives local
-- Finish --
DCXf1 = 20412
DCXf2 = 20412 + 1062
DCXf3 = 20412 + 1740 + 1
DCXf4 = 20412 + 2686
DCXf5 = 29326 + 1
DCXf6 = 32785 + 1 + 68
-- Force Ready [stride 68] Global_1978125[NETWORK_PLAYER_ID].f_7[0] = 1 --
CFRg = 1978125 -- casino force ready global

-- 3. Cayo Perico Heist --
-- Board / Cuts --
CPRSl = 1580 -- cayo perico reload screen local
CPCg1 = 1980570 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1980570 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1980570 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1980570 + 831 + 56 + 4 -- cayo perico player 4 cut global
-- Hacks / Finish / Lives --
CPFHl = 26619 -- cayo perico fingerprint hack local
CPPCCl = 32751 + 3 -- cayo perico plasma cutter cut local
CPSTCl = 31511 -- cayo perico drainage pipe cut local
CPXf1 = 56504 -- cayo perico instant finish local 1
CPXf2 = 56504 + 1776 + 1 -- cayo perico instant finish local 2
CPLIVESL = 63285 + 1109 + 1 -- Cayo Perico team lives local
-- Force Ready [stride 27] Global_1981683[NETWORK_PLAYER_ID].f_7[0] = 1 --
CYFRg = 1981683 -- cayo force ready global
-- Misc (mantrap / secondary / take) --
CPMantrap1 = 69373 + (0 * 293) + 236 -- cayo solo mantrap dual keycard 1 = 7
CPMantrap2 = 21215 -- cayo solo mantrap dual keycard 2 = 1
CPSecondary = 29373 + 11 -- cayo take secondary target = 3
CPLootTake = 59986 + 1376 + 53 -- cayo loot take

-- 4. Doomsday Heist --
-- Hack / Cuts --
DDSHl = 1314 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1969071 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1969071 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1969071 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1969071 + 812 + 50 + 4 -- doomsday player 4 cut global
-- Finish / Lives --
DDIF1 = 20412 -- doomsday instant finish local 1 (base)
DDIF2 = 20412 + 1740 + 1 -- doomsday instant finish local 2 (150 for Act III)
DDIF3 = 29326 + 1 -- doomsday instant finish local 3 (99999)
DDIF4 = 32785 + 1 + 68 -- doomsday instant finish local 4 (99999)
DDIF5 = 32785 + 97 -- doomsday instant finish local 5 (80 for Act I/II)
DDIF6 = 20412 + 1062 -- FIX Bug#1: missing Act III "passed" flag (5). Old single button never set it, causing teleport/fail in Doomsday Scenario.
DDLIVESL = 26838 + 1325 + 1 -- Doomsday team lives local
-- Force Ready [stride 321] Global_1882797[NETWORK_PLAYER_ID].f_43.f_11[0] = 1 --
DDFRg = 1882797 -- doomsday force ready global

-- 5. Kortz Center Heist --
-- Board / Hacks --
KCBRL = 599 -- kortz center reload board local
KCDCL = 1388 -- Data crack local (1388 + 1 + (i * 4) for i = 0-7) [+1 skips array size]
KCFHL = 26866 -- Fingerprint hack local
KCAC_BASE = 32818 + 3 -- Access code base (32818 + 3 + (i * 2) for i = 0-2)
KCLGL = 70416 -- Lasers local
KCVLL = 27914 -- Vault door local
-- Lasers: 1060,1061 = 1,0 Easy | 0,1 Hard | 1062 = 1 no damage --
KCLDIF1 = 1058 + 2 -- lasers difficulty 1: 1,0=Easy | 0,1=Hard
KCLDIF2 = 1059 + 2 -- lasers difficulty 2
KCNoDmg = 1060 + 2 -- no damage lasers = 1
-- Loot take --
KCLootTake = 60737 + 1376 + 60 -- loot take
KCCGL_BASE = 32855 + 1 -- Cut glass base (32855 + 1 + (i * 13) + 3 for i = 0-4) [+1 skips array size]
KCCGL_OFFSET = 3 -- Cut glass offset

-- Target State Locals --
KCPT_STATE = 29355 + 11 -- Primary target state (10/15/17 = available, 3 = taken)
KCST_STATE = 29355 + 11 -- Secondary target state (3 = available)

-- Globals (FMg-based) --
KCBGL = FMg + 38037 -- Bag size global
KCWMG = FMg + 38199 -- Weekly multiplier global
KCCDG = FMg + 38102 -- Cooldown normal global
KCCD2G = FMg + 38103 -- Cooldown hard mode global
KCLDG = 1935711 -- Lasers disable global
KCSECONDARY_BASE = 4980736 + 1 + 29174 -- Secondary targets base (4980736 + 1 + 29174 + (i * 333) + 68/143) [+1 skips array size]
KCPAYOUT_BASE = FMg + 38004 -- Primary target payout base

-- Lives --
KCLIVESL = 64049 + 1109 + 1 -- Team lives local

-- 6. Agency / Autoshop / Salvage / LSA --
-- Agency --
AGFl1 = 56504 + 1
AGFl2 = 56504 + 1776 + 1

-- Autoshop --
ASIFl1 = 56504 + 1 -- auto shop instant finish local 1
ASIFl2 = 56504 + 1776 + 1 -- auto shop finish local 2
ASRBl = 418 -- auto shop reload board local

-- Salvage Yard --
SYRl1 = 547 -- salvage yard reload board local

-- LSA Operations --
LSAIFl1 = 7881 + 1306 -- LSA operations instant finish local 1
LSAIFl2 = 7743 + 1 -- LSA operations instant finish local 2

-- 7. Heists Meta (launch flow) --
HGLs1 = 4718592 + 3769
HGLs2 = 4718592 + 3772
HGLs3 = 4718592 + 3773
HGLs4 = 4718592 + 196663 + 1
HGGs1 = 20196 + 34
HGGs2 = 20196 + 15
HEIST_SOLO_LAUNCH_BASE = 794989

NLCl = 215 + 32 + 19 + 1 --("nightclub_office_cutscene") in ("am_mp_nightclub")

TRANSACTION_ERROR_GLOBAL_1 = 4516981
TRANSACTION_ERROR_GLOBAL_2 = 4516982
TRANSACTION_ERROR_GLOBAL_3 = 4516983
SUPPLY_GLOBAL = 1673814
BUNKER_PRODUCTION_GLOBAL = 2709036
GUN_VAN_LOCATION_GLOBAL = 2655290
CASINO_CHIP_LIMIT_BUY_1 = FMg + 26643
CASINO_CHIP_LIMIT_BUY_2 = FMg + 26644
CASINO_CHIP_LIMIT_SELL = FMg + 26645
NIGHTCLUB_INCOME_START = FMg + 23750
NIGHTCLUB_INCOME_END = FMg + 23769
NIGHTCLUB_SAFE_CAPACITY = FMg + 23773
LSCM_REP_START = FMg + 31047
LSCM_REP_END = FMg + 31076

SAFE_COLLECT = {
    { name = "Nightclub",         stat = "CLUB_SAFE_CASH_VALUE",    global = 2708943 },
    { name = "Arcade",            stat = "ARCADE_SAFE_CASH_VALUE",  global = 2708952 },
    { name = "Agency",            stat = "FIXER_SAFE_CASH_VALUE",   global = 2708961 },
    { name = "Salvage Yard",      stat = "SALVAGE_SAFE_CASH_VALUE", global = 2708970 },
    { name = "Bail Office",       stat = "BAIL_SAFE_CASH_VALUE",    global = 2708979 },
    { name = "Garment Factory",   stat = "HDEN24_SAFE_CASH_VALUE",  global = 2708994 },
    { name = "Hands On Car Wash", stat = "CWASH_SAFE_CASH_VALUE",   global = 2709001 },
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function MPX()
    local PI = stats.get_int("MPPLY_LAST_MP_CHAR")
    if PI == 1 then
        return "MP1_"
    end
    return "MP0_"
end

function OpenScreenScript(name, stackSize)
    local ok, err = pcall(function()
        SCRIPT.REQUEST_SCRIPT(name)
        local waited = 0
        while not SCRIPT.HAS_SCRIPT_LOADED(name) do
            script.yield(50)
            waited = waited + 50
            if waited > 5000 then
                notify.info("Screen", "Script " .. name .. " did not load.")
                return
            end
        end
        BUILTIN.START_NEW_SCRIPT(name, stackSize)
        SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED(name)
    end)
    if not ok then
        log.error("[" .. MENU_NAME .. "] Opening " .. name .. " failed: " .. tostring(err))
        notify.info("Screen", "Failed to open " .. name .. ", see the log.")
    end
end

function SkipCutscene()
    script.run_in_callback(function()
        if CUTSCENE.IS_CUTSCENE_PLAYING() then
            CUTSCENE.STOP_CUTSCENE_IMMEDIATELY()
            script.yield(100)
            CUTSCENE.REMOVE_CUTSCENE()
        end
    end)
end

function CollectSafeRemote(index)
    local safe = SAFE_COLLECT[index]
    if not safe then return false end
    if stats.get_int(MPX() .. safe.stat) == 0 then return false end
    ScriptGlobal(safe.global):set_int(1)
    return true
end

function SN_ApplyApartmentCuts(c1, c2, c3, c4, isFleeca)
    if isFleeca then
        c3 = 0
        c4 = 0
    end
    ScriptGlobal(ACg5):set_int(c1)
    ScriptGlobal(ACg6):set_int(c2)
    ScriptGlobal(ACg7):set_int(c3)
    ScriptGlobal(ACg8):set_int(c4)
end

function SN_ApartmentMaxCut(doubleWeek)
    local payoutsByHash = {
        [1328892776] = { 100625, 201250, 251563 },
        [964111671] = { 350000, 700000, 875000 },
        [1131632450] = { 472500, 945000, 1181250 },
        [1967927346] = { 353500, 707000, 883750 },
        [1182286714] = { 750000, 1500000, 1875000 },
    }
    local key = ScriptGlobal(ACDg + (PLAYER.PLAYER_ID() * 77) + 24 + 2):get_int()
    local diff = ScriptGlobal(AHDg):get_int() + 1
    if diff < 1 or diff > 3 then
        diff = 3
    end
    local row = payoutsByHash[key]
    if row == nil then
        return nil
    end
    local payout = row[diff]
    local cut = math.floor(3000000 / (payout / 100) / (doubleWeek and 2 or 1))
    return cut, key
end

function SN_ApplyCayoCuts(c1, c2, c3, c4)
    ScriptGlobal(CPCg1):set_int(c1)
    ScriptGlobal(CPCg2):set_int(c2)
    ScriptGlobal(CPCg3):set_int(c3)
    ScriptGlobal(CPCg4):set_int(c4)
end

function SN_CayoMaxCut()
    local target = stats.get_int(MPX() .. "H4CNF_TARGET")
    local isHard = bit.band(stats.get_int(MPX() .. "H4_PROGRESS"), 4096) ~= 0
    local diff = isHard and 2 or 1
    local payouts = {
        [0] = { 630000, 693000 },
        [1] = { 700000, 770000 },
        [2] = { 770000, 847000 },
        [3] = { 1300000, 1430000 },
        [4] = { 1100000, 1210000 },
        [5] = { 1900000, 2090000 },
    }
    local row = payouts[target]
    if row == nil then
        return nil
    end
    local payout = row[diff]
    local maxPayout = 2550000
    local cut = math.floor(maxPayout / (payout / 100))
    local final = math.floor(payout * (cut / 100))
    local difference = 1000
    local found = false
    local guard = 0
    while not found and guard < 2000 do
        guard = guard + 1
        local pavel = math.floor(final * 0.02)
        local fee = math.floor(final * 0.10)
        local net = final - (pavel + fee)
        if net >= maxPayout - difference and net <= maxPayout then
            found = true
        else
            cut = cut + 1
            final = math.floor(payout * (cut / 100))
            if cut > 500 then
                cut = math.floor(maxPayout / (payout / 100))
                final = math.floor(payout * (cut / 100))
                difference = difference + 1000
            end
        end
    end
    return cut
end

function changeSession(session)
    script.run_in_callback(function()
        ScriptGlobal(CSg1):set_int(session)
        if session == -1 then
            ScriptGlobal(CSg3):set_int(-1)
        end
        script.yield(1000)
        ScriptGlobal(CSg2):set_int(1)
        script.yield(1000)
        ScriptGlobal(CSg2):set_int(0)
    end)
end

function stats_set_packed_bools(packed_bool_start, packed_bool_finish, bool)
    for i = packed_bool_start, packed_bool_finish do
        stats.set_packed_bool(i, bool)
    end
end

function globals_set_ints(global_start, global_finish, step, value)
    for i = global_start, global_finish, step do
        ScriptGlobal(i):set_int(value)
    end
end

--Required Scripts (centralized: update names here only)--

FMC = "fm_mission_controller"
FMC2020 = "fm_mission_controller_2020"
FMCV3 = "fm_mission_controller_v3"
FMMCL = "fmmc_launcher"
FMMLASERS = "fmmc_lasers"
HIP = "heist_island_planning"
CASPL = "gb_casino_heist_planning"
GANGPL = "gb_gang_ops_planning"
KORTZPL = "kortz_planning"
TUNERPL = "tuner_planning"
SMUGOPS = "fm_content_smuggler_ops"
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function selfTP(keepVehicle, setHeading, coords, heading)
    script.run_in_callback(function()
        STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
        script.yield(300)
        if setHeading then
            if heading == nil then
                heading = 0.0
            end
            ENTITY.SET_ENTITY_HEADING(PLAYER.PLAYER_PED_ID(), heading)
        end
        if keepVehicle then
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
        else
            TASK.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.PLAYER_PED_ID())
            ENTITY.SET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z, false, false, false, true)
        end
    end)
end
Section("Self", function()
Self = Menu:Tab("Self"):RequireOnline()
SelfMain = Self:Tab("Main")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SelfMain:Box("General")
AGCT = SelfMain:Toggle("Unlock Gender Change")
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            script.yield(500)
            return
        end
        local want = AGCT:get_value() and 52 or 0
        if want ~= _genderPrev then
            stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", want)
            _genderPrev = want
        end
        script.yield(500)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

RTPT = SelfMain:Toggle("Remove Transaction Error")
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            script.yield(500)
            return
        end
        if RTPT:get_value() then
            ScriptGlobal(TRANSACTION_ERROR_GLOBAL_1):set_int(0)
            ScriptGlobal(TRANSACTION_ERROR_GLOBAL_2):set_int(0)
            ScriptGlobal(TRANSACTION_ERROR_GLOBAL_3):set_int(0)
        end
        script.yield(500)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

SelfMain:Button("Remove Published And Players Job Liked To You", function()
    stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", 0)
    stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", 0)
    stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 0)
    stats.set_int("MPPLY_LTS_CREATED", 0)
    stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", 0)
    stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", 0)
    stats.set_int("MPPLY_FM_MISSION_LIKES", 0)
end)

SelfMain:Button("Remove Orbital Cannon Cooldown", function()
    stats.set_int(MPX() .. "ORBITAL_CANNON_COOLDOWN", 0)
end)

SelfMain:Button("Refill Nightclub Popularity", function()
    stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SelfMain:Box("Inventory")
SelfMain:Button("Refill Inventory/Armour", function()
    stats.set_int(MPX() .. "NO_BOUGHT_YUM_SNACKS", 30)
    stats.set_int(MPX() .. "NO_BOUGHT_HEALTH_SNACKS", 15)
    stats.set_int(MPX() .. "NO_BOUGHT_EPIC_SNACKS", 5)
    stats.set_int(MPX() .. "NUMBER_OF_CHAMP_BOUGHT", 5)
    stats.set_int(MPX() .. "NUMBER_OF_ORANGE_BOUGHT", 11)
    stats.set_int(MPX() .. "NUMBER_OF_BOURGE_BOUGHT", 10)
    stats.set_int(MPX() .. "NUMBER_OF_SPRUNK_BOUGHT", 10)
    stats.set_int(MPX() .. "CIGARETTES_BOUGHT", 20)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_1_COUNT", 10)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_2_COUNT", 10)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_3_COUNT", 10)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_4_COUNT", 10)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_5_COUNT", 10)
    stats.set_int(MPX() .. "BREATHING_APPAR_BOUGHT", 20)
end)

SelfMain:Button("Refill Inv/Armour x1000", function()
    stats.set_int(MPX() .. "NO_BOUGHT_YUM_SNACKS", 1000)
    stats.set_int(MPX() .. "NO_BOUGHT_HEALTH_SNACKS", 1000)
    stats.set_int(MPX() .. "NO_BOUGHT_EPIC_SNACKS", 1000)
    stats.set_int(MPX() .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
    stats.set_int(MPX() .. "NUMBER_OF_ORANGE_BOUGHT", 1000)
    stats.set_int(MPX() .. "NUMBER_OF_BOURGE_BOUGHT", 1000)
    stats.set_int(MPX() .. "NUMBER_OF_SPRUNK_BOUGHT", 1000)
    stats.set_int(MPX() .. "CIGARETTES_BOUGHT", 1000)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_1_COUNT", 1000)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_2_COUNT", 1000)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_3_COUNT", 1000)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_4_COUNT", 1000)
    stats.set_int(MPX() .. "MP_CHAR_ARMOUR_5_COUNT", 1000)
    stats.set_int(MPX() .. "BREATHING_APPAR_BOUGHT", 1000)
end)


SelfMain:Box("Bad Sport")

BadSportCombo = 0
SelfMain:Custom(function()
    ImGui.SetNextItemWidth(140)
    BadSportCombo = ImGui.Combo("##BadSport", BadSportCombo, { "Remove", "Add" }, 2)
end)

function BadSport(State, Overall, Bool)
    script.run_in_callback(function()
        notify.info("Bad Sport!", "Awaiting Session Change")
        script.yield(1000)
        stats.set_int("MPPLY_BADSPORT_MESSAGE", State)
        stats.set_float("MPPLY_OVERALL_BADSPORT", Overall + 0.0)
        stats.set_bool("MPPLY_CHAR_IS_BADSPORT", (Bool) and true or false)
        ScriptGlobal(CSg1):set_int(11)
        ScriptGlobal(CSg2):set_int(1)
        script.yield(300)
        ScriptGlobal(CSg2):set_int(0)
    end)
end


SelfMain:Button("Execute", function()
    if BadSportCombo == 0 then
        BadSport(0, 0, false)
    else
        BadSport(1, 3000, true)
    end
end)
end)

Section("Reports", function()
ReportsMenu = Self:Tab("Reports")
ReportsMenu:Box("Reports")
ReportsMenu:Custom(function()
    ImGui.Text("Griefing: " .. stats.get_int("MPPLY_GRIEFING"))
    ImGui.Text("Exploiting: " .. stats.get_int("MPPLY_EXPLOITS"))
    ImGui.Text("Abusing Bugs: " .. stats.get_int("MPPLY_GAME_EXPLOITS"))
    ImGui.Text("Annoying People In Text: " .. stats.get_int("MPPLY_TC_ANNOYINGME"))
    ImGui.Text("Hate Speech In Voice: " .. stats.get_int("MPPLY_VC_HATE"))
    ImGui.Text("Offensive Language: " .. stats.get_int("MPPLY_OFFENSIVE_LANGUAGE"))
    ImGui.Text("Offensive Tagplate: " .. stats.get_int("MPPLY_OFFENSIVE_TAGPLATE"))
    ImGui.Text("Offensive Content: " .. stats.get_int("MPPLY_OFFENSIVE_UGC"))
    ImGui.Text("Bad Crew Name: " .. stats.get_int("MPPLY_BAD_CREW_NAME"))
    ImGui.Text("Bad Crew Motto: " .. stats.get_int("MPPLY_BAD_CREW_MOTTO"))
    ImGui.Text("Bad Crew Status: " .. stats.get_int("MPPLY_BAD_CREW_STATUS"))
    ImGui.Text("Bad Crew Emblem: " .. stats.get_int("MPPLY_BAD_CREW_EMBLEM"))
end)
ReportsMenu:Box("Commendations")
ReportsMenu:Custom(function()
    ImGui.Text("Friendly: " .. stats.get_int("MPPLY_FRIENDLY"))
    ImGui.Text("Helpful: " .. stats.get_int("MPPLY_HELPFUL"))
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Recovery", function()
RecoveryMenu = Menu:Tab("Recovery"):RequireOnline()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local rp = {
    0,
    800,
    2100,
    3800,
    6100,
    9500,
    12500,
    16000,
    19800,
    24000,
    28500,
    33400,
    38700,
    44200,
    50200,
    56400,
    63000,
    69900,
    77100,
    84700,
    92500,
    100700,
    109200,
    118000,
    127100,
    136500,
    146200,
    156200,
    166500,
    177100,
    188000,
    199200,
    210700,
    222400,
    234500,
    246800,
    259400,
    272300,
    285500,
    299000,
    312700,
    326800,
    341000,
    355600,
    370500,
    385600,
    401000,
    416600,
    432600,
    448800,
    465200,
    482000,
    499000,
    516300,
    533800,
    551600,
    569600,
    588000,
    606500,
    625400,
    644500,
    663800,
    683400,
    703300,
    723400,
    743800,
    764500,
    785400,
    806500,
    827900,
    849600,
    871500,
    893600,
    916000,
    938700,
    961600,
    984700,
    1008100,
    1031800,
    1055700,
    1079800,
    1104200,
    1128800,
    1153700,
    1178800,
    1204200,
    1229800,
    1255600,
    1281700,
    1308100,
    1334600,
    1361400,
    1388500,
    1415800,
    1443300,
    1471100,
    1499100,
    1527300,
}

function getRP(level)
    if level < #rp then
        return rp[level]
    else
        return math.floor(25 * (level ^ 2) + 23575 * level - 1023150)
    end
end
end)

Section("Skills", function()
SkillsMenu = RecoveryMenu:Tab("Skills")

SkillsMenu:Box("Skills")
SkillsMenu:Button("Max Current Skills", function()
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
    notify.info("Skills", "Skills should've been maximized")
end)

SkillsMenu:Button("Reset Skills", function()
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Collectibles", function()
CollectiblesMenu = RecoveryMenu:Tab("Collectibles")
CollectiblesMenu:Box("Los Santos Collectibles")
CollectiblesMenu:Button("Collect All Action Figures", function()
    for i = 0, 99 do
        stats.set_bool(MPX() .. "PROP_FIGURE_" .. i, true)
    end
end)
CollectiblesMenu:Button("Collect All Signal Jammers", function()
    for i = 0, 49 do
        stats.set_bool(MPX() .. "JAMMER_IDENTIFIED_" .. i, true)
    end
end)
CollectiblesMenu:Button("Collect All Playing Cards", function()
    for i = 0, 53 do
        stats.set_bool(MPX() .. "CH_CARD_ID_" .. i, true)
    end
end)
CollectiblesMenu:Button("Collect All Props", function()
    for i = 0, 9 do
        stats.set_bool(MPX() .. "PROP_HIDDEN_SOL_ID_" .. i, true)
    end
end)
CollectiblesMenu:Button("Collect All Movie Props", function()
    for i = 1, 10 do
        stats.set_int(MPX() .. "MOVIE_PROP_COLLECTED_" .. i, -1)
    end
end)
CollectiblesMenu:Button("Collect All LD Organics", function()
    for i = 0, 99 do
        stats.set_bool(MPX() .. "LD_ORGANIC_COLLECTED_" .. i, true)
    end
end)
CollectiblesMenu:Button("Collect Ghost Exposed", function()
    for i = 0, 9 do
        stats.set_bool(MPX() .. "GHOST_EXPOSED_" .. i, true)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Awards Unlocker", function()
AUM = RecoveryMenu:Tab("Awards Unlocker")
AUM:Columns(3)

AUM:Box("Awards")
AUM:Button("Victory", function()
    stats.set_int(MPX() .. "AWD_FM_DM_WINS", 50)
    stats.set_int(MPX() .. "AWD_FM_TDM_WINS", 50)
    stats.set_int(MPX() .. "AWD_FM_TDM_MVP", 50)
    stats.set_int(MPX() .. "AWD_RACES_WON", 50)
    stats.set_int(MPX() .. "AWD_FMWINAIRRACE", 25)
    stats.set_int(MPX() .. "AWD_FMWINSEARACE", 25)
    stats.set_int(MPX() .. "AWD_FM_GTA_RACES_WON", 50)
    stats.set_bool(MPX() .. "AWD_FMKILL3ANDWINGTARACE", true)
    stats.set_int(MPX() .. "AWD_FMRALLYWONDRIVE", 25)
    stats.set_int(MPX() .. "AWD_FMRALLYWONNAV", 25)
    stats.set_bool(MPX() .. "AWD_FMWINCUSTOMRACE", true)
    stats.set_int(MPX() .. "AWD_FMWINRACETOPOINTS", 25)
    stats.set_bool(MPX() .. "CL_RACE_MODDED_CAR", true)
    stats.set_int(MPX() .. "AWD_FM_RACE_LAST_FIRST", 25)
    stats.set_bool(MPX() .. "AWD_FMRACEWORLDRECHOLDER", true)
    stats.set_int(MPX() .. "AWD_FM_RACES_FASTEST_LAP", 50)
    stats.set_bool(MPX() .. "AWD_FMWINALLRACEMODES", true)
    stats.set_int(MPX() .. "AWD_FMHORDWAVESSURVIVE", 10)
    stats.set_int(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
    stats.set_int(MPX() .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
    stats.set_int(MPX() .. "AWD_NO_ARMWRESTLING_WINS", 25)
    stats.set_int(MPX() .. "MOST_ARM_WRESTLING_WINS", 25)
    stats.set_int(MPX() .. "AWD_WIN_AT_DARTS", 25)
    stats.set_int(MPX() .. "AWD_FM_GOLF_WON", 25)
    stats.set_int(MPX() .. "AWD_FM_TENNIS_WON", 25)
    stats.set_bool(MPX() .. "AWD_FM_TENNIS_5_SET_WINS", true)
    stats.set_bool(MPX() .. "AWD_FM_TENNIS_STASETWIN", true)
    stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_CT_WON", 25)
    stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_RT_WON", 25)
    stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_TG_WON", 25)
    stats.set_bool(MPX() .. "AWD_FM_SHOOTRANG_GRAN_WON", true)
    stats.set_bool(MPX() .. "AWD_FMWINEVERYGAMEMODE", true)
    stats.set_int(MPX() .. "AWD_WIN_CAPTURES", 50)
    stats.set_int(MPX() .. "AWD_WIN_CAPTURE_DONT_DYING", 25)
    stats.set_int(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
    stats.set_int(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
    stats.set_int(MPX() .. "AWD_KILL_TEAM_YOURSELF_LTS", 25)
    stats.set_int(MPX() .. "AIR_LAUNCHES_OVER_40M", 25)
    stats.set_int(MPX() .. "AWD_CARS_EXPORTED", 50)
    stats.set_int(MPX() .. "AWD_LESTERDELIVERVEHICLES", 25)
    stats.set_int(MPX() .. "TOTAL_RACES_WON", 500)
    stats.set_int(MPX() .. "TOTAL_RACES_LOST", 250)
    stats.set_int(MPX() .. "TOTAL_CUSTOM_RACES_WON", 500)
    stats.set_int(MPX() .. "TOTAL_DEATHMATCH_LOST", 250)
    stats.set_int(MPX() .. "TOTAL_DEATHMATCH_WON", 500)
    stats.set_int(MPX() .. "TOTAL_TDEATHMATCH_LOST", 250)
    stats.set_int(MPX() .. "TOTAL_TDEATHMATCH_WON", 500)
    stats.set_int(MPX() .. "SHOOTINGRANGE_WINS", 500)
    stats.set_int(MPX() .. "SHOOTINGRANGE_LOSSES", 250)
    stats.set_int(MPX() .. "TENNIS_MATCHES_WON", 500)
    stats.set_int(MPX() .. "TENNIS_MATCHES_LOST", 250)
    stats.set_int(MPX() .. "GOLF_WINS", 500)
    stats.set_int(MPX() .. "GOLF_LOSSES", 250)
    stats.set_int(MPX() .. "DARTS_TOTAL_WINS", 500)
    stats.set_int(MPX() .. "DARTS_TOTAL_MATCHES", 750)
    stats.set_int(MPX() .. "SHOOTINGRANGE_TOTAL_MATCH", 800)
    stats.set_int(MPX() .. "BJ_WINS", 500)
    stats.set_int(MPX() .. "BJ_LOST", 250)
    stats.set_int(MPX() .. "RACE_2_POINT_WINS", 500)
    stats.set_int(MPX() .. "RACE_2_POINT_LOST", 250)
    stats.set_int(MPX() .. "KILLS_PLAYERS", 3593)
    stats.set_int(MPX() .. "DEATHS_PLAYER", 1002)
    stats.set_int(MPX() .. "MISSIONS_CREATED", 500)
    stats.set_int(MPX() .. "LTS_CREATED", 500)
    stats.set_int(MPX() .. "FM_MISSION_LIKES", 1500)
end)

AUM:Button("General", function()
    stats.set_bool(MPX() .. "AWD_FM25DIFFERENTDM", true)
    stats.set_int(MPX() .. "CR_DIFFERENT_DM", 25)
    stats.set_bool(MPX() .. "AWD_FM25DIFFERENTRACES", true)
    stats.set_int(MPX() .. "CR_DIFFERENT_RACES", 25)
    stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_20M", 25)
    stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_50M", 25)
    stats.set_int(MPX() .. "AWD_FMBASEJMP", 25)
    stats.set_bool(MPX() .. "AWD_FMATTGANGHQ", true)
    stats.set_bool(MPX() .. "AWD_FM6DARTCHKOUT", true)
    stats.set_int(MPX() .. "AWD_FM_GOLF_BIRDIES", 25)
    stats.set_bool(MPX() .. "AWD_FM_GOLF_HOLE_IN_1", true)
    stats.set_int(MPX() .. "AWD_FM_TENNIS_ACE", 25)
    stats.set_int(MPX() .. "AWD_FMBBETWIN", 50000)
    stats.set_int(MPX() .. "AWD_LAPDANCES", 25)
    stats.set_int(MPX() .. "AWD_FMCRATEDROPS", 25)
    stats.set_bool(MPX() .. "AWD_FMPICKUPDLCCRATE1ST", true)
    stats.set_bool(MPX() .. "AWD_FM25DIFITEMSCLOTHES", true)
    stats.set_int(MPX() .. "AWD_NO_HAIRCUTS", 25)
    stats.set_bool(MPX() .. "AWD_BUY_EVERY_GUN", true)
    stats.set_bool(MPX() .. "AWD_DRIVELESTERCAR5MINS", true)
    stats.set_bool(MPX() .. "AWD_FMTATTOOALLBODYPARTS", true)
    stats.set_int(MPX() .. "AWD_DROPOFF_CAP_PACKAGES", 100)
    stats.set_int(MPX() .. "AWD_PICKUP_CAP_PACKAGES", 100)
    stats.set_int(MPX() .. "AWD_MENTALSTATE_TO_NORMAL", 50)
    stats.set_bool(MPX() .. "AWD_STORE_20_CAR_IN_GARAGES", true)
    stats.set_int(MPX() .. "AWD_TRADE_IN_YOUR_PROPERTY", 25)
    stats.set_bool(MPX() .. "AWD_DAILYOBJWEEKBONUS", true)
    stats.set_bool(MPX() .. "AWD_DAILYOBJMONTHBONUS", true)
    stats.set_int(MPX() .. "AWD_FM_CR_DM_MADE", 25)
    stats.set_int(MPX() .. "AWD_FM_CR_RACES_MADE", 25)
    stats.set_int(MPX() .. "AWD_FM_CR_PLAYED_BY_PEEP", 1598)
    stats.set_int(MPX() .. "AWD_FM_CR_MISSION_SCORE", 100)
    stats.set_bool(MPX() .. "CL_DRIVE_RALLY", true)
    stats.set_bool(MPX() .. "CL_PLAY_GTA_RACE", true)
    stats.set_bool(MPX() .. "CL_PLAY_BOAT_RACE", true)
    stats.set_bool(MPX() .. "CL_PLAY_FOOT_RACE", true)
    stats.set_bool(MPX() .. "CL_PLAY_TEAM_DM", true)
    stats.set_bool(MPX() .. "CL_PLAY_VEHICLE_DM", true)
    stats.set_bool(MPX() .. "CL_PLAY_MISSION_CONTACT", true)
    stats.set_bool(MPX() .. "CL_PLAY_A_PLAYLIST", true)
    stats.set_bool(MPX() .. "CL_PLAY_POINT_TO_POINT", true)
    stats.set_bool(MPX() .. "CL_PLAY_ONE_ON_ONE_DM", true)
    stats.set_bool(MPX() .. "CL_PLAY_ONE_ON_ONE_RACE", true)
    stats.set_bool(MPX() .. "CL_SURV_A_BOUNTY", true)
    stats.set_bool(MPX() .. "CL_SET_WANTED_LVL_ON_PLAY", true)
    stats.set_bool(MPX() .. "CL_GANG_BACKUP_GANGS", true)
    stats.set_bool(MPX() .. "CL_GANG_BACKUP_LOST", true)
    stats.set_bool(MPX() .. "CL_GANG_BACKUP_VAGOS", true)
    stats.set_bool(MPX() .. "CL_CALL_MERCENARIES", true)
    stats.set_bool(MPX() .. "CL_PHONE_MECH_DROP_CAR", true)
    stats.set_bool(MPX() .. "CL_GONE_OFF_RADAR", true)
    stats.set_bool(MPX() .. "CL_FILL_TITAN", true)
    stats.set_bool(MPX() .. "CL_MOD_CAR_USING_APP", true)
    stats.set_bool(MPX() .. "CL_MOD_CAR_USING_APP", true)
    stats.set_bool(MPX() .. "CL_BUY_INSURANCE", true)
    stats.set_bool(MPX() .. "CL_BUY_GARAGE", true)
    stats.set_bool(MPX() .. "CL_ENTER_FRIENDS_HOUSE", true)
    stats.set_bool(MPX() .. "CL_CALL_STRIPPER_HOUSE", true)
    stats.set_bool(MPX() .. "CL_CALL_FRIEND", true)
    stats.set_bool(MPX() .. "CL_SEND_FRIEND_REQUEST", true)
    stats.set_bool(MPX() .. "CL_W_WANTED_PLAYER_TV", true)
    stats.set_bool(MPX() .. "FM_INTRO_CUT_DONE", true)
    stats.set_bool(MPX() .. "FM_INTRO_MISS_DONE", true)
    stats.set_bool(MPX() .. "SHOOTINGRANGE_SEEN_TUT", true)
    stats.set_bool(MPX() .. "TENNIS_SEEN_TUTORIAL", true)
    stats.set_bool(MPX() .. "DARTS_SEEN_TUTORIAL", true)
    stats.set_bool(MPX() .. "ARMWRESTLING_SEEN_TUTORIAL", true)
    stats.set_bool(MPX() .. "HAS_WATCHED_BENNY_CUTSCE", true)
    stats.set_int(MPX() .. "NO_PHOTOS_TAKEN", 100)
    stats.set_int(MPX() .. "BOUNTSONU", 200)
    stats.set_int(MPX() .. "BOUNTPLACED", 500)
    stats.set_int(MPX() .. "BETAMOUNT", 500)
    stats.set_int(MPX() .. "CRARMWREST", 500)
    stats.set_int(MPX() .. "CRBASEJUMP", 500)
    stats.set_int(MPX() .. "CRDARTS", 500)
    stats.set_int(MPX() .. "CRDM", 500)
    stats.set_int(MPX() .. "CRGANGHIDE", 500)
    stats.set_int(MPX() .. "CRGOLF", 500)
    stats.set_int(MPX() .. "CRHORDE", 500)
    stats.set_int(MPX() .. "CRMISSION", 500)
    stats.set_int(MPX() .. "CRSHOOTRNG", 500)
    stats.set_int(MPX() .. "CRTENNIS", 500)
    stats.set_int(MPX() .. "NO_TIMES_CINEMA", 500)
end)

AUM:Button("Weapons", function()
    stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED2", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED3", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED4", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_ADDON_1_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_ADDON_2_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_ADDON_3_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_ADDON_4_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_FREE", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_FREE2", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE2", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE3", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE4", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_PURCHASED", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_PURCHASED2", -1)
    stats.set_int(MPX() .. "WEAPON_PICKUP_BITSET", -1)
    stats.set_int(MPX() .. "WEAPON_PICKUP_BITSET2", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED", -1)
    stats.set_int(MPX() .. "NO_WEAPONS_UNLOCK", -1)
    stats.set_int(MPX() .. "NO_WEAPON_MODS_UNLOCK", -1)
    stats.set_int(MPX() .. "NO_WEAPON_CLR_MOD_UNLOCK", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED2", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED3", -1)
    stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED4", -1)
    stats.set_int(MPX() .. "CHAR_KIT_1_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_2_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_3_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_4_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_5_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_6_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_7_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_8_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_9_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_10_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_11_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_12_FM_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE2", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE3", -1)
    stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE4", -1)
    stats.set_int(MPX() .. "FIREWORK_TYPE_1_WHITE", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_1_RED", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_1_BLUE", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_2_WHITE", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_2_RED", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_2_BLUE", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_3_WHITE", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_3_RED", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_3_BLUE", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_4_WHITE", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_4_RED", 1000)
    stats.set_int(MPX() .. "FIREWORK_TYPE_4_BLUE", 1000)
    stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH", -1)
    for i = 2, 19 do
        stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH" .. i, -1)
    end
    for j = 1, 19 do
        stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", -1)
    end
    for m = 1, 41 do
        stats.set_int(MPX() .. "CHAR_KIT_" .. m .. "_FM_UNLCK", -1)
    end
    for l = 2, 41 do
        stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE" .. l, -1)
    end
end)

AUM:Button("Crimes", function()
    stats.set_int(MPX() .. "AWD_FMTIME5STARWANTED", 120)
    stats.set_int(MPX() .. "AWD_5STAR_WANTED_AVOIDANCE", 50)
    stats.set_int(MPX() .. "AWD_FMSHOOTDOWNCOPHELI", 25)
    stats.set_int(MPX() .. "AWD_VEHICLES_JACKEDR", 500)
    stats.set_int(MPX() .. "AWD_SECURITY_CARS_ROBBED", 25)
    stats.set_int(MPX() .. "AWD_HOLD_UP_SHOPS", 20)
    stats.set_int(MPX() .. "AWD_ODISTRACTCOPSNOEATH", 25)
    stats.set_int(MPX() .. "AWD_ENEMYDRIVEBYKILLS", 100)
    stats.set_int(MPX() .. "CHAR_WANTED_LEVEL_TIME5STAR", 18000000)
    stats.set_int(MPX() .. "CARS_COPS_EXPLODED", 300)
    stats.set_int(MPX() .. "BIKES_EXPLODED", 100)
    stats.set_int(MPX() .. "BOATS_EXPLODED", 168)
    stats.set_int(MPX() .. "HELIS_EXPLODED", 98)
    stats.set_int(MPX() .. "PLANES_EXPLODED", 138)
    stats.set_int(MPX() .. "QUADBIKE_EXPLODED", 50)
    stats.set_int(MPX() .. "BICYCLE_EXPLODED", 48)
    stats.set_int(MPX() .. "SUBMARINE_EXPLODED", 28)
    stats.set_int(MPX() .. "TIRES_POPPED_BY_GUNSHOT", 500)
    stats.set_int(MPX() .. "NUMBER_CRASHES_CARS", 300)
    stats.set_int(MPX() .. "NUMBER_CRASHES_BIKES", 300)
    stats.set_int(MPX() .. "BAILED_FROM_VEHICLE", 300)
    stats.set_int(MPX() .. "NUMBER_CRASHES_QUADBIKES", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_COP_VEHICLE", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_CARS", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_BIKES", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_BOATS", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_HELIS", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_PLANES", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_QUADBIKES", 300)
    stats.set_int(MPX() .. "NUMBER_STOLEN_BICYCLES", 300)
    stats.set_int(MPX() .. "MC_CONTRIBUTION_POINTS", 1000)
    stats.set_int(MPX() .. "MEMBERSMARKEDFORDEATH", 700)
    stats.set_int(MPX() .. "MCKILLS", 500)
    stats.set_int(MPX() .. "MCDEATHS", 700)
    stats.set_int(MPX() .. "RIVALPRESIDENTKILLS", 700)
    stats.set_int(MPX() .. "RIVALCEOANDVIPKILLS", 700)
    stats.set_int(MPX() .. "CLUBHOUSECONTRACTSCOMPLETE", 700)
    stats.set_int(MPX() .. "CLUBHOUSECONTRACTEARNINGS", 32698547)
    stats.set_int(MPX() .. "CLUBCHALLENGESCOMPLETED", 700)
    stats.set_int(MPX() .. "MEMBERCHALLENGESCOMPLETED", 700)
    stats.set_int(MPX() .. "GHKILLS", 500)
    stats.set_int(MPX() .. "HORDELVL", 10)
    stats.set_int(MPX() .. "HORDKILLS", 500)
    stats.set_int(MPX() .. "UNIQUECRATES", 500)
    stats.set_int(MPX() .. "BJWINS", 500)
    stats.set_int(MPX() .. "HORDEWINS", 500)
    stats.set_int(MPX() .. "MCMWINS", 500)
    stats.set_int(MPX() .. "GANGHIDWINS", 500)
    stats.set_int(MPX() .. "KILLS", 800)
    stats.set_int(MPX() .. "HITS_PEDS_VEHICLES", 100)
    stats.set_int(MPX() .. "SHOTS", 1000)
    stats.set_int(MPX() .. "HEADSHOTS", 100)
    stats.set_int(MPX() .. "KILLS_ARMED", 650)
    stats.set_int(MPX() .. "SUCCESSFUL_COUNTERS", 100)
    stats.set_int(MPX() .. "KILLS_PLAYERS", 3593)
    stats.set_int(MPX() .. "DEATHS_PLAYER", 1002)
    stats.set_int(MPX() .. "KILLS_STEALTH", 100)
    stats.set_int(MPX() .. "KILLS_INNOCENTS", 500)
    stats.set_int(MPX() .. "KILLS_ENEMY_GANG_MEMBERS", 500)
    stats.set_int(MPX() .. "KILLS_FRIENDLY_GANG_MEMBERS", 500)
    stats.set_int(MPX() .. "KILLS_BY_OTHERS", 100)
    stats.set_int(MPX() .. "BIGGEST_VICTIM_KILLS", 500)
    stats.set_int(MPX() .. "ARCHENEMY_KILLS", 500)
    stats.set_int(MPX() .. "KILLS_COP", 4500)
    stats.set_int(MPX() .. "KILLS_SWAT", 500)
    stats.set_int(MPX() .. "STARS_ATTAINED", 5000)
    stats.set_int(MPX() .. "STARS_EVADED", 4000)
    stats.set_int(MPX() .. "VEHEXPORTED", 500)
    stats.set_int(MPX() .. "TOTAL_NO_SHOPS_HELD_UP", 100)
    stats.set_int(MPX() .. "CR_GANGATTACK_CITY", 1000)
    stats.set_int(MPX() .. "CR_GANGATTACK_COUNTRY", 1000)
    stats.set_int(MPX() .. "CR_GANGATTACK_LOST", 1000)
    stats.set_int(MPX() .. "CR_GANGATTACK_VAGOS", 1000)
    stats.set_int(MPX() .. "NO_NON_CONTRACT_RACE_WIN", 500)
    stats.set_int(MPX() .. "DIED_IN_DROWNING", 833)
    stats.set_int(MPX() .. "DIED_IN_DROWNINGINVEHICLE", 833)
    stats.set_int(MPX() .. "DIED_IN_EXPLOSION", 833)
    stats.set_int(MPX() .. "DIED_IN_FALL", 833)
    stats.set_int(MPX() .. "DIED_IN_FIRE", 833)
    stats.set_int(MPX() .. "DIED_IN_ROAD", 833)
    stats.set_int(MPX() .. "GRENADE_ENEMY_KILLS", 50)
    stats.set_int(MPX() .. "MICROSMG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "SMG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "ASLTSMG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "CRBNRIFLE_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "ADVRIFLE_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "MG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "CMBTMG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "ASLTMG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "RPG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "PISTOL_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "PLAYER_HEADSHOTS", 500)
    stats.set_int(MPX() .. "SAWNOFF_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "STKYBMB_ENEMY_KILLS", 50)
    stats.set_int(MPX() .. "UNARMED_ENEMY_KILLS", 50)
    stats.set_int(MPX() .. "SNIPERRFL_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "HVYSNIPER_ENEMY_KILLS", 500)
end)

AUM:Button("Vehicles", function()
    stats.set_int(MPX() .. "AWD_50_VEHICLES_BLOWNUP", 500)
    stats.set_int(MPX() .. "CARS_EXPLODED", 500)
    stats.set_int(MPX() .. "AWD_CAR_EXPORT", 100)
    stats.set_int(MPX() .. "AWD_FMDRIVEWITHOUTCRASH", 30)
    stats.set_int(MPX() .. "AWD_PASSENGERTIME", 4)
    stats.set_int(MPX() .. "AWD_TIME_IN_HELICOPTER", 4)
    stats.set_int(MPX() .. "AWD_VEHICLE_JUMP_OVER_40M", 25)
    stats.set_int(MPX() .. "MOST_FLIPS_IN_ONE_JUMP", 5)
    stats.set_int(MPX() .. "MOST_SPINS_IN_ONE_JUMP", 5)
    stats.set_int(MPX() .. "CHAR_FM_VEHICLE_1_UNLCK", -1)
    stats.set_int(MPX() .. "CHAR_FM_VEHICLE_2_UNLCK", -1)
    stats.set_int(MPX() .. "NO_CARS_REPAIR", 1000)
    stats.set_int(MPX() .. "VEHICLES_SPRAYED", 500)
    stats.set_int(MPX() .. "NUMBER_NEAR_MISS_NOCRASH", 500)
    stats.set_int(MPX() .. "USJS_FOUND", 50)
    stats.set_int(MPX() .. "USJS_COMPLETED", 50)
    stats.set_int(MPX() .. "USJS_TOTAL_COMPLETED", 50)
    stats.set_int(MPX() .. "CRDEADLINE", 5)
    stats.set_int(MPX() .. "FAVOUTFITBIKETIMECURRENT", 2069146067)
    stats.set_int(MPX() .. "FAVOUTFITBIKETIME1ALLTIME", 2069146067)
    stats.set_int(MPX() .. "FAVOUTFITBIKETYPECURRENT", 2069146067)
    stats.set_int(MPX() .. "FAVOUTFITBIKETYPEALLTIME", 2069146067)
    stats.set_int(MPX() .. "LONGEST_WHEELIE_DIST", 1000)
    stats.set_int(MPX() .. "RACES_WON", 50)
    stats.set_int(MPX() .. "COUNT_HOTRING_RACE", 20)
    stats.set_bool(MPX() .. "AWD_FMFURTHESTWHEELIE", true)
    stats.set_bool(MPX() .. "AWD_FMFULLYMODDEDCAR", true)
end)

AUM:Button("Combat", function()
    stats.set_int(MPX() .. "AWD_100_HEADSHOTS", 500)
    stats.set_int(MPX() .. "AWD_FMOVERALLKILLS", 1000)
    stats.set_int(MPX() .. "AWD_FMKILLBOUNTY", 25)
    stats.set_int(MPX() .. "AWD_FM_DM_3KILLSAMEGUY", 50)
    stats.set_int(MPX() .. "AWD_FM_DM_KILLSTREAK", 100)
    stats.set_int(MPX() .. "AWD_FM_DM_STOLENKILL", 50)
    stats.set_int(MPX() .. "AWD_FM_DM_TOTALKILLS", 500)
    stats.set_bool(MPX() .. "AWD_FMKILLSTREAKSDM", true)
    stats.set_bool(MPX() .. "AWD_FMMOSTKILLSGANGHIDE", true)
    stats.set_bool(MPX() .. "AWD_FMMOSTKILLSSURVIVE", true)
    stats.set_int(MPX() .. "AWD_FMREVENGEKILLSDM", 50)
    stats.set_int(MPX() .. "AWD_KILL_CARRIER_CAPTURE", 100)
    stats.set_int(MPX() .. "AWD_NIGHTVISION_KILLS", 100)
    stats.set_int(MPX() .. "AWD_KILL_PSYCHOPATHS", 100)
    stats.set_int(MPX() .. "AWD_TAKEDOWNSMUGPLANE", 50)
    stats.set_int(MPX() .. "AWD_100_KILLS_PISTOL", 500)
    stats.set_int(MPX() .. "AWD_100_KILLS_SMG", 500)
    stats.set_int(MPX() .. "AWD_100_KILLS_SHOTGUN", 500)
    stats.set_int(MPX() .. "ASLTRIFLE_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "AWD_100_KILLS_SNIPER", 500)
    stats.set_int(MPX() .. "MG_ENEMY_KILLS", 500)
    stats.set_int(MPX() .. "AWD_25_KILLS_STICKYBOMBS", 50)
    stats.set_int(MPX() .. "AWD_50_KILLS_GRENADES", 50)
    stats.set_int(MPX() .. "AWD_50_KILLS_ROCKETLAUNCH", 50)
    stats.set_int(MPX() .. "AWD_20_KILLS_MELEE", 50)
    stats.set_int(MPX() .. "AWD_CAR_BOMBS_ENEMY_KILLS", 25)
    stats.set_int(MPX() .. "MELEEKILLS", 700)
    stats.set_int(MPX() .. "HITS", 10000)
    stats.set_int(MPX() .. "DEATHS", 499)
    stats.set_int(MPX() .. "HIGHEST_SKITTLES", 900)
    stats.set_int(MPX() .. "NUMBER_NEAR_MISS", 1000)
end)
end)

Section("Apartment Heist Awards", function()

AUM:Box("Heist Awards")
AUM:Button("Apartment Heist", function()
    stats.set_int(MPX() .. "AWD_FINISH_HEISTS", 50)
    stats.set_int(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
    stats.set_int(MPX() .. "AWD_COMPLETE_HEIST_NOT_DIE", -1)
    stats.set_bool(MPX() .. "AWD_FINISH_HEIST_NO_DAMAGE", true)
    stats.set_int(MPX() .. "AWD_WIN_GOLD_MEDAL_HEISTS", 25)
    stats.set_int(MPX() .. "AWD_DO_HEIST_AS_MEMBER", 25)
    stats.set_int(MPX() .. "AWD_DO_HEIST_AS_THE_LEADER", 25)
    stats.set_bool(MPX() .. "AWD_SPLIT_HEIST_TAKE_EVENLY", true)
    stats.set_bool(MPX() .. "AWD_ACTIVATE_2_PERSON_KEY", true)
    stats.set_int(MPX() .. "AWD_CONTROL_CROWDS", 25)
    stats.set_bool(MPX() .. "AWD_ALL_ROLES_HEIST", true)
    stats.set_int(MPX() .. "HEIST_COMPLETION", 25)
    stats.set_int(MPX() .. "HEISTS_ORGANISED", -1)
    stats.set_int(MPX() .. "HEIST_START", -1)
    stats.set_int(MPX() .. "HEIST_END", -1)
    stats.set_int(MPX() .. "CUTSCENE_MID_PRISON", -1)
    stats.set_int(MPX() .. "CUTSCENE_MID_HUMANE", -1)
    stats.set_int(MPX() .. "CUTSCENE_MID_NARC", -1)
    stats.set_int(MPX() .. "CUTSCENE_MID_ORNATE", -1)
    stats.set_int(MPX() .. "CR_FLEECA_PREP_1", -1)
    stats.set_int(MPX() .. "CR_FLEECA_PREP_2", -1)
    stats.set_int(MPX() .. "CR_FLEECA_FINALE", -1)
    stats.set_int(MPX() .. "CR_PRISON_PLANE", -1)
    stats.set_int(MPX() .. "CR_PRISON_BUS", -1)
    stats.set_int(MPX() .. "CR_PRISON_STATION", -1)
    stats.set_int(MPX() .. "CR_PRISON_UNFINISHED_BIZ", -1)
    stats.set_int(MPX() .. "CR_PRISON_FINALE", -1)
    stats.set_int(MPX() .. "CR_HUMANE_KEY_CODES", -1)
    stats.set_int(MPX() .. "CR_HUMANE_ARMORDILLOS", -1)
    stats.set_int(MPX() .. "CR_HUMANE_EMP", -1)
    stats.set_int(MPX() .. "CR_HUMANE_VALKYRIE", -1)
    stats.set_int(MPX() .. "CR_HUMANE_FINALE", -1)
    stats.set_int(MPX() .. "CR_NARC_COKE", -1)
    stats.set_int(MPX() .. "CR_NARC_TRASH_TRUCK", -1)
    stats.set_int(MPX() .. "CR_NARC_BIKERS", -1)
    stats.set_int(MPX() .. "CR_NARC_WEED", -1)
    stats.set_int(MPX() .. "CR_NARC_STEAL_METH", -1)
    stats.set_int(MPX() .. "CR_NARC_FINALE", -1)
    stats.set_int(MPX() .. "CR_PACIFIC_TRUCKS", -1)
    stats.set_int(MPX() .. "CR_PACIFIC_WITSEC", -1)
    stats.set_int(MPX() .. "CR_PACIFIC_HACK", -1)
    stats.set_int(MPX() .. "CR_PACIFIC_BIKES", -1)
    stats.set_int(MPX() .. "CR_PACIFIC_CONVOY", -1)
    stats.set_int(MPX() .. "CR_PACIFIC_FINALE", -1)
    stats.set_int("MPPLY_HEIST_ACH_TRACKER", -1)
    stats.set_int("MPPLY_WIN_GOLD_MEDAL_HEISTS", 25)
    stats.set_bool("MPPLY_AWD_FLEECA_FIN", true)
    stats.set_bool("MPPLY_AWD_PRISON_FIN", true)
    stats.set_bool("MPPLY_AWD_HUMANE_FIN", true)
    stats.set_bool("MPPLY_AWD_SERIESA_FIN", true)
    stats.set_bool("MPPLY_AWD_PACIFIC_FIN", true)
    stats.set_bool("MPPLY_AWD_HST_ORDER", true)
    stats.set_bool("MPPLY_AWD_COMPLET_HEIST_MEM", true)
    stats.set_bool("MPPLY_AWD_COMPLET_HEIST_1STPER", true)
    stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", true)
    stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", true)
    stats.set_bool(MPX() .. "AWD_MATCHING_OUTFIT_HEIST", true)
    stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_PRINT", true)
    stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_HELP_0", true)
    stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_HELP_1", true)
    stats.set_bool(MPX() .. "HEIST_PRE_PLAN_DONE_HELP_0", true)
    stats.set_bool(MPX() .. "HEIST_CUTS_DONE_FINALE", true)
    stats.set_bool(MPX() .. "HEIST_IS_TUTORIAL", true)
    stats.set_bool(MPX() .. "HEIST_STRAND_INTRO_DONE", true)
    stats.set_bool(MPX() .. "HEIST_CUTS_DONE_ORNATE", true)
    stats.set_bool(MPX() .. "HEIST_CUTS_DONE_PRISON", true)
    stats.set_bool(MPX() .. "HEIST_CUTS_DONE_BIOLAB", true)
    stats.set_bool(MPX() .. "HEIST_CUTS_DONE_NARCOTIC", true)
    stats.set_bool(MPX() .. "HEIST_CUTS_DONE_TUTORIAL", true)
    stats.set_bool(MPX() .. "HEIST_AWARD_DONE_PREP", true)
    stats.set_bool(MPX() .. "HEIST_AWARD_BOUGHT_IN", true)
    stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
end)
end)

Section("Diamond Casino Heist Awards", function()

AUM:Button("Diamond Casino Heist", function()
    stats.set_int(MPX() .. "CAS_HEIST_NOTS", -1)
    stats.set_int(MPX() .. "CAS_HEIST_FLOW", -1)
    stats.set_int(MPX() .. "SIGNAL_JAMMERS_COLLECTED", 50)
    stats.set_int(MPX() .. "AWD_PREPARATION", 40)
    stats.set_int(MPX() .. "AWD_ASLEEPONJOB", 20)
    stats.set_int(MPX() .. "AWD_DAICASHCRAB", 100000)
    stats.set_int(MPX() .. "AWD_BIGBRO", 40)
    stats.set_int(MPX() .. "AWD_SHARPSHOOTER", 40)
    stats.set_int(MPX() .. "AWD_RACECHAMP", 40)
    stats.set_int(MPX() .. "AWD_BATSWORD", 1000000)
    stats.set_int(MPX() .. "AWD_COINPURSE", 950000)
    stats.set_int(MPX() .. "AWD_ASTROCHIMP", 3000000)
    stats.set_int(MPX() .. "AWD_MASTERFUL", 40000)
    stats.set_int(MPX() .. "H3_BOARD_DIALOGUE0", -1)
    stats.set_int(MPX() .. "H3_BOARD_DIALOGUE1", -1)
    stats.set_int(MPX() .. "H3_BOARD_DIALOGUE2", -1)
    stats.set_int(MPX() .. "H3_VEHICLESUSED", -1)
    stats.set_int(MPX() .. "H3_CR_STEALTH_1A", 100)
    stats.set_int(MPX() .. "H3_CR_STEALTH_2B_RAPP", 100)
    stats.set_int(MPX() .. "H3_CR_STEALTH_2C_SIDE", 100)
    stats.set_int(MPX() .. "H3_CR_STEALTH_3A", 100)
    stats.set_int(MPX() .. "H3_CR_STEALTH_4A", 100)
    stats.set_int(MPX() .. "H3_CR_STEALTH_5A", 100)
    stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_1A", 100)
    stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_2A", 100)
    stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_2B", 100)
    stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_3A", 100)
    stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_3B", 100)
    stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_4A", 100)
    stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_5A", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_1A", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_2A1", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_2A2", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_2BP", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_2C", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_3A", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_4A", 100)
    stats.set_int(MPX() .. "H3_CR_DIRECT_5A", 100)
    stats.set_int(MPX() .. "CR_ORDER", 100)
    stats.set_bool(MPX() .. "AWD_SCOPEOUT", true)
    stats.set_bool(MPX() .. "AWD_CREWEDUP", true)
    stats.set_bool(MPX() .. "AWD_MOVINGON", true)
    stats.set_bool(MPX() .. "AWD_PROMOCAMP", true)
    stats.set_bool(MPX() .. "AWD_GUNMAN", true)
    stats.set_bool(MPX() .. "AWD_SMASHNGRAB", true)
    stats.set_bool(MPX() .. "AWD_INPLAINSI", true)
    stats.set_bool(MPX() .. "AWD_UNDETECTED", true)
    stats.set_bool(MPX() .. "AWD_ALLROUND", true)
    stats.set_bool(MPX() .. "AWD_ELITETHEIF", true)
    stats.set_bool(MPX() .. "AWD_PRO", true)
    stats.set_bool(MPX() .. "AWD_SUPPORTACT", true)
    stats.set_bool(MPX() .. "AWD_SHAFTED", true)
    stats.set_bool(MPX() .. "AWD_COLLECTOR", true)
    stats.set_bool(MPX() .. "AWD_DEADEYE", true)
    stats.set_bool(MPX() .. "AWD_PISTOLSATDAWN", true)
    stats.set_bool(MPX() .. "AWD_TRAFFICAVOI", true)
    stats.set_bool(MPX() .. "AWD_CANTCATCHBRA", true)
    stats.set_bool(MPX() .. "AWD_WIZHARD", true)
    stats.set_bool(MPX() .. "AWD_APEESCAPE", true)
    stats.set_bool(MPX() .. "AWD_MONKEYKIND", true)
    stats.set_bool(MPX() .. "AWD_AQUAAPE", true)
    stats.set_bool(MPX() .. "AWD_KEEPFAITH", true)
    stats.set_bool(MPX() .. "AWD_TRUELOVE", true)
    stats.set_bool(MPX() .. "AWD_NEMESIS", true)
    stats.set_bool(MPX() .. "AWD_FRIENDZONED", true)
    stats.set_bool(MPX() .. "VCM_FLOW_CS_RSC_SEEN", true)
    stats.set_bool(MPX() .. "VCM_FLOW_CS_BWL_SEEN", true)
    stats.set_bool(MPX() .. "VCM_FLOW_CS_MTG_SEEN", true)
    stats.set_bool(MPX() .. "VCM_FLOW_CS_OIL_SEEN", true)
    stats.set_bool(MPX() .. "VCM_FLOW_CS_DEF_SEEN", true)
    stats.set_bool(MPX() .. "VCM_FLOW_CS_FIN_SEEN", true)
    stats.set_bool(MPX() .. "HELP_FURIA", true)
    stats.set_bool(MPX() .. "HELP_MINITAN", true)
    stats.set_bool(MPX() .. "HELP_YOSEMITE2", true)
    stats.set_bool(MPX() .. "HELP_ZHABA", true)
    stats.set_bool(MPX() .. "HELP_IMORGEN", true)
    stats.set_bool(MPX() .. "HELP_SULTAN2", true)
    stats.set_bool(MPX() .. "HELP_VAGRANT", true)
    stats.set_bool(MPX() .. "HELP_VSTR", true)
    stats.set_bool(MPX() .. "HELP_STRYDER", true)
    stats.set_bool(MPX() .. "HELP_SUGOI", true)
    stats.set_bool(MPX() .. "HELP_KANJO", true)
    stats.set_bool(MPX() .. "HELP_FORMULA", true)
    stats.set_bool(MPX() .. "HELP_FORMULA2", true)
    stats.set_bool(MPX() .. "HELP_JB7002", true)
    for i = 0, 4 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "CASINOHSTPSTAT_BOOL" .. i, j, true)
        end
    end
end)
end)

Section("Cayo Perico Heist Awards", function()

AUM:Button("Cayo Perico Heist", function()
    stats.set_bool(MPX() .. "AWD_INTELGATHER", true)
    stats.set_bool(MPX() .. "AWD_COMPOUNDINFILT", true)
    stats.set_bool(MPX() .. "AWD_LOOT_FINDER", true)
    stats.set_bool(MPX() .. "AWD_MAX_DISRUPT", true)
    stats.set_bool(MPX() .. "AWD_THE_ISLAND_HEIST", true)
    stats.set_bool(MPX() .. "AWD_GOING_ALONE", true)
    stats.set_bool(MPX() .. "AWD_TEAM_WORK", true)
    stats.set_bool(MPX() .. "AWD_MIXING_UP", true)
    stats.set_bool(MPX() .. "AWD_TEAM_WORK", true)
    stats.set_bool(MPX() .. "AWD_MIXING_UP", true)
    stats.set_bool(MPX() .. "AWD_PRO_THIEF", true)
    stats.set_bool(MPX() .. "AWD_CAT_BURGLAR", true)
    stats.set_bool(MPX() .. "AWD_ONE_OF_THEM", true)
    stats.set_bool(MPX() .. "AWD_GOLDEN_GUN", true)
    stats.set_bool(MPX() .. "AWD_ELITE_THIEF", true)
    stats.set_bool(MPX() .. "AWD_PROFESSIONAL", true)
    stats.set_bool(MPX() .. "AWD_HELPING_OUT", true)
    stats.set_bool(MPX() .. "AWD_COURIER", true)
    stats.set_bool(MPX() .. "AWD_PARTY_VIBES", true)
    stats.set_bool(MPX() .. "AWD_HELPING_HAND", true)
    stats.set_bool(MPX() .. "AWD_ELEVENELEVEN", true)
    stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_VETIR", true)
    stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_LONGFIN", true)
    stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_ANNIH", true)
    stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_ALKONOS", true)
    stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_PATROLB", true)
    stats.set_int(MPX() .. "AWD_LOSTANDFOUND", 500000)
    stats.set_int(MPX() .. "AWD_SUNSET", 1800000)
    stats.set_int(MPX() .. "AWD_TREASURE_HUNTER", 1000000)
    stats.set_int(MPX() .. "AWD_WRECK_DIVING", 1000000)
    stats.set_int(MPX() .. "AWD_KEINEMUSIK", 1800000)
    stats.set_int(MPX() .. "AWD_PALMS_TRAX", 1800000)
    stats.set_int(MPX() .. "AWD_MOODYMANN", 1800000)
    stats.set_int(MPX() .. "AWD_FILL_YOUR_BAGS", 1000000000)
    stats.set_int(MPX() .. "AWD_WELL_PREPARED", 80)
    stats.set_int(MPX() .. "H4_H4_DJ_MISSIONS", -1)
    stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
    stats.set_int(MPX() .. "H4_MISSIONS", -1)
    stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 100)
    for i = 0, 2 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "HISLANDPSTAT_BOOL" .. i, j, true)
        end
    end
end)
end)

Section("Doomsday Heist Awards", function()

AUM:Button("Doomsday Heist", function()
    stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", -1)
    stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", -229384)
    stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
    stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", -1)
    stats.set_int("MPPLY_GANGOPS_ALLINORDER", 100)
    stats.set_int("MPPLY_GANGOPS_LOYALTY", 100)
    stats.set_int("MPPLY_GANGOPS_CRIMMASMD", 100)
    stats.set_int("MPPLY_GANGOPS_LOYALTY2", 100)
    stats.set_int("MPPLY_GANGOPS_LOYALTY3", 100)
    stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", 100)
    stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", 100)
    stats.set_int("MPPLY_GANGOPS_SUPPORT", 100)
    stats.set_int(MPX() .. "CR_GANGOP_MORGUE", 10)
    stats.set_int(MPX() .. "CR_GANGOP_DELUXO", 10)
    stats.set_int(MPX() .. "CR_GANGOP_SERVERFARM", 10)
    stats.set_int(MPX() .. "CR_GANGOP_IAABASE_FIN", 10)
    stats.set_int(MPX() .. "CR_GANGOP_STEALOSPREY", 10)
    stats.set_int(MPX() .. "CR_GANGOP_FOUNDRY", 10)
    stats.set_int(MPX() .. "CR_GANGOP_RIOTVAN", 10)
    stats.set_int(MPX() .. "CR_GANGOP_SUBMARINECAR", 10)
    stats.set_int(MPX() .. "CR_GANGOP_SUBMARINE_FIN", 10)
    stats.set_int(MPX() .. "CR_GANGOP_PREDATOR", 10)
    stats.set_int(MPX() .. "CR_GANGOP_BMLAUNCHER", 10)
    stats.set_int(MPX() .. "CR_GANGOP_BCCUSTOM", 10)
    stats.set_int(MPX() .. "CR_GANGOP_STEALTHTANKS", 10)
    stats.set_int(MPX() .. "CR_GANGOP_SPYPLANE", 10)
    stats.set_int(MPX() .. "CR_GANGOP_FINALE", 10)
    stats.set_int(MPX() .. "CR_GANGOP_FINALE_P2", 10)
    stats.set_int(MPX() .. "CR_GANGOP_FINALE_P3", 10)
    stats.set_bool("MPPLY_AWD_GANGOPS_IAA", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_SUBMARINE", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_MISSILE", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_ALLINORDER", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY2", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY3", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD2", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD3", true)
    stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", true)
    for j = 0, 63 do
        stats.set_masked_bool(MPX() .. "GANGOPSPSTAT_BOOL0", j, true)
    end
    stats.set_masked_int(MPX() .. "DLCSMUGCHARPSTAT_INT260", 16, 8, 3)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 24, 8, 3)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 32, 8, 3)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 40, 8, 3)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 48, 8, 3)
end)
end)

Section("DLC Awards", function()

AUM:Box("DLC Awards")
AUM:Button("The Kortz Center Heist", function()
    stats.set_bool(MPX() .. "AWD_SCOPING", true)
    stats.set_int(MPX() .. "AWD_PREPPER", 20)
    stats.set_bool(MPX() .. "AWD_ADAPTABLE", true)
    stats.set_bool(MPX() .. "AWD_KORTZCENTERHEIST", true)
    stats.set_bool(MPX() .. "AWD_FINDSAWAY", true)
    stats.set_bool(MPX() .. "AWD_WHOSTHERE", true)
    stats.set_bool(MPX() .. "AWD_ELITETHIEF", true)
    stats.set_bool(MPX() .. "AWD_NOLIFER", true)
    stats.set_bool(MPX() .. "AWD_SOLITUDE", true)
    stats.set_bool(MPX() .. "AWD_COORDINATION", true)
    stats.set_bool(MPX() .. "AWD_FLEXIBLETHIEF", true)
    stats.set_int(MPX() .. "AWD_REPEATOFFENDER", 20)
    stats.set_int(MPX() .. "AWD_FULLBAGS", 5000000)
    stats.set_bool(MPX() .. "AWD_HIDDENINPLAINSIGHT", true)
    stats.set_int(MPX() .. "AWD_CURATOR", 5)
    stats.set_int(MPX() .. "AWD_LAPIDARY", 5)
    stats.set_bool(MPX() .. "AWD_PACIFIST", true)
    stats.set_bool(MPX() .. "AWD_PUTRIDPILFERING", true)
    stats.set_bool(MPX() .. "AWD_METEORITICS", true)
end)

AUM:Button("A Safehouse In The Hills", function()
    stats.set_bool(MPX() .. "AWD_NEGATIVEPRESS", true)
    stats.set_bool(MPX() .. "AWD_USESELFDRIVINGVEH", true)
    stats.set_bool(MPX() .. "AWD_LIONSDEN", true)
    stats.set_bool(MPX() .. "AWD_TAKEOUTLEADEXPLO", true)
    stats.set_bool(MPX() .. "AWD_SUBWAYTRAIN", true)
    stats.set_bool(MPX() .. "AWD_SUBWAYSTUNTJUMP", true)
    stats.set_bool(MPX() .. "AWD_TRASHCOLLECTORS", true)
    stats.set_bool(MPX() .. "AWD_ALLTRASHCOLLECTED", true)
    stats.set_bool(MPX() .. "AWD_FIBFINALE", true)
    stats.set_bool(MPX() .. "AWD_HELPER", true)
    stats.set_bool(MPX() .. "AWD_FIBFINALECHALLENGE", true)
    stats.set_bool(MPX() .. "AWD_MANSIONDEFEND", true)
    stats.set_bool(MPX() .. "AWD_DEFLOWMOTIONKILLS", true)
    stats.set_bool(MPX() .. "AWD_YOUVEMADEIT", true)
    stats.set_bool(MPX() .. "AWD_ANIMALLOVER", true)
    stats.set_bool(MPX() .. "AWD_MANSADVERSARYWIN", true)
    stats.set_bool(MPX() .. "AWD_ONTHECLOCK", true)
    stats.set_int(MPX() .. "AWD_TAXIDESTRUCTION", 20)
    stats.set_int(MPX() .. "AWD_YOGA", 50)
    stats.set_int(MPX() .. "AWD_JUICEDUP", 100)
    stats.set_int(MPX() .. "AWD_MANADVERSARYDEFUSE", 10)
    stats.set_int(MPX() .. "AWD_FIREFIGHTER", 20)
    stats.set_int(MPX() .. "AWD_ALPHAMAIL", 20)
    stats.set_int(MPX() .. "AWD_LOSSANTOSMETEOR", 20)
end)

AUM:Button("Agents of Sabotage", function()
    for i = 9542, 9546 do
        stats.set_packed_bool(i, true)
    end
    stats.set_packed_bool(9549, true)
    stats.set_packed_int(24903, 25)
    stats.set_packed_int(24904, 2)
    stats.set_int(MPX() .. "HACKER24_GEN_BS", 8160)
    stats.set_bool(MPX() .. "AWD_FINEART", true)
    stats.set_bool(MPX() .. "AWD_BRUTEFORCE", true)
    stats.set_bool(MPX() .. "AWD_PROJECTBREAK", true)
    stats.set_bool(MPX() .. "AWD_BLACKBOXFILE", true)
    stats.set_bool(MPX() .. "AWD_BONUSPOINTS", true)
    stats.set_int(MPX() .. "AWD_DARNELLBROSINC", 50)
    stats.set_int(MPX() .. "AWD_GET_READY", 50)
end)

AUM:Button("After Hours", function()
    stats.set_int(MPX() .. "AWD_DANCE_TO_SOLOMUN", 120)
    stats.set_int(MPX() .. "AWD_DANCE_TO_TALEOFUS", 120)
    stats.set_int(MPX() .. "AWD_DANCE_TO_DIXON", 120)
    stats.set_int(MPX() .. "AWD_DANCE_TO_BLKMAD", 120)
    stats.set_int(MPX() .. "AWD_CLUB_DRUNK", 200)
    stats.set_int(MPX() .. "NIGHTCLUB_VIP_APPEAR", 700)
    stats.set_int(MPX() .. "NIGHTCLUB_JOBS_DONE", 700)
    stats.set_int(MPX() .. "NIGHTCLUB_EARNINGS", 5721002)
    stats.set_int(MPX() .. "HUB_SALES_COMPLETED", 1001)
    stats.set_int(MPX() .. "HUB_EARNINGS", 20721002)
    stats.set_int(MPX() .. "DANCE_COMBO_DURATION_MINS", 3600000)
    stats.set_int(MPX() .. "NIGHTCLUB_PLAYER_APPEAR", 100)
    stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_SOLD", 784672)
    stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_MADE", 507822)
    stats.set_int(MPX() .. "DANCEPERFECTOWNCLUB", 120)
    stats.set_int(MPX() .. "NUMUNIQUEPLYSINCLUB", 120)
    stats.set_int(MPX() .. "DANCETODIFFDJS", 4)
    stats.set_int(MPX() .. "NIGHTCLUB_HOTSPOT_TIME_MS", 3600000)
    stats.set_int(MPX() .. "NIGHTCLUB_CONT_TOTAL", 20)
    stats.set_int(MPX() .. "NIGHTCLUB_CONT_MISSION", -1)
    stats.set_int(MPX() .. "CLUB_CONTRABAND_MISSION", 1000)
    stats.set_int(MPX() .. "HUB_CONTRABAND_MISSION", 1000)
    stats.set_bool(MPX() .. "AWD_CLUB_HOTSPOT", true)
    stats.set_bool(MPX() .. "AWD_CLUB_CLUBBER", true)
    stats.set_bool(MPX() .. "AWD_CLUB_COORD", true)
    for j = 0, 63 do
        stats.set_masked_bool(MPX() .. "BUSINESSBATPSTAT_BOOL0", j, true)
        stats.set_masked_bool(MPX() .. "BUSINESSBATPSTAT_BOOL1", j, true)
    end
    if stats.get_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 0, 8) < 20 then
        stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 0, 8, 20)
    end
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 8, 8, 50)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 16, 8, 100)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 24, 8, 20)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 32, 8, 80)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 40, 8, 60)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 48, 8, 40)
    stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 56, 8, 10)
end)

AUM:Button("Arena War", function()
    stats.set_int(MPX() .. "ARN_BS_TRINKET_TICKERS", -1)
    stats.set_int(MPX() .. "ARN_BS_TRINKET_SAVED", -1)
    stats.set_int(MPX() .. "AWD_WATCH_YOUR_STEP", 50)
    stats.set_int(MPX() .. "AWD_TOWER_OFFENSE", 50)
    stats.set_int(MPX() .. "AWD_READY_FOR_WAR", 50)
    stats.set_int(MPX() .. "AWD_THROUGH_A_LENS", 50)
    stats.set_int(MPX() .. "AWD_SPINNER", 50)
    stats.set_int(MPX() .. "AWD_YOUMEANBOOBYTRAPS", 50)
    stats.set_int(MPX() .. "AWD_MASTER_BANDITO", 50)
    stats.set_int(MPX() .. "AWD_SITTING_DUCK", 50)
    stats.set_int(MPX() .. "AWD_CROWDPARTICIPATION", 50)
    stats.set_int(MPX() .. "AWD_KILL_OR_BE_KILLED", 50)
    stats.set_int(MPX() .. "AWD_MASSIVE_SHUNT", 50)
    stats.set_int(MPX() .. "AWD_YOURE_OUTTA_HERE", 200)
    stats.set_int(MPX() .. "AWD_WEVE_GOT_ONE", 50)
    stats.set_int(MPX() .. "AWD_ARENA_WAGEWORKER", 1000000)
    stats.set_int(MPX() .. "AWD_TIME_SERVED", 1000)
    stats.set_int(MPX() .. "AWD_TOP_SCORE", 55000)
    stats.set_int(MPX() .. "AWD_CAREER_WINNER", 1000)
    stats.set_int(MPX() .. "ARENAWARS_SP", 0)
    stats.set_int(MPX() .. "ARENAWARS_SKILL_LEVEL", 20)
    stats.set_int(MPX() .. "ARENAWARS_SP_LIFETIME", 100)
    stats.set_int(MPX() .. "ARENAWARS_AP", 0)
    stats.set_int(MPX() .. "ARENAWARS_AP_TIER", 1000)
    stats.set_int(MPX() .. "ARENAWARS_AP_LIFETIME", 5055000)
    stats.set_int(MPX() .. "ARENAWARS_CARRER_UNLK", -1)
    stats.set_int(MPX() .. "ARN_W_THEME_SCIFI", 1000)
    stats.set_int(MPX() .. "ARN_W_THEME_APOC", 1000)
    stats.set_int(MPX() .. "ARN_W_THEME_CONS", 1000)
    stats.set_int(MPX() .. "ARN_W_PASS_THE_BOMB", 1000)
    stats.set_int(MPX() .. "ARN_W_DETONATION", 1000)
    stats.set_int(MPX() .. "ARN_W_ARCADE_RACE", 1000)
    stats.set_int(MPX() .. "ARN_W_CTF", 1000)
    stats.set_int(MPX() .. "ARN_W_TAG_TEAM", 1000)
    stats.set_int(MPX() .. "ARN_W_DESTR_DERBY", 1000)
    stats.set_int(MPX() .. "ARN_W_CARNAGE", 1000)
    stats.set_int(MPX() .. "ARN_W_MONSTER_JAM", 1000)
    stats.set_int(MPX() .. "ARN_W_GAMES_MASTERS", 1000)
    stats.set_int(MPX() .. "ARN_L_PASS_THE_BOMB", 500)
    stats.set_int(MPX() .. "ARN_L_DETONATION", 500)
    stats.set_int(MPX() .. "ARN_L_ARCADE_RACE", 500)
    stats.set_int(MPX() .. "ARN_L_CTF", 500)
    stats.set_int(MPX() .. "ARN_L_TAG_TEAM", 500)
    stats.set_int(MPX() .. "ARN_L_DESTR_DERBY", 500)
    stats.set_int(MPX() .. "ARN_L_CARNAGE", 500)
    stats.set_int(MPX() .. "ARN_L_MONSTER_JAM", 500)
    stats.set_int(MPX() .. "ARN_L_GAMES_MASTERS", 500)
    stats.set_int(MPX() .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
    stats.set_int(MPX() .. "ARN_SPECTATOR_KILLS", 1000)
    stats.set_int(MPX() .. "ARN_LIFETIME_KILLS", 1000)
    stats.set_int(MPX() .. "ARN_LIFETIME_DEATHS", 500)
    stats.set_int(MPX() .. "ARENAWARS_CARRER_WINS", 1000)
    stats.set_int(MPX() .. "ARENAWARS_CARRER_WINT", 1000)
    stats.set_int(MPX() .. "ARENAWARS_MATCHES_PLYD", 1000)
    stats.set_int(MPX() .. "ARENAWARS_MATCHES_PLYDT", 1000)
    stats.set_int(MPX() .. "ARN_SPEC_BOX_TIME_MS", 86400000)
    stats.set_int(MPX() .. "ARN_SPECTATOR_DRONE", 1000)
    stats.set_int(MPX() .. "ARN_SPECTATOR_CAMS", 1000)
    stats.set_int(MPX() .. "ARN_SMOKE", 1000)
    stats.set_int(MPX() .. "ARN_DRINK", 1000)
    stats.set_int(MPX() .. "ARN_VEH_MONSTER", 1000)
    stats.set_int(MPX() .. "ARN_VEH_MONSTER", 1000)
    stats.set_int(MPX() .. "ARN_VEH_MONSTER", 1000)
    stats.set_int(MPX() .. "ARN_VEH_CERBERUS", 1000)
    stats.set_int(MPX() .. "ARN_VEH_CERBERUS2", 1000)
    stats.set_int(MPX() .. "ARN_VEH_CERBERUS3", 1000)
    stats.set_int(MPX() .. "ARN_VEH_BRUISER", 1000)
    stats.set_int(MPX() .. "ARN_VEH_BRUISER2", 1000)
    stats.set_int(MPX() .. "ARN_VEH_BRUISER3", 1000)
    stats.set_int(MPX() .. "ARN_VEH_SLAMVAN4", 1000)
    stats.set_int(MPX() .. "ARN_VEH_SLAMVAN5", 1000)
    stats.set_int(MPX() .. "ARN_VEH_SLAMVAN6", 1000)
    stats.set_int(MPX() .. "ARN_VEH_BRUTUS", 1000)
    stats.set_int(MPX() .. "ARN_VEH_BRUTUS2", 1000)
    stats.set_int(MPX() .. "ARN_VEH_BRUTUS3", 1000)
    stats.set_int(MPX() .. "ARN_VEH_SCARAB", 1000)
    stats.set_int(MPX() .. "ARN_VEH_SCARAB2", 1000)
    stats.set_int(MPX() .. "ARN_VEH_SCARAB3", 1000)
    stats.set_int(MPX() .. "ARN_VEH_DOMINATOR4", 1000)
    stats.set_int(MPX() .. "ARN_VEH_DOMINATOR5", 1000)
    stats.set_int(MPX() .. "ARN_VEH_DOMINATOR6", 1000)
    stats.set_int(MPX() .. "ARN_VEH_IMPALER2", 1000)
    stats.set_int(MPX() .. "ARN_VEH_IMPALER3", 1000)
    stats.set_int(MPX() .. "ARN_VEH_IMPALER4", 1000)
    stats.set_int(MPX() .. "ARN_VEH_ISSI4", 1000)
    stats.set_int(MPX() .. "ARN_VEH_ISSI5", 1000)
    stats.set_int(MPX() .. "ARN_VEH_ISSI", 61000)
    stats.set_int(MPX() .. "ARN_VEH_IMPERATOR", 1000)
    stats.set_int(MPX() .. "ARN_VEH_IMPERATOR2", 1000)
    stats.set_int(MPX() .. "ARN_VEH_IMPERATOR3", 1000)
    stats.set_int(MPX() .. "ARN_VEH_ZR380", 1000)
    stats.set_int(MPX() .. "ARN_VEH_ZR3802", 1000)
    stats.set_int(MPX() .. "ARN_VEH_ZR3803", 1000)
    stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE", 1000)
    stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE2", 1000)
    stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE3", 1000)
    stats.set_bool(MPX() .. "AWD_BEGINNER", true)
    stats.set_bool(MPX() .. "AWD_FIELD_FILLER", true)
    stats.set_bool(MPX() .. "AWD_ARMCHAIR_RACER", true)
    stats.set_bool(MPX() .. "AWD_LEARNER", true)
    stats.set_bool(MPX() .. "AWD_SUNDAY_DRIVER", true)
    stats.set_bool(MPX() .. "AWD_THE_ROOKIE", true)
    stats.set_bool(MPX() .. "AWD_BUMP_AND_RUN", true)
    stats.set_bool(MPX() .. "AWD_GEAR_HEAD", true)
    stats.set_bool(MPX() .. "AWD_DOOR_SLAMMER", true)
    stats.set_bool(MPX() .. "AWD_HOT_LAP", true)
    stats.set_bool(MPX() .. "AWD_ARENA_AMATEUR", true)
    stats.set_bool(MPX() .. "AWD_PAINT_TRADER", true)
    stats.set_bool(MPX() .. "AWD_SHUNTER", true)
    stats.set_bool(MPX() .. "AWD_JOCK", true)
    stats.set_bool(MPX() .. "AWD_WARRIOR", true)
    stats.set_bool(MPX() .. "AWD_T_BONE", true)
    stats.set_bool(MPX() .. "AWD_MAYHEM", true)
    stats.set_bool(MPX() .. "AWD_WRECKER", true)
    stats.set_bool(MPX() .. "AWD_CRASH_COURSE", true)
    stats.set_bool(MPX() .. "AWD_ARENA_LEGEND", true)
    stats.set_bool(MPX() .. "AWD_PEGASUS", true)
    stats.set_bool(MPX() .. "AWD_UNSTOPPABLE", true)
    stats.set_bool(MPX() .. "AWD_CONTACT_SPORT", true)
    stats.set_masked_int(MPX() .. "ARENAWARSPSTAT_INT", 35, 8, 1)
    for i = 0, 8 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "ARENAWARSPSTAT_BOOL" .. i, j, true)
        end
    end
end)

AUM:Button("Diamond Casino n Resort", function()
    stats.set_int(MPX() .. "AWD_ODD_JOBS", 50)
    stats.set_int(MPX() .. "VCM_FLOW_PROGRESS", -1)
    stats.set_int(MPX() .. "VCM_STORY_PROGRESS", 5)
    stats.set_bool(MPX() .. "AWD_FIRST_TIME1", true)
    stats.set_bool(MPX() .. "AWD_FIRST_TIME2", true)
    stats.set_bool(MPX() .. "AWD_FIRST_TIME3", true)
    stats.set_bool(MPX() .. "AWD_FIRST_TIME4", true)
    stats.set_bool(MPX() .. "AWD_FIRST_TIME5", true)
    stats.set_bool(MPX() .. "AWD_FIRST_TIME6", true)
    stats.set_bool(MPX() .. "AWD_ALL_IN_ORDER", true)
    stats.set_bool(MPX() .. "AWD_SUPPORTING_ROLE", true)
    stats.set_bool(MPX() .. "AWD_LEADER", true)
    stats.set_bool(MPX() .. "AWD_SURVIVALIST", true)
    Paragon = stats.get_bool(MPX() .. "CAS_VEHICLE_REWARD")
    if Paragon == true then
        stats.set_bool(MPX() .. "CAS_VEHICLE_REWARD", true)
    else
        stats.set_bool(MPX() .. "CAS_VEHICLE_REWARD", false)
    end
    for i = 0, 6 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "CASINOPSTAT_BOOL" .. i, j, true)
        end
    end
end)

AUM:Button("Arcade", function()
    stats.set_int(MPX() .. "AWD_PREPARATION", 50)
    stats.set_int(MPX() .. "AWD_ASLEEPONJOB", 20)
    stats.set_int(MPX() .. "AWD_DAICASHCRAB", 100000)
    stats.set_int(MPX() .. "AWD_BIGBRO", 40)
    stats.set_int(MPX() .. "AWD_SHARPSHOOTER", 40)
    stats.set_int(MPX() .. "AWD_RACECHAMP", 40)
    stats.set_int(MPX() .. "AWD_BATSWORD", 1000000)
    stats.set_int(MPX() .. "AWD_COINPURSE", 950000)
    stats.set_int(MPX() .. "AWD_ASTROCHIMP", 3000000)
    stats.set_int(MPX() .. "AWD_MASTERFUL", 40000)
    stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_0", 50)
    stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_1", 50)
    stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_2", 50)
    stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_3", 50)
    stats.set_int(MPX() .. "CH_ARC_CAB_CLAW_TROPHY", -1)
    stats.set_int(MPX() .. "CH_ARC_CAB_LOVE_TROPHY", -1)
    stats.set_int(MPX() .. "IAP_MAX_MOON_DIST", 2147483647)
    stats.set_int(MPX() .. "SCGW_INITIALS_0", 69644)
    stats.set_int(MPX() .. "SCGW_INITIALS_1", 50333)
    stats.set_int(MPX() .. "SCGW_INITIALS_2", 63512)
    stats.set_int(MPX() .. "SCGW_INITIALS_3", 46136)
    stats.set_int(MPX() .. "SCGW_INITIALS_4", 21638)
    stats.set_int(MPX() .. "SCGW_INITIALS_5", 2133)
    stats.set_int(MPX() .. "SCGW_INITIALS_6", 1215)
    stats.set_int(MPX() .. "SCGW_INITIALS_7", 2444)
    stats.set_int(MPX() .. "SCGW_INITIALS_8", 38023)
    stats.set_int(MPX() .. "SCGW_INITIALS_9", 2233)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_0", 0)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_1", 64)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_2", 8457)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_3", 91275)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_4", 53260)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_5", 78663)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_6", 25103)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_7", 102401)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_8", 12672)
    stats.set_int(MPX() .. "FOOTAGE_INITIALS_9", 74380)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_0", 284544)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_1", 275758)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_2", 100000)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_3", 90000)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_4", 80000)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_5", 70000)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_6", 60000)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_7", 50000)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_8", 40000)
    stats.set_int(MPX() .. "FOOTAGE_SCORE_9", 30000)
    for i = 0, 9 do
        stats.set_int(MPX() .. "IAP_INITIALS_" .. i, 50)
        stats.set_int(MPX() .. "IAP_SCORE_" .. i, 50)
        stats.set_int(MPX() .. "IAP_SCORE_" .. i, 50)
        stats.set_int(MPX() .. "SCGW_SCORE_" .. i, 50)
        stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_" .. i, 69644)
        stats.set_int(MPX() .. "DG_DEFENDER_SCORE_" .. i, 50)
        stats.set_int(MPX() .. "DG_MONKEY_INITIALS_" .. i, 69644)
        stats.set_int(MPX() .. "DG_MONKEY_SCORE_" .. i, 50)
        stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_" .. i, 69644)
        stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_" .. i, 50)
        stats.set_int(MPX() .. "GGSM_INITIALS_" .. i, 69644)
        stats.set_int(MPX() .. "GGSM_SCORE_" .. i, 50)
        stats.set_int(MPX() .. "TWR_INITIALS_" .. i, 69644)
        stats.set_int(MPX() .. "TWR_SCORE_" .. i, 50)
    end
    stats.set_bool(MPX() .. "AWD_SCOPEOUT", true)
    stats.set_bool(MPX() .. "AWD_CREWEDUP", true)
    stats.set_bool(MPX() .. "AWD_MOVINGON", true)
    stats.set_bool(MPX() .. "AWD_PROMOCAMP", true)
    stats.set_bool(MPX() .. "AWD_GUNMAN", true)
    stats.set_bool(MPX() .. "AWD_SMASHNGRAB", true)
    stats.set_bool(MPX() .. "AWD_INPLAINSI", true)
    stats.set_bool(MPX() .. "AWD_UNDETECTED", true)
    stats.set_bool(MPX() .. "AWD_ALLROUND", true)
    stats.set_bool(MPX() .. "AWD_ELITETHEIF", true)
    stats.set_bool(MPX() .. "AWD_PRO", true)
    stats.set_bool(MPX() .. "AWD_SUPPORTACT", true)
    stats.set_bool(MPX() .. "AWD_SHAFTED", true)
    stats.set_bool(MPX() .. "AWD_COLLECTOR", true)
    stats.set_bool(MPX() .. "AWD_DEADEYE", true)
    stats.set_bool(MPX() .. "AWD_PISTOLSATDAWN", true)
    stats.set_bool(MPX() .. "AWD_TRAFFICAVOI", true)
    stats.set_bool(MPX() .. "AWD_CANTCATCHBRA", true)
    stats.set_bool(MPX() .. "AWD_WIZHARD", true)
    stats.set_bool(MPX() .. "AWD_APEESCAP", true)
    stats.set_bool(MPX() .. "AWD_MONKEYKIND", true)
    stats.set_bool(MPX() .. "AWD_AQUAAPE", true)
    stats.set_bool(MPX() .. "AWD_KEEPFAITH", true)
    stats.set_bool(MPX() .. "AWD_TRUELOVE", true)
    stats.set_bool(MPX() .. "AWD_NEMESIS", true)
    stats.set_bool(MPX() .. "AWD_FRIENDZONED", true)
    stats.set_bool(MPX() .. "IAP_CHALLENGE_0", true)
    stats.set_bool(MPX() .. "IAP_CHALLENGE_1", true)
    stats.set_bool(MPX() .. "IAP_CHALLENGE_2", true)
    stats.set_bool(MPX() .. "IAP_CHALLENGE_3", true)
    stats.set_bool(MPX() .. "IAP_CHALLENGE_4", true)
    stats.set_bool(MPX() .. "IAP_GOLD_TANK", true)
    stats.set_bool(MPX() .. "SCGW_WON_NO_DEATHS", true)
    for i = 0, 4 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "CASINOHSTPSTAT_BOOL" .. i, j, true)
        end
    end
    for i = 0, 6 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "CASINOPSTAT_BOOL" .. i, j, true)
        end
    end
end)

AUM:Button("LS Summer Special", function()
    stats.set_bool(MPX() .. "AWD_KINGOFQUB3D", true)
    stats.set_bool(MPX() .. "AWD_QUBISM", true)
    stats.set_bool(MPX() .. "AWD_QUIBITS", true)
    stats.set_bool(MPX() .. "AWD_GODOFQUB3D", true)
    stats.set_bool(MPX() .. "AWD_ELEVENELEVEN", true)
    stats.set_bool(MPX() .. "AWD_GOFOR11TH", true)
    stats.set_masked_int(MPX() .. "SU20PSTAT_INT", 35, 8, 1)
    for i = 0, 1 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "SU20PSTAT_BOOL" .. i, j, true)
            stats.set_masked_bool(MPX() .. "SU20TATTOOSTAT_BOOL" .. i, j, true)
        end
    end
end)

AUM:Button("LS Tuners", function()
    stats.set_int(MPX() .. "AWD_CAR_CLUB_MEM", 100)
    stats.set_int(MPX() .. "AWD_SPRINTRACER", 50)
    stats.set_int(MPX() .. "AWD_STREETRACER", 50)
    stats.set_int(MPX() .. "AWD_PURSUITRACER", 50)
    stats.set_int(MPX() .. "AWD_TEST_CAR", 240)
    stats.set_int(MPX() .. "AWD_AUTO_SHOP", 50)
    stats.set_int(MPX() .. "AWD_GROUNDWORK", 40)
    stats.set_int(MPX() .. "AWD_CAR_EXPORT", 100)
    stats.set_int(MPX() .. "AWD_ROBBERY_CONTRACT", 100)
    stats.set_int(MPX() .. "AWD_FACES_OF_DEATH", 100)
    stats.set_bool(MPX() .. "AWD_CAR_CLUB", true)
    stats.set_bool(MPX() .. "AWD_PRO_CAR_EXPORT", true)
    stats.set_bool(MPX() .. "AWD_UNION_DEPOSITORY", true)
    stats.set_bool(MPX() .. "AWD_MILITARY_CONVOY", true)
    stats.set_bool(MPX() .. "AWD_FLEECA_BANK", true)
    stats.set_bool(MPX() .. "AWD_FREIGHT_TRAIN", true)
    stats.set_bool(MPX() .. "AWD_BOLINGBROKE_ASS", true)
    stats.set_bool(MPX() .. "AWD_IAA_RAID", true)
    stats.set_bool(MPX() .. "AWD_METH_JOB", true)
    stats.set_bool(MPX() .. "AWD_BUNKER_RAID", true)
    stats.set_bool(MPX() .. "AWD_STRAIGHT_TO_VIDEO", true)
    stats.set_bool(MPX() .. "AWD_MONKEY_C_MONKEY_DO", true)
    stats.set_bool(MPX() .. "AWD_TRAINED_TO_KILL", true)
    stats.set_bool(MPX() .. "AWD_DIRECTOR", true)
    for i = 0, 8 do
        for j = 0, 63 do
            stats.set_masked_bool(MPX() .. "TUNERPSTAT_BOOL" .. i, j, true)
        end
    end
end)

AUM:Button("Contract", function()
    stats.set_int(MPX() .. "AWD_CONTRACTOR", 50)
    stats.set_int(MPX() .. "AWD_COLD_CALLER", 50)
    stats.set_int(MPX() .. "AWD_PRODUCER", 60)
    stats.set_int(MPX() .. "FIXERTELEPHONEHITSCOMPL", 10)
    stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", 10)
    stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", -1)
    stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
    stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
    stats.set_int(MPX() .. "FIXER_STORY_BS", -1)
    stats.set_int(MPX() .. "FIXER_STORY_STRAND", -1)
    stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
    stats.set_int(MPX() .. "FIXER_COUNT", 510)
    stats.set_int(MPX() .. "FIXER_SC_VEH_RECOVERED", 85)
    stats.set_int(MPX() .. "FIXER_SC_VAL_RECOVERED", 85)
    stats.set_int(MPX() .. "FIXER_SC_GANG_TERMINATED", 85)
    stats.set_int(MPX() .. "FIXER_SC_VIP_RESCUED", 85)
    stats.set_int(MPX() .. "FIXER_SC_ASSETS_PROTECTED", 85)
    stats.set_int(MPX() .. "FIXER_SC_EQ_DESTROYED", 85)
    stats.set_int(MPX() .. "FIXER_EARNINGS", 19734860)
    stats.set_bool(MPX() .. "AWD_TEEING_OFF", true)
    stats.set_bool(MPX() .. "AWD_PARTY_NIGHT", true)
    stats.set_bool(MPX() .. "AWD_BILLIONAIRE_GAMES", true)
    stats.set_bool(MPX() .. "AWD_HOOD_PASS", true)
    stats.set_bool(MPX() .. "AWD_STUDIO_TOUR", true)
    stats.set_bool(MPX() .. "AWD_DONT_MESS_DRE", true)
    stats.set_bool(MPX() .. "AWD_BACKUP", true)
    stats.set_bool(MPX() .. "AWD_SHORTFRANK_1", true)
    stats.set_bool(MPX() .. "AWD_SHORTFRANK_2", true)
    stats.set_bool(MPX() .. "AWD_SHORTFRANK_3", true)
    stats.set_bool(MPX() .. "AWD_CONTR_KILLER", true)
    stats.set_bool(MPX() .. "AWD_DOGS_BEST_FRIEND", true)
    stats.set_bool(MPX() .. "AWD_MUSIC_STUDIO", true)
    stats.set_bool(MPX() .. "AWD_SHORTLAMAR_1", true)
    stats.set_bool(MPX() .. "AWD_SHORTLAMAR_2", true)
    stats.set_bool(MPX() .. "AWD_SHORTLAMAR_3", true)
    stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_0", true)
    stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_1", true)
    stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_2", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_SETUP", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_STRAND", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY_2", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY_F", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL_2", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL_F", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD_2", true)
    stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD_F", true)
    for j = 0, 63 do
        stats.set_masked_bool(MPX() .. "FIXERPSTAT_BOOL0", j, true)
        stats.set_masked_bool(MPX() .. "FIXERPSTAT_BOOL1", j, true)
        stats.set_masked_bool(MPX() .. "FIXERTATTOOSTAT_BOOL0", j, true)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Account Unlocker", function()
FAUT = RecoveryMenu:Tab("Account Unlocker")
FAUTMain = FAUT:Tab("Main")

FAUTMain:Box("Weapons")
FAUTMain:Custom(function()
    if ImGui.Button("Unlock WM 29 Pistol") then
        script.run_in_callback(function()
            if transactions.run_service("CATEGORY_WEAPON", "NET_SHOP_ACTION_SPEND", "WP_WT_PISTOLXM3_t0_v0", 0) then
                notify.info("WM29", "WM29 is now Unlocked Change Session To Apply Changes.")
            end
        end)
    end

    if ImGui.Button("Unlock The Shocker") then
        script.run_in_callback(function()
            if transactions.run_service("CATEGORY_WEAPON", "NET_SHOP_ACTION_SPEND", "WP_WT_STUNROD_t1_v1", 0) then
                notify.info("The Shocker", "The Shocker is now Unlocked Change Session To Apply Changes.")
            end
        end)
    end

    if ImGui.Button("Unlock The Snowball Launcher") then
        script.run_in_callback(function()
            if transactions.run_service("CATEGORY_WEAPON", "NET_SHOP_ACTION_SPEND", "WP_WT_SNOWLAUNCHER_t0_v0", 0) then
                notify.info("Snowball Launcher", "Snowball Launcher is now Unlocked Change Session To Apply Changes.")
            end
        end)
    end
end)

local current_objectives_global = 2359296 --("am_challenges")
local weekly_objectives_global = 2732247 --("am_challenges")
local objectives_state_global = 1574746 --("am_challenges")

FAUTMain:Box("Challenges")
FAUTMain:Custom(function()
    if ImGui.Button("Complete All Daily & Weekly Challenges") then
        script.run_in_callback(function()
            for i = 0, 2 do --Unlock all daily rewards.
                local objective =
                    ScriptGlobal(current_objectives_global + (1 + (0 * 5574)) + 681 + 4248 + (1 + (i * 3))):get_int()
                ScriptGlobal(objectives_state_global + 1 + (1 + (i * 1))):set_int(objective)
            end
            ScriptGlobal(objectives_state_global):set_int(1)
            ScriptGlobal(weekly_objectives_global + (1 + (0 * 6)) + 1):set_int(ScriptGlobal(weekly_objectives_global + (1 + (0 * 6)) + 2):get_int()) --Unlock Weekly Objective
            notify.info("Challenges", "All Daily And Weekly Challenges Are Now Completed.")
        end)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Achievements", function()
AcMenu = FAUT:Tab("Achievements")

Acv0 = false
AG = 4525223 + 1 --("CHEAT_ACHIEVE")

AcMenu:Columns(3)
AcMenu:Box("All Achievements", 0)
AcMenu:Custom(function()
    local label = "Unlock All Achievements"
    local text_width = ImGui.CalcTextSize(label)
    local avail = ImGui.GetContentRegionAvail()
    ImGui.SetCursorPosX(ImGui.GetCursorPosX() + math.max(0, (avail - (text_width + 24)) / 2))
    if ImGui.Button(label) then
        script.run_in_callback(function()
            for i = 0, 77 do
                script.yield(200)
                ScriptGlobal(AG):set_int(i)
                if i == 77 then
                    notify.info("Achievements", "Unlocked 77 Achievements")
                end
            end
        end)
    end
end)
end)

Section("Achievements One By One", function()

AcMenu:Box("One By One (1-26)")
AcMenu:Button("Welcome to Los Santos", function()
    ScriptGlobal(AG):set_int(1)
end)
AcMenu:Button("A Friendship Resurrected", function()
    ScriptGlobal(AG):set_int(2)
end)
AcMenu:Button("A Fair Day's Pay", function()
    ScriptGlobal(AG):set_int(3)
end)
AcMenu:Button("The Moment of Truth", function()
    ScriptGlobal(AG):set_int(4)
end)
AcMenu:Button("To Live or Die in Los Santos", function()
    ScriptGlobal(AG):set_int(5)
end)
AcMenu:Button("Diamond Hard", function()
    ScriptGlobal(AG):set_int(6)
end)
AcMenu:Button("Subversive", function()
    ScriptGlobal(AG):set_int(7)
end)
AcMenu:Button("Blitzed", function()
    ScriptGlobal(AG):set_int(8)
end)
AcMenu:Button("Small Town, Big Job", function()
    ScriptGlobal(AG):set_int(9)
end)
AcMenu:Button("The Government Gimps", function()
    ScriptGlobal(AG):set_int(10)
end)
AcMenu:Button("The Big One!", function()
    ScriptGlobal(AG):set_int(11)
end)
AcMenu:Button("Solid Gold, Baby!", function()
    ScriptGlobal(AG):set_int(12)
end)
AcMenu:Button("Career Criminal", function()
    ScriptGlobal(AG):set_int(13)
end)
AcMenu:Button("San Andreas Sightseer", function()
    ScriptGlobal(AG):set_int(14)
end)
AcMenu:Button("All's Fare in Love and War", function()
    ScriptGlobal(AG):set_int(15)
end)
AcMenu:Button("TP Industries Arms Race", function()
    ScriptGlobal(AG):set_int(16)
end)
AcMenu:Button("Multi-Disciplined", function()
    ScriptGlobal(AG):set_int(17)
end)
AcMenu:Button("From Beyond the Stars", function()
    ScriptGlobal(AG):set_int(18)
end)
AcMenu:Button("A Mystery, Solved", function()
    ScriptGlobal(AG):set_int(19)
end)
AcMenu:Button("Waste Management", function()
    ScriptGlobal(AG):set_int(20)
end)
AcMenu:Button("Red Mist", function()
    ScriptGlobal(AG):set_int(21)
end)
AcMenu:Button("Show Off", function()
    ScriptGlobal(AG):set_int(22)
end)
AcMenu:Button("Kifflom!", function()
    ScriptGlobal(AG):set_int(23)
end)
AcMenu:Button("Three Man Army", function()
    ScriptGlobal(AG):set_int(24)
end)
AcMenu:Button("Out of Your Depth", function()
    ScriptGlobal(AG):set_int(25)
end)
AcMenu:Button("Altruist Acolyte", function()
    ScriptGlobal(AG):set_int(26)
end)
AcMenu:Box("One By One (27-52)")
AcMenu:Button("A Lot of Cheddar", function()
    ScriptGlobal(AG):set_int(27)
end)
AcMenu:Button("Trading Pure Alpha", function()
    ScriptGlobal(AG):set_int(28)
end)
AcMenu:Button("Pimp My Sidearm", function()
    ScriptGlobal(AG):set_int(29)
end)
AcMenu:Button("Wanted: Alive Or Alive", function()
    ScriptGlobal(AG):set_int(30)
end)
AcMenu:Button("Los Santos Customs", function()
    ScriptGlobal(AG):set_int(31)
end)
AcMenu:Button("Close Shave", function()
    ScriptGlobal(AG):set_int(32)
end)
AcMenu:Button("Off the Plane", function()
    ScriptGlobal(AG):set_int(33)
end)
AcMenu:Button("Three-Bit Gangster", function()
    ScriptGlobal(AG):set_int(34)
end)
AcMenu:Button("Making Moves", function()
    ScriptGlobal(AG):set_int(35)
end)
AcMenu:Button("Above the Law", function()
    ScriptGlobal(AG):set_int(36)
end)
AcMenu:Button("Numero Uno", function()
    ScriptGlobal(AG):set_int(37)
end)
AcMenu:Button("The Midnight Club", function()
    ScriptGlobal(AG):set_int(38)
end)
AcMenu:Button("Unnatural Selection", function()
    ScriptGlobal(AG):set_int(39)
end)
AcMenu:Button("Backseat Driver", function()
    ScriptGlobal(AG):set_int(40)
end)
AcMenu:Button("Run Like The Wind", function()
    ScriptGlobal(AG):set_int(41)
end)
AcMenu:Button("Clean Sweep", function()
    ScriptGlobal(AG):set_int(42)
end)
AcMenu:Button("Decorated", function()
    ScriptGlobal(AG):set_int(43)
end)
AcMenu:Button("Stick Up Kid", function()
    ScriptGlobal(AG):set_int(44)
end)
AcMenu:Button("Enjoy Your Stay", function()
    ScriptGlobal(AG):set_int(45)
end)
AcMenu:Button("Crew Cut", function()
    ScriptGlobal(AG):set_int(46)
end)
AcMenu:Button("Full Refund", function()
    ScriptGlobal(AG):set_int(47)
end)
AcMenu:Button("Dialling Digits", function()
    ScriptGlobal(AG):set_int(48)
end)
AcMenu:Button("American Dream", function()
    ScriptGlobal(AG):set_int(49)
end)
AcMenu:Button("A New Perspective", function()
    ScriptGlobal(AG):set_int(50)
end)
AcMenu:Button("Be Prepared", function()
    ScriptGlobal(AG):set_int(51)
end)
AcMenu:Button("In the Name of Science", function()
    ScriptGlobal(AG):set_int(52)
end)
AcMenu:Box("One By One (53-77)")
AcMenu:Button("Dead Presidents", function()
    ScriptGlobal(AG):set_int(53)
end)
AcMenu:Button("Parole Day", function()
    ScriptGlobal(AG):set_int(54)
end)
AcMenu:Button("Shot Caller", function()
    ScriptGlobal(AG):set_int(55)
end)
AcMenu:Button("Four Way", function()
    ScriptGlobal(AG):set_int(56)
end)
AcMenu:Button("Live a Little", function()
    ScriptGlobal(AG):set_int(57)
end)
AcMenu:Button("Can't Touch This", function()
    ScriptGlobal(AG):set_int(58)
end)
AcMenu:Button("Mastermind", function()
    ScriptGlobal(AG):set_int(59)
end)
AcMenu:Button("Vinewood Visionary", function()
    ScriptGlobal(AG):set_int(60)
end)
AcMenu:Button("Majestic", function()
    ScriptGlobal(AG):set_int(61)
end)
AcMenu:Button("Humans of Los Santos", function()
    ScriptGlobal(AG):set_int(62)
end)
AcMenu:Button("First Time Director", function()
    ScriptGlobal(AG):set_int(63)
end)
AcMenu:Button("Animal Lover", function()
    ScriptGlobal(AG):set_int(64)
end)
AcMenu:Button("Ensemble Piece", function()
    ScriptGlobal(AG):set_int(65)
end)
AcMenu:Button("Cult Movie", function()
    ScriptGlobal(AG):set_int(66)
end)
AcMenu:Button("Location Scout", function()
    ScriptGlobal(AG):set_int(67)
end)
AcMenu:Button("Method Actor", function()
    ScriptGlobal(AG):set_int(68)
end)
AcMenu:Button("Cryptozoologist", function()
    ScriptGlobal(AG):set_int(69)
end)
AcMenu:Button("Getting Started", function()
    ScriptGlobal(AG):set_int(70)
end)
AcMenu:Button("The Data Breaches", function()
    ScriptGlobal(AG):set_int(71)
end)
AcMenu:Button("The Bogdan Problem", function()
    ScriptGlobal(AG):set_int(72)
end)
AcMenu:Button("The Doomsday Scenario", function()
    ScriptGlobal(AG):set_int(73)
end)
AcMenu:Button("A World Worth Saving", function()
    ScriptGlobal(AG):set_int(74)
end)
AcMenu:Button("Orbital Obliteration", function()
    ScriptGlobal(AG):set_int(75)
end)
AcMenu:Button("Elitist", function()
    ScriptGlobal(AG):set_int(76)
end)
AcMenu:Button("Masterminds", function()
    ScriptGlobal(AG):set_int(77)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("LSCM Unlocker", function()
LSCMUnlockeRecoveryMenu = RecoveryMenu:Tab("LSCM Unlocker")

LSCMUnlockeRecoveryMenu:Box("Unlocks")
LSCMUnlockeRecoveryMenu:Button("Unlock All Rep Lvl 1000", function()
    for i = LSCM_REP_START, LSCM_REP_END do
        ScriptGlobal(i):set_float(100000.0)
    end
    notify.info("LSCM", "LVL 1000 Activated Just Sit In The Test Drive Vehicle And Enter LSCM Track To See The Changes.")
end)

LSCMUnlockeRecoveryMenu:Button("LSCM Prize Ride Unlock", function()
    stats.set_bool(MPX() .. "CARMEET_PV_CHLLGE_CMPLT", true)
    stats.set_bool(MPX() .. "CARMEET_PV_CLMED", false)
    notify.info("LSCM", "Your Prize Car Is Now Unlocked.")
end)

LSCMUnlockeRecoveryMenu:Button("Unlock Trade Prices for Headlights", function()
    stats_set_packed_bools(24980, 24991, true)
    notify.info("LSCM", "Trade Prices For Headlights Are Now Unlocked.")
end)
end)

Section("LSCM Tutorial", function()
LSCMUnlockeRecoveryMenu:Box("Tutorial")

LSCMUnlockeRecoveryMenu:Text("Buy a membership, activate, sit in")
LSCMUnlockeRecoveryMenu:Text("a test car and go to the track")
LSCMUnlockeRecoveryMenu:Text("If your level is not 1, then activate")
LSCMUnlockeRecoveryMenu:Text("and buy something in the LSCM store")
LSCMUnlockeRecoveryMenu:Text("If you've used LS Tuner awards unlock")
LSCMUnlockeRecoveryMenu:Text("before, all unlocks will be temporary only")
LSCMUnlockeRecoveryMenu:Text("--- Manual Online Override ---")
LSCMUnlockeRecoveryMenu:Text("To manually set/bypass the online state,")
LSCMUnlockeRecoveryMenu:Text("toggle 'Bypass Online Check' in Settings.")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Heists", function()
HeistsDataEditorMenu = Menu:Tab("Heists"):RequireOnline()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Apartment", function()
local ApartmentDataEditorMenu = HeistsDataEditorMenu:Tab("Apartment")
ApartmentDataEditorMenu:Box("Information", 0) -- full width, above everything else
ApartmentDataEditorMenu:Text("Max Payout 3.000.000$ (+ optional 12.000.000$)")
ApartmentDataEditorMenu:Text("Min Cooldown ≈ 0-5 minutes (+ optional > 6 hours)")

-- Stat values the game writes when each heist has all its preps done.
-- depth = HEIST_MISSION_DEPTH_LV_2 .. LV_7
local apartmentHeists = {
    { name = "The Fleeca Job", rcont = -1072870761, cosmetic = 25, depth = { 1, -1, -1, -1, -1, -1 } },
    { name = "The Prison Break", rcont = 979654579, cosmetic = 22, depth = { 0, 0, 1, -1, -1, -1 } },
    { name = "The Humane Labs Raid", rcont = -1096986654, cosmetic = 23, depth = { 0, 1, 2, 2, -1, -1 } },
    { name = "Series A Funding", rcont = 164435858, cosmetic = 24, depth = { 0, 0, 1, 2, -1, -1 } },
    { name = "The Pacific Standard Job", rcont = -231973569, cosmetic = 21, depth = { 1, 2, 2, 2, -1, -1 } },
}
local apartmentHeistNames = {}
for i, heist in ipairs(apartmentHeists) do
    apartmentHeistNames[i] = heist.name
end
local apartmentHeistIndex = 0

ApartmentDataEditorMenu:Box("Preps")
ApartmentDataEditorMenu:Custom(function()
    ImGui.Text("Heist:")
    apartmentHeistIndex = ImGui.Combo("##ApartmentHeist", apartmentHeistIndex, apartmentHeistNames, #apartmentHeistNames)
end)
ApartmentDataEditorMenu:Button("Apply & Complete Preps", function()
    local heist = apartmentHeists[apartmentHeistIndex + 1]
    local mpx = MPX()
    stats.set_int(mpx .. "BITSET_HEIST_VS_MISSIONS", -17809409)
    -- Only filled in when the game has not set them itself yet.
    if stats.get_int(mpx .. "HEIST_LEADER_APART_ID") == 0 then
        stats.set_int(mpx .. "HEIST_LEADER_APART_ID", 67108864)
    end
    if stats.get_int(mpx .. "HEIST_SESSION_ID_MACADDR") == 0 then
        stats.set_int(mpx .. "HEIST_SESSION_ID_MACADDR", 183381814)
    end
    stats.set_int(mpx .. "HEIST_MISSION_DEPTH_LV_0", -1)
    for i, value in ipairs(heist.depth) do
        stats.set_int(mpx .. "HEIST_MISSION_DEPTH_LV_" .. (i + 1), value)
    end
    stats.set_int(mpx .. "HEIST_MISSION_RCONT_ID_0", heist.rcont)
    stats.set_int(mpx .. "HEIST_TOTAL_REWARD_COSMETIC", heist.cosmetic)
    stats.set_int(mpx .. "HEIST_PLANNING_STAGE", -1)
    notify.info("Apartment Heist", heist.name .. ": preps should've been completed")
end)
ApartmentDataEditorMenu:Box("Solo Launch")
local soloLaunchToggle = ApartmentDataEditorMenu:Toggle("Solo Launch")
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if not soloLaunchToggle:get_value() then
            script.yield(500)
            return
        end
        if not network.is_session_started() or scripts.is_active("maintransition") then
            script.yield(500)
            return
        end
        if scripts.is_active(FMMCL) then
            local idx = ScriptLocal(FMMCL, HGGs1):get_int()
            if idx ~= nil and idx > 0 then
                ScriptLocal(FMMCL, HGGs2):set_int(1)
                ScriptGlobal(HEIST_SOLO_LAUNCH_BASE + 4 + 1 + (idx * 95) + 75):set_int(1)
            end
        end
        ScriptGlobal(HGLs1):set_int(1)
        ScriptGlobal(4718592 + 3775 + 1):set_int(1)
        ScriptGlobal(HGLs4):set_int(0)
        ScriptGlobal(HGLs2):set_int(1)
        ScriptGlobal(HGLs3):set_int(1)
        script.yield(500)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)
ApartmentDataEditorMenu:Box("Misc")
ApartmentDataEditorMenu:Button("Bypass Fleeca Hack", function()
    if scripts.is_active(FMC) then ScriptLocal(FMC, AFHl):set_int(7) end
    notify.info("Apartment Heist", "Hacking process should've been skipped")
end)
ApartmentDataEditorMenu:Button("Bypass Fleeca Drill", function()
    if scripts.is_active(FMC) then ScriptLocal(FMC, AFDl):set_float(100.0) end
    notify.info("Apartment Heist", "Drilling process should've been skipped")
end)
ApartmentDataEditorMenu:Button("Bypass Pacific Hack", function()
    if scripts.is_active(FMC) then ScriptLocal(FMC, AFPl):set_int(9) end
    notify.info("Apartment Heist", "Hacking process should've been skipped")
end)
ApartmentDataEditorMenu:Button("Skip Checkpoint", function()
    if scripts.is_active(FMC) then ScriptLocal(FMC, AHSo):set_int(bit.bor((scripts.is_active(FMC) and ScriptLocal(FMC, AHSo):get_int() or 0), bit.lshift(1, 17))) end
    notify.info("Apartment Heist", "Checkpoint should've been skipped")
end)
ApartmentDataEditorMenu:Button("Unlock All Jobs", function()
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0", tunables.get_int("ROOT_ID_HASH_THE_FLECCA_JOB"))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1", tunables.get_int("ROOT_ID_HASH_THE_PRISON_BREAK"))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2", tunables.get_int("ROOT_ID_HASH_THE_HUMANE_LABS_RAID"))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3", tunables.get_int("ROOT_ID_HASH_SERIES_A_FUNDING"))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4", tunables.get_int("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB"))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4_L", 5)
    notify.info("Apartment Heist", "All jobs should've been unlocked. Don't forget to restart the game")
end)
ApartmentDataEditorMenu:Button("Skip Cutscene", SkipCutscene)
ApartmentDataEditorMenu:Button("Force Ready", function()
    script.run_in_callback(function()
        network.force_script_host(util.joaat(FMC))
        script.yield(1000)
        for i = 0, 3 do
            ScriptGlobal(AFRg + 1 + (i * 468) + 270):set_int(6)
        end
        notify.info("Apartment Heist", "Everyone should've been forced ready")
    end)
end)
ApartmentDataEditorMenu:Button("Instant Finish", function()
    script.run_in_callback(function()
        if not scripts.is_active(FMC) then
            notify.info("Apartment Heist", "Start the finale first!")
            return
        end
        network.force_script_host(util.joaat(FMC))
        script.yield(500)
        if scripts.is_active(FMC) then ScriptLocal(FMC, AIFl2):set_int(5) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, AIFl1 + 1232 + 1):set_int(999999) end
        local bits = (scripts.is_active(FMC) and ScriptLocal(FMC, AIFl1 + 1):get_int() or 0)
        bits = bit.bor(bits, bit.lshift(1, 9), bit.lshift(1, 16))
        if scripts.is_active(FMC) then ScriptLocal(FMC, AIFl1 + 1):set_int(bits) end
        notify.info("Apartment Heist", "Heist finished. Wait for load!")
    end)
end)
ApartmentDataEditorMenu:Text("Note: After Clicking Unlock All Heists, restart the game")

ApartmentDataEditorMenu:Box("12mil Bonus")
ApartmentDataEditorMenu:Text(
    "Works only for you. Allows you to get 12 millions bonus for The Pacific Standard Job on hard difficulty.\nEnable before starting the heist. Has a cooldown."
)

local apartmentBonus = ApartmentDataEditorMenu:Toggle("12mil Bonus")
local previousState = false

script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            return
        end
        local currentState = apartmentBonus:get_value()
        if currentState ~= previousState then
            stats.set_int("MPPLY_HEISTFLOWORDERPROGRESS", currentState and 268435455 or 134217727)
            stats.set_bool("MPPLY_AWD_HST_ORDER", (not currentState) and true or false)
            stats.set_int("MPPLY_HEISTTEAMPROGRESSBITSET", currentState and 268435455 or 134217727)
            stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", (not currentState) and true or false)
            stats.set_int("MPPLY_HEISTNODEATHPROGREITSET", currentState and 268435455 or 134217727)
            stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", (not currentState) and true or false)
            notify.info("12mil Bonus", tostring(currentState and "Bonus should've been applied. Don't forget about difficulty"
                    or "Bonus should've been unapplied"))
            previousState = currentState
        end
        script.yield(100)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

ApartmentDataEditorMenu:Box("Session")
ApartmentDataEditorMenu:Button("Kill Cooldown", function()
    ScriptGlobal(ACDg + 1 + (PLAYER.PLAYER_ID() * 77) + 76):set_int(-1)
    notify.info("Apartment Heist", "Cooldown should've been killed")
end)
ApartmentDataEditorMenu:Button("Change Session", function()
    changeSession(8)
end)

ApartmentDataEditorMenu:Box("Team Lives")
local livesValueApartment = ApartmentDataEditorMenu:InputInt("Lives")
livesValueApartment:set_value(3)
ApartmentDataEditorMenu:Button("Set Lives", function()
    local v = livesValueApartment:get_value()
    if v < 1 then
        notify.info("Apartment Heist", "Lives must be at least 1!")
    else
        if scripts.is_active(FMC) then ScriptLocal(FMC, AHLIVESL):set_int(v) end
        notify.info("Apartment Heist", "Team lives set to " .. v)
    end
end)

ApartmentDataEditorMenu:Box("Cuts")
ApartmentDataEditorMenu:Button("3mil Payout", function()
    local perPlayer, key = SN_ApartmentMaxCut(false)
    if perPlayer then
        local isFleeca = (key == 1328892776)
        SN_ApplyApartmentCuts(perPlayer, perPlayer, perPlayer, perPlayer, isFleeca)
        notify.info("Apartment Heist", "Cuts should've been applied")
    else
        notify.info("Apartment Heist", "Unknown heist/difficulty")
    end
end)
local apartCut1 = ApartmentDataEditorMenu:InputInt("Player 1")
local apartCut2 = ApartmentDataEditorMenu:InputInt("Player 2")
local apartCut3 = ApartmentDataEditorMenu:InputInt("Player 3")
local apartCut4 = ApartmentDataEditorMenu:InputInt("Player 4")
ApartmentDataEditorMenu:Button("Apply Cuts", function()
    local heistType = 0
    if scripts.is_active(FMMCL) then
        heistType = ScriptLocal(FMMCL, HGGs1):get_int()
    end
    local key = ScriptGlobal(ACDg + (PLAYER.PLAYER_ID() * 77) + 24 + 2):get_int()
    local isFleeca = (heistType == 1328892776) or (key == 1328892776)
    SN_ApplyApartmentCuts(apartCut1:get_value(), apartCut2:get_value(), apartCut3:get_value(), apartCut4:get_value(), isFleeca)
    notify.info("Apartment Heist", "Cuts should've been applied")
end)
ApartmentDataEditorMenu:Button("Read Cuts", function()
    local b1 = ScriptGlobal(ACg1):get_int()
    local b2 = ScriptGlobal(ACg2):get_int()
    local b3 = ScriptGlobal(ACg3):get_int()
    local b4 = ScriptGlobal(ACg4):get_int()
    local a1 = ScriptGlobal(ACg5):get_int()
    local a2 = ScriptGlobal(ACg6):get_int()
    local a3 = ScriptGlobal(ACg7):get_int()
    local a4 = ScriptGlobal(ACg8):get_int()
    notify.info("Apartment Heist", "Board: " .. b1 .. "/" .. b2 .. "/" .. b3 .. "/" .. b4 .. " Actual: " .. a1 .. "/" .. a2 .. "/" .. a3 .. "/" .. a4)
end)
ApartmentDataEditorMenu:Box("Board Limits")
ApartmentDataEditorMenu:Text("Raise before Apply Cuts for over-100% cuts. Reset after the heist.")
local boardCeiling = ApartmentDataEditorMenu:InputInt("Ceiling")
boardCeiling:set_value(3000000)
local boardCap = ApartmentDataEditorMenu:InputInt("Max Cut %")
boardCap:set_value(70)
ApartmentDataEditorMenu:Button("Apply Custom Limits", function()
    tunables.set_int("HEIST_PLANNING_SANITY_CEILING", boardCeiling:get_value())
    tunables.set_int("MAX_HEIST_CUT_AMOUNT", boardCap:get_value())
    notify.info("Apartment Heist", "Ceiling: " .. boardCeiling:get_value() .. " Cap: " .. boardCap:get_value())
end)
ApartmentDataEditorMenu:Button("Raise Board Limits", function()
    tunables.set_int("HEIST_PLANNING_SANITY_CEILING", 10000000)
    tunables.set_int("MAX_HEIST_CUT_AMOUNT", 100)
    notify.info("Apartment Heist", "Board limits should've been raised")
end)
ApartmentDataEditorMenu:Button("Reset Board Limits", function()
    tunables.set_int("HEIST_PLANNING_SANITY_CEILING", 3000000)
    tunables.set_int("MAX_HEIST_CUT_AMOUNT", 70)
    notify.info("Apartment Heist", "Board limits should've been reset")
end)
ApartmentDataEditorMenu:Button("Read Board Limits", function()
    local ceiling = tunables.get_int("HEIST_PLANNING_SANITY_CEILING")
    local cap = tunables.get_int("MAX_HEIST_CUT_AMOUNT")
    notify.info("Apartment Heist", "Ceiling: " .. ceiling .. " Cap: " .. cap)
end)
ApartmentDataEditorMenu:Box("Cut Presets", 2) -- right column, under Board Limits
ApartmentDataEditorMenu:Button("All - 0%", function()
    apartCut1:set_value(0)
    apartCut2:set_value(0)
    apartCut3:set_value(0)
    apartCut4:set_value(0)
end)
ApartmentDataEditorMenu:Button("All - 25%", function()
    apartCut1:set_value(25)
    apartCut2:set_value(25)
    apartCut3:set_value(25)
    apartCut4:set_value(25)
end)
ApartmentDataEditorMenu:Button("All - 85%", function()
    apartCut1:set_value(85)
    apartCut2:set_value(85)
    apartCut3:set_value(85)
    apartCut4:set_value(85)
end)
ApartmentDataEditorMenu:Button("All - 100%", function()
    apartCut1:set_value(100)
    apartCut2:set_value(100)
    apartCut3:set_value(100)
    apartCut4:set_value(100)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Cayo Perico", function()
local CayoPericoCrewCut = {
    { tunable = "IH_DEDUCTION_PAVEL_CUT", default = -0.02 },
    { tunable = "IH_DEDUCTION_FENCING_FEE", default = -0.1 },
}

-- Cayo Perico setup: the values the game stores for each planning board choice.
local cayoSetup = {
    difficulty = { { "Normal", 126823 }, { "Hard", 131055 } }, -- H4_PROGRESS
    approach = { -- H4_MISSIONS
        { "Kosatka", 65283 },
        { "Alkonost", 65413 },
        { "Velum", 65289 },
        { "Stealth Annihilator", 65425 },
        { "Patrol Boat", 65313 },
        { "Longfin", 65345 },
        { "All Ways", 65535 },
    },
    loadout = { -- H4CNF_WEAPONS
        { "Aggressor", 1 },
        { "Conspirator", 2 },
        { "Crackshot", 3 },
        { "Saboteur", 4 },
        { "Marksman", 5 },
    },
    target = { -- H4CNF_TARGET
        { "Sinsimito Tequila", 0 },
        { "Ruby Necklace", 1 },
        { "Bearer Bonds", 2 },
        { "Pink Diamond", 3 },
        { "Madrazo Files", 4 },
        { "Panther Statue", 5 },
    },
    -- Secondary loot type per location: only H4LOOT_<type>_<C|I> of the chosen type is filled.
    secondary = { { "None", false }, { "Cash", "CASH" }, { "Weed", "WEED" }, { "Coke", "COKE" }, { "Gold", "GOLD" } },
    -- Amounts are bitmasks with one bit per loot spot (compound 8, paintings 7, island 24 spots).
    compoundAmount = {
        { "Empty", 0 }, { "1", 128 }, { "2", 192 }, { "3", 196 }, { "4", 204 },
        { "5", 220 }, { "6", 252 }, { "7", 253 }, { "Full", 255 },
    },
    artsAmount = {
        { "Empty", 0 }, { "1", 64 }, { "2", 96 }, { "3", 112 }, { "4", 120 },
        { "5", 122 }, { "6", 126 }, { "Full", 127 },
    },
    islandAmount = {
        { "Empty", 0 }, { "1", 8388608 }, { "2", 12582912 }, { "3", 12845056 }, { "4", 12976128 },
        { "5", 13500416 }, { "6", 14548992 }, { "Full", 16777215 },
    },
    lootValues = { CASH = 74925, WEED = 121500, COKE = 182250, GOLD = 300000 }, -- H4LOOT_<type>_V
    paintValue = 162000, -- H4LOOT_PAINT_V
}

-- Selected index (0-based) of every setup dropdown.
local cayoChoice = {
    difficulty = 0,
    approach = 0,
    loadout = 0,
    target = 0,
    compoundTarget = 0,
    compoundAmount = #cayoSetup.compoundAmount - 1,
    artsAmount = 0,
    islandTarget = 0,
    islandAmount = #cayoSetup.islandAmount - 1,
}

local function CayoCombo(label, key, options)
    if not options.names then
        options.names = {}
        for i, option in ipairs(options) do
            options.names[i] = option[1]
        end
    end
    cayoChoice[key] = ImGui.Combo(label, cayoChoice[key], options.names, #options.names)
end

local function CayoPick(key, options)
    return options[cayoChoice[key] + 1][2]
end

-- where = "C" (compound) or "I" (island)
local function CayoSetSecondary(where, lootType, amount)
    for loot in pairs(cayoSetup.lootValues) do
        local value = (loot == lootType) and amount or 0
        stats.set_int(MPX() .. "H4LOOT_" .. loot .. "_" .. where, value)
        stats.set_int(MPX() .. "H4LOOT_" .. loot .. "_" .. where .. "_SCOPED", value)
    end
end

local cayoLocations = {
    { name = "Front Gate", x = 4990.0386, y = -5717.6895, z = 19.876024 },
    { name = "El Rubio's Office", x = 5010.12, y = -5750.1353, z = 28.844675 },
    { name = "Primary Target", x = 5006.7, y = -5756.2, z = 15.483983 },
    { name = "Secondary Target", x = 4999.764160, y = -5749.863770, z = 14.840000 },
    { name = "Safe Zone", x = 4771.479, y = -6165.737, z = -39.079613 },
    { name = "Entrance Drainage Pipe", x = 5043.74, y = -5815.3193, z = -10.574497 },
    { name = "Enter Cayo Perico", x = 5053.8516, y = -5772.852, z = -4.1588774 },
    { name = "Elevator", x = 5012.1533, y = -5749.0107, z = 28.945145 },
}

local bagValue = 0
local cayocut1 = 0
local cayocut2 = 0
local cayocut3 = 0
local cayocut4 = 0
local cayoCrewCuts = false
local livesValueCayo = 3
local cayoLootTakeValue = 0

function CayoSoloMantrap()
    script.run_in_callback(function()
        network.force_script_host(util.joaat(FMC2020))
        script.yield(500)
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPMantrap1):set_int(7) end
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPMantrap2):set_int(1) end
        notify.info("Cayo Perico Heist", "Solo mantrap enabled")
    end)
end

function CayoTakeSecondary()
    script.run_in_callback(function()
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPSecondary):set_int(3) end
        script.yield(500)
        local cur = (scripts.is_active(FMC2020) and ScriptLocal(FMC2020, CPSecondary):get_int() or 0)
        if cur ~= nil then
            if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPSecondary):set_int(cur - 1) end
        end
        notify.info("Cayo Perico Heist", "Secondary target taken")
    end)
end

function CayoSetLootTake(value)
    if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPLootTake):set_int(value) end
    notify.info("Cayo Perico Heist", "Loot take set to " .. value)
end

function GetCayoTakeText()
    if scripts.is_active(FMC2020) then
        return "Current Take: $" .. tostring(ScriptLocal(FMC2020, CPLootTake):get_int())
    end
    return "Current Take: N/A (start finale)"
end

function CayoDrawMisc()
    if ImGui.Button("Solo Mantrap (Dual Keycard)") then
        CayoSoloMantrap()
    end
    if ImGui.Button("Take Secondary Target") then
        CayoTakeSecondary()
    end
    ImGui.Text(GetCayoTakeText())
    cayoLootTakeValue, __ = ImGui.InputInt("Loot Take", cayoLootTakeValue)
    if ImGui.Button("Set Loot Take") then
        CayoSetLootTake(cayoLootTakeValue)
    end
end

local CayoHeistEditorMenu = HeistsDataEditorMenu:Tab("Cayo Perico")
CayoHeistEditorMenu:Box("Information", 0) -- full width, above everything else
CayoHeistEditorMenu:Text("Max Payout 2.550.000$")
CayoHeistEditorMenu:Text("Min Cooldown ≈ 15-20 minutes")

CayoHeistEditorMenu:Box("Preps")
CayoHeistEditorMenu:Custom(function()
    CayoCombo("Difficulty", "difficulty", cayoSetup.difficulty)
    CayoCombo("Approach", "approach", cayoSetup.approach)
    CayoCombo("Loadout", "loadout", cayoSetup.loadout)
    CayoCombo("Target", "target", cayoSetup.target)
    CayoCombo("Com. Target", "compoundTarget", cayoSetup.secondary)
    CayoCombo("Com. Amount", "compoundAmount", cayoSetup.compoundAmount)
    CayoCombo("Arts Amount", "artsAmount", cayoSetup.artsAmount)
    CayoCombo("Isl. Target", "islandTarget", cayoSetup.secondary)
    CayoCombo("Isl. Amount", "islandAmount", cayoSetup.islandAmount)
end)
CayoHeistEditorMenu:Button("Apply & Complete Preps", function()
    local mpx = MPX()
    -- Planning board choices
    stats.set_int(mpx .. "H4_PROGRESS", CayoPick("difficulty", cayoSetup.difficulty))
    stats.set_int(mpx .. "H4_MISSIONS", CayoPick("approach", cayoSetup.approach))
    stats.set_int(mpx .. "H4CNF_WEAPONS", CayoPick("loadout", cayoSetup.loadout))
    stats.set_int(mpx .. "H4CNF_TARGET", CayoPick("target", cayoSetup.target))

    -- Secondary loot
    CayoSetSecondary("C", CayoPick("compoundTarget", cayoSetup.secondary), CayoPick("compoundAmount", cayoSetup.compoundAmount))
    CayoSetSecondary("I", CayoPick("islandTarget", cayoSetup.secondary), CayoPick("islandAmount", cayoSetup.islandAmount))
    for loot, value in pairs(cayoSetup.lootValues) do
        stats.set_int(mpx .. "H4LOOT_" .. loot .. "_V", value)
    end
    local arts = CayoPick("artsAmount", cayoSetup.artsAmount)
    stats.set_int(mpx .. "H4LOOT_PAINT", arts)
    stats.set_int(mpx .. "H4LOOT_PAINT_SCOPED", arts)
    stats.set_int(mpx .. "H4LOOT_PAINT_V", arts ~= 0 and cayoSetup.paintValue or 0)

    -- Completed preps
    stats.set_int(mpx .. "H4CNF_APPROACH", -1)
    stats.set_int(mpx .. "H4CNF_BS_GEN", -1)
    stats.set_int(mpx .. "H4CNF_BS_ENTR", 63)
    stats.set_int(mpx .. "H4CNF_BS_ABIL", 63)
    stats.set_int(mpx .. "H4CNF_UNIFORM", -1)
    stats.set_int(mpx .. "H4CNF_GRAPPEL", -1)
    stats.set_int(mpx .. "H4CNF_TROJAN", 5)
    stats.set_int(mpx .. "H4CNF_WEP_DISRP", 3)
    stats.set_int(mpx .. "H4CNF_ARM_DISRP", 3)
    stats.set_int(mpx .. "H4CNF_HEL_DISRP", 3)
    stats.set_int(mpx .. "H4_PLAYTHROUGH_STATUS", 10)

    if scripts.is_active(HIP) then ScriptLocal(HIP, CPRSl):set_int(2) end
    notify.info("Cayo Perico Heist", "Preps should've been completed")
end)
CayoHeistEditorMenu:Button("Reset Preps", function()
    local mpx = MPX()
    stats.set_int(mpx .. "H4_PROGRESS", 0)
    stats.set_int(mpx .. "H4_MISSIONS", 0)
    stats.set_int(mpx .. "H4CNF_APPROACH", 0)
    stats.set_int(mpx .. "H4CNF_TARGET", -1)
    stats.set_int(mpx .. "H4CNF_BS_GEN", 0)
    stats.set_int(mpx .. "H4CNF_BS_ENTR", 0)
    stats.set_int(mpx .. "H4CNF_BS_ABIL", 0)
    stats.set_int(mpx .. "H4_PLAYTHROUGH_STATUS", 0)
    if scripts.is_active(HIP) then ScriptLocal(HIP, CPRSl):set_int(2) end
    notify.info("Cayo Perico Heist", "Preps should've been reset")
end)
CayoHeistEditorMenu:Button("Reload Planning Screen", function()
    if scripts.is_active(HIP) then ScriptLocal(HIP, CPRSl):set_int(2) end
    notify.info("Cayo Perico Heist", "Screen should've been reloaded")
end)

CayoHeistEditorMenu:Box("Bag Size")
CayoHeistEditorMenu:Custom(function()
    -- Cayo Bag Size Editor
    bagValue, __ = ImGui.InputInt("Bag Size", bagValue)
    if ImGui.Button("Set Bag Size") then
        if bagValue < 0 or bagValue > 10000 then
            notify.info("Cayo Perico", "Bag size must be 0-10000.")
        else
            tunables.set_int("HEIST_BAG_MAX_CAPACITY", bagValue)
            notify.info("Cayo Perico", "Bag size set to " .. bagValue)
        end
    end
end)
CayoHeistEditorMenu:Box("Primary Payouts")
CayoHeistEditorMenu:Custom(function()
    local cayoPrimaryPayouts = {
        { name = "Panther Statue", tunable = "IH_PRIMARY_TARGET_VALUE_SAPPHIRE_PANTHER_STATUE" },
        { name = "Madrazo Files", tunable = "IH_PRIMARY_TARGET_VALUE_MADRAZO_FILES" },
        { name = "Pink Diamond", tunable = "IH_PRIMARY_TARGET_VALUE_PINK_DIAMOND" },
        { name = "Bearer Bonds", tunable = "IH_PRIMARY_TARGET_VALUE_BEARER_BONDS" },
        { name = "Necklace", tunable = "IH_PRIMARY_TARGET_VALUE_PEARL_NECKLACE" },
        { name = "Tequila", tunable = "IH_PRIMARY_TARGET_VALUE_TEQUILA" },
    }
    for _, p in ipairs(cayoPrimaryPayouts) do
        local cur = tunables.get_int(p.tunable)
        local val, used = ImGui.InputInt(p.name, cur)
        if used then
            if val < 0 or val > 10000000 then
                notify.info("Cayo Perico", p.name .. " must be 0-10M.")
            else
                tunables.set_int(p.tunable, val)
                notify.info("Cayo Perico", p.name .. " payout set to " .. val)
            end
        end
    end
end)
CayoHeistEditorMenu:Box("Cuts")
CayoHeistEditorMenu:Custom(function()
    -- Crew Cuts
    ImGui.Text("Removes fencing fee and Pavel's cut")
    cayoCrewCuts, __ = ImGui.Checkbox("Remove Crew Cuts", cayoCrewCuts)


    ImGui.Text("Transaction limit is 2.55mil.")
    cayocut1, __ = ImGui.InputInt("Player 1", cayocut1)
    cayocut2, __ = ImGui.InputInt("Player 2", cayocut2)
    cayocut3, __ = ImGui.InputInt("Player 3", cayocut3)
    cayocut4, __ = ImGui.InputInt("Player 4", cayocut4)
    if ImGui.Button("Apply Cuts##Cayo") then
        local cayoValid = true
        for _, v in ipairs({cayocut1, cayocut2, cayocut3, cayocut4}) do
            if v < 0 or v > 100 then
                cayoValid = false
                break
            end
        end
        if not cayoValid then
            notify.info("Cayo Perico", "Cuts must be 0-100.")
        else
            SN_ApplyCayoCuts(cayocut1, cayocut2, cayocut3, cayocut4)
            notify.info("Cayo Perico", "Cuts should've been applied")
        end
    end
end)
CayoHeistEditorMenu:Box("Cut Presets")
CayoHeistEditorMenu:Custom(function()
    if ImGui.Button("All - 0%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 0, 0, 0, 0
        SN_ApplyCayoCuts(0, 0, 0, 0)
        notify.info("Cayo Perico", "Cuts should've been applied")
    end
    ImGui.SameLine()
    if ImGui.Button("All - 25%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 25, 25, 25, 25
        SN_ApplyCayoCuts(25, 25, 25, 25)
        notify.info("Cayo Perico", "Cuts should've been applied")
    end
    if ImGui.Button("All - 85%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 85, 85, 85, 85
        SN_ApplyCayoCuts(85, 85, 85, 85)
        notify.info("Cayo Perico", "Cuts should've been applied")
    end
    ImGui.SameLine()
    if ImGui.Button("All - 100%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 100, 100, 100, 100
        SN_ApplyCayoCuts(100, 100, 100, 100)
        notify.info("Cayo Perico", "Cuts should've been applied")
    end
    if ImGui.Button("2.55mil Payout##Cayo") then
        local maxCut = SN_CayoMaxCut()
        if maxCut then
            cayocut1, cayocut2, cayocut3, cayocut4 = maxCut, maxCut, maxCut, maxCut
            cayoCrewCuts = false
            SN_ApplyCayoCuts(maxCut, maxCut, maxCut, maxCut)
            notify.info("Cayo Perico", "Cuts should've been applied (" .. maxCut .. "% each)")
        else
            notify.info("Cayo Perico", "Unknown primary target")
        end
    end
end)
CayoHeistEditorMenu:Box("Hacks")
CayoHeistEditorMenu:Custom(function()
    -- Extras
    if ImGui.Button("Bypass Drainage Cut") then
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPSTCl):set_int(6) end
        notify.info("Cayo Perico Heist", "Cutting process should've been skipped")
    end
    if ImGui.Button("Bypass Fingerprint Scanner") then
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPFHl):set_int(5) end
        notify.info("Cayo Perico Heist", "Hacking process should've been skipped")
    end
    if ImGui.Button("Bypass Plasma Cutter") then
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPPCCl):set_float(100.0) end
        notify.info("Cayo Perico Heist", "Cutting process should've been skipped")
    end
end)
CayoHeistEditorMenu:Box("Team Lives")
CayoHeistEditorMenu:Custom(function()
    livesValueCayo, __ = ImGui.InputInt("##CayolivesValue", livesValueCayo)
    if ImGui.Button("Set Lives") then
        if livesValueCayo < 1 then
            notify.info("Cayo Perico Heist", "Lives must be at least 1.")
        elseif livesValueCayo > 999999 then
            notify.info("Cayo Perico Heist", "Lives value too high.")
        elseif not scripts.is_active(FMC2020) then
            notify.info("Cayo Perico Heist", "Mission script not active.")
        else
            if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPLIVESL):set_int(livesValueCayo) end
            notify.info("Cayo Perico Heist", "Team Lives value set to " .. livesValueCayo)
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Default is 3. Infinite team lives for the heist (set to 999999 for unlimited)")
    end
end)
CayoHeistEditorMenu:Box("Mission")
CayoHeistEditorMenu:Custom(function()
    if ImGui.Button("Remove All CCTVs") then
        script.run_in_callback(function()
            for _, ent in ipairs(entities.get_all_objects_as_handles()) do
                local model = ENTITY.GET_ENTITY_MODEL(ent) % 0x100000000
                for _, cam in ipairs(CamList) do
                    if model == cam then
                        ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
                        Entity(ent):delete()
                        break
                    end
                end
            end
        end)
    end

    CamList = {
        util.joaat("prop_cctv_cam_01a"),
        util.joaat("prop_cctv_cam_01b"),
        util.joaat("prop_cctv_cam_02a"),
        util.joaat("prop_cctv_cam_03a"),
        util.joaat("prop_cctv_cam_04a"),
        util.joaat("prop_cctv_cam_04c"),
        util.joaat("prop_cctv_cam_05a"),
        util.joaat("prop_cctv_cam_06a"),
        util.joaat("prop_cctv_cam_07a"),
        util.joaat("prop_cs_cctv"),
        util.joaat("p_cctv_s"),
        util.joaat("hei_prop_bank_cctv_01"),
        util.joaat("hei_prop_bank_cctv_02"),
        util.joaat("ch_prop_ch_cctv_cam_02a"),
        util.joaat("xm_prop_x17_server_farm_cctv_01"),
    }

    if ImGui.Button("Instant Finish") then
        -- FIX Bug#2: old code never took script host, so finish desynced and only host got payout.
        -- Must be HOST (or force host) and cuts must already be set by HOST.
        script.run_in_callback(function()
            if not scripts.is_active(FMC2020) then
                notify.info("Cayo Perico Heist", "Start the finale first!")
                return
            end
            network.force_script_host(util.joaat(FMC2020))
            script.yield(1000)
            if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPXf1):set_int(9) end
            if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPXf2):set_int(50) end
            notify.info("Cayo Perico Heist", "Finished (HOST). If crew got 0, HOST forgot to set cuts to 100/100 before finale!")
        end)
    end
    if ImGui.Button("Skip Cutscene") then
        SkipCutscene()
    end
    if ImGui.Button("Force Ready") then
        script.run_in_callback(function()
            network.force_script_host(util.joaat(FMC2020))
            script.yield(1000)
            for i = 0, 3 do
                ScriptGlobal(CYFRg + 1 + (i * 27) + 7 + 1 + i):set_int(1)
            end
            notify.info("Cayo Perico Heist", "Everyone should've been forced ready")
        end)
    end

    if ImGui.Button("Kill Cooldown (after solo)") then
        stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659643454)
        stats.set_int(MPX() .. "H4_COOLDOWN", 0)
        stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
        notify.info("Cayo Perico Heist", "Cooldown should've been killed")
    end
    if ImGui.Button("Kill Cooldown (after team)") then
        stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659429119)
        stats.set_int(MPX() .. "H4_COOLDOWN", 0)
        stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
        notify.info("Cayo Perico Heist", "Cooldown should've been killed")
    end

    ImGui.Text("After clicking the Kill Cooldown button, go offline and then come back online")
end)
CayoHeistEditorMenu:Box("Misc")
CayoHeistEditorMenu:Custom(function()
    CayoDrawMisc()
end)
CayoHeistEditorMenu:Box("Teleports", 2) -- right column, under Mission
CayoHeistEditorMenu:Custom(function()
    -- Teleports

    for i, location in ipairs(cayoLocations) do
        if ImGui.Button(location.name) then
            script.run_in_callback(function()
                local ped = PLAYER.PLAYER_PED_ID()
                PED.SET_PED_COORDS_KEEP_VEHICLE(ped, location.x, location.y, location.z)
            end)
        end

    end
end)

-- Handle the Crew Cuts loop separately
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            return
        end
        for _, cut in ipairs(CayoPericoCrewCut) do
            if cayoCrewCuts then
                tunables.set_float(cut.tunable, 0)
            else
                tunables.set_float(cut.tunable, cut.default)
            end
        end
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Casino Heist", function()
local CasinoHeistEditorMenu = HeistsDataEditorMenu:Tab("Casino Heist")
CasinoHeistEditorMenu:Box("Information", 0) -- full width, above everything else
CasinoHeistEditorMenu:Text("Max Payout 3.619.000$")
CasinoHeistEditorMenu:Text("Min Cooldown ≈ 15-20 minutes")

CasinoHeistEditorMenu:Box("One Click Setups")
CasinoHeistEditorMenu:Button("Casino Silent&Sneaky (Diamonds)", function()
    stats.set_int(MPX() .. "H3OPT_APPROACH", 1)
    stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
    stats.set_int(MPX() .. "H3OPT_TARGET", 3)
    stats.set_int(MPX() .. "H3OPT_BITSET1", 127)
    stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
    stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
    stats.set_int(MPX() .. "H3_BOARD_DIALOGUE2", -1)
    stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
    stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
    stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
    stats.set_int(MPX() .. "H3OPT_VEHS", 2)
    stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
    stats.set_int(MPX() .. "H3OPT_BITSET0", 262399)
    stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)
CasinoHeistEditorMenu:Button("Casino The Big Con (Diamonds)", function()
    stats.set_int(MPX() .. "H3OPT_APPROACH", 2)
    stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
    stats.set_int(MPX() .. "H3OPT_TARGET", 3)
    stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
    stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
    stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
    stats.set_int(MPX() .. "H3_BOARD_DIALOGUE2", -1)
    stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
    stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
    stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
    stats.set_int(MPX() .. "H3OPT_VEHS", 2)
    stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
    stats.set_int(MPX() .. "H3OPT_BITSET0", 913623)
    stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)
CasinoHeistEditorMenu:Button("Casino Aggressive (Diamonds)", function()
    stats.set_int(MPX() .. "H3OPT_APPROACH", 3)
    stats.set_int(MPX() .. "H3_LAST_APPROACH", 1)
    stats.set_int(MPX() .. "H3OPT_TARGET", 3)
    stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
    stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
    stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
    stats.set_int(MPX() .. "H3_BOARD_DIALOGUE2", -1)
    stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
    stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
    stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
    stats.set_int(MPX() .. "H3OPT_VEHS", 2)
    stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
    stats.set_int(MPX() .. "H3OPT_BITSET0", 1835223)
    stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)


-- Lives Editor for Casino Heist
local livesValueCasino = 3
CasinoHeistEditorMenu:Box("Team Lives")
CasinoHeistEditorMenu:Custom(function()
    livesValueCasino, __ = ImGui.InputInt("##CasinoLives", livesValueCasino)
    if ImGui.Button("Set Lives##Casino") then
        if livesValueCasino < 1 then
            notify.info("Casino Heist", "Lives must be at least 1!")
        else
            if scripts.is_active(FMC) then ScriptLocal(FMC, DCLIVESL):set_int(livesValueCasino) end
            notify.info("Casino Heist", "Team lives set to " .. livesValueCasino)
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Default is 3. Infinite team lives for the heist (set to 999999 for unlimited)")
    end
end)


DiamondCasinoDifficulties = {
    { name = "Normal", index = 0 },
    { name = "Hard", index = 1 },
}

diamondApproachList = {
    { name = "Silent n Snea.", index = 1 },
    { name = "Big Con", index = 2 },
    { name = "Aggressive", index = 3 },
}

diamondGunmanList = {
    { name = "Karl Abolaji", index = 1 },
    { name = "Charlie Reed", index = 3 },
    { name = "Patrick McRear.", index = 5 },
    { name = "Gustavo Mota", index = 2 },
    { name = "Chester McCoy", index = 4 },
}

diamondLoadoutList = {
    { name = "Micro SMG (S)", index = 1 },
    { name = "Mac. Pistol (S)", index = 1 },
    { name = "Micro SMG", index = 1 },
    { name = "Double Barrel", index = 1 },
    { name = "Sawed-Off", index = 1 },
    { name = "Heavy Revolver", index = 1 },
    { name = "Assau. SMG (S)", index = 3 },
    { name = "Bullpup Sh. (S)", index = 3 },
    { name = "Machine Pistol", index = 3 },
    { name = "Sweeper Shot.", index = 3 },
    { name = "Assault SMG", index = 3 },
    { name = "Pump Shotgun", index = 3 },
    { name = "Combat PDW", index = 5 },
    { name = "Assault Rif. (S)", index = 5 },
    { name = "Sawed-Off", index = 5 },
    { name = "Compact Rifle", index = 5 },
    { name = "Heavy Shotgun", index = 5 },
    { name = "Combat MG", index = 5 },
    { name = "Carbin. Rif. (S)", index = 2 },
    { name = "Assau. Sho. (S)", index = 2 },
    { name = "Carbine Rifle", index = 2 },
    { name = "Assault Shot.", index = 2 },
    { name = "Carbine Rifle", index = 2 },
    { name = "Assault Shot.", index = 2 },
    { name = "Pump Sh. II (S)", index = 4 },
    { name = "Carbine R. II (S)", index = 4 },
    { name = "SMG Mk II", index = 4 },
    { name = "Bullpup Rifle II", index = 4 },
    { name = "Pump Shot. II", index = 4 },
    { name = "Assault Rifle II", index = 4 },
}

diamondDriverList = {
    { name = "Karim Denz", index = 1 },
    { name = "Zach Nelson", index = 4 },
    { name = "Taliana Martinez", index = 2 },
    { name = "Eddie Toh", index = 3 },
    { name = "Chester McCoy", index = 5 },
}

diamondVehiclesList = {
    { name = "Issi Classic", index = 1 },
    { name = "Asbo", index = 1 },
    { name = "Blista Kanjo", index = 1 },
    { name = "Sentinel Class.", index = 1 },
    { name = "Manchez", index = 4 },
    { name = "Stryder", index = 4 },
    { name = "Defiler", index = 4 },
    { name = "Lectro", index = 4 },
    { name = "Retinue Mk II", index = 2 },
    { name = "Drift Yosemite", index = 2 },
    { name = "Sugoi", index = 2 },
    { name = "Jugular", index = 2 },
    { name = "Sultan Classic", index = 3 },
    { name = "Gauntl. Classic", index = 3 },
    { name = "Ellie", index = 3 },
    { name = "Komoda", index = 3 },
    { name = "Zhaba", index = 5 },
    { name = "Vagrant", index = 5 },
    { name = "Outlaw", index = 5 },
    { name = "Everon", index = 5 },
}

diamondHackerList = {
    { name = "Rickie Lukens", index = 1 },
    { name = "Yohan Blair", index = 3 },
    { name = "Christian Feltz", index = 2 },
    { name = "Page Harris", index = 5 },
    { name = "Avi Schwartz.", index = 4 },
}

diamondMasksList = {
    { name = "None", index = 0 },
    { name = "Geometric Set", index = 1 },
    { name = "Hunter Set", index = 2 },
    { name = "Oni Half Mask Set", index = 3 },
    { name = "Emoji Set", index = 4 },
    { name = "Ornate Skull Set", index = 5 },
    { name = "Lucky Fruit Set", index = 6 },
    { name = "Guerilla Set", index = 7 },
    { name = "Clown Set", index = 8 },
    { name = "Animal Set", index = 9 },
    { name = "Riot Set", index = 10 },
    { name = "Oni Full Mask Set", index = 11 },
    { name = "Hockey Set", index = 12 },
}

diamondGuardsList = {
    { name = "Elite", index = 0 },
    { name = "Pro", index = 1 },
    { name = "Unit", index = 2 },
    { name = "Rookie", index = 3 },
}

diamondKeycardsList = {
    { name = "None", index = 0 },
    { name = "Level 1", index = 1 },
    { name = "Level 2", index = 2 },
}

diamondTargetList = {
    { name = "Cash", index = 0 },
    { name = "Arts", index = 2 },
    { name = "Gold", index = 1 },
    { name = "Diamonds", index = 3 },
}

DiamondCasinoCrewCut = {
    { tunable = "CH_LESTER_CUT", default = 5 },
    { tunable = "HEIST3_PREPBOARD_GUNMEN_KARL_CUT", default = 5 },
    { tunable = "HEIST3_PREPBOARD_GUNMEN_GUSTAVO_CUT", default = 9 },
    { tunable = "HEIST3_PREPBOARD_GUNMEN_CHARLIE_CUT", default = 7 },
    { tunable = "HEIST3_PREPBOARD_GUNMEN_CHESTER_CUT", default = 10 },
    { tunable = "HEIST3_PREPBOARD_GUNMEN_PATRICK_CUT", default = 8 },
    { tunable = "HEIST3_DRIVERS_KARIM_CUT", default = 5 },
    { tunable = "HEIST3_DRIVERS_TALIANA_CUT", default = 7 },
    { tunable = "HEIST3_DRIVERS_EDDIE_CUT", default = 9 },
    { tunable = "HEIST3_DRIVERS_ZACH_CUT", default = 6 },
    { tunable = "HEIST3_DRIVERS_CHESTER_CUT", default = 10 },
    { tunable = "HEIST3_HACKERS_RICKIE_CUT", default = 3 },
    { tunable = "HEIST3_HACKERS_CHRISTIAN_CUT", default = 7 },
    { tunable = "HEIST3_HACKERS_YOHAN_CUT", default = 5 },
    { tunable = "HEIST3_HACKERS_AVI_CUT", default = 10 },
    { tunable = "HEIST3_HACKERS_PAIGE_CUT", default = 9 },
}

-- Build name lists for all combos
diamondDifficultyNames = {}
for _, item in ipairs(DiamondCasinoDifficulties) do
    table.insert(diamondDifficultyNames, item.name)
end
diamondDifficultyIndex = 0

diamondApproachNames = {}
for _, item in ipairs(diamondApproachList) do
    table.insert(diamondApproachNames, item.name)
end
diamondApproachIndex = 0

diamondGunmanNames = {}
for _, item in ipairs(diamondGunmanList) do
    table.insert(diamondGunmanNames, item.name)
end
diamondGunmanIndex = 0

local diamondLoadoutIndex = 0

local diamondDriverNames = {}
for _, item in ipairs(diamondDriverList) do
    table.insert(diamondDriverNames, item.name)
end
local diamondDriverIndex = 0

local diamondVehiclesIndex = 0

local diamondHackerNames = {}
for _, item in ipairs(diamondHackerList) do
    table.insert(diamondHackerNames, item.name)
end
local diamondHackerIndex = 0

local diamondMasksNames = {}
for _, item in ipairs(diamondMasksList) do
    table.insert(diamondMasksNames, item.name)
end
local diamondMasksIndex = 0

local diamondGuardsNames = {}
for _, item in ipairs(diamondGuardsList) do
    table.insert(diamondGuardsNames, item.name)
end
local diamondGuardsIndex = 0

local diamondKeycardsNames = {}
for _, item in ipairs(diamondKeycardsList) do
    table.insert(diamondKeycardsNames, item.name)
end
local diamondKeycardsIndex = 0

local diamondTargetNames = {}
for _, item in ipairs(diamondTargetList) do
    table.insert(diamondTargetNames, item.name)
end
local diamondTargetIndex = 0

CasinoHeistEditorMenu:Box("Preps")
CasinoHeistEditorMenu:Custom(function()

    -- Difficulty
    local nIndex, changed =
        ImGui.Combo("Difficulty", diamondDifficultyIndex, diamondDifficultyNames, #diamondDifficultyNames)
    if changed then
        diamondDifficultyIndex = nIndex
    end

    -- Approach
    nIndex, changed = ImGui.Combo("Approach", diamondApproachIndex, diamondApproachNames, #diamondApproachNames)
    if changed then
        diamondApproachIndex = nIndex
    end

    -- Gunman
    nIndex, changed = ImGui.Combo("Gunman", diamondGunmanIndex, diamondGunmanNames, #diamondGunmanNames)
    if changed then
        diamondGunmanIndex = nIndex
        diamondLoadoutIndex = 0
    end

    -- Loadout (filtered by gunman)
    do
        local gIndex = diamondGunmanList[diamondGunmanIndex + 1].index
        local filnames = {}
        for _, item in ipairs(diamondLoadoutList) do
            if item.index == gIndex then
                table.insert(filnames, item.name)
            end
        end
        nIndex, changed = ImGui.Combo("Loadout", diamondLoadoutIndex, filnames, #filnames)
        if changed then
            diamondLoadoutIndex = nIndex
        end
    end

    -- Driver
    nIndex, changed = ImGui.Combo("Driver", diamondDriverIndex, diamondDriverNames, #diamondDriverNames)
    if changed then
        diamondDriverIndex = nIndex
        diamondVehiclesIndex = 0
    end

    -- Vehicles (filtered by driver)
    do
        local dIndex = diamondDriverList[diamondDriverIndex + 1].index
        local filnames = {}
        for _, item in ipairs(diamondVehiclesList) do
            if item.index == dIndex then
                table.insert(filnames, item.name)
            end
        end
        nIndex, changed = ImGui.Combo("Vehicles", diamondVehiclesIndex, filnames, #filnames)
        if changed then
            diamondVehiclesIndex = nIndex
        end
    end

    -- Hacker
    nIndex, changed = ImGui.Combo("Hacker", diamondHackerIndex, diamondHackerNames, #diamondHackerNames)
    if changed then
        diamondHackerIndex = nIndex
    end

    -- Masks
    nIndex, changed = ImGui.Combo("Masks", diamondMasksIndex, diamondMasksNames, #diamondMasksNames)
    if changed then
        diamondMasksIndex = nIndex
    end

    -- Guards
    nIndex, changed = ImGui.Combo("Guards", diamondGuardsIndex, diamondGuardsNames, #diamondGuardsNames)
    if changed then
        diamondGuardsIndex = nIndex
    end

    -- Keycards
    nIndex, changed = ImGui.Combo("Keycards", diamondKeycardsIndex, diamondKeycardsNames, #diamondKeycardsNames)
    if changed then
        diamondKeycardsIndex = nIndex
    end

    -- Target
    nIndex, changed = ImGui.Combo("Target", diamondTargetIndex, diamondTargetNames, #diamondTargetNames)
    if changed then
        diamondTargetIndex = nIndex
    end


    -- Apply & Complete Preps button (inline so it appears right after the dropdowns)
    if ImGui.Button("Apply & Complete Preps") then
        local approach = diamondApproachList[diamondApproachIndex + 1].index
        local gunman = diamondGunmanList[diamondGunmanIndex + 1].index
        local loadout = diamondLoadoutIndex
        local driver = diamondDriverList[diamondDriverIndex + 1].index
        local vehicles = diamondVehiclesIndex
        local hacker = diamondHackerList[diamondHackerIndex + 1].index
        local masks = diamondMasksList[diamondMasksIndex + 1].index
        local guards = diamondGuardsList[diamondGuardsIndex + 1].index
        local keycards = diamondKeycardsList[diamondKeycardsIndex + 1].index
        local target = diamondTargetList[diamondTargetIndex + 1].index
        local difficulty = DiamondCasinoDifficulties[diamondDifficultyIndex + 1].index
        stats.set_int(MPX() .. "H3OPT_POI", -1)
        stats.set_int(MPX() .. "H3OPT_ACCESSPOINTS", -1)
        stats.set_int(MPX() .. "CAS_HEIST_NOTS", -1)
        stats.set_int(MPX() .. "CAS_HEIST_FLOW", -1)
        stats.set_int(MPX() .. "H3_LAST_APPROACH", 0)
        stats.set_int(MPX() .. "H3_HARD_APPROACH", (difficulty == 0) and 0 or approach)
        stats.set_int(MPX() .. "H3OPT_APPROACH", approach)
        stats.set_int(MPX() .. "H3OPT_CREWWEAP", gunman)
        stats.set_int(MPX() .. "H3OPT_WEAPS", loadout)
        stats.set_int(MPX() .. "H3OPT_CREWDRIVER", driver)
        stats.set_int(MPX() .. "H3OPT_VEHS", vehicles)
        stats.set_int(MPX() .. "H3OPT_CREWHACKER", hacker)
        stats.set_int(MPX() .. "H3OPT_TARGET", target)
        stats.set_int(MPX() .. "H3OPT_MASKS", masks)
        stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", guards)
        stats.set_int(MPX() .. "H3OPT_KEYLEVELS", keycards)
        stats.set_int(MPX() .. "H3OPT_BODYARMORLVL", -1)
        stats.set_int(MPX() .. "H3OPT_BITSET0", -1)
        stats.set_int(MPX() .. "H3OPT_BITSET1", -1)
        stats.set_int(MPX() .. "H3OPT_COMPLETEDPOSIX", -1)
        if scripts.is_active(CASPL) then ScriptLocal(CASPL, DCRBl):set_int(2) end
        notify.info("Diamond Casino Heist", "Preps should've been completed")
    end


    if ImGui.Button("Reset Preps##diamond") then
        stats.set_int(MPX() .. "H3_LAST_APPROACH", 0)
        stats.set_int(MPX() .. "H3_HARD_APPROACH", 0)
        stats.set_int(MPX() .. "H3_APPROACH", 0)
        stats.set_int(MPX() .. "H3OPT_APPROACH", 0)
        stats.set_int(MPX() .. "H3OPT_CREWWEAP", 0)
        stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
        stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 0)
        stats.set_int(MPX() .. "H3OPT_VEHS", 0)
        stats.set_int(MPX() .. "H3OPT_CREWHACKER", 0)
        stats.set_int(MPX() .. "H3OPT_MASKS", 0)
        stats.set_int(MPX() .. "H3OPT_TARGET", 0)
        stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 0)
        stats.set_int(MPX() .. "H3OPT_BODYARMORLVL", 1)
        stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 0)
        stats.set_int(MPX() .. "H3OPT_BITSET0", 0)
        stats.set_int(MPX() .. "H3OPT_BITSET1", 0)
        stats.set_int(MPX() .. "H3_BOARD_DIALOGUE0", 0)
        stats.set_int(MPX() .. "H3_BOARD_DIALOGUE1", 0)
        stats.set_int(MPX() .. "H3_BOARD_DIALOGUE2", 0)
        stats.set_int("MPPLY_H3_COOLDOWN", 0)
        stats.set_int(MPX() .. "H3OPT_COMPLETEDPOSIX", 0)
        if scripts.is_active(CASPL) then ScriptLocal(CASPL, DCRBl):set_int(2) end
        notify.info("Diamond Casino Heist", "Preps should've been reset")
    end
end)

local casinoCrewCuts_enabled = false
local casinoPc1_val = 0
local casinoPc2_val = 0
local casinoPc3_val = 0
local casinoPc4_val = 0

function SetDiamondMaxPayout()
    local approach = stats.get_int(MPX() .. "H3OPT_APPROACH")
    local hardApproach = stats.get_int(MPX() .. "H3_HARD_APPROACH")
    local target = stats.get_int(MPX() .. "H3OPT_TARGET")
    local difficulty = (approach == hardApproach) and 2 or 1
    local payouts = {
        [0] = { 2115000, 2326500 },
        [2] = { 2350000, 2585000 },
        [1] = { 2585000, 2843500 },
        [3] = { 3290000, 3619000 },
    }
    if payouts[target] == nil then
        return 100, 100
    end
    local payout = payouts[target][difficulty] + 819000
    local maxPayout = 3619000
    local gunman = stats.get_int(MPX() .. "H3OPT_CREWWEAP")
    local driver = stats.get_int(MPX() .. "H3OPT_CREWDRIVER")
    local hacker = stats.get_int(MPX() .. "H3OPT_CREWHACKER")
    local buyerFee = 0.1
    local lesterCut = 0.05
    local gunmanCuts = { [1] = 0.05, [3] = 0.07, [5] = 0.08, [2] = 0.09, [4] = 0.1 }
    local driverCuts = { [1] = 0.05, [4] = 0.06, [2] = 0.07, [3] = 0.09, [5] = 0.1 }
    local hackerCuts = { [1] = 0.03, [3] = 0.05, [2] = 0.07, [5] = 0.09, [4] = 0.1 }
    local feePayout = payout - (payout * buyerFee)
    local lesterPayout = feePayout * lesterCut
    local gunmanPayout = feePayout * (gunmanCuts[gunman] or 0)
    local driverPayout = feePayout * (driverCuts[driver] or 0)
    local hackerPayout = feePayout * (hackerCuts[hacker] or 0)
    local crewPayout = lesterPayout + gunmanPayout + driverPayout + hackerPayout
    local hostCut = math.floor(maxPayout / ((feePayout - crewPayout) / 100))
    local otherCut = math.floor(maxPayout / (payout / 100))
    return hostCut, otherCut
end

local casinoCutPresets = {
    { name = "All - 0%", index = 0 },
    { name = "All - 85%", index = 85 },
    { name = "All - 100%", index = 100 },
    { name = "3.6mil Payout", index = -1 },
}
local casinoCutPresetNames = {}
for _, preset in ipairs(casinoCutPresets) do
    table.insert(casinoCutPresetNames, preset.name)
end
local sPresetIndex = 0

CasinoHeistEditorMenu:Box("Cuts")
CasinoHeistEditorMenu:Custom(function()

    -- Remove Crew Cuts checkbox
    casinoCrewCuts_enabled, __ = ImGui.Checkbox("Remove Crew Cuts", casinoCrewCuts_enabled)

    -- Player cut inputs
    casinoPc1_val, __ = ImGui.InputInt("Player Cut 1", casinoPc1_val)
    casinoPc2_val, __ = ImGui.InputInt("Player Cut 2", casinoPc2_val)
    casinoPc3_val, __ = ImGui.InputInt("Player Cut 3", casinoPc3_val)
    casinoPc4_val, __ = ImGui.InputInt("Player Cut 4", casinoPc4_val)

    -- Presets
    ImGui.Text("Presets:")
    ImGui.SetNextItemWidth(170)
    local nIndex, changed = ImGui.Combo("##DiamondPreset", sPresetIndex, casinoCutPresetNames, #casinoCutPresetNames)
    if changed then
        sPresetIndex = nIndex
        local selected = casinoCutPresets[sPresetIndex + 1]
        local hostCut = selected.index
        local otherCut = selected.index
        if selected.index == -1 then
            hostCut, otherCut = SetDiamondMaxPayout()
            casinoCrewCuts_enabled = true
        else
            casinoCrewCuts_enabled = false
        end
        casinoPc1_val = hostCut
        casinoPc2_val = otherCut
        casinoPc3_val = otherCut
        casinoPc4_val = otherCut
    end

    if ImGui.Button("Apply Cuts") then
        local cutsValid = true
        for _, v in ipairs({casinoPc1_val, casinoPc2_val, casinoPc3_val, casinoPc4_val}) do
            if v < 0 or v > 100 then
                cutsValid = false
                break
            end
        end
        if not cutsValid then
            notify.info("Casino Heist", "Cuts must be 0-100.")
        else
            ScriptGlobal(DCCg1):set_int(casinoPc1_val)
            ScriptGlobal(DCCg2):set_int(casinoPc2_val)
            ScriptGlobal(DCCg3):set_int(casinoPc3_val)
            ScriptGlobal(DCCg4):set_int(casinoPc4_val)
            notify.info("Casino Heist", "Cuts should've been applied")
        end
    end
end)

script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            script.yield(500)
            return
        end
        for _, cut in ipairs(DiamondCasinoCrewCut) do
            if casinoCrewCuts_enabled then
                tunables.set_int(cut.tunable, 0)
            else
                tunables.set_int(cut.tunable, cut.default)
            end
        end
        script.yield(500)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

CasinoHeistEditorMenu:Box("Misc")
CasinoHeistEditorMenu:Custom(function()
    if ImGui.Button("Reload boards") then
        if scripts.is_active(CASPL) then ScriptLocal(CASPL, DCRBl):set_int(2) end
    end
    if ImGui.Button("Solo Launch") then
        if (scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) ~= nil and (scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) ~= 0 then
            if (scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) > 1 then
                ScriptLocal(FMMCL, HGGs2):set_int(1)
                ScriptGlobal(HEIST_SOLO_LAUNCH_BASE + 4 + 1 + ((scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) * 95) + 75):set_int(1)
            end
            ScriptGlobal(HGLs1):set_int(1)
            ScriptGlobal(HGLs2):set_int(1)
            ScriptGlobal(HGLs3):set_int(1)
            ScriptGlobal(HGLs4):set_int(0)
        end
    end
    if ImGui.Button("Kill Cooldown") then
        stats.set_int(MPX() .. "H3_COMPLETEDPOSIX", -1)
        stats.set_int("MPPLY_H3_COOLDOWN", -1)
        notify.info("Diamond Casino Heist", "Cooldown should've been killed")
    end
end)

local CasinoHeistExtra = CasinoHeistEditorMenu:Tab("Extras")
CasinoHeistExtra:Box("Hacks")
local casinoAutograbber = CasinoHeistExtra:Toggle("Autograbber")
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            script.yield(500)
            return
        end
        if casinoAutograbber:get_value() then
            if not scripts.is_active(FMC) then
                script.yield(500)
                return
            end
            if (scripts.is_active(FMC) and ScriptLocal(FMC, DCAg):get_int() or 0) == 3 then
                ScriptLocal(FMC, DCAg):set_int(4)
            elseif (scripts.is_active(FMC) and ScriptLocal(FMC, DCAg):get_int() or 0) == 4 then
                ScriptLocal(FMC, DCAs):set_float(2.0)
            else
                script.yield(500)
            end
        else
            script.yield(500)
        end
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)
CasinoHeistExtra:Button("Bypass Fingerprint Hack", function()
    if not scripts.is_active(FMC) then
        notify.info("Casino Heist", "Mission script not active.")
        return
    end
    if (scripts.is_active(FMC) and ScriptLocal(FMC, DCFHl):get_int() or 0) == 4 then
        ScriptLocal(FMC, DCFHl):set_int(5)
    else
        notify.info("Casino Heist", "Fingerprint hack not ready.")
    end
end)
CasinoHeistExtra:Button("Bypass Keypad Hack", function()
    if not scripts.is_active(FMC) then
        notify.info("Casino Heist", "Mission script not active.")
        return
    end
    if (scripts.is_active(FMC) and ScriptLocal(FMC, DCKHl):get_int() or 0) ~= 4 then
        ScriptLocal(FMC, DCKHl):set_int(5)
    else
        notify.info("Casino Heist", "Keypad hack not ready.")
    end
end)
CasinoHeistExtra:Button("Bypass Drill Vault Door", function()
    if scripts.is_active(FMC) then ScriptLocal(FMC, DCDVDl1):set_int((scripts.is_active(FMC) and ScriptLocal(FMC, DCDVDl2):get_int() or 0)) end
end)
CasinoHeistExtra:Box("Mission")
CasinoHeistExtra:Button("Instant Finish", function()
    -- FIX: old code never took script host and only set half the locals per approach -> desync/fail.
    script.run_in_callback(function()
        if not scripts.is_active(FMC) then
            notify.info("Instant Heist Passed", "Start the finale first!")
            return
        end
        network.force_script_host(util.joaat(FMC))
        script.yield(1000)
        if scripts.is_active(FMC) then ScriptLocal(FMC, DCXf1):set_int(12) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DCXf2):set_int(5) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DCXf3):set_int(80) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DCXf4):set_int(10000000) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DCXf5):set_int(99999) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DCXf6):set_int(99999) end
        notify.info("Instant Heist Passed", "Activated (HOST). Wait for vault to stream!")
    end)
end)
CasinoHeistExtra:Button("Force Ready", function()
    script.run_in_callback(function()
        network.force_script_host(util.joaat(FMC))
        script.yield(1000)
        for i = 0, 3 do
            ScriptGlobal(CFRg + 1 + (i * 68) + 7 + 1 + i):set_int(1)
        end
    end)
end)
CasinoHeistExtra:Button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Doomsday", function()
function DoomsdayActSetter(progress, status)
    stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", progress)
    stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", status)
    stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
end

local SN_Doomsday = HeistsDataEditorMenu:Tab("Doomsday")
SN_Doomsday:Box("Information", 0) -- full width, above everything else
SN_Doomsday:Text("Max Payout 2.550.000$")
SN_Doomsday:Text("Min Cooldown ≈ 15-20 minutes")
-- progress = GANGOPS_FLOW_MISSION_PROG, status = GANGOPS_HEIST_STATUS
local doomsdayActs = {
    { name = "Data Breaches", progress = 503, status = 229383 },
    { name = "Bogdan Problem", progress = 240, status = 229378 },
    { name = "Doomsday Scenario", progress = 16368, status = 229380 },
}
local doomsdayActNames = {}
for i, act in ipairs(doomsdayActs) do
    doomsdayActNames[i] = act.name
end
local doomsdayActIndex = 0

SN_Doomsday:Box("Preps")
SN_Doomsday:Custom(function()
    ImGui.Text("Act:")
    doomsdayActIndex = ImGui.Combo("##DoomsdayAct", doomsdayActIndex, doomsdayActNames, #doomsdayActNames)
end)
SN_Doomsday:Button("Complete Preps", function()
    local act = doomsdayActs[doomsdayActIndex + 1]
    DoomsdayActSetter(act.progress, act.status)
    stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
    notify.info("Doomsday Heist", act.name .. ": preps should've been completed")
end)
SN_Doomsday:Button("Reset Preps", function()
    DoomsdayActSetter(240, 0)
    notify.info("Doomsday Heist", "Preps should've been reset")
end)

local DoomsdayHeists = {
    [503] = { 975000, 1218750 },
    [240] = { 1425000, 1771250 },
    [16368] = { 1800000, 2250000 },
}

function SetDoomsdayMaxPayout()
    local heist = stats.get_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG")
    local difficulty = ScriptGlobal(AHDg):get_int()
    if difficulty == 0 then
        difficulty = 1
    end

    local heistData = DoomsdayHeists[heist]
    if heistData == nil then
        return
    end

    local payout = heistData[difficulty]
    local maxPayout = 2550000
    local cut = math.floor(maxPayout / (payout / 100))

    return cut
end

SN_Doomsday:Box("Cuts")
local dmsdyCut1 = SN_Doomsday:InputInt("Cut 1")
local dmsdyCut2 = SN_Doomsday:InputInt("Cut 2")
local dmsdyCut3 = SN_Doomsday:InputInt("Cut 3")
local dmsdyCut4 = SN_Doomsday:InputInt("Cut 4")

local Presets = {
    { name = "All - 0%", index = 0 },
    { name = "All - 85%", index = 85 },
    { name = "All - 100%", index = 100 },
    { name = "2.55mil Payout", index = -1 },
}

local presetNames = {}
for _, preset in ipairs(Presets) do
    table.insert(presetNames, preset.name)
end
local sPresetIndex = 0

SN_Doomsday:Custom(function()
    ImGui.Text("Presets:")
    ImGui.SetNextItemWidth(170)
    local nIndex, changed = ImGui.Combo("##DoomsdayPreset", sPresetIndex, presetNames, #presetNames)
    if changed then
        sPresetIndex = nIndex
        local selected = Presets[sPresetIndex + 1]
        local cutValue = selected.index
        if cutValue == -1 then
            cutValue = SetDoomsdayMaxPayout() or 0
        end
        if dmsdyCut1 then
            dmsdyCut1:set_value(cutValue)
        end
        if dmsdyCut2 then
            dmsdyCut2:set_value(cutValue)
        end
        if dmsdyCut3 then
            dmsdyCut3:set_value(cutValue)
        end
        if dmsdyCut4 then
            dmsdyCut4:set_value(cutValue)
        end
    end
end)

SN_Doomsday:Button("Apply Cuts", function()
    ScriptGlobal(DCg1):set_int(dmsdyCut1:get_value())
    ScriptGlobal(DCg2):set_int(dmsdyCut2:get_value())
    ScriptGlobal(DCg3):set_int(dmsdyCut3:get_value())
    ScriptGlobal(DCg4):set_int(dmsdyCut4:get_value())
    notify.info("Doomsday Heist", "Cuts should've been applied")
end)

-- Lives Editor for Doomsday Heist
local livesValueDoomsday = 3
SN_Doomsday:Box("Team Lives")
SN_Doomsday:Custom(function()
    livesValueDoomsday, __ = ImGui.InputInt("##DoomsdayLives", livesValueDoomsday)
    if ImGui.Button("Set Lives##Doomsday") then
        if livesValueDoomsday < 1 then
            notify.info("Doomsday Heist", "Lives must be at least 1!")
        else
            if scripts.is_active(FMC) then ScriptLocal(FMC, DDLIVESL):set_int(livesValueDoomsday) end
            notify.info("Doomsday Heist", "Team lives set to " .. livesValueDoomsday)
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Default is 3. Infinite team lives for the heist (set to 999999 for unlimited)")
    end
end)

SN_Doomsday:Box("Extras")
SN_Doomsday:Button("By Act III Pass hack", function()
    if scripts.is_active(FMC) then ScriptLocal(FMC, DDSHl):set_int(3) end
end)
SN_Doomsday:Button("Solo Launch", function()
    if (scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) ~= nil then
        if (scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) ~= 0 then
            if (scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) > 1 then
                ScriptLocal(FMMCL, HGGs2):set_int(1)
                ScriptGlobal(HEIST_SOLO_LAUNCH_BASE + 4 + 1 + ((scripts.is_active(FMMCL) and ScriptLocal(FMMCL, HGGs1):get_int() or 0) * 95) + 75):set_int(1)
            end
            ScriptGlobal(HGLs1):set_int(1)
            ScriptGlobal(HGLs2):set_int(1)
            ScriptGlobal(HGLs3):set_int(1)
            ScriptGlobal(HGLs4):set_int(0)
        end
    end
end)
SN_Doomsday:Button("Force Ready", function()
    script.run_in_callback(function()
        network.force_script_host(util.joaat(FMC))
        script.yield(1000)
        for i = 0, 3 do
            ScriptGlobal(DDFRg + 1 + (i * 321) + 43 + 11 + 1 + i):set_int(1)
        end
        notify.info("Doomsday Heist", "Everyone should've been forced ready")
    end)
end)
SN_Doomsday:Button("Skip Cutscene", SkipCutscene)

SN_Doomsday:Box("Instant Finish")
SN_Doomsday:Text("Instant Finish: use Act I/II for Data Breaches/Bogdan, Act III for Doomsday Scenario. HOST only. Wait for area to load or you will fail/crash.")
SN_Doomsday:Button("Instant Finish (Act I/II)", function()
    -- FIX Bug#1: old single button mixed Act I/II (80) + Act III (150) values and never
    -- took script host -> teleport to unloaded interior -> crash/fail.
    -- Act I/II needs 12 + 80 + 99999 + 99999 (no 150, no passed-flag).
    script.run_in_callback(function()
        if not scripts.is_active(FMC) then
            notify.info("Doomsday Heist", "Start the finale first!")
            return
        end
        network.force_script_host(util.joaat(FMC))
        script.yield(1000)
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF1):set_int(12) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF5):set_int(80) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF3):set_int(99999) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF4):set_int(99999) end
        notify.info("Doomsday Heist", "Act I/II should be finished. Wait for load, do NOT skip too fast.")
    end)
end)
SN_Doomsday:Button("Instant Finish (Act III Scenario)", function()
    -- FIX Bug#1 Act III: needs 12 + 150 + 5 (passed flag DDIF6) + 99999 + 99999 (no 80).
    -- Missing DDIF6=5 was the main cause of End-of-World teleport/fail.
    script.run_in_callback(function()
        if not scripts.is_active(FMC) then
            notify.info("Doomsday Heist", "Start the Doomsday Scenario finale first!")
            return
        end
        network.force_script_host(util.joaat(FMC))
        script.yield(1000)
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF1):set_int(12) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF2):set_int(150) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF6):set_int(5) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF3):set_int(99999) end
        if scripts.is_active(FMC) then ScriptLocal(FMC, DDIF4):set_int(99999) end
        notify.info("Doomsday Heist", "Act III should be finished. Wait 10-20s for Mount Chiliad bunker to stream!")
    end)
end)
SN_Doomsday:Text("If teleport fails/loads forever: use Skip Checkpoint instead, or walk to yellow marker before pressing.")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Salvage Yard", function()
local SalvageYard = {
    robberies = {
        { name = "Cargo Ship", index = 0 },
        { name = "Gangbanger", index = 1 },
        { name = "Duggan", index = 2 },
        { name = "Podium", index = 3 },
        { name = "McTony", index = 4 },
    },
    vehicles = {
        { name = "LM87", index = 1 },
        { name = "Cinquemila", index = 2 },
        { name = "Autarch", index = 3 },
        { name = "Tigon", index = 4 },
        { name = "Champion", index = 5 },
        { name = "10F", index = 6 },
        { name = "SM722", index = 7 },
        { name = "Omnis e-GT", index = 8 },
        { name = "Growler", index = 9 },
        { name = "Deity", index = 10 },
        { name = "Itali RSX", index = 11 },
        { name = "Coquette D10", index = 12 },
        { name = "Jubilee", index = 13 },
        { name = "Astron", index = 14 },
        { name = "Comet S2 Cabr.", index = 15 },
        { name = "Torero", index = 16 },
        { name = "Cheetah Classic", index = 17 },
        { name = "Turismo Classic", index = 18 },
        { name = "Infernus Classic", index = 19 },
        { name = "Stafford", index = 20 },
        { name = "GT500", index = 21 },
        { name = "Viseris", index = 22 },
        { name = "Mamba", index = 23 },
        { name = "Coquette Black.", index = 24 },
        { name = "Stinger GT", index = 25 },
        { name = "Z-Type", index = 26 },
        { name = "Broadway", index = 27 },
        { name = "Vigero ZX", index = 28 },
        { name = "Buffalo STX", index = 29 },
        { name = "Ruston", index = 30 },
        { name = "Gauntl. Hellfire", index = 31 },
        { name = "Dominator GTT", index = 32 },
        { name = "Roosevelt Valor", index = 33 },
        { name = "Swinger", index = 34 },
        { name = "Stirling GT", index = 35 },
        { name = "Omnis", index = 36 },
        { name = "Tropos Rallye", index = 37 },
        { name = "Jugular", index = 38 },
        { name = "Patriot Mil-Spec", index = 39 },
        { name = "Toros", index = 40 },
        { name = "Caracara 4x4", index = 41 },
        { name = "Sentinel Classic", index = 42 },
        { name = "Weevil", index = 43 },
        { name = "Blista Kanjo", index = 44 },
        { name = "Eudora", index = 45 },
        { name = "Kamacho", index = 46 },
        { name = "Hellion", index = 47 },
        { name = "Ellie", index = 48 },
        { name = "Hermes", index = 49 },
        { name = "Hustler", index = 50 },
        { name = "Turismo Om.", index = 51 },
        { name = "Buffalo EVX", index = 52 },
        { name = "Itali GTO St.", index = 53 },
        { name = "Virtue", index = 54 },
        { name = "Ignus", index = 55 },
        { name = "Zentorno", index = 56 },
        { name = "Neon", index = 57 },
        { name = "Furia", index = 58 },
        { name = "Zorrusso", index = 59 },
        { name = "Thrax", index = 60 },
        { name = "Vagner", index = 61 },
        { name = "Panthere", index = 62 },
        { name = "Itali GTO", index = 63 },
        { name = "S80RR", index = 64 },
        { name = "Tyrant", index = 65 },
        { name = "Entity MT", index = 66 },
        { name = "Torero XO", index = 67 },
        { name = "Neo", index = 68 },
        { name = "Corsita", index = 69 },
        { name = "Paragon R", index = 70 },
        { name = "Franken Stange", index = 71 },
        { name = "Comet Safari", index = 72 },
        { name = "FR36", index = 73 },
        { name = "Hotring Everon", index = 74 },
        { name = "Komoda", index = 75 },
        { name = "Tailgater S", index = 76 },
        { name = "Jester Classic", index = 77 },
        { name = "Jester RR", index = 78 },
        { name = "Euros", index = 79 },
        { name = "ZR350", index = 80 },
        { name = "Cypher", index = 81 },
        { name = "Dominator ASP", index = 82 },
        { name = "Baller ST-D", index = 83 },
        { name = "Casco", index = 84 },
        { name = "Drift Yosemite", index = 85 },
        { name = "Everon", index = 86 },
        { name = "Penumbra FF", index = 87 },
        { name = "V-STR", index = 88 },
        { name = "Dominator GT", index = 89 },
        { name = "Schlagen GT", index = 90 },
        { name = "Cavalcade XL", index = 91 },
        { name = "Clique", index = 92 },
        { name = "Boor", index = 93 },
        { name = "Sugoi", index = 94 },
        { name = "Greenwood", index = 95 },
        { name = "Brigham", index = 96 },
        { name = "Issi Rally", index = 97 },
        { name = "Seminole Fr.", index = 98 },
        { name = "Kanjo SJ", index = 99 },
        { name = "Previon", index = 100 },
    },
    modifications = {
        { name = "Version 1", index = 0 },
        { name = "Version 2", index = 1 },
        { name = "Version 3", index = 2 },
        { name = "Version 4", index = 3 },
        { name = "Version 5", index = 4 },
    },
    keeps = {
        { name = "Can't Claim", index = 0 },
        { name = "Can Claim", index = 1 },
    },
    tunables = {
        robbery_slot1_type = 1152433341,
        robbery_slot2_type = 852564222,
        robbery_slot3_type = 552662330,
        vehicle_slot1_type = -1012732012,
        vehicle_slot1_value = -1699398139,
        vehicle_slot1_cankeep = -1700733442,
        vehicle_slot2_type = 1366330161,
        vehicle_slot2_value = -1997104504,
        vehicle_slot2_cankeep = -1547046832,
        vehicle_slot3_type = 1806057372,
        vehicle_slot3_value = -1704051341,
        vehicle_slot3_cankeep = 1830093543,
        cooldown_weekly = "SALV23_VEH_ROBBERY_WEEK_ID",
    },
    salvage_missions = {
        { script = "fm_content_vehrob_cargo_ship", step1 = 7187 + 1, step2 = 7332 + 1249 },
        { script = "fm_content_vehrob_police", step1 = 9013 + 1, step2 = 9146 + 1305 },
        { script = "fm_content_vehrob_arena", step1 = 7914 + 1, step2 = 8034 + 1314 },
        { script = "fm_content_vehrob_casino_prize", step1 = 9193 + 1, step2 = 9330 + 1258 },
        { script = "fm_content_vehrob_submarine", step1 = 6220 + 1, step2 = 6358 + 1159 },
    },
}

local slot_names = { "Slot 1", "Slot 2", "Slot 3" }
local slot1 = {
    robbery_index = 0,
    vehicle_index = 0,
    mod_index = 0,
    keep_index = 0,
}
local slot2 = {
    robbery_index = 0,
    vehicle_index = 0,
    mod_index = 0,
    keep_index = 0,
}
local slot3 = {
    robbery_index = 0,
    vehicle_index = 0,
    mod_index = 0,
    keep_index = 0,
}

local robbery_names = {}
for _, robbery in ipairs(SalvageYard.robberies) do
    table.insert(robbery_names, robbery.name)
end

local vehicle_names = {}
for _, vehicle in ipairs(SalvageYard.vehicles) do
    table.insert(vehicle_names, vehicle.name)
end

local mod_names = {}
for _, mod in ipairs(SalvageYard.modifications) do
    table.insert(mod_names, mod.name)
end

local keep_names = {}
for _, keep in ipairs(SalvageYard.keeps) do
    table.insert(keep_names, keep.name)
end
local ssIndex = 0
local SN_Salvage = HeistsDataEditorMenu:Tab("Salvage Yard")
SN_Salvage:Box("Information", 0) -- full width, above everything else
SN_Salvage:Text("Max Payout 2.100.000$")
SN_Salvage:Text("Min Cooldown ≈ 15-20 minutes")
SN_Salvage:Box("Robbery Slots")
SN_Salvage:Custom(function()
    local nIndex, changed = ImGui.Combo("##Slot", ssIndex, slot_names, #slot_names)
    if changed then
        ssIndex = nIndex
    end
    local currSlot = ssIndex + 1
    local slots = { slot1, slot2, slot3 }
    local slot = slots[currSlot]

    local nIndex, changed = ImGui.Combo("Robbery", slot.robbery_index, robbery_names, #robbery_names)
    if changed then
        slot.robbery_index = nIndex
        notify.info("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " robbery: " .. robbery_names[slot.robbery_index + 1])
    end

    nIndex, changed = ImGui.Combo("Vehicle", slot.vehicle_index, vehicle_names, #vehicle_names)
    if changed then
        slot.vehicle_index = nIndex
        notify.info("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " vehicle: " .. vehicle_names[slot.vehicle_index + 1])
    end

    nIndex, changed = ImGui.Combo("Modification", slot.mod_index, mod_names, #mod_names)
    if changed then
        slot.mod_index = nIndex
        notify.info("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " modification: " .. mod_names[slot.mod_index + 1])
    end

    nIndex, changed = ImGui.Combo("Status", slot.keep_index, keep_names, #keep_names)
    if changed then
        slot.keep_index = nIndex
        notify.info("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " status: " .. keep_names[slot.keep_index + 1])
    end

    if ImGui.Button("Apply Changes") then
        local robbery = SalvageYard.robberies[slot.robbery_index + 1].index
        local vehicle = SalvageYard.vehicles[slot.vehicle_index + 1].index
        local mod = SalvageYard.modifications[slot.mod_index + 1].index
        local keep = SalvageYard.keeps[slot.keep_index + 1].index
        tunables.set_int(SalvageYard.tunables["robbery_slot" .. currSlot .. "_type"], robbery)
        tunables.set_int(SalvageYard.tunables["vehicle_slot" .. currSlot .. "_type"], vehicle + mod * 100)
        tunables.set_int(SalvageYard.tunables["vehicle_slot" .. currSlot .. "_cankeep"], keep)
        if scripts.is_active("vehrob_planning") then ScriptLocal("vehrob_planning", SYRl1):set_int(2) end
        notify.info("Salvage Yard", slot_names[ssIndex + 1] .. " changes should've been applied")
    end
    if ImGui.Button("Make Available") then
        stats.set_int(MPX() .. "SALV23_VEHROB_STATUS" .. (currSlot - 1), 0)
        if scripts.is_active("vehrob_planning") then ScriptLocal("vehrob_planning", SYRl1):set_int(2) end
        notify.info("Salvage Yard", slot_names[ssIndex + 1] .. " should've been made Available")
    end
end)

SN_Salvage:Box("Preps")
SN_Salvage:Button("Complete Preps", function()
    stats.set_int(MPX() .. "SALV23_GEN_BS", -1)
    stats.set_int(MPX() .. "SALV23_SCOPE_BS", -1)
    stats.set_int(MPX() .. "SALV23_FM_PROG", -1)
    stats.set_int(MPX() .. "SALV23_INST_PROG", -1)
    if scripts.is_active("vehrob_planning") then ScriptLocal("vehrob_planning", SYRl1):set_int(2) end
    notify.info("Salvage Yard", "Preps should've been completed")
end)
SN_Salvage:Button("Reset Preps", function()
    stats.set_int(MPX() .. "SALV23_GEN_BS", 0)
    stats.set_int(MPX() .. "SALV23_SCOPE_BS", 0)
    stats.set_int(MPX() .. "SALV23_FM_PROG", 0)
    stats.set_int(MPX() .. "SALV23_INST_PROG", 0)
    if scripts.is_active("vehrob_planning") then ScriptLocal("vehrob_planning", SYRl1):set_int(2) end
    notify.info("Salvage Yard", "Preps should've been reset")
end)
SN_Salvage:Button("Reload Screen", function()
    if scripts.is_active("vehrob_planning") then ScriptLocal("vehrob_planning", SYRl1):set_int(2) end
    notify.info("Salvage Yard", "Screen should've been reloaded")
end)
SN_Salvage:Button("Skip Weekly Cooldown", function()
    tunables.set_int(SalvageYard.tunables.cooldown_weekly, stats.get_int(MPX() .. "SALV23_WEEK_SYNC") + 1)
    if scripts.is_active("vehrob_planning") then ScriptLocal("vehrob_planning", SYRl1):set_int(2) end
    notify.info("Salvage Yard", "Cooldown should've been skipped")
end)

SN_Salvage:Box("Payout")
local sell_value_slot1 = SN_Salvage:InputInt("Sell Value Slot 1")
sell_value_slot1:set_value(0)
local sell_value_slot2 = SN_Salvage:InputInt("Sell Value Slot 2")
sell_value_slot2:set_value(0)
local sell_value_slot3 = SN_Salvage:InputInt("Sell Value Slot 3")
sell_value_slot3:set_value(0)
SN_Salvage:Button("Apply Sell Values", function()
    tunables.set_int(SalvageYard.tunables.vehicle_slot1_value, sell_value_slot1:get_value())
    tunables.set_int(SalvageYard.tunables.vehicle_slot2_value, sell_value_slot2:get_value())
    tunables.set_int(SalvageYard.tunables.vehicle_slot3_value, sell_value_slot3:get_value())
    if scripts.is_active("vehrob_planning") then ScriptLocal("vehrob_planning", SYRl1):set_int(2) end
    notify.info("Salvage Yard", "Sell values should've been applied")
end)

SN_Salvage:Box("Misc")
SN_Salvage:Button("Instant Finish", function()
    for _, mission in ipairs(SalvageYard.salvage_missions) do
        local value = (scripts.is_active(mission.script) and ScriptLocal(mission.script, mission.step1):get_int() or 0)
        if scripts.is_active(mission.script) then ScriptLocal(mission.script, mission.step1):set_int(bit.bor(value, bit.lshift(1, 11))) end
        if scripts.is_active(mission.script) then ScriptLocal(mission.script, mission.step2):set_int(2) end
    end
    notify.info("Salvage Yard", "Heist should've been finished")
end)
SN_Salvage:Button("Instant Sell", function()
    local player_ped = PLAYER.PLAYER_PED_ID()
    PED.SET_PED_COORDS_KEEP_VEHICLE(player_ped, 1169.0, -2976.0, 6.0)
    notify.info("Salvage Yard", "Sell mission should've been finished")
end)
SN_Salvage:Button("Skip Cutscene", SkipCutscene)
SN_Salvage:Button("Collect Safe", function()
    notify.info("Salvage Yard", tostring(CollectSafeRemote(4) and "Safe money should've been collected" or "Salvage Yard safe is empty"))
end, "Enhanced only: collects the Salvage Yard safe from anywhere.")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Kortz Center Heist

-- Glass case display info
glassCaseNames = {
    [0] = "Venus d'Algernon",
    [1] = "Gemstone",
    [2] = "Horse",
    [3] = "Coquard Carcanet",
    [4] = "Memento Non Mori",
}
glassCaseTypes = {
    [0] = "Tall Glass Case",
    [1] = "Tall Glass Case",
    [2] = "Horizontal Glass Case",
    [3] = "Horizontal Glass Case",
    [4] = "Horizontal Glass Case",
}

end)

Section("Kortz", function()
KortzCenterHeistMenu = HeistsDataEditorMenu:Tab("Kortz")
KortzCenterHeistMenu:Box("Information", 0) -- full width, above everything else
KortzCenterHeistMenu:Text("Max Payout 2.117.500$")
KortzCenterHeistMenu:Text("Min Cooldown ≈ 15-20 minutes")

-- State
k26_heist_target = 0
selectedPayoutTarget = 0
autoHacks = false
dataCrackTriggered = false
fingerprintTriggered = false
vaultDoorTriggered = false
heistWasActive = false
bagSizeValue = 100
weeklyMultiplierValue = 4.0
livesValue = 3
kortzLootTakeValue = 0

-- Target names
local targetShortNames = {
    "La Dernière Débauche", "Hare Oneself Think", "The Downfall of Rome",
    "Brother Brother", "A Cast of Characters", "Gone To Seed",
    "True Love", "Breathless", "Consumato", "I Hear Voices",
    "Winter, Nowhere", "Pearl Necklace", "Chat on Fruit", "Pumpkin",
    "Twindifference", "Stacks Study V", "I, Fruit", "To Beat About Bush",
    "In Excess Success", "Juiced", "Winding Road Home", "Teckels",
    "Trust", "Until Death", "What Are Melons?", "Outcome Endeavour", "Mi O Melee",
}

-- Base payouts
local targetBasePayouts = {
    481250, 304500, 305000, 305500, 306000, 306500, 307000,
    307500, 308000, 308500, 309000, 309500, 310000, 310500,
    311000, 311500, 312000, 312500, 313000, 313500, 314000,
    314500, 315000, 315500, 316000, 365000, 317000,
}

k26Targets = {}
for i = 1, 27 do
    k26Targets[i] = { name = targetShortNames[i], id = i - 1, payout = targetBasePayouts[i], index = i }
end

targetNames = {}
for _, target in ipairs(k26Targets) do
    table.insert(targetNames, target.name)
end

local payoutModifiers = {}
local payoutCustomValues = {}
for i = 1, 27 do
    payoutModifiers[i] = 1.0
    payoutCustomValues[i] = 0
end

-- Helper functions
function isKortzHeistActive()
    return scripts.is_active(FMCV3)
end

function getCurrentBagSize()
    return ScriptGlobal(KCBGL):get_int()
end

function getCurrentLives()
    return (scripts.is_active(FMCV3) and ScriptLocal(FMCV3, KCLIVESL):get_int() or 0)
end

-- Set payout to Global_262145.f_38004 + (index + 1)
function setPayout(index, value)
    ScriptGlobal(KCPAYOUT_BASE + index + 1):set_int(value)
end

function EnableSoloSecondaryTargets()
    local target_indices = { 0, 1, 5, 6, 7, 20, 21 }
    for _, i in ipairs(target_indices) do
        local base = KCSECONDARY_BASE + (i * 333)
        ScriptGlobal(base + 68):set_int(0)
        ScriptGlobal(base + 143):set_int(0)
    end
    notify.info("Kortz Center", "Solo secondary targets enabled")
end

function SetKortzTarget(target_index)
    stats.set_int(MPX() .. "K26_HEIST_TARGET", target_index)
    if scripts.is_active(KORTZPL) then ScriptLocal(KORTZPL, KCBRL):set_int(2) end
    notify.info("Kortz Center Heist", "Target set to: " .. targetShortNames[target_index + 1])
end

function KortzReloadBoard()
    if scripts.is_active(KORTZPL) then ScriptLocal(KORTZPL, KCBRL):set_int(2) end
    notify.info("Kortz Center Heist", "Planning board reloaded")
end

function KortzSkipCooldown()
    ScriptGlobal(KCCDG):set_int(0)
    ScriptGlobal(KCCD2G):set_int(0)
    notify.info("Kortz Center Heist", "Cooldowns reset to 0")
end

-- Smooth rainbow fade info helper
function RainbowInfo(tooltip)
    local r, g, b, _ = rainbow_color(os.clock())
    ImGui.TextColored(r, g, b, 1.0, "[?]")
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip(tooltip)
    end
end

-- Toggle dropdown helper
function ToggleBitDropdown(label, stat_name, bitmask, tooltip)
    local current = stats.get_int(MPX() .. stat_name)
    local is_set = bit.band(current, bitmask) ~= 0
    local options = { "Not Done", "Done" }
    local idx = is_set and 1 or 0
    local new_idx, changed = ImGui.Combo(label, idx, options, 2)
    if changed then
        if new_idx == 1 then
            stats.set_int(MPX() .. stat_name, bit.bor(current, bitmask))
            notify.info("Kortz Center Heist", label .. " completed")
        else
            stats.set_int(MPX() .. stat_name, bit.band(current, bit.bnot(bitmask)))
            notify.info("Kortz Center Heist", label .. " undone")
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip(tooltip)
    end
end

-- Auto hack functions
local function KortzSkipDataCrack()
    if isKortzHeistActive() then
        for b = 0, 7 do
            if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCDCL + 1 + (b * 4)):set_int(1) end
        end
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCDCL):set_int(1) end
        notify.info("Kortz Center Cracker", "Data crack bypassed")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzSkipFingerprint()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCFHL):set_int(5) end
        notify.info("Kortz Center Cracker", "Fingerprint scanner bypassed")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzSkipVaultDoor()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCVLL):set_int(5) end
        notify.info("Kortz Center Cracker", "Vault door bypassed")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzAutoAccessCode()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCAC_BASE + (0 * 2)):set_int(0) end
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCAC_BASE + (1 * 2)):set_int(0) end
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCAC_BASE + (2 * 2)):set_int(0) end
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 237, 1.0)
        notify.info("Kortz Center Cracker", "Access code entered: 00-00-00")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzDisableLasers()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCLGL):set_int(4294784) end
        ScriptGlobal(KCLDG):set_int(1)
        notify.info("Kortz Center Cracker", "Laser grid neutralized")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzSetLasersEasy()
    if scripts.is_active(FMMLASERS) then ScriptLocal(FMMLASERS, KCLDIF1):set_int(1) end
    if scripts.is_active(FMMLASERS) then ScriptLocal(FMMLASERS, KCLDIF2):set_int(0) end
    notify.info("Kortz Center Cracker", "Lasers set to Easy")
end

local function KortzSetLasersHard()
    if scripts.is_active(FMMLASERS) then ScriptLocal(FMMLASERS, KCLDIF1):set_int(0) end
    if scripts.is_active(FMMLASERS) then ScriptLocal(FMMLASERS, KCLDIF2):set_int(1) end
    notify.info("Kortz Center Cracker", "Lasers set to Hard")
end

local function KortzNoDamageLasers()
    if scripts.is_active(FMMLASERS) then ScriptLocal(FMMLASERS, KCNoDmg):set_int(1) end
    notify.info("Kortz Center Cracker", "No damage lasers enabled")
end

local function KortzSetLootTake(value)
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCLootTake):set_int(value) end
        notify.info("Kortz Center Cracker", "Loot take set to " .. value)
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

function GetKortzTakeText()
    if isKortzHeistActive() then
        return "Current Take: $" .. tostring((scripts.is_active(FMCV3) and ScriptLocal(FMCV3, KCLootTake):get_int() or 0))
    end
    return "Current Take: N/A (start heist)"
end

local function CutVenus()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCCGL_BASE + (0 * 13) + KCCGL_OFFSET):set_float(100.0) end
        notify.info("Kortz Center Cracker", "Venus d'Algernon cut")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function CutGemstone()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCCGL_BASE + (1 * 13) + KCCGL_OFFSET):set_float(100.0) end
        notify.info("Kortz Center Cracker", "Gemstone cut")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function CutHorse()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCCGL_BASE + (2 * 13) + KCCGL_OFFSET):set_float(100.0) end
        notify.info("Kortz Center Cracker", "Horse cut")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function CutCoquard()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCCGL_BASE + (3 * 13) + KCCGL_OFFSET):set_float(100.0) end
        notify.info("Kortz Center Cracker", "Coquard Carcanet cut")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function CutMemento()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCCGL_BASE + (4 * 13) + KCCGL_OFFSET):set_float(100.0) end
        notify.info("Kortz Center Cracker", "Memento Non Mori cut")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzCutAllGlass()
    if isKortzHeistActive() then
        for i = 0, 4 do
            if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCCGL_BASE + (i * 13) + KCCGL_OFFSET):set_float(100.0) end
        end
        notify.info("Kortz Center Cracker", "All glass cases cut")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzTakePrimary()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCPT_STATE):set_int(15) end
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCPT_STATE):set_int(17) end
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 237, 1.0)
        notify.info("Kortz Center Cracker", "Primary target acquired")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzTakeSecondary()
    if isKortzHeistActive() then
        if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCST_STATE):set_int(3) end
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 219, 1.0)
        notify.info("Kortz Center Cracker", "Secondary target secured")
    else
        notify.info("Kortz Center Cracker", "Heist not active")
    end
end

-- Auto hack loop
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if not network.is_session_started()
            or scripts.is_active("maintransition") then
            return
        end
    
        local heistActive = isKortzHeistActive()
    
        if not heistActive and heistWasActive then
            dataCrackTriggered = false
            fingerprintTriggered = false
            vaultDoorTriggered = false
            heistWasActive = false
            script.yield(500)
            return
        end
    
        heistWasActive = heistActive
    
        if not heistActive or not autoHacks then
            script.yield(500)
            return
        end
    
        if not dataCrackTriggered then
            local isActive = false
            for b = 0, 7 do
                if (scripts.is_active(FMCV3) and ScriptLocal(FMCV3, KCDCL + 1 + (b * 4)):get_int() or 0) == 0 then
                    isActive = true
                    break
                end
            end
            if isActive then
                for b = 0, 7 do
                    if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCDCL + 1 + (b * 4)):set_int(1) end
                end
                if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCDCL):set_int(1) end
                dataCrackTriggered = true
                notify.info("Kortz Center Cracker", "Auto: Data crack bypassed")
                script.yield(1000)
                return
            end
        end
    
        if not fingerprintTriggered then
            local val = (scripts.is_active(FMCV3) and ScriptLocal(FMCV3, KCFHL):get_int() or 0)
            if val ~= nil and val >= 0 and val <= 4 then
                if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCFHL):set_int(5) end
                fingerprintTriggered = true
                notify.info("Kortz Center Cracker", "Auto: Fingerprint bypassed")
                script.yield(1000)
                return
            end
        end
    
        if not vaultDoorTriggered then
            local val = (scripts.is_active(FMCV3) and ScriptLocal(FMCV3, KCVLL):get_int() or 0)
            if val ~= nil and val >= 0 and val <= 4 then
                if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCVLL):set_int(5) end
                vaultDoorTriggered = true
                notify.info("Kortz Center Cracker", "Auto: Vault door bypassed")
                script.yield(1000)
                return
            end
        end
    
        script.yield(100)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

-- MAIN UI

KortzCenterHeistMenu:Box("Status")
KortzCenterHeistMenu:Custom(function()
    local heistActive = isKortzHeistActive()
    if heistActive then
        ImGui.TextColored(0.0, 1.0, 0.0, 1.0, "HEIST IS ACTIVE")
    else
        ImGui.TextColored(1.0, 0.5, 0.0, 1.0, "HEIST NOT ACTIVE")
    end

    -- PRIMARY TARGET
end)
KortzCenterHeistMenu:Box("Primary Target")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("Select the main painting you want to steal.\nClick SET TARGET to apply it.")

    local nIndex, changed = ImGui.Combo("##PrimaryTarget", k26_heist_target, targetShortNames, #targetShortNames)
    if changed then
        k26_heist_target = nIndex
    end

    if ImGui.Button("SET TARGET") then
        SetKortzTarget(k26_heist_target)
        selectedPayoutTarget = k26_heist_target
    end
    ImGui.Text("Selected: " .. targetShortNames[k26_heist_target + 1])

    -- PAYOUT SETTINGS
end)
KortzCenterHeistMenu:Box("Payout Settings")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("Adjust the payout for the selected target.")

    selectedPayoutTarget = k26_heist_target
    local targetIdx = selectedPayoutTarget + 1

    if targetIdx >= 1 and targetIdx <= 27 then
        ImGui.Text("Target: " .. targetShortNames[targetIdx])
        ImGui.TextColored(0.0, 1.0, 0.0, 1.0, "Payout: $" .. string.format("%.0f", targetBasePayouts[targetIdx]))
        ImGui.Text(GetKortzTakeText())

        ImGui.Dummy(0, 5)
        ImGui.Text("Multiplier:")
        payoutModifiers[targetIdx], __ = ImGui.InputFloat("##Multiplier" .. targetIdx, payoutModifiers[targetIdx], 0.1, 0.5, "%.1f")
        ImGui.Text("Custom Value:")
        payoutCustomValues[targetIdx], __ = ImGui.InputInt("##CustomValue" .. targetIdx, payoutCustomValues[targetIdx], 1000, 10000)
        ImGui.Dummy(0, 5)

        if ImGui.Button("Apply Multiplier") then
            local newPayout = math.floor(targetBasePayouts[targetIdx] * payoutModifiers[targetIdx])
            setPayout(targetIdx - 1, newPayout)
            KortzReloadBoard()
            notify.info("Kortz Center Heist", "Payout set to $" .. string.format("%.0f", newPayout))
        end
        if ImGui.Button("Apply Custom Value") then
            if payoutCustomValues[targetIdx] > 0 then
                setPayout(targetIdx - 1, payoutCustomValues[targetIdx])
                KortzReloadBoard()
                notify.info("Kortz Center Heist", "Payout set to $" .. string.format("%.0f", payoutCustomValues[targetIdx]))
            end
        end
        if ImGui.Button("Reset This Target") then
            setPayout(targetIdx - 1, targetBasePayouts[targetIdx])
            KortzReloadBoard()
            payoutModifiers[targetIdx] = 1.0
            payoutCustomValues[targetIdx] = 0
            notify.info("Kortz Center Heist", "Payout reset to base")
        end
    end

    -- GENERAL SETTINGS
end)
KortzCenterHeistMenu:Box("Bag Size")
KortzCenterHeistMenu:Custom(function()
    local currentBag = getCurrentBagSize()
    ImGui.Text("Bag Capacity: " .. currentBag)
    bagSizeValue, __ = ImGui.InputInt("##BagSize", bagSizeValue)
    if ImGui.Button("Set Bag Size") then
        if bagSizeValue < 0 or bagSizeValue > 10000 then
            notify.info("Kortz Center Heist", "Bag size must be 0-10000.")
        else
            ScriptGlobal(KCBGL):set_int(bagSizeValue)
            notify.info("Kortz Center Heist", "Bag capacity set to " .. bagSizeValue)
        end
    end
end)
KortzCenterHeistMenu:Box("Team Lives")
KortzCenterHeistMenu:Custom(function()
    local currentLives = getCurrentLives()
    ImGui.Text("Team Lives: " .. currentLives)
    livesValue, __ = ImGui.InputInt("##Lives", livesValue)
    if ImGui.Button("Set Lives") then
        if livesValue < 1 then
            notify.info("Kortz Center Heist", "Lives must be at least 1.")
        elseif livesValue > 999999 then
            notify.info("Kortz Center Heist", "Lives value too high.")
        elseif not scripts.is_active(FMCV3) then
            notify.info("Kortz Center Heist", "Mission script not active.")
        else
            if scripts.is_active(FMCV3) then ScriptLocal(FMCV3, KCLIVESL):set_int(livesValue) end
            notify.info("Kortz Center Heist", "Team lives set to " .. livesValue)
        end
    end
end)
KortzCenterHeistMenu:Box("Weekly Multiplier")
KortzCenterHeistMenu:Custom(function()
    ImGui.Text("Weekly Bonus Multiplier:")
    weeklyMultiplierValue, __ = ImGui.InputFloat("##WeeklyMultiplier", weeklyMultiplierValue)
    if ImGui.Button("Set Weekly Multiplier") then
        ScriptGlobal(KCWMG):set_float(weeklyMultiplierValue)
        notify.info("Kortz Center Heist", "Weekly multiplier set to " .. weeklyMultiplierValue .. "x")
    end
end)
KortzCenterHeistMenu:Box("Difficulty")
KortzCenterHeistMenu:Custom(function()
    local hard_stat = stats.get_int(MPX() .. "K26_GENERAL_BS")
    local hard_active = bit.band(hard_stat, bit.lshift(1, 28)) ~= 0
    if hard_active then
        ImGui.TextColored(1.0, 0.3, 0.3, 1.0, "HARD MODE: ACTIVE")
    else
        ImGui.TextColored(0.0, 1.0, 0.0, 1.0, "NORMAL MODE: ACTIVE")
    end

    if ImGui.Button("Hard Mode") then
        stats.set_int(MPX() .. "K26_GENERAL_BS", bit.bor(stats.get_int(MPX() .. "K26_GENERAL_BS"), bit.lshift(1, 28)))
        KortzReloadBoard()
        notify.info("Kortz Center Heist", "Hard Mode enabled")
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Enable Hard Mode")
    end
    ImGui.SameLine()
    if ImGui.Button("Normal Mode") then
        stats.set_int(MPX() .. "K26_GENERAL_BS", bit.band(stats.get_int(MPX() .. "K26_GENERAL_BS"), bit.bnot(bit.lshift(1, 28))))
        KortzReloadBoard()
        notify.info("Kortz Center Heist", "Normal Mode enabled")
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Enable Normal Mode")
    end
end)
KortzCenterHeistMenu:Box("Misc")
KortzCenterHeistMenu:Custom(function()
    if ImGui.Button("Skip Cooldown") then
        KortzSkipCooldown()
    end
    if ImGui.Button("Unlock All Paintings") then
        stats.set_int(MPX() .. "K26_TARGETS_OWNED_BS", -1)
        notify.info("Kortz Center Heist", "All paintings unlocked")
    end

    -- HIGH PRIORITY
end)
KortzCenterHeistMenu:Box("High Priority Preps")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("These preps make the heist much easier.\nStrongly recommended for a smooth run.")

    ToggleBitDropdown("Unmarked Weapons", "K26_ROBBERY_PROG", 128, "Weapons that can't be traced")
    ToggleBitDropdown("Getaway Vehicle", "K26_ROBBERY_PROG", 256, "Armored getaway vehicle")
    ToggleBitDropdown("Guard Routes", "K26_GENERAL_BS", 32, "Reveals guard patrol patterns")
    ToggleBitDropdown("Glass Cutter", "K26_GENERAL_BS", 64, "Tool for cutting display cases")
    ToggleBitDropdown("Power Drills", "K26_GENERAL_BS", 128, "Drills for certain locks")

    -- REQUIRED PREPS
end)
KortzCenterHeistMenu:Box("Required Preps")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("These are mandatory to start the heist.")

    local scope_current = stats.get_int(MPX() .. "K26_ROBBERY_PROG")
    local scope_done = bit.band(scope_current, 1) ~= 0
    local scope_idx = scope_done and 1 or 0
    local scope_new, scope_changed = ImGui.Combo("Scope Out Kortz Center", scope_idx, { "Not Done", "Done" }, 2)
    if scope_changed then
        if scope_new == 1 then
            stats.set_int(MPX() .. "K26_ROBBERY_PROG", bit.bor(scope_current, 1))
            stats.set_int(MPX() .. "K26_SCOPING_BS", -1)
            stats.set_int(MPX() .. "K26_POI_BS", -1)
            notify.info("Kortz Center Heist", "Scope Out completed")
        else
            stats.set_int(MPX() .. "K26_ROBBERY_PROG", bit.band(scope_current, bit.bnot(1)))
            notify.info("Kortz Center Heist", "Scope Out undone")
        end
    end

    ToggleBitDropdown("Alpha Mail Disguise", "K26_ROBBERY_PROG", 2, "Disguise to enter building")
    ToggleBitDropdown("Staff Key Card", "K26_ROBBERY_PROG", 8, "Access to staff areas")
    ToggleBitDropdown("Hacking Device", "K26_ROBBERY_PROG", 32, "Required for vault door")
    ToggleBitDropdown("Access Code", "K26_ROBBERY_PROG", 64, "Code for security terminal")

    -- OPTIONAL PREPS
end)
KortzCenterHeistMenu:Box("Optional Preps")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("Optional preps that can help but aren't required.")

    ToggleBitDropdown("Hazmat Suit", "K26_ROBBERY_PROG", 4, "Access to chemical area")
    ToggleBitDropdown("Tactical Equipment", "K26_ROBBERY_PROG", 16, "Body armor and gear")
    ToggleBitDropdown("Annihilator Stealth", "K26_ROBBERY_PROG", 512, "Stealth helicopter")
    ToggleBitDropdown("Manchez", "K26_ROBBERY_PROG", 1024, "Motorcycle")
    ToggleBitDropdown("EMP Charges", "K26_ROBBERY_PROG", 2048, "Disable electronics")
    ToggleBitDropdown("Guard Shipments", "K26_ROBBERY_PROG", 4096, "Weaken security")

    -- OPTIONAL UPGRADES
end)
KortzCenterHeistMenu:Box("Optional Upgrades")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("Extra upgrades for loadouts, entrances, and vehicles.")

    ToggleBitDropdown("Vault Keypad", "K26_GENERAL_BS", 16, "Bypass vault keypad")
    ToggleBitDropdown("EMP Charges (Upgrade)", "K26_GENERAL_BS", 256, "EMP upgrade")
    ToggleBitDropdown("Street Loadout", "K26_GENERAL_BS", 512, "Basic weapons")
    ToggleBitDropdown("Security Loadout", "K26_GENERAL_BS", 1024, "Better weapons")
    ToggleBitDropdown("Military Loadout", "K26_GENERAL_BS", 2048, "Top weapons")
    ToggleBitDropdown("Staff Entrance", "K26_GENERAL_BS", 4096, "Staff entry point")
    ToggleBitDropdown("Sewer", "K26_GENERAL_BS", 32768, "Sewer entry point")
    ToggleBitDropdown("Manhole Key Location", "K26_GENERAL_BS", 65536, "Find manhole key")
    ToggleBitDropdown("Red Manchez", "K26_GENERAL_BS", 131072, "Red motorcycle")
    ToggleBitDropdown("Blue Manchez", "K26_GENERAL_BS", 262144, "Blue motorcycle")
    ToggleBitDropdown("Green Manchez", "K26_GENERAL_BS", 524288, "Green motorcycle")
    ToggleBitDropdown("Yellow Manchez", "K26_GENERAL_BS", 1048576, "Yellow motorcycle")
    ToggleBitDropdown("Advanced Avionics", "K26_GENERAL_BS", 8388608, "Better helicopter")
    ToggleBitDropdown("Manhole Key", "K26_GENERAL_BS", 134217728, "Sewer access key")
    ToggleBitDropdown("Weak Guards", "K26_GENERAL_BS", -2147483648, "Easier guards")

    -- POINTS OF INTEREST
end)
KortzCenterHeistMenu:Box("Scoping")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("Scope all points of interest to unlock optional preps.")

    local poi_current = stats.get_int(MPX() .. "K26_POI_BS")
    local poi_idx = (poi_current == -1) and 1 or 0
    local poi_new, poi_changed = ImGui.Combo("Points of Interest Scoped", poi_idx, { "Not Done", "Done" }, 2)
    if poi_changed then
        stats.set_int(MPX() .. "K26_POI_BS", poi_new == 1 and -1 or 0)
        notify.info("Kortz Center Heist", tostring(poi_new == 1 and "POI scoped" or "POI unscoped"))
    end

    -- SECONDARY TARGETS

    local scop_current = stats.get_int(MPX() .. "K26_SCOPING_BS")
    local scop_idx = (scop_current == -1) and 1 or 0
    local scop_new, scop_changed = ImGui.Combo("All Secondary Targets Scoped", scop_idx, { "Not Done", "Done" }, 2)
    if scop_changed then
        stats.set_int(MPX() .. "K26_SCOPING_BS", scop_new == 1 and -1 or 0)
        notify.info("Kortz Center Heist", tostring(scop_new == 1 and "Secondary targets scoped" or "Secondary targets unscoped"))
    end

    -- QUICK ACTIONS
end)
KortzCenterHeistMenu:Box("Quick Actions")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("Complete all selections or reset to just show selected target.")

    if ImGui.Button("Complete All Selections") then
        local general_bits = -1
        general_bits = bit.band(general_bits, bit.bnot(bit.lshift(1, 28)))
        stats.set_int(MPX() .. "K26_GENERAL_BS", general_bits)
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", 65535)
        stats.set_int(MPX() .. "K26_SCOPING_BS", -1)
        stats.set_int(MPX() .. "K26_POI_BS", -1)
        stats.set_int(MPX() .. "K26_HEIST_TARGET", k26_heist_target)
        KortzReloadBoard()
        notify.info("Kortz Center Heist", "All selections completed in Normal Mode")
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Complete ALL dropdown selections.\nKeeps Normal Mode active (Hard Mode NOT enabled).")
    end


    if ImGui.Button("Reset (Keep Target Only)") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", 1)
        stats.set_int(MPX() .. "K26_SCOPING_BS", -1)
        stats.set_int(MPX() .. "K26_POI_BS", -1)
        stats.set_int(MPX() .. "K26_GENERAL_BS", 0)
        stats.set_int(MPX() .. "K26_HEIST_TARGET", k26_heist_target)
        KortzReloadBoard()
        notify.info("Kortz Center Heist", "Reset done, target kept: " .. targetShortNames[k26_heist_target + 1])
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Reset all preps and upgrades.\nOnly the currently selected target from dropdown will remain.")
    end


    -- BOARD MANAGEMENT
end)
KortzCenterHeistMenu:Box("Board & Extras")
KortzCenterHeistMenu:Custom(function()
    if ImGui.Button("Reload Planning Board") then
        KortzReloadBoard()
    end

    -- EXTRAS

    if ImGui.Button("Skip Cutscene") then
        SkipCutscene()
        notify.info("Kortz Center Heist", "Cutscene skipped")
    end
end)

-- MISSION CRACKER TAB

KortzCenterCrackerMenu = KortzCenterHeistMenu:Tab("Mission Cracker")

KortzCenterCrackerMenu:Box("Auto Door Hacks")
KortzCenterCrackerMenu:Custom(function()
    local heistActive = isKortzHeistActive()

    RainbowInfo("Automatically bypass hacks when they appear.")

    autoHacks, __ = ImGui.Checkbox("Enable Auto Door Hacks", autoHacks)
    if not heistActive then
        ImGui.TextColored(1.0, 0.8, 0.0, 1.0, "Start heist first to use auto hacks")
    end
end)
KortzCenterCrackerMenu:Box("Manual Door Hacks")
KortzCenterCrackerMenu:Custom(function()
    RainbowInfo("Click to bypass hacks manually.")

    if ImGui.Button("Skip Data Crack") then KortzSkipDataCrack() end
    if ImGui.Button("Skip Fingerprint Hack") then KortzSkipFingerprint() end
    if ImGui.Button("Skip Vault Door Hack") then KortzSkipVaultDoor() end
end)
KortzCenterCrackerMenu:Box("Access & Security")
KortzCenterCrackerMenu:Custom(function()
    RainbowInfo("Bypass security systems.")

    if ImGui.Button("Auto-Enter Access Code") then KortzAutoAccessCode() end
    if ImGui.Button("Disable Lasers") then KortzDisableLasers() end

    if ImGui.Button("Lasers: Easy") then KortzSetLasersEasy() end
    if ImGui.Button("Lasers: Hard") then KortzSetLasersHard() end
    if ImGui.Button("No Damage Lasers") then KortzNoDamageLasers() end
end)
KortzCenterCrackerMenu:Box("Glass Cutting")
KortzCenterCrackerMenu:Custom(function()
    RainbowInfo("Cut display case glass instantly.")

    if ImGui.Button("Cut All Glass") then KortzCutAllGlass() end
    if ImGui.Button("Venus d'Algernon") then CutVenus() end
    if ImGui.Button("Gemstone") then CutGemstone() end

    if ImGui.Button("Horse") then CutHorse() end
    if ImGui.Button("Coquard Carcanet") then CutCoquard() end
    if ImGui.Button("Memento Non Mori") then CutMemento() end
end)
KortzCenterCrackerMenu:Box("Solo Secondary Targets")
KortzCenterCrackerMenu:Custom(function()
    RainbowInfo("Enable secondary targets for solo play.")

    if ImGui.Button("Enable Solo Secondary Targets (B2 Floor)") then
        EnableSoloSecondaryTargets()
    end
end)
KortzCenterCrackerMenu:Box("Targets")
KortzCenterCrackerMenu:Custom(function()
    RainbowInfo("Grab targets instantly (stand near them).")

    if ImGui.Button("Take Primary Target") then KortzTakePrimary() end
    if ImGui.Button("Take Secondary Target") then KortzTakeSecondary() end
end)
KortzCenterCrackerMenu:Box("Loot Take")
KortzCenterCrackerMenu:Custom(function()
    RainbowInfo("Set loot take value.")

    ImGui.Text(GetKortzTakeText())
    kortzLootTakeValue, __ = ImGui.InputInt("##KortzLootTake", kortzLootTakeValue)
    if ImGui.Button("Set Loot Take") then KortzSetLootTake(kortzLootTakeValue) end
end)
KortzCenterCrackerMenu:Box("Glass Case Status")
KortzCenterCrackerMenu:Custom(function()
    RainbowInfo("Current status of all display cases.")

    for i = 0, 4 do
        local progress = (scripts.is_active(FMCV3) and ScriptLocal(FMCV3, KCCGL_BASE + (i * 13) + KCCGL_OFFSET):get_float() or 0.0)
        local status = "Available"
        local r, g, b = 1.0, 0.0, 0.0
        if progress >= 100.0 then
            status = "Cut"
            r, g, b = 0.0, 1.0, 0.0
        elseif progress == 0 then
            status = "Empty"
            r, g, b = 0.5, 0.5, 0.5
        end
        ImGui.TextColored(r, g, b, 1.0, glassCaseTypes[i] .. ": " .. glassCaseNames[i] .. " - " .. status)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Flash Ops", function()
FlashOpsMenu = HeistsDataEditorMenu:Tab("Flash Ops")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agency tab
local AgencyContracts = {
    { name = "None", index = 3 },
    { name = "Nightclub", index = 4 },
    { name = "Marina", index = 12 },
    { name = "Nightlife Leak", index = 28 },
    { name = "Country Club", index = 60 },
    { name = "Guest List", index = 123 },
    { name = "High Society Leak", index = 254 },
    { name = "Davis", index = 508 },
    { name = "Ballas", index = 1020 },
    { name = "South Central Leak", index = 2044 },
    { name = "Studio Time", index = 2045 },
    { name = "Don't Fuck With Dre", index = 4095 },
}

local contractNames = {}
for i, contract in ipairs(AgencyContracts) do
    table.insert(contractNames, contract.name)
end
local sContract = 0
local SN_Agency = FlashOpsMenu:Tab("Agency")
SN_Agency:Box("Information", 0) -- full width, above everything else
SN_Agency:Text("Don't Fuck With Dre:")
SN_Agency:Text("Max Payout 2.500.000$")
SN_Agency:Text("Min Cooldown ≈ 15-20 minutes")
SN_Agency:Columns(3)
SN_Agency:Box("Preps")
SN_Agency:Custom(function()
    ImGui.Text("Contract:")
    local nSelected, clicked = ImGui.Combo("##AgencyContract", sContract, contractNames, #contractNames)
    if clicked then
        sContract = nSelected
        local contractD = AgencyContracts[sContract + 1]
        local contractId = contractD.index

        stats.set_int(MPX() .. "FIXER_STORY_BS", contractId)
        if contractId < 18 then
            stats.set_int(MPX() .. "FIXER_STORY_STRAND", 0)
        elseif contractId < 128 then
            stats.set_int(MPX() .. "FIXER_STORY_STRAND", 1)
        elseif contractId < 2044 then
            stats.set_int(MPX() .. "FIXER_STORY_STRAND", 2)
        else
            stats.set_int(MPX() .. "FIXER_STORY_STRAND", -1)
        end
    end
end)

SN_Agency:Button("Complete Preps", function()
    stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
    stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
    stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
    notify.info("Agency", "Preps should've been completed")
end)
SN_Agency:Text("After all choices and pressing Complete Preps, wait for some time")

SN_Agency:Box("Misc")
local agencySafe = SN_Agency:Toggle("Agency Safe Loop")
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if agencySafe:get_value() == true then
            stats.set_int(MPX() .. "FIXER_COUNT", 500)
            stats.set_int(MPX() .. "FIXER_PASSIVE_PAY_TIME_LEFT", -1)
            CollectSafeRemote(3)
            script.yield(1000)
        else
            script.yield(500)
        end
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)
SN_Agency:Button("Instant Finish", function()
    if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, AGFl1):set_int(51338752) end
    if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, AGFl2):set_int(50) end
    notify.info("Agency", "Heist should've been finished")
end)
SN_Agency:Button("Skip Cutscene", SkipCutscene)
SN_Agency:Button("Collect Safe", function()
    notify.info("Agency", tostring(CollectSafeRemote(3) and "Safe money should've been collected" or "Agency safe is empty"))
end, "Enhanced only: collects the Agency safe from anywhere.")
SN_Agency:Button("Kill Cooldowns", function()
    tunables.set_int("FIXER_STORY_COOLDOWN_POSIX", 0)
    tunables.set_int("FIXER_SECURITY_CONTRACT_COOLDOWN_TIME", 0)
    tunables.set_int("REQUEST_FRANKLIN_PAYPHONE_HIT_COOLDOWN", 0)
    stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
    notify.info("Agency", "Cooldowns should've been killed")
end)
SN_Agency:Box("Payout")
local agencyPayout = SN_Agency:InputInt("Payout")
SN_Agency:Button("Max", function()
    agencyPayout:set_value(2500000)
    notify.info("Agency", "Payout should've been maximized. Don't forget to apply")
end)
SN_Agency:Button("Apply Payout", function()
    local payout = agencyPayout:get_value()
    tunables.set_int("FIXER_FINALE_LEADER_CASH_REWARD", payout)
    notify.info("Agency", "Payout should've been applied")
end)
SN_Agency:Text("Use 'Apply Payout' after you can see the minimap.")
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Autoshop tab
local AutoShopContracts = {
    { name = "None", index = -1 },
    { name = "Union Deposit.", index = 0 },
    { name = "Superdol. Deal", index = 1 },
    { name = "Bank Contract", index = 2 },
    { name = "ECU Job", index = 3 },
    { name = "Prison Contrac.", index = 4 },
    { name = "Agency Deal", index = 5 },
    { name = "Lost Contract", index = 6 },
    { name = "Data Contract", index = 7 },
}

local autoSelectedIndex = 0
local SN_Autoshop = FlashOpsMenu:Tab("Autoshop")
SN_Autoshop:Box("Information", 0) -- full width, above everything else
SN_Autoshop:Text("Max Payout 2.000.000$")
SN_Autoshop:Text("Min Cooldown ≈ 15-20 minutes")
SN_Autoshop:Columns(3)
SN_Autoshop:Box("Preps")
SN_Autoshop:Custom(function()
    ImGui.Text("Contract:")
    autoSelectedIndex = ImGui.Combo(
        "##AutoContract",
        autoSelectedIndex,
        {
            AutoShopContracts[1].name,
            AutoShopContracts[2].name,
            AutoShopContracts[3].name,
            AutoShopContracts[4].name,
            AutoShopContracts[5].name,
            AutoShopContracts[6].name,
            AutoShopContracts[7].name,
            AutoShopContracts[8].name,
            AutoShopContracts[9].name,
        },
        9
    )
end)
SN_Autoshop:Button("Apply & Complete Preps", function()
    local contract = AutoShopContracts[autoSelectedIndex + 1].index
    stats.set_int(MPX() .. "TUNER_CURRENT", contract)
    stats.set_int(MPX() .. "TUNER_GEN_BS", (contract == 1 and 4351 or 12543))
    if scripts.is_active(TUNERPL) then ScriptLocal(TUNERPL, ASRBl):set_int(2) end
    notify.info("Autoshop", "Preps should've been completed")
end)
SN_Autoshop:Button("Reset Preps", function()
    stats.set_int(MPX() .. "TUNER_GEN_BS", 12467)
    if scripts.is_active(TUNERPL) then ScriptLocal(TUNERPL, ASRBl):set_int(2) end
    notify.info("Autoshop", "Preps should've been reset")
end)
SN_Autoshop:Button("Redraw Board", function()
    if scripts.is_active(TUNERPL) then ScriptLocal(TUNERPL, ASRBl):set_int(2) end
    notify.info("Autoshop", "Board should've been redrawn")
end)
SN_Autoshop:Box("Payout")
local autoPayout = SN_Autoshop:InputInt("Payout")
SN_Autoshop:Button("Max", function()
    autoPayout:set_value(2000000)
    notify.info("Autoshop", "Payout should've been maximized. Don't forget to apply")
end)
SN_Autoshop:Button("Apply Payout", function()
    local payout = autoPayout:get_value()
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD0", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD1", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD2", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD3", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD4", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD5", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD6", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD7", payout)
    tunables.set_float("TUNER_ROBBERY_CONTACT_FEE", 0.0)
    notify.info("Autoshop", "Payout should've been applied")
end)
SN_Autoshop:Text("Use 'Apply Payout' after you can see the minimap.")
SN_Autoshop:Box("Misc")
SN_Autoshop:Button("Instant Finish", function()
    if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, ASIFl1):set_int(51338977) end
    if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, ASIFl2):set_int(101) end
    notify.info("Autoshop", "Heist should've been finished")
end)
SN_Autoshop:Button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cluckin Bell --
local cluckperps = {
    { id = 0, name = "Slush Fund" },
    { id = 1, name = "Breaking and Entering" },
    { id = 3, name = "Concealed Rewards" },
    { id = 7, name = "Hit And Run" },
    { id = 15, name = "Disorganized Crime" },
    { id = 31, name = "Scene of Crime" },
}

local SN_Cluck = FlashOpsMenu:Tab("Cluckin Bell Heist")
SN_Cluck:Box("Information", 0) -- full width, above everything else
SN_Cluck:Text("Max Payout 1.000.000$")
SN_Cluck:Text("Min Cooldown ≈ 15-20 minutes")


local cluckprepNames = {}
for i, cluckprep in ipairs(cluckperps) do
    cluckprepNames[i] = cluckprep.name
end
local cluckprepIndex = 0

SN_Cluck:Box("Preps")
SN_Cluck:Custom(function()
    cluckprepIndex, __ = ImGui.Combo("##CluckPrep", cluckprepIndex, cluckprepNames, #cluckprepNames)
    if ImGui.Button("Apply & Complete Preps") then
        script.run_in_callback(function()
            stats.set_int(MPX() .. "SALV23_INST_PROG", cluckperps[cluckprepIndex + 1].id)
        end)
    end

    if ImGui.Button("Reset Preps") then
        script.run_in_callback(function()
            stats.set_int(MPX() .. "SALV23_INST_PROG", 0)
        end)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Guzman Flies tab
local GuzmanStages = {
    { name = "Up n Running", index = 0 },
    { name = "Mogul", index = 1 },
    { name = "Intel", index = 3 },
    { name = "Iron Mule", index = 7 },
    { name = "Ammunation", index = 15 },
    { name = "Titan Job", index = 31 },
}

-- Packed Bools 
local GuzmanBools = {
    HardMode = { 51272 },
    AdditionalMogul = { 51265, 51266 },
    AdditionalIronMules = { 51268, 51269, 51270, 51271 },
    InsurgentPickUp = { 51264 },
    WeaponCrate = { 51261 },
    HeavyArmor = { 51260 },
    MogulUpgrades = { 51263 },
}

local function guzmanSetBools(list, value)
    for _, id in ipairs(list) do
        stats.set_packed_bool(id, value)
    end
end

local function guzmanGetBool(list)
    return stats.get_packed_bool(list[1])
end

local guzmanStageIndex = 0
local SN_Guzman = FlashOpsMenu:Tab("Guzman Flies")
SN_Guzman:Box("Information", 0) -- full width, above everything else
SN_Guzman:Text("Max Payout 2.160.000$")
SN_Guzman:Text("Min Cooldown ≈ 15-20 minutes")
SN_Guzman:Box("Preps")
SN_Guzman:Custom(function()
    ImGui.Text("Stage:")
    guzmanStageIndex = ImGui.Combo(
        "##GuzmanStage",
        guzmanStageIndex,
        {
            GuzmanStages[1].name,
            GuzmanStages[2].name,
            GuzmanStages[3].name,
            GuzmanStages[4].name,
            GuzmanStages[5].name,
            GuzmanStages[6].name,
        },
        6
    )
end)
SN_Guzman:Button("Apply & Complete Preps", function()
    stats.set_int(MPX() .. "HACKER24_INST_BS", GuzmanStages[guzmanStageIndex + 1].index)
    notify.info("Guzman Flies", "Preps should've been completed")
end)
SN_Guzman:Button("Reset Preps", function()
    stats.set_int(MPX() .. "HACKER24_INST_BS", 0)
    notify.info("Guzman Flies", "Preps should've been reset")
end)
SN_Guzman:Text("Stage = next Mission.")
SN_Guzman:Text("Mogul = Up n Running finished.")
SN_Guzman:Text("Titan Job = all Preps finished.")

SN_Guzman:Box("Options")
SN_Guzman:Custom(function()
    local function box(label, list, key)
        local cur = guzmanGetBool(list)
        local new, changed = ImGui.Checkbox(label .. "##Guzman" .. key, cur)
        if changed then
            guzmanSetBools(list, new)
        end
    end
    box("Hard Mode", GuzmanBools.HardMode, "Hard")
    box("Additional Mogul", GuzmanBools.AdditionalMogul, "AddMogul")
    box("Additional Iron Mules", GuzmanBools.AdditionalIronMules, "AddIron")
    box("Insurgent Pick-Up Custom", GuzmanBools.InsurgentPickUp, "Insurgent")
    box("Weapon Crate", GuzmanBools.WeaponCrate, "Crate")
    box("Heavy Armor", GuzmanBools.HeavyArmor, "Armor")
    box("Mogul Upgrades", GuzmanBools.MogulUpgrades, "Upgrades")
end)
SN_Guzman:Button("Enable All Options", function()
    for key, list in pairs(GuzmanBools) do
        if key ~= "HardMode" then
            guzmanSetBools(list, true)
        end
    end
    notify.info("Guzman Flies", "All options should've been enabled")
end)
SN_Guzman:Button("Disable All Options", function()
    for _, list in pairs(GuzmanBools) do
        guzmanSetBools(list, false)
    end
    notify.info("Guzman Flies", "All options should've been disabled")
end)

SN_Guzman:Box("Teleport")
SN_Guzman:Button("Teleport to Entrance", function()
    script.run_in_callback(function()
        local blip = HUD.GET_FIRST_BLIP_INFO_ID(903) -- McKenzie Field Hangar
        if HUD.DOES_BLIP_EXIST(blip) then
            selfTP(true, false, HUD.GET_BLIP_COORDS(blip))
        else
            notify.info("Guzman Flies", "Field Hangar blip not found")
        end
    end)
end)
SN_Guzman:Button("Teleport to Laptop", function()
    selfTP(false, true, { x = 2147.685, y = 4785.257, z = -46.374 }, 270.519)
end)

SN_Guzman:Box("Misc")
SN_Guzman:Button("Instant Finish", function()
    script.run_in_callback(function()
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPXf1 + 1589):set_int(5) end
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPXf1 + 1776 + 1):set_int(999999) end
        local v = (scripts.is_active(FMC2020) and ScriptLocal(FMC2020, CPXf1 + 1):get_int() or 0)
        v = bit.bor(v, bit.lshift(1, 9), bit.lshift(1, 16))
        if scripts.is_active(FMC2020) then ScriptLocal(FMC2020, CPXf1 + 1):set_int(v) end
        notify.info("Guzman Flies", "Heist should've been finished")
    end)
end)
SN_Guzman:Button("Skip Cutscene", SkipCutscene)
SN_Guzman:Button("Kill Cooldown", function()
    stats.set_int(MPX() .. "HACKER24_MFM_COOLDOWN", -1)
    notify.info("Guzman Flies", "Cooldown should've been killed")
end)
SN_Guzman:Text("Use 'Instant Finish' after you can see the minimap.")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Teleports", function()
HeistTeleportsMenu = HeistsDataEditorMenu:Tab("Teleports")

local function TP_BlipOrFixed(blipId, fx, fy, fz, keepVehicle)
    script.run_in_callback(function()
        local blip = HUD.GET_FIRST_BLIP_INFO_ID(blipId)
        if blip ~= 0 and HUD.DOES_BLIP_EXIST(blip) then
            local p = HUD.GET_BLIP_COORDS(blip)
            selfTP(keepVehicle or false, false, p)
        else
            selfTP(keepVehicle or false, false, Vector3(fx, fy, fz))
        end
    end)
end

local function TP_Fixed(fx, fy, fz, keepVehicle)
    script.run_in_callback(function()
        selfTP(keepVehicle or false, false, Vector3(fx, fy, fz))
    end)
end

HeistTeleportsMenu:Columns(1)
HeistTeleportsMenu:Box("Arcade / Casino Exterior")
HeistTeleportsMenu:Custom(function()
    if ImGui.Button("Arcade (Owned)") then
        TP_BlipOrFixed(740, 1721.0, -1653.0, 13.0, false)
    end
    ImGui.SameLine()
    if ImGui.Button("Videogeddon Arcade") then
        TP_Fixed(1721.0, -1653.0, 13.0, false)
    end
    if ImGui.Button("Diamond Casino Entrance") then
        TP_Fixed(925.0, 46.0, 81.1, false)
    end
    ImGui.SameLine()
    if ImGui.Button("Casino Parking") then
        TP_Fixed(900.0, -103.0, 75.0, true)
    end
end)
HeistTeleportsMenu:Box("Casino Interior")
HeistTeleportsMenu:Custom(function()
    if ImGui.Button("Vault 1") then TP_Fixed(2510.261475, -224.366699, -72.037163, false) end
    ImGui.SameLine()
    if ImGui.Button("Vault 2") then TP_Fixed(2533.521729, -225.209366, -72.037163, false) end
    ImGui.SameLine()
    if ImGui.Button("Vault 3") then TP_Fixed(2537.823486, -237.452118, -72.037163, false) end
    if ImGui.Button("Vault 4") then TP_Fixed(2534.049561, -248.194931, -72.037163, false) end
    ImGui.SameLine()
    if ImGui.Button("Vault 5") then TP_Fixed(2520.342773, -255.425705, -72.037178, false) end
    ImGui.SameLine()
    if ImGui.Button("Vault 6") then TP_Fixed(2509.844238, -250.968552, -72.03717, false) end
    if ImGui.Button("Vault Lobby Enter") then TP_Fixed(2521.761719, -287.359192, -60.022976, false) end
    ImGui.SameLine()
    if ImGui.Button("Vault Lobby Exit") then TP_Fixed(2521.876709, -284.334869, -60.022999, false) end
end)
HeistTeleportsMenu:Box("Cayo Perico")
HeistTeleportsMenu:Custom(function()
    if ImGui.Button("Main Dock") then TP_Fixed(4947.496094, -5168.458008, 1.23427, true) end
    ImGui.SameLine()
    if ImGui.Button("Main Loot") then TP_Fixed(5010.06543, -5751.291504, 14.184451, false) end
    ImGui.SameLine()
    if ImGui.Button("Office") then TP_Fixed(5010.203613, -5753.518555, 27.545284, false) end
    if ImGui.Button("Vault Loot") then TP_Fixed(4999.76416, -5747.86377, 14.84, false) end
    ImGui.SameLine()
    if ImGui.Button("Main Loot Gate") then TP_Fixed(5009.156738, -5753.71582, 14.173852, false) end
    ImGui.SameLine()
    if ImGui.Button("North Safe") then TP_Fixed(4961.050781, -5791.280762, 24.966309, false) end
    if ImGui.Button("Storage 1") then TP_Fixed(5080.922852, -5756.109375, 14.529856, false) end
    ImGui.SameLine()
    if ImGui.Button("Storage 2") then TP_Fixed(5028.794922, -5735.571777, 16.565603, false) end
    ImGui.SameLine()
    if ImGui.Button("Storage 3") then TP_Fixed(5008.02002, -5787.345215, 16.531713, false) end
    if ImGui.Button("Storage 4") then TP_Fixed(5000.289062, -5749.532715, 13.540483, false) end
    ImGui.SameLine()
    if ImGui.Button("Power Station") then TP_Fixed(4477.102539, -4597.295898, 4.283014, true) end
    ImGui.SameLine()
    if ImGui.Button("Comm Tower") then TP_Fixed(5266.018555, -5427.736328, 64.297134, false) end
    if ImGui.Button("Cayo Exit") then TP_Fixed(4990.778809, -5716.004395, 18.58021, false) end
    ImGui.SameLine()
    if ImGui.Button("Cayo Airstrip") then TP_Fixed(4437.779785, -4447.757812, 3.028435, true) end
end)
HeistTeleportsMenu:Box("Classic Robberies")
HeistTeleportsMenu:Custom(function()
    if ImGui.Button("Fleeca Bank (Burton)") then
        TP_Fixed(147.0, -1045.0, 29.4, false)
    end
    ImGui.SameLine()
    if ImGui.Button("Pacific Standard Bank") then
        TP_Fixed(235.0, 217.0, 106.3, false)
    end
    if ImGui.Button("Doomsday Facility (Owned)") then
        TP_BlipOrFixed(590, 1274.0, 4126.0, 31.0, true)
    end
end)
HeistTeleportsMenu:Box("Agency / Dre")
HeistTeleportsMenu:Custom(function()
    if ImGui.Button("Dre 1") then TP_Fixed(507.766602, -605.932678, 23.451139, false) end
    ImGui.SameLine()
    if ImGui.Button("Dre 2") then TP_Fixed(-927.370483, -2923.859131, 12.644426, false) end
    ImGui.SameLine()
    if ImGui.Button("Dre 3") then TP_Fixed(-933.519897, -3010.231201, 18.540413, false) end
    ImGui.SameLine()
    if ImGui.Button("Dre 4") then TP_Fixed(-3036.250488, 111.499924, 10.599296, false) end
    if ImGui.Button("ULP Place") then TP_Fixed(101.928909, -662.696899, 43.792946, false) end
    ImGui.SameLine()
    if ImGui.Button("Intelligence A") then TP_Fixed(102.285995, -743.904236, 44.454739, false) end
    ImGui.SameLine()
    if ImGui.Button("Intelligence B") then TP_Fixed(853.439697, -2339.465088, 29.033638, true) end
end)
HeistTeleportsMenu:Box("New Robberies")
HeistTeleportsMenu:Custom(function()
    if ImGui.Button("Kortz Center Entrance") then
        TP_Fixed(-2243.0, -325.0, 33.0, false)
    end
    ImGui.SameLine()
    if ImGui.Button("Cluckin Bell Factory") then
        TP_Fixed(-139.0, 6261.0, 31.5, true)
    end
    if ImGui.Button("Agency (Owned)") then
        TP_BlipOrFixed(826, 375.0, -66.0, 92.0, false)
    end
    ImGui.SameLine()
    if ImGui.Button("Auto Shop (Owned)") then
        TP_BlipOrFixed(779, 124.0, -1799.0, 29.0, false)
    end
    if ImGui.Button("Salvage Yard (Owned)") then
        TP_BlipOrFixed(867, 1145.0, -1792.0, 23.0, false)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Casino", function()
CasinoServicesMenu = Menu:Tab("Casino"):RequireOnline()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local cslots = "casino_slots"
slots_random_results_table = 1381
prize_wheel_win_state = 311
prize_wheel_prize = 14
prize_wheel_prize_state = 45

CasinoServicesMenu:Box("Casino Chips")
-- Chip limits live in the free mode globals (FMg + 26643/26644 = acquire, FMg + 26645 = trade in).
local chipLimit = CasinoServicesMenu:InputInt("Chip Limit")
CasinoServicesMenu:Button("Apply Acquire Limit", function()
    local value = chipLimit:get_value()
    ScriptGlobal(CASINO_CHIP_LIMIT_BUY_1):set_int(value)
    ScriptGlobal(CASINO_CHIP_LIMIT_BUY_2):set_int(value)
    notify.info("Casino", "Acquire limit set to " .. value)
end)
CasinoServicesMenu:Button("Apply Trade In Limit", function()
    local value = chipLimit:get_value()
    ScriptGlobal(CASINO_CHIP_LIMIT_SELL):set_int(value)
    notify.info("Casino", "Trade in limit set to " .. value)
end)

CasinoServicesMenu:Button("Bypass Casino Cooldown", function()
    stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
    stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
    stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
    stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
    stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
    stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
    stats.set_int("MPPLY_CASINO_CHIPS_SOLD", 0)
    stats.set_int("MPPLY_CASINO_CHIPS_SELTIM", 0)
end)
CasinoServicesMenu:Text("Winning too much too quickly might get you banned, enable this at your own risk.")


CasinoServicesMenu:Box("Slots")

CasinoServicesMenu:Button("Rig Slot Machines", function()
    for i = 3, 196 do
        if i ~= 67 and i ~= 132 then
            if scripts.is_active(cslots) then ScriptLocal(cslots, slots_random_results_table + i):set_int(6) end
        end
    end
end)

CasinoServicesMenu:Button("Lose Slot Machines", function()
    for i = 3, 196 do
        if i ~= 67 and i ~= 132 then
            if scripts.is_active(cslots) then ScriptLocal(cslots, slots_random_results_table + i):set_int(0) end
        end
    end
end)

CasinoServicesMenu:Box("Lucky Wheel")

CasinoServicesMenu:Button("Give Podium Vehicle", function()
    script.run_in_callback(function()
        if scripts.is_active("casino_lucky_wheel") then
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize):set_int(18)
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state):set_int(11)
        end
    end)
end)
CasinoServicesMenu:Button("Give Mystery Prize", function()
    script.run_in_callback(function()
        if scripts.is_active("casino_lucky_wheel") then
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize):set_int(11)
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state):set_int(11)
        end
    end)
end)
CasinoServicesMenu:Button("Give $50,000", function()
    script.run_in_callback(function()
        if scripts.is_active("casino_lucky_wheel") then
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize):set_int(19)
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state):set_int(11)
        end
    end)
end)
CasinoServicesMenu:Button("Give 25,000 Chips", function()
    script.run_in_callback(function()
        if scripts.is_active("casino_lucky_wheel") then
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize):set_int(15)
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state):set_int(11)
        end
    end)
end)
CasinoServicesMenu:Button("Give 15,000 RP", function()
    script.run_in_callback(function()
        if scripts.is_active("casino_lucky_wheel") then
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize):set_int(17)
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state):set_int(11)
        end
    end)
end)
CasinoServicesMenu:Button("Give Discount", function()
    script.run_in_callback(function()
        if scripts.is_active("casino_lucky_wheel") then
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize):set_int(4)
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state):set_int(11)
        end
    end)
end)
CasinoServicesMenu:Button("Give Clothing", function()
    script.run_in_callback(function()
        if scripts.is_active("casino_lucky_wheel") then
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize):set_int(8)
            ScriptLocal("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state):set_int(11)
        end
    end)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Events", function()
EventsMenu = Menu:Tab("Events"):RequireOnline()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Snow Toggle", function()
SnowToggleMenu = EventsMenu:Tab("Snow Toggle")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SnowToggleMenu:Box("Snow")
SNOWCB = SnowToggleMenu:Toggle("Snow")
local snowPrev = nil
script.run_in_callback(function()
    local tick = function()
        script.yield()
        local want = SNOWCB:get_value() and 1 or 0
        if want ~= snowPrev then
            tunables.set_bool("TURN_SNOW_ON_OFF", want == 1)
            snowPrev = want
        end
        script.yield(100)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Halloween Weather", function()
halloweenWeatherMenu = EventsMenu:Tab("Halloween Weather")

-- Animated rainbow
function rainbow_color(offset)
    local time = os.clock() * 2
    local r = math.sin(time + offset) * 0.5 + 0.5
    local g = math.sin(time + offset + 2.094) * 0.5 + 0.5
    local b = math.sin(time + offset + 4.188) * 0.5 + 0.5
    return r, g, b, 1.0
end

function help_marker(text)
    ImGui.SameLine()
    local r, g, b, a = rainbow_color(0)
    ImGui.PushStyleColor(ImGuiCol.Text, r, g, b, a)
    ImGui.Text("[?]")
    ImGui.PopStyleColor()
    if ImGui.IsItemHovered() then
        ImGui.BeginTooltip()
        ImGui.PushTextWrapPos(ImGui.GetFontSize() * 35)
        ImGui.TextUnformatted(text)
        ImGui.PopTextWrapPos()
        ImGui.EndTooltip()
    end
end

-- Info text
halloweenWeatherMenu:Box("Information")
halloweenWeatherMenu:Text("In GTA Online, Halloween weather only works")
halloweenWeatherMenu:Text("between 7:00 PM and 7:30 AM in-game time.")
halloweenWeatherMenu:Text("Toggle below to force it on during that window.")
halloweenWeatherMenu:Text("It will stay active as long as the toggle is ON.")

-- Current time display
halloweenWeatherMenu:Box("Halloween Weather")
halloweenWeatherMenu:Custom(function()
    local hour = CLOCK.GET_CLOCK_HOURS()
    local minute = CLOCK.GET_CLOCK_MINUTES()
    local ampm = "AM"
    local hour12 = hour
    if hour >= 12 then
        ampm = "PM"
        if hour > 12 then
            hour12 = hour - 12
        end
    end
    if hour12 == 0 then
        hour12 = 12
    end
    ImGui.TextColored(
        1.0,
        0.8,
        0.0,
        1.0,
        "Current In-Game Time: " .. string.format("%02d:%02d %s", hour12, minute, ampm)
    )
    if hour >= 19 or hour < 7 then
        ImGui.TextColored(0.0, 1.0, 0.0, 1.0, "Status: Halloween weather is available NOW")
    else
        ImGui.TextColored(1.0, 0.5, 0.0, 1.0, "Status: Halloween weather is NOT available")
        ImGui.TextColored(1.0, 1.0, 1.0, 1.0, "Wait until 7:00 PM in-game time")
    end
end)

HALLOWEATHERC = halloweenWeatherMenu:Toggle("Enable")

local halloweatherPrev = nil
script.run_in_callback(function()
    local tick = function()
        script.yield()
        local want = HALLOWEATHERC:get_value() and 1 or 0
        if want ~= halloweatherPrev then
            tunables.set_bool("SSP2WEATHER", want == 1)
            halloweatherPrev = want
        end
        script.yield(100)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the Trick or Treat Menu tab
end)

Section("Trick or Treat", function()
trickOrTreatMenu = EventsMenu:Tab("Trick or Treat")

-- Add Trick or Treat checkbox with help marker
trickOrTreatMenu:Columns(1)
trickOrTreatMenu:Box("Event")
TRICKORTREATCB = trickOrTreatMenu:Toggle("Trick or Treat", "Enables the Trick or Treat event. This allows you to collect Halloween pumpkins from the Halloween event.")


script.run_in_callback(function()
    local tick = function()
        script.yield()
        local want = TRICKORTREATCB:get_value() and 1 or 0
        if want ~= _trickPrev then
            tunables.set_bool("COLLECTABLES_TRICK_OR_TREAT", want == 1)
            _trickPrev = want
        end
        script.yield(100)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

-- Jack o'Lantern locations array (200 locations)
jackolantern_locations = {
    Vector3(1434.581177, -1494.808960, 61.924484),
    Vector3(1318.091797, -1557.906860, 49.406536),
    Vector3(1297.748535, -1621.982666, 52.924953),
    Vector3(1312.340576, -1701.004272, 56.537983),
    Vector3(1256.791260, -1760.271851, 47.959789),
    Vector3(1204.294312, -1672.812622, 41.058277),
    Vector3(1232.604492, -1593.003418, 52.067909),
    Vector3(1152.968140, -1529.164673, 33.691978),
    Vector3(1183.517090, -1461.732788, 33.594597),
    Vector3(1210.140625, -1390.762085, 34.076641),
    Vector3(411.362427, -1485.312622, 28.570503),
    Vector3(323.141052, -1759.944092, 28.016262),
    Vector3(428.983459, -1723.205811, 27.929178),
    Vector3(495.846832, -1817.259521, 27.187927),
    Vector3(387.837158, -1883.815430, 24.304468),
    Vector3(326.185211, -1947.658691, 23.467230),
    Vector3(379.337311, -2069.736328, 19.941431),
    Vector3(294.090973, -2098.108154, 15.802926),
    Vector3(221.574402, -2036.115112, 16.712660),
    Vector3(180.028915, -1930.020508, 19.712641),
    Vector3(150.242844, -1868.382568, 22.930975),
    Vector3(25.318865, -1894.664185, 21.286211),
    Vector3(-18.668180, -1855.332764, 23.662672),
    Vector3(-79.454300, -1641.520874, 28.009012),
    Vector3(-158.293228, -1680.115479, 35.666103),
    Vector3(-193.209412, -1609.052246, 32.701607),
    Vector3(-63.751331, -1452.771973, 30.823833),
    Vector3(-123.541191, -1490.525513, 32.473259),
    Vector3(-223.600693, -1500.161133, 30.692902),
    Vector3(-294.518921, -1332.482910, 29.970270),
    Vector3(1014.117920, -423.848389, 63.675259),
    Vector3(1266.007446, -428.332397, 68.079376),
    Vector3(1370.628906, -558.052185, 73.039597),
    Vector3(1324.806519, -580.172913, 71.912575),
    Vector3(1204.557251, -620.731323, 64.821854),
    Vector3(967.759155, -547.430298, 58.004089),
    Vector3(961.077148, -594.268860, 58.192711),
    Vector3(999.061157, -727.578979, 56.227200),
    Vector3(1143.774292, -981.787659, 44.845215),
    Vector3(845.798950, -1019.603210, 26.234652),
    Vector3(805.100342, -1075.361694, 27.369886),
    Vector3(480.726227, -975.737000, 26.683889),
    Vector3(389.172333, -972.175659, 28.140848),
    Vector3(360.894836, -1070.573853, 28.238062),
    Vector3(244.050507, -1071.695679, 27.986931),
    Vector3(264.044403, -1028.192871, 27.911451),
    Vector3(75.252281, -1026.460449, 28.174519),
    Vector3(-16.975662, -977.996521, 28.062405),
    Vector3(66.998047, -961.704041, 28.057564),
    Vector3(130.983887, -567.115417, 42.440754),
    Vector3(-191.763809, -764.868286, 29.154016),
    Vector3(-232.445236, -911.110535, 31.010803),
    Vector3(-552.145813, -815.285950, 29.390755),
    Vector3(-731.544312, -676.678467, 28.973450),
    Vector3(-1025.704224, -921.141296, 3.741233),
    Vector3(-962.515381, -942.297180, 0.845313),
    Vector3(-841.248718, -1206.873657, 5.163064),
    Vector3(-969.639954, -1094.212158, 0.8505334),
    Vector3(-1075.960327, -1026.114990, 3.245211),
    Vector3(-1150.731567, -992.529785, 0.850194),
    Vector3(-1125.693848, -1090.169067, 0.850338),
    Vector3(-1207.256836, -1136.133057, 6.418141),
    Vector3(-1185.031738, -1560.465698, 3.061427),
    Vector3(-1337.111938, -1282.580566, 3.536002),
    Vector3(-1291.436401, -1115.384399, 5.380210),
    Vector3(-1505.406006, -938.584167, 8.059047),
    Vector3(-1581.442627, -951.199219, 11.717396),
    Vector3(-1187.069458, -564.099121, 26.317165),
    Vector3(-1340.669434, -408.527100, 35.059433),
    Vector3(-1534.179565, -425.168396, 34.291149),
    Vector3(-1977.575928, -534.048889, 10.412008),
    Vector3(-1886.251953, -367.071625, 47.764736),
    Vector3(-1686.079102, -292.055634, 50.593338),
    Vector3(-1729.297974, -191.002090, 57.047939),
    Vector3(-1549.251831, -89.285751, 53.629169),
    Vector3(-1465.009766, -30.447273, 53.408463),
    Vector3(-1473.790649, 62.652233, 51.955498),
    Vector3(-1565.397949, 41.662537, 57.540710),
    Vector3(-1539.457520, 128.534393, 55.480267),
    Vector3(-1649.843994, 148.785080, 60.872307),
    Vector3(749.970276, 220.890854, 85.730003),
    Vector3(348.487152, 442.021454, 146.400879),
    Vector3(327.944977, 536.017639, 152.462311),
    Vector3(215.329636, 621.132812, 186.248245),
    Vector3(7.990458, 544.689697, 174.240616),
    Vector3(56.627422, 454.376404, 145.430801),
    Vector3(169.621765, 488.189667, 141.616394),
    Vector3(125.038742, 64.603813, 78.442604),
    Vector3(85.067253, -93.484367, 59.143009),
    Vector3(14.717505, -5.760206, 68.813988),
    Vector3(-436.087738, -67.952057, 41.706535),
    Vector3(-373.813538, 44.969456, 53.129925),
    Vector3(-175.594559, 89.340088, 68.998276),
    Vector3(-565.616150, 168.983398, 65.538330),
    Vector3(-598.232544, 275.290619, 80.810440),
    Vector3(-146.931183, 288.287903, 95.503975),
    Vector3(-87.271278, 425.587616, 111.912392),
    Vector3(-252.625534, 397.004730, 109.946564),
    Vector3(-369.354126, 347.407196, 108.114899),
    Vector3(-573.230042, 402.716095, 99.368492),
    Vector3(-584.765686, 496.261749, 105.802574),
    Vector3(-352.459045, 469.861053, 111.272270),
    Vector3(-178.125549, 503.593872, 135.551987),
    Vector3(-136.874252, 595.974915, 203.303223),
    Vector3(-247.243790, 619.652405, 186.510178),
    Vector3(-346.281616, 625.225159, 170.056915),
    Vector3(-445.562164, 684.065796, 151.650650),
    Vector3(-491.010986, 740.993591, 161.535828),
    Vector3(-579.493774, 736.161072, 182.526932),
    Vector3(-549.261047, 827.965210, 196.220291),
    Vector3(-149.519211, 995.026306, 235.537567),
    Vector3(-821.168213, 814.200195, 199.545700),
    Vector3(-703.407898, 591.646423, 140.869995),
    Vector3(-716.630310, 490.652618, 107.965691),
    Vector3(-821.048706, 268.837524, 84.892586),
    Vector3(-863.629517, 387.783356, 86.129707),
    Vector3(-882.328552, 518.721924, 91.141586),
    Vector3(-937.415100, 589.408447, 100.195312),
    Vector3(-887.551086, 701.678711, 149.417191),
    Vector3(-1020.178894, 716.203674, 162.686401),
    Vector3(-1166.027588, 729.194946, 154.211594),
    Vector3(-1291.383911, 648.885010, 140.199905),
    Vector3(-1124.626709, 575.734802, 103.055000),
    Vector3(-1024.506104, 502.218384, 79.255287),
    Vector3(-966.512451, 434.859009, 78.671555),
    Vector3(-1023.245361, 359.682251, 70.056602),
    Vector3(-1130.484985, 391.969757, 69.441147),
    Vector3(-1178.350708, 290.212646, 68.198738),
    Vector3(-1215.850708, 460.558350, 90.553658),
    Vector3(-1312.920288, 452.977936, 97.879066),
    Vector3(-1499.075195, 520.862732, 116.972198),
    Vector3(-1813.917847, 344.151672, 87.253471),
    Vector3(-1961.207275, 249.182205, 83.922012),
    Vector3(-2005.261841, 447.706787, 100.982285),
    Vector3(-1974.006348, 627.074402, 121.236298),
    Vector3(-1523.962524, 854.170227, 180.294525),
    Vector3(-3084.227539, 222.587875, 12.690159),
    Vector3(-3034.164795, 492.005524, 5.467818),
    Vector3(-2999.262695, 694.002991, 24.150764),
    Vector3(-3234.858887, 934.295593, 15.850909),
    Vector3(-3202.787109, 1151.574829, 8.355104),
    Vector3(-3180.688232, 1291.906372, 13.120326),
    Vector3(-2551.712402, 1912.145386, 167.768417),
    Vector3(-1872.429932, 2029.911011, 138.037140),
    Vector3(-1112.209106, 2686.990479, 17.318859),
    Vector3(-262.114075, 2194.963135, 129.098648),
    Vector3(-267.503265, 2626.278564, 60.810768),
    Vector3(-462.839874, 2856.521973, 33.321205),
    Vector3(-327.331085, 2820.612305, 57.069534),
    Vector3(-289.165649, 2837.083496, 54.012520),
    Vector3(-38.089405, 2866.223145, 57.879650),
    Vector3(200.134537, 3031.658691, 42.007084),
    Vector3(245.562866, 3167.225342, 41.543571),
    Vector3(36.286015, 3668.123779, 38.331520),
    Vector3(92.681717, 3741.556885, 38.248653),
    Vector3(439.687134, 3574.860352, 31.938606),
    Vector3(470.906616, 2611.910889, 41.949657),
    Vector3(561.570679, 2599.967529, 41.738277),
    Vector3(734.955811, 2523.633057, 71.924843),
    Vector3(721.653381, 2332.206543, 50.450310),
    Vector3(790.147888, 2182.331055, 50.818352),
    Vector3(841.859131, 2114.335449, 51.001461),
    Vector3(1352.933716, 1147.012451, 112.459045),
    Vector3(1529.204956, 1728.803955, 108.681503),
    Vector3(1531.197266, 2219.515381, 75.833237),
    Vector3(1421.380981, 3666.921387, 38.428417),
    Vector3(1664.273926, 3824.378662, 33.593254),
    Vector3(1762.277954, 3872.228516, 33.132488),
    Vector3(1925.091553, 3917.555664, 31.198433),
    Vector3(1914.172241, 3825.941162, 31.136677),
    Vector3(1773.624268, 3740.501953, 33.356308),
    Vector3(1856.470215, 3681.635254, 32.958481),
    Vector3(1999.776611, 3776.771484, 30.880787),
    Vector3(1991.811035, 3057.610840, 45.760735),
    Vector3(2168.261475, 3380.211670, 45.134487),
    Vector3(2178.444824, 3499.422119, 44.197418),
    Vector3(2590.153320, 3169.243896, 49.646759),
    Vector3(2620.696533, 3282.523926, 53.951210),
    Vector3(2985.502930, 3484.042236, 70.081779),
    Vector3(2420.516602, 4020.245605, 35.535358),
    Vector3(2638.094482, 4247.965332, 43.502384),
    Vector3(3689.367188, 4563.361328, 23.881674),
    Vector3(3315.741455, 5172.885254, 17.129362),
    Vector3(2234.621094, 5609.286133, 53.348442),
    Vector3(2451.511963, 4961.811035, 44.201416),
    Vector3(1967.214966, 4621.931641, 39.482288),
    Vector3(1664.723511, 4773.646973, 40.687389),
    Vector3(1723.661011, 4642.196777, 42.564026),
    Vector3(1311.947632, 4361.838867, 39.552631),
    Vector3(724.281311, 4185.006348, 39.409229),
    Vector3(-771.858582, 5511.423340, 33.605061),
    Vector3(-342.642487, 6163.851074, 30.190174),
    Vector3(-402.742828, 6314.299805, 27.649906),
    Vector3(-306.322205, 6331.539551, 31.189320),
    Vector3(-245.945114, 6410.604492, 29.897928),
    Vector3(-105.598267, 6313.783691, 30.190372),
    Vector3(-112.187599, 6460.697266, 30.168459),
    Vector3(-50.652882, 6582.884766, 29.876881),
    Vector3(54.402122, 6642.595215, 30.223076),
    Vector3(1706.896240, 6422.760254, 31.335125),
}

-- Jack o'Lantern location names (200 locations)
jackolantern_names = {}
for i = 1, 200 do
    jackolantern_names[i] = "Location " .. string.format("%03d", i)
end

-- Variables
jackolantern_selected_loc = 0

-- Add ImGui for Jack o'Lantern teleports
trickOrTreatMenu:Box("Teleport")
trickOrTreatMenu:Custom(function()

    ImGui.Text("Select Jack o'Lantern Location:")
    help_marker("Choose a location from the dropdown list to teleport to.")

    ImGui.SetNextItemWidth(265)
    jackolantern_selected_loc =
        ImGui.Combo("##jackolantern_selected_loc", jackolantern_selected_loc, jackolantern_names, 200)

    ImGui.SameLine()

    if ImGui.Button("Teleport to Location") then
        script.run_in_callback(function()
            local coords = jackolantern_locations[jackolantern_selected_loc + 1]
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
        end)
    end
    help_marker("Teleports you to the selected Jack o'Lantern location.")
end)
trickOrTreatMenu:Box("Quick Teleport (1-20)")
trickOrTreatMenu:Custom(function()
    -- Quick teleport buttons in rows of 5 (first 20 locations)
    for i = 0, 19 do

        if ImGui.Button(jackolantern_names[i + 1]) then
            script.run_in_callback(function()
                local coords = jackolantern_locations[i + 1]
                PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
            end)
        end

        if i % 4 ~= 3 and i < 19 then
            ImGui.SameLine()
        end
    end
end)
trickOrTreatMenu:Box("Quick Teleport (21-40)")
trickOrTreatMenu:Custom(function()
    -- Quick teleport buttons in rows of 5 (next 20 locations)
    for i = 20, 39 do

        if ImGui.Button(jackolantern_names[i + 1]) then
            script.run_in_callback(function()
                local coords = jackolantern_locations[i + 1]
                PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
            end)
        end

        if i % 4 ~= 3 and i < 39 then
            ImGui.SameLine()
        end
    end
end)
trickOrTreatMenu:Box("Random")
trickOrTreatMenu:Custom(function()
    ImGui.Text("Total Jack o'Lantern Locations: 200")

    if ImGui.Button("Teleport to Random Jack o'Lantern") then
        script.run_in_callback(function()
            local random_index = math.random(1, 200)
            local coords = jackolantern_locations[random_index]
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
            notify.info("Jack o'Lantern", "Teleported to " .. jackolantern_names[random_index])
        end)
    end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Snowmen Collectibles", function()
snowmenMenu = EventsMenu:Tab("Snowmen Collectibles")

-- Snowman locations array
snowmen_locations = {
    Vector3(-955.5352, -782.4186, 15.925326),
    Vector3(-819.9067, 165.35524, 71.26295),
    Vector3(-247.92003, -1561.2175, 32.22973),
    Vector3(901.3996, -288.05026, 65.643715),
    Vector3(1275.6772, -642.3789, 68.208786),
    Vector3(1993.1008, 3829.6396, 32.167336),
    Vector3(-375.47916, 6230.158, 31.490055),
    Vector3(-1414.4647, 5094.9272, 60.674263),
    Vector3(-1946.0231, 594.93756, 119.79223),
    Vector3(-1100.889, -1401.0138, 5.215467),
    Vector3(-780.418, 877.2859, 203.18001),
    Vector3(-455.12027, 1130.5625, 325.89175),
    Vector3(221.46722, -107.01075, 69.763985),
    Vector3(1560.3787, 6447.053, 23.9866),
    Vector3(3301.7886, 5149.8853, 18.34274),
    Vector3(1703.0568, 4671.928, 43.15301),
    Vector3(224.9161, 3107.3345, 42.18394),
    Vector3(2360.0037, 2522.7166, 46.66731),
    Vector3(1510.8555, 1725.0353, 109.89355),
    Vector3(-48.96374, 1964.4028, 189.87181),
    Vector3(-1516.2083, 2140.2168, 56.11924),
    Vector3(-2826.2356, 1424.6211, 100.706116),
    Vector3(-2957.531, 723.6389, 28.792404),
    Vector3(1341.4302, -1583.5093, 54.135414),
    Vector3(178.00232, -895.9712, 30.69326),
}

-- Snowman location names (numbered 01-25)
snowmen_names = {}
for i = 1, 25 do
    snowmen_names[i] = "Location " .. string.format("%02d", i)
end

-- Variables
snowmen_selected_loc = 0

-- Add the checkbox for enabling snowmen collectibles
snowmenMenu:Columns(1)
snowmenMenu:Box("Event")
SNOWMENCB = snowmenMenu:Toggle("Enable Snowmen Collectibles", "Enables the Snowmen Collectibles event. This allows you to collect snowmen by blowing them up or driving your car through them during the winter event.")


script.run_in_callback(function()
    local tick = function()
        script.yield()
        local want = SNOWMENCB:get_value() and 1 or 0
        if want ~= _snowmenPrev then
            tunables.set_bool("COLLECTABLES_SNOWMEN", want == 1)
            _snowmenPrev = want
        end
        script.yield(100)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

-- Add ImGui for the snowman teleports
snowmenMenu:Box("Teleport")
snowmenMenu:Custom(function()

    ImGui.Text("Select Snowman Location:")
    help_marker("Choose a location from the dropdown list to teleport to.")

    ImGui.SetNextItemWidth(265)
    snowmen_selected_loc = ImGui.Combo("##snowmen_selected_loc", snowmen_selected_loc, snowmen_names, 25)

    ImGui.SameLine()

    if ImGui.Button("Teleport to Location") then
        script.run_in_callback(function()
            local coords = snowmen_locations[snowmen_selected_loc + 1]
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
        end)
    end
    help_marker("Teleports you to the selected Snowman location.")
end)
snowmenMenu:Box("Quick Teleport")
snowmenMenu:Custom(function()
    -- Add quick teleport buttons in rows of 5
    for i = 0, 24 do

        if ImGui.Button(snowmen_names[i + 1]) then
            script.run_in_callback(function()
                local coords = snowmen_locations[i + 1]
                PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
            end)
        end

        if i % 4 ~= 3 and i < 24 then
            ImGui.SameLine()
        end
    end
end)
snowmenMenu:Box("Random")
snowmenMenu:Custom(function()
    ImGui.Text("Total Snowman Locations: 25")

    if ImGui.Button("Teleport to Random Snowman") then
        script.run_in_callback(function()
            local random_index = math.random(1, 25)
            local coords = snowmen_locations[random_index]
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
            notify.info("Snowman", "Teleported to " .. snowmen_names[random_index])
        end)
    end
    help_marker(
        "Teleports you to a random Snowman location. Blow them up or drive through them to collect them all!"
    )
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Yeti Hunt", function()
YetiHuntMenu = EventsMenu:Tab("Yeti Hunt")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Yeti Hunt locations array
yeti_locations = {
    Vector3(-1562.69, 4699.04, 50.426),
    Vector3(-1359.869, 4733.429, 46.919),
    Vector3(-1715.398, 4501.203, 0.096),
    Vector3(-1282.18, 4487.826, 12.643),
    Vector3(-1569.665, 4478.485, 20.215),
    Vector3(-1345.828, 4838.062, 137.522),
    Vector3(-1507.88, 4730.23, 45.54),
}

-- Yeti location names
yeti_names = {
    "Clue Location 1",
    "Clue Location 2",
    "Clue Location 3",
    "Clue Location 4",
    "Clue Location 5",
    "Yeti Fight Location (1)",
    "Yeti Fight Location (2)",
}

-- Variables
yeti_selected_loc = 0

-- Add Yeti Hunt checkbox with help marker
YetiHuntMenu:Columns(1)
YetiHuntMenu:Box("Event")
YETIHUNTCB = YetiHuntMenu:Toggle("Enable Yeti Hunt Event", "Enables the Yeti Hunt event. This allows you to hunt the Yeti and collect clues during the event.")


script.run_in_callback(function()
    local tick = function()
        script.yield()
        local want = YETIHUNTCB:get_value() and 1 or 0
        if want ~= _yetiPrev then
            tunables.set_bool(1833904680, want == 1)
            _yetiPrev = want
        end
        script.yield(100)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

-- Add ImGui for Yeti Hunt teleports
YetiHuntMenu:Box("Teleport")
YetiHuntMenu:Custom(function()

    ImGui.Text("Select Yeti Location:")
    help_marker("Choose a location from the dropdown list to teleport to.")

    ImGui.SetNextItemWidth(265)
    yeti_selected_loc = ImGui.Combo("##yeti_selected_loc", yeti_selected_loc, yeti_names, 7)

    ImGui.SameLine()

    if ImGui.Button("Teleport to Location") then
        script.run_in_callback(function()
            local coords = yeti_locations[yeti_selected_loc + 1]
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
        end)
    end
    help_marker("Teleports you to the selected Yeti location.")
end)
YetiHuntMenu:Box("Quick Teleport")
YetiHuntMenu:Custom(function()
    -- Add quick teleport buttons in rows of 3 (all 7 locations)
    for i = 0, 6 do

        if ImGui.Button(yeti_names[i + 1]) then
            script.run_in_callback(function()
                local coords = yeti_locations[i + 1]
                PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
            end)
        end

        if i % 2 ~= 1 and i < 6 then
            ImGui.SameLine()
        end
    end
end)
YetiHuntMenu:Box("Random")
YetiHuntMenu:Custom(function()
    ImGui.Text("Total Yeti Locations: 7 (5 Clues + 2 Fight)")

    if ImGui.Button("Teleport to Random Yeti Location") then
        script.run_in_callback(function()
            local random_index = math.random(1, 7)
            local coords = yeti_locations[random_index]
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
            notify.info("Yeti Hunt", "Teleported to " .. yeti_names[random_index])
        end)
    end
    help_marker("Teleports you to a random Yeti location. Find all the clues to hunt the Yeti!")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Business", function()
BusinessesMenu = Menu:Tab("Business"):RequireOnline()

local function BusinessStatEditor(page, title, entries, after)
    page:Box(title)
    local inputs, skips = {}, {}
    for i, entry in ipairs(entries) do
        inputs[i] = page:InputInt(entry[1])
        local group = entry[3]
        if group and not skips[group] then
            skips[group] = page:Toggle("Don't Apply " .. group, "Decides whether the " .. group:lower() .. " values are applied or not.")
        end
    end
    page:Button("Refresh " .. title, function()
        for i, entry in ipairs(entries) do
            inputs[i]:set_value(stats.get_int(MPX() .. entry[2]))
        end
        notify.info(tostring(title), "Current values loaded")
    end)
    page:Button("Apply " .. title, function()
        local values = {}
        for i, entry in ipairs(entries) do
            local group = entry[3]
            if not (group and skips[group]:get_value()) then
                local value = inputs[i]:get_value()
                stats.set_int(MPX() .. entry[2], value)
                values[entry[2]] = value
            end
        end
        if after then after(values) end
        notify.info(tostring(title), "Stats should've been applied. Change session to see them")
    end)
end

local function LoopToggle(page, name, desc, onTick, onOff, interval)
    local toggle = page:Toggle(name, desc)
    local wasOn = false
    script.run_in_callback(function()
        local tick = function()
                script.yield()
                if not network.is_session_started() or scripts.is_active("maintransition") then
                    script.yield(500)
                    return
                end
                if toggle:get_value() then
                    wasOn = true
                    onTick()
                    script.yield(interval or 500)
                elseif wasOn then
                    wasOn = false
                    if onOff then onOff() end
                    script.yield(500)
                else
                    script.yield(500)
                end
            end
        while true do
            local ok, err = pcall(tick)
            if not ok then
                log.error("[" .. MENU_NAME .. "] " .. tostring(err))
                script.yield(1000)
            end
            script.yield()
        end
    end)
    return toggle
end

local function SetTunableList(list, restore)
    for _, t in ipairs(list) do
        local value = restore and t[2] or 0
        if t[3] then tunables.set_float(t[1], value) else tunables.set_int(t[1], value) end
    end
end

local function CooldownToggle(page, list)
    LoopToggle(page, "Kill Cooldowns", "Skips almost all cooldowns.",
        function() SetTunableList(list, false) end,
        function() SetTunableList(list, true) end, 1000)
end

local function SetPackedBools(first, last)
    for i = first, last or first do
        stats.set_packed_bool(i, true)
    end
end

local function SupplyGlobal(slot)
    return SUPPLY_GLOBAL + slot + 1
end

local function BunkerTriggerProduction()
    ScriptGlobal(BUNKER_PRODUCTION_GLOBAL + 1 + 5 * 2):set_int(0)
    ScriptGlobal(BUNKER_PRODUCTION_GLOBAL + 1 + 5 * 2 + 1):set_int(1)
end

local function SetXpGain(disabled)
    tunables.set_float("XP_MULTIPLIER", disabled and 0.0 or 1.0)
end

local function TeleportToBlip(sprite, label)
    local blip = HUD.GET_FIRST_BLIP_INFO_ID(sprite)
    if blip ~= 0 and HUD.DOES_BLIP_EXIST(blip) then
        selfTP(true, false, HUD.GET_BLIP_COORDS(blip))
    else
        notify.info(tostring(label), "Entrance blip not found. Do you own it?")
    end
end

local function TeleportButtons(page, label, sprite, xyz, laptopName)
    page:Button("Teleport to Entrance", function() TeleportToBlip(sprite, label) end, "Teleports you to the entrance of your " .. label .. ".")
    page:Button("Teleport to " .. laptopName, function()
        selfTP(false, true, { x = xyz[1], y = xyz[2], z = xyz[3] }, xyz[4])
    end, "Teleports you to the " .. label .. " " .. laptopName:lower() .. ".")
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoMenu = BusinessesMenu:Tab("Hangar Cargo")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoMenu:Box("Crate Value")
local hanvalue = AirCargoMenu:InputInt("Crate Value")

AirCargoMenu:Button("Set Value", function()
    local HangarCrateVlaue = hanvalue:get_value()
    if HangarCrateVlaue < 0 or HangarCrateVlaue > 6000000 then
        notify.info("Crate Value Setter", "Value must be 0-6000000.")
        return
    end
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_MIXED", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_ANIMAL_MATERIALS", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_ART_AND_ANTIQUES", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_CHEMICALS", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_COUNTERFEIT_GOODS", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_JEWELRY_AND_GEMSTONES", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_MEDICAL_SUPPLIES", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_NARCOTICS", HangarCrateVlaue)
    tunables.set_int("SMUG_SELL_PRICE_PER_CRATE_TOBACCO_AND_ALCOHOL", HangarCrateVlaue)
    notify.info("Crate Value Setter", "Your Crate Value was set to " .. HangarCrateVlaue .. ".")
end)


AirCargoMenu:Box("Options")
RCRT = AirCargoMenu:Toggle("Remove Ron's Cut")
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            script.yield(500)
            return
        end
        local want = RCRT:get_value() and 0 or 0.025
        if want ~= _ronPrev then
            tunables.set_float("SMUG_SELL_RONS_CUT", want)
            _ronPrev = want
        end
        script.yield(500)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)


PRPGD = AirCargoMenu:Toggle("Disable Player RP Gain")
script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            script.yield(500)
            return
        end
        local want = PRPGD:get_value() and 0 or 1
        if want ~= _prpgdPrev then
            tunables.set_float("XP_MULTIPLIER", want)
            _prpgdPrev = want
        end
        script.yield(500)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)


AirCargoMenu:Button("Open Hangar Screen", function()
    OpenScreenScript("appsmuggler", 4592)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local hangarPrice = { { "SMUG_SELL_PRICE_PER_CRATE_MIXED", 30000 }, { "SMUG_SELL_RONS_CUT", 0.025, true } }
AirCargoMenu:Box("Sale")
LoopToggle(AirCargoMenu, "Maximize Price", "CAUTION: might be unsafe, bans reported in the past.\nApplies the maximum price for your cargo. Use it in a solo session.",
    function()
        local total = stats.get_int(MPX() .. "HANGAR_CONTRABAND_TOTAL")
        if total > 0 then
            tunables.set_int(hangarPrice[1][1], math.floor(4000000 / total))
        end
    end,
    function() SetTunableList(hangarPrice, true) end, 1000)

local hangarNoXp = AirCargoMenu:Toggle("No XP Gain", "Disables the XP gain for sell missions.")
AirCargoMenu:Button("Instant Air Cargo Sell", function()
    SetXpGain(hangarNoXp:get_value())
    if scripts.is_active("gb_smuggler") then ScriptLocal("gb_smuggler", 1991 + 1035):set_int((scripts.is_active("gb_smuggler") and ScriptLocal("gb_smuggler", 1991 + 1078):get_int() or 0)) end
    notify.info("Hangar", "Sell mission should've been finished")
end, "Finishes the air cargo sell mission instantly. Use after you can see the minimap.")

AirCargoMenu:Box("Supplies")
AirCargoMenu:Button("Get Cargo", function()
    if scripts.is_active("appsmuggler") then
        notify.info("Hangar", "Close the laptop first.")
        return
    end
    SetPackedBools(36828)
    notify.info("Hangar", "Cargo should've been received")
end, "Gets cargo for your Hangar.")
LoopToggle(AirCargoMenu, "Turkish Supplier", "Fills your Hangar stock repeatedly.",
    function()
        if not scripts.is_active("appsmuggler") then
            SetPackedBools(36828)
        end
    end, nil, 1000)


AirCargoMenu:Box("Misc")
AirCargoMenu:Button("Skip Setup", function()
    SetPackedBools(15966)
    notify.info("Hangar", "Setup should've been skipped")
end, "Skips the setup mission for your Hangar.")
TeleportButtons(AirCargoMenu, "Hangar", 569, { -1239.059, -3001.454, -42.867, 146.258 }, "Laptop")
CooldownToggle(AirCargoMenu, {
    { "SMUG_STEAL_EASY_COOLDOWN_TIMER", 120000 },
    { "SMUG_STEAL_MED_COOLDOWN_TIMER", 180000 },
    { "SMUG_STEAL_HARD_COOLDOWN_TIMER", 240000 },
    { "SMUG_STEAL_ADDITIONAL_CRATE_COOLDOWN_TIME", 60000 },
    { "SMUG_SELL_SELL_COOLDOWN_TIMER", 180000 },
})

BusinessStatEditor(AirCargoMenu, "Hangar Stats", {
    { "Buy Made", "LFETIME_HANGAR_BUY_COMPLET", "Buy" },
    { "Buy Undertaken", "LFETIME_HANGAR_BUY_UNDETAK", "Buy" },
    { "Sales Made", "LFETIME_HANGAR_SEL_COMPLET", "Sell" },
    { "Sales Undertaken", "LFETIME_HANGAR_SEL_UNDETAK", "Sell" },
    { "Earnings", "LFETIME_HANGAR_EARNINGS", "Earnings" },
})

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local BunkerMenu = BusinessesMenu:Tab("Bunker")
BunkerMenu:Box("Sale")
local bunkerPrice = {
    { "GR_MANU_PRODUCT_VALUE", 5000 },
    { "GR_MANU_PRODUCT_VALUE_STAFF_UPGRADE", 1000 },
    { "GR_MANU_PRODUCT_VALUE_EQUIPMENT_UPGRADE", 1000 },
}
LoopToggle(BunkerMenu, "Maximize Price", "CAUTION: might be unsafe, bans reported in the past.\nApplies the maximum price for your stock. Use it in a solo session with a filled stock.",
    function()
        local stock = stats.get_int(MPX() .. "PRODTOTALFORFACTORY5")
        if stock > 0 then
            tunables.set_int(bunkerPrice[1][1], math.floor((2500000 / 1.5) / stock))
            tunables.set_int(bunkerPrice[2][1], 0)
            tunables.set_int(bunkerPrice[3][1], 0)
        else
            ScriptGlobal(SupplyGlobal(5)):set_int(1)
            script.yield(1000)
            BunkerTriggerProduction()
        end
    end,
    function()
        SetTunableList(bunkerPrice, true)
    end, 1000)

local bunkerNoXp = BunkerMenu:Toggle("No XP Gain", "Disables the XP gain for sell missions.")
BunkerMenu:Button("Instant Sell", function()
    SetXpGain(bunkerNoXp:get_value())
    if scripts.is_active("gb_gunrunning") then ScriptLocal("gb_gunrunning", 1268 + 774):set_int(0) end
    notify.info("Bunker", "Sell mission should've been finished")
end, "Finishes the sell mission instantly. Use after you can see the minimap.")

BunkerMenu:Box("Supplies")
BunkerMenu:Button("Get Supplies", function()
    ScriptGlobal(SupplyGlobal(5)):set_int(1)
    notify.info("Bunker", "Supplies should've been received")
end, "Gets supplies for your Bunker.")
BunkerMenu:Button("Trigger Production", function()
    if not scripts.is_active("appbunkerbusiness") then
        BunkerTriggerProduction()
        notify.info("Bunker", "Production should've been triggered")
    end
end, "Triggers production of your stock.")
LoopToggle(BunkerMenu, "Turkish Supplier", "Fills your Bunker stock. Also gets supplies for your Bunker repeatedly.",
    function()
        if not scripts.is_active("appbunkerbusiness") then
            ScriptGlobal(SupplyGlobal(5)):set_int(1)
            BunkerTriggerProduction()
        end
    end,
    function() ScriptGlobal(SupplyGlobal(5)):set_int(0) end, 1000)

BunkerMenu:Box("Misc")
BunkerMenu:Button("Skip Setup", function()
    stats.set_int(MPX() .. "FACTORYSETUP5", 1)
    notify.info("Bunker", "Setup should've been skipped")
end, "Skips the setup mission for your Bunker.")
TeleportButtons(BunkerMenu, "Bunker", 557, { 907.515, -3207.357, -97.187, 245.099 }, "Laptop")
BunkerMenu:Button("Open Laptop", function() OpenScreenScript("appbunkerbusiness", 4592) end, "Opens the Bunker's laptop screen.")

BusinessStatEditor(BunkerMenu, "Bunker Stats", {
    { "Sales Made", "LIFETIME_BKR_SEL_COMPLETBC5", "Sell" },
    { "Sales Undertaken", "LIFETIME_BKR_SEL_UNDERTABC5", "Sell" },
    { "Earnings", "LIFETIME_BKR_SELL_EARNINGS5", "Earnings" },
}, function(values)
    if values.LIFETIME_BKR_SEL_COMPLETBC5 then
        stats.set_int(MPX() .. "BUNKER_UNITS_MANUFAC", values.LIFETIME_BKR_SEL_COMPLETBC5 * 100)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local MoneyFrontsMenu = BusinessesMenu:Tab("Money Fronts")
local fronts = {
    { name = "Hands On Car Wash", short = "Car Wash", packed = 24924, blip = 931, blipHot = 933, xyz = { 23.684, -1400.633, -73.999, 357.518 } },
    { name = "Smoke on the Water", short = "Weed Shop", packed = 24925, blip = 925, blipHot = 927, xyz = { -1160.636, -1535.462, -48.994, 180.271 } },
    { name = "Higgins Helitours", short = "Tour Company", packed = 24926, blip = 928, blipHot = 930, xyz = { -1160.599, -1535.585, -48.999, 177.268 } },
}

local function GetHeat(front)
    return stats.get_packed_int(front.packed)
end

local function SetHeat(front, value)
    stats.set_packed_int(front.packed, value)
end

for _, front in ipairs(fronts) do
    MoneyFrontsMenu:Box(front.name)
    MoneyFrontsMenu:Button("Teleport to Entrance", function()
        TeleportToBlip(GetHeat(front) ~= 100 and front.blip or front.blipHot, front.short)
    end, "Teleports you to the entrance of your " .. front.short .. ".")
    MoneyFrontsMenu:Button("Teleport to Laptop", function()
        selfTP(false, true, { x = front.xyz[1], y = front.xyz[2], z = front.xyz[3] }, front.xyz[4])
    end, "Teleports you to the " .. front.short .. " laptop.")
    local lockedHeat
    LoopToggle(MoneyFrontsMenu, "Lock Heat", "Locks the heat of your " .. front.short .. " on the current level.",
        function()
            lockedHeat = lockedHeat or GetHeat(front)
            SetHeat(front, lockedHeat)
        end,
        function() lockedHeat = nil end, 1000)
    MoneyFrontsMenu:Button("Max Heat", function()
        SetHeat(front, 100)
        notify.info(tostring(front.short), "Heat should've been maximized")
    end)
    MoneyFrontsMenu:Button("Min Heat", function()
        SetHeat(front, 0)
        notify.info(tostring(front.short), "Heat should've been minimized")
    end)
    local heatInput = MoneyFrontsMenu:InputInt("Heat Percentage")
    MoneyFrontsMenu:Button("Apply Heat Percentage", function()
        local value = math.max(0, math.min(100, heatInput:get_value()))
        SetHeat(front, value)
        notify.info(tostring(front.short), "Heat set to " .. value .. "%")
    end)
end

MoneyFrontsMenu:Box("Overall Heat")
local overallLocks
LoopToggle(MoneyFrontsMenu, "Lock Heat", "Locks the heat of all businesses on the current level.",
    function()
        if not overallLocks then
            overallLocks = {}
            for i, front in ipairs(fronts) do overallLocks[i] = GetHeat(front) end
        end
        for i, front in ipairs(fronts) do SetHeat(front, overallLocks[i]) end
    end,
    function() overallLocks = nil end, 1000)
MoneyFrontsMenu:Button("Max Heat", function()
    for _, front in ipairs(fronts) do SetHeat(front, 100) end
    notify.info("Money Fronts", "Heat should've been maximized")
end)
MoneyFrontsMenu:Button("Min Heat", function()
    for _, front in ipairs(fronts) do SetHeat(front, 0) end
    notify.info("Money Fronts", "Heat should've been minimized")
end)
local overallHeatInput = MoneyFrontsMenu:InputInt("Heat Percentage")
MoneyFrontsMenu:Button("Apply Heat Percentage", function()
    local value = math.max(0, math.min(100, overallHeatInput:get_value()))
    for _, front in ipairs(fronts) do SetHeat(front, value) end
    notify.info("Money Fronts", "Heat set to " .. value .. "%")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local NightclubMenu = BusinessesMenu:Tab("Nightclub")
local nightclubPrice = {
    { "BB_BUSINESS_BASIC_VALUE_WEAPONS", 5000, false, "HUB_PROD_TOTAL_1" },
    { "BB_BUSINESS_BASIC_VALUE_COKE", 27000, false, "HUB_PROD_TOTAL_2" },
    { "BB_BUSINESS_BASIC_VALUE_METH", 11475, false, "HUB_PROD_TOTAL_3" },
    { "BB_BUSINESS_BASIC_VALUE_WEED", 2025, false, "HUB_PROD_TOTAL_4" },
    { "BB_BUSINESS_BASIC_VALUE_FORGED_DOCUMENTS", 1350, false, "HUB_PROD_TOTAL_5" },
    { "BB_BUSINESS_BASIC_VALUE_COUNTERFEIT_CASH", 4725, false, "HUB_PROD_TOTAL_6" },
    { "BB_BUSINESS_BASIC_VALUE_CARGO", 10000, false, "HUB_PROD_TOTAL_0" },
}
NightclubMenu:Box("Sale")
LoopToggle(NightclubMenu, "Maximize Price", "CAUTION: might be unsafe, bans reported in the past.\nApplies the maximum price for your goods. Use it in a solo session and don't use \"Sell All Goods\".",
    function()
        for _, product in ipairs(nightclubPrice) do
            local total = stats.get_int(MPX() .. product[4])
            if total > 0 then
                tunables.set_int(product[1], math.floor(4000000 / total))
            end
        end
    end,
    function() SetTunableList(nightclubPrice, true) end, 1000)

NightclubMenu:Box("Misc")
NightclubMenu:Button("Skip Setups", function()
    SetPackedBools(18161)
    SetPackedBools(22067)
    SetPackedBools(22068)
    notify.info("Nightclub", "Setups should've been skipped")
end, "Skips the setup missions for your Nightclub.")
TeleportButtons(NightclubMenu, "Nightclub", 614, { -1618.249, -3013.507, -75.205, 257.431 }, "Computer")
NightclubMenu:Button("Open Computer", function() OpenScreenScript("appbusinesshub", 4592) end, "Opens the Nightclub's computer screen.")
CooldownToggle(NightclubMenu, {
    { "BB_CLUB_MANAGEMENT_CLUB_MANAGEMENT_MISSION_COOLDOWN", 300000 },
    { "BB_SELL_MISSIONS_MISSION_COOLDOWN", 300000 },
    { "BB_SELL_MISSIONS_DELIVERY_VEHICLE_COOLDOWN_AFTER_SELL_MISSION", 300000 },
})

NightclubMenu:Box("Safe")
NightclubMenu:Button("Fill Safe", function()
    tunables.set_int("NIGHTCLUBMAXSAFEVALUE", 300000)
    for i = NIGHTCLUB_INCOME_START, NIGHTCLUB_INCOME_END do
        ScriptGlobal(i):set_int(300000)
    end
    stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
    notify.info("Nightclub", "Safe should've been filled")
end, "ATTENTION: might be unsafe, if overused.\nFills your Nightclub safe with money.")
local function CollectNightclubSafe()
    CollectSafeRemote(1)
    if scripts.is_active("am_mp_nightclub") then
        -- Collect request: locals 269 and 267 are set together, the game reacts on its own (found by recording a working collect).
        ScriptLocal("am_mp_nightclub", 269):set_int(1)
        ScriptLocal("am_mp_nightclub", 267):set_int(1)
    end
end
NightclubMenu:Button("Collect Safe", function()
    local value = stats.get_int(MPX() .. "CLUB_SAFE_CASH_VALUE")
    if value ~= 0 then
        CollectNightclubSafe()
        notify.info("Nightclub", "Safe money should've been collected")
    else
        notify.info("Nightclub", "Nightclub safe is empty")
    end
end, "ATTENTION: might be unsafe, if overused.\nCollects money from your Nightclub safe. Works from anywhere on Enhanced.")
NightclubMenu:Button("Unbrick Safe", function()
    for i = NIGHTCLUB_INCOME_START, NIGHTCLUB_INCOME_END do
        ScriptGlobal(i):set_int(1)
    end
    stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
    script.yield(3000)
    CollectNightclubSafe()
    notify.info("Nightclub", "Safe should've been unbricked")
end, "Unbricks your safe if it shows a dollar sign with $0 inside. Use inside your Nightclub.")
LoopToggle(NightclubMenu, "Nightclub $300k/5s (Safe Remote AFK)", "ATTENTION: use at your own risk.\nFills the safe with $300k and collects it again, over and over.",
    function()
        for i = NIGHTCLUB_INCOME_START, NIGHTCLUB_INCOME_END do
            ScriptGlobal(i):set_int(300000)
        end
        ScriptGlobal(NIGHTCLUB_SAFE_CAPACITY):set_int(300000)
        stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
        script.yield(2500)
        CollectNightclubSafe()
        ScriptGlobal(TRANSACTION_ERROR_GLOBAL_1):set_int(0)
        ScriptGlobal(TRANSACTION_ERROR_GLOBAL_2):set_int(0)
        ScriptGlobal(TRANSACTION_ERROR_GLOBAL_3):set_int(0)
    end, nil, 2500)

NightclubMenu:Box("Popularity")
local lockedPopularity
LoopToggle(NightclubMenu, "Lock Popularity", "Locks the popularity of your Nightclub on the current level.",
    function()
        lockedPopularity = lockedPopularity or stats.get_int(MPX() .. "CLUB_POPULARITY")
        stats.set_int(MPX() .. "CLUB_POPULARITY", lockedPopularity)
    end,
    function() lockedPopularity = nil end, 1000)
NightclubMenu:Button("Max Popularity", function()
    stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
    notify.info("Nightclub", "Popularity should've been maximized")
end)
NightclubMenu:Button("Min Popularity", function()
    stats.set_int(MPX() .. "CLUB_POPULARITY", 0)
    notify.info("Nightclub", "Popularity should've been minimized")
end)
local popularityValue = NightclubMenu:InputInt("Popularity (0-100%)")
NightclubMenu:Button("Apply Popularity", function()
    local value = math.max(0, math.min(100, popularityValue:get_value()))
    stats.set_int(MPX() .. "CLUB_POPULARITY", value * 10)
    notify.info("Nightclub", "Popularity set to " .. value .. "%")
end)

BusinessStatEditor(NightclubMenu, "Nightclub Stats", {
    { "Sales Made", "HUB_SALES_COMPLETED", "Sell" },
    { "Earnings", "HUB_EARNINGS", "Earnings" },
})

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local SpecialCargoMenu = BusinessesMenu:Tab("Special Cargo")
local specialDivisors = { 1, 2, 3, 5, 7, 9, 14, 19, 24, 29, 34, 39, 44, 49, 59, 69, 79, 89, 99, 110, 111 }
local specialDefaults = { 10000, 11000, 12000, 13000, 13500, 14000, 14500, 15000, 15500, 16000, 16500, 17000, 17500, 17750, 18000, 18250, 18500, 18750, 19000, 19500, 20000 }
local specialPrice = {}
for i = 1, 21 do
    specialPrice[i] = { "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD" .. i, specialDefaults[i] }
end
SpecialCargoMenu:Box("Sale")
LoopToggle(SpecialCargoMenu, "Maximize Price", "CAUTION: might be unsafe, bans reported in the past.\nApplies the maximum price for your crates. Use it in a solo session.",
    function()
        for i, entry in ipairs(specialPrice) do
            tunables.set_int(entry[1], math.floor(6000000 / specialDivisors[i]))
        end
    end,
    function() SetTunableList(specialPrice, true) end, 1000)

local specialNoXp = SpecialCargoMenu:Toggle("No XP Gain", "Disables the XP gain for sell missions.")
local specialNoCrateBack = SpecialCargoMenu:Toggle("No CrateBack", "Disables the auto refill of the crates after Instant Sell.")
SpecialCargoMenu:Button("Instant Sell", function()
    if not specialNoCrateBack:get_value() and scripts.is_active("gb_contraband_sell") then
        SetPackedBools(32359, 32363)
    end
    SetXpGain(specialNoXp:get_value())
    local sell = util.joaat("gb_contraband_sell")
    if scripts.is_active(sell) then ScriptLocal(sell, 576 + 595):set_int(1) end
    if scripts.is_active(sell) then ScriptLocal(sell, 576 + 55):set_int(0) end
    if scripts.is_active(sell) then ScriptLocal(sell, 576 + 584):set_int(0) end
    if scripts.is_active(sell) then ScriptLocal(sell, 576 + 7):set_int(7) end
    script.yield(500)
    if scripts.is_active(sell) then ScriptLocal(sell, 576 + 1):set_int(99999) end
    notify.info("Special Cargo", "Sell mission should've been finished")
end, "Finishes the sell mission instantly. Use after you can see the minimap.")

SpecialCargoMenu:Box("Supplies")
local specialAmount = SpecialCargoMenu:InputInt("Crates Amount (0-111)")
SpecialCargoMenu:Button("Max Crates Amount", function()
    specialAmount:set_value(111)
end, "Maximizes the crates amount, but does not buy them.")
SpecialCargoMenu:Button("Instant Buy", function()
    if scripts.is_active("gb_contraband_buy") then ScriptLocal("gb_contraband_buy", 634 + 1):set_int(math.max(0, math.min(111, specialAmount:get_value()))) end
    if scripts.is_active("gb_contraband_buy") then ScriptLocal("gb_contraband_buy", 634 + 5):set_int(1) end
    if scripts.is_active("gb_contraband_buy") then ScriptLocal("gb_contraband_buy", 634 + 191):set_int(6) end
    if scripts.is_active("gb_contraband_buy") then ScriptLocal("gb_contraband_buy", 634 + 192):set_int(4) end
    notify.info("Special Cargo", "Buy mission should've been finished")
end, "Finishes the buy mission instantly. Use after you can see the minimap.")
SpecialCargoMenu:Button("Get Crates", function()
    SetPackedBools(32359, 32363)
    notify.info("Special Cargo", "Crates should've been received")
end, "Gets some crates for your Crate Warehouses.")
LoopToggle(SpecialCargoMenu, "Turkish Supplier", "Fills your Crate Warehouse stock repeatedly.",
    function() SetPackedBools(32359, 32363) end, nil, 1000)

SpecialCargoMenu:Box("CEO Manager")
local ceoCrateValue = 0
SpecialCargoMenu:Custom(function()
    local value, used = ImGui.InputInt("Crate Value", ceoCrateValue, 10000, 100000)
    value = math.max(0, math.min(6000000, value))
    ceoCrateValue = value
    if used then
        tunables.set_int("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1", ceoCrateValue)
    end
end)
SpecialCargoMenu:Button("Open Warehouse Screen", function()
    OpenScreenScript("appsecuroserv", 8344)
end, "Opens the Warehouse computer screen.")
LoopToggle(SpecialCargoMenu, "Start CEO Manager", "ATTENTION: use at your own risk.\nCompletes buy and sell missions automatically and keeps the Warehouse screen running.",
    function()
        local sell, shop, buy = util.joaat("gb_contraband_sell"), util.joaat("appsecuroserv"), util.joaat("gb_contraband_buy")
        if (scripts.is_active(sell) and ScriptLocal(sell, 2):get_int() or 0) == 1 then
            ScriptLocal(sell, 576 + 595):set_int(1)
            ScriptLocal(sell, 576 + 55):set_int(0)
            ScriptLocal(sell, 576 + 584):set_int(0)
            ScriptLocal(sell, 576 + 7):set_int(7)
            script.yield(500)
            if scripts.is_active(sell) then ScriptLocal(sell, 576 + 1):set_int(99999) end
        end
        if (scripts.is_active(shop) and ScriptLocal(shop, 2):get_int() or 0) == 1 then
            script.yield(500)
            if scripts.is_active(shop) then ScriptLocal(shop, 773):set_int(1) end
            script.yield(200)
            if scripts.is_active(shop) then ScriptLocal(shop, 772):set_int(1) end
            script.yield(200)
            if scripts.is_active(shop) then ScriptLocal(shop, 591):set_int(3012) end
            script.yield(1000)
        end
        if (scripts.is_active(buy) and ScriptLocal(buy, 2):get_int() or 0) == 1 then
            ScriptLocal(buy, 634 + 5):set_int(1)
            ScriptLocal(buy, 634 + 1):set_int(111)
            ScriptLocal(buy, 634 + 191):set_int(6)
            ScriptLocal(buy, 634 + 192):set_int(4)
            notify.info("CEO Manager", "Your Warehouse is now full! 111/111 Crates")
        end
        if (scripts.is_active(sell) and ScriptLocal(sell, 2):get_int() or 0) ~= 1 then
            script.yield(500)
            if (scripts.is_active("am_mp_warehouse") and ScriptLocal("am_mp_warehouse", 2):get_int() or 0) == 1 then
                OpenScreenScript("appsecuroserv", 8344)
            end
        end
    end, nil, 500)
SpecialCargoMenu:Text("First enter your Warehouse.")
SpecialCargoMenu:Text("Then stand in front of your Warehouse computer and activate Start CEO Manager.")

SpecialCargoMenu:Box("Misc")
SpecialCargoMenu:Button("Teleport to Office", function() TeleportToBlip(475, "Office") end, "Teleports you to the Office's entrance.")
SpecialCargoMenu:Button("Teleport to Computer", function()
    selfTP(false, true, { x = -81.345, y = -802.471, z = 243.387 }, 278.402)
end, "Teleports you to the Office's computer.")
SpecialCargoMenu:Button("Teleport to Warehouse", function() TeleportToBlip(473, "Warehouse") end, "Teleports you to the closest Crate Warehouse's entrance.")
CooldownToggle(SpecialCargoMenu, {
    { "EXEC_BUY_COOLDOWN", 300000 },
    { "EXEC_SELL_COOLDOWN", 1800000 },
})

BusinessStatEditor(SpecialCargoMenu, "Special Cargo Stats", {
    { "Buy Made", "LIFETIME_BUY_COMPLETE", "Buy" },
    { "Buy Undertaken", "LIFETIME_BUY_UNDERTAKEN", "Buy" },
    { "Sales Made", "LIFETIME_SELL_COMPLETE", "Sell" },
    { "Sales Undertaken", "LIFETIME_SELL_UNDERTAKEN", "Sell" },
    { "Earnings", "LIFETIME_CONTRA_EARNINGS", "Earnings" },
})

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local BusinessMiscMenu = BusinessesMenu:Tab("Misc")
BusinessMiscMenu:Box("Supplies")
local supplyBusinesses = { "MC Business 1", "MC Business 2", "MC Business 3", "MC Business 4", "MC Business 5", "Bunker", "Acid Lab", "All" }
local supplyIndex = 0
BusinessMiscMenu:Custom(function()
    supplyIndex = ImGui.Combo("Business", supplyIndex, supplyBusinesses, #supplyBusinesses)
end)
BusinessMiscMenu:Button("Resupply", function()
    if supplyIndex == 7 then
        for slot = 0, 6 do
            ScriptGlobal(SupplyGlobal(slot)):set_int(1)
            script.yield(3000)
        end
        notify.info("Supplies", "Supplies for all business stocks should've been resupplied")
    else
        ScriptGlobal(SupplyGlobal(supplyIndex)):set_int(1)
        notify.info("Supplies", "Supplies for the business stock should've been resupplied")
    end
end, "Resupplies the selected business.")

BusinessMiscMenu:Box("Safes (Enhanced)")
local safeNames = {}
for i, safe in ipairs(SAFE_COLLECT) do safeNames[i] = safe.name end
safeNames[#safeNames + 1] = "All"
local safeIndex = 0
BusinessMiscMenu:Custom(function()
    safeIndex = ImGui.Combo("Safe", safeIndex, safeNames, #safeNames)
    local safe = SAFE_COLLECT[safeIndex + 1]
    if safe then
        ImGui.Text("Inside: $" .. tostring(stats.get_int(MPX() .. safe.stat)))
    end
end)
BusinessMiscMenu:Button("Collect Safe", function()
    if safeIndex == #SAFE_COLLECT then
        local count = 0
        for i = 1, #SAFE_COLLECT do
            if CollectSafeRemote(i) then
                count = count + 1
                script.yield(3000)
            end
        end
        notify.info("Safes", tostring(count > 0 and "Safes should've been collected" or "All safes are empty"))
    elseif CollectSafeRemote(safeIndex + 1) then
        notify.info("Safes", SAFE_COLLECT[safeIndex + 1].name .. " safe should've been collected")
    else
        notify.info("Safes", SAFE_COLLECT[safeIndex + 1].name .. " safe is empty")
    end
end, "Enhanced only: collects the money of the selected business safe from anywhere.")

BusinessMiscMenu:Box("Bail Office")
TeleportButtons(BusinessMiscMenu, "Bail Office", 893, { 562.959, -2705.590, -48.997, 31.983 }, "Computer")
BusinessMiscMenu:Box("Garment Factory")
TeleportButtons(BusinessMiscMenu, "Garment Factory", 900, { 749.337, -995.654, -46.376, 50.750 }, "Computer")
BusinessMiscMenu:Button("Unbrick Computer", function()
    stats.set_int(MPX() .. "HACKER24_GEN_BS", -24607)
    notify.info("Garment Factory", "Computer should've been unbricked")
end, "Unbricks your computer after using features like Unlock All Awards.")
end)

Section("Gun Van", function()
local GVMENU = Menu:Tab("Gun Van"):RequireOnline()

local gunvan_locations = {
    Vector3(-29.532, 6435.136, 31.162),
    Vector3(1705.214, 4819.167, 41.75),
    Vector3(1795.522, 3899.753, 33.869),
    Vector3(1335.536, 2758.746, 51.099),
    Vector3(795.583, 1210.78, 338.962),
    Vector3(-3192.67, 1077.205, 20.594),
    Vector3(-789.719, 5400.921, 33.915),
    Vector3(-24.384, 3048.167, 40.703),
    Vector3(2666.786, 1469.324, 24.237),
    Vector3(-1454.966, 2667.503, 3.2),
    Vector3(2340.418, 3054.188, 47.888),
    Vector3(1509.183, -2146.795, 76.853),
    Vector3(1137.404, -1358.654, 34.322),
    Vector3(-57.208, -2658.793, 5.737),
    Vector3(1905.017, 565.222, 175.558),
    Vector3(974.484, -1718.798, 30.296),
    Vector3(779.077, -3266.297, 5.719),
    Vector3(-587.728, -1637.208, 19.611),
    Vector3(733.99, -736.803, 26.165),
    Vector3(-1694.632, -454.082, 40.712),
    Vector3(-1330.726, -1163.948, 4.313),
    Vector3(-496.618, 40.231, 52.316),
    Vector3(275.527, 66.509, 94.108),
    Vector3(260.928, -763.35, 30.559),
    Vector3(-478.025, -741.45, 30.299),
    Vector3(894.94, 3603.911, 32.56),
    Vector3(-2166.511, 4289.503, 48.733),
    Vector3(1465.633, 6553.67, 13.771),
    Vector3(1101.032, -335.172, 66.944),
    Vector3(149.683, -1655.674, 29.028),
}

local van_locations = {
    "Paleto Bay - 1",
    "Grapeseed - 2",
    "Sandy Shores - 3",
    "Grand Senora - 4",
    "Vinewood Hills - 5",
    "Chumash - 6",
    "Paleto Forest - 7",
    "Zancudo River - 8",
    "Power Station - 9",
    "Lago Zancudo - 10",
    "Grand Senora - 11",
    "El Burro Heights - 12",
    "Murrieta Heights - 13",
    "Elysian Island - 14",
    "Tataviam - 15",
    "La Mesa - 16",
    "Terminal - 17",
    "La Puerta - 18",
    "La Mesa - 19",
    "Del Perro - 20",
    "Magellan Ave - 21",
    "West Vinewood - 22",
    "Downtown Vinewood - 23",
    "Pillbox Hill - 24",
    "Little Seoul - 25",
    "Alamo Sea - 26",
    "North Chumash - 27",
    "Mount Chiliad - 28",
    "Mirror Park - 29",
    "Davis - 30",
}

local weapons_data = {
    "WEAPON_KNIFE",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BOTTLE",
    "WEAPON_DAGGER",
    "WEAPON_KNUCKLE",
    "WEAPON_MACHETE",
    "WEAPON_FLASHLIGHT",
    "WEAPON_SWITCHBLADE",
    "WEAPON_BATTLEAXE",
    "WEAPON_POOLCUE",
    "WEAPON_WRENCH",
    "WEAPON_HATCHET",
    "WEAPON_BAT",
    "WEAPON_CROWBAR",
    "WEAPON_STUNROD",
    "WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_RAYPISTOL",
    "WEAPON_CERAMICPISTOL",
    "WEAPON_NAVYREVOLVER",
    "WEAPON_GADGETPISTOL",
    "WEAPON_STUNGUN_MP",
    "WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_COMBATPDW",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_MINISMG",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_GUSENBERG",
    "WEAPON_RAYCARBINE",
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    "WEAPON_CARBINERIFLE",
    "WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE",
    "WEAPON_BULLPUPRIFLE_MK2",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_MILITARYRIFLE",
    "WEAPON_HEAVYRIFLE",
    "WEAPON_TACTICALRIFLE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_AUTOSHOTGUN",
    "WEAPON_COMBATSHOTGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_MARKSMANRIFLE_MK2",
    "WEAPON_PRECISIONRIFLE",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_COMPACTLAUNCHER",
    "WEAPON_RAYMINIGUN",
    "WEAPON_EMPLAUNCHER",
    "WEAPON_RAILGUNXM3",
    "WEAPON_TECPISTOL",
    "WEAPON_FIREWORK",
    "WEAPON_BATTLERIFLE",
    "WEAPON_SNOWLAUNCHER",
}
WeaponNames = weapons_data

selected_loc = 0
selected_slot = 0
is_typing = false
weapon_skins = false
gta_plus_blip = false
livery_lock = false
weapon_editor_popup = false
filter_text = ""
weapon_name = ""

gun_van_loc = 0
discount = false
gv_defaults = nil
gv_discount_pct = 100
throwable_slot = 0
throwable_pick = 0

local throwable_labels = { "Grenade", "Molotov", "Pipe Bomb", "Proximity Mine", "Tear Gas", "Sticky Bomb", "Jerry Can" }
local throwable_hashes = { "WEAPON_GRENADE", "WEAPON_MOLOTOV", "WEAPON_PIPEBOMB", "WEAPON_PROXMINE", "WEAPON_BZGAS", "WEAPON_STICKYBOMB", "WEAPON_PETROLCAN" }
local optimal_weapons = { "weapon_navyrevolver", "weapon_gadgetpistol", "weapon_stungun_mp", "weapon_doubleaction", "weapon_railgunxm3",
    "weapon_minigun", "weapon_heavysniper_mk2", "weapon_combatmg_mk2", "weapon_tacticalrifle", "weapon_specialcarbine_mk2" }
local optimal_throwables = { "weapon_stickybomb", "weapon_molotov", "weapon_pipebomb" }

local function GetGunVanLoc()
    local loc = ScriptGlobal(GUN_VAN_LOCATION_GLOBAL):get_int()
    return loc or 0
end

local function FindByModel(model_name, vehicle)
    local hash = util.joaat(model_name) % 0x100000000
    local handles = vehicle and entities.get_all_vehicles_as_handles() or entities.get_all_peds_as_handles()
    for _, handle in ipairs(handles) do
        if handle ~= 0 and ENTITY.GET_ENTITY_MODEL(handle) % 0x100000000 == hash then
            return handle
        end
    end
    return 0
end

local function UnlockGunVan(van)
    ENTITY.SET_ENTITY_SHOULD_FREEZE_WAITING_ON_COLLISION(van, false)
    ENTITY.FREEZE_ENTITY_POSITION(van, false)
    VEHICLE.SET_DONT_ALLOW_PLAYER_TO_ENTER_VEHICLE_IF_LOCKED_FOR_PLAYER(van, false)
    VEHICLE.SET_VEHICLE_RESPECTS_LOCKS_WHEN_HAS_DRIVER(van, false)
    VEHICLE.SET_VEHICLE_DOORS_LOCKED(van, 1)
end

local function MakeSellerShootable(seller)
    ENTITY.SET_ENTITY_COLLISION(seller, true, true)
    ENTITY.FREEZE_ENTITY_POSITION(seller, false)
    ENTITY.SET_ENTITY_INVINCIBLE(seller, false, false)
    for i = 0, 17 do
        PED.CLEAR_RAGDOLL_BLOCKING_FLAGS(seller, i)
    end
    PED.SET_PED_CONFIG_FLAG(seller, 128, true)
    PED.SET_PED_CONFIG_FLAG(seller, 179, false)
    PED.SET_PED_CONFIG_FLAG(seller, 208, false)
    PED.SET_PED_CONFIG_FLAG(seller, 294, false)
    PED.SET_PED_CONFIG_FLAG(seller, 430, true)
    PED.SET_PED_CONFIG_FLAG(seller, 118, true)
    PED.SET_PED_CONFIG_FLAG(seller, 116, false)
    PED.SET_PED_CONFIG_FLAG(seller, 461, true)
    ENTITY.SET_ENTITY_PROOFS(seller, false, false, false, false, false, false, false, false)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(seller, false)
    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(seller, true)
    PED.SET_PED_TREATED_AS_FRIENDLY(seller, false, false)
    PED.SET_PED_CAN_BE_TARGETTED(seller, true)
    PED.REMOVE_RELATIONSHIP_GROUP(seller, util.joaat("SHOPKEEPER_GUN_VAN"))
end

function render_weapon_editor()
    ImGui.SetNextWindowSize(700, 420)
    ImGui.OpenPopup("Weapon Editor")

    local _, draw_popup = ImGui.BeginPopupModal(
        "Weapon Editor",
        weapon_editor_popup,
        bit.bor(ImGuiWindowFlags.NoResize, ImGuiWindowFlags.NoCollapse, ImGuiWindowFlags.NoMove, ImGuiWindowFlags.Modal)
    )
    if draw_popup then
        selected_slot =
            ImGui.Combo("Select Slot", selected_slot, { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }, 10)

        filter_text = ImGui.InputText("Weapon Name", filter_text)
        if ImGui.IsItemActive() then
            is_typing = true
        else
            is_typing = false
        end

        if ImGui.BeginListBox("##weapons", 450.0, 200.0) then
            for index, item in ipairs(weapons_data) do
                local display_name = WeaponDisplayName(item)
                if string.find(display_name:lower(), filter_text:lower()) then
                    if ImGui.Selectable(display_name) then
                        filter_text = display_name
                        weapon_name = item
                    end
                end
            end
            ImGui.EndListBox()
        end

        if ImGui.Button("Set Weapon") then
            local is_weapon_valid = WeaponDisplayName(weapon_name) ~= ""

            if is_weapon_valid then
                tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, util.joaat(weapon_name))
            else
                notify.info("Gun Van", "Invalid weapon.")
            end
        end

        ImGui.SameLine()

        if ImGui.Button("Remove Weapon") then
            tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, 0)
        end

        ImGui.SameLine()

        if ImGui.Button("Set To Current Weapon") then
            local slot = selected_slot
            script.run_in_callback(function()
                local hash = Ped(PLAYER.PLAYER_PED_ID()):get_current_weapon()
                local has_weapon = hash ~= 0 and hash ~= util.joaat("WEAPON_UNARMED")
                if has_weapon then
                    tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. slot, hash)
                    notify.info("Gun Van", "Applied the current weapon to slot " .. (slot + 1) .. ".")
                else
                    notify.info("Gun Van", "No current weapon.")
                end
            end)
        end

        if ImGui.Button("Close") then
            selected_slot = 0
            filter_text = ""
            weapon_name = ""
            weapon_editor_popup = false
            ImGui.CloseCurrentPopup()
        end

        ImGui.EndPopup()
    end
end

script.run_in_callback(function()
    local tick = function()
        script.yield()
        if
            not network.is_session_started()
            or scripts.is_active("maintransition")
        then
            gv_defaults = nil
            script.yield(500)
            return
        end
        gun_van_loc = ScriptGlobal(GUN_VAN_LOCATION_GLOBAL):get_int()
    
        if not gv_defaults then
            gv_defaults = { weapons = {}, throwables = {}, position = gun_van_loc }
            for i = 0, 9 do
                gv_defaults.weapons[i] = tunables.get_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. i)
            end
            for i = 0, 2 do
                gv_defaults.throwables[i] = tunables.get_int("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. i)
            end
        end
    
        if is_typing then
            PAD.DISABLE_ALL_CONTROL_ACTIONS(0)
        end
    
        if weapon_skins then
            tunables.set_bool(1490225691, false)
        end
    
        if livery_lock then
            if scripts.is_active("gunclub_shop") then
                local value = ScriptLocal("gunclub_shop", 208 + 747):get_int()
                if value ~= nil then
                    value = bit.bor(value, bit.lshift(1, 8))
                    ScriptLocal("gunclub_shop", 208 + 747):set_int(value)
                end
            end
        end
    
        if gta_plus_blip then
            local gun_van_sprite = HUD.GET_FIRST_BLIP_INFO_ID(844)
    
            tunables.set_float(15999531, 10000.0)
            if HUD.DOES_BLIP_EXIST(gun_van_sprite) then
                HUD.SET_BLIP_AS_SHORT_RANGE(gun_van_sprite, false)
            end
        end
        script.yield(500)
    end
    while true do
        local ok, err = pcall(tick)
        if not ok then
            log.error("[" .. MENU_NAME .. "] " .. tostring(err))
            script.yield(1000)
        end
        script.yield()
    end
end)

GVMENU:Box("Location")
GVMENU:Custom(function()
    if weapon_editor_popup then
        render_weapon_editor()
    end

    ImGui.Text("Current Location: " .. (gun_van_loc ~= -1 and gun_van_loc + 1 or "N/A"))

    selected_loc = ImGui.Combo("##selected_loc", selected_loc, van_locations, 30)


    if ImGui.Button("Set New Gun Van Location") then
        ScriptGlobal(GUN_VAN_LOCATION_GLOBAL):set_int(selected_loc)
    end


    if ImGui.Button("Teleport") then
        script.run_in_callback(function()
            local coords = gunvan_locations[selected_loc + 1]
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
        end)
    end
end)
GVMENU:Button("Teleport To Gun Van", function()
    local coords = gunvan_locations[GetGunVanLoc() + 1]
    if not coords then return end
    PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
    script.yield(1000)
    local van = FindByModel("Speedo4", true)
    if van ~= 0 then
        local ped = PLAYER.PLAYER_PED_ID()
        local f = ENTITY.GET_ENTITY_FORWARD_VECTOR(van)
        local p = ENTITY.GET_ENTITY_COORDS(ped, true)
        ENTITY.SET_ENTITY_COORDS(ped, p.x - f.x * 3.5, p.y - f.y * 3.5, p.z - f.z * 3.5, false, false, false, true)
    end
end, "Teleports you behind the gun van, wherever it currently is.")
GVMENU:Button("Reset Position", function()
    if gv_defaults and gv_defaults.position ~= -1 then
        ScriptGlobal(GUN_VAN_LOCATION_GLOBAL):set_int(gv_defaults.position)
        notify.info("Gun Van", "The gun van was moved back to its original position.")
    else
        notify.info("Gun Van", "Original position is not known yet.")
    end
end)
GVMENU:Button("Set Waypoint", function()
    local coords = gunvan_locations[GetGunVanLoc() + 1]
    if not coords then return end
    HUD.SET_NEW_WAYPOINT(coords.x, coords.y)
    notify.info("Gun Van", "Your waypoint was set to the gun van.")
end)
GVMENU:Button("Mark On Map", function()
    local coords = gunvan_locations[GetGunVanLoc() + 1]
    if not coords then return end
    local blip = HUD.ADD_BLIP_FOR_COORD(coords.x, coords.y, coords.z)
    HUD.SET_BLIP_SPRITE(blip, 844)
    HUD.SET_BLIP_SCALE(blip, 1.2)
    notify.info("Gun Van", "You can now find the gun van on the map.")
end, "Places a gun van blip on the map no matter how far away you are.")
GVMENU:Box("Van")
GVMENU:Button("Unlock Gun Van", function()
    local van = FindByModel("Speedo4", true)
    if van == 0 then
        notify.info("Gun Van", "Failed to find the gun van.")
        return
    end
    UnlockGunVan(van)
    notify.info("Gun Van", "The gun van should now be unlocked.")
end, "Unlocks the gun van doors so you can drive it.")
GVMENU:Button("Drive Gun Van", function()
    local van = FindByModel("Speedo4", true)
    if van == 0 then
        notify.info("Gun Van", "Failed to find the gun van.")
        return
    end
    UnlockGunVan(van)
    PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), van, -1)
    notify.info("Gun Van", "The gun van should now be unlocked.")
end, "Same as unlock, but puts you into the driver seat too.")
GVMENU:Button("Seller Shootable", function()
    local seller = FindByModel("IG_GunVanSeller", false)
    if seller == 0 then
        notify.info("Gun Van", "Failed to find the gun van seller.")
        return
    end
    MakeSellerShootable(seller)
    notify.info("Gun Van", "The gun van seller should now be shootable.")
end, "Allows the gun van seller to be shot.")
GVMENU:Box("Options")
GVMENU:Custom(function()
    weapon_skins, on_tick = ImGui.Checkbox("Weapon Skins", weapon_skins)
    help_marker("Enables the special liveries for Knife and Baseball Bat.")

    if on_tick then
        if not weapon_skins then
            tunables.set_bool(1490225691, true)
        end
    end

    livery_lock, on_tick = ImGui.Checkbox("Remove Livery Lock", livery_lock)
    help_marker(
        "Removes the hard-coded lock on special weapon liveries, such as Season's Greetings, Employee of the Month etc."
    )

    if on_tick then
        if not livery_lock then
            local value = (scripts.is_active("gunclub_shop") and ScriptLocal("gunclub_shop", 208 + 747):get_int() or 0)
            if value ~= nil then
                value = bit.band(value, bit.bnot(bit.lshift(1, 8)))
                if scripts.is_active("gunclub_shop") then ScriptLocal("gunclub_shop", 208 + 747):set_int(value) end
            end
        end
    end

    gta_plus_blip, on_tick = ImGui.Checkbox("Blip Always Visible", gta_plus_blip)
    help_marker("The Gun Van will always be blipped on the map, just like in GTA+.")

    if on_tick then
        if not gta_plus_blip then
            tunables.set_float(15999531, 500.0)
        end
    end

    discount, on_tick = ImGui.Checkbox("Jewish Trade Skills (-10%)", discount)
    help_marker("Allows 10% off any weapon in the Gun Van")

    _discountBackup = _discountBackup or { armour = {}, throwable = {}, weapon = {} }
    if on_tick then
        if discount then
            for i = 0, 4 do
                _discountBackup.armour[i] = tunables.get_float("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i)
                tunables.set_float("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i, 0.1)
            end
            for i = 0, 2 do
                _discountBackup.throwable[i] = tunables.get_float("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i)
                tunables.set_float("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i, 0.1)
            end
            for i = 0, 9 do
                _discountBackup.weapon[i] = tunables.get_float("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i)
                tunables.set_float("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i, 0.1)
            end
        else
            for i = 0, 4 do
                tunables.set_float("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i, _discountBackup.armour[i] or 0.0)
            end
            for i = 0, 2 do
                tunables.set_float("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i, _discountBackup.throwable[i] or 0.0)
            end
            for i = 0, 9 do
                tunables.set_float("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i, _discountBackup.weapon[i] or 0.0)
            end
        end
    end
end)
GVMENU:Box("Discount")
GVMENU:Custom(function()
    gv_discount_pct, __ = ImGui.InputInt("Discount %", gv_discount_pct)
    gv_discount_pct = math.max(-100, math.min(100, gv_discount_pct))
    help_marker("Discount applied to every item in the gun van, from -100 to 100.")

    if ImGui.Button("Apply Discounts") then
        local pct = gv_discount_pct / 100.0
        for i = 0, 4 do
            tunables.set_float("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i, pct)
        end
        for i = 0, 2 do
            tunables.set_float("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i, pct)
        end
        for i = 0, 9 do
            tunables.set_float("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i, pct)
        end
        notify.info("Gun Van", "Discounts have been applied.")
    end
end)
GVMENU:Box("Stock")
GVMENU:Custom(function()
    if ImGui.TreeNode("Weapons") then
        for i = 0, 9 do
            local weapon_hash = tunables.get_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. i)

            if weapon_hash ~= 0 then
                local weapon_name = WeaponDisplayName(weapon_hash)
                local weapon_discount =
                    math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i) * 100.0)

                ImGui.Text(i + 1 .. " - " .. weapon_name .. " (" .. weapon_discount .. "%)")
            end
        end

        if ImGui.Button("Edit Weapons") then
            weapon_editor_popup = true
        end

        ImGui.Separator()
        ImGui.TreePop()
    end

    if ImGui.TreeNode("Throwables") then
        for i = 0, 2 do
            local throwable_hash = tunables.get_int("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. i)

            if throwable_hash ~= 0 then
                local throwable_name = WeaponDisplayName(throwable_hash)
                local throwable_discount =
                    math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i) * 100.0)

                ImGui.Text(i + 1 .. " - " .. throwable_name .. " (" .. throwable_discount .. "%)")
            end
        end

        ImGui.Separator()
        ImGui.TreePop()
    end

    if ImGui.TreeNode("Body Armor") then
        local armour_discounts = {}

        for i = 0, 4 do
            armour_discounts[i + 1] = math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i) * 100.0)
        end

        ImGui.Text("Super Light Armor (" .. armour_discounts[1] .. "%)")
        ImGui.Text("Light Armor (" .. armour_discounts[2] .. "%)")
        ImGui.Text("Standard Armor (" .. armour_discounts[3] .. "%)")
        ImGui.Text("Heavy Armor (" .. armour_discounts[4] .. "%)")
        ImGui.Text("Super Heavy Armor (" .. armour_discounts[5] .. "%)")

        ImGui.TreePop()
    end
end)
GVMENU:Box("Slots")
GVMENU:Custom(function()
    ImGui.Text("Throwable Slot")
    throwable_slot = ImGui.Combo("##gv_throwable_slot", throwable_slot, { "1", "2", "3" }, 3)
    throwable_pick = ImGui.Combo("##gv_throwable_pick", throwable_pick, throwable_labels, #throwable_labels)

    if ImGui.Button("Set Throwable") then
        tunables.set_int("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. throwable_slot, util.joaat(throwable_hashes[throwable_pick + 1]))
        notify.info("Gun Van", "Throwable set in slot " .. (throwable_slot + 1) .. ".")
    end
end)
GVMENU:Button("Optimal Gun Van Slots", function()
    for i, weapon in ipairs(optimal_weapons) do
        tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. (i - 1), util.joaat(weapon))
    end
    for i, throwable in ipairs(optimal_throwables) do
        tunables.set_int("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. (i - 1), util.joaat(throwable))
    end
    notify.info("Gun Van", "Better weapons are now in the gun van.")
end, "Fills the gun van with strong weapons like the Navy Revolver and the Railgun.")
GVMENU:Button("Reset Gun Van Slots", function()
    if not gv_defaults then
        notify.info("Gun Van", "No default slots cached yet.")
        return
    end
    for i = 0, 9 do
        tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. i, gv_defaults.weapons[i])
    end
    for i = 0, 2 do
        tunables.set_int("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. i, gv_defaults.throwables[i])
    end
    notify.info("Gun Van", "The gun van slots were restored.")
end, "Restores the slots to the state they had when you joined the session.")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Missions", function()
MissionsSelectorAndCooldownMenu = Menu:Tab("Missions"):RequireOnline()

MissionsSelectorAndCooldownMenu:Box("Missions")
MissionsSelectorAndCooldownMenu:Button("Remove Dax Fooligan Missions Cooldown", function()
    stats.set_int(MPX() .. "XM22JUGGALOWORKCDTIMER", -1)
end)

MissionsSelectorAndCooldownMenu:Button("Remove VIP/MC Cooldown", function()
    stats.set_int("MPPLY_VIPGAMEPLAYDISABLEDTIMER", 0)
end)

MissionsSelectorAndCooldownMenu:Button("Skip Yacht Missions", function()
    stats.set_int(MPX() .. "YACHT_MISSION_PROG", 0)
    stats.set_int(MPX() .. "YACHT_MISSION_FLOW", 21845)
    stats.set_int(MPX() .. "CASINO_DECORATION_GIFT_1", -1)
end)

MissionsSelectorAndCooldownMenu:Button("LSA Operations Instant-Finish", function()
    if scripts.is_active(SMUGOPS) then ScriptLocal(SMUGOPS, LSAIFl1):set_int(1) end
    if scripts.is_active(SMUGOPS) then ScriptLocal(SMUGOPS, LSAIFl2):set_int(-2145370496) end
    notify.info("LSA Operations", "Mission should've been finished")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Settings", function()
SettingsMenu = Menu:Tab("Settings")
SettingsMain = SettingsMenu:Tab("Main")
SettingsMain:Box("Ultimate Menu")
SettingsMain:Text("Ultimate Menu 1.73 Enhanced")
SettingsMain:Text("YimmenuV2 Beta")
SettingsMain:Button("Copy Discord Link", function()
    ImGui.SetClipboardText("https://dc.gg/l7neg")
    notify.info("Discord", "Link copied to clipboard")
end)
SettingsMain:Button("Copy GitHub Link", function()
    ImGui.SetClipboardText("https://github.com/UltimateMenu/UltimateMenu")
    notify.info("GitHub", "Link copied to clipboard")
end)
SettingsMain:Button("Copy Website Link", function()
    ImGui.SetClipboardText("https://ultimatemenu.github.io/")
    notify.info("Website", "Link copied to clipboard")
end)
BypassOnlineCheck = SettingsMain:Toggle("Bypass Online Check", "Shows the online-only tabs even when the online check fails.")
CreditsMenu = SettingsMenu:Tab("Credits")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Credits: Yimura", function()
CreditsMenu:Box("Yimura and his team/maintainers")
CreditsMenu:Text("Source:")
CreditsMenu:Text("https://github.com/Mr-X-GTA/YimMenu")
CreditsMenu:Text("https://github.com/YimMenu/YimMenuV2")
end)

Section("Credits: Silent", function()
CreditsMenu:Box("Silent")
CreditsMenu:Text("Source:")
CreditsMenu:Text("https://github.com/SilentSal0/Silent-Night")
CreditsMenu:Text("Maintained by nightli:")
CreditsMenu:Text("https://github.com/xnightli06x/Silent-Night")
end)

Section("Credits: xesdoog", function()
CreditsMenu:Box("SAMURAI aka xesdoog")
CreditsMenu:Text("Source:")
CreditsMenu:Text("https://github.com/YimMenu-Lua/YimResupplier")
end)

Section("Credits: ImagineNothing", function()
CreditsMenu:Box("ImagineNothing")
CreditsMenu:Text("For Kortz Center Heist stats and Locals/globals:")
CreditsMenu:Text("https://www.unknowncheats.me/forum/4742522-post603.html")
CreditsMenu:Text("https://www.unknowncheats.me/forum/4746347-post762.html")
end)

Section("Credits: SLON", function()
CreditsMenu:Box("SLON")
CreditsMenu:Text("Source:")
CreditsMenu:Text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")
end)

Section("Credits: Alestarov", function()
CreditsMenu:Box("Alestarov")
CreditsMenu:Text("Source:")
CreditsMenu:Text("https://github.com/YimMenu-Lua/Alestarov-Menu")
end)

Section("Credits: Ji9sw - Gun Van", function()
CreditsMenu:Box("Ji9sw - Gun Van")
CreditsMenu:Text("Source:")
CreditsMenu:Text("https://cherax.menu/scripts/189")
end)

Section("Credits: You", function()
CreditsMenu:Box("And You <3")
CreditsMenu:Text("Yes You Without You Or Your PRs and support You Give Me This Script Would Be Nothing Fr")
CreditsMenu:Text("So Big Thanks To You All")
CreditsMenu:Text("You can report Bugs And Make PRs With Features Down Bellow:")
CreditsMenu:Text("https://github.com/UltimateMenu/UltimateMenu/issues")


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Settings Tabs", function()
SettingsTabs = SettingsMenu:Tab("Tabs")
SettingsTabs:Box("Hidden Tabs")
for _, tab in ipairs(Menu.tabs) do
    if tab ~= SettingsMenu then
        tab.hideToggle = SettingsTabs:Toggle("Hide " .. tab.title, "Hides the " .. tab.title .. " tab.")
    end
end
end)
