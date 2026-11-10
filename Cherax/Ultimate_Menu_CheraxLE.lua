local J = Utils.Joaat
local MENU_NAME = "Ultimate Menu"
local INT_MAX = 2147483647

-- Native hashes 
local N = {
    PLAYER_PED_ID = 0xD80958FC74E988A6,
    DOES_ENTITY_EXIST = 0x7239B21A38F536BA,
    GET_ENTITY_MODEL = 0x9F47B058362C84B5,
    SET_ENTITY_HEADING = 0x8E2530AA8ADA980E,
    SET_ENTITY_COORDS = 0x06843DA7060A026B,
    SET_ENTITY_AS_MISSION_ENTITY = 0xAD738C3085FE7E11,
    DELETE_ENTITY = 0xAE3CBE5BF394C9C9,
    SET_PED_COORDS_KEEP_VEHICLE = 0x9AFEFF481A85AB2E,
    CLEAR_PED_TASKS_IMMEDIATELY = 0xAAA34F8A7CB32098,
    REQUEST_COLLISION_AT_COORD = 0x07503F7948F491A9,
    IS_CUTSCENE_PLAYING = 0x6EC47A344923E1ED,
    STOP_CUTSCENE_IMMEDIATELY = 0xD220BDD222AC4A1E,
    REMOVE_CUTSCENE = 0x440AF51A3B9D8B3C,
    GET_FIRST_BLIP_INFO_ID = 0x1BEDE233E6CD2A1F,
    DOES_BLIP_EXIST = 0xA6DB27D19ECBB7DA,
    GET_BLIP_COORDS = 0x586AFE3FF72D996E,
    SET_BLIP_AS_SHORT_RANGE = 0xBE8BE4FE60E27B72,
    GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH = 0x2C83A9DA6BFFC4F9,
    REQUEST_SCRIPT = 0x6EB5F71AA68F2E8E,
    SET_SCRIPT_AS_NO_LONGER_NEEDED = 0xC90D2DCACD56184C,
    START_NEW_SCRIPT = 0xE81651AD79516E48,
    GET_CLOCK_HOURS = 0x25223CA6B4D20B7F,
    GET_CLOCK_MINUTES = 0x13D2B8ADD79640F2,
    SET_CONTROL_VALUE_NEXT_FRAME = 0xE8A25867FBA3B05E,
    DISABLE_ALL_CONTROL_ACTIONS = 0x5F4B6931816E599B,
    NETWORK_IS_SESSION_STARTED = 0x9DE624D2FC4B603F,
    NETWORK_IS_SESSION_ACTIVE = 0xD83C2B94E7508980,
    NET_GAMESERVER_BASKET_IS_ACTIVE = 0xA65568121DF2EA26,
    NET_GAMESERVER_BASKET_END = 0xFA336E7F40C0A0D0,
    STAT_SET_MASKED_INT = 0x7BBB1B54583ED410,
    STAT_GET_MASKED_INT = 0x655185A06D9EEAAB,
    STAT_SET_BOOL_MASKED = 0xF4D8E7AC2A27758C,
    GET_PACKED_STAT_BOOL_CODE = 0xDA7EBFC49AE3F1B0,
    SET_PACKED_STAT_BOOL_CODE = 0xDB8A58AEAA67CD07,
    GET_PACKED_STAT_INT_CODE = 0x0BC900A6FE73770C,
    SET_PACKED_STAT_INT_CODE = 0x1581503AE529CD2E,
}

-- Service transaction 
local NET_SHOP_TTYPE_SERVICE = -1135378931

-- Helpers
local function Toast(title, text)
    GUI.AddToast(tostring(title), tostring(text or ""), 3000, eToastPos.TOP_RIGHT)
end

-- Stats.Get* return (success, value); these give back just the value.
local function GetStatInt(name)
    local _, value = Stats.GetInt(J(name))
    return value or 0
end

local function GetStatBool(name)
    local _, value = Stats.GetBool(J(name))
    return value == 1 or value == true
end

local function GetStatMaskedInt(name, shift, bits)
    local out = Memory.AllocInt()
    Natives.InvokeBool(N.STAT_GET_MASKED_INT, J(name), out, shift, bits, -1)
    local value = Memory.ReadInt(out)
    Memory.Free(out)
    return value
end

-- Character slot for the packed stat natives
local function CharSlot()
    return GetStatInt("MPPLY_LAST_MP_CHAR")
end

local function IsScriptRunning(name)
    return Natives.InvokeInt(N.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH, J(name)) > 0
end

local function IsSessionStarted()
    return Natives.InvokeBool(N.NETWORK_IS_SESSION_STARTED) and Natives.InvokeBool(N.NETWORK_IS_SESSION_ACTIVE)
end

-- Tunables: Cherax hands out a pointer per tunable, values are read/written through Memory.
local tunablePtrs = {}
local function TunablePtr(name)
    local ptr = tunablePtrs[name]
    if not ptr or ptr == 0 then
        ptr = ScriptGlobal.GetTunableByHash(type(name) == "number" and name or J(name))
        tunablePtrs[name] = ptr
    end
    if ptr == 0 then
        Logger.LogError("[" .. MENU_NAME .. "] Tunable not found: " .. tostring(name))
        return nil
    end
    return ptr
end

local function GetTunableInt(name)
    local ptr = TunablePtr(name)
    return ptr and Memory.ReadInt(ptr) or 0
end

local function SetTunableInt(name, value)
    local ptr = TunablePtr(name)
    if ptr then Memory.WriteInt(ptr, value) end
end

local function GetTunableFloat(name)
    local ptr = TunablePtr(name)
    return ptr and Memory.ReadFloat(ptr) or 0.0
end

local function SetTunableFloat(name, value)
    local ptr = TunablePtr(name)
    if ptr then Memory.WriteFloat(ptr, value + 0.0) end
end

local function SetTunableBool(name, value)
    local ptr = TunablePtr(name)
    if ptr then Memory.WriteInt(ptr, value and 1 or 0) end
end

-- Weapon names (the Gun Van section fills WeaponNames)
WeaponNames = {}
local EXTRA_WEAPONS = { "WEAPON_GRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE",
    "WEAPON_SNOWBALL", "WEAPON_PIPEBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_FLARE", "WEAPON_BALL", "WEAPON_ACIDPACKAGE" }
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
        for _, name in ipairs(WeaponNames) do weaponByHash[J(name)] = name end
        for _, name in ipairs(EXTRA_WEAPONS) do weaponByHash[J(name)] = name end
    end
    local name = weaponByHash[weapon]
    return name and PrettyWeaponName(name) or ("Unknown (" .. tostring(weapon) .. ")")
end

-- All object handles in the object pool. Only call from a native thread.
local function GetAllObjects()
    local handles = {}
    for i = 0, PoolMgr.GetMaxObjectCount() - 1 do
        local handle = PoolMgr.GetObject(i)
        if handle and handle ~= 0 then
            handles[#handles + 1] = handle
        end
    end
    return handles
end

-- DELETE_ENTITY takes a pointer to the handle. Only call from a native thread.
local function DeleteEntity(handle)
    local ptr = Memory.AllocInt()
    Memory.WriteInt(ptr, handle)
    Natives.InvokeVoid(N.DELETE_ENTITY, ptr)
    Memory.Free(ptr)
end

-- Each menu section loads on its own, so one failing section does not take the rest down.
local function Section(name, build)
    local ok, err = pcall(build)
    if not ok then
        Logger.LogError("[" .. MENU_NAME .. "] Section '" .. name .. "' failed to load: " .. tostring(err))
    end
end

-- Session state
-- Natives are not safe on the render thread, so the tab reads this cached state.
local Session = { ready = false, online = false }

Script.RegisterLooped(function()
    Session.ready = not IsScriptRunning("maintransition")
        and Natives.InvokeBool(N.DOES_ENTITY_EXIST, Natives.InvokeInt(N.PLAYER_PED_ID))
    Session.online = IsSessionStarted()
    Script.Yield(250)
end)

-- UI
-- Page = one tab (pages nest as sub tabs). A page holds boxes, and every box is a
-- ClickGUI custom child window holding features, text or custom ImGui drawing.
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

-- Registers a Cherax feature and places it in the current box.
function Page:Feature(name, featureType, desc, callback)
    local id = "UltimateMenu/" .. self.path .. "/" .. name
    local unique, n = id, 1
    while usedFeatureIds[unique] do
        n = n + 1
        unique = id .. "#" .. n
    end
    usedFeatureIds[unique] = true

    local hash = J(unique)
    local feature
    if callback then
        feature = FeatureMgr.AddFeature(hash, name, featureType, desc or "", callback)
    else
        feature = FeatureMgr.AddFeature(hash, name, featureType, desc or "")
    end
    feature:SetSaveable(false)
    self:Add({ feature = hash })
    return feature
end

-- onClick runs in a native thread, so it may call natives and Script.Yield.
function Page:Button(name, onClick, desc)
    return self:Feature(name, eFeatureType.Button, desc, function()
        onClick()
    end)
end

function Page:Toggle(name, desc)
    return self:Feature(name, eFeatureType.Toggle, desc)
end

function Page:InputInt(name, desc)
    local feature = self:Feature(name, eFeatureType.InputInt, desc)
    feature:SetLimitValues(0, INT_MAX)
    return feature
end

function Page:Text(text)
    self:Add({ text = text })
end

-- render() draws with ImGui inside the box. It runs on the render thread.
function Page:Custom(render)
    self:Add({ render = render })
end

function Page:MoveTabAfter(title, afterTitle)
    local from, to
    for i, tab in ipairs(self.tabs) do
        if tab.title == title then from = i end
        if tab.title == afterTitle then to = i end
    end
    if not from or not to or from == to + 1 then return end
    local tab = table.remove(self.tabs, from)
    if from < to then to = to - 1 end
    table.insert(self.tabs, to + 1, tab)
end

local function RenderBox(box)
    if not ClickGUI.BeginCustomChildWindow(box.title) then
        return
    end
    for _, item in ipairs(box.items) do
        if item.feature then
            ClickGUI.RenderFeature(item.feature)
        elseif item.text then
            ImGui.TextWrapped(item.text)
        else
            local width = ImGui.GetContentRegionAvail()
            ImGui.PushItemWidth(width * 0.55)
            local ok, err = pcall(item.render)
            ImGui.PopItemWidth()
            if not ok and not reportedRenderErrors[err] then
                reportedRenderErrors[err] = true
                Logger.LogError("[" .. MENU_NAME .. "] " .. box.title .. ": " .. tostring(err))
            end
        end
    end
    ClickGUI.EndCustomChildWindow()
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
    if not page.online or (BypassOnlineCheck and BypassOnlineCheck:IsToggled()) then
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
            local hidden = tab.hideToggle and tab.hideToggle:IsToggled()
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

ClickGUI.AddTab(MENU_NAME, function()
    RenderPage(Menu)
end)

EventMgr.RegisterHandler(eLuaEvent.ON_UNLOAD, function()
    ClickGUI.RemoveTab(MENU_NAME)
end)

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Globals & Locals & Variables (Legacy 1.73)--
--UPDATE GUIDE: cuts = planning script globals | force ready stride in [] | finish/lives = mission locals--

-- 0. Core --
FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
CSg1 = 1575046 -- change session (type) 1                   // Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false); in freemode.c
CSg2 = 1574589 -- change session (switch) 2                 // Guide:   MP_POST_MATCH_TRANSITION_SCENE in freemode.c
CSg3 = 1574589 + 2 -- change session (quit) 3               // Guide:   MP_POST_MATCH_TRANSITION_SCENE in freemode.c

-- 1. Apartment Heist --
-- Cuts (board) --
ACg1 = 1935929 + 1 + 1 -- global apartment player 1 cut global
ACg2 = 1935929 + 1 + 2 -- global apartment player 2 cut global
ACg3 = 1935929 + 1 + 3 -- global apartment player 3 cut global
ACg4 = 1935929 + 1 + 4 -- global apartment player 4 cut global
ACg5 = 1937897 + 3008 + 1 -- actual apartment player 1 cut global
ACg6 = 1937897 + 3008 + 2 -- actual apartment player 2 cut global (FIX: was missing, caused crew to get 0)
ACg7 = 1937897 + 3008 + 3 -- actual apartment player 3 cut global (FIX: was missing, caused crew to get 0)
ACg8 = 1937897 + 3008 + 4 -- actual apartment player 4 cut global (FIX: was missing, caused crew to get 0)
-- Jobs / Cooldown (direct tunables, no FMg globals) --
-- Finish / Hacks / Checkpoint / Lives --
AIFl1 = 19808 -- apartment instant finish local 1
AIFl2 = 19808 + 1062 -- apartment instant finish local 2
AIFl3 = 19808 + 1740 + 1 -- apartment instant finish local 3
AIFl4 = 19808 + 2686 -- apartment instant finish local 4
AIFl5 = 28722 + 1 -- apartment instant finish local 5
AIFl6 = 31981 + 1 + 68 -- apartment instant finish local 6
AFHl = 11837 + 24 -- apartment fleeca hack local
AFDl = 10125 + 11 -- apartment fleeca drill local
AFPl = 9831 -- apartment pacific hack local
AHSo = 19808 + 2 -- Apartment heist skip checkpoint
ACDg = 2686119 -- apartment cooldown global
-- Force Ready [stride 468] Global_2658293[PLAYER_ID].f_270 = 6 --
AFRg = 2658293 -- apartment force ready global
AHDg = 4718592 + 3771 -- search in tuneables_processing.c for J("HEIST_DIFFICULTY_EASY") then search the global you find in fmmc_launcher.c then take the global in switch state above it done
AHLIVESL = 26234 + 1325 + 1 -- Apartment Heist team lives local

-- 2. Diamond Casino Heist --
-- Board / Cuts --
DCRBl = 217 -- diamond casino reload board local
DCCg1 = 1972483 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global
DCCg2 = 1972483 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
DCCg3 = 1972483 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
DCCg4 = 1972483 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
-- Hacks / Lives / Finish --
DCAg = 10311 -- casino autograbber local 1
DCAs = 10311 + 14 -- casino autograbber local 2
DCFHl = 54118 -- diamond casino fingerprint hack local
DCKHl = 55188 -- diamond casino keypad hack local
DCDVDl1 = 10125 + 7 -- diamond casino drill vault door local 1
DCDVDl2 = 10125 + 37 -- diamond casino drill vault door local 2
DCLIVESL = 26234 + 1325 + 1 -- diamond casino team lives local
-- Finish --
DCXf1 = 19808
DCXf2 = 19808 + 1062
DCXf3 = 19808 + 1740 + 1
DCXf4 = 19808 + 2686
DCXf5 = 28722 + 1
DCXf6 = 31981 + 1 + 68
-- Force Ready [stride 68] Global_1976846[NETWORK_PLAYER_ID].f_7[0] = 1 --
CFRg = 1976846 -- casino force ready global

-- 3. Cayo Perico Heist --
-- Board / Cuts --
CPRSl = 1578 -- cayo perico reload screen local
CPCg1 = 1979291 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1979291 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1979291 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1979291 + 831 + 56 + 4 -- cayo perico player 4 cut global
-- Hacks / Finish / Lives --
CPFHl = 26217 -- cayo perico fingerprint hack local
CPPCCl = 32349 + 3 -- cayo perico plasma cutter cut local
CPSTCl = 31109 -- cayo perico drainage pipe cut local
CPXf1 = 56070 -- cayo perico instant finish local 1
CPXf2 = 56070 + 1776 + 1 -- cayo perico instant finish local 2
CPLIVESL = 62851 + 1109 + 1 -- Cayo Perico team lives local
-- Force Ready [stride 27] Global_1980404[NETWORK_PLAYER_ID].f_7[0] = 1 --
CYFRg = 1980404 -- cayo force ready global
-- Misc (mantrap / secondary / take) --
CPMantrap1 = 68939 + (0 * 293) + 236 -- cayo solo mantrap dual keycard 1 = 7
CPMantrap2 = 20813 -- cayo solo mantrap dual keycard 2 = 1
CPSecondary = 28971 + 11 -- cayo take secondary target = 3
CPLootTake = 59552 + 1376 + 60 -- cayo loot take

-- 4. Doomsday Heist --
-- Hack / Cuts --
DDSHl = 1312 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1968511 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1968511 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1968511 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1968511 + 812 + 50 + 4 -- doomsday player 4 cut global
-- Finish / Lives --
DDIF1 = 19808 -- doomsday instant finish local 1 (base)
DDIF2 = 19808 + 1740 + 1 -- doomsday instant finish local 2 (150 for Act III)
DDIF3 = 28722 + 1 -- doomsday instant finish local 3 (99999)
DDIF4 = 31981 + 1 + 68 -- doomsday instant finish local 4 (99999)
DDIF5 = 31981 + 97 -- doomsday instant finish local 5 (80 for Act I/II)
DDIF6 = 19808 + 1062 -- FIX Bug#1: missing Act III "passed" flag (5). Old single button never set it, causing teleport/fail in Doomsday Scenario.
DDLIVESL = 26234 + 1325 + 1 -- Doomsday team lives local
-- Force Ready [stride 321] Global_1882652[NETWORK_PLAYER_ID].f_43.f_11[0] = 1 --
DDFRg = 1882652 -- doomsday force ready global

-- 5. Kortz Center Heist --
-- Board / Hacks --
KCBRL = 597 -- kortz center reload board local
KCDCL = 1386 -- Data crack local (1386 + 1 + (i * 4) for i = 0-7) [+1 skips array size]
KCFHL = 26464 -- Fingerprint hack local
KCAC_BASE = 32416 + 1 -- Access code base (32416 + 1 + (i * 2) for i = 0-2)
KCLGL = 70472 -- Lasers local
KCVLL = 27512 -- Vault door local
-- Lasers: 1058,1059 = 1,0 Easy | 0,1 Hard | 1060 = 1 no damage --
KCLDIF1 = 1058 -- lasers difficulty 1: 1,0=Easy | 0,1=Hard
KCLDIF2 = 1059 -- lasers difficulty 2
KCNoDmg = 1060 -- no damage lasers = 1
-- Loot take --
KCLootTake = 60203 + 1376 + 60 -- loot take
KCCGL_BASE = 32453 + 1 -- Cut glass base (32453 + 1 + (i * 13) + 3 for i = 0-4) [+1 skips array size]
KCCGL_OFFSET = 3 -- Cut glass offset

-- Target State Locals --
KCPT_STATE = 28953 + 11 -- Primary target state (10/15/17 = available, 3 = taken)
KCST_STATE = 28953 + 11 -- Secondary target state (3 = available)

-- Globals (FMg-based) --
KCBGL = FMg + 37438 -- Bag size global
KCWMG = FMg + 37600 -- Weekly multiplier global
KCCDG = FMg + 37503 -- Cooldown normal global
KCCD2G = FMg + 37504 -- Cooldown hard mode global
KCLDG = 1935234 -- Lasers disable global
KCSECONDARY_BASE = 4980736 + 1 + 29174 -- Secondary targets base (4980736 + 1 + 29174 + (i * 333) + 68/143) [+1 skips array size]
KCPAYOUT_BASE = FMg + 37405 -- Primary target payout base

-- Lives --
KCLIVESL = 63515 + 1109 + 1 -- Team lives local

-- 6. Agency / Autoshop / Salvage / LSA --
-- Agency --
AGFl1 = 56070 + 1
AGFl2 = 56070 + 1776 + 1

-- Autoshop --
ASIFl1 = 56070 + 1 -- auto shop instant finish local 1
ASIFl2 = 56070 + 1776 + 1 -- auto shop finish local 2
ASRBl = 416 -- auto shop reload board local

-- Salvage Yard --
SYRl1 = 545 -- salvage yard reload board local

-- LSA Operations --
LSAIFl1 = 7879 + 1306 -- LSA operations instant finish local 1
LSAIFl2 = 7741 + 1 -- LSA operations instant finish local 2

-- 7. Heists Meta (launch flow) --
HGLs1 = 4718592 + 3769
HGLs2 = 4718592 + 3772
HGLs3 = 4718592 + 3773
HGLs4 = 4718592 + 190163 + 1
HGGs1 = 20194 + 34
HGGs2 = 20194 + 15

NLCl = 213 + 32 + 19 + 1 --("nightclub_office_cutscene") in ("am_mp_nightclub")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function MPX()
    local PI = GetStatInt("MPPLY_LAST_MP_CHAR")
    if PI == 1 then
        return "MP1_"
    end
    return "MP0_"
end

function SkipCutscene()
    Script.QueueJob(function()
        if Natives.InvokeBool(N.IS_CUTSCENE_PLAYING) then
            Natives.InvokeVoid(N.STOP_CUTSCENE_IMMEDIATELY)
            Script.Yield(100)
            Natives.InvokeVoid(N.REMOVE_CUTSCENE)
        end
    end)
end

function SN_ApplyApartmentCuts(c1, c2, c3, c4, isFleeca)
    if isFleeca then
        c3 = 0
        c4 = 0
    end
    ScriptGlobal.SetInt(ACg5, c1)
    ScriptGlobal.SetInt(ACg6, c2)
    ScriptGlobal.SetInt(ACg7, c3)
    ScriptGlobal.SetInt(ACg8, c4)
end

function SN_ApartmentMaxCut(doubleWeek)
    local payoutsByHash = {
        [1328892776] = { 100625, 201250, 251563 },
        [964111671] = { 350000, 700000, 875000 },
        [1131632450] = { 472500, 945000, 1181250 },
        [1967927346] = { 353500, 707000, 883750 },
        [1182286714] = { 750000, 1500000, 1875000 },
    }
    local key = ScriptGlobal.GetInt(ACDg + (GTA.GetLocalPlayerId() * 77) + 24 + 2)
    local diff = ScriptGlobal.GetInt(AHDg) + 1
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
    ScriptGlobal.SetInt(CPCg1, c1)
    ScriptGlobal.SetInt(CPCg2, c2)
    ScriptGlobal.SetInt(CPCg3, c3)
    ScriptGlobal.SetInt(CPCg4, c4)
end

function SN_CayoMaxCut()
    local target = GetStatInt(MPX() .. "H4CNF_TARGET")
    local isHard = (GetStatInt(MPX() .. "H4_PROGRESS") & 4096) ~= 0
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
    Script.QueueJob(function()
        ScriptGlobal.SetInt(CSg1, session)
        if session == -1 then
            ScriptGlobal.SetInt(CSg3, -1)
        end
        Script.Yield(1000)
        ScriptGlobal.SetInt(CSg2, 1)
        Script.Yield(1000)
        ScriptGlobal.SetInt(CSg2, 0)
    end)
end

function stats_set_packed_bools(packed_bool_start, packed_bool_finish, bool)
    for i = packed_bool_start, packed_bool_finish do
        Natives.InvokeVoid(N.SET_PACKED_STAT_BOOL_CODE, i, bool, CharSlot())
    end
end

function globals_set_ints(global_start, global_finish, step, value)
    for i = global_start, global_finish, step do
        ScriptGlobal.SetInt(i, value)
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
    Script.QueueJob(function()
        Natives.InvokeVoid(N.REQUEST_COLLISION_AT_COORD, coords.x, coords.y, coords.z)
        Script.Yield(300)
        if setHeading then
            if heading == nil then
                heading = 0.0
            end
            Natives.InvokeVoid(N.SET_ENTITY_HEADING, Natives.InvokeInt(N.PLAYER_PED_ID), heading)
        end
        if keepVehicle then
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
        else
            Natives.InvokeVoid(N.CLEAR_PED_TASKS_IMMEDIATELY, Natives.InvokeInt(N.PLAYER_PED_ID))
            Natives.InvokeVoid(N.SET_ENTITY_COORDS, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z, false, false, false, true)
        end
    end)
end
Section("Self", function()
Self = Menu:Tab("Self"):RequireOnline()
SelfMain = Self:Tab("Main")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SelfMain:Box("General")
AGCT = SelfMain:Toggle("Unlock Gender Change")
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    local want = AGCT:IsToggled() and 52 or 0
    if want ~= _genderPrev then
        Stats.SetInt(J(MPX() .. "ALLOW_GENDER_CHANGE"), want)
        _genderPrev = want
    end
    Script.Yield(500)
end)

RTPT = SelfMain:Toggle("Remove Transaction Error")
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    if RTPT:IsToggled() then
        ScriptGlobal.SetInt(4516981, 0)
        ScriptGlobal.SetInt(4516982, 0)
        ScriptGlobal.SetInt(4516983, 0)
    end
    Script.Yield(500)
end)

SelfMain:Button("Remove Published And Players Job Liked To You", function()
    Stats.SetInt(J("MPPLY_AWD_FM_CR_DM_MADE"), 0)
    Stats.SetInt(J("MPPLY_AWD_FM_CR_RACES_MADE"), 0)
    Stats.SetInt(J("MPPLY_NUM_CAPTURES_CREATED"), 0)
    Stats.SetInt(J("MPPLY_LTS_CREATED"), 0)
    Stats.SetInt(J("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP"), 0)
    Stats.SetInt(J("MPPLY_AWD_FM_CR_MISSION_SCORE"), 0)
    Stats.SetInt(J("MPPLY_FM_MISSION_LIKES"), 0)
end)

SelfMain:Button("Remove Orbital Cannon Cooldown", function()
    Stats.SetInt(J(MPX() .. "ORBITAL_CANNON_COOLDOWN"), 0)
end)

SelfMain:Button("Refill Nightclub Popularity", function()
    Stats.SetInt(J(MPX() .. "CLUB_POPULARITY"), 1000)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SelfMain:Box("Inventory")
SelfMain:Button("Refill Inventory/Armour", function()
    Stats.SetInt(J(MPX() .. "NO_BOUGHT_YUM_SNACKS"), 30)
    Stats.SetInt(J(MPX() .. "NO_BOUGHT_HEALTH_SNACKS"), 15)
    Stats.SetInt(J(MPX() .. "NO_BOUGHT_EPIC_SNACKS"), 5)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_CHAMP_BOUGHT"), 5)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_ORANGE_BOUGHT"), 11)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_BOURGE_BOUGHT"), 10)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_SPRUNK_BOUGHT"), 10)
    Stats.SetInt(J(MPX() .. "CIGARETTES_BOUGHT"), 20)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_1_COUNT"), 10)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_2_COUNT"), 10)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_3_COUNT"), 10)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_4_COUNT"), 10)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_5_COUNT"), 10)
    Stats.SetInt(J(MPX() .. "BREATHING_APPAR_BOUGHT"), 20)
end)

SelfMain:Button("Refill Inv/Armour x1000", function()
    Stats.SetInt(J(MPX() .. "NO_BOUGHT_YUM_SNACKS"), 1000)
    Stats.SetInt(J(MPX() .. "NO_BOUGHT_HEALTH_SNACKS"), 1000)
    Stats.SetInt(J(MPX() .. "NO_BOUGHT_EPIC_SNACKS"), 1000)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_CHAMP_BOUGHT"), 1000)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_ORANGE_BOUGHT"), 1000)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_BOURGE_BOUGHT"), 1000)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_SPRUNK_BOUGHT"), 1000)
    Stats.SetInt(J(MPX() .. "CIGARETTES_BOUGHT"), 1000)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_1_COUNT"), 1000)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_2_COUNT"), 1000)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_3_COUNT"), 1000)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_4_COUNT"), 1000)
    Stats.SetInt(J(MPX() .. "MP_CHAR_ARMOUR_5_COUNT"), 1000)
    Stats.SetInt(J(MPX() .. "BREATHING_APPAR_BOUGHT"), 1000)
end)


SelfMain:Box("Bad Sport")

BadSportCombo = 0
SelfMain:Custom(function()
    ImGui.SetNextItemWidth(140)
    BadSportCombo = ImGui.Combo("##BadSport", BadSportCombo, { "Remove", "Add" }, 2)
end)

function BadSport(State, Overall, Bool)
    Script.QueueJob(function()
        Toast("Bad Sport!", "Awaiting Session Change")
        Script.Yield(1000)
        Stats.SetInt(J("MPPLY_BADSPORT_MESSAGE"), State)
        Stats.SetFloat(J("MPPLY_OVERALL_BADSPORT"), Overall + 0.0)
        Stats.SetBool(J("MPPLY_CHAR_IS_BADSPORT"), (Bool) and 1 or 0)
        ScriptGlobal.SetInt(CSg1, 11)
        ScriptGlobal.SetInt(CSg2, 1)
        Script.Yield(300)
        ScriptGlobal.SetInt(CSg2, 0)
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
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_STAM"), 100)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_STRN"), 100)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_LUNG"), 100)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_DRIV"), 100)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_FLY"), 100)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_SHO"), 100)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_STL"), 100)
    Toast("Skills", "Skills should've been maximized")
end)

SkillsMenu:Button("Reset Skills", function()
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_STAM"), 0)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_STRN"), 0)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_LUNG"), 0)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_DRIV"), 0)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_FLY"), 0)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_SHO"), 0)
    Stats.SetInt(J(MPX() .. "SCRIPT_INCREASE_STL"), 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Casino", function()
CasinoServicesMenu = Menu:Tab("Casino"):RequireOnline()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local cslots = "casino_slots"
slots_random_results_table = 1379
prize_wheel_win_state = 309
prize_wheel_prize = 14
prize_wheel_prize_state = 45

CasinoServicesMenu:Box("Casino Chips")
-- Chip limits live in the free mode globals (FMg + 26623/26624 = acquire, FMg + 26625 = trade in).
local chipLimit = CasinoServicesMenu:InputInt("Chip Limit")
CasinoServicesMenu:Button("Apply Acquire Limit", function()
    local value = chipLimit:GetIntValue()
    ScriptGlobal.SetInt(FMg + 26623, value)
    ScriptGlobal.SetInt(FMg + 26624, value)
    Toast("Casino", "Acquire limit set to " .. value)
end)
CasinoServicesMenu:Button("Apply Trade In Limit", function()
    local value = chipLimit:GetIntValue()
    ScriptGlobal.SetInt(FMg + 26625, value)
    Toast("Casino", "Trade in limit set to " .. value)
end)

CasinoServicesMenu:Button("Bypass Casino Cooldown", function()
    Stats.SetInt(J("MPPLY_CASINO_CHIPS_WON_GD"), 0)
    Stats.SetInt(J("MPPLY_CASINO_CHIPS_WONTIM"), 0)
    Stats.SetInt(J("MPPLY_CASINO_GMBLNG_GD"), 0)
    Stats.SetInt(J("MPPLY_CASINO_BAN_TIME"), 0)
    Stats.SetInt(J("MPPLY_CASINO_CHIPS_PURTIM"), 0)
    Stats.SetInt(J("MPPLY_CASINO_CHIPS_PUR_GD"), 0)
    Stats.SetInt(J("MPPLY_CASINO_CHIPS_SOLD"), 0)
    Stats.SetInt(J("MPPLY_CASINO_CHIPS_SELTIM"), 0)
end)
CasinoServicesMenu:Text("Winning too much too quickly might get you banned, enable this at your own risk.")


CasinoServicesMenu:Box("Slots")

CasinoServicesMenu:Button("Rig Slot Machines", function()
    for i = 3, 196 do
        if i ~= 67 and i ~= 132 then
            ScriptLocal.SetInt(J(cslots), slots_random_results_table + i, 6)
        end
    end
end)

CasinoServicesMenu:Button("Lose Slot Machines", function()
    for i = 3, 196 do
        if i ~= 67 and i ~= 132 then
            ScriptLocal.SetInt(J(cslots), slots_random_results_table + i, 0)
        end
    end
end)

CasinoServicesMenu:Box("Lucky Wheel")

CasinoServicesMenu:Button("Give Podium Vehicle", function()
    Script.QueueJob(function()
        if IsScriptRunning("casino_lucky_wheel") then
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize, 18)
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize_state, 11)
        end
    end)
end)
CasinoServicesMenu:Button("Give Mystery Prize", function()
    Script.QueueJob(function()
        if IsScriptRunning("casino_lucky_wheel") then
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize, 11)
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize_state, 11)
        end
    end)
end)
CasinoServicesMenu:Button("Give $50,000", function()
    Script.QueueJob(function()
        if IsScriptRunning("casino_lucky_wheel") then
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize, 19)
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize_state, 11)
        end
    end)
end)
CasinoServicesMenu:Button("Give 25,000 Chips", function()
    Script.QueueJob(function()
        if IsScriptRunning("casino_lucky_wheel") then
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize, 15)
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize_state, 11)
        end
    end)
end)
CasinoServicesMenu:Button("Give 15,000 RP", function()
    Script.QueueJob(function()
        if IsScriptRunning("casino_lucky_wheel") then
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize, 17)
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize_state, 11)
        end
    end)
end)
CasinoServicesMenu:Button("Give Discount", function()
    Script.QueueJob(function()
        if IsScriptRunning("casino_lucky_wheel") then
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize, 4)
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize_state, 11)
        end
    end)
end)
CasinoServicesMenu:Button("Give Clothing", function()
    Script.QueueJob(function()
        if IsScriptRunning("casino_lucky_wheel") then
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize, 8)
            ScriptLocal.SetInt(J("casino_lucky_wheel"), prize_wheel_win_state + prize_wheel_prize_state, 11)
        end
    end)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Collectibles", function()
CollectiblesMenu = RecoveryMenu:Tab("Collectibles")
CollectiblesMenu:Box("Los Santos Collectibles")
CollectiblesMenu:Button("Collect All Action Figures", function()
    for i = 0, 99 do
        Stats.SetBool(J(MPX() .. "PROP_FIGURE_" .. i), 1)
    end
end)
CollectiblesMenu:Button("Collect All Signal Jammers", function()
    for i = 0, 49 do
        Stats.SetBool(J(MPX() .. "JAMMER_IDENTIFIED_" .. i), 1)
    end
end)
CollectiblesMenu:Button("Collect All Playing Cards", function()
    for i = 0, 53 do
        Stats.SetBool(J(MPX() .. "CH_CARD_ID_" .. i), 1)
    end
end)
CollectiblesMenu:Button("Collect All Props", function()
    for i = 0, 9 do
        Stats.SetBool(J(MPX() .. "PROP_HIDDEN_SOL_ID_" .. i), 1)
    end
end)
CollectiblesMenu:Button("Collect All Movie Props", function()
    for i = 1, 10 do
        Stats.SetInt(J(MPX() .. "MOVIE_PROP_COLLECTED_" .. i), -1)
    end
end)
CollectiblesMenu:Button("Collect All LD Organics", function()
    for i = 0, 99 do
        Stats.SetBool(J(MPX() .. "LD_ORGANIC_COLLECTED_" .. i), 1)
    end
end)
CollectiblesMenu:Button("Collect Ghost Exposed", function()
    for i = 0, 9 do
        Stats.SetBool(J(MPX() .. "GHOST_EXPOSED_" .. i), 1)
    end
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
Script.RegisterLooped(function()
    Script.Yield()
    local want = SNOWCB:IsToggled() and 1 or 0
    if want ~= snowPrev then
        SetTunableBool("TURN_SNOW_ON_OFF", want == 1)
        snowPrev = want
    end
    Script.Yield(100)
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
    local hour = Natives.InvokeInt(N.GET_CLOCK_HOURS)
    local minute = Natives.InvokeInt(N.GET_CLOCK_MINUTES)
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
Script.RegisterLooped(function()
    Script.Yield()
    local want = HALLOWEATHERC:IsToggled() and 1 or 0
    if want ~= halloweatherPrev then
        SetTunableBool("SSP2WEATHER", want == 1)
        halloweatherPrev = want
    end
    Script.Yield(100)
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


Script.RegisterLooped(function()
    Script.Yield()
    local want = TRICKORTREATCB:IsToggled() and 1 or 0
    if want ~= _trickPrev then
        SetTunableBool("COLLECTABLES_TRICK_OR_TREAT", want == 1)
        _trickPrev = want
    end
    Script.Yield(100)
end)

-- Jack o'Lantern locations array (200 locations)
jackolantern_locations = {
    V3.New(1434.581177, -1494.808960, 61.924484),
    V3.New(1318.091797, -1557.906860, 49.406536),
    V3.New(1297.748535, -1621.982666, 52.924953),
    V3.New(1312.340576, -1701.004272, 56.537983),
    V3.New(1256.791260, -1760.271851, 47.959789),
    V3.New(1204.294312, -1672.812622, 41.058277),
    V3.New(1232.604492, -1593.003418, 52.067909),
    V3.New(1152.968140, -1529.164673, 33.691978),
    V3.New(1183.517090, -1461.732788, 33.594597),
    V3.New(1210.140625, -1390.762085, 34.076641),
    V3.New(411.362427, -1485.312622, 28.570503),
    V3.New(323.141052, -1759.944092, 28.016262),
    V3.New(428.983459, -1723.205811, 27.929178),
    V3.New(495.846832, -1817.259521, 27.187927),
    V3.New(387.837158, -1883.815430, 24.304468),
    V3.New(326.185211, -1947.658691, 23.467230),
    V3.New(379.337311, -2069.736328, 19.941431),
    V3.New(294.090973, -2098.108154, 15.802926),
    V3.New(221.574402, -2036.115112, 16.712660),
    V3.New(180.028915, -1930.020508, 19.712641),
    V3.New(150.242844, -1868.382568, 22.930975),
    V3.New(25.318865, -1894.664185, 21.286211),
    V3.New(-18.668180, -1855.332764, 23.662672),
    V3.New(-79.454300, -1641.520874, 28.009012),
    V3.New(-158.293228, -1680.115479, 35.666103),
    V3.New(-193.209412, -1609.052246, 32.701607),
    V3.New(-63.751331, -1452.771973, 30.823833),
    V3.New(-123.541191, -1490.525513, 32.473259),
    V3.New(-223.600693, -1500.161133, 30.692902),
    V3.New(-294.518921, -1332.482910, 29.970270),
    V3.New(1014.117920, -423.848389, 63.675259),
    V3.New(1266.007446, -428.332397, 68.079376),
    V3.New(1370.628906, -558.052185, 73.039597),
    V3.New(1324.806519, -580.172913, 71.912575),
    V3.New(1204.557251, -620.731323, 64.821854),
    V3.New(967.759155, -547.430298, 58.004089),
    V3.New(961.077148, -594.268860, 58.192711),
    V3.New(999.061157, -727.578979, 56.227200),
    V3.New(1143.774292, -981.787659, 44.845215),
    V3.New(845.798950, -1019.603210, 26.234652),
    V3.New(805.100342, -1075.361694, 27.369886),
    V3.New(480.726227, -975.737000, 26.683889),
    V3.New(389.172333, -972.175659, 28.140848),
    V3.New(360.894836, -1070.573853, 28.238062),
    V3.New(244.050507, -1071.695679, 27.986931),
    V3.New(264.044403, -1028.192871, 27.911451),
    V3.New(75.252281, -1026.460449, 28.174519),
    V3.New(-16.975662, -977.996521, 28.062405),
    V3.New(66.998047, -961.704041, 28.057564),
    V3.New(130.983887, -567.115417, 42.440754),
    V3.New(-191.763809, -764.868286, 29.154016),
    V3.New(-232.445236, -911.110535, 31.010803),
    V3.New(-552.145813, -815.285950, 29.390755),
    V3.New(-731.544312, -676.678467, 28.973450),
    V3.New(-1025.704224, -921.141296, 3.741233),
    V3.New(-962.515381, -942.297180, 0.845313),
    V3.New(-841.248718, -1206.873657, 5.163064),
    V3.New(-969.639954, -1094.212158, 0.8505334),
    V3.New(-1075.960327, -1026.114990, 3.245211),
    V3.New(-1150.731567, -992.529785, 0.850194),
    V3.New(-1125.693848, -1090.169067, 0.850338),
    V3.New(-1207.256836, -1136.133057, 6.418141),
    V3.New(-1185.031738, -1560.465698, 3.061427),
    V3.New(-1337.111938, -1282.580566, 3.536002),
    V3.New(-1291.436401, -1115.384399, 5.380210),
    V3.New(-1505.406006, -938.584167, 8.059047),
    V3.New(-1581.442627, -951.199219, 11.717396),
    V3.New(-1187.069458, -564.099121, 26.317165),
    V3.New(-1340.669434, -408.527100, 35.059433),
    V3.New(-1534.179565, -425.168396, 34.291149),
    V3.New(-1977.575928, -534.048889, 10.412008),
    V3.New(-1886.251953, -367.071625, 47.764736),
    V3.New(-1686.079102, -292.055634, 50.593338),
    V3.New(-1729.297974, -191.002090, 57.047939),
    V3.New(-1549.251831, -89.285751, 53.629169),
    V3.New(-1465.009766, -30.447273, 53.408463),
    V3.New(-1473.790649, 62.652233, 51.955498),
    V3.New(-1565.397949, 41.662537, 57.540710),
    V3.New(-1539.457520, 128.534393, 55.480267),
    V3.New(-1649.843994, 148.785080, 60.872307),
    V3.New(749.970276, 220.890854, 85.730003),
    V3.New(348.487152, 442.021454, 146.400879),
    V3.New(327.944977, 536.017639, 152.462311),
    V3.New(215.329636, 621.132812, 186.248245),
    V3.New(7.990458, 544.689697, 174.240616),
    V3.New(56.627422, 454.376404, 145.430801),
    V3.New(169.621765, 488.189667, 141.616394),
    V3.New(125.038742, 64.603813, 78.442604),
    V3.New(85.067253, -93.484367, 59.143009),
    V3.New(14.717505, -5.760206, 68.813988),
    V3.New(-436.087738, -67.952057, 41.706535),
    V3.New(-373.813538, 44.969456, 53.129925),
    V3.New(-175.594559, 89.340088, 68.998276),
    V3.New(-565.616150, 168.983398, 65.538330),
    V3.New(-598.232544, 275.290619, 80.810440),
    V3.New(-146.931183, 288.287903, 95.503975),
    V3.New(-87.271278, 425.587616, 111.912392),
    V3.New(-252.625534, 397.004730, 109.946564),
    V3.New(-369.354126, 347.407196, 108.114899),
    V3.New(-573.230042, 402.716095, 99.368492),
    V3.New(-584.765686, 496.261749, 105.802574),
    V3.New(-352.459045, 469.861053, 111.272270),
    V3.New(-178.125549, 503.593872, 135.551987),
    V3.New(-136.874252, 595.974915, 203.303223),
    V3.New(-247.243790, 619.652405, 186.510178),
    V3.New(-346.281616, 625.225159, 170.056915),
    V3.New(-445.562164, 684.065796, 151.650650),
    V3.New(-491.010986, 740.993591, 161.535828),
    V3.New(-579.493774, 736.161072, 182.526932),
    V3.New(-549.261047, 827.965210, 196.220291),
    V3.New(-149.519211, 995.026306, 235.537567),
    V3.New(-821.168213, 814.200195, 199.545700),
    V3.New(-703.407898, 591.646423, 140.869995),
    V3.New(-716.630310, 490.652618, 107.965691),
    V3.New(-821.048706, 268.837524, 84.892586),
    V3.New(-863.629517, 387.783356, 86.129707),
    V3.New(-882.328552, 518.721924, 91.141586),
    V3.New(-937.415100, 589.408447, 100.195312),
    V3.New(-887.551086, 701.678711, 149.417191),
    V3.New(-1020.178894, 716.203674, 162.686401),
    V3.New(-1166.027588, 729.194946, 154.211594),
    V3.New(-1291.383911, 648.885010, 140.199905),
    V3.New(-1124.626709, 575.734802, 103.055000),
    V3.New(-1024.506104, 502.218384, 79.255287),
    V3.New(-966.512451, 434.859009, 78.671555),
    V3.New(-1023.245361, 359.682251, 70.056602),
    V3.New(-1130.484985, 391.969757, 69.441147),
    V3.New(-1178.350708, 290.212646, 68.198738),
    V3.New(-1215.850708, 460.558350, 90.553658),
    V3.New(-1312.920288, 452.977936, 97.879066),
    V3.New(-1499.075195, 520.862732, 116.972198),
    V3.New(-1813.917847, 344.151672, 87.253471),
    V3.New(-1961.207275, 249.182205, 83.922012),
    V3.New(-2005.261841, 447.706787, 100.982285),
    V3.New(-1974.006348, 627.074402, 121.236298),
    V3.New(-1523.962524, 854.170227, 180.294525),
    V3.New(-3084.227539, 222.587875, 12.690159),
    V3.New(-3034.164795, 492.005524, 5.467818),
    V3.New(-2999.262695, 694.002991, 24.150764),
    V3.New(-3234.858887, 934.295593, 15.850909),
    V3.New(-3202.787109, 1151.574829, 8.355104),
    V3.New(-3180.688232, 1291.906372, 13.120326),
    V3.New(-2551.712402, 1912.145386, 167.768417),
    V3.New(-1872.429932, 2029.911011, 138.037140),
    V3.New(-1112.209106, 2686.990479, 17.318859),
    V3.New(-262.114075, 2194.963135, 129.098648),
    V3.New(-267.503265, 2626.278564, 60.810768),
    V3.New(-462.839874, 2856.521973, 33.321205),
    V3.New(-327.331085, 2820.612305, 57.069534),
    V3.New(-289.165649, 2837.083496, 54.012520),
    V3.New(-38.089405, 2866.223145, 57.879650),
    V3.New(200.134537, 3031.658691, 42.007084),
    V3.New(245.562866, 3167.225342, 41.543571),
    V3.New(36.286015, 3668.123779, 38.331520),
    V3.New(92.681717, 3741.556885, 38.248653),
    V3.New(439.687134, 3574.860352, 31.938606),
    V3.New(470.906616, 2611.910889, 41.949657),
    V3.New(561.570679, 2599.967529, 41.738277),
    V3.New(734.955811, 2523.633057, 71.924843),
    V3.New(721.653381, 2332.206543, 50.450310),
    V3.New(790.147888, 2182.331055, 50.818352),
    V3.New(841.859131, 2114.335449, 51.001461),
    V3.New(1352.933716, 1147.012451, 112.459045),
    V3.New(1529.204956, 1728.803955, 108.681503),
    V3.New(1531.197266, 2219.515381, 75.833237),
    V3.New(1421.380981, 3666.921387, 38.428417),
    V3.New(1664.273926, 3824.378662, 33.593254),
    V3.New(1762.277954, 3872.228516, 33.132488),
    V3.New(1925.091553, 3917.555664, 31.198433),
    V3.New(1914.172241, 3825.941162, 31.136677),
    V3.New(1773.624268, 3740.501953, 33.356308),
    V3.New(1856.470215, 3681.635254, 32.958481),
    V3.New(1999.776611, 3776.771484, 30.880787),
    V3.New(1991.811035, 3057.610840, 45.760735),
    V3.New(2168.261475, 3380.211670, 45.134487),
    V3.New(2178.444824, 3499.422119, 44.197418),
    V3.New(2590.153320, 3169.243896, 49.646759),
    V3.New(2620.696533, 3282.523926, 53.951210),
    V3.New(2985.502930, 3484.042236, 70.081779),
    V3.New(2420.516602, 4020.245605, 35.535358),
    V3.New(2638.094482, 4247.965332, 43.502384),
    V3.New(3689.367188, 4563.361328, 23.881674),
    V3.New(3315.741455, 5172.885254, 17.129362),
    V3.New(2234.621094, 5609.286133, 53.348442),
    V3.New(2451.511963, 4961.811035, 44.201416),
    V3.New(1967.214966, 4621.931641, 39.482288),
    V3.New(1664.723511, 4773.646973, 40.687389),
    V3.New(1723.661011, 4642.196777, 42.564026),
    V3.New(1311.947632, 4361.838867, 39.552631),
    V3.New(724.281311, 4185.006348, 39.409229),
    V3.New(-771.858582, 5511.423340, 33.605061),
    V3.New(-342.642487, 6163.851074, 30.190174),
    V3.New(-402.742828, 6314.299805, 27.649906),
    V3.New(-306.322205, 6331.539551, 31.189320),
    V3.New(-245.945114, 6410.604492, 29.897928),
    V3.New(-105.598267, 6313.783691, 30.190372),
    V3.New(-112.187599, 6460.697266, 30.168459),
    V3.New(-50.652882, 6582.884766, 29.876881),
    V3.New(54.402122, 6642.595215, 30.223076),
    V3.New(1706.896240, 6422.760254, 31.335125),
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
        Script.QueueJob(function()
            local coords = jackolantern_locations[jackolantern_selected_loc + 1]
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
        end)
    end
    help_marker("Teleports you to the selected Jack o'Lantern location.")
end)
trickOrTreatMenu:Box("Quick Teleport (1-20)")
trickOrTreatMenu:Custom(function()
    -- Quick teleport buttons in rows of 5 (first 20 locations)
    for i = 0, 19 do

        if ImGui.Button(jackolantern_names[i + 1]) then
            Script.QueueJob(function()
                local coords = jackolantern_locations[i + 1]
                Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
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
            Script.QueueJob(function()
                local coords = jackolantern_locations[i + 1]
                Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
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
        Script.QueueJob(function()
            local random_index = math.random(1, 200)
            local coords = jackolantern_locations[random_index]
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
            Toast("Jack o'Lantern", "Teleported to " .. jackolantern_names[random_index])
        end)
    end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Snowmen Collectibles", function()
snowmenMenu = EventsMenu:Tab("Snowmen Collectibles")

-- Snowman locations array
snowmen_locations = {
    V3.New(-955.5352, -782.4186, 15.925326),
    V3.New(-819.9067, 165.35524, 71.26295),
    V3.New(-247.92003, -1561.2175, 32.22973),
    V3.New(901.3996, -288.05026, 65.643715),
    V3.New(1275.6772, -642.3789, 68.208786),
    V3.New(1993.1008, 3829.6396, 32.167336),
    V3.New(-375.47916, 6230.158, 31.490055),
    V3.New(-1414.4647, 5094.9272, 60.674263),
    V3.New(-1946.0231, 594.93756, 119.79223),
    V3.New(-1100.889, -1401.0138, 5.215467),
    V3.New(-780.418, 877.2859, 203.18001),
    V3.New(-455.12027, 1130.5625, 325.89175),
    V3.New(221.46722, -107.01075, 69.763985),
    V3.New(1560.3787, 6447.053, 23.9866),
    V3.New(3301.7886, 5149.8853, 18.34274),
    V3.New(1703.0568, 4671.928, 43.15301),
    V3.New(224.9161, 3107.3345, 42.18394),
    V3.New(2360.0037, 2522.7166, 46.66731),
    V3.New(1510.8555, 1725.0353, 109.89355),
    V3.New(-48.96374, 1964.4028, 189.87181),
    V3.New(-1516.2083, 2140.2168, 56.11924),
    V3.New(-2826.2356, 1424.6211, 100.706116),
    V3.New(-2957.531, 723.6389, 28.792404),
    V3.New(1341.4302, -1583.5093, 54.135414),
    V3.New(178.00232, -895.9712, 30.69326),
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


Script.RegisterLooped(function()
    Script.Yield()
    local want = SNOWMENCB:IsToggled() and 1 or 0
    if want ~= _snowmenPrev then
        SetTunableBool("COLLECTABLES_SNOWMEN", want == 1)
        _snowmenPrev = want
    end
    Script.Yield(100)
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
        Script.QueueJob(function()
            local coords = snowmen_locations[snowmen_selected_loc + 1]
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
        end)
    end
    help_marker("Teleports you to the selected Snowman location.")
end)
snowmenMenu:Box("Quick Teleport")
snowmenMenu:Custom(function()
    -- Add quick teleport buttons in rows of 5
    for i = 0, 24 do

        if ImGui.Button(snowmen_names[i + 1]) then
            Script.QueueJob(function()
                local coords = snowmen_locations[i + 1]
                Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
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
        Script.QueueJob(function()
            local random_index = math.random(1, 25)
            local coords = snowmen_locations[random_index]
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
            Toast("Snowman", "Teleported to " .. snowmen_names[random_index])
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
    V3.New(-1562.69, 4699.04, 50.426),
    V3.New(-1359.869, 4733.429, 46.919),
    V3.New(-1715.398, 4501.203, 0.096),
    V3.New(-1282.18, 4487.826, 12.643),
    V3.New(-1569.665, 4478.485, 20.215),
    V3.New(-1345.828, 4838.062, 137.522),
    V3.New(-1507.88, 4730.23, 45.54),
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


Script.RegisterLooped(function()
    Script.Yield()
    local want = YETIHUNTCB:IsToggled() and 1 or 0
    if want ~= _yetiPrev then
        SetTunableBool(1833904680, want == 1)
        _yetiPrev = want
    end
    Script.Yield(100)
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
        Script.QueueJob(function()
            local coords = yeti_locations[yeti_selected_loc + 1]
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
        end)
    end
    help_marker("Teleports you to the selected Yeti location.")
end)
YetiHuntMenu:Box("Quick Teleport")
YetiHuntMenu:Custom(function()
    -- Add quick teleport buttons in rows of 3 (all 7 locations)
    for i = 0, 6 do

        if ImGui.Button(yeti_names[i + 1]) then
            Script.QueueJob(function()
                local coords = yeti_locations[i + 1]
                Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
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
        Script.QueueJob(function()
            local random_index = math.random(1, 7)
            local coords = yeti_locations[random_index]
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
            Toast("Yeti Hunt", "Teleported to " .. yeti_names[random_index])
        end)
    end
    help_marker("Teleports you to a random Yeti location. Find all the clues to hunt the Yeti!")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Awards Unlocker", function()
AUM = RecoveryMenu:Tab("Awards Unlocker")
AUMMain = AUM:Tab("Main")

AUMMain:Box("Awards")
AUMMain:Button("Victory", function()
    Stats.SetInt(J(MPX() .. "AWD_FM_DM_WINS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_FM_TDM_WINS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_FM_TDM_MVP"), 50)
    Stats.SetInt(J(MPX() .. "AWD_RACES_WON"), 50)
    Stats.SetInt(J(MPX() .. "AWD_FMWINAIRRACE"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FMWINSEARACE"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_GTA_RACES_WON"), 50)
    Stats.SetBool(J(MPX() .. "AWD_FMKILL3ANDWINGTARACE"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FMRALLYWONDRIVE"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FMRALLYWONNAV"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FMWINCUSTOMRACE"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FMWINRACETOPOINTS"), 25)
    Stats.SetBool(J(MPX() .. "CL_RACE_MODDED_CAR"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FM_RACE_LAST_FIRST"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FMRACEWORLDRECHOLDER"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FM_RACES_FASTEST_LAP"), 50)
    Stats.SetBool(J(MPX() .. "AWD_FMWINALLRACEMODES"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FMHORDWAVESSURVIVE"), 10)
    Stats.SetInt(J(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE"), 100)
    Stats.SetInt(J(MPX() .. "NUMBER_TURBO_STARTS_IN_RACE"), 50)
    Stats.SetInt(J(MPX() .. "AWD_NO_ARMWRESTLING_WINS"), 25)
    Stats.SetInt(J(MPX() .. "MOST_ARM_WRESTLING_WINS"), 25)
    Stats.SetInt(J(MPX() .. "AWD_WIN_AT_DARTS"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_GOLF_WON"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_TENNIS_WON"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FM_TENNIS_5_SET_WINS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FM_TENNIS_STASETWIN"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FM_SHOOTRANG_CT_WON"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_SHOOTRANG_RT_WON"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_SHOOTRANG_TG_WON"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FM_SHOOTRANG_GRAN_WON"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FMWINEVERYGAMEMODE"), 1)
    Stats.SetInt(J(MPX() .. "AWD_WIN_CAPTURES"), 50)
    Stats.SetInt(J(MPX() .. "AWD_WIN_CAPTURE_DONT_DYING"), 25)
    Stats.SetInt(J(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_KILL_TEAM_YOURSELF_LTS"), 25)
    Stats.SetInt(J(MPX() .. "AIR_LAUNCHES_OVER_40M"), 25)
    Stats.SetInt(J(MPX() .. "AWD_CARS_EXPORTED"), 50)
    Stats.SetInt(J(MPX() .. "AWD_LESTERDELIVERVEHICLES"), 25)
    Stats.SetInt(J(MPX() .. "TOTAL_RACES_WON"), 500)
    Stats.SetInt(J(MPX() .. "TOTAL_RACES_LOST"), 250)
    Stats.SetInt(J(MPX() .. "TOTAL_CUSTOM_RACES_WON"), 500)
    Stats.SetInt(J(MPX() .. "TOTAL_DEATHMATCH_LOST"), 250)
    Stats.SetInt(J(MPX() .. "TOTAL_DEATHMATCH_WON"), 500)
    Stats.SetInt(J(MPX() .. "TOTAL_TDEATHMATCH_LOST"), 250)
    Stats.SetInt(J(MPX() .. "TOTAL_TDEATHMATCH_WON"), 500)
    Stats.SetInt(J(MPX() .. "SHOOTINGRANGE_WINS"), 500)
    Stats.SetInt(J(MPX() .. "SHOOTINGRANGE_LOSSES"), 250)
    Stats.SetInt(J(MPX() .. "TENNIS_MATCHES_WON"), 500)
    Stats.SetInt(J(MPX() .. "TENNIS_MATCHES_LOST"), 250)
    Stats.SetInt(J(MPX() .. "GOLF_WINS"), 500)
    Stats.SetInt(J(MPX() .. "GOLF_LOSSES"), 250)
    Stats.SetInt(J(MPX() .. "DARTS_TOTAL_WINS"), 500)
    Stats.SetInt(J(MPX() .. "DARTS_TOTAL_MATCHES"), 750)
    Stats.SetInt(J(MPX() .. "SHOOTINGRANGE_TOTAL_MATCH"), 800)
    Stats.SetInt(J(MPX() .. "BJ_WINS"), 500)
    Stats.SetInt(J(MPX() .. "BJ_LOST"), 250)
    Stats.SetInt(J(MPX() .. "RACE_2_POINT_WINS"), 500)
    Stats.SetInt(J(MPX() .. "RACE_2_POINT_LOST"), 250)
    Stats.SetInt(J(MPX() .. "KILLS_PLAYERS"), 3593)
    Stats.SetInt(J(MPX() .. "DEATHS_PLAYER"), 1002)
    Stats.SetInt(J(MPX() .. "MISSIONS_CREATED"), 500)
    Stats.SetInt(J(MPX() .. "LTS_CREATED"), 500)
    Stats.SetInt(J(MPX() .. "FM_MISSION_LIKES"), 1500)
end)

AUMMain:Button("General", function()
    Stats.SetBool(J(MPX() .. "AWD_FM25DIFFERENTDM"), 1)
    Stats.SetInt(J(MPX() .. "CR_DIFFERENT_DM"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FM25DIFFERENTRACES"), 1)
    Stats.SetInt(J(MPX() .. "CR_DIFFERENT_RACES"), 25)
    Stats.SetInt(J(MPX() .. "AWD_PARACHUTE_JUMPS_20M"), 25)
    Stats.SetInt(J(MPX() .. "AWD_PARACHUTE_JUMPS_50M"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FMBASEJMP"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FMATTGANGHQ"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FM6DARTCHKOUT"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FM_GOLF_BIRDIES"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FM_GOLF_HOLE_IN_1"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FM_TENNIS_ACE"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FMBBETWIN"), 50000)
    Stats.SetInt(J(MPX() .. "AWD_LAPDANCES"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FMCRATEDROPS"), 25)
    Stats.SetBool(J(MPX() .. "AWD_FMPICKUPDLCCRATE1ST"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FM25DIFITEMSCLOTHES"), 1)
    Stats.SetInt(J(MPX() .. "AWD_NO_HAIRCUTS"), 25)
    Stats.SetBool(J(MPX() .. "AWD_BUY_EVERY_GUN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DRIVELESTERCAR5MINS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FMTATTOOALLBODYPARTS"), 1)
    Stats.SetInt(J(MPX() .. "AWD_DROPOFF_CAP_PACKAGES"), 100)
    Stats.SetInt(J(MPX() .. "AWD_PICKUP_CAP_PACKAGES"), 100)
    Stats.SetInt(J(MPX() .. "AWD_MENTALSTATE_TO_NORMAL"), 50)
    Stats.SetBool(J(MPX() .. "AWD_STORE_20_CAR_IN_GARAGES"), 1)
    Stats.SetInt(J(MPX() .. "AWD_TRADE_IN_YOUR_PROPERTY"), 25)
    Stats.SetBool(J(MPX() .. "AWD_DAILYOBJWEEKBONUS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DAILYOBJMONTHBONUS"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FM_CR_DM_MADE"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_CR_RACES_MADE"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_CR_PLAYED_BY_PEEP"), 1598)
    Stats.SetInt(J(MPX() .. "AWD_FM_CR_MISSION_SCORE"), 100)
    Stats.SetBool(J(MPX() .. "CL_DRIVE_RALLY"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_GTA_RACE"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_BOAT_RACE"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_FOOT_RACE"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_TEAM_DM"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_VEHICLE_DM"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_MISSION_CONTACT"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_A_PLAYLIST"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_POINT_TO_POINT"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_ONE_ON_ONE_DM"), 1)
    Stats.SetBool(J(MPX() .. "CL_PLAY_ONE_ON_ONE_RACE"), 1)
    Stats.SetBool(J(MPX() .. "CL_SURV_A_BOUNTY"), 1)
    Stats.SetBool(J(MPX() .. "CL_SET_WANTED_LVL_ON_PLAY"), 1)
    Stats.SetBool(J(MPX() .. "CL_GANG_BACKUP_GANGS"), 1)
    Stats.SetBool(J(MPX() .. "CL_GANG_BACKUP_LOST"), 1)
    Stats.SetBool(J(MPX() .. "CL_GANG_BACKUP_VAGOS"), 1)
    Stats.SetBool(J(MPX() .. "CL_CALL_MERCENARIES"), 1)
    Stats.SetBool(J(MPX() .. "CL_PHONE_MECH_DROP_CAR"), 1)
    Stats.SetBool(J(MPX() .. "CL_GONE_OFF_RADAR"), 1)
    Stats.SetBool(J(MPX() .. "CL_FILL_TITAN"), 1)
    Stats.SetBool(J(MPX() .. "CL_MOD_CAR_USING_APP"), 1)
    Stats.SetBool(J(MPX() .. "CL_MOD_CAR_USING_APP"), 1)
    Stats.SetBool(J(MPX() .. "CL_BUY_INSURANCE"), 1)
    Stats.SetBool(J(MPX() .. "CL_BUY_GARAGE"), 1)
    Stats.SetBool(J(MPX() .. "CL_ENTER_FRIENDS_HOUSE"), 1)
    Stats.SetBool(J(MPX() .. "CL_CALL_STRIPPER_HOUSE"), 1)
    Stats.SetBool(J(MPX() .. "CL_CALL_FRIEND"), 1)
    Stats.SetBool(J(MPX() .. "CL_SEND_FRIEND_REQUEST"), 1)
    Stats.SetBool(J(MPX() .. "CL_W_WANTED_PLAYER_TV"), 1)
    Stats.SetBool(J(MPX() .. "FM_INTRO_CUT_DONE"), 1)
    Stats.SetBool(J(MPX() .. "FM_INTRO_MISS_DONE"), 1)
    Stats.SetBool(J(MPX() .. "SHOOTINGRANGE_SEEN_TUT"), 1)
    Stats.SetBool(J(MPX() .. "TENNIS_SEEN_TUTORIAL"), 1)
    Stats.SetBool(J(MPX() .. "DARTS_SEEN_TUTORIAL"), 1)
    Stats.SetBool(J(MPX() .. "ARMWRESTLING_SEEN_TUTORIAL"), 1)
    Stats.SetBool(J(MPX() .. "HAS_WATCHED_BENNY_CUTSCE"), 1)
    Stats.SetInt(J(MPX() .. "NO_PHOTOS_TAKEN"), 100)
    Stats.SetInt(J(MPX() .. "BOUNTSONU"), 200)
    Stats.SetInt(J(MPX() .. "BOUNTPLACED"), 500)
    Stats.SetInt(J(MPX() .. "BETAMOUNT"), 500)
    Stats.SetInt(J(MPX() .. "CRARMWREST"), 500)
    Stats.SetInt(J(MPX() .. "CRBASEJUMP"), 500)
    Stats.SetInt(J(MPX() .. "CRDARTS"), 500)
    Stats.SetInt(J(MPX() .. "CRDM"), 500)
    Stats.SetInt(J(MPX() .. "CRGANGHIDE"), 500)
    Stats.SetInt(J(MPX() .. "CRGOLF"), 500)
    Stats.SetInt(J(MPX() .. "CRHORDE"), 500)
    Stats.SetInt(J(MPX() .. "CRMISSION"), 500)
    Stats.SetInt(J(MPX() .. "CRSHOOTRNG"), 500)
    Stats.SetInt(J(MPX() .. "CRTENNIS"), 500)
    Stats.SetInt(J(MPX() .. "NO_TIMES_CINEMA"), 500)
end)

AUMMain:Button("Weapons", function()
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_UNLOCKED"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_UNLOCKED2"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_UNLOCKED3"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_UNLOCKED4"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_ADDON_1_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_ADDON_2_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_ADDON_3_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_ADDON_4_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_FREE"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_FREE2"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_FREE"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_FREE2"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_FREE3"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_FREE4"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_PURCHASED"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_PURCHASED2"), -1)
    Stats.SetInt(J(MPX() .. "WEAPON_PICKUP_BITSET"), -1)
    Stats.SetInt(J(MPX() .. "WEAPON_PICKUP_BITSET2"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_UNLOCKED"), -1)
    Stats.SetInt(J(MPX() .. "NO_WEAPONS_UNLOCK"), -1)
    Stats.SetInt(J(MPX() .. "NO_WEAPON_MODS_UNLOCK"), -1)
    Stats.SetInt(J(MPX() .. "NO_WEAPON_CLR_MOD_UNLOCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_UNLOCKED2"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_UNLOCKED3"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_UNLOCKED4"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_1_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_2_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_3_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_4_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_5_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_6_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_7_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_8_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_9_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_10_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_11_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_12_FM_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_KIT_FM_PURCHASE"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_FM_PURCHASE"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_FM_PURCHASE2"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_FM_PURCHASE3"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_WEAP_FM_PURCHASE4"), -1)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_1_WHITE"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_1_RED"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_1_BLUE"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_2_WHITE"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_2_RED"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_2_BLUE"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_3_WHITE"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_3_RED"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_3_BLUE"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_4_WHITE"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_4_RED"), 1000)
    Stats.SetInt(J(MPX() .. "FIREWORK_TYPE_4_BLUE"), 1000)
    Stats.SetInt(J(MPX() .. "WEAP_FM_ADDON_PURCH"), -1)
    for i = 2, 19 do
        Stats.SetInt(J(MPX() .. "WEAP_FM_ADDON_PURCH" .. i), -1)
    end
    for j = 1, 19 do
        Stats.SetInt(J(MPX() .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK"), -1)
    end
    for m = 1, 41 do
        Stats.SetInt(J(MPX() .. "CHAR_KIT_" .. m .. "_FM_UNLCK"), -1)
    end
    for l = 2, 41 do
        Stats.SetInt(J(MPX() .. "CHAR_KIT_FM_PURCHASE" .. l), -1)
    end
end)

AUMMain:Button("Crimes", function()
    Stats.SetInt(J(MPX() .. "AWD_FMTIME5STARWANTED"), 120)
    Stats.SetInt(J(MPX() .. "AWD_5STAR_WANTED_AVOIDANCE"), 50)
    Stats.SetInt(J(MPX() .. "AWD_FMSHOOTDOWNCOPHELI"), 25)
    Stats.SetInt(J(MPX() .. "AWD_VEHICLES_JACKEDR"), 500)
    Stats.SetInt(J(MPX() .. "AWD_SECURITY_CARS_ROBBED"), 25)
    Stats.SetInt(J(MPX() .. "AWD_HOLD_UP_SHOPS"), 20)
    Stats.SetInt(J(MPX() .. "AWD_ODISTRACTCOPSNOEATH"), 25)
    Stats.SetInt(J(MPX() .. "AWD_ENEMYDRIVEBYKILLS"), 100)
    Stats.SetInt(J(MPX() .. "CHAR_WANTED_LEVEL_TIME5STAR"), 18000000)
    Stats.SetInt(J(MPX() .. "CARS_COPS_EXPLODED"), 300)
    Stats.SetInt(J(MPX() .. "BIKES_EXPLODED"), 100)
    Stats.SetInt(J(MPX() .. "BOATS_EXPLODED"), 168)
    Stats.SetInt(J(MPX() .. "HELIS_EXPLODED"), 98)
    Stats.SetInt(J(MPX() .. "PLANES_EXPLODED"), 138)
    Stats.SetInt(J(MPX() .. "QUADBIKE_EXPLODED"), 50)
    Stats.SetInt(J(MPX() .. "BICYCLE_EXPLODED"), 48)
    Stats.SetInt(J(MPX() .. "SUBMARINE_EXPLODED"), 28)
    Stats.SetInt(J(MPX() .. "TIRES_POPPED_BY_GUNSHOT"), 500)
    Stats.SetInt(J(MPX() .. "NUMBER_CRASHES_CARS"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_CRASHES_BIKES"), 300)
    Stats.SetInt(J(MPX() .. "BAILED_FROM_VEHICLE"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_CRASHES_QUADBIKES"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_COP_VEHICLE"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_CARS"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_BIKES"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_BOATS"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_HELIS"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_PLANES"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_QUADBIKES"), 300)
    Stats.SetInt(J(MPX() .. "NUMBER_STOLEN_BICYCLES"), 300)
    Stats.SetInt(J(MPX() .. "MC_CONTRIBUTION_POINTS"), 1000)
    Stats.SetInt(J(MPX() .. "MEMBERSMARKEDFORDEATH"), 700)
    Stats.SetInt(J(MPX() .. "MCKILLS"), 500)
    Stats.SetInt(J(MPX() .. "MCDEATHS"), 700)
    Stats.SetInt(J(MPX() .. "RIVALPRESIDENTKILLS"), 700)
    Stats.SetInt(J(MPX() .. "RIVALCEOANDVIPKILLS"), 700)
    Stats.SetInt(J(MPX() .. "CLUBHOUSECONTRACTSCOMPLETE"), 700)
    Stats.SetInt(J(MPX() .. "CLUBHOUSECONTRACTEARNINGS"), 32698547)
    Stats.SetInt(J(MPX() .. "CLUBCHALLENGESCOMPLETED"), 700)
    Stats.SetInt(J(MPX() .. "MEMBERCHALLENGESCOMPLETED"), 700)
    Stats.SetInt(J(MPX() .. "GHKILLS"), 500)
    Stats.SetInt(J(MPX() .. "HORDELVL"), 10)
    Stats.SetInt(J(MPX() .. "HORDKILLS"), 500)
    Stats.SetInt(J(MPX() .. "UNIQUECRATES"), 500)
    Stats.SetInt(J(MPX() .. "BJWINS"), 500)
    Stats.SetInt(J(MPX() .. "HORDEWINS"), 500)
    Stats.SetInt(J(MPX() .. "MCMWINS"), 500)
    Stats.SetInt(J(MPX() .. "GANGHIDWINS"), 500)
    Stats.SetInt(J(MPX() .. "KILLS"), 800)
    Stats.SetInt(J(MPX() .. "HITS_PEDS_VEHICLES"), 100)
    Stats.SetInt(J(MPX() .. "SHOTS"), 1000)
    Stats.SetInt(J(MPX() .. "HEADSHOTS"), 100)
    Stats.SetInt(J(MPX() .. "KILLS_ARMED"), 650)
    Stats.SetInt(J(MPX() .. "SUCCESSFUL_COUNTERS"), 100)
    Stats.SetInt(J(MPX() .. "KILLS_PLAYERS"), 3593)
    Stats.SetInt(J(MPX() .. "DEATHS_PLAYER"), 1002)
    Stats.SetInt(J(MPX() .. "KILLS_STEALTH"), 100)
    Stats.SetInt(J(MPX() .. "KILLS_INNOCENTS"), 500)
    Stats.SetInt(J(MPX() .. "KILLS_ENEMY_GANG_MEMBERS"), 500)
    Stats.SetInt(J(MPX() .. "KILLS_FRIENDLY_GANG_MEMBERS"), 500)
    Stats.SetInt(J(MPX() .. "KILLS_BY_OTHERS"), 100)
    Stats.SetInt(J(MPX() .. "BIGGEST_VICTIM_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "ARCHENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "KILLS_COP"), 4500)
    Stats.SetInt(J(MPX() .. "KILLS_SWAT"), 500)
    Stats.SetInt(J(MPX() .. "STARS_ATTAINED"), 5000)
    Stats.SetInt(J(MPX() .. "STARS_EVADED"), 4000)
    Stats.SetInt(J(MPX() .. "VEHEXPORTED"), 500)
    Stats.SetInt(J(MPX() .. "TOTAL_NO_SHOPS_HELD_UP"), 100)
    Stats.SetInt(J(MPX() .. "CR_GANGATTACK_CITY"), 1000)
    Stats.SetInt(J(MPX() .. "CR_GANGATTACK_COUNTRY"), 1000)
    Stats.SetInt(J(MPX() .. "CR_GANGATTACK_LOST"), 1000)
    Stats.SetInt(J(MPX() .. "CR_GANGATTACK_VAGOS"), 1000)
    Stats.SetInt(J(MPX() .. "NO_NON_CONTRACT_RACE_WIN"), 500)
    Stats.SetInt(J(MPX() .. "DIED_IN_DROWNING"), 833)
    Stats.SetInt(J(MPX() .. "DIED_IN_DROWNINGINVEHICLE"), 833)
    Stats.SetInt(J(MPX() .. "DIED_IN_EXPLOSION"), 833)
    Stats.SetInt(J(MPX() .. "DIED_IN_FALL"), 833)
    Stats.SetInt(J(MPX() .. "DIED_IN_FIRE"), 833)
    Stats.SetInt(J(MPX() .. "DIED_IN_ROAD"), 833)
    Stats.SetInt(J(MPX() .. "GRENADE_ENEMY_KILLS"), 50)
    Stats.SetInt(J(MPX() .. "MICROSMG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "SMG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "ASLTSMG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "CRBNRIFLE_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "ADVRIFLE_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "MG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "CMBTMG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "ASLTMG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "RPG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "PISTOL_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "PLAYER_HEADSHOTS"), 500)
    Stats.SetInt(J(MPX() .. "SAWNOFF_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "STKYBMB_ENEMY_KILLS"), 50)
    Stats.SetInt(J(MPX() .. "UNARMED_ENEMY_KILLS"), 50)
    Stats.SetInt(J(MPX() .. "SNIPERRFL_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "HVYSNIPER_ENEMY_KILLS"), 500)
end)

AUMMain:Button("Vehicles", function()
    Stats.SetInt(J(MPX() .. "AWD_50_VEHICLES_BLOWNUP"), 500)
    Stats.SetInt(J(MPX() .. "CARS_EXPLODED"), 500)
    Stats.SetInt(J(MPX() .. "AWD_CAR_EXPORT"), 100)
    Stats.SetInt(J(MPX() .. "AWD_FMDRIVEWITHOUTCRASH"), 30)
    Stats.SetInt(J(MPX() .. "AWD_PASSENGERTIME"), 4)
    Stats.SetInt(J(MPX() .. "AWD_TIME_IN_HELICOPTER"), 4)
    Stats.SetInt(J(MPX() .. "AWD_VEHICLE_JUMP_OVER_40M"), 25)
    Stats.SetInt(J(MPX() .. "MOST_FLIPS_IN_ONE_JUMP"), 5)
    Stats.SetInt(J(MPX() .. "MOST_SPINS_IN_ONE_JUMP"), 5)
    Stats.SetInt(J(MPX() .. "CHAR_FM_VEHICLE_1_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "CHAR_FM_VEHICLE_2_UNLCK"), -1)
    Stats.SetInt(J(MPX() .. "NO_CARS_REPAIR"), 1000)
    Stats.SetInt(J(MPX() .. "VEHICLES_SPRAYED"), 500)
    Stats.SetInt(J(MPX() .. "NUMBER_NEAR_MISS_NOCRASH"), 500)
    Stats.SetInt(J(MPX() .. "USJS_FOUND"), 50)
    Stats.SetInt(J(MPX() .. "USJS_COMPLETED"), 50)
    Stats.SetInt(J(MPX() .. "USJS_TOTAL_COMPLETED"), 50)
    Stats.SetInt(J(MPX() .. "CRDEADLINE"), 5)
    Stats.SetInt(J(MPX() .. "FAVOUTFITBIKETIMECURRENT"), 2069146067)
    Stats.SetInt(J(MPX() .. "FAVOUTFITBIKETIME1ALLTIME"), 2069146067)
    Stats.SetInt(J(MPX() .. "FAVOUTFITBIKETYPECURRENT"), 2069146067)
    Stats.SetInt(J(MPX() .. "FAVOUTFITBIKETYPEALLTIME"), 2069146067)
    Stats.SetInt(J(MPX() .. "LONGEST_WHEELIE_DIST"), 1000)
    Stats.SetInt(J(MPX() .. "RACES_WON"), 50)
    Stats.SetInt(J(MPX() .. "COUNT_HOTRING_RACE"), 20)
    Stats.SetBool(J(MPX() .. "AWD_FMFURTHESTWHEELIE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FMFULLYMODDEDCAR"), 1)
end)

AUMMain:Button("Combat", function()
    Stats.SetInt(J(MPX() .. "AWD_100_HEADSHOTS"), 500)
    Stats.SetInt(J(MPX() .. "AWD_FMOVERALLKILLS"), 1000)
    Stats.SetInt(J(MPX() .. "AWD_FMKILLBOUNTY"), 25)
    Stats.SetInt(J(MPX() .. "AWD_FM_DM_3KILLSAMEGUY"), 50)
    Stats.SetInt(J(MPX() .. "AWD_FM_DM_KILLSTREAK"), 100)
    Stats.SetInt(J(MPX() .. "AWD_FM_DM_STOLENKILL"), 50)
    Stats.SetInt(J(MPX() .. "AWD_FM_DM_TOTALKILLS"), 500)
    Stats.SetBool(J(MPX() .. "AWD_FMKILLSTREAKSDM"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FMMOSTKILLSGANGHIDE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FMMOSTKILLSSURVIVE"), 1)
    Stats.SetInt(J(MPX() .. "AWD_FMREVENGEKILLSDM"), 50)
    Stats.SetInt(J(MPX() .. "AWD_KILL_CARRIER_CAPTURE"), 100)
    Stats.SetInt(J(MPX() .. "AWD_NIGHTVISION_KILLS"), 100)
    Stats.SetInt(J(MPX() .. "AWD_KILL_PSYCHOPATHS"), 100)
    Stats.SetInt(J(MPX() .. "AWD_TAKEDOWNSMUGPLANE"), 50)
    Stats.SetInt(J(MPX() .. "AWD_100_KILLS_PISTOL"), 500)
    Stats.SetInt(J(MPX() .. "AWD_100_KILLS_SMG"), 500)
    Stats.SetInt(J(MPX() .. "AWD_100_KILLS_SHOTGUN"), 500)
    Stats.SetInt(J(MPX() .. "ASLTRIFLE_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "AWD_100_KILLS_SNIPER"), 500)
    Stats.SetInt(J(MPX() .. "MG_ENEMY_KILLS"), 500)
    Stats.SetInt(J(MPX() .. "AWD_25_KILLS_STICKYBOMBS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_50_KILLS_GRENADES"), 50)
    Stats.SetInt(J(MPX() .. "AWD_50_KILLS_ROCKETLAUNCH"), 50)
    Stats.SetInt(J(MPX() .. "AWD_20_KILLS_MELEE"), 50)
    Stats.SetInt(J(MPX() .. "AWD_CAR_BOMBS_ENEMY_KILLS"), 25)
    Stats.SetInt(J(MPX() .. "MELEEKILLS"), 700)
    Stats.SetInt(J(MPX() .. "HITS"), 10000)
    Stats.SetInt(J(MPX() .. "DEATHS"), 499)
    Stats.SetInt(J(MPX() .. "HIGHEST_SKITTLES"), 900)
    Stats.SetInt(J(MPX() .. "NUMBER_NEAR_MISS"), 1000)
end)
end)

Section("Heist Awards", function()
HAUM = AUM:Tab("Heist")
end)

Section("Apartment Heist Awards", function()
APARTMENTAUM = HAUM

APARTMENTAUM:Box("Heist Awards")
APARTMENTAUM:Button("Unlock All Apartment Heists Awards", function()
    Stats.SetInt(J(MPX() .. "AWD_FINISH_HEISTS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB"), 50)
    Stats.SetInt(J(MPX() .. "AWD_COMPLETE_HEIST_NOT_DIE"), -1)
    Stats.SetBool(J(MPX() .. "AWD_FINISH_HEIST_NO_DAMAGE"), 1)
    Stats.SetInt(J(MPX() .. "AWD_WIN_GOLD_MEDAL_HEISTS"), 25)
    Stats.SetInt(J(MPX() .. "AWD_DO_HEIST_AS_MEMBER"), 25)
    Stats.SetInt(J(MPX() .. "AWD_DO_HEIST_AS_THE_LEADER"), 25)
    Stats.SetBool(J(MPX() .. "AWD_SPLIT_HEIST_TAKE_EVENLY"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ACTIVATE_2_PERSON_KEY"), 1)
    Stats.SetInt(J(MPX() .. "AWD_CONTROL_CROWDS"), 25)
    Stats.SetBool(J(MPX() .. "AWD_ALL_ROLES_HEIST"), 1)
    Stats.SetInt(J(MPX() .. "HEIST_COMPLETION"), 25)
    Stats.SetInt(J(MPX() .. "HEISTS_ORGANISED"), -1)
    Stats.SetInt(J(MPX() .. "HEIST_START"), -1)
    Stats.SetInt(J(MPX() .. "HEIST_END"), -1)
    Stats.SetInt(J(MPX() .. "CUTSCENE_MID_PRISON"), -1)
    Stats.SetInt(J(MPX() .. "CUTSCENE_MID_HUMANE"), -1)
    Stats.SetInt(J(MPX() .. "CUTSCENE_MID_NARC"), -1)
    Stats.SetInt(J(MPX() .. "CUTSCENE_MID_ORNATE"), -1)
    Stats.SetInt(J(MPX() .. "CR_FLEECA_PREP_1"), -1)
    Stats.SetInt(J(MPX() .. "CR_FLEECA_PREP_2"), -1)
    Stats.SetInt(J(MPX() .. "CR_FLEECA_FINALE"), -1)
    Stats.SetInt(J(MPX() .. "CR_PRISON_PLANE"), -1)
    Stats.SetInt(J(MPX() .. "CR_PRISON_BUS"), -1)
    Stats.SetInt(J(MPX() .. "CR_PRISON_STATION"), -1)
    Stats.SetInt(J(MPX() .. "CR_PRISON_UNFINISHED_BIZ"), -1)
    Stats.SetInt(J(MPX() .. "CR_PRISON_FINALE"), -1)
    Stats.SetInt(J(MPX() .. "CR_HUMANE_KEY_CODES"), -1)
    Stats.SetInt(J(MPX() .. "CR_HUMANE_ARMORDILLOS"), -1)
    Stats.SetInt(J(MPX() .. "CR_HUMANE_EMP"), -1)
    Stats.SetInt(J(MPX() .. "CR_HUMANE_VALKYRIE"), -1)
    Stats.SetInt(J(MPX() .. "CR_HUMANE_FINALE"), -1)
    Stats.SetInt(J(MPX() .. "CR_NARC_COKE"), -1)
    Stats.SetInt(J(MPX() .. "CR_NARC_TRASH_TRUCK"), -1)
    Stats.SetInt(J(MPX() .. "CR_NARC_BIKERS"), -1)
    Stats.SetInt(J(MPX() .. "CR_NARC_WEED"), -1)
    Stats.SetInt(J(MPX() .. "CR_NARC_STEAL_METH"), -1)
    Stats.SetInt(J(MPX() .. "CR_NARC_FINALE"), -1)
    Stats.SetInt(J(MPX() .. "CR_PACIFIC_TRUCKS"), -1)
    Stats.SetInt(J(MPX() .. "CR_PACIFIC_WITSEC"), -1)
    Stats.SetInt(J(MPX() .. "CR_PACIFIC_HACK"), -1)
    Stats.SetInt(J(MPX() .. "CR_PACIFIC_BIKES"), -1)
    Stats.SetInt(J(MPX() .. "CR_PACIFIC_CONVOY"), -1)
    Stats.SetInt(J(MPX() .. "CR_PACIFIC_FINALE"), -1)
    Stats.SetInt(J("MPPLY_HEIST_ACH_TRACKER"), -1)
    Stats.SetInt(J("MPPLY_WIN_GOLD_MEDAL_HEISTS"), 25)
    Stats.SetBool(J("MPPLY_AWD_FLEECA_FIN"), 1)
    Stats.SetBool(J("MPPLY_AWD_PRISON_FIN"), 1)
    Stats.SetBool(J("MPPLY_AWD_HUMANE_FIN"), 1)
    Stats.SetBool(J("MPPLY_AWD_SERIESA_FIN"), 1)
    Stats.SetBool(J("MPPLY_AWD_PACIFIC_FIN"), 1)
    Stats.SetBool(J("MPPLY_AWD_HST_ORDER"), 1)
    Stats.SetBool(J("MPPLY_AWD_COMPLET_HEIST_MEM"), 1)
    Stats.SetBool(J("MPPLY_AWD_COMPLET_HEIST_1STPER"), 1)
    Stats.SetBool(J("MPPLY_AWD_HST_SAME_TEAM"), 1)
    Stats.SetBool(J("MPPLY_AWD_HST_ULT_CHAL"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MATCHING_OUTFIT_HEIST"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_PLANNING_DONE_PRINT"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_PLANNING_DONE_HELP_0"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_PLANNING_DONE_HELP_1"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_PRE_PLAN_DONE_HELP_0"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_CUTS_DONE_FINALE"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_IS_TUTORIAL"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_STRAND_INTRO_DONE"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_CUTS_DONE_ORNATE"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_CUTS_DONE_PRISON"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_CUTS_DONE_BIOLAB"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_CUTS_DONE_NARCOTIC"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_CUTS_DONE_TUTORIAL"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_AWARD_DONE_PREP"), 1)
    Stats.SetBool(J(MPX() .. "HEIST_AWARD_BOUGHT_IN"), 1)
    Stats.SetInt(J(MPX() .. "HEIST_PLANNING_STAGE"), -1)
end)
end)

Section("Diamond Casino Heist Awards", function()
DIAMONHDAUM = HAUM

DIAMONHDAUM:Button("Unlock All Diamond Casino Heist Awards", function()
    Stats.SetInt(J(MPX() .. "CAS_HEIST_NOTS"), -1)
    Stats.SetInt(J(MPX() .. "CAS_HEIST_FLOW"), -1)
    Stats.SetInt(J(MPX() .. "SIGNAL_JAMMERS_COLLECTED"), 50)
    Stats.SetInt(J(MPX() .. "AWD_PREPARATION"), 40)
    Stats.SetInt(J(MPX() .. "AWD_ASLEEPONJOB"), 20)
    Stats.SetInt(J(MPX() .. "AWD_DAICASHCRAB"), 100000)
    Stats.SetInt(J(MPX() .. "AWD_BIGBRO"), 40)
    Stats.SetInt(J(MPX() .. "AWD_SHARPSHOOTER"), 40)
    Stats.SetInt(J(MPX() .. "AWD_RACECHAMP"), 40)
    Stats.SetInt(J(MPX() .. "AWD_BATSWORD"), 1000000)
    Stats.SetInt(J(MPX() .. "AWD_COINPURSE"), 950000)
    Stats.SetInt(J(MPX() .. "AWD_ASTROCHIMP"), 3000000)
    Stats.SetInt(J(MPX() .. "AWD_MASTERFUL"), 40000)
    Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE0"), -1)
    Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE1"), -1)
    Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE2"), -1)
    Stats.SetInt(J(MPX() .. "H3_VEHICLESUSED"), -1)
    Stats.SetInt(J(MPX() .. "H3_CR_STEALTH_1A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_STEALTH_2B_RAPP"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_STEALTH_2C_SIDE"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_STEALTH_3A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_STEALTH_4A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_STEALTH_5A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_SUBTERFUGE_1A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_SUBTERFUGE_2A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_SUBTERFUGE_2B"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_SUBTERFUGE_3A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_SUBTERFUGE_3B"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_SUBTERFUGE_4A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_SUBTERFUGE_5A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_1A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_2A1"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_2A2"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_2BP"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_2C"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_3A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_4A"), 100)
    Stats.SetInt(J(MPX() .. "H3_CR_DIRECT_5A"), 100)
    Stats.SetInt(J(MPX() .. "CR_ORDER"), 100)
    Stats.SetBool(J(MPX() .. "AWD_SCOPEOUT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CREWEDUP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MOVINGON"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PROMOCAMP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_GUNMAN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SMASHNGRAB"), 1)
    Stats.SetBool(J(MPX() .. "AWD_INPLAINSI"), 1)
    Stats.SetBool(J(MPX() .. "AWD_UNDETECTED"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ALLROUND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ELITETHEIF"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PRO"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SUPPORTACT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHAFTED"), 1)
    Stats.SetBool(J(MPX() .. "AWD_COLLECTOR"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DEADEYE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PISTOLSATDAWN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TRAFFICAVOI"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CANTCATCHBRA"), 1)
    Stats.SetBool(J(MPX() .. "AWD_WIZHARD"), 1)
    Stats.SetBool(J(MPX() .. "AWD_APEESCAPE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MONKEYKIND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_AQUAAPE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_KEEPFAITH"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TRUELOVE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_NEMESIS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FRIENDZONED"), 1)
    Stats.SetBool(J(MPX() .. "VCM_FLOW_CS_RSC_SEEN"), 1)
    Stats.SetBool(J(MPX() .. "VCM_FLOW_CS_BWL_SEEN"), 1)
    Stats.SetBool(J(MPX() .. "VCM_FLOW_CS_MTG_SEEN"), 1)
    Stats.SetBool(J(MPX() .. "VCM_FLOW_CS_OIL_SEEN"), 1)
    Stats.SetBool(J(MPX() .. "VCM_FLOW_CS_DEF_SEEN"), 1)
    Stats.SetBool(J(MPX() .. "VCM_FLOW_CS_FIN_SEEN"), 1)
    Stats.SetBool(J(MPX() .. "HELP_FURIA"), 1)
    Stats.SetBool(J(MPX() .. "HELP_MINITAN"), 1)
    Stats.SetBool(J(MPX() .. "HELP_YOSEMITE2"), 1)
    Stats.SetBool(J(MPX() .. "HELP_ZHABA"), 1)
    Stats.SetBool(J(MPX() .. "HELP_IMORGEN"), 1)
    Stats.SetBool(J(MPX() .. "HELP_SULTAN2"), 1)
    Stats.SetBool(J(MPX() .. "HELP_VAGRANT"), 1)
    Stats.SetBool(J(MPX() .. "HELP_VSTR"), 1)
    Stats.SetBool(J(MPX() .. "HELP_STRYDER"), 1)
    Stats.SetBool(J(MPX() .. "HELP_SUGOI"), 1)
    Stats.SetBool(J(MPX() .. "HELP_KANJO"), 1)
    Stats.SetBool(J(MPX() .. "HELP_FORMULA"), 1)
    Stats.SetBool(J(MPX() .. "HELP_FORMULA2"), 1)
    Stats.SetBool(J(MPX() .. "HELP_JB7002"), 1)
    for i = 0, 4 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "CASINOHSTPSTAT_BOOL" .. i), true, j, true)
        end
    end
end)
end)

Section("Cayo Perico Heist Awards", function()
CAYOAUM = HAUM

CAYOAUM:Button("Unlock All Cayo Heist Awards", function()
    Stats.SetBool(J(MPX() .. "AWD_INTELGATHER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_COMPOUNDINFILT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_LOOT_FINDER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MAX_DISRUPT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_THE_ISLAND_HEIST"), 1)
    Stats.SetBool(J(MPX() .. "AWD_GOING_ALONE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TEAM_WORK"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MIXING_UP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TEAM_WORK"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MIXING_UP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PRO_THIEF"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CAT_BURGLAR"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ONE_OF_THEM"), 1)
    Stats.SetBool(J(MPX() .. "AWD_GOLDEN_GUN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ELITE_THIEF"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PROFESSIONAL"), 1)
    Stats.SetBool(J(MPX() .. "AWD_HELPING_OUT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_COURIER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PARTY_VIBES"), 1)
    Stats.SetBool(J(MPX() .. "AWD_HELPING_HAND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ELEVENELEVEN"), 1)
    Stats.SetBool(J(MPX() .. "COMPLETE_H4_F_USING_VETIR"), 1)
    Stats.SetBool(J(MPX() .. "COMPLETE_H4_F_USING_LONGFIN"), 1)
    Stats.SetBool(J(MPX() .. "COMPLETE_H4_F_USING_ANNIH"), 1)
    Stats.SetBool(J(MPX() .. "COMPLETE_H4_F_USING_ALKONOS"), 1)
    Stats.SetBool(J(MPX() .. "COMPLETE_H4_F_USING_PATROLB"), 1)
    Stats.SetInt(J(MPX() .. "AWD_LOSTANDFOUND"), 500000)
    Stats.SetInt(J(MPX() .. "AWD_SUNSET"), 1800000)
    Stats.SetInt(J(MPX() .. "AWD_TREASURE_HUNTER"), 1000000)
    Stats.SetInt(J(MPX() .. "AWD_WRECK_DIVING"), 1000000)
    Stats.SetInt(J(MPX() .. "AWD_KEINEMUSIK"), 1800000)
    Stats.SetInt(J(MPX() .. "AWD_PALMS_TRAX"), 1800000)
    Stats.SetInt(J(MPX() .. "AWD_MOODYMANN"), 1800000)
    Stats.SetInt(J(MPX() .. "AWD_FILL_YOUR_BAGS"), 1000000000)
    Stats.SetInt(J(MPX() .. "AWD_WELL_PREPARED"), 80)
    Stats.SetInt(J(MPX() .. "H4_H4_DJ_MISSIONS"), -1)
    Stats.SetInt(J(MPX() .. "H4CNF_APPROACH"), -1)
    Stats.SetInt(J(MPX() .. "H4_MISSIONS"), -1)
    Stats.SetInt(J(MPX() .. "H4_PLAYTHROUGH_STATUS"), 100)
    for i = 0, 2 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "HISLANDPSTAT_BOOL" .. i), true, j, true)
        end
    end
end)
end)

Section("Doomsday Heist Awards", function()
DOOMSDAYAUM = HAUM

DOOMSDAYAUM:Button("Unlock All Doomsday Heist Awards", function()
    Stats.SetInt(J(MPX() .. "GANGOPS_HEIST_STATUS"), -1)
    Stats.SetInt(J(MPX() .. "GANGOPS_HEIST_STATUS"), -229384)
    Stats.SetInt(J(MPX() .. "GANGOPS_FM_MISSION_PROG"), -1)
    Stats.SetInt(J(MPX() .. "GANGOPS_FLOW_MISSION_PROG"), -1)
    Stats.SetInt(J("MPPLY_GANGOPS_ALLINORDER"), 100)
    Stats.SetInt(J("MPPLY_GANGOPS_LOYALTY"), 100)
    Stats.SetInt(J("MPPLY_GANGOPS_CRIMMASMD"), 100)
    Stats.SetInt(J("MPPLY_GANGOPS_LOYALTY2"), 100)
    Stats.SetInt(J("MPPLY_GANGOPS_LOYALTY3"), 100)
    Stats.SetInt(J("MPPLY_GANGOPS_CRIMMASMD2"), 100)
    Stats.SetInt(J("MPPLY_GANGOPS_CRIMMASMD3"), 100)
    Stats.SetInt(J("MPPLY_GANGOPS_SUPPORT"), 100)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_MORGUE"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_DELUXO"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_SERVERFARM"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_IAABASE_FIN"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_STEALOSPREY"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_FOUNDRY"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_RIOTVAN"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_SUBMARINECAR"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_SUBMARINE_FIN"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_PREDATOR"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_BMLAUNCHER"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_BCCUSTOM"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_STEALTHTANKS"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_SPYPLANE"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_FINALE"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_FINALE_P2"), 10)
    Stats.SetInt(J(MPX() .. "CR_GANGOP_FINALE_P3"), 10)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_IAA"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_SUBMARINE"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_MISSILE"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_ALLINORDER"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_LOYALTY"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_LOYALTY2"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_LOYALTY3"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_CRIMMASMD"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_CRIMMASMD2"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_CRIMMASMD3"), 1)
    Stats.SetBool(J("MPPLY_AWD_GANGOPS_SUPPORT"), 1)
    for j = 0, 63 do
        Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "GANGOPSPSTAT_BOOL0"), true, j, true)
    end
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "DLCSMUGCHARPSTAT_INT260"), 3, 16, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT260"), 3, 24, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT260"), 3, 32, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT260"), 3, 40, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT260"), 3, 48, 8, true)
end)
end)

Section("DLC Awards", function()
DLCAUM = AUM:Tab("DLC Awards")

DLCAUM:Box("DLC Awards")
DLCAUM:Button("The Kortz Center Heist", function()
    Stats.SetBool(J(MPX() .. "AWD_SCOPING"), 1)
    Stats.SetInt(J(MPX() .. "AWD_PREPPER"), 20)
    Stats.SetBool(J(MPX() .. "AWD_ADAPTABLE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_KORTZCENTERHEIST"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FINDSAWAY"), 1)
    Stats.SetBool(J(MPX() .. "AWD_WHOSTHERE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ELITETHIEF"), 1)
    Stats.SetBool(J(MPX() .. "AWD_NOLIFER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SOLITUDE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_COORDINATION"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FLEXIBLETHIEF"), 1)
    Stats.SetInt(J(MPX() .. "AWD_REPEATOFFENDER"), 20)
    Stats.SetInt(J(MPX() .. "AWD_FULLBAGS"), 5000000)
    Stats.SetBool(J(MPX() .. "AWD_HIDDENINPLAINSIGHT"), 1)
    Stats.SetInt(J(MPX() .. "AWD_CURATOR"), 5)
    Stats.SetInt(J(MPX() .. "AWD_LAPIDARY"), 5)
    Stats.SetBool(J(MPX() .. "AWD_PACIFIST"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PUTRIDPILFERING"), 1)
    Stats.SetBool(J(MPX() .. "AWD_METEORITICS"), 1)
end)

DLCAUM:Button("A Safehouse In The Hills", function()
    Stats.SetBool(J(MPX() .. "AWD_NEGATIVEPRESS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_USESELFDRIVINGVEH"), 1)
    Stats.SetBool(J(MPX() .. "AWD_LIONSDEN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TAKEOUTLEADEXPLO"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SUBWAYTRAIN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SUBWAYSTUNTJUMP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TRASHCOLLECTORS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ALLTRASHCOLLECTED"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIBFINALE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_HELPER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIBFINALECHALLENGE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MANSIONDEFEND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DEFLOWMOTIONKILLS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_YOUVEMADEIT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ANIMALLOVER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MANSADVERSARYWIN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ONTHECLOCK"), 1)
    Stats.SetInt(J(MPX() .. "AWD_TAXIDESTRUCTION"), 20)
    Stats.SetInt(J(MPX() .. "AWD_YOGA"), 50)
    Stats.SetInt(J(MPX() .. "AWD_JUICEDUP"), 100)
    Stats.SetInt(J(MPX() .. "AWD_MANADVERSARYDEFUSE"), 10)
    Stats.SetInt(J(MPX() .. "AWD_FIREFIGHTER"), 20)
    Stats.SetInt(J(MPX() .. "AWD_ALPHAMAIL"), 20)
    Stats.SetInt(J(MPX() .. "AWD_LOSSANTOSMETEOR"), 20)
end)

DLCAUM:Button("Agents of Sabotage", function()
    for i = 9542, 9546 do
        Natives.InvokeVoid(N.SET_PACKED_STAT_BOOL_CODE, i, true, CharSlot())
    end
    Natives.InvokeVoid(N.SET_PACKED_STAT_BOOL_CODE, 9549, true, CharSlot())
    Natives.InvokeVoid(N.SET_PACKED_STAT_INT_CODE, 24903, 25, CharSlot())
    Natives.InvokeVoid(N.SET_PACKED_STAT_INT_CODE, 24904, 2, CharSlot())
    Stats.SetInt(J(MPX() .. "HACKER24_GEN_BS"), 8160)
    Stats.SetBool(J(MPX() .. "AWD_FINEART"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BRUTEFORCE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PROJECTBREAK"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BLACKBOXFILE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BONUSPOINTS"), 1)
    Stats.SetInt(J(MPX() .. "AWD_DARNELLBROSINC"), 50)
    Stats.SetInt(J(MPX() .. "AWD_GET_READY"), 50)
end)

DLCAUM:Button("After Hours", function()
    Stats.SetInt(J(MPX() .. "AWD_DANCE_TO_SOLOMUN"), 120)
    Stats.SetInt(J(MPX() .. "AWD_DANCE_TO_TALEOFUS"), 120)
    Stats.SetInt(J(MPX() .. "AWD_DANCE_TO_DIXON"), 120)
    Stats.SetInt(J(MPX() .. "AWD_DANCE_TO_BLKMAD"), 120)
    Stats.SetInt(J(MPX() .. "AWD_CLUB_DRUNK"), 200)
    Stats.SetInt(J(MPX() .. "NIGHTCLUB_VIP_APPEAR"), 700)
    Stats.SetInt(J(MPX() .. "NIGHTCLUB_JOBS_DONE"), 700)
    Stats.SetInt(J(MPX() .. "NIGHTCLUB_EARNINGS"), 5721002)
    Stats.SetInt(J(MPX() .. "HUB_SALES_COMPLETED"), 1001)
    Stats.SetInt(J(MPX() .. "HUB_EARNINGS"), 20721002)
    Stats.SetInt(J(MPX() .. "DANCE_COMBO_DURATION_MINS"), 3600000)
    Stats.SetInt(J(MPX() .. "NIGHTCLUB_PLAYER_APPEAR"), 100)
    Stats.SetInt(J(MPX() .. "LIFETIME_HUB_GOODS_SOLD"), 784672)
    Stats.SetInt(J(MPX() .. "LIFETIME_HUB_GOODS_MADE"), 507822)
    Stats.SetInt(J(MPX() .. "DANCEPERFECTOWNCLUB"), 120)
    Stats.SetInt(J(MPX() .. "NUMUNIQUEPLYSINCLUB"), 120)
    Stats.SetInt(J(MPX() .. "DANCETODIFFDJS"), 4)
    Stats.SetInt(J(MPX() .. "NIGHTCLUB_HOTSPOT_TIME_MS"), 3600000)
    Stats.SetInt(J(MPX() .. "NIGHTCLUB_CONT_TOTAL"), 20)
    Stats.SetInt(J(MPX() .. "NIGHTCLUB_CONT_MISSION"), -1)
    Stats.SetInt(J(MPX() .. "CLUB_CONTRABAND_MISSION"), 1000)
    Stats.SetInt(J(MPX() .. "HUB_CONTRABAND_MISSION"), 1000)
    Stats.SetBool(J(MPX() .. "AWD_CLUB_HOTSPOT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CLUB_CLUBBER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CLUB_COORD"), 1)
    for j = 0, 63 do
        Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "BUSINESSBATPSTAT_BOOL0"), true, j, true)
        Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "BUSINESSBATPSTAT_BOOL1"), true, j, true)
    end
    if GetStatMaskedInt(MPX() .. "BUSINESSBATPSTAT_INT380", 0, 8) < 20 then
        Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT380"), 20, 0, 8, true)
    end
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT379"), 50, 8, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT379"), 100, 16, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT379"), 20, 24, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT379"), 80, 32, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT379"), 60, 40, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT379"), 40, 48, 8, true)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "BUSINESSBATPSTAT_INT379"), 10, 56, 8, true)
end)

DLCAUM:Button("Arena War", function()
    Stats.SetInt(J(MPX() .. "ARN_BS_TRINKET_TICKERS"), -1)
    Stats.SetInt(J(MPX() .. "ARN_BS_TRINKET_SAVED"), -1)
    Stats.SetInt(J(MPX() .. "AWD_WATCH_YOUR_STEP"), 50)
    Stats.SetInt(J(MPX() .. "AWD_TOWER_OFFENSE"), 50)
    Stats.SetInt(J(MPX() .. "AWD_READY_FOR_WAR"), 50)
    Stats.SetInt(J(MPX() .. "AWD_THROUGH_A_LENS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_SPINNER"), 50)
    Stats.SetInt(J(MPX() .. "AWD_YOUMEANBOOBYTRAPS"), 50)
    Stats.SetInt(J(MPX() .. "AWD_MASTER_BANDITO"), 50)
    Stats.SetInt(J(MPX() .. "AWD_SITTING_DUCK"), 50)
    Stats.SetInt(J(MPX() .. "AWD_CROWDPARTICIPATION"), 50)
    Stats.SetInt(J(MPX() .. "AWD_KILL_OR_BE_KILLED"), 50)
    Stats.SetInt(J(MPX() .. "AWD_MASSIVE_SHUNT"), 50)
    Stats.SetInt(J(MPX() .. "AWD_YOURE_OUTTA_HERE"), 200)
    Stats.SetInt(J(MPX() .. "AWD_WEVE_GOT_ONE"), 50)
    Stats.SetInt(J(MPX() .. "AWD_ARENA_WAGEWORKER"), 1000000)
    Stats.SetInt(J(MPX() .. "AWD_TIME_SERVED"), 1000)
    Stats.SetInt(J(MPX() .. "AWD_TOP_SCORE"), 55000)
    Stats.SetInt(J(MPX() .. "AWD_CAREER_WINNER"), 1000)
    Stats.SetInt(J(MPX() .. "ARENAWARS_SP"), 0)
    Stats.SetInt(J(MPX() .. "ARENAWARS_SKILL_LEVEL"), 20)
    Stats.SetInt(J(MPX() .. "ARENAWARS_SP_LIFETIME"), 100)
    Stats.SetInt(J(MPX() .. "ARENAWARS_AP"), 0)
    Stats.SetInt(J(MPX() .. "ARENAWARS_AP_TIER"), 1000)
    Stats.SetInt(J(MPX() .. "ARENAWARS_AP_LIFETIME"), 5055000)
    Stats.SetInt(J(MPX() .. "ARENAWARS_CARRER_UNLK"), -1)
    Stats.SetInt(J(MPX() .. "ARN_W_THEME_SCIFI"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_THEME_APOC"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_THEME_CONS"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_PASS_THE_BOMB"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_DETONATION"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_ARCADE_RACE"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_CTF"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_TAG_TEAM"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_DESTR_DERBY"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_CARNAGE"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_MONSTER_JAM"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_W_GAMES_MASTERS"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_L_PASS_THE_BOMB"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_DETONATION"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_ARCADE_RACE"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_CTF"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_TAG_TEAM"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_DESTR_DERBY"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_CARNAGE"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_MONSTER_JAM"), 500)
    Stats.SetInt(J(MPX() .. "ARN_L_GAMES_MASTERS"), 500)
    Stats.SetInt(J(MPX() .. "NUMBER_OF_CHAMP_BOUGHT"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_SPECTATOR_KILLS"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_LIFETIME_KILLS"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_LIFETIME_DEATHS"), 500)
    Stats.SetInt(J(MPX() .. "ARENAWARS_CARRER_WINS"), 1000)
    Stats.SetInt(J(MPX() .. "ARENAWARS_CARRER_WINT"), 1000)
    Stats.SetInt(J(MPX() .. "ARENAWARS_MATCHES_PLYD"), 1000)
    Stats.SetInt(J(MPX() .. "ARENAWARS_MATCHES_PLYDT"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_SPEC_BOX_TIME_MS"), 86400000)
    Stats.SetInt(J(MPX() .. "ARN_SPECTATOR_DRONE"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_SPECTATOR_CAMS"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_SMOKE"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_DRINK"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_MONSTER"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_MONSTER"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_MONSTER"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_CERBERUS"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_CERBERUS2"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_CERBERUS3"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_BRUISER"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_BRUISER2"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_BRUISER3"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_SLAMVAN4"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_SLAMVAN5"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_SLAMVAN6"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_BRUTUS"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_BRUTUS2"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_BRUTUS3"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_SCARAB"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_SCARAB2"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_SCARAB3"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_DOMINATOR4"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_DOMINATOR5"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_DOMINATOR6"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_IMPALER2"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_IMPALER3"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_IMPALER4"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_ISSI4"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_ISSI5"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_ISSI"), 61000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_IMPERATOR"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_IMPERATOR2"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_IMPERATOR3"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_ZR380"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_ZR3802"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_ZR3803"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_DEATHBIKE"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_DEATHBIKE2"), 1000)
    Stats.SetInt(J(MPX() .. "ARN_VEH_DEATHBIKE3"), 1000)
    Stats.SetBool(J(MPX() .. "AWD_BEGINNER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIELD_FILLER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ARMCHAIR_RACER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_LEARNER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SUNDAY_DRIVER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_THE_ROOKIE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BUMP_AND_RUN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_GEAR_HEAD"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DOOR_SLAMMER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_HOT_LAP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ARENA_AMATEUR"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PAINT_TRADER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHUNTER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_JOCK"), 1)
    Stats.SetBool(J(MPX() .. "AWD_WARRIOR"), 1)
    Stats.SetBool(J(MPX() .. "AWD_T_BONE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MAYHEM"), 1)
    Stats.SetBool(J(MPX() .. "AWD_WRECKER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CRASH_COURSE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ARENA_LEGEND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PEGASUS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_UNSTOPPABLE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CONTACT_SPORT"), 1)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "ARENAWARSPSTAT_INT"), 1, 35, 8, true)
    for i = 0, 8 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "ARENAWARSPSTAT_BOOL" .. i), true, j, true)
        end
    end
end)

DLCAUM:Button("Diamond Casino n Resort", function()
    Stats.SetInt(J(MPX() .. "AWD_ODD_JOBS"), 50)
    Stats.SetInt(J(MPX() .. "VCM_FLOW_PROGRESS"), -1)
    Stats.SetInt(J(MPX() .. "VCM_STORY_PROGRESS"), 5)
    Stats.SetBool(J(MPX() .. "AWD_FIRST_TIME1"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIRST_TIME2"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIRST_TIME3"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIRST_TIME4"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIRST_TIME5"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FIRST_TIME6"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ALL_IN_ORDER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SUPPORTING_ROLE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_LEADER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SURVIVALIST"), 1)
    Paragon = GetStatBool(MPX() .. "CAS_VEHICLE_REWARD")
    if Paragon == true then
        Stats.SetBool(J(MPX() .. "CAS_VEHICLE_REWARD"), 1)
    else
        Stats.SetBool(J(MPX() .. "CAS_VEHICLE_REWARD"), 0)
    end
    for i = 0, 6 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "CASINOPSTAT_BOOL" .. i), true, j, true)
        end
    end
end)

DLCAUM:Button("Arcade", function()
    Stats.SetInt(J(MPX() .. "AWD_PREPARATION"), 50)
    Stats.SetInt(J(MPX() .. "AWD_ASLEEPONJOB"), 20)
    Stats.SetInt(J(MPX() .. "AWD_DAICASHCRAB"), 100000)
    Stats.SetInt(J(MPX() .. "AWD_BIGBRO"), 40)
    Stats.SetInt(J(MPX() .. "AWD_SHARPSHOOTER"), 40)
    Stats.SetInt(J(MPX() .. "AWD_RACECHAMP"), 40)
    Stats.SetInt(J(MPX() .. "AWD_BATSWORD"), 1000000)
    Stats.SetInt(J(MPX() .. "AWD_COINPURSE"), 950000)
    Stats.SetInt(J(MPX() .. "AWD_ASTROCHIMP"), 3000000)
    Stats.SetInt(J(MPX() .. "AWD_MASTERFUL"), 40000)
    Stats.SetInt(J(MPX() .. "SCGW_NUM_WINS_GANG_0"), 50)
    Stats.SetInt(J(MPX() .. "SCGW_NUM_WINS_GANG_1"), 50)
    Stats.SetInt(J(MPX() .. "SCGW_NUM_WINS_GANG_2"), 50)
    Stats.SetInt(J(MPX() .. "SCGW_NUM_WINS_GANG_3"), 50)
    Stats.SetInt(J(MPX() .. "CH_ARC_CAB_CLAW_TROPHY"), -1)
    Stats.SetInt(J(MPX() .. "CH_ARC_CAB_LOVE_TROPHY"), -1)
    Stats.SetInt(J(MPX() .. "IAP_MAX_MOON_DIST"), 2147483647)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_0"), 69644)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_1"), 50333)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_2"), 63512)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_3"), 46136)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_4"), 21638)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_5"), 2133)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_6"), 1215)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_7"), 2444)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_8"), 38023)
    Stats.SetInt(J(MPX() .. "SCGW_INITIALS_9"), 2233)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_0"), 0)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_1"), 64)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_2"), 8457)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_3"), 91275)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_4"), 53260)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_5"), 78663)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_6"), 25103)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_7"), 102401)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_8"), 12672)
    Stats.SetInt(J(MPX() .. "FOOTAGE_INITIALS_9"), 74380)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_0"), 284544)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_1"), 275758)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_2"), 100000)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_3"), 90000)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_4"), 80000)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_5"), 70000)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_6"), 60000)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_7"), 50000)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_8"), 40000)
    Stats.SetInt(J(MPX() .. "FOOTAGE_SCORE_9"), 30000)
    for i = 0, 9 do
        Stats.SetInt(J(MPX() .. "IAP_INITIALS_" .. i), 50)
        Stats.SetInt(J(MPX() .. "IAP_SCORE_" .. i), 50)
        Stats.SetInt(J(MPX() .. "IAP_SCORE_" .. i), 50)
        Stats.SetInt(J(MPX() .. "SCGW_SCORE_" .. i), 50)
        Stats.SetInt(J(MPX() .. "DG_DEFENDER_INITIALS_" .. i), 69644)
        Stats.SetInt(J(MPX() .. "DG_DEFENDER_SCORE_" .. i), 50)
        Stats.SetInt(J(MPX() .. "DG_MONKEY_INITIALS_" .. i), 69644)
        Stats.SetInt(J(MPX() .. "DG_MONKEY_SCORE_" .. i), 50)
        Stats.SetInt(J(MPX() .. "DG_PENETRATOR_INITIALS_" .. i), 69644)
        Stats.SetInt(J(MPX() .. "DG_PENETRATOR_SCORE_" .. i), 50)
        Stats.SetInt(J(MPX() .. "GGSM_INITIALS_" .. i), 69644)
        Stats.SetInt(J(MPX() .. "GGSM_SCORE_" .. i), 50)
        Stats.SetInt(J(MPX() .. "TWR_INITIALS_" .. i), 69644)
        Stats.SetInt(J(MPX() .. "TWR_SCORE_" .. i), 50)
    end
    Stats.SetBool(J(MPX() .. "AWD_SCOPEOUT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CREWEDUP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MOVINGON"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PROMOCAMP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_GUNMAN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SMASHNGRAB"), 1)
    Stats.SetBool(J(MPX() .. "AWD_INPLAINSI"), 1)
    Stats.SetBool(J(MPX() .. "AWD_UNDETECTED"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ALLROUND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ELITETHEIF"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PRO"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SUPPORTACT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHAFTED"), 1)
    Stats.SetBool(J(MPX() .. "AWD_COLLECTOR"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DEADEYE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PISTOLSATDAWN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TRAFFICAVOI"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CANTCATCHBRA"), 1)
    Stats.SetBool(J(MPX() .. "AWD_WIZHARD"), 1)
    Stats.SetBool(J(MPX() .. "AWD_APEESCAP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MONKEYKIND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_AQUAAPE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_KEEPFAITH"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TRUELOVE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_NEMESIS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FRIENDZONED"), 1)
    Stats.SetBool(J(MPX() .. "IAP_CHALLENGE_0"), 1)
    Stats.SetBool(J(MPX() .. "IAP_CHALLENGE_1"), 1)
    Stats.SetBool(J(MPX() .. "IAP_CHALLENGE_2"), 1)
    Stats.SetBool(J(MPX() .. "IAP_CHALLENGE_3"), 1)
    Stats.SetBool(J(MPX() .. "IAP_CHALLENGE_4"), 1)
    Stats.SetBool(J(MPX() .. "IAP_GOLD_TANK"), 1)
    Stats.SetBool(J(MPX() .. "SCGW_WON_NO_DEATHS"), 1)
    for i = 0, 4 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "CASINOHSTPSTAT_BOOL" .. i), true, j, true)
        end
    end
    for i = 0, 6 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "CASINOPSTAT_BOOL" .. i), true, j, true)
        end
    end
end)

DLCAUM:Button("LS Summer Special", function()
    Stats.SetBool(J(MPX() .. "AWD_KINGOFQUB3D"), 1)
    Stats.SetBool(J(MPX() .. "AWD_QUBISM"), 1)
    Stats.SetBool(J(MPX() .. "AWD_QUIBITS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_GODOFQUB3D"), 1)
    Stats.SetBool(J(MPX() .. "AWD_ELEVENELEVEN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_GOFOR11TH"), 1)
    Natives.InvokeBool(N.STAT_SET_MASKED_INT, J(MPX() .. "SU20PSTAT_INT"), 1, 35, 8, true)
    for i = 0, 1 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "SU20PSTAT_BOOL" .. i), true, j, true)
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "SU20TATTOOSTAT_BOOL" .. i), true, j, true)
        end
    end
end)

DLCAUM:Button("LS Tuners", function()
    Stats.SetInt(J(MPX() .. "AWD_CAR_CLUB_MEM"), 100)
    Stats.SetInt(J(MPX() .. "AWD_SPRINTRACER"), 50)
    Stats.SetInt(J(MPX() .. "AWD_STREETRACER"), 50)
    Stats.SetInt(J(MPX() .. "AWD_PURSUITRACER"), 50)
    Stats.SetInt(J(MPX() .. "AWD_TEST_CAR"), 240)
    Stats.SetInt(J(MPX() .. "AWD_AUTO_SHOP"), 50)
    Stats.SetInt(J(MPX() .. "AWD_GROUNDWORK"), 40)
    Stats.SetInt(J(MPX() .. "AWD_CAR_EXPORT"), 100)
    Stats.SetInt(J(MPX() .. "AWD_ROBBERY_CONTRACT"), 100)
    Stats.SetInt(J(MPX() .. "AWD_FACES_OF_DEATH"), 100)
    Stats.SetBool(J(MPX() .. "AWD_CAR_CLUB"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PRO_CAR_EXPORT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_UNION_DEPOSITORY"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MILITARY_CONVOY"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FLEECA_BANK"), 1)
    Stats.SetBool(J(MPX() .. "AWD_FREIGHT_TRAIN"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BOLINGBROKE_ASS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_IAA_RAID"), 1)
    Stats.SetBool(J(MPX() .. "AWD_METH_JOB"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BUNKER_RAID"), 1)
    Stats.SetBool(J(MPX() .. "AWD_STRAIGHT_TO_VIDEO"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MONKEY_C_MONKEY_DO"), 1)
    Stats.SetBool(J(MPX() .. "AWD_TRAINED_TO_KILL"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DIRECTOR"), 1)
    for i = 0, 8 do
        for j = 0, 63 do
            Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "TUNERPSTAT_BOOL" .. i), true, j, true)
        end
    end
end)

DLCAUM:Button("Contract", function()
    Stats.SetInt(J(MPX() .. "AWD_CONTRACTOR"), 50)
    Stats.SetInt(J(MPX() .. "AWD_COLD_CALLER"), 50)
    Stats.SetInt(J(MPX() .. "AWD_PRODUCER"), 60)
    Stats.SetInt(J(MPX() .. "FIXERTELEPHONEHITSCOMPL"), 10)
    Stats.SetInt(J(MPX() .. "PAYPHONE_BONUS_KILL_METHOD"), 10)
    Stats.SetInt(J(MPX() .. "PAYPHONE_BONUS_KILL_METHOD"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_GENERAL_BS"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_COMPLETED_BS"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_STORY_BS"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_STORY_STRAND"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_STORY_COOLDOWN"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_COUNT"), 510)
    Stats.SetInt(J(MPX() .. "FIXER_SC_VEH_RECOVERED"), 85)
    Stats.SetInt(J(MPX() .. "FIXER_SC_VAL_RECOVERED"), 85)
    Stats.SetInt(J(MPX() .. "FIXER_SC_GANG_TERMINATED"), 85)
    Stats.SetInt(J(MPX() .. "FIXER_SC_VIP_RESCUED"), 85)
    Stats.SetInt(J(MPX() .. "FIXER_SC_ASSETS_PROTECTED"), 85)
    Stats.SetInt(J(MPX() .. "FIXER_SC_EQ_DESTROYED"), 85)
    Stats.SetInt(J(MPX() .. "FIXER_EARNINGS"), 19734860)
    Stats.SetBool(J(MPX() .. "AWD_TEEING_OFF"), 1)
    Stats.SetBool(J(MPX() .. "AWD_PARTY_NIGHT"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BILLIONAIRE_GAMES"), 1)
    Stats.SetBool(J(MPX() .. "AWD_HOOD_PASS"), 1)
    Stats.SetBool(J(MPX() .. "AWD_STUDIO_TOUR"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DONT_MESS_DRE"), 1)
    Stats.SetBool(J(MPX() .. "AWD_BACKUP"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHORTFRANK_1"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHORTFRANK_2"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHORTFRANK_3"), 1)
    Stats.SetBool(J(MPX() .. "AWD_CONTR_KILLER"), 1)
    Stats.SetBool(J(MPX() .. "AWD_DOGS_BEST_FRIEND"), 1)
    Stats.SetBool(J(MPX() .. "AWD_MUSIC_STUDIO"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHORTLAMAR_1"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHORTLAMAR_2"), 1)
    Stats.SetBool(J(MPX() .. "AWD_SHORTLAMAR_3"), 1)
    Stats.SetBool(J(MPX() .. "BS_FRANKLIN_DIALOGUE_0"), 1)
    Stats.SetBool(J(MPX() .. "BS_FRANKLIN_DIALOGUE_1"), 1)
    Stats.SetBool(J(MPX() .. "BS_FRANKLIN_DIALOGUE_2"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_SETUP"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_STRAND"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_PARTY"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_PARTY_2"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_PARTY_F"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_BILL"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_BILL_2"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_BILL_F"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_HOOD"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_HOOD_2"), 1)
    Stats.SetBool(J(MPX() .. "BS_IMANI_D_APP_HOOD_F"), 1)
    for j = 0, 63 do
        Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "FIXERPSTAT_BOOL0"), true, j, true)
        Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "FIXERPSTAT_BOOL1"), true, j, true)
        Natives.InvokeBool(N.STAT_SET_BOOL_MASKED, J(MPX() .. "FIXERTATTOOSTAT_BOOL0"), true, j, true)
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
        Script.QueueJob(function()
            Script.ExecuteAsScript("shop_controller", function()
                if Natives.InvokeBool(N.NET_GAMESERVER_BASKET_IS_ACTIVE) then
                    Natives.InvokeBool(N.NET_GAMESERVER_BASKET_END)
                end
                local state, id = GTA.BeginService(NET_SHOP_TTYPE_SERVICE, J("CATEGORY_WEAPON"), J("WP_WT_PISTOLXM3_t0_v0"), J("NET_SHOP_ACTION_SPEND"), 0, 4)
                if state then
                    GTA.CheckoutStart(id)
                    Toast("WM29", "WM29 is now Unlocked Change Session To Apply Changes.")
                end
            end)
        end)
    end

    if ImGui.Button("Unlock The Shocker") then
        Script.QueueJob(function()
            Script.ExecuteAsScript("shop_controller", function()
                if Natives.InvokeBool(N.NET_GAMESERVER_BASKET_IS_ACTIVE) then
                    Natives.InvokeBool(N.NET_GAMESERVER_BASKET_END)
                end
                local state, id = GTA.BeginService(NET_SHOP_TTYPE_SERVICE, J("CATEGORY_WEAPON"), J("WP_WT_STUNROD_t1_v1"), J("NET_SHOP_ACTION_SPEND"), 0, 4)
                if state then
                    GTA.CheckoutStart(id)
                    Toast("The Shocker", "The Shocker is now Unlocked Change Session To Apply Changes.")
                end
            end)
        end)
    end

    if ImGui.Button("Unlock The Snowball Launcher") then
        Script.QueueJob(function()
            Script.ExecuteAsScript("shop_controller", function()
                if Natives.InvokeBool(N.NET_GAMESERVER_BASKET_IS_ACTIVE) then
                    Natives.InvokeBool(N.NET_GAMESERVER_BASKET_END)
                end
                local state, id = GTA.BeginService(NET_SHOP_TTYPE_SERVICE, J("CATEGORY_WEAPON"), J("WP_WT_SNOWLAUNCHER_t0_v0"), J("NET_SHOP_ACTION_SPEND"), 0, 4)
                if state then
                    GTA.CheckoutStart(id)
                    Toast(
                        "Snowball Launcher",
                        "Snowball Launcher is now Unlocked Change Session To Apply Changes."
                    )
                end
            end)
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
AcMenu:Box("All Achievements")
AcMenu:Custom(function()
    if ImGui.Button("Unlock All Achievements") then
        Script.QueueJob(function()
            for i = 0, 77 do
                Script.Yield(200)
                ScriptGlobal.SetInt(AG, i)
                if i == 77 then
                    Toast("Achievements", "Unlocked 77 Achievements")
                end
            end
        end)
    end
end)
end)

Section("Achievements One By One", function()
AcMMenu = AcMenu

AcMMenu:Box("One By One (1-26)")
AcMMenu:Button("Welcome to Los Santos", function()
    ScriptGlobal.SetInt(AG, 1)
end)
AcMMenu:Button("A Friendship Resurrected", function()
    ScriptGlobal.SetInt(AG, 2)
end)
AcMMenu:Button("A Fair Day's Pay", function()
    ScriptGlobal.SetInt(AG, 3)
end)
AcMMenu:Button("The Moment of Truth", function()
    ScriptGlobal.SetInt(AG, 4)
end)
AcMMenu:Button("To Live or Die in Los Santos", function()
    ScriptGlobal.SetInt(AG, 5)
end)
AcMMenu:Button("Diamond Hard", function()
    ScriptGlobal.SetInt(AG, 6)
end)
AcMMenu:Button("Subversive", function()
    ScriptGlobal.SetInt(AG, 7)
end)
AcMMenu:Button("Blitzed", function()
    ScriptGlobal.SetInt(AG, 8)
end)
AcMMenu:Button("Small Town, Big Job", function()
    ScriptGlobal.SetInt(AG, 9)
end)
AcMMenu:Button("The Government Gimps", function()
    ScriptGlobal.SetInt(AG, 10)
end)
AcMMenu:Button("The Big One!", function()
    ScriptGlobal.SetInt(AG, 11)
end)
AcMMenu:Button("Solid Gold, Baby!", function()
    ScriptGlobal.SetInt(AG, 12)
end)
AcMMenu:Button("Career Criminal", function()
    ScriptGlobal.SetInt(AG, 13)
end)
AcMMenu:Button("San Andreas Sightseer", function()
    ScriptGlobal.SetInt(AG, 14)
end)
AcMMenu:Button("All's Fare in Love and War", function()
    ScriptGlobal.SetInt(AG, 15)
end)
AcMMenu:Button("TP Industries Arms Race", function()
    ScriptGlobal.SetInt(AG, 16)
end)
AcMMenu:Button("Multi-Disciplined", function()
    ScriptGlobal.SetInt(AG, 17)
end)
AcMMenu:Button("From Beyond the Stars", function()
    ScriptGlobal.SetInt(AG, 18)
end)
AcMMenu:Button("A Mystery, Solved", function()
    ScriptGlobal.SetInt(AG, 19)
end)
AcMMenu:Button("Waste Management", function()
    ScriptGlobal.SetInt(AG, 20)
end)
AcMMenu:Button("Red Mist", function()
    ScriptGlobal.SetInt(AG, 21)
end)
AcMMenu:Button("Show Off", function()
    ScriptGlobal.SetInt(AG, 22)
end)
AcMMenu:Button("Kifflom!", function()
    ScriptGlobal.SetInt(AG, 23)
end)
AcMMenu:Button("Three Man Army", function()
    ScriptGlobal.SetInt(AG, 24)
end)
AcMMenu:Button("Out of Your Depth", function()
    ScriptGlobal.SetInt(AG, 25)
end)
AcMMenu:Button("Altruist Acolyte", function()
    ScriptGlobal.SetInt(AG, 26)
end)
AcMMenu:Box("One By One (27-52)")
AcMMenu:Button("A Lot of Cheddar", function()
    ScriptGlobal.SetInt(AG, 27)
end)
AcMMenu:Button("Trading Pure Alpha", function()
    ScriptGlobal.SetInt(AG, 28)
end)
AcMMenu:Button("Pimp My Sidearm", function()
    ScriptGlobal.SetInt(AG, 29)
end)
AcMMenu:Button("Wanted: Alive Or Alive", function()
    ScriptGlobal.SetInt(AG, 30)
end)
AcMMenu:Button("Los Santos Customs", function()
    ScriptGlobal.SetInt(AG, 31)
end)
AcMMenu:Button("Close Shave", function()
    ScriptGlobal.SetInt(AG, 32)
end)
AcMMenu:Button("Off the Plane", function()
    ScriptGlobal.SetInt(AG, 33)
end)
AcMMenu:Button("Three-Bit Gangster", function()
    ScriptGlobal.SetInt(AG, 34)
end)
AcMMenu:Button("Making Moves", function()
    ScriptGlobal.SetInt(AG, 35)
end)
AcMMenu:Button("Above the Law", function()
    ScriptGlobal.SetInt(AG, 36)
end)
AcMMenu:Button("Numero Uno", function()
    ScriptGlobal.SetInt(AG, 37)
end)
AcMMenu:Button("The Midnight Club", function()
    ScriptGlobal.SetInt(AG, 38)
end)
AcMMenu:Button("Unnatural Selection", function()
    ScriptGlobal.SetInt(AG, 39)
end)
AcMMenu:Button("Backseat Driver", function()
    ScriptGlobal.SetInt(AG, 40)
end)
AcMMenu:Button("Run Like The Wind", function()
    ScriptGlobal.SetInt(AG, 41)
end)
AcMMenu:Button("Clean Sweep", function()
    ScriptGlobal.SetInt(AG, 42)
end)
AcMMenu:Button("Decorated", function()
    ScriptGlobal.SetInt(AG, 43)
end)
AcMMenu:Button("Stick Up Kid", function()
    ScriptGlobal.SetInt(AG, 44)
end)
AcMMenu:Button("Enjoy Your Stay", function()
    ScriptGlobal.SetInt(AG, 45)
end)
AcMMenu:Button("Crew Cut", function()
    ScriptGlobal.SetInt(AG, 46)
end)
AcMMenu:Button("Full Refund", function()
    ScriptGlobal.SetInt(AG, 47)
end)
AcMMenu:Button("Dialling Digits", function()
    ScriptGlobal.SetInt(AG, 48)
end)
AcMMenu:Button("American Dream", function()
    ScriptGlobal.SetInt(AG, 49)
end)
AcMMenu:Button("A New Perspective", function()
    ScriptGlobal.SetInt(AG, 50)
end)
AcMMenu:Button("Be Prepared", function()
    ScriptGlobal.SetInt(AG, 51)
end)
AcMMenu:Button("In the Name of Science", function()
    ScriptGlobal.SetInt(AG, 52)
end)
AcMMenu:Box("One By One (53-77)")
AcMMenu:Button("Dead Presidents", function()
    ScriptGlobal.SetInt(AG, 53)
end)
AcMMenu:Button("Parole Day", function()
    ScriptGlobal.SetInt(AG, 54)
end)
AcMMenu:Button("Shot Caller", function()
    ScriptGlobal.SetInt(AG, 55)
end)
AcMMenu:Button("Four Way", function()
    ScriptGlobal.SetInt(AG, 56)
end)
AcMMenu:Button("Live a Little", function()
    ScriptGlobal.SetInt(AG, 57)
end)
AcMMenu:Button("Can't Touch This", function()
    ScriptGlobal.SetInt(AG, 58)
end)
AcMMenu:Button("Mastermind", function()
    ScriptGlobal.SetInt(AG, 59)
end)
AcMMenu:Button("Vinewood Visionary", function()
    ScriptGlobal.SetInt(AG, 60)
end)
AcMMenu:Button("Majestic", function()
    ScriptGlobal.SetInt(AG, 61)
end)
AcMMenu:Button("Humans of Los Santos", function()
    ScriptGlobal.SetInt(AG, 62)
end)
AcMMenu:Button("First Time Director", function()
    ScriptGlobal.SetInt(AG, 63)
end)
AcMMenu:Button("Animal Lover", function()
    ScriptGlobal.SetInt(AG, 64)
end)
AcMMenu:Button("Ensemble Piece", function()
    ScriptGlobal.SetInt(AG, 65)
end)
AcMMenu:Button("Cult Movie", function()
    ScriptGlobal.SetInt(AG, 66)
end)
AcMMenu:Button("Location Scout", function()
    ScriptGlobal.SetInt(AG, 67)
end)
AcMMenu:Button("Method Actor", function()
    ScriptGlobal.SetInt(AG, 68)
end)
AcMMenu:Button("Cryptozoologist", function()
    ScriptGlobal.SetInt(AG, 69)
end)
AcMMenu:Button("Getting Started", function()
    ScriptGlobal.SetInt(AG, 70)
end)
AcMMenu:Button("The Data Breaches", function()
    ScriptGlobal.SetInt(AG, 71)
end)
AcMMenu:Button("The Bogdan Problem", function()
    ScriptGlobal.SetInt(AG, 72)
end)
AcMMenu:Button("The Doomsday Scenario", function()
    ScriptGlobal.SetInt(AG, 73)
end)
AcMMenu:Button("A World Worth Saving", function()
    ScriptGlobal.SetInt(AG, 74)
end)
AcMMenu:Button("Orbital Obliteration", function()
    ScriptGlobal.SetInt(AG, 75)
end)
AcMMenu:Button("Elitist", function()
    ScriptGlobal.SetInt(AG, 76)
end)
AcMMenu:Button("Masterminds", function()
    ScriptGlobal.SetInt(AG, 77)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local current_objectives_global = 2359296 --("am_challenges")
local weekly_objectives_global = 2732111 --("am_challenges")
local objectives_state_global = 1574746 --("am_challenges")

FAUTMain:Box("Challenges")
FAUTMain:Custom(function()
    if ImGui.Button("Complete All Daily & Weekly Challenges") then
        Script.QueueJob(function()
            for i = 0, 2 do --Unlock all daily rewards.
                local objective =
                    ScriptGlobal.GetInt(current_objectives_global + (1 + (0 * 5574)) + 681 + 4248 + (1 + (i * 3)))
                ScriptGlobal.SetInt(objectives_state_global + 1 + (1 + (i * 1)), objective)
            end
            ScriptGlobal.SetInt(objectives_state_global, 1)
            ScriptGlobal.SetInt(
                weekly_objectives_global + (1 + (0 * 6)) + 1,
                ScriptGlobal.GetInt(weekly_objectives_global + (1 + (0 * 6)) + 2)
            ) --Unlock Weekly Objective
            Toast("Challenges", "All Daily And Weekly Challenges Are Now Completed.")
        end)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("LSCM Unlocker", function()
LSCMUnlockeRecoveryMenu = RecoveryMenu:Tab("LSCM Unlocker")

LSCMUnlockeRecoveryMenu:Box("Unlocks")
LSCMUnlockeRecoveryMenu:Button("Unlock All Rep Lvl 1000", function()
    for i = FMg + 31047, FMg + 31076 do
        ScriptGlobal.SetFloat(i, 100000.0)
    end
    Toast(
        "LSCM",
        "LVL 1000 Activated Just Sit In The Test Drive Vehicle And Enter LSCM Track To See The Changes."
    )
end)

LSCMUnlockeRecoveryMenu:Button("LSCM Prize Ride Unlock", function()
    Stats.SetBool(J(MPX() .. "CARMEET_PV_CHLLGE_CMPLT"), 1)
    Stats.SetBool(J(MPX() .. "CARMEET_PV_CLMED"), 0)
    Toast("LSCM", "Your Prize Car Is Now Unlocked.")
end)

LSCMUnlockeRecoveryMenu:Button("Unlock Trade Prices for Headlights", function()
    stats_set_packed_bools(24980, 24991, true)
    Toast("LSCM", "Trade Prices For Headlights Are Now Unlocked.")
end)
end)

Section("LSCM Tutorial", function()
LSCMNote = LSCMUnlockeRecoveryMenu
LSCMNote:Box("Tutorial")

LSCMNote:Text("Buy a membership, activate, sit in")
LSCMNote:Text("a test car and go to the track")
LSCMNote:Text("If your level is not 1, then activate")
LSCMNote:Text("and buy something in the LSCM store")
LSCMNote:Text("If you've used LS Tuner awards unlock")
LSCMNote:Text("before, all unlocks will be temporary only")
LSCMNote:Text("--- Manual Online Override ---")
LSCMNote:Text("To manually set/bypass the online state,")
LSCMNote:Text("toggle 'Bypass Online Check' in Settings.")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Money Methods", function()
L7NEG7 = Menu:Tab("Money Methods"):RequireOnline()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Businesses", function()
BusinessesMenu = L7NEG7:Tab("Businesses")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Air Cargo", function()
AirCargoMenu = BusinessesMenu:Tab("Air Cargo")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoMenu:Box("Crate Value")
local hanvalue = AirCargoMenu:InputInt("Crate Value")

AirCargoMenu:Button("Set Value", function()
    local HangarCrateVlaue = hanvalue:GetIntValue()
    if HangarCrateVlaue < 0 or HangarCrateVlaue > 6000000 then
        Toast("Crate Value Setter", "Value must be 0-6000000.")
        return
    end
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_MIXED", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_ANIMAL_MATERIALS", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_ART_AND_ANTIQUES", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_CHEMICALS", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_COUNTERFEIT_GOODS", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_JEWELRY_AND_GEMSTONES", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_MEDICAL_SUPPLIES", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_NARCOTICS", HangarCrateVlaue)
    SetTunableInt("SMUG_SELL_PRICE_PER_CRATE_TOBACCO_AND_ALCOHOL", HangarCrateVlaue)
    Toast("Crate Value Setter", "Your Crate Value was set to " .. HangarCrateVlaue .. ".")
end)


AirCargoMenu:Box("Options")
RCRT = AirCargoMenu:Toggle("Remove Ron's Cut")
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    local want = RCRT:IsToggled() and 0 or 0.025
    if want ~= _ronPrev then
        SetTunableFloat("SMUG_SELL_RONS_CUT", want)
        _ronPrev = want
    end
    Script.Yield(500)
end)


PRPGD = AirCargoMenu:Toggle("Disable Player RP Gain")
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    local want = PRPGD:IsToggled() and 0 or 1
    if want ~= _prpgdPrev then
        SetTunableFloat("XP_MULTIPLIER", want)
        _prpgdPrev = want
    end
    Script.Yield(500)
end)


AirCargoMenu:Button("Open Hangar Screen", function()
    Natives.InvokeVoid(N.REQUEST_SCRIPT, "apparcadebusinesshub")
    Natives.InvokeInt(N.START_NEW_SCRIPT, "apparcadebusinesshub", 8344)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Air Cargo Data Editor", function()
AirCargoEditorMenu = AirCargoMenu:Tab("Air Cargo Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoEditorMenu:Box("Stats")
AirCargoEditorMenu:Button("Reset Crate Sell Stats-0/0 Sales", function()
    Stats.SetInt(J(MPX() .. "LFETIME_HANGAR_BUY_COMPLET"), 0)
    Stats.SetInt(J(MPX() .. "LFETIME_HANGAR_BUY_UNDERTAK"), 0)
    Stats.SetInt(J(MPX() .. "LFETIME_HANGAR_SEL_COMPLET"), 0)
    Stats.SetInt(J(MPX() .. "LFETIME_HANGAR_SEL_UNDERTAK"), 0)
    Stats.SetInt(J(MPX() .. "LFETIME_HANGAR_EARNINGS"), 0)
    Stats.SetInt(J(MPX() .. "HANGAR_CONTRABAND_TOTAL"), 0)
    Stats.SetInt(J(MPX() .. "LFETIME_HANGAR_EARN_BONUS"), 0)
    Stats.SetInt(J(MPX() .. "RIVAL_HANGAR_CRATES_STOLEN"), 0)
    ScriptGlobal.SetInt(CSg1, 11)
    ScriptGlobal.SetInt(CSg2, 1)
    ScriptGlobal.SetInt(CSg2, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Use At Your Own Risk", function()
UseAtYourOwnRiskMenu = L7NEG7:Tab("Use At Your Own Risk")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Ceo Manager", function()
CeoManagerMenu = UseAtYourOwnRiskMenu:Tab("Ceo Manager")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SMC1 = 574 + 1 --("gb_contraband_sell")
SMC2 = 574 + 7 --("gb_contraband_sell")
SMC3 = 574 + 584 --("gb_contraband_sell")
SMC4 = 574 + 55 --("gb_contraband_sell")
SMC5 = 574 + 595 --("gb_contraband_sell")
SMC6 = 589 --("Popup_Confirm_Success") in ("appsecuroserv")
SMC7 = 770 --("MP_WH_SELL") or ("WH_MFREASON_12") in ("appsecuroserv")
SMC8 = 771 --("MP_WH_SELL") or ("WH_MFREASON_12") in ("appsecuroserv")
SMC9 = 632 + 5 --("SPEECH_PARAMS_SHOUTED_CRITICAL") in ("gb_contraband_buy")
SMC10 = 632 + 1 --func_91() in ("gb_contraband_buy")
SMC11 = 632 + 191 --("gb_contraband_buy")
SMC12 = 632 + 192 --("gb_contraband_buy")

local cs = "appsecuroserv"

local ci = "gb_contraband_sell"

local cb = "gb_contraband_buy"

local am = "am_mp_warehouse"

local am2 = "am_mp_peds"

cratevalue = 0
CeoManagerMenu:Box("Ceo Manager")
CeoManagerMenu:Custom(function()
    cratevalue, used = ImGui.DragInt("Crate Value", cratevalue, 10000.0, 0, 6000000)
    if used then
        SetTunableInt("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1", cratevalue)
    end
end)

checkbox = CeoManagerMenu:Toggle("Start Ceo Manager")

PRPGD2 = CeoManagerMenu:Toggle("Disable Player RP Gain")
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    local want = PRPGD2:IsToggled() and 0 or 1
    if want ~= _prpgd2Prev then
        SetTunableFloat("XP_MULTIPLIER", want)
        _prpgd2Prev = want
    end
    Script.Yield(500)
end)

CeoManagerMenu:Button("Open Warehouse Screen", function()
    Natives.InvokeVoid(N.REQUEST_SCRIPT, "apparcadebusinesshub")
    Natives.InvokeInt(N.START_NEW_SCRIPT, "apparcadebusinesshub", 8344)
end)

Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        return
    end
    -- removed useless call
    SetTunableInt("EXEC_BUY_COOLDOWN", 0)
    SetTunableInt("EXEC_SELL_COOLDOWN", 0)

    if checkbox:IsToggled() == true then
        if ScriptLocal.GetInt(J(ci), 2) == 1 then
            ScriptLocal.SetInt(J(ci), SMC5, 1)
            ScriptLocal.SetInt(J(ci), SMC4, 0)
            ScriptLocal.SetInt(J(ci), SMC3, 0)
            ScriptLocal.SetInt(J(ci), SMC2, 7)
            Script.Yield(500)
            ScriptLocal.SetInt(J(ci), SMC1, 99999)
        end
        if ScriptLocal.GetInt(J(cs), 2) == 1 then
            Script.Yield(500)
            ScriptLocal.SetInt(J(cs), SMC8, 1)
            Script.Yield(200)
            ScriptLocal.SetInt(J(cs), SMC7, 1)
            Script.Yield(200)
            ScriptLocal.SetInt(J(cs), SMC6, 3012)
            Script.Yield(1000)
        end
        if ScriptLocal.GetInt(J(cb), 2) == 1 then
            ScriptLocal.SetInt(J(cb), SMC9, 1)
            ScriptLocal.SetInt(J(cb), SMC10, 111)
            ScriptLocal.SetInt(J(cb), SMC11, 6)
            ScriptLocal.SetInt(J(cb), SMC12, 4)
            Toast("Your Warehouse is now full! 111/111 Crates")
        end
        if ScriptLocal.GetInt(J(ci), 2) ~= 1 then
            Script.Yield(500)
            if ScriptLocal.GetInt(J(am), 2) == 1 then
                Natives.InvokeVoid(N.REQUEST_SCRIPT, "appsecuroserv")
                Natives.InvokeInt(N.START_NEW_SCRIPT, "appsecuroserv", 8344)
                Natives.InvokeVoid(N.SET_SCRIPT_AS_NO_LONGER_NEEDED, "appsecuroserv")
            end
        end
    end
    Script.Yield(500)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("NightClub Safe Loop", function()
NightClubSafeMenu = UseAtYourOwnRiskMenu:Tab("NightClub Safe Loop")

SafeAmount = 300000
SafeCapacity = 23769 --NIGHTCLUBMAXSAFEVALUE
IncomeStart = 23746 --NIGHTCLUBINCOMEUPTOPOP5
IncomeEnd = 23765 --NIGHTCLUBINCOMEUPTOPOP100

NightClubSafeMenu:Box("Safe Loop")
NCRSCB = NightClubSafeMenu:Toggle("Enable Nightclub $300k/5s (Safe Remote AFK)")
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    if NCRSCB:IsToggled() == true then
        SafeValue = 1845298 + GTA.GetLocalPlayerId() + 260 + 364 + 5 --("am_mp_nightclub") or we can just use TUNEABLE: NIGHTCLUBMAXSAFEVALUE
        for i = IncomeStart, IncomeEnd do
            ScriptGlobal.SetInt(FMg + i, SafeAmount)
        end
        ScriptGlobal.SetInt(FMg + SafeCapacity, SafeAmount)
        Stats.SetInt(J(MPX() .. "CLUB_PAY_TIME_LEFT"), -1)
        Script.Yield(2500)
        if IsScriptRunning("am_mp_nightclub") then
            ScriptLocal.SetInt(J("am_mp_nightclub"), NLCl, 1)
        end
        ScriptGlobal.SetInt(4516981, 0)
        ScriptGlobal.SetInt(4516982, 0)
        ScriptGlobal.SetInt(4516983, 0)
        Script.Yield(2500)
    else
        Script.Yield(500)
    end
end)


NightClubSafeMenu:Button("Open Nightclub Screen", function()
    Natives.InvokeInt(N.START_NEW_SCRIPT, "appBusinessHub", 1424)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Gun Van", function()
local GVMENU = Menu:Tab("Gun Van"):RequireOnline()

local gunvan_locations = {
    V3.New(-29.532, 6435.136, 31.162),
    V3.New(1705.214, 4819.167, 41.75),
    V3.New(1795.522, 3899.753, 33.869),
    V3.New(1335.536, 2758.746, 51.099),
    V3.New(795.583, 1210.78, 338.962),
    V3.New(-3192.67, 1077.205, 20.594),
    V3.New(-789.719, 5400.921, 33.915),
    V3.New(-24.384, 3048.167, 40.703),
    V3.New(2666.786, 1469.324, 24.237),
    V3.New(-1454.966, 2667.503, 3.2),
    V3.New(2340.418, 3054.188, 47.888),
    V3.New(1509.183, -2146.795, 76.853),
    V3.New(1137.404, -1358.654, 34.322),
    V3.New(-57.208, -2658.793, 5.737),
    V3.New(1905.017, 565.222, 175.558),
    V3.New(974.484, -1718.798, 30.296),
    V3.New(779.077, -3266.297, 5.719),
    V3.New(-587.728, -1637.208, 19.611),
    V3.New(733.99, -736.803, 26.165),
    V3.New(-1694.632, -454.082, 40.712),
    V3.New(-1330.726, -1163.948, 4.313),
    V3.New(-496.618, 40.231, 52.316),
    V3.New(275.527, 66.509, 94.108),
    V3.New(260.928, -763.35, 30.559),
    V3.New(-478.025, -741.45, 30.299),
    V3.New(894.94, 3603.911, 32.56),
    V3.New(-2166.511, 4289.503, 48.733),
    V3.New(1465.633, 6553.67, 13.771),
    V3.New(1101.032, -335.172, 66.944),
    V3.New(149.683, -1655.674, 29.028),
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

function render_weapon_editor()
    ImGui.SetNextWindowSize(700, 420)
    ImGui.OpenPopup("Weapon Editor")

    if
        ImGui.BeginPopupModal(
            "Weapon Editor",
            weapon_editor_popup,
            ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoCollapse | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.Modal
        )
    then
        selected_slot =
            ImGui.Combo("Select Slot", selected_slot, { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }, 10)

        filter_text = ImGui.InputText("Weapon Name", filter_text)
        if ImGui.IsItemActive() then
            is_typing = true
        else
            is_typing = false
        end

        if ImGui.ListBoxHeader("##weapons", 450.0, 200.0) then
            for index, item in ipairs(weapons_data) do
                local display_name = WeaponDisplayName(item)
                if string.find(display_name:lower(), filter_text:lower()) then
                    if ImGui.Selectable(display_name) then
                        filter_text = display_name
                        weapon_name = item
                    end
                end
            end
            ImGui.ListBoxFooter()
        end

        if ImGui.Button("Set Weapon") then
            local is_weapon_valid = WeaponDisplayName(weapon_name) ~= ""

            if is_weapon_valid then
                SetTunableInt("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, J(weapon_name))
            else
                Toast("Gun Van", "Invalid weapon.")
            end
        end

        ImGui.SameLine()

        if ImGui.Button("Remove Weapon") then
            SetTunableInt("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, 0)
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

Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    gun_van_loc = ScriptGlobal.GetInt(2652581 + 2706)

    if is_typing then
        Natives.InvokeVoid(N.DISABLE_ALL_CONTROL_ACTIONS, 0)
    end

    if weapon_skins then
        SetTunableBool(1490225691, false)
    end

    if livery_lock then
        if IsScriptRunning("gunclub_shop") then
            local value = ScriptLocal.GetInt(J("gunclub_shop"), 206 + 747)
            if value ~= nil then
                value = value | (1 << 8)
                ScriptLocal.SetInt(J("gunclub_shop"), 206 + 747, value)
            end
        end
    end

    if gta_plus_blip then
        local gun_van_sprite = Natives.InvokeInt(N.GET_FIRST_BLIP_INFO_ID, 844)

        SetTunableFloat(15999531, 10000.0)
        if Natives.InvokeBool(N.DOES_BLIP_EXIST, gun_van_sprite) then
            Natives.InvokeVoid(N.SET_BLIP_AS_SHORT_RANGE, gun_van_sprite, false)
        end
    end
    Script.Yield(500)
end)

GVMENU:Box("Location")
GVMENU:Custom(function()
    if weapon_editor_popup then
        render_weapon_editor()
    end

    ImGui.Text("Current Location: " .. (gun_van_loc ~= -1 and gun_van_loc + 1 or "N/A"))

    selected_loc = ImGui.Combo("##selected_loc", selected_loc, van_locations, 30)


    if ImGui.Button("Set New Gun Van Location") then
        ScriptGlobal.SetInt(2652581 + 2706, selected_loc)
    end


    if ImGui.Button("Teleport") then
        Script.QueueJob(function()
            local coords = gunvan_locations[selected_loc + 1]
            Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, Natives.InvokeInt(N.PLAYER_PED_ID), coords.x, coords.y, coords.z)
        end)
    end
end)
GVMENU:Box("Options")
GVMENU:Custom(function()
    weapon_skins, on_tick = ImGui.Checkbox("Weapon Skins", weapon_skins)
    help_marker("Enables the special liveries for Knife and Baseball Bat.")

    if on_tick then
        if not weapon_skins then
            SetTunableBool(1490225691, true)
        end
    end

    livery_lock, on_tick = ImGui.Checkbox("Remove Livery Lock", livery_lock)
    help_marker(
        "Removes the hard-coded lock on special weapon liveries, such as Season's Greetings, Employee of the Month etc."
    )

    if on_tick then
        if not livery_lock then
            local value = ScriptLocal.GetInt(J("gunclub_shop"), 206 + 747)
            if value ~= nil then
                value = value & ~(1 << 8)
                ScriptLocal.SetInt(J("gunclub_shop"), 206 + 747, value)
            end
        end
    end

    gta_plus_blip, on_tick = ImGui.Checkbox("Blip Always Visible", gta_plus_blip)
    help_marker("The Gun Van will always be blipped on the map, just like in GTA+.")

    if on_tick then
        if not gta_plus_blip then
            SetTunableFloat(15999531, 500.0)
        end
    end

    discount, on_tick = ImGui.Checkbox("Jewish Trade Skills (-10%)", discount)
    help_marker("Allows 10% off any weapon in the Gun Van")

    _discountBackup = _discountBackup or { armour = {}, throwable = {}, weapon = {} }
    if on_tick then
        if discount then
            for i = 0, 4 do
                _discountBackup.armour[i] = GetTunableFloat("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i)
                SetTunableFloat("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i, 0.1)
            end
            for i = 0, 2 do
                _discountBackup.throwable[i] = GetTunableFloat("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i)
                SetTunableFloat("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i, 0.1)
            end
            for i = 0, 9 do
                _discountBackup.weapon[i] = GetTunableFloat("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i)
                SetTunableFloat("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i, 0.1)
            end
        else
            for i = 0, 4 do
                SetTunableFloat("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i, _discountBackup.armour[i] or 0.0)
            end
            for i = 0, 2 do
                SetTunableFloat("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i, _discountBackup.throwable[i] or 0.0)
            end
            for i = 0, 9 do
                SetTunableFloat("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i, _discountBackup.weapon[i] or 0.0)
            end
        end
    end
end)
GVMENU:Box("Stock")
GVMENU:Custom(function()
    if ImGui.TreeNode("Weapons") then
        for i = 0, 9 do
            local weapon_hash = GetTunableInt("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. i)

            if weapon_hash ~= 0 then
                local weapon_name = WeaponDisplayName(weapon_hash)
                local weapon_discount =
                    math.floor(GetTunableFloat("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i) * 100.0)

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
            local throwable_hash = GetTunableInt("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. i)

            if throwable_hash ~= 0 then
                local throwable_name = WeaponDisplayName(throwable_hash)
                local throwable_discount =
                    math.floor(GetTunableFloat("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i) * 100.0)

                ImGui.Text(i + 1 .. " - " .. throwable_name .. " (" .. throwable_discount .. "%)")
            end
        end

        ImGui.Separator()
        ImGui.TreePop()
    end

    if ImGui.TreeNode("Body Armor") then
        local armour_discounts = {}

        for i = 0, 4 do
            armour_discounts[i + 1] = math.floor(GetTunableFloat("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i) * 100.0)
        end

        ImGui.Text("Super Light Armor (" .. armour_discounts[1] .. "%)")
        ImGui.Text("Light Armor (" .. armour_discounts[2] .. "%)")
        ImGui.Text("Standard Armor (" .. armour_discounts[3] .. "%)")
        ImGui.Text("Heavy Armor (" .. armour_discounts[4] .. "%)")
        ImGui.Text("Super Heavy Armor (" .. armour_discounts[5] .. "%)")

        ImGui.TreePop()
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Reports", function()
ReportsMenu = Self:Tab("Reports")
ReportsMenu:Box("Reports")
ReportsMenu:Custom(function()
    ImGui.Text("Griefing: " .. GetStatInt("MPPLY_GRIEFING"))
    ImGui.Text("Exploiting: " .. GetStatInt("MPPLY_EXPLOITS"))
    ImGui.Text("Abusing Bugs: " .. GetStatInt("MPPLY_GAME_EXPLOITS"))
    ImGui.Text("Annoying People In Text: " .. GetStatInt("MPPLY_TC_ANNOYINGME"))
    ImGui.Text("Hate Speech In Voice: " .. GetStatInt("MPPLY_VC_HATE"))
    ImGui.Text("Offensive Language: " .. GetStatInt("MPPLY_OFFENSIVE_LANGUAGE"))
    ImGui.Text("Offensive Tagplate: " .. GetStatInt("MPPLY_OFFENSIVE_TAGPLATE"))
    ImGui.Text("Offensive Content: " .. GetStatInt("MPPLY_OFFENSIVE_UGC"))
    ImGui.Text("Bad Crew Name: " .. GetStatInt("MPPLY_BAD_CREW_NAME"))
    ImGui.Text("Bad Crew Motto: " .. GetStatInt("MPPLY_BAD_CREW_MOTTO"))
    ImGui.Text("Bad Crew Status: " .. GetStatInt("MPPLY_BAD_CREW_STATUS"))
    ImGui.Text("Bad Crew Emblem: " .. GetStatInt("MPPLY_BAD_CREW_EMBLEM"))
end)
ReportsMenu:Box("Commendations")
ReportsMenu:Custom(function()
    ImGui.Text("Friendly: " .. GetStatInt("MPPLY_FRIENDLY"))
    ImGui.Text("Helpful: " .. GetStatInt("MPPLY_HELPFUL"))
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("WareHouse Data Editor", function()
WareHouseDataEditorMenu = L7NEG7:Tab("WareHouse Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WareHouseDataEditorMenu:Box("Stats")
WareHouseDataEditorMenu:Button("Auto-Reset stats-0/0 Sales", function()
    Stats.SetInt(J(MPX() .. "LIFETIME_BUY_COMPLETE"), 0)
    Stats.SetInt(J(MPX() .. "LIFETIME_BUY_UNDERTAKEN"), 0)
    Stats.SetInt(J(MPX() .. "LIFETIME_SELL_COMPLETE"), 0)
    Stats.SetInt(J(MPX() .. "LIFETIME_SELL_UNDERTAKEN"), 0)
    Stats.SetInt(J(MPX() .. "LIFETIME_CONTRA_EARNINGS"), 0)
    ScriptGlobal.SetInt(CSg1, 11)
    ScriptGlobal.SetInt(CSg2, 1)
    Script.Yield(300)
    ScriptGlobal.SetInt(CSg2, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Tutorial", function()
L7NEG7N = L7NEG7:Tab("Tutorial")

L7NEG7N:Box("Ceo Crates Method")
L7NEG7N:Text("First Enter Your Warehouse")
L7NEG7N:Text("Then Stand In Front Of Your Warehouse Computer And Then Activate The Enable Ceo Manager")
L7NEG7N:Text("https://l7neg.is-a.dev/discord")

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
-- Box order (two columns, filled left to right): Preps | Solo Launch, Misc | 12mil Bonus, then the rest.
ApartmentDataEditorMenu:Box("Preps"):Box("Solo Launch"):Box("Misc"):Box("12mil Bonus")

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
    Stats.SetInt(J(mpx .. "BITSET_HEIST_VS_MISSIONS"), -17809409)
    -- Only filled in when the game has not set them itself yet.
    if GetStatInt(mpx .. "HEIST_LEADER_APART_ID") == 0 then
        Stats.SetInt(J(mpx .. "HEIST_LEADER_APART_ID"), 67108864)
    end
    if GetStatInt(mpx .. "HEIST_SESSION_ID_MACADDR") == 0 then
        Stats.SetInt(J(mpx .. "HEIST_SESSION_ID_MACADDR"), 183381814)
    end
    Stats.SetInt(J(mpx .. "HEIST_MISSION_DEPTH_LV_0"), -1)
    for i, value in ipairs(heist.depth) do
        Stats.SetInt(J(mpx .. "HEIST_MISSION_DEPTH_LV_" .. (i + 1)), value)
    end
    Stats.SetInt(J(mpx .. "HEIST_MISSION_RCONT_ID_0"), heist.rcont)
    Stats.SetInt(J(mpx .. "HEIST_TOTAL_REWARD_COSMETIC"), heist.cosmetic)
    Stats.SetInt(J(mpx .. "HEIST_PLANNING_STAGE"), -1)
    Toast("Apartment Heist", heist.name .. ": preps should've been completed")
end)
ApartmentDataEditorMenu:Box("Session")
ApartmentDataEditorMenu:Button("Kill Cooldown", function()
    ScriptGlobal.SetInt(ACDg + 1 + (GTA.GetLocalPlayerId() * 77) + 76, -1)
    Toast("Apartment Heist", "Cooldown should've been killed")
end)
ApartmentDataEditorMenu:Button("Change Session", function()
    changeSession(8)
end)

ApartmentDataEditorMenu:Box("Team Lives")
local livesValueApartment = ApartmentDataEditorMenu:InputInt("Lives")
livesValueApartment:SetIntValue(3)
ApartmentDataEditorMenu:Button("Set Lives", function()
    local v = livesValueApartment:GetIntValue()
    if v < 1 then
        Toast("Apartment Heist", "Lives must be at least 1!")
    else
        ScriptLocal.SetInt(J(FMC), AHLIVESL, v)
        Toast("Apartment Heist", "Team lives set to " .. v)
    end
end)

ApartmentDataEditorMenu:Box("12mil Bonus")
ApartmentDataEditorMenu:Text(
    "Works only for you. Allows you to get 12 millions bonus for The Pacific Standard Job on hard difficulty.\nEnable before starting the heist. Has a cooldown."
)

local apartmentBonus = ApartmentDataEditorMenu:Toggle("12mil Bonus")
local previousState = false

Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        return
    end
    local currentState = apartmentBonus:IsToggled()
    if currentState ~= previousState then
        Stats.SetInt(J("MPPLY_HEISTFLOWORDERPROGRESS"), currentState and 268435455 or 134217727)
        Stats.SetBool(J("MPPLY_AWD_HST_ORDER"), (not currentState) and 1 or 0)
        Stats.SetInt(J("MPPLY_HEISTTEAMPROGRESSBITSET"), currentState and 268435455 or 134217727)
        Stats.SetBool(J("MPPLY_AWD_HST_SAME_TEAM"), (not currentState) and 1 or 0)
        Stats.SetInt(J("MPPLY_HEISTNODEATHPROGREITSET"), currentState and 268435455 or 134217727)
        Stats.SetBool(J("MPPLY_AWD_HST_ULT_CHAL"), (not currentState) and 1 or 0)
        Toast(
            "12mil Bonus",
            currentState and "Bonus should've been applied. Don't forget about difficulty"
                or "Bonus should've been unapplied"
        )
        previousState = currentState
    end
    Script.Yield(100)
end)

ApartmentDataEditorMenu:Box("Cuts")
ApartmentDataEditorMenu:Button("3mil Payout", function()
    local perPlayer, key = SN_ApartmentMaxCut(false)
    if perPlayer then
        local isFleeca = (key == 1328892776)
        SN_ApplyApartmentCuts(perPlayer, perPlayer, perPlayer, perPlayer, isFleeca)
        Toast("Apartment Heist", "Cuts should've been applied")
    else
        Toast("Apartment Heist", "Unknown heist/difficulty")
    end
end)
local apartCut1 = ApartmentDataEditorMenu:InputInt("Player 1")
local apartCut2 = ApartmentDataEditorMenu:InputInt("Player 2")
local apartCut3 = ApartmentDataEditorMenu:InputInt("Player 3")
local apartCut4 = ApartmentDataEditorMenu:InputInt("Player 4")
ApartmentDataEditorMenu:Box("Board Limits")
ApartmentDataEditorMenu:Text("Raise before Apply Cuts for over-100% cuts. Reset after the heist.")
local boardCeiling = ApartmentDataEditorMenu:InputInt("Ceiling")
boardCeiling:SetIntValue(3000000)
local boardCap = ApartmentDataEditorMenu:InputInt("Max Cut %")
boardCap:SetIntValue(70)
ApartmentDataEditorMenu:Button("Apply Custom Limits", function()
    SetTunableInt("HEIST_PLANNING_SANITY_CEILING", boardCeiling:GetIntValue())
    SetTunableInt("MAX_HEIST_CUT_AMOUNT", boardCap:GetIntValue())
    Toast("Apartment Heist", "Ceiling: " .. boardCeiling:GetIntValue() .. " Cap: " .. boardCap:GetIntValue())
end)
ApartmentDataEditorMenu:Button("Raise Board Limits", function()
    SetTunableInt("HEIST_PLANNING_SANITY_CEILING", 10000000)
    SetTunableInt("MAX_HEIST_CUT_AMOUNT", 100)
    Toast("Apartment Heist", "Board limits should've been raised")
end)
ApartmentDataEditorMenu:Button("Reset Board Limits", function()
    SetTunableInt("HEIST_PLANNING_SANITY_CEILING", 3000000)
    SetTunableInt("MAX_HEIST_CUT_AMOUNT", 70)
    Toast("Apartment Heist", "Board limits should've been reset")
end)
ApartmentDataEditorMenu:Button("Read Board Limits", function()
    local ceiling = GetTunableInt("HEIST_PLANNING_SANITY_CEILING")
    local cap = GetTunableInt("MAX_HEIST_CUT_AMOUNT")
    Toast("Apartment Heist", "Ceiling: " .. ceiling .. " Cap: " .. cap)
end)
ApartmentDataEditorMenu:Box("Cuts")
ApartmentDataEditorMenu:Button("Apply Cuts", function()
    local heistType = 0
    if IsScriptRunning(FMMCL) then
        heistType = ScriptLocal.GetInt(J(FMMCL), HGGs1)
    end
    local key = ScriptGlobal.GetInt(ACDg + (GTA.GetLocalPlayerId() * 77) + 24 + 2)
    local isFleeca = (heistType == 1328892776) or (key == 1328892776)
    SN_ApplyApartmentCuts(apartCut1:GetIntValue(), apartCut2:GetIntValue(), apartCut3:GetIntValue(), apartCut4:GetIntValue(), isFleeca)
    Toast("Apartment Heist", "Cuts should've been applied")
end)
ApartmentDataEditorMenu:Button("Read Cuts", function()
    local b1 = ScriptGlobal.GetInt(ACg1)
    local b2 = ScriptGlobal.GetInt(ACg2)
    local b3 = ScriptGlobal.GetInt(ACg3)
    local b4 = ScriptGlobal.GetInt(ACg4)
    local a1 = ScriptGlobal.GetInt(ACg5)
    local a2 = ScriptGlobal.GetInt(ACg6)
    local a3 = ScriptGlobal.GetInt(ACg7)
    local a4 = ScriptGlobal.GetInt(ACg8)
    Toast("Apartment Heist", "Board: " .. b1 .. "/" .. b2 .. "/" .. b3 .. "/" .. b4 .. " Actual: " .. a1 .. "/" .. a2 .. "/" .. a3 .. "/" .. a4)
end)
ApartmentDataEditorMenu:Box("Cut Presets", 2) -- right column, under Board Limits
ApartmentDataEditorMenu:Button("All - 0%", function()
    apartCut1:SetIntValue(0)
    apartCut2:SetIntValue(0)
    apartCut3:SetIntValue(0)
    apartCut4:SetIntValue(0)
end)
ApartmentDataEditorMenu:Button("All - 25%", function()
    apartCut1:SetIntValue(25)
    apartCut2:SetIntValue(25)
    apartCut3:SetIntValue(25)
    apartCut4:SetIntValue(25)
end)
ApartmentDataEditorMenu:Button("All - 85%", function()
    apartCut1:SetIntValue(85)
    apartCut2:SetIntValue(85)
    apartCut3:SetIntValue(85)
    apartCut4:SetIntValue(85)
end)
ApartmentDataEditorMenu:Button("All - 100%", function()
    apartCut1:SetIntValue(100)
    apartCut2:SetIntValue(100)
    apartCut3:SetIntValue(100)
    apartCut4:SetIntValue(100)
end)
ApartmentDataEditorMenu:Box("Misc")
ApartmentDataEditorMenu:Button("Bypass Fleeca Hack", function()
    ScriptLocal.SetInt(J(FMC), AFHl, 7)
    Toast("Apartment Heist", "Hacking process should've been skipped")
end)
ApartmentDataEditorMenu:Button("Bypass Fleeca Drill", function()
    ScriptLocal.SetFloat(J(FMC), AFDl, 100.0)
    Toast("Apartment Heist", "Drilling process should've been skipped")
end)
ApartmentDataEditorMenu:Button("Bypass Pacific Hack", function()
    ScriptLocal.SetInt(J(FMC), AFPl, 9)
    Toast("Apartment Heist", "Hacking process should've been skipped")
end)
ApartmentDataEditorMenu:Button("Skip Checkpoint", function()
    ScriptLocal.SetInt(J(FMC), AHSo, ScriptLocal.GetInt(J(FMC), AHSo) | (1 << 17))
    Toast("Apartment Heist", "Checkpoint should've been skipped")
end)
ApartmentDataEditorMenu:Button("Unlock All Jobs", function()
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_0"), GetTunableInt("ROOT_ID_HASH_THE_FLECCA_JOB"))
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_0_L"), 5)
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_1"), GetTunableInt("ROOT_ID_HASH_THE_PRISON_BREAK"))
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_1_L"), 5)
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_2"), GetTunableInt("ROOT_ID_HASH_THE_HUMANE_LABS_RAID"))
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_2_L"), 5)
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_3"), GetTunableInt("ROOT_ID_HASH_SERIES_A_FUNDING"))
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_3_L"), 5)
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_4"), GetTunableInt("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB"))
    Stats.SetInt(J(MPX() .. "HEIST_SAVED_STRAND_4_L"), 5)
    Toast("Apartment Heist", "All jobs should've been unlocked. Don't forget to restart the game")
end)
ApartmentDataEditorMenu:Box("Solo Launch")
local soloLaunchToggle = ApartmentDataEditorMenu:Toggle("Solo Launch")
Script.RegisterLooped(function()
    Script.Yield()
    if not soloLaunchToggle:IsToggled() then
        Script.Yield(500)
        return
    end
    if not IsSessionStarted() or IsScriptRunning("maintransition") then
        Script.Yield(500)
        return
    end
    if IsScriptRunning(FMMCL) then
        local idx = ScriptLocal.GetInt(J(FMMCL), HGGs1)
        if idx ~= nil and idx > 0 then
            ScriptLocal.SetInt(J(FMMCL), HGGs2, 1)
            ScriptGlobal.SetInt(794989 + 4 + 1 + (idx * 95) + 75, 1)
        end
    end
    ScriptGlobal.SetInt(HGLs1, 1)
    ScriptGlobal.SetInt(4718592 + 3775 + 1, 1)
    ScriptGlobal.SetInt(HGLs4, 0)
    ScriptGlobal.SetInt(HGLs2, 1)
    ScriptGlobal.SetInt(HGLs3, 1)
    Script.Yield(500)
end)
ApartmentDataEditorMenu:Box("Misc")
ApartmentDataEditorMenu:Button("Skip Cutscene", SkipCutscene)
ApartmentDataEditorMenu:Button("Force Ready", function()
    Script.QueueJob(function()
        GTA.ForceScriptHost(J(FMC))
        Script.Yield(1000)
        for i = 0, 3 do
            ScriptGlobal.SetInt(AFRg + 1 + (i * 468) + 270, 6)
        end
        Toast("Apartment Heist", "Everyone should've been forced ready")
    end)
end)
ApartmentDataEditorMenu:Button("Instant Finish", function()
    Script.QueueJob(function()
        if not IsScriptRunning(FMC) then
            Toast("Apartment Heist", "Start the finale first!")
            return
        end
        GTA.ForceScriptHost(J(FMC))
        Script.Yield(500)
        for i = 0, 5 do
            ScriptGlobal.SetString(4718592 + 133252 + 1 + i * 6, "")
        end
        ScriptLocal.SetInt(J(FMC), AIFl2, 5)
        ScriptLocal.SetInt(J(FMC), 19808 + 1232 + 1, 999999)
        local bits = ScriptLocal.GetInt(J(FMC), 19808 + 1)
        bits = bits | (1 << 9) | (1 << 16)
        ScriptLocal.SetInt(J(FMC), 19808 + 1, bits)
        Toast("Apartment Heist", "Heist finished. Wait for load!")
    end)
end)
ApartmentDataEditorMenu:Text("Note: After Clicking Unlock All Heists, restart the game")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cayo Heist --
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
        Stats.SetInt(J(MPX() .. "H4LOOT_" .. loot .. "_" .. where), value)
        Stats.SetInt(J(MPX() .. "H4LOOT_" .. loot .. "_" .. where .. "_SCOPED"), value)
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
    Script.QueueJob(function()
        GTA.ForceScriptHost(J(FMC2020))
        Script.Yield(500)
        ScriptLocal.SetInt(J(FMC2020), CPMantrap1, 7)
        ScriptLocal.SetInt(J(FMC2020), CPMantrap2, 1)
        Toast("Cayo Perico Heist", "Solo mantrap enabled")
    end)
end

function CayoTakeSecondary()
    Script.QueueJob(function()
        ScriptLocal.SetInt(J(FMC2020), CPSecondary, 3)
        Script.Yield(500)
        local cur = ScriptLocal.GetInt(J(FMC2020), CPSecondary)
        if cur ~= nil then
            ScriptLocal.SetInt(J(FMC2020), CPSecondary, cur - 1)
        end
        Toast("Cayo Perico Heist", "Secondary target taken")
    end)
end

function CayoSetLootTake(value)
    ScriptLocal.SetInt(J(FMC2020), CPLootTake, value)
    Toast("Cayo Perico Heist", "Loot take set to " .. value)
end

function GetCayoTakeText()
    if IsScriptRunning(FMC2020) then
        return "Current Take: $" .. tostring(ScriptLocal.GetInt(J(FMC2020), CPLootTake))
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
    Stats.SetInt(J(mpx .. "H4_PROGRESS"), CayoPick("difficulty", cayoSetup.difficulty))
    Stats.SetInt(J(mpx .. "H4_MISSIONS"), CayoPick("approach", cayoSetup.approach))
    Stats.SetInt(J(mpx .. "H4CNF_WEAPONS"), CayoPick("loadout", cayoSetup.loadout))
    Stats.SetInt(J(mpx .. "H4CNF_TARGET"), CayoPick("target", cayoSetup.target))

    -- Secondary loot
    CayoSetSecondary("C", CayoPick("compoundTarget", cayoSetup.secondary), CayoPick("compoundAmount", cayoSetup.compoundAmount))
    CayoSetSecondary("I", CayoPick("islandTarget", cayoSetup.secondary), CayoPick("islandAmount", cayoSetup.islandAmount))
    for loot, value in pairs(cayoSetup.lootValues) do
        Stats.SetInt(J(mpx .. "H4LOOT_" .. loot .. "_V"), value)
    end
    local arts = CayoPick("artsAmount", cayoSetup.artsAmount)
    Stats.SetInt(J(mpx .. "H4LOOT_PAINT"), arts)
    Stats.SetInt(J(mpx .. "H4LOOT_PAINT_SCOPED"), arts)
    Stats.SetInt(J(mpx .. "H4LOOT_PAINT_V"), arts ~= 0 and cayoSetup.paintValue or 0)

    -- Completed preps
    Stats.SetInt(J(mpx .. "H4CNF_APPROACH"), -1)
    Stats.SetInt(J(mpx .. "H4CNF_BS_GEN"), -1)
    Stats.SetInt(J(mpx .. "H4CNF_BS_ENTR"), 63)
    Stats.SetInt(J(mpx .. "H4CNF_BS_ABIL"), 63)
    Stats.SetInt(J(mpx .. "H4CNF_UNIFORM"), -1)
    Stats.SetInt(J(mpx .. "H4CNF_GRAPPEL"), -1)
    Stats.SetInt(J(mpx .. "H4CNF_TROJAN"), 5)
    Stats.SetInt(J(mpx .. "H4CNF_WEP_DISRP"), 3)
    Stats.SetInt(J(mpx .. "H4CNF_ARM_DISRP"), 3)
    Stats.SetInt(J(mpx .. "H4CNF_HEL_DISRP"), 3)
    Stats.SetInt(J(mpx .. "H4_PLAYTHROUGH_STATUS"), 10)

    ScriptLocal.SetInt(J(HIP), CPRSl, 2)
    Toast("Cayo Perico Heist", "Preps should've been completed")
end)
CayoHeistEditorMenu:Button("Reset Preps", function()
    local mpx = MPX()
    Stats.SetInt(J(mpx .. "H4_PROGRESS"), 0)
    Stats.SetInt(J(mpx .. "H4_MISSIONS"), 0)
    Stats.SetInt(J(mpx .. "H4CNF_APPROACH"), 0)
    Stats.SetInt(J(mpx .. "H4CNF_TARGET"), -1)
    Stats.SetInt(J(mpx .. "H4CNF_BS_GEN"), 0)
    Stats.SetInt(J(mpx .. "H4CNF_BS_ENTR"), 0)
    Stats.SetInt(J(mpx .. "H4CNF_BS_ABIL"), 0)
    Stats.SetInt(J(mpx .. "H4_PLAYTHROUGH_STATUS"), 0)
    ScriptLocal.SetInt(J(HIP), CPRSl, 2)
    Toast("Cayo Perico Heist", "Preps should've been reset")
end)
CayoHeistEditorMenu:Button("Reload Planning Screen", function()
    ScriptLocal.SetInt(J(HIP), CPRSl, 2)
    Toast("Cayo Perico Heist", "Screen should've been reloaded")
end)

CayoHeistEditorMenu:Box("Bag Size")
CayoHeistEditorMenu:Custom(function()
    -- Cayo Bag Size Editor
    bagValue, __ = ImGui.InputInt("Bag Size", bagValue)
    if ImGui.Button("Set Bag Size") then
        if bagValue < 0 or bagValue > 10000 then
            Toast("Cayo Perico", "Bag size must be 0-10000.")
        else
            SetTunableInt("HEIST_BAG_MAX_CAPACITY", bagValue)
            Toast("Cayo Perico", "Bag size set to " .. bagValue)
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
        local cur = GetTunableInt(p.tunable)
        local val, used = ImGui.InputInt(p.name, cur)
        if used then
            if val < 0 or val > 10000000 then
                Toast("Cayo Perico", p.name .. " must be 0-10M.")
            else
                SetTunableInt(p.tunable, val)
                Toast("Cayo Perico", p.name .. " payout set to " .. val)
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
            Toast("Cayo Perico", "Cuts must be 0-100.")
        else
            SN_ApplyCayoCuts(cayocut1, cayocut2, cayocut3, cayocut4)
            Toast("Cayo Perico", "Cuts should've been applied")
        end
    end
end)
CayoHeistEditorMenu:Box("Cut Presets")
CayoHeistEditorMenu:Custom(function()
    if ImGui.Button("All - 0%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 0, 0, 0, 0
        SN_ApplyCayoCuts(0, 0, 0, 0)
        Toast("Cayo Perico", "Cuts should've been applied")
    end
    ImGui.SameLine()
    if ImGui.Button("All - 25%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 25, 25, 25, 25
        SN_ApplyCayoCuts(25, 25, 25, 25)
        Toast("Cayo Perico", "Cuts should've been applied")
    end
    if ImGui.Button("All - 85%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 85, 85, 85, 85
        SN_ApplyCayoCuts(85, 85, 85, 85)
        Toast("Cayo Perico", "Cuts should've been applied")
    end
    ImGui.SameLine()
    if ImGui.Button("All - 100%##Cayo") then
        cayocut1, cayocut2, cayocut3, cayocut4 = 100, 100, 100, 100
        SN_ApplyCayoCuts(100, 100, 100, 100)
        Toast("Cayo Perico", "Cuts should've been applied")
    end
    if ImGui.Button("2.55mil Payout##Cayo") then
        local maxCut = SN_CayoMaxCut()
        if maxCut then
            cayocut1, cayocut2, cayocut3, cayocut4 = maxCut, maxCut, maxCut, maxCut
            cayoCrewCuts = false
            SN_ApplyCayoCuts(maxCut, maxCut, maxCut, maxCut)
            Toast("Cayo Perico", "Cuts should've been applied (" .. maxCut .. "% each)")
        else
            Toast("Cayo Perico", "Unknown primary target")
        end
    end
end)
CayoHeistEditorMenu:Box("Hacks")
CayoHeistEditorMenu:Custom(function()
    -- Extras
    if ImGui.Button("Bypass Drainage Cut") then
        ScriptLocal.SetInt(J(FMC2020), CPSTCl, 6)
        Toast("Cayo Perico Heist", "Cutting process should've been skipped")
    end
    if ImGui.Button("Bypass Fingerprint Scanner") then
        ScriptLocal.SetInt(J(FMC2020), CPFHl, 5)
        Toast("Cayo Perico Heist", "Hacking process should've been skipped")
    end
    if ImGui.Button("Bypass Plasma Cutter") then
        ScriptLocal.SetFloat(J(FMC2020), CPPCCl, 100.0)
        Toast("Cayo Perico Heist", "Cutting process should've been skipped")
    end
end)
CayoHeistEditorMenu:Box("Team Lives")
CayoHeistEditorMenu:Custom(function()
    livesValueCayo, __ = ImGui.InputInt("##CayolivesValue", livesValueCayo)
    if ImGui.Button("Set Lives") then
        if livesValueCayo < 1 then
            Toast("Cayo Perico Heist", "Lives must be at least 1.")
        elseif livesValueCayo > 999999 then
            Toast("Cayo Perico Heist", "Lives value too high.")
        elseif not IsScriptRunning(FMC2020) then
            Toast("Cayo Perico Heist", "Mission script not active.")
        else
            ScriptLocal.SetInt(J(FMC2020), CPLIVESL, livesValueCayo)
            Toast("Cayo Perico Heist", "Team Lives value set to " .. livesValueCayo)
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Default is 3. Infinite team lives for the heist (set to 999999 for unlimited)")
    end
end)
CayoHeistEditorMenu:Box("Mission")
CayoHeistEditorMenu:Custom(function()
    if ImGui.Button("Remove All CCTVs") then
        Script.QueueJob(function()
            for _, ent in ipairs(GetAllObjects()) do
                local model = Natives.InvokeInt(N.GET_ENTITY_MODEL, ent) & 0xFFFFFFFF
                for _, cam in ipairs(CamList) do
                    if model == cam then
                        Natives.InvokeVoid(N.SET_ENTITY_AS_MISSION_ENTITY, ent, true, true)
                        DeleteEntity(ent)
                        break
                    end
                end
            end
        end)
    end

    CamList = {
        J("prop_cctv_cam_01a"),
        J("prop_cctv_cam_01b"),
        J("prop_cctv_cam_02a"),
        J("prop_cctv_cam_03a"),
        J("prop_cctv_cam_04a"),
        J("prop_cctv_cam_04c"),
        J("prop_cctv_cam_05a"),
        J("prop_cctv_cam_06a"),
        J("prop_cctv_cam_07a"),
        J("prop_cs_cctv"),
        J("p_cctv_s"),
        J("hei_prop_bank_cctv_01"),
        J("hei_prop_bank_cctv_02"),
        J("ch_prop_ch_cctv_cam_02a"),
        J("xm_prop_x17_server_farm_cctv_01"),
    }

    if ImGui.Button("Instant Finish") then
        -- FIX Bug#2: old code never took script host, so finish desynced and only host got payout.
        -- Must be HOST (or force host) and cuts must already be set by HOST.
        Script.QueueJob(function()
            if not IsScriptRunning(FMC2020) then
                Toast("Cayo Perico Heist", "Start the finale first!")
                return
            end
            GTA.ForceScriptHost(J(FMC2020))
            Script.Yield(1000)
            ScriptLocal.SetInt(J(FMC2020), CPXf1, 9)
            ScriptLocal.SetInt(J(FMC2020), CPXf2, 50)
            Toast("Cayo Perico Heist", "Finished (HOST). If crew got 0, HOST forgot to set cuts to 100/100 before finale!")
        end)
    end
    if ImGui.Button("Skip Cutscene") then
        SkipCutscene()
    end
    if ImGui.Button("Force Ready") then
        Script.QueueJob(function()
            GTA.ForceScriptHost(J(FMC2020))
            Script.Yield(1000)
            for i = 0, 3 do
                ScriptGlobal.SetInt(CYFRg + 1 + (i * 27) + 7 + 1 + i, 1)
            end
            Toast("Cayo Perico Heist", "Everyone should've been forced ready")
        end)
    end

    if ImGui.Button("Kill Cooldown (after solo)") then
        Stats.SetInt(J(MPX() .. "H4_TARGET_POSIX"), 1659643454)
        Stats.SetInt(J(MPX() .. "H4_COOLDOWN"), 0)
        Stats.SetInt(J(MPX() .. "H4_COOLDOWN_HARD"), 0)
        Toast("Cayo Perico Heist", "Cooldown should've been killed")
    end
    if ImGui.Button("Kill Cooldown (after team)") then
        Stats.SetInt(J(MPX() .. "H4_TARGET_POSIX"), 1659429119)
        Stats.SetInt(J(MPX() .. "H4_COOLDOWN"), 0)
        Stats.SetInt(J(MPX() .. "H4_COOLDOWN_HARD"), 0)
        Toast("Cayo Perico Heist", "Cooldown should've been killed")
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
            Script.QueueJob(function()
                local ped = Natives.InvokeInt(N.PLAYER_PED_ID)
                Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, ped, location.x, location.y, location.z)
            end)
        end

    end
end)

-- Handle the Crew Cuts loop separately
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        return
    end
    for _, cut in ipairs(CayoPericoCrewCut) do
        if cayoCrewCuts then
            SetTunableFloat(cut.tunable, 0)
        else
            SetTunableFloat(cut.tunable, cut.default)
        end
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Casino Heist 

local CasinoHeistEditorMenu = HeistsDataEditorMenu:Tab("Casino Heist")
CasinoHeistEditorMenu:Box("Information", 0) -- full width, above everything else
CasinoHeistEditorMenu:Text("Max Payout 3.619.000$")
CasinoHeistEditorMenu:Text("Min Cooldown ≈ 15-20 minutes")

CasinoHeistEditorMenu:Box("One Click Setups")
CasinoHeistEditorMenu:Button("Casino Silent&Sneaky (Diamonds)", function()
    Stats.SetInt(J(MPX() .. "H3OPT_APPROACH"), 1)
    Stats.SetInt(J(MPX() .. "H3_LAST_APPROACH"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_TARGET"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_BITSET1"), 127)
    Stats.SetInt(J(MPX() .. "H3OPT_DISRUPTSHIP"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_KEYLEVELS"), 2)
    Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE2"), -1)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWWEAP"), 4)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWDRIVER"), 5)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWHACKER"), 5)
    Stats.SetInt(J(MPX() .. "H3OPT_VEHS"), 2)
    Stats.SetInt(J(MPX() .. "H3OPT_WEAPS"), 1)
    Stats.SetInt(J(MPX() .. "H3OPT_BITSET0"), 262399)
    Stats.SetInt(J(MPX() .. "H3OPT_MASKS"), 2)
end)
CasinoHeistEditorMenu:Button("Casino The Big Con (Diamonds)", function()
    Stats.SetInt(J(MPX() .. "H3OPT_APPROACH"), 2)
    Stats.SetInt(J(MPX() .. "H3_LAST_APPROACH"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_TARGET"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_BITSET1"), 799)
    Stats.SetInt(J(MPX() .. "H3OPT_DISRUPTSHIP"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_KEYLEVELS"), 2)
    Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE2"), -1)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWWEAP"), 4)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWDRIVER"), 5)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWHACKER"), 5)
    Stats.SetInt(J(MPX() .. "H3OPT_VEHS"), 2)
    Stats.SetInt(J(MPX() .. "H3OPT_WEAPS"), 0)
    Stats.SetInt(J(MPX() .. "H3OPT_BITSET0"), 913623)
    Stats.SetInt(J(MPX() .. "H3OPT_MASKS"), 2)
end)
CasinoHeistEditorMenu:Button("Casino Aggressive (Diamonds)", function()
    Stats.SetInt(J(MPX() .. "H3OPT_APPROACH"), 3)
    Stats.SetInt(J(MPX() .. "H3_LAST_APPROACH"), 1)
    Stats.SetInt(J(MPX() .. "H3OPT_TARGET"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_BITSET1"), 799)
    Stats.SetInt(J(MPX() .. "H3OPT_DISRUPTSHIP"), 3)
    Stats.SetInt(J(MPX() .. "H3OPT_KEYLEVELS"), 2)
    Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE2"), -1)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWWEAP"), 4)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWDRIVER"), 5)
    Stats.SetInt(J(MPX() .. "H3OPT_CREWHACKER"), 5)
    Stats.SetInt(J(MPX() .. "H3OPT_VEHS"), 2)
    Stats.SetInt(J(MPX() .. "H3OPT_WEAPS"), 1)
    Stats.SetInt(J(MPX() .. "H3OPT_BITSET0"), 1835223)
    Stats.SetInt(J(MPX() .. "H3OPT_MASKS"), 2)
end)


-- Lives Editor for Casino Heist
local livesValueCasino = 3
CasinoHeistEditorMenu:Box("Team Lives")
CasinoHeistEditorMenu:Custom(function()
    livesValueCasino, __ = ImGui.InputInt("##CasinoLives", livesValueCasino)
    if ImGui.Button("Set Lives##Casino") then
        if livesValueCasino < 1 then
            Toast("Casino Heist", "Lives must be at least 1!")
        else
            ScriptLocal.SetInt(J(FMC), DCLIVESL, livesValueCasino)
            Toast("Casino Heist", "Team lives set to " .. livesValueCasino)
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
        Stats.SetInt(J(MPX() .. "H3OPT_POI"), -1)
        Stats.SetInt(J(MPX() .. "H3OPT_ACCESSPOINTS"), -1)
        Stats.SetInt(J(MPX() .. "CAS_HEIST_NOTS"), -1)
        Stats.SetInt(J(MPX() .. "CAS_HEIST_FLOW"), -1)
        Stats.SetInt(J(MPX() .. "H3_LAST_APPROACH"), 0)
        Stats.SetInt(J(MPX() .. "H3_HARD_APPROACH"), (difficulty == 0) and 0 or approach)
        Stats.SetInt(J(MPX() .. "H3OPT_APPROACH"), approach)
        Stats.SetInt(J(MPX() .. "H3OPT_CREWWEAP"), gunman)
        Stats.SetInt(J(MPX() .. "H3OPT_WEAPS"), loadout)
        Stats.SetInt(J(MPX() .. "H3OPT_CREWDRIVER"), driver)
        Stats.SetInt(J(MPX() .. "H3OPT_VEHS"), vehicles)
        Stats.SetInt(J(MPX() .. "H3OPT_CREWHACKER"), hacker)
        Stats.SetInt(J(MPX() .. "H3OPT_TARGET"), target)
        Stats.SetInt(J(MPX() .. "H3OPT_MASKS"), masks)
        Stats.SetInt(J(MPX() .. "H3OPT_DISRUPTSHIP"), guards)
        Stats.SetInt(J(MPX() .. "H3OPT_KEYLEVELS"), keycards)
        Stats.SetInt(J(MPX() .. "H3OPT_BODYARMORLVL"), -1)
        Stats.SetInt(J(MPX() .. "H3OPT_BITSET0"), -1)
        Stats.SetInt(J(MPX() .. "H3OPT_BITSET1"), -1)
        Stats.SetInt(J(MPX() .. "H3OPT_COMPLETEDPOSIX"), -1)
        ScriptLocal.SetInt(J(CASPL), DCRBl, 2)
        Toast("Diamond Casino Heist", "Preps should've been completed")
    end


    if ImGui.Button("Reset Preps##diamond") then
        Stats.SetInt(J(MPX() .. "H3_LAST_APPROACH"), 0)
        Stats.SetInt(J(MPX() .. "H3_HARD_APPROACH"), 0)
        Stats.SetInt(J(MPX() .. "H3_APPROACH"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_APPROACH"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_CREWWEAP"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_WEAPS"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_CREWDRIVER"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_VEHS"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_CREWHACKER"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_MASKS"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_TARGET"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_DISRUPTSHIP"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_BODYARMORLVL"), 1)
        Stats.SetInt(J(MPX() .. "H3OPT_KEYLEVELS"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_BITSET0"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_BITSET1"), 0)
        Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE0"), 0)
        Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE1"), 0)
        Stats.SetInt(J(MPX() .. "H3_BOARD_DIALOGUE2"), 0)
        Stats.SetInt(J("MPPLY_H3_COOLDOWN"), 0)
        Stats.SetInt(J(MPX() .. "H3OPT_COMPLETEDPOSIX"), 0)
        ScriptLocal.SetInt(J(CASPL), DCRBl, 2)
        Toast("Diamond Casino Heist", "Preps should've been reset")
    end
end)

local casinoCrewCuts_enabled = false
local casinoPc1_val = 0
local casinoPc2_val = 0
local casinoPc3_val = 0
local casinoPc4_val = 0

function SetDiamondMaxPayout()
    local approach = GetStatInt(MPX() .. "H3OPT_APPROACH")
    local hardApproach = GetStatInt(MPX() .. "H3_HARD_APPROACH")
    local target = GetStatInt(MPX() .. "H3OPT_TARGET")
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
    local gunman = GetStatInt(MPX() .. "H3OPT_CREWWEAP")
    local driver = GetStatInt(MPX() .. "H3OPT_CREWDRIVER")
    local hacker = GetStatInt(MPX() .. "H3OPT_CREWHACKER")
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
            Toast("Casino Heist", "Cuts must be 0-100.")
        else
            ScriptGlobal.SetInt(DCCg1, casinoPc1_val)
            ScriptGlobal.SetInt(DCCg2, casinoPc2_val)
            ScriptGlobal.SetInt(DCCg3, casinoPc3_val)
            ScriptGlobal.SetInt(DCCg4, casinoPc4_val)
            Toast("Casino Heist", "Cuts should've been applied")
        end
    end
end)

Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    for _, cut in ipairs(DiamondCasinoCrewCut) do
        if casinoCrewCuts_enabled then
            SetTunableInt(cut.tunable, 0)
        else
            SetTunableInt(cut.tunable, cut.default)
        end
    end
    Script.Yield(500)
end)

CasinoHeistEditorMenu:Box("Misc")
CasinoHeistEditorMenu:Custom(function()
    if ImGui.Button("Reload boards") then
        ScriptLocal.SetInt(J(CASPL), DCRBl, 2)
    end
    if ImGui.Button("Solo Launch") then
        if ScriptLocal.GetInt(J(FMMCL), HGGs1) ~= nil and ScriptLocal.GetInt(J(FMMCL), HGGs1) ~= 0 then
            if ScriptLocal.GetInt(J(FMMCL), HGGs1) > 1 then
                ScriptLocal.SetInt(J(FMMCL), HGGs2, 1)
                ScriptGlobal.SetInt(794989 + 4 + 1 + (ScriptLocal.GetInt(J(FMMCL), HGGs1) * 95) + 75, 1)
            end
            ScriptGlobal.SetInt(HGLs1, 1)
            ScriptGlobal.SetInt(HGLs2, 1)
            ScriptGlobal.SetInt(HGLs3, 1)
            ScriptGlobal.SetInt(HGLs4, 0)
        end
    end
    if ImGui.Button("Kill Cooldown") then
        Stats.SetInt(J(MPX() .. "H3_COMPLETEDPOSIX"), -1)
        Stats.SetInt(J("MPPLY_H3_COOLDOWN"), -1)
        Toast("Diamond Casino Heist", "Cooldown should've been killed")
    end
end)

local CasinoHeistExtra = CasinoHeistEditorMenu:Tab("Extras")
CasinoHeistExtra:Box("Hacks")
local casinoAutograbber = CasinoHeistExtra:Toggle("Autograbber")
Script.RegisterLooped(function()
    Script.Yield()
    if
        not IsSessionStarted()
        or IsScriptRunning("maintransition")
    then
        Script.Yield(500)
        return
    end
    if casinoAutograbber:IsToggled() then
        if not IsScriptRunning(FMC) then
            Script.Yield(500)
            return
        end
        if ScriptLocal.GetInt(J(FMC), DCAg) == 3 then
            ScriptLocal.SetInt(J(FMC), DCAg, 4)
        elseif ScriptLocal.GetInt(J(FMC), DCAg) == 4 then
            ScriptLocal.SetFloat(J(FMC), DCAs, 2.0)
        else
            Script.Yield(500)
        end
    else
        Script.Yield(500)
    end
end)
CasinoHeistExtra:Button("Bypass Fingerprint Hack", function()
    if not IsScriptRunning(FMC) then
        Toast("Casino Heist", "Mission script not active.")
        return
    end
    if ScriptLocal.GetInt(J(FMC), DCFHl) == 4 then
        ScriptLocal.SetInt(J(FMC), DCFHl, 5)
    else
        Toast("Casino Heist", "Fingerprint hack not ready.")
    end
end)
CasinoHeistExtra:Button("Bypass Keypad Hack", function()
    if not IsScriptRunning(FMC) then
        Toast("Casino Heist", "Mission script not active.")
        return
    end
    if ScriptLocal.GetInt(J(FMC), DCKHl) ~= 4 then
        ScriptLocal.SetInt(J(FMC), DCKHl, 5)
    else
        Toast("Casino Heist", "Keypad hack not ready.")
    end
end)
CasinoHeistExtra:Button("Bypass Drill Vault Door", function()
    ScriptLocal.SetInt(J(FMC), DCDVDl1, ScriptLocal.GetInt(J(FMC), DCDVDl2))
end)
CasinoHeistExtra:Box("Mission")
CasinoHeistExtra:Button("Instant Finish", function()
    -- FIX: old code never took script host and only set half the locals per approach -> desync/fail.
    Script.QueueJob(function()
        if not IsScriptRunning(FMC) then
            Toast("Instant Heist Passed", "Start the finale first!")
            return
        end
        GTA.ForceScriptHost(J(FMC))
        Script.Yield(1000)
        ScriptLocal.SetInt(J(FMC), DCXf1, 12)
        ScriptLocal.SetInt(J(FMC), DCXf2, 5)
        ScriptLocal.SetInt(J(FMC), DCXf3, 80)
        ScriptLocal.SetInt(J(FMC), DCXf4, 10000000)
        ScriptLocal.SetInt(J(FMC), DCXf5, 99999)
        ScriptLocal.SetInt(J(FMC), DCXf6, 99999)
        Toast("Instant Heist Passed", "Activated (HOST). Wait for vault to stream!")
    end)
end)
CasinoHeistExtra:Button("Force Ready", function()
    Script.QueueJob(function()
        GTA.ForceScriptHost(J(FMC))
        Script.Yield(1000)
        for i = 0, 3 do
            ScriptGlobal.SetInt(CFRg + 1 + (i * 68) + 7 + 1 + i, 1)
        end
    end)
end)
CasinoHeistExtra:Button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Doomsday --

function DoomsdayActSetter(progress, status)
    Stats.SetInt(J(MPX() .. "GANGOPS_FLOW_MISSION_PROG"), progress)
    Stats.SetInt(J(MPX() .. "GANGOPS_HEIST_STATUS"), status)
    Stats.SetInt(J(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS"), 1557)
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
    Stats.SetInt(J(MPX() .. "GANGOPS_FM_MISSION_PROG"), -1)
    Toast("Doomsday Heist", act.name .. ": preps should've been completed")
end)
SN_Doomsday:Button("Reset Preps", function()
    DoomsdayActSetter(240, 0)
    Toast("Doomsday Heist", "Preps should've been reset")
end)

local DoomsdayHeists = {
    [503] = { 975000, 1218750 },
    [240] = { 1425000, 1771250 },
    [16368] = { 1800000, 2250000 },
}

function SetDoomsdayMaxPayout()
    local heist = GetStatInt(MPX() .. "GANGOPS_FLOW_MISSION_PROG")
    local difficulty = ScriptGlobal.GetInt(AHDg)
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
            dmsdyCut1:SetIntValue(cutValue)
        end
        if dmsdyCut2 then
            dmsdyCut2:SetIntValue(cutValue)
        end
        if dmsdyCut3 then
            dmsdyCut3:SetIntValue(cutValue)
        end
        if dmsdyCut4 then
            dmsdyCut4:SetIntValue(cutValue)
        end
    end
end)

SN_Doomsday:Button("Apply Cuts", function()
    ScriptGlobal.SetInt(DCg1, dmsdyCut1:GetIntValue())
    ScriptGlobal.SetInt(DCg2, dmsdyCut2:GetIntValue())
    ScriptGlobal.SetInt(DCg3, dmsdyCut3:GetIntValue())
    ScriptGlobal.SetInt(DCg4, dmsdyCut4:GetIntValue())
    Toast("Doomsday Heist", "Cuts should've been applied")
end)

-- Lives Editor for Doomsday Heist
local livesValueDoomsday = 3
SN_Doomsday:Box("Team Lives")
SN_Doomsday:Custom(function()
    livesValueDoomsday, __ = ImGui.InputInt("##DoomsdayLives", livesValueDoomsday)
    if ImGui.Button("Set Lives##Doomsday") then
        if livesValueDoomsday < 1 then
            Toast("Doomsday Heist", "Lives must be at least 1!")
        else
            ScriptLocal.SetInt(J(FMC), DDLIVESL, livesValueDoomsday)
            Toast("Doomsday Heist", "Team lives set to " .. livesValueDoomsday)
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Default is 3. Infinite team lives for the heist (set to 999999 for unlimited)")
    end
end)

SN_Doomsday:Box("Extras")
SN_Doomsday:Button("By Act III Pass hack", function()
    ScriptLocal.SetInt(J(FMC), DDSHl, 3)
end)
SN_Doomsday:Button("Solo Launch", function()
    if ScriptLocal.GetInt(J(FMMCL), HGGs1) ~= nil then
        if ScriptLocal.GetInt(J(FMMCL), HGGs1) ~= 0 then
            if ScriptLocal.GetInt(J(FMMCL), HGGs1) > 1 then
                ScriptLocal.SetInt(J(FMMCL), HGGs2, 1)
                ScriptGlobal.SetInt(794989 + 4 + 1 + (ScriptLocal.GetInt(J(FMMCL), HGGs1) * 95) + 75, 1)
            end
            ScriptGlobal.SetInt(HGLs1, 1)
            ScriptGlobal.SetInt(HGLs2, 1)
            ScriptGlobal.SetInt(HGLs3, 1)
            ScriptGlobal.SetInt(HGLs4, 0)
        end
    end
end)
SN_Doomsday:Box("Instant Finish")
SN_Doomsday:Text("Instant Finish: use Act I/II for Data Breaches/Bogdan, Act III for Doomsday Scenario. HOST only. Wait for area to load or you will fail/crash.")
SN_Doomsday:Button("Instant Finish (Act I/II)", function()
    -- FIX Bug#1: old single button mixed Act I/II (80) + Act III (150) values and never
    -- took script host -> teleport to unloaded interior -> crash/fail.
    -- Act I/II needs 12 + 80 + 99999 + 99999 (no 150, no passed-flag).
    Script.QueueJob(function()
        if not IsScriptRunning(FMC) then
            Toast("Doomsday Heist", "Start the finale first!")
            return
        end
        GTA.ForceScriptHost(J(FMC))
        Script.Yield(1000)
        ScriptLocal.SetInt(J(FMC), DDIF1, 12)
        ScriptLocal.SetInt(J(FMC), DDIF5, 80)
        ScriptLocal.SetInt(J(FMC), DDIF3, 99999)
        ScriptLocal.SetInt(J(FMC), DDIF4, 99999)
        Toast("Doomsday Heist", "Act I/II should be finished. Wait for load, do NOT skip too fast.")
    end)
end)
SN_Doomsday:Button("Instant Finish (Act III Scenario)", function()
    -- FIX Bug#1 Act III: needs 12 + 150 + 5 (passed flag DDIF6) + 99999 + 99999 (no 80).
    -- Missing DDIF6=5 was the main cause of End-of-World teleport/fail.
    Script.QueueJob(function()
        if not IsScriptRunning(FMC) then
            Toast("Doomsday Heist", "Start the Doomsday Scenario finale first!")
            return
        end
        GTA.ForceScriptHost(J(FMC))
        Script.Yield(1000)
        ScriptLocal.SetInt(J(FMC), DDIF1, 12)
        ScriptLocal.SetInt(J(FMC), DDIF2, 150)
        ScriptLocal.SetInt(J(FMC), DDIF6, 5)
        ScriptLocal.SetInt(J(FMC), DDIF3, 99999)
        ScriptLocal.SetInt(J(FMC), DDIF4, 99999)
        Toast("Doomsday Heist", "Act III should be finished. Wait 10-20s for Mount Chiliad bunker to stream!")
    end)
end)
SN_Doomsday:Text("If teleport fails/loads forever: use Skip Checkpoint instead, or walk to yellow marker before pressing.")
SN_Doomsday:Box("Extras")
SN_Doomsday:Button("Force Ready", function()
    Script.QueueJob(function()
        GTA.ForceScriptHost(J(FMC))
        Script.Yield(1000)
        for i = 0, 3 do
            ScriptGlobal.SetInt(DDFRg + 1 + (i * 321) + 43 + 11 + 1 + i, 1)
        end
        Toast("Doomsday Heist", "Everyone should've been forced ready")
    end)
end)
SN_Doomsday:Button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Salvage Yard 
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
        { script = "fm_content_vehrob_cargo_ship", step1 = 7185 + 1, step2 = 7330 + 1249 },
        { script = "fm_content_vehrob_police", step1 = 9011 + 1, step2 = 9144 + 1305 },
        { script = "fm_content_vehrob_arena", step1 = 7912 + 1, step2 = 8032 + 1314 },
        { script = "fm_content_vehrob_casino_prize", step1 = 9191 + 1, step2 = 9328 + 1258 },
        { script = "fm_content_vehrob_submarine", step1 = 6218 + 1, step2 = 6356 + 1159 },
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
        Toast(
            "Salvage Yard",
            "Selected " .. slot_names[ssIndex + 1] .. " robbery: " .. robbery_names[slot.robbery_index + 1]
        )
    end

    nIndex, changed = ImGui.Combo("Vehicle", slot.vehicle_index, vehicle_names, #vehicle_names)
    if changed then
        slot.vehicle_index = nIndex
        Toast(
            "Salvage Yard",
            "Selected " .. slot_names[ssIndex + 1] .. " vehicle: " .. vehicle_names[slot.vehicle_index + 1]
        )
    end

    nIndex, changed = ImGui.Combo("Modification", slot.mod_index, mod_names, #mod_names)
    if changed then
        slot.mod_index = nIndex
        Toast(
            "Salvage Yard",
            "Selected " .. slot_names[ssIndex + 1] .. " modification: " .. mod_names[slot.mod_index + 1]
        )
    end

    nIndex, changed = ImGui.Combo("Status", slot.keep_index, keep_names, #keep_names)
    if changed then
        slot.keep_index = nIndex
        Toast(
            "Salvage Yard",
            "Selected " .. slot_names[ssIndex + 1] .. " status: " .. keep_names[slot.keep_index + 1]
        )
    end

    if ImGui.Button("Apply Changes") then
        local robbery = SalvageYard.robberies[slot.robbery_index + 1].index
        local vehicle = SalvageYard.vehicles[slot.vehicle_index + 1].index
        local mod = SalvageYard.modifications[slot.mod_index + 1].index
        local keep = SalvageYard.keeps[slot.keep_index + 1].index
        SetTunableInt(SalvageYard.tunables["robbery_slot" .. currSlot .. "_type"], robbery)
        SetTunableInt(SalvageYard.tunables["vehicle_slot" .. currSlot .. "_type"], vehicle + mod * 100)
        SetTunableInt(SalvageYard.tunables["vehicle_slot" .. currSlot .. "_cankeep"], keep)
        ScriptLocal.SetInt(J("vehrob_planning"), SYRl1, 2)
        Toast("Salvage Yard", slot_names[ssIndex + 1] .. " changes should've been applied")
    end
    if ImGui.Button("Make Available") then
        Stats.SetInt(J(MPX() .. "SALV23_VEHROB_STATUS" .. (currSlot - 1)), 0)
        ScriptLocal.SetInt(J("vehrob_planning"), SYRl1, 2)
        Toast("Salvage Yard", slot_names[ssIndex + 1] .. " should've been made Available")
    end
end)

SN_Salvage:Box("Preps")
SN_Salvage:Button("Complete Preps", function()
    Stats.SetInt(J(MPX() .. "SALV23_GEN_BS"), -1)
    Stats.SetInt(J(MPX() .. "SALV23_SCOPE_BS"), -1)
    Stats.SetInt(J(MPX() .. "SALV23_FM_PROG"), -1)
    Stats.SetInt(J(MPX() .. "SALV23_INST_PROG"), -1)
    ScriptLocal.SetInt(J("vehrob_planning"), SYRl1, 2)
    Toast("Salvage Yard", "Preps should've been completed")
end)
SN_Salvage:Button("Reset Preps", function()
    Stats.SetInt(J(MPX() .. "SALV23_GEN_BS"), 0)
    Stats.SetInt(J(MPX() .. "SALV23_SCOPE_BS"), 0)
    Stats.SetInt(J(MPX() .. "SALV23_FM_PROG"), 0)
    Stats.SetInt(J(MPX() .. "SALV23_INST_PROG"), 0)
    ScriptLocal.SetInt(J("vehrob_planning"), SYRl1, 2)
    Toast("Salvage Yard", "Preps should've been reset")
end)
SN_Salvage:Button("Reload Screen", function()
    ScriptLocal.SetInt(J("vehrob_planning"), SYRl1, 2)
    Toast("Salvage Yard", "Screen should've been reloaded")
end)
SN_Salvage:Button("Skip Weekly Cooldown", function()
    SetTunableInt(SalvageYard.tunables.cooldown_weekly, GetStatInt(MPX() .. "SALV23_WEEK_SYNC") + 1)
    ScriptLocal.SetInt(J("vehrob_planning"), SYRl1, 2)
    Toast("Salvage Yard", "Cooldown should've been skipped")
end)

SN_Salvage:Box("Payout")
local sell_value_slot1 = SN_Salvage:InputInt("Sell Value Slot 1")
sell_value_slot1:SetIntValue(0)
local sell_value_slot2 = SN_Salvage:InputInt("Sell Value Slot 2")
sell_value_slot2:SetIntValue(0)
local sell_value_slot3 = SN_Salvage:InputInt("Sell Value Slot 3")
sell_value_slot3:SetIntValue(0)
SN_Salvage:Button("Apply Sell Values", function()
    SetTunableInt(SalvageYard.tunables.vehicle_slot1_value, sell_value_slot1:GetIntValue())
    SetTunableInt(SalvageYard.tunables.vehicle_slot2_value, sell_value_slot2:GetIntValue())
    SetTunableInt(SalvageYard.tunables.vehicle_slot3_value, sell_value_slot3:GetIntValue())
    ScriptLocal.SetInt(J("vehrob_planning"), SYRl1, 2)
    Toast("Salvage Yard", "Sell values should've been applied")
end)

SN_Salvage:Box("Misc")
SN_Salvage:Button("Instant Finish", function()
    for _, mission in ipairs(SalvageYard.salvage_missions) do
        local value = ScriptLocal.GetInt(J(mission.script), mission.step1)
        ScriptLocal.SetInt(J(mission.script), mission.step1, value | (1 << 11))
        ScriptLocal.SetInt(J(mission.script), mission.step2, 2)
    end
    Toast("Salvage Yard", "Heist should've been finished")
end)
SN_Salvage:Button("Instant Sell", function()
    local player_ped = Natives.InvokeInt(N.PLAYER_PED_ID)
    Natives.InvokeVoid(N.SET_PED_COORDS_KEEP_VEHICLE, player_ped, 1169.0, -2976.0, 6.0)
    Toast("Salvage Yard", "Sell mission should've been finished")
end)
SN_Salvage:Button("Skip Cutscene", SkipCutscene)

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

-- Create menu tab
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
    return IsScriptRunning(FMCV3)
end

function getCurrentBagSize()
    return ScriptGlobal.GetInt(KCBGL)
end

function getCurrentLives()
    return ScriptLocal.GetInt(J(FMCV3), KCLIVESL)
end

-- Set payout to Global_262145.f_37405 + (index + 1)
function setPayout(index, value)
    ScriptGlobal.SetInt(KCPAYOUT_BASE + index + 1, value)
end

function EnableSoloSecondaryTargets()
    local target_indices = { 0, 1, 5, 6, 7, 20, 21 }
    for _, i in ipairs(target_indices) do
        local base = KCSECONDARY_BASE + (i * 333)
        ScriptGlobal.SetInt(base + 68, 0)
        ScriptGlobal.SetInt(base + 143, 0)
    end
    Toast("Kortz Center", "Solo secondary targets enabled")
end

function SetKortzTarget(target_index)
    Stats.SetInt(J(MPX() .. "K26_HEIST_TARGET"), target_index)
    ScriptLocal.SetInt(J(KORTZPL), KCBRL, 2)
    Toast("Kortz Center Heist", "Target set to: " .. targetShortNames[target_index + 1])
end

function KortzReloadBoard()
    ScriptLocal.SetInt(J(KORTZPL), KCBRL, 2)
    Toast("Kortz Center Heist", "Planning board reloaded")
end

function KortzSkipCooldown()
    ScriptGlobal.SetInt(KCCDG, 0)
    ScriptGlobal.SetInt(KCCD2G, 0)
    Toast("Kortz Center Heist", "Cooldowns reset to 0")
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
function ToggleBitDropdown(label, stat_name, bit, tooltip)
    local current = GetStatInt(MPX() .. stat_name)
    local is_set = (current & bit) ~= 0
    local options = { "Not Done", "Done" }
    local idx = is_set and 1 or 0
    local new_idx, changed = ImGui.Combo(label, idx, options, 2)
    if changed then
        if new_idx == 1 then
            Stats.SetInt(J(MPX() .. stat_name), current | bit)
            Toast("Kortz Center Heist", label .. " completed")
        else
            Stats.SetInt(J(MPX() .. stat_name), current & ~bit)
            Toast("Kortz Center Heist", label .. " undone")
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
            ScriptLocal.SetInt(J(FMCV3), KCDCL + 1 + (b * 4), 1)
        end
        ScriptLocal.SetInt(J(FMCV3), KCDCL, 1)
        Toast("Kortz Center Cracker", "Data crack bypassed")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzSkipFingerprint()
    if isKortzHeistActive() then
        ScriptLocal.SetInt(J(FMCV3), KCFHL, 5)
        Toast("Kortz Center Cracker", "Fingerprint scanner bypassed")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzSkipVaultDoor()
    if isKortzHeistActive() then
        ScriptLocal.SetInt(J(FMCV3), KCVLL, 5)
        Toast("Kortz Center Cracker", "Vault door bypassed")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzAutoAccessCode()
    if isKortzHeistActive() then
        ScriptLocal.SetInt(J(FMCV3), KCAC_BASE + (0 * 2), 0)
        ScriptLocal.SetInt(J(FMCV3), KCAC_BASE + (1 * 2), 0)
        ScriptLocal.SetInt(J(FMCV3), KCAC_BASE + (2 * 2), 0)
        Natives.InvokeBool(N.SET_CONTROL_VALUE_NEXT_FRAME, 0, 237, 1.0)
        Toast("Kortz Center Cracker", "Access code entered: 00-00-00")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzDisableLasers()
    if isKortzHeistActive() then
        ScriptLocal.SetInt(J(FMCV3), KCLGL, 4294784)
        ScriptGlobal.SetInt(KCLDG, 1)
        Toast("Kortz Center Cracker", "Laser grid neutralized")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzSetLasersEasy()
    ScriptLocal.SetInt(J(FMMLASERS), KCLDIF1, 1)
    ScriptLocal.SetInt(J(FMMLASERS), KCLDIF2, 0)
    Toast("Kortz Center Cracker", "Lasers set to Easy")
end

local function KortzSetLasersHard()
    ScriptLocal.SetInt(J(FMMLASERS), KCLDIF1, 0)
    ScriptLocal.SetInt(J(FMMLASERS), KCLDIF2, 1)
    Toast("Kortz Center Cracker", "Lasers set to Hard")
end

local function KortzNoDamageLasers()
    ScriptLocal.SetInt(J(FMMLASERS), KCNoDmg, 1)
    Toast("Kortz Center Cracker", "No damage lasers enabled")
end

local function KortzSetLootTake(value)
    if isKortzHeistActive() then
        ScriptLocal.SetInt(J(FMCV3), KCLootTake, value)
        Toast("Kortz Center Cracker", "Loot take set to " .. value)
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

function GetKortzTakeText()
    if isKortzHeistActive() then
        return "Current Take: $" .. tostring(ScriptLocal.GetInt(J(FMCV3), KCLootTake))
    end
    return "Current Take: N/A (start heist)"
end

local function CutVenus()
    if isKortzHeistActive() then
        ScriptLocal.SetFloat(J(FMCV3), KCCGL_BASE + (0 * 13) + KCCGL_OFFSET, 100.0)
        Toast("Kortz Center Cracker", "Venus d'Algernon cut")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function CutGemstone()
    if isKortzHeistActive() then
        ScriptLocal.SetFloat(J(FMCV3), KCCGL_BASE + (1 * 13) + KCCGL_OFFSET, 100.0)
        Toast("Kortz Center Cracker", "Gemstone cut")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function CutHorse()
    if isKortzHeistActive() then
        ScriptLocal.SetFloat(J(FMCV3), KCCGL_BASE + (2 * 13) + KCCGL_OFFSET, 100.0)
        Toast("Kortz Center Cracker", "Horse cut")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function CutCoquard()
    if isKortzHeistActive() then
        ScriptLocal.SetFloat(J(FMCV3), KCCGL_BASE + (3 * 13) + KCCGL_OFFSET, 100.0)
        Toast("Kortz Center Cracker", "Coquard Carcanet cut")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function CutMemento()
    if isKortzHeistActive() then
        ScriptLocal.SetFloat(J(FMCV3), KCCGL_BASE + (4 * 13) + KCCGL_OFFSET, 100.0)
        Toast("Kortz Center Cracker", "Memento Non Mori cut")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzCutAllGlass()
    if isKortzHeistActive() then
        for i = 0, 4 do
            ScriptLocal.SetFloat(J(FMCV3), KCCGL_BASE + (i * 13) + KCCGL_OFFSET, 100.0)
        end
        Toast("Kortz Center Cracker", "All glass cases cut")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzTakePrimary()
    if isKortzHeistActive() then
        ScriptLocal.SetInt(J(FMCV3), KCPT_STATE, 15)
        ScriptLocal.SetInt(J(FMCV3), KCPT_STATE, 17)
        Natives.InvokeBool(N.SET_CONTROL_VALUE_NEXT_FRAME, 0, 237, 1.0)
        Toast("Kortz Center Cracker", "Primary target acquired")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

local function KortzTakeSecondary()
    if isKortzHeistActive() then
        ScriptLocal.SetInt(J(FMCV3), KCST_STATE, 3)
        Natives.InvokeBool(N.SET_CONTROL_VALUE_NEXT_FRAME, 0, 219, 1.0)
        Toast("Kortz Center Cracker", "Secondary target secured")
    else
        Toast("Kortz Center Cracker", "Heist not active")
    end
end

-- Auto hack loop
Script.RegisterLooped(function()
    Script.Yield()
    if not IsSessionStarted()
        or IsScriptRunning("maintransition") then
        return
    end

    local heistActive = isKortzHeistActive()

    if not heistActive and heistWasActive then
        dataCrackTriggered = false
        fingerprintTriggered = false
        vaultDoorTriggered = false
        heistWasActive = false
        Script.Yield(500)
        return
    end

    heistWasActive = heistActive

    if not heistActive or not autoHacks then
        Script.Yield(500)
        return
    end

    if not dataCrackTriggered then
        local isActive = false
        for b = 0, 7 do
            if ScriptLocal.GetInt(J(FMCV3), KCDCL + 1 + (b * 4)) == 0 then
                isActive = true
                break
            end
        end
        if isActive then
            for b = 0, 7 do
                ScriptLocal.SetInt(J(FMCV3), KCDCL + 1 + (b * 4), 1)
            end
            ScriptLocal.SetInt(J(FMCV3), KCDCL, 1)
            dataCrackTriggered = true
            Toast("Kortz Center Cracker", "Auto: Data crack bypassed")
            Script.Yield(1000)
            return
        end
    end

    if not fingerprintTriggered then
        local val = ScriptLocal.GetInt(J(FMCV3), KCFHL)
        if val ~= nil and val >= 0 and val <= 4 then
            ScriptLocal.SetInt(J(FMCV3), KCFHL, 5)
            fingerprintTriggered = true
            Toast("Kortz Center Cracker", "Auto: Fingerprint bypassed")
            Script.Yield(1000)
            return
        end
    end

    if not vaultDoorTriggered then
        local val = ScriptLocal.GetInt(J(FMCV3), KCVLL)
        if val ~= nil and val >= 0 and val <= 4 then
            ScriptLocal.SetInt(J(FMCV3), KCVLL, 5)
            vaultDoorTriggered = true
            Toast("Kortz Center Cracker", "Auto: Vault door bypassed")
            Script.Yield(1000)
            return
        end
    end

    Script.Yield(100)
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
            Toast("Kortz Center Heist", "Payout set to $" .. string.format("%.0f", newPayout))
        end
        if ImGui.Button("Apply Custom Value") then
            if payoutCustomValues[targetIdx] > 0 then
                setPayout(targetIdx - 1, payoutCustomValues[targetIdx])
                KortzReloadBoard()
                Toast("Kortz Center Heist", "Payout set to $" .. string.format("%.0f", payoutCustomValues[targetIdx]))
            end
        end
        if ImGui.Button("Reset This Target") then
            setPayout(targetIdx - 1, targetBasePayouts[targetIdx])
            KortzReloadBoard()
            payoutModifiers[targetIdx] = 1.0
            payoutCustomValues[targetIdx] = 0
            Toast("Kortz Center Heist", "Payout reset to base")
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
            Toast("Kortz Center Heist", "Bag size must be 0-10000.")
        else
            ScriptGlobal.SetInt(KCBGL, bagSizeValue)
            Toast("Kortz Center Heist", "Bag capacity set to " .. bagSizeValue)
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
            Toast("Kortz Center Heist", "Lives must be at least 1.")
        elseif livesValue > 999999 then
            Toast("Kortz Center Heist", "Lives value too high.")
        elseif not IsScriptRunning(FMCV3) then
            Toast("Kortz Center Heist", "Mission script not active.")
        else
            ScriptLocal.SetInt(J(FMCV3), KCLIVESL, livesValue)
            Toast("Kortz Center Heist", "Team lives set to " .. livesValue)
        end
    end
end)
KortzCenterHeistMenu:Box("Weekly Multiplier")
KortzCenterHeistMenu:Custom(function()
    ImGui.Text("Weekly Bonus Multiplier:")
    weeklyMultiplierValue, __ = ImGui.InputFloat("##WeeklyMultiplier", weeklyMultiplierValue)
    if ImGui.Button("Set Weekly Multiplier") then
        ScriptGlobal.SetFloat(KCWMG, weeklyMultiplierValue)
        Toast("Kortz Center Heist", "Weekly multiplier set to " .. weeklyMultiplierValue .. "x")
    end
end)
KortzCenterHeistMenu:Box("Difficulty")
KortzCenterHeistMenu:Custom(function()
    local hard_stat = GetStatInt(MPX() .. "K26_GENERAL_BS")
    local hard_active = (hard_stat & (1 << 28)) ~= 0
    if hard_active then
        ImGui.TextColored(1.0, 0.3, 0.3, 1.0, "HARD MODE: ACTIVE")
    else
        ImGui.TextColored(0.0, 1.0, 0.0, 1.0, "NORMAL MODE: ACTIVE")
    end

    if ImGui.Button("Hard Mode") then
        Stats.SetInt(J(MPX() .. "K26_GENERAL_BS"), GetStatInt(MPX() .. "K26_GENERAL_BS") | (1 << 28))
        KortzReloadBoard()
        Toast("Kortz Center Heist", "Hard Mode enabled")
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Enable Hard Mode")
    end
    ImGui.SameLine()
    if ImGui.Button("Normal Mode") then
        Stats.SetInt(J(MPX() .. "K26_GENERAL_BS"), GetStatInt(MPX() .. "K26_GENERAL_BS") & ~(1 << 28))
        KortzReloadBoard()
        Toast("Kortz Center Heist", "Normal Mode enabled")
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
        Stats.SetInt(J(MPX() .. "K26_TARGETS_OWNED_BS"), -1)
        Toast("Kortz Center Heist", "All paintings unlocked")
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

    local scope_current = GetStatInt(MPX() .. "K26_ROBBERY_PROG")
    local scope_done = (scope_current & 1) ~= 0
    local scope_idx = scope_done and 1 or 0
    local scope_new, scope_changed = ImGui.Combo("Scope Out Kortz Center", scope_idx, { "Not Done", "Done" }, 2)
    if scope_changed then
        if scope_new == 1 then
            Stats.SetInt(J(MPX() .. "K26_ROBBERY_PROG"), scope_current | 1)
            Stats.SetInt(J(MPX() .. "K26_SCOPING_BS"), -1)
            Stats.SetInt(J(MPX() .. "K26_POI_BS"), -1)
            Toast("Kortz Center Heist", "Scope Out completed")
        else
            Stats.SetInt(J(MPX() .. "K26_ROBBERY_PROG"), scope_current & ~1)
            Toast("Kortz Center Heist", "Scope Out undone")
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

    local poi_current = GetStatInt(MPX() .. "K26_POI_BS")
    local poi_idx = (poi_current == -1) and 1 or 0
    local poi_new, poi_changed = ImGui.Combo("Points of Interest Scoped", poi_idx, { "Not Done", "Done" }, 2)
    if poi_changed then
        Stats.SetInt(J(MPX() .. "K26_POI_BS"), poi_new == 1 and -1 or 0)
        Toast("Kortz Center Heist", poi_new == 1 and "POI scoped" or "POI unscoped")
    end

    -- SECONDARY TARGETS

    local scop_current = GetStatInt(MPX() .. "K26_SCOPING_BS")
    local scop_idx = (scop_current == -1) and 1 or 0
    local scop_new, scop_changed = ImGui.Combo("All Secondary Targets Scoped", scop_idx, { "Not Done", "Done" }, 2)
    if scop_changed then
        Stats.SetInt(J(MPX() .. "K26_SCOPING_BS"), scop_new == 1 and -1 or 0)
        Toast("Kortz Center Heist", scop_new == 1 and "Secondary targets scoped" or "Secondary targets unscoped")
    end

    -- QUICK ACTIONS
end)
KortzCenterHeistMenu:Box("Quick Actions")
KortzCenterHeistMenu:Custom(function()
    RainbowInfo("Complete all selections or reset to just show selected target.")

    if ImGui.Button("Complete All Selections") then
        local general_bits = -1
        general_bits = general_bits & ~(1 << 28)
        Stats.SetInt(J(MPX() .. "K26_GENERAL_BS"), general_bits)
        Stats.SetInt(J(MPX() .. "K26_ROBBERY_PROG"), 65535)
        Stats.SetInt(J(MPX() .. "K26_SCOPING_BS"), -1)
        Stats.SetInt(J(MPX() .. "K26_POI_BS"), -1)
        Stats.SetInt(J(MPX() .. "K26_HEIST_TARGET"), k26_heist_target)
        KortzReloadBoard()
        Toast("Kortz Center Heist", "All selections completed in Normal Mode")
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Complete ALL dropdown selections.\nKeeps Normal Mode active (Hard Mode NOT enabled).")
    end


    if ImGui.Button("Reset (Keep Target Only)") then
        Stats.SetInt(J(MPX() .. "K26_ROBBERY_PROG"), 1)
        Stats.SetInt(J(MPX() .. "K26_SCOPING_BS"), -1)
        Stats.SetInt(J(MPX() .. "K26_POI_BS"), -1)
        Stats.SetInt(J(MPX() .. "K26_GENERAL_BS"), 0)
        Stats.SetInt(J(MPX() .. "K26_HEIST_TARGET"), k26_heist_target)
        KortzReloadBoard()
        Toast("Kortz Center Heist", "Reset done, target kept: " .. targetShortNames[k26_heist_target + 1])
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
        Toast("Kortz Center Heist", "Cutscene skipped")
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
        local progress = ScriptLocal.GetFloat(J(FMCV3), KCCGL_BASE + (i * 13) + KCCGL_OFFSET)
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
-- Flash Ops
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
SN_Agency:Box("Misc")
local agencySafe = SN_Agency:Toggle("Agency Safe Loop")
Script.RegisterLooped(function()
    Script.Yield()
    if agencySafe:IsToggled() == true then
        Stats.SetInt(J(MPX() .. "FIXER_COUNT"), 500)
        Stats.SetInt(J(MPX() .. "FIXER_PASSIVE_PAY_TIME_LEFT"), -1)
        Script.Yield(1000)
    else
        Script.Yield(500)
    end
end)
SN_Agency:Box("Preps")
SN_Agency:Custom(function()
    ImGui.Text("Contract:")
    local nSelected, clicked = ImGui.Combo("##AgencyContract", sContract, contractNames, #contractNames)
    if clicked then
        sContract = nSelected
        local contractD = AgencyContracts[sContract + 1]
        local contractId = contractD.index

        Stats.SetInt(J(MPX() .. "FIXER_STORY_BS"), contractId)
        if contractId < 18 then
            Stats.SetInt(J(MPX() .. "FIXER_STORY_STRAND"), 0)
        elseif contractId < 128 then
            Stats.SetInt(J(MPX() .. "FIXER_STORY_STRAND"), 1)
        elseif contractId < 2044 then
            Stats.SetInt(J(MPX() .. "FIXER_STORY_STRAND"), 2)
        else
            Stats.SetInt(J(MPX() .. "FIXER_STORY_STRAND"), -1)
        end
    end
end)

SN_Agency:Button("Complete Preps", function()
    Stats.SetInt(J(MPX() .. "FIXER_GENERAL_BS"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_COMPLETED_BS"), -1)
    Stats.SetInt(J(MPX() .. "FIXER_STORY_COOLDOWN"), -1)
    Toast("Agency", "Preps should've been completed")
end)
SN_Agency:Box("Payout")
local agencyPayout = SN_Agency:InputInt("Payout")
SN_Agency:Button("Max", function()
    agencyPayout:SetIntValue(2500000)
    Toast("Agency", "Payout should've been maximized. Don't forget to apply")
end)
SN_Agency:Button("Apply Payout", function()
    local payout = agencyPayout:GetIntValue()
    SetTunableInt("FIXER_FINALE_LEADER_CASH_REWARD", payout)
    Toast("Agency", "Payout should've been applied")
end)
SN_Agency:Text("Use 'Apply Payout' after you can see the minimap.")
SN_Agency:Box("Misc")
SN_Agency:Button("Instant Finish", function()
    ScriptLocal.SetInt(J(FMC2020), AGFl1, 51338752)
    ScriptLocal.SetInt(J(FMC2020), AGFl2, 50)
    Toast("Agency", "Heist should've been finished")
end)
SN_Agency:Button("Skip Cutscene", SkipCutscene)
SN_Agency:Button("Kill Cooldowns", function()
    SetTunableInt("FIXER_STORY_COOLDOWN_POSIX", 0)
    SetTunableInt("FIXER_SECURITY_CONTRACT_COOLDOWN_TIME", 0)
    SetTunableInt("REQUEST_FRANKLIN_PAYPHONE_HIT_COOLDOWN", 0)
    Stats.SetInt(J(MPX() .. "FIXER_STORY_COOLDOWN"), -1)
    Toast("Agency", "Cooldowns should've been killed")
end)
SN_Agency:Box("Preps")
SN_Agency:Text("After all choices and pressing Complete Preps, wait for some time")

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
    Stats.SetInt(J(MPX() .. "TUNER_CURRENT"), contract)
    Stats.SetInt(J(MPX() .. "TUNER_GEN_BS"), (contract == 1 and 4351 or 12543))
    ScriptLocal.SetInt(J(TUNERPL), ASRBl, 2)
    Toast("Autoshop", "Preps should've been completed")
end)
SN_Autoshop:Button("Reset Preps", function()
    Stats.SetInt(J(MPX() .. "TUNER_GEN_BS"), 12467)
    ScriptLocal.SetInt(J(TUNERPL), ASRBl, 2)
    Toast("Autoshop", "Preps should've been reset")
end)
SN_Autoshop:Button("Redraw Board", function()
    ScriptLocal.SetInt(J(TUNERPL), ASRBl, 2)
    Toast("Autoshop", "Board should've been redrawn")
end)
SN_Autoshop:Box("Payout")
local autoPayout = SN_Autoshop:InputInt("Payout")
SN_Autoshop:Button("Max", function()
    autoPayout:SetIntValue(2000000)
    Toast("Autoshop", "Payout should've been maximized. Don't forget to apply")
end)
SN_Autoshop:Button("Apply Payout", function()
    local payout = autoPayout:GetIntValue()
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD0", payout)
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD1", payout)
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD2", payout)
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD3", payout)
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD4", payout)
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD5", payout)
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD6", payout)
    SetTunableInt("TUNER_ROBBERY_LEADER_CASH_REWARD7", payout)
    SetTunableFloat("TUNER_ROBBERY_CONTACT_FEE", 0.0)
    Toast("Autoshop", "Payout should've been applied")
end)
SN_Autoshop:Text("Use 'Apply Payout' after you can see the minimap.")
SN_Autoshop:Box("Misc")
SN_Autoshop:Button("Instant Finish", function()
    ScriptLocal.SetInt(J(FMC2020), ASIFl1, 51338977)
    ScriptLocal.SetInt(J(FMC2020), ASIFl2, 101)
    Toast("Autoshop", "Heist should've been finished")
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
        Script.QueueJob(function()
            Stats.SetInt(J(MPX() .. "SALV23_INST_PROG"), cluckperps[cluckprepIndex + 1].id)
        end)
    end

    if ImGui.Button("Reset Preps") then
        Script.QueueJob(function()
            Stats.SetInt(J(MPX() .. "SALV23_INST_PROG"), 0)
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
        Natives.InvokeVoid(N.SET_PACKED_STAT_BOOL_CODE, id, value, CharSlot())
    end
end

local function guzmanGetBool(list)
    return Natives.InvokeBool(N.GET_PACKED_STAT_BOOL_CODE, list[1], CharSlot())
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
    Stats.SetInt(J(MPX() .. "HACKER24_INST_BS"), GuzmanStages[guzmanStageIndex + 1].index)
    Toast("Guzman Flies", "Preps should've been completed")
end)
SN_Guzman:Button("Reset Preps", function()
    Stats.SetInt(J(MPX() .. "HACKER24_INST_BS"), 0)
    Toast("Guzman Flies", "Preps should've been reset")
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
    Toast("Guzman Flies", "All options should've been enabled")
end)
SN_Guzman:Button("Disable All Options", function()
    for _, list in pairs(GuzmanBools) do
        guzmanSetBools(list, false)
    end
    Toast("Guzman Flies", "All options should've been disabled")
end)

SN_Guzman:Box("Teleport")
SN_Guzman:Button("Teleport to Entrance", function()
    Script.QueueJob(function()
        local blip = Natives.InvokeInt(N.GET_FIRST_BLIP_INFO_ID, 903) -- McKenzie Field Hangar
        if Natives.InvokeBool(N.DOES_BLIP_EXIST, blip) then
            selfTP(true, false, V3.New(Natives.InvokeV3(N.GET_BLIP_COORDS, blip)))
        else
            Toast("Guzman Flies", "Field Hangar blip not found")
        end
    end)
end)
SN_Guzman:Button("Teleport to Laptop", function()
    selfTP(false, true, { x = 2147.685, y = 4785.257, z = -46.374 }, 270.519)
end)

SN_Guzman:Box("Misc")
SN_Guzman:Button("Instant Finish", function()
    Script.QueueJob(function()
        ScriptLocal.SetInt(J(FMC2020), 56070 + 1589, 5)
        ScriptLocal.SetInt(J(FMC2020), 56070 + 1776 + 1, 999999)
        local v = ScriptLocal.GetInt(J(FMC2020), 56070 + 1)
        v = v | (1 << 9) | (1 << 16)
        ScriptLocal.SetInt(J(FMC2020), 56070 + 1, v)
        Toast("Guzman Flies", "Heist should've been finished")
    end)
end)
SN_Guzman:Button("Skip Cutscene", SkipCutscene)
SN_Guzman:Button("Kill Cooldown", function()
    Stats.SetInt(J(MPX() .. "HACKER24_MFM_COOLDOWN"), -1)
    Toast("Guzman Flies", "Cooldown should've been killed")
end)
SN_Guzman:Text("Use 'Instant Finish' after you can see the minimap.")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Heist Teleports (arcade, casino, robberies) --
end)

Section("Teleports", function()
HeistTeleportsMenu = HeistsDataEditorMenu:Tab("Teleports")

local function TP_BlipOrFixed(blipId, fx, fy, fz, keepVehicle)
    Script.QueueJob(function()
        local blip = Natives.InvokeInt(N.GET_FIRST_BLIP_INFO_ID, blipId)
        if blip ~= 0 and Natives.InvokeBool(N.DOES_BLIP_EXIST, blip) then
            local p = V3.New(Natives.InvokeV3(N.GET_BLIP_COORDS, blip))
            selfTP(keepVehicle or false, false, p)
        else
            selfTP(keepVehicle or false, false, V3.New(fx, fy, fz))
        end
    end)
end

local function TP_Fixed(fx, fy, fz, keepVehicle)
    Script.QueueJob(function()
        selfTP(keepVehicle or false, false, V3.New(fx, fy, fz))
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

Section("Missions", function()
MissionsSelectorAndCooldownMenu = Menu:Tab("Missions"):RequireOnline()

MissionsSelectorAndCooldownMenu:Box("Missions")
MissionsSelectorAndCooldownMenu:Button("Remove Dax Fooligan Missions Cooldown", function()
    Stats.SetInt(J(MPX() .. "XM22JUGGALOWORKCDTIMER"), -1)
end)

MissionsSelectorAndCooldownMenu:Button("Remove VIP/MC Cooldown", function()
    Stats.SetInt(J("MPPLY_VIPGAMEPLAYDISABLEDTIMER"), 0)
end)

MissionsSelectorAndCooldownMenu:Button("Skip Yacht Missions", function()
    Stats.SetInt(J(MPX() .. "YACHT_MISSION_PROG"), 0)
    Stats.SetInt(J(MPX() .. "YACHT_MISSION_FLOW"), 21845)
    Stats.SetInt(J(MPX() .. "CASINO_DECORATION_GIFT_1"), -1)
end)

MissionsSelectorAndCooldownMenu:Button("LSA Operations Instant-Finish", function()
    ScriptLocal.SetInt(J(SMUGOPS), LSAIFl1, 1)
    ScriptLocal.SetInt(J(SMUGOPS), LSAIFl2, -2145370496)
    Toast("LSA Operations", "Mission should've been finished")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Section("Settings", function()
SettingsMenu = Menu:Tab("Settings")
SettingsMain = SettingsMenu:Tab("Main")
SettingsMain:Box("Ultimate Menu")
SettingsMain:Text("Ultimate Menu 1.73 Legacy")
SettingsMain:Text("Cherax Beta")
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
CreditsMenu:Text("https://www.unknowncheats.me/forum/grand-theft-auto-v")
CreditsMenu:Text("/591335-yimceo-ceo-crates-method-yimmenu.html")
end)

Section("Credits: Alestarov", function()
CreditsMenu:Box("Alestarov")
CreditsMenu:Text("Source:")
CreditsMenu:Text("https://github.com/YimMenu-Lua/Alestarov-Menu")
end)

Section("Credits: You", function()
CreditsMenu:Box("And You <3")
CreditsMenu:Text(
    "Yes You Without You Or Your PRs and support You Give Me This Script Would Be Nothing Fr"
)
CreditsMenu:Text("So Big Thanks To You All")
CreditsMenu:Text("You can report Bugs And Make PRs With Features Down Bellow:")
CreditsMenu:Text("https://github.com/UltimateMenu/UltimateMenu/issues")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end)

Menu:MoveTabAfter("Heists", "Recovery")

Section("Settings Tabs", function()
SettingsTabs = SettingsMenu:Tab("Tabs")
SettingsTabs:Box("Hidden Tabs")
for _, tab in ipairs(Menu.tabs) do
    if tab ~= SettingsMenu then
        -- Saved with the Cherax settings, unlike the rest of the menu's features.
        tab.hideToggle = SettingsTabs:Toggle("Hide " .. tab.title, "Hides the " .. tab.title .. " tab."):SetSaveable(true)
    end
end
end)
