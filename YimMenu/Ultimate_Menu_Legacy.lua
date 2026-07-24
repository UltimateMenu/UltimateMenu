--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Globals & Locals & Variables--

FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
CSg1 = 1575046 -- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false); in freemode.c
CSg2 = 1574589 -- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE in freemode.c
CSg3 = 1574589 + 2 -- change session (quit) 3 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE in freemode.c

-- Apartment Heist
ACg1 = 1935929 + 1 + 1 -- global apartment player 1 cut global ("fmmc_launcher")
ACg2 = 1935929 + 1 + 2 -- global apartment player 2 cut global ("fmmc_launcher")
ACg3 = 1935929 + 1 + 3 -- global apartment player 3 cut global ("fmmc_launcher")
ACg4 = 1935929 + 1 + 4 -- global apartment player 4 cut global ("fmmc_launcher")
ACg5 = 1937897 + 3008 + 1 -- local apartment player 1 cut global ("fmmc_launcher")
AUAJg1 = FMg + 9184 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9189 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9196 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9202 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9208 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl1 = 19808 -- apartment instant finish local 1
AIFl2 = 19808 + 1062 -- apartment instant finish local 2
AIFl3 = 19808 + 1740 + 1 -- apartment instant finish local 3 
AIFl4 = 19808 + 2686 -- apartment instant finish local 4 
AIFl5 = 28722 + 1 -- apartment instant finish local 5
AIFl6 = 31981 + 1 + 68 -- apartment instant finish local 6
AFHl = 11837 + 24 -- apartment fleeca hack local
AFDl = 10125 + 11 -- apartment fleeca drill local
AFPl = 9831 -- apartment pacific hack local
AHSo = 19808 + 2  -- Apartment heist skip checkpoint
ACDg = 2686119 -- apartment cooldown global

-- Diamond Casino Heist
DCRBl = 217 -- diamond casino reload board local
DCCg1 = 1972483 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global ("gb_casino_heist_planning")
DCCg2 = 1972483 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global ("gb_casino_heist_planning")
DCCg3 = 1972483 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global ("gb_casino_heist_planning")
DCCg4 = 1972483 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global ("gb_casino_heist_planning")
DCAg = 10311 -- casino autograbber local 1
DCAs = 10311 + 14 -- casino autograbber local 2
DCFHl = 54118 -- diamond casino fingerprint hack local
DCKHl = 55188 -- diamond casino keypad hack local
DCDVDl1 = 10125 + 7 -- diamond casino drill vault door local 1 --("DLC_HEIST_MINIGAME_FLEECA_DRILLING_SCENE") in ("fm_mission_controller")
DCDVDl2 = 10125 + 37 -- diamond casino drill vault door local 2 --("fm_mission_controller")
DCXf1 = 19808
DCXf2 = 19808 + 1062
DCXf3 = 19808 + 1740 + 1
DCXf4 = 19808 + 2686
DCXf5 = 28722 + 1
DCXf6 = 31981 + 1 + 68

-- Cayo Perico Heist
CPRSl = 1578 -- cayo perico reload screen local
CPCg1 = 1980404 + 831 + 56 + 1 -- cayo perico player 1 cut global --("heist_island_planning")
CPCg2 = 1980404 + 831 + 56 + 2 -- cayo perico player 2 cut global --("heist_island_planning")
CPCg3 = 1980404 + 831 + 56 + 3 -- cayo perico player 3 cut global --("heist_island_planning")
CPCg4 = 1980404 + 831 + 56 + 4 -- cayo perico player 4 cut global --("heist_island_planning")
CPFHl = 26217 -- cayo perico fingerprint hack local ("heist") in ("fm_mission_controller_2020")
CPPCCl = 32349 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") in ("fm_mission_controller_2020")
CPSTCl = 31109 -- cayo perico drainage pipe cut local ("IntroFinished") in ("fm_mission_controller_2020")
CPXf1 = 56070 -- cayo perico instant finish local 1
CPXf2 = 56070 + 1776 + 1 -- cayo perico instant finish local 2

-- Doomsday Heist
DDSHl = 1312 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1968511 + 812 + 50 + 1 -- doomsday player 1 cut global --("gb_gang_ops_planning")
DCg2 = 1968511 + 812 + 50 + 2 -- doomsday player 2 cut global --("gb_gang_ops_planning")
DCg3 = 1968511 + 812 + 50 + 3 -- doomsday player 3 cut global --("gb_gang_ops_planning")
DCg4 = 1968511 + 812 + 50 + 4 -- doomsday player 4 cut global --("gb_gang_ops_planning")
GCg = 2686119 + 6791 -- global cut global (value2 = value2 * (num / 100f);)
DDIF1 = 19808 -- doomsday instant finish local 1
DDIF2 = 19808 + 1740 + 1 -- doomsday instant finish local 2
DDIF3 = 28722 + 1 -- doomsday instant finish local 3
DDIF4 = 31981 + 1 + 68 -- doomsday instant finish local 4
DDIF5 = 31981 + 97 -- doomsday instant finish local 5

-- Agency Variables
AGFl1 = 56070 + 1
AGFl2 = 56070 + 1776 + 1

-- Auto Shop variables
ASIFl1 = 56070 + 1 -- auto shop instant finish local 1 
ASIFl2 = 56070 + 1776 + 1 -- auto shop finish local 2 
ASRBl = 416 -- auto shop reload board local 

-- Salvage Yard
SYRl1 = 545 -- salvage yard reload board local

-- Heists Meta
HGLs1 = 4718592 + 3769
HGLs2 = 4718592 + 3772
HGLs3 = 4718592 + 3773
HGLs4 = 4718592 + 190163 + 1
HGGs1 = 20194 + 34
HGGs2 = 20194 + 15

IHPB = 56070 --Instant Heist Passed Local Base (Casino And CayoPerico)
IHPL = 56070 + 1776 + 1 --Instant Heist Passed Locals (Casino And CayoPerico)

NLCl = 213 + 32 + 19 + 1 --("nightclub_office_cutscene") in ("am_mp_nightclub")

SNOW = FMg + 4413
halloweatherAddress = FMg + 32246

--GUN VAN VARIABLES-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GVADg = FMg + 33392
GVWDg = FMg + 33373
GVTDg = FMg + 33384

--CCBL = Casino Chips Buy Limit-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CCBL0 = FMg + 26623
CCBL1 = FMg + 26624

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1 = FMg + 29300

--PSV=Panther Statue-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PSV = FMg + 29552

--PDIAMOND=Pink Diamond---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PDIAMOND = FMg + 29550

--BB=Bearer Bonds---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BB = FMg + 29549

--RN=Ruby Necklace--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN = FMg + 29548

--TEQUILA=Tequila---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TEQUILA = FMg + 29547

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function MPX()
	local PI = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PI == 1 then
		return "MP1_"
	end
	return "MP0_"
end

local function SkipCutscene()
    script.run_in_fiber(function(script)
        if CUTSCENE.IS_CUTSCENE_PLAYING() then
            CUTSCENE.STOP_CUTSCENE_IMMEDIATELY()
            script:sleep(100)
            CUTSCENE.REMOVE_CUTSCENE()
        end
    end)
end

local function SPX()
	local player_ped = PLAYER.PLAYER_PED_ID()
	if player_ped == 0 then return "SP0_" end
	local PI = ENTITY.GET_ENTITY_MODEL(player_ped)
	if PI == joaat("Player_One") then
		return "SP1_"
	elseif PI == joaat("Player_Two") then
		return "SP2_"
	end
	return "SP0_"
end

local bypassOnlineCheckbox = nil

local function checkOnline()
	if bypassOnlineCheckbox and bypassOnlineCheckbox:is_enabled() then
		return false
	end
	if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 or not ENTITY.DOES_ENTITY_EXIST(PLAYER.PLAYER_PED_ID()) then
		ImGui.Text("Waiting for game...")
		return true
	end
	if not network.is_session_started() then
		ImGui.Text("\nUnavailable in Single Player.\n\n")
		return true
	end
	return false
end

local function checkStoryMode()
	if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 or not ENTITY.DOES_ENTITY_EXIST(PLAYER.PLAYER_PED_ID()) then
		ImGui.Text("Waiting for game...")
		return true
	end
	if network.is_session_started() then
		ImGui.Text("\nUnavailable in MultiPlayer.\n\n")
		return true
	end
	return false
end

-- Silent offline check: returns true if offline, but shows NO text
local function isOffline()
	if bypassOnlineCheckbox and bypassOnlineCheckbox:is_enabled() then
		return false
	end
	if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 or not ENTITY.DOES_ENTITY_EXIST(PLAYER.PLAYER_PED_ID()) then
		return true
	end
	if not network.is_session_started() then
		return true
	end
	return false
end

-- Shared guard: ensures exactly ONE warning callback per tab
local online_guards = {}
local function ensureOnlineGuard(tab)
	if not online_guards[tab] then
		online_guards[tab] = true
		tab:add_imgui(function()
			checkOnline() -- only this one shows the warning text
		end)
	end
end

-- Story Mode widget system
local story_widgets = {}
local story_initialized = {}

local function initStoryTab(tab)
    if not story_initialized[tab] then
        story_initialized[tab] = true
        story_widgets[tab] = {}
        tab:add_imgui(function()
            -- Only call checkStoryMode() once here
            if checkStoryMode() then return end
            for _, widget in ipairs(story_widgets[tab]) do
                if widget.type == "button" then
                    if ImGui.Button(widget.label) then
                        widget.callback()
                    end
                elseif widget.type == "sameline" then
                    ImGui.SameLine()
                elseif widget.type == "separator" then
                    ImGui.Separator()
                elseif widget.type == "text" then
                    ImGui.Text(widget.label)
                elseif widget.type == "checkbox" then
                    local changed
                    widget.state, changed = ImGui.Checkbox(widget.label, widget.state)
                elseif widget.type == "input_int" then
                    widget.value, _ = ImGui.InputInt(widget.label, widget.value)
                end
            end
        end)
    end
end

local function addStoryButton(tab, label, callback)
    initStoryTab(tab)
    table.insert(story_widgets[tab], { type = "button", label = label, callback = callback })
end

local function addStorySameline(tab)
    initStoryTab(tab)
    table.insert(story_widgets[tab], { type = "sameline" })
end

local function addStorySeparator(tab)
    initStoryTab(tab)
    table.insert(story_widgets[tab], { type = "separator" })
end

local function addStoryText(tab, label)
    initStoryTab(tab)
    table.insert(story_widgets[tab], { type = "text", label = label })
end

local function addStoryCheckbox(tab, label, default_value)
    initStoryTab(tab)
    local checkbox_obj = {
        type = "checkbox",
        label = label,
        state = default_value or false,
        is_enabled = function(self)
            return self.state
        end,
        set_enabled = function(self, val)
            self.state = val
        end
    }
    table.insert(story_widgets[tab], checkbox_obj)
    return checkbox_obj
end

local function addStoryInputInt(tab, label, default_value)
    initStoryTab(tab)
    local input_obj = {
        type = "input_int",
        label = label,
        value = default_value or 0,
        get_value = function(self)
            return self.value
        end,
        set_value = function(self, val)
            self.value = val
        end
    }
    table.insert(story_widgets[tab], input_obj)
    return input_obj
end

local function makeStoryTab(tab)
    local wrapped = {}
    
    function wrapped:add_tab(name)
        return makeStoryTab(tab:add_tab(name))
    end
    
    function wrapped:add_button(label, callback)
        addStoryButton(tab, label, callback)
    end
    
    function wrapped:add_checkbox(label, default_value)
        return addStoryCheckbox(tab, label, default_value)
    end
    
    function wrapped:add_input_int(label, default_value)
        return addStoryInputInt(tab, label, default_value)
    end
    
    function wrapped:add_text(label)
        addStoryText(tab, label)
    end
    
    function wrapped:add_separator()
        addStorySeparator(tab)
    end
    
    function wrapped:add_sameline()
        addStorySameline(tab)
    end
    
    function wrapped:add_imgui(callback)
        tab:add_imgui(function()
            if checkStoryMode() then return end
            callback()
        end)
    end
    
    return wrapped
end

local online_widgets = {}

local function initOnlineTab(tab)
	if not online_widgets[tab] then
		online_widgets[tab] = {}
		ensureOnlineGuard(tab) -- shared guard shows the warning
		tab:add_imgui(function()
			if isOffline() then return end -- silent check, no duplicate text
			for _, widget in ipairs(online_widgets[tab]) do
				if widget.type == "button" then
					if ImGui.Button(widget.label) then
						widget.callback()
					end
				elseif widget.type == "sameline" then
					ImGui.SameLine()
				elseif widget.type == "separator" then
					ImGui.Separator()
				elseif widget.type == "text" then
					ImGui.Text(widget.label)
				elseif widget.type == "checkbox" then
					local changed
					widget.state, changed = ImGui.Checkbox(widget.label, widget.state)
				elseif widget.type == "input_int" then
					widget.value, _ = ImGui.InputInt(widget.label, widget.value)
				end
			end
		end)
	end
end

local function addOnlineButton(tab, label, callback)
	initOnlineTab(tab)
	table.insert(online_widgets[tab], { type = "button", label = label, callback = callback })
end

local function addOnlineSameline(tab)
	initOnlineTab(tab)
	table.insert(online_widgets[tab], { type = "sameline" })
end

local function addOnlineSeparator(tab)
	initOnlineTab(tab)
	table.insert(online_widgets[tab], { type = "separator" })
end

local function addOnlineText(tab, label)
	initOnlineTab(tab)
	table.insert(online_widgets[tab], { type = "text", label = label })
end

local function addOnlineCheckbox(tab, label, default_value)
	initOnlineTab(tab)
	local checkbox_obj = {
		type = "checkbox",
		label = label,
		state = default_value or false,
		is_enabled = function(self)
			return self.state
		end,
		set_enabled = function(self, val)
			self.state = val
		end
	}
	table.insert(online_widgets[tab], checkbox_obj)
	return checkbox_obj
end

local function addOnlineInputInt(tab, label, default_value)
	initOnlineTab(tab)
	local input_obj = {
		type = "input_int",
		label = label,
		value = default_value or 0,
		get_value = function(self)
			return self.value
		end,
		set_value = function(self, val)
			self.value = val
		end
	}
	table.insert(online_widgets[tab], input_obj)
	return input_obj
end

local function makeOnlineTab(tab)
	local wrapped = {}
	
	function wrapped:add_tab(name)
		return makeOnlineTab(tab:add_tab(name))
	end
	
	function wrapped:add_button(label, callback)
		addOnlineButton(tab, label, callback)
	end
	
	function wrapped:add_checkbox(label, default_value)
		return addOnlineCheckbox(tab, label, default_value)
	end
	
	function wrapped:add_input_int(label, default_value)
		return addOnlineInputInt(tab, label, default_value)
	end
	
	function wrapped:add_text(label)
		addOnlineText(tab, label)
	end
	
	function wrapped:add_separator()
		addOnlineSeparator(tab)
	end
	
	function wrapped:add_sameline()
		addOnlineSameline(tab)
	end
	
	function wrapped:add_imgui(callback)
		ensureOnlineGuard(tab) -- shared guard shows the warning
		tab:add_imgui(function()
			if isOffline() then return end -- silent check, no duplicate text
			callback()
		end)
	end
	
	return wrapped
end

local function CutsPresetter(global_start, global_finish, cut)
    globals.set_int(GCg, cut)
    for i = global_start, global_finish do
        globals.set_int(i, cut)        
    end
end

local function changeSession(session)
    script.run_in_fiber(function(script)
        globals.set_int(CSg1, session)
        if session == -1 then
            globals.set_int(CSg3, -1)
        end
        script:sleep(1000)
        globals.set_int(CSg2, 1)
        script:sleep(1000)
        globals.set_int(CSg2, 0)
    end)
end

local currentlevel = 0
local currentcrewlevel = 0

local function null() end

--Required Scripts--

FMC = "fm_mission_controller"
FMMCL = "fmmc_launcher"
FMC2020 = "fm_mission_controller_2020"
HIP = "heist_island_planning"
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG = gui.get_tab("Ultimate Menu 1.73 By L7NEG")

L7NEG:add_text("       Ultimate Menu 1.73 Legacy ")
L7NEG:add_text("                       v3")
bypassOnlineCheckbox = L7NEG:add_checkbox("Bypass Online Check")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self = makeOnlineTab(L7NEG:add_tab("Self Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AGCT = Self:add_checkbox("Unlock Gender Change")
script.register_looped("UnlockGenderChange", function(script)
	script:yield()
	if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
	if AGCT:is_enabled() then
		stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
	else
		stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
	end
end)

RTPT = Self:add_checkbox("Remove Transaction Error")
script.register_looped("RemoveTransactionError", function(script)
	script:yield()
	if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
	if RTPT:is_enabled() then
		globals.set_int(4516981, 0)
		globals.set_int(4516982, 0)
		globals.set_int(4516983, 0)
	end
end)

Self:add_button("Remove Published And Players Job Liked To You", function()
	stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", 0)
	stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", 0)
	stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 0)
	stats.set_int("MPPLY_LTS_CREATED", 0)
	stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", 0)
	stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", 0)
	stats.set_int("MPPLY_FM_MISSION_LIKES", 0)
end)

Self:add_button("Remove Orbital Cannon Cooldown", function()
	stats.set_int(MPX() .. "ORBITAL_CANNON_COOLDOWN", 0)
end)

Self:add_button("Refill Nightclub Popularity", function()
	stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_button("Refill Inventory/Armour", function()
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

Self:add_button("Refill Inv/Armour x1000", function()
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

Self:add_separator()

Self:add_text("Bad Sport!")

BadSportCombo = 0
Self:add_imgui(function()
	ImGui.PushItemWidth(140)
	BadSportCombo = ImGui.Combo("##BadSport", BadSportCombo, { "Remove", "Add" }, 2)
end)

local function BadSport(State, Overall, Bool)
	script.run_in_fiber(function(script)
		gui.show_message("Bad Sport!", "Awaiting Session Change")
		script:sleep(1000)
		stats.set_int("MPPLY_BADSPORT_MESSAGE", State)
		stats.set_int("MPPLY_BADSPORT_MESSAGE", State)
		stats.set_float("MPPLY_OVERALL_BADSPORT", Overall)
		stats.set_bool("MPPLY_CHAR_IS_BADSPORT", Bool)
		globals.set_int(CSg1, 11)
		globals.set_int(CSg2, 1)
		script:sleep(300)
		globals.set_int(CSg2, 0)
	end)
end

Self:add_sameline()

Self:add_button("Execute", function()
	if BadSportCombo == 0 then
		BadSport(0, 0, false)
	else
		BadSport(1, 3000, true)
	end
end)

StoryCharacters = makeStoryTab(L7NEG:add_tab("Story Mode"))

StoryCharacters:add_imgui(function()
	local CurrentSPMoneyValue = stats.get_int(SPX() .. "TOTAL_CASH")
	local used
	CurrentSPMoneyValue, used = ImGui.SliderInt("Current Character Cash", CurrentSPMoneyValue, 1, 2147483646)
	if used then
		stats.set_int(SPX() .. "TOTAL_CASH", CurrentSPMoneyValue)
	end
end)

StoryCharacters:add_separator()

StoryCharacters:add_button("Add 1 Mil Cash $", function()
	stats.set_int(SPX() .. "TOTAL_CASH", stats.get_int(SPX() .. "TOTAL_CASH") + 1000000)
end)

StoryCharacters:add_button("Add 10 Mil Cash $", function()
	stats.set_int(SPX() .. "TOTAL_CASH", stats.get_int(SPX() .. "TOTAL_CASH") + 10000000)
end)

StoryCharacters:add_button("Add 100 Mil Cash $", function()
	stats.set_int(SPX() .. "TOTAL_CASH", stats.get_int(SPX() .. "TOTAL_CASH") + 100000000)
end)

StoryCharacters:add_button("Add 1 Bil Cash $", function()
	stats.set_int(SPX() .. "TOTAL_CASH", stats.get_int(SPX() .. "TOTAL_CASH") + 1000000000)
end)

StoryCharacters:add_separator()

StoryCharacters:add_button("Max Current Character Skills", function()
	stats.set_int(SPX() .. "SPECIAL_ABILITY_UNLOCKED", 100)
	stats.set_float(SPX() .. "DIST_RUNNING", 175 * 100)
	stats.set_int(SPX() .. "TIME_UNDERWATER", 30 * 60 * 1000 * 100)
	stats.set_int(SPX() .. "UNARMED_HITS", 20 * 100)
	stats.set_int(SPX() .. "NUMBER_NEAR_MISS", 50 * 100)
	stats.set_int(SPX() .. "PLANE_LANDINGS", 10 * 100)
	stats.set_int(SPX() .. "KILLS_STEALTH", 2 * 100)
	stats.set_int(SPX() .. "HITS_MISSION", 40 * 100)
	stats.set_int(SPX() .. "HITS_PEDS_VEHICLES", 80 * 100)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RecoveryMenu = makeOnlineTab(L7NEG:add_tab("Recovery Menu"))

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

local function getRP(level)
	if level < #rp then
		return rp[level]
	else
		return math.floor(25 * (level ^ 2) + 23575 * level - 1023150)
	end
end

RankSetter = RecoveryMenu:add_tab("Set Rank menu")

local rpLevelValue = 1
RankSetter:add_imgui(function()
	if checkOnline() then return end

	ImGui.Text("Your current Rank is " .. stats.get_int(MPX() .. "CHAR_RANK_FM"))
	ImGui.Separator()

	rpLevelValue, _ = ImGui.InputInt("Rank", rpLevelValue)

	if ImGui.Button("Set Rank") then
		local rankValue = rpLevelValue
		if rankValue <= 0 or rankValue > 8000 then
			gui.show_message(
				"ERROR",
				"Your RP level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
			)
		else
			stats.set_int(MPX() .. "CHAR_SET_RP_GIFT_ADMIN", getRP(rankValue))
			stats.set_int("MPPLY_GLOBALXP", getRP(rankValue))
			globals.set_int(CSg1, 11)
			globals.set_int(CSg2, 1)
			globals.set_int(CSg2, 0)
			gui.show_message(
				"Rank Correction",
				"Your Rank was set to " .. rankValue .. ", Click change session For Your New Rank."
			)
		end
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CrewRankSetter = RecoveryMenu:add_tab("Set Crew Rank menu")

local crewRpLevelValue = 1
CrewRankSetter:add_imgui(function()
	if checkOnline() then return end

	ImGui.Text("Your Current Crew Rank is " .. stats.get_int("MPPLY_CURRENT_CREW_RANK"))
	ImGui.Separator()

	crewRpLevelValue, _ = ImGui.InputInt("Rank##Crew", crewRpLevelValue)

	if ImGui.Button("Set Slot 1 Crew Rank") then
		local rankValue = crewRpLevelValue
		if rankValue <= 0 or rankValue > 8000 then
			gui.show_message("ERROR", "Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000).")
		else
			stats.set_int("MPPLY_CREW_LOCAL_XP_0", getRP(rankValue))
			gui.show_message("Crew Rank Setter", "Your Crew Slot 1 Rank was set to " .. rankValue .. ", .")
		end
	end

	if ImGui.Button("Set Slot 2 Crew Rank") then
		local rankValue = crewRpLevelValue
		if rankValue <= 0 or rankValue > 8000 then
			gui.show_message("ERROR", "Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000).")
		else
			stats.set_int("MPPLY_CREW_LOCAL_XP_1", getRP(rankValue))
			gui.show_message("Crew Rank Setter", "Your Crew Slot 2 Rank was set to " .. rankValue .. ", .")
		end
	end

	if ImGui.Button("Set Slot 3 Crew Rank") then
		local rankValue = crewRpLevelValue
		if rankValue <= 0 or rankValue > 8000 then
			gui.show_message("ERROR", "Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000).")
		else
			stats.set_int("MPPLY_CREW_LOCAL_XP_2", getRP(rankValue))
			gui.show_message("Crew Rank Setter", "Your Crew Slot 3 Rank was set to " .. rankValue .. ", .")
		end
	end

	if ImGui.Button("Set Slot 4 Crew Rank") then
		local rankValue = crewRpLevelValue
		if rankValue <= 0 or rankValue > 8000 then
			gui.show_message("ERROR", "Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000).")
		else
			stats.set_int("MPPLY_CREW_LOCAL_XP_3", getRP(rankValue))
			gui.show_message("Crew Rank Setter", "Your Crew Slot 4 Rank was set to " .. rankValue .. ", .")
		end
	end

	if ImGui.Button("Set Slot 5 Crew Rank") then
		local rankValue = crewRpLevelValue
		if rankValue <= 0 or rankValue > 8000 then
			gui.show_message("ERROR", "Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000).")
		else
			stats.set_int("MPPLY_CREW_LOCAL_XP_4", getRP(rankValue))
			gui.show_message("Crew Rank Setter", "Your Crew Slot 5 Rank was set to " .. rankValue .. ", .")
		end
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SkillsMenu = RecoveryMenu:add_tab("Skills Menu")

SkillsMenu:add_button("Max Current Skills", function()
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
    gui.show_message("Skills", "Skills should've been maximized")
end)

SkillsMenu:add_button("Reset Skills", function()
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 0)
    stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

OnlineServicesMenu = L7NEG:add_tab("Online Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoServicesMenu = makeOnlineTab(OnlineServicesMenu:add_tab("Casino Services Menu"))

ensureOnlineGuard(CasinoServicesMenu)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local cslots = "casino_slots"
slots_random_results_table = 1379
prize_wheel_win_state = 309
prize_wheel_prize = 14
prize_wheel_prize_state = 45

CasinoServicesMenu:add_text("Casino Chips")
chipsVal = 1800
CasinoServicesMenu:add_imgui(function()
	if isOffline() then return end
	chipsVal, used = ImGui.SliderInt("Casino Chips Buy Limit", chipsVal, 1800, 2147483647)
	if used then
		globals.set_int(CCBL0, chipsVal)
		globals.set_int(CCBL1, chipsVal)
	end
end)

CasinoServicesMenu:add_button("Bypass Casino Cooldown", function()
	stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
	stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
	stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_SOLD", 0)
	stats.set_int("MPPLY_CASINO_CHIPS_SELTIM", 0)
end)
CasinoServicesMenu:add_text("Winning too much too quickly might get you banned, enable this at your own risk.")

CasinoServicesMenu:add_separator()

CasinoServicesMenu:add_text("Slots")

CasinoServicesMenu:add_button("Rig Slot Machines", function()
	for i = 3, 196 do
		if i ~= 67 and i ~= 132 then
			locals.set_int(cslots, slots_random_results_table + i, 6)
		end
	end
end)

CasinoServicesMenu:add_button("Lose Slot Machines", function()
	for i = 3, 196 do
		if i ~= 67 and i ~= 132 then
			locals.set_int(cslots, slots_random_results_table + i, 0)
		end
	end
end)

CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Lucky Wheel")

CasinoServicesMenu:add_button("Give Podium Vehicle", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 18)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Mystery Prize", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 11)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give $50,000", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 19)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give 25,000 Chips", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 15)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_button("Give 15,000RP", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 17)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Discount", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 4)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Clothing", function()
	script.run_in_fiber(function(script)
		if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize, 8)
			locals.set_int("casino_lucky_wheel", prize_wheel_win_state + prize_wheel_prize_state, 11)
		end
	end)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CollectiblesMenu = makeOnlineTab(L7NEG:add_tab("Collectibles"))
CollectiblesMenu:add_button("Collect All Action Figures", function() for i = 0, 99 do stats.set_bool(MPX() .. "PROP_FIGURE_" .. i, true) end end)
CollectiblesMenu:add_button("Collect All Signal Jammers", function() for i = 0, 49 do stats.set_bool(MPX() .. "JAMMER_IDENTIFIED_" .. i, true) end end)
CollectiblesMenu:add_button("Collect All Playing Cards", function() for i = 0, 53 do stats.set_bool(MPX() .. "CH_CARD_ID_" .. i, true) end end)
CollectiblesMenu:add_button("Collect All Props", function() for i = 0, 9 do stats.set_bool(MPX() .. "PROP_HIDDEN_SOL_ID_" .. i, true) end end)
CollectiblesMenu:add_button("Collect All Movie Props", function() for i = 1, 10 do stats.set_int(MPX() .. "MOVIE_PROP_COLLECTED_" .. i, -1) end end)
CollectiblesMenu:add_button("Collect All LD Organics", function() for i = 0, 99 do stats.set_bool(MPX() .. "LD_ORGANIC_COLLECTED_" .. i, true) end end)
CollectiblesMenu:add_button("Collect Ghost Exposed", function() for i = 0, 9 do stats.set_bool(MPX() .. "GHOST_EXPOSED_" .. i, true) end end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

EventsMenu = makeOnlineTab(L7NEG:add_tab("Events Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SnowToggleMenu = EventsMenu:add_tab("Snow Toggle Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SNOWCB = SnowToggleMenu:add_checkbox("Snow")
script.register_looped("snow", function(script)
	script:yield()
	if SNOWCB:is_enabled() then
		globals.set_int(SNOW, 1)
	else
		globals.set_int(SNOW, 0)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

halloweatherMenu = EventsMenu:add_tab("Halloween Weather Toggle Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

hallowCB = halloweatherMenu:add_checkbox("Halloween Weather")
script.register_looped("halloweather", function(script)
	script:yield()
	if hallowCB:is_enabled() then
		globals.set_int(halloweatherAddress, 1)
	else
		globals.set_int(halloweatherAddress, 0)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

YetiHuntMenu = EventsMenu:add_tab("Yeti Hunt Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

YetiHuntMenu:add_button("Enable Yeti Hunt Event", function()
	globals.set_int(FMg + 35041, 1) -- enable the event 1833904680
	gui.show_message("Yeti Hunt Event", "Enabled")
end)

YetiHuntMenu:add_button("Clue Location 1", function()
	PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), -1562.69, 4699.04, 50.426)
end)

YetiHuntMenu:add_button("Clue Location 2", function()
	PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), -1359.869, 4733.429, 46.919)
end)

YetiHuntMenu:add_button("Clue Location 3", function()
	PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), -1715.398, 4501.203, 0.096)
end)

YetiHuntMenu:add_button("Clue Location 4", function()
	PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), -1282.18, 4487.826, 12.643)
end)

YetiHuntMenu:add_button("Clue Location 5", function()
	PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), -1569.665, 4478.485, 20.215)
end)

YetiHuntMenu:add_button("Teleport To Yeti Fight Location", function()
	PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), -1345.828, 4838.062, 137.522)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AUM = RecoveryMenu:add_tab("Awards Unlocker Menu")

AUM:add_button("Victory", function()
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

AUM:add_button("General", function()
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

AUM:add_button("Weapons", function()
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

AUM:add_button("Crimes", function()
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

AUM:add_button("Vehicles", function()
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

AUM:add_button("Combat", function()
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

HAUM = AUM:add_tab("Heists Awards Unlocker Menu")

APARTMENTAUM = HAUM:add_tab("Apartment Heist Menu")

APARTMENTAUM:add_button("Unlock All Apartment Heists Awards", function()
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

DIAMONHDAUM = HAUM:add_tab("Diamond Casino Heist")

DIAMONHDAUM:add_button("Unlock All Diamond Casino Heist Awards", function()
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
			stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL" .. i, true, j)
		end
	end
end)

CAYOAUM = HAUM:add_tab("Cayo Heist Menu")

CAYOAUM:add_button("Unlock All Cayo Heist Awards", function()
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
			stats.set_bool_masked(MPX() .. "HISLANDPSTAT_BOOL" .. i, true, j)
		end
	end
end)

DOOMSDAYAUM = HAUM:add_tab("Doomsday Heist Awards Menu")

DOOMSDAYAUM:add_button("Unlock All Doomsday Heist Awards", function()
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
		stats.set_bool_masked(MPX() .. "GANGOPSPSTAT_BOOL0", true, j)
	end
	stats.set_masked_int(MPX() .. "DLCSMUGCHARPSTAT_INT260", 3, 16, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 3, 24, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 3, 32, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 3, 40, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT260", 3, 48, 8)
end)

DLCAUM = AUM:add_tab("DLC Awards Menu")

DLCAUM:add_button("The Kortz Center Heist", function()
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

DLCAUM:add_button("A Safehouse In The Hills", function()
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

DLCAUM:add_button("Agents of Sabotage", function()
	for i = 9542, 9546 do
		stats.set_packed_stat_bool(i, true)
	end
	stats.set_packed_stat_bool(9549, true)
	stats.set_packed_stat_int(24903, 25)
	stats.set_packed_stat_int(24904, 2)
	stats.set_int(MPX() .. "HACKER24_GEN_BS", 8160)
	stats.set_bool(MPX() .. "AWD_FINEART", true)
	stats.set_bool(MPX() .. "AWD_BRUTEFORCE", true)
	stats.set_bool(MPX() .. "AWD_PROJECTBREAK", true)
	stats.set_bool(MPX() .. "AWD_BLACKBOXFILE", true)
	stats.set_bool(MPX() .. "AWD_BONUSPOINTS", true)
	stats.set_int(MPX() .. "AWD_DARNELLBROSINC", 50)
	stats.set_int(MPX() .. "AWD_GET_READY", 50)
end)

DLCAUM:add_button("After Hours", function()
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
		stats.set_bool_masked(MPX() .. "BUSINESSBATPSTAT_BOOL0", true, j)
		stats.set_bool_masked(MPX() .. "BUSINESSBATPSTAT_BOOL1", true, j)
	end
	if stats.get_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 0, 8) < 20 then
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
	end
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 100, 16, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 20, 24, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 80, 32, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 60, 40, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 40, 48, 8)
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 10, 56, 8)
end)

DLCAUM:add_button("Arena War", function()
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
	stats.set_masked_int(MPX() .. "ARENAWARSPSTAT_INT", 1, 35, 8)
	for i = 0, 8 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX() .. "ARENAWARSPSTAT_BOOL" .. i, true, j)
		end
	end
end)

DLCAUM:add_button("Diamond Casino n Resort", function()
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
			stats.set_bool_masked(MPX() .. "CASINOPSTAT_BOOL" .. i, true, j)
		end
	end
end)

DLCAUM:add_button("Arcade", function()
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
			stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL" .. i, true, j)
		end
	end
	for i = 0, 6 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX() .. "CASINOPSTAT_BOOL" .. i, true, j)
		end
	end
end)

DLCAUM:add_button("LS Summer Special", function()
	stats.set_bool(MPX() .. "AWD_KINGOFQUB3D", true)
	stats.set_bool(MPX() .. "AWD_QUBISM", true)
	stats.set_bool(MPX() .. "AWD_QUIBITS", true)
	stats.set_bool(MPX() .. "AWD_GODOFQUB3D", true)
	stats.set_bool(MPX() .. "AWD_ELEVENELEVEN", true)
	stats.set_bool(MPX() .. "AWD_GOFOR11TH", true)
	stats.set_masked_int(MPX() .. "SU20PSTAT_INT", 1, 35, 8)
	for i = 0, 1 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX() .. "SU20PSTAT_BOOL" .. i, true, j)
			stats.set_bool_masked(MPX() .. "SU20TATTOOSTAT_BOOL" .. i, true, j)
		end
	end
end)

DLCAUM:add_button("LS Tuners", function()
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
			stats.set_bool_masked(MPX() .. "TUNERPSTAT_BOOL" .. i, true, j)
		end
	end
end)

DLCAUM:add_button("Contract", function()
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
		stats.set_bool_masked(MPX() .. "FIXERPSTAT_BOOL0", true, j)
		stats.set_bool_masked(MPX() .. "FIXERPSTAT_BOOL1", true, j)
		stats.set_bool_masked(MPX() .. "FIXERTATTOOSTAT_BOOL0", true, j)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FAUT = RecoveryMenu:add_tab("Full Account Unlock Menu")

ensureOnlineGuard(FAUT)

FAUT:add_imgui(function()
	if isOffline() then return end

	if ImGui.Button("Unlock WM 29 Pistol") then
		script.run_in_fiber(function(WM29)
			script.execute_as_script("shop_controller", function()
				if NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
					NETSHOPPING.NET_GAMESERVER_BASKET_END()
				end
				local state, id = NETSHOPPING.NET_GAMESERVER_BEGIN_SERVICE(
					-1,
					joaat("CATEGORY_WEAPON"),
					joaat("WP_WT_PISTOLXM3_t0_v0"),
					joaat("NET_SHOP_ACTION_SPEND"),
					0,
					4
				)
				if state then
					NETSHOPPING.NET_GAMESERVER_CHECKOUT_START(id)
					gui.show_message("WM29", "WM29 is now Unlocked Change Session To Apply Changes.")
				end
			end)
		end)
	end

	if ImGui.Button("Unlock The Shocker") then
		script.run_in_fiber(function(THESHOCKER)
			script.execute_as_script("shop_controller", function()
				if NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
					NETSHOPPING.NET_GAMESERVER_BASKET_END()
				end
				local state, id = NETSHOPPING.NET_GAMESERVER_BEGIN_SERVICE(
					-1,
					joaat("CATEGORY_WEAPON"),
					joaat("WP_WT_STUNROD_t1_v1"),
					joaat("NET_SHOP_ACTION_SPEND"),
					0,
					4
				)
				if state then
					NETSHOPPING.NET_GAMESERVER_CHECKOUT_START(id)
					gui.show_message("The Shocker", "The Shocker is now Unlocked Change Session To Apply Changes.")
				end
			end)
		end)
	end

	if ImGui.Button("Unlock The Snowball Launcher") then
		script.run_in_fiber(function(SNOWBALLLAUNCHER)
			script.execute_as_script("shop_controller", function()
				if NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() then
					NETSHOPPING.NET_GAMESERVER_BASKET_END()
				end
				local state, id = NETSHOPPING.NET_GAMESERVER_BEGIN_SERVICE(
					-1,
					joaat("CATEGORY_WEAPON"),
					joaat("WP_WT_SNOWLAUNCHER_t0_v0"),
					joaat("NET_SHOP_ACTION_SPEND"),
					0,
					4
				)
				if state then
					NETSHOPPING.NET_GAMESERVER_CHECKOUT_START(id)
					gui.show_message(
						"Snowball Launcher",
						"Snowball Launcher is now Unlocked Change Session To Apply Changes."
					)
				end
			end)
		end)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CSU = FAUT:add_tab("Character's Stats")

CSU:add_imgui(function()
	if checkOnline() then return end

	if ImGui.Button("Max Character Skills") then
		stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
		stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
		stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
		stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
		stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
		stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
		stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
		gui.show_message("Character Skills", "Your Character Skills Is Maxxed Out.")
	end
end)

AcMenu = CSU:add_tab("Achievements")

Acv0 = false
AG = 4525223 + 1 --("CHEAT_ACHIEVE")


AcMenu:add_imgui(function()
	if isOffline() then return end
	if ImGui.Button("Unlock All Achievements") then
		script.run_in_fiber(function(script)
			for i = 0, 77 do
				script:sleep(200)
				globals.set_int(AG, i)
				if i == 77 then
					gui.show_message("Achievements", "Unlocked 77 Achievements")
				end
			end
		end)
	end
end)

AcMMenu = AcMenu:add_tab("One By One Menu")

AcMMenu:add_button("Welcome to Los Santos", function()
	globals.set_int(AG, 1)
end)
AcMMenu:add_button("A Friendship Resurrected", function()
	globals.set_int(AG, 2)
end)
AcMMenu:add_button("A Fair Day's Pay", function()
	globals.set_int(AG, 3)
end)
AcMMenu:add_button("The Moment of Truth", function()
	globals.set_int(AG, 4)
end)
AcMMenu:add_button("To Live or Die in Los Santos", function()
	globals.set_int(AG, 5)
end)
AcMMenu:add_button("Diamond Hard", function()
	globals.set_int(AG, 6)
end)
AcMMenu:add_button("Subversive", function()
	globals.set_int(AG, 7)
end)
AcMMenu:add_button("Blitzed", function()
	globals.set_int(AG, 8)
end)
AcMMenu:add_button("Small Town, Big Job", function()
	globals.set_int(AG, 9)
end)
AcMMenu:add_button("The Government Gimps", function()
	globals.set_int(AG, 10)
end)
AcMMenu:add_button("The Big One!", function()
	globals.set_int(AG, 11)
end)
AcMMenu:add_button("Solid Gold, Baby!", function()
	globals.set_int(AG, 12)
end)
AcMMenu:add_button("Career Criminal", function()
	globals.set_int(AG, 13)
end)
AcMMenu:add_button("San Andreas Sightseer", function()
	globals.set_int(AG, 14)
end)
AcMMenu:add_button("All's Fare in Love and War", function()
	globals.set_int(AG, 15)
end)
AcMMenu:add_button("TP Industries Arms Race", function()
	globals.set_int(AG, 16)
end)
AcMMenu:add_button("Multi-Disciplined", function()
	globals.set_int(AG, 17)
end)
AcMMenu:add_button("From Beyond the Stars", function()
	globals.set_int(AG, 18)
end)
AcMMenu:add_button("A Mystery, Solved", function()
	globals.set_int(AG, 19)
end)
AcMMenu:add_button("Waste Management", function()
	globals.set_int(AG, 20)
end)
AcMMenu:add_button("Red Mist", function()
	globals.set_int(AG, 21)
end)
AcMMenu:add_button("Show Off", function()
	globals.set_int(AG, 22)
end)
AcMMenu:add_button("Kifflom!", function()
	globals.set_int(AG, 23)
end)
AcMMenu:add_button("Three Man Army", function()
	globals.set_int(AG, 24)
end)
AcMMenu:add_button("Out of Your Depth", function()
	globals.set_int(AG, 25)
end)
AcMMenu:add_button("Altruist Acolyte", function()
	globals.set_int(AG, 26)
end)
AcMMenu:add_button("A Lot of Cheddar", function()
	globals.set_int(AG, 27)
end)
AcMMenu:add_button("Trading Pure Alpha", function()
	globals.set_int(AG, 28)
end)
AcMMenu:add_button("Pimp My Sidearm", function()
	globals.set_int(AG, 29)
end)
AcMMenu:add_button("Wanted:Alive Or Alive", function()
	globals.set_int(AG, 30)
end)
AcMMenu:add_button("Los Santos Customs", function()
	globals.set_int(AG, 31)
end)
AcMMenu:add_button("Close Shave", function()
	globals.set_int(AG, 32)
end)
AcMMenu:add_button("Off the Plane", function()
	globals.set_int(AG, 33)
end)
AcMMenu:add_button("Three-Bit Gangster", function()
	globals.set_int(AG, 34)
end)
AcMMenu:add_button("Making Moves", function()
	globals.set_int(AG, 35)
end)
AcMMenu:add_button("Above the Law", function()
	globals.set_int(AG, 36)
end)
AcMMenu:add_button("Numero Uno", function()
	globals.set_int(AG, 37)
end)
AcMMenu:add_button("The Midnight Club", function()
	globals.set_int(AG, 38)
end)
AcMMenu:add_button("Unnatural Selection", function()
	globals.set_int(AG, 39)
end)
AcMMenu:add_button("Backseat Driver", function()
	globals.set_int(AG, 40)
end)
AcMMenu:add_button("Run Like The Wind", function()
	globals.set_int(AG, 41)
end)
AcMMenu:add_button("Clean Sweep", function()
	globals.set_int(AG, 42)
end)
AcMMenu:add_button("Decorated", function()
	globals.set_int(AG, 43)
end)
AcMMenu:add_button("Stick Up Kid", function()
	globals.set_int(AG, 44)
end)
AcMMenu:add_button("Enjoy Your Stay", function()
	globals.set_int(AG, 45)
end)
AcMMenu:add_button("Crew Cut", function()
	globals.set_int(AG, 46)
end)
AcMMenu:add_button("Full Refund", function()
	globals.set_int(AG, 47)
end)
AcMMenu:add_button("Dialling Digits", function()
	globals.set_int(AG, 48)
end)
AcMMenu:add_button("American Dream", function()
	globals.set_int(AG, 49)
end)
AcMMenu:add_button("A New Perspective", function()
	globals.set_int(AG, 50)
end)
AcMMenu:add_button("Be Prepared", function()
	globals.set_int(AG, 51)
end)
AcMMenu:add_button("In the Name of Science", function()
	globals.set_int(AG, 52)
end)
AcMMenu:add_button("Dead Presidents", function()
	globals.set_int(AG, 53)
end)
AcMMenu:add_button("Parole Day", function()
	globals.set_int(AG, 54)
end)
AcMMenu:add_button("Shot Caller", function()
	globals.set_int(AG, 55)
end)
AcMMenu:add_button("Four Way", function()
	globals.set_int(AG, 56)
end)
AcMMenu:add_button("Live a Little", function()
	globals.set_int(AG, 57)
end)
AcMMenu:add_button("Can't Touch This", function()
	globals.set_int(AG, 58)
end)
AcMMenu:add_button("Mastermind", function()
	globals.set_int(AG, 59)
end)
AcMMenu:add_button("Vinewood Visionary", function()
	globals.set_int(AG, 60)
end)
AcMMenu:add_button("Majestic", function()
	globals.set_int(AG, 61)
end)
AcMMenu:add_button("Humans of Los Santos", function()
	globals.set_int(AG, 62)
end)
AcMMenu:add_button("First Time Director", function()
	globals.set_int(AG, 63)
end)
AcMMenu:add_button("Animal Lover", function()
	globals.set_int(AG, 64)
end)
AcMMenu:add_button("Ensemble Piece", function()
	globals.set_int(AG, 65)
end)
AcMMenu:add_button("Cult Movie", function()
	globals.set_int(AG, 66)
end)
AcMMenu:add_button("Location Scout", function()
	globals.set_int(AG, 67)
end)
AcMMenu:add_button("Method Actor", function()
	globals.set_int(AG, 68)
end)
AcMMenu:add_button("Cryptozoologist", function()
	globals.set_int(AG, 69)
end)
AcMMenu:add_button("Getting Started", function()
	globals.set_int(AG, 70)
end)
AcMMenu:add_button("The Data Breaches", function()
	globals.set_int(AG, 71)
end)
AcMMenu:add_button("The Bogdan Problem", function()
	globals.set_int(AG, 72)
end)
AcMMenu:add_button("The Doomsday Scenario", function()
	globals.set_int(AG, 73)
end)
AcMMenu:add_button("A World Worth Saving", function()
	globals.set_int(AG, 74)
end)
AcMMenu:add_button("Orbital Obliteration", function()
	globals.set_int(AG, 75)
end)
AcMMenu:add_button("Elitist", function()
	globals.set_int(AG, 76)
end)
AcMMenu:add_button("Masterminds", function()
	globals.set_int(AG, 77)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local current_objectives_global = 2359296 --("am_challenges")
local weekly_objectives_global = 2732111 --("am_challenges")
local objectives_state_global = 1574746 --("am_challenges")

FAUT:add_imgui(function()
	if isOffline() then return end
	if ImGui.Button("Complete All Daily & Weekly Challenges") then
		script.run_in_fiber(function(script)
			for i = 0, 2 do --Unlock all daily rewards.
				local objective = globals.get_int(current_objectives_global + (1 + (0 * 5574)) + 681 + 4248 + (1 + (i * 3)))
				globals.set_int(objectives_state_global + 1 + (1 + (i * 1)), objective)
			end
			globals.set_int(objectives_state_global, 1)
			globals.set_int(
				weekly_objectives_global + (1 + (0 * 6)) + 1,
				globals.get_int(weekly_objectives_global + (1 + (0 * 6)) + 2)
			) --Unlock Weekly Objective
			gui.show_message("Challenges", "All Daily And Weekly Challenges Are Now Completed.")
		end)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

LSCMUnlockeRecoveryMenu = makeOnlineTab(RecoveryMenu:add_tab("LSCM Unlocker Menu"))

LSCMUnlockeRecoveryMenu:add_button("Unlock All Rep Lvl 1000", function()
	for i = FMg + 31047, FMg + 31076 do
		globals.set_float(i, 100000)
	end
	gui.show_message(
		"LSCM",
		"LVL 1000 Activated Just Sit In The Test Drive Vehicle And Enter LSCM Track To See The Changes."
	)
end)

LSCMUnlockeRecoveryMenu:add_button("LSCM Prize Ride Unlock", function()
	stats.set_bool(MPX() .. "CARMEET_PV_CHLLGE_CMPLT", true)
	stats.set_bool(MPX() .. "CARMEET_PV_CLMED", false)
	gui.show_message("LSCM", "Your Prize Car Is Now Unlocked.")
end)

LSCMUnlockeRecoveryMenu:add_button("Unlock Trade Prices for Headlights", function()
	stats_set_packed_bools(24980, 24991, true)
	gui.show_message("LSCM", "Trade Prices For Headlights Are Now Unlocked.")
end)

LSCMNote = LSCMUnlockeRecoveryMenu:add_tab("Read Me Tutorial")

LSCMNote:add_text("Buy a membership, activate, sit in", function() end)
LSCMNote:add_text("a test car and go to the track", function() end)
LSCMNote:add_text("", function() end)
LSCMNote:add_text("If your level is not 1, then activate", function() end)
LSCMNote:add_text("and buy something in the LSCM store", function() end)
LSCMNote:add_text("", function() end)
LSCMNote:add_text("If you've used LS Tuner awards unlock", function() end)
LSCMNote:add_text("before, all unlocks will be temporary only", function() end)
LSCMNote:add_text("", function() end)
LSCMNote:add_text("--- Manual Online Override ---", function() end)
LSCMNote:add_text("To manually set/bypass the online state,", function() end)
LSCMNote:add_text("toggle 'Bypass Online Check' in the main tab.", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7 = makeOnlineTab(L7NEG:add_tab("Ultimate Money Methods Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BusinessesMenu = makeOnlineTab(L7NEG7:add_tab("Businesses Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoMenu = makeOnlineTab(BusinessesMenu:add_tab("Air Cargo Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CARGO1 = FMg + 22581
CARGO2 = FMg + 22582
CARGO3 = FMg + 22583
CARGO4 = FMg + 22584
CARGO5 = FMg + 22585
CARGO6 = FMg + 22586
CARGO7 = FMg + 22587
CARGO8 = FMg + 22588
CARGO9 = FMg + 22589

local hanvalue = AirCargoMenu:add_input_int("Crate Value")

AirCargoMenu:add_button("Set Value", function()
	local HangarCrateVlaue = hanvalue:get_value()
	globals.set_int(CARGO1, HangarCrateVlaue)
	globals.set_int(CARGO2, HangarCrateVlaue)
	globals.set_int(CARGO3, HangarCrateVlaue)
	globals.set_int(CARGO4, HangarCrateVlaue)
	globals.set_int(CARGO5, HangarCrateVlaue)
	globals.set_int(CARGO6, HangarCrateVlaue)
	globals.set_int(CARGO7, HangarCrateVlaue)
	globals.set_int(CARGO8, HangarCrateVlaue)
	globals.set_int(CARGO9, HangarCrateVlaue)
	gui.show_message("Crate Value Setter", "Your Crates Values was set to " .. HangarCrateVlaue .. ".")
end)

AirCargoMenu:add_separator()

RCRT = AirCargoMenu:add_checkbox("Remove Ron's Cut")
script.register_looped("RonCutRemover", function(script)
	script:yield()
	if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
	if RCRT:is_enabled() then
		globals.set_float(FMg + 22564, 0)
	else
		globals.set_float(FMg + 22564, 0.025)
	end
end)

AirCargoMenu:add_separator()

PRPGD = AirCargoMenu:add_checkbox("Disable Player RP Gain")
script.register_looped("PlayerRPGainDisabler", function(script)
	script:yield()
	if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
	if PRPGD:is_enabled() then
		globals.set_float(FMg + 1, 0)
	else
		globals.set_float(FMg + 1, 1)
	end
end)

AirCargoMenu:add_separator()

AirCargoMenu:add_button("Open Hangar Screen", function()
	SCRIPT.REQUEST_SCRIPT("apparcadebusinesshub")
	SYSTEM.START_NEW_SCRIPT("apparcadebusinesshub", 8344)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoEditorMenu = makeOnlineTab(AirCargoMenu:add_tab("Air Cargo Data Editor"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoEditorMenu:add_button("Reset Crate Sell Stats-0/0 Sales", function()
	stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_COMPLET", 0)
	stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_UNDERTAK", 0)
	stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_COMPLET", 0)
	stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_UNDERTAK", 0)
	stats.set_int(MPX() .. "LFETIME_HANGAR_EARNINGS", 0)
	stats.set_int(MPX() .. "HANGAR_CONTRABAND_TOTAL", 0)
	stats.set_int(MPX() .. "LFETIME_HANGAR_EARN_BONUS", 0)
	stats.set_int(MPX() .. "RIVAL_HANGAR_CRATES_STOLEN", 0)
	globals.set_int(CSg1, 11)
	globals.set_int(CSg2, 1)
	globals.set_int(CSg2, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

UseAtYourOwnRiskMenu = makeOnlineTab(L7NEG7:add_tab("Use At Your Own Risk Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CeoManagerMenu = makeOnlineTab(UseAtYourOwnRiskMenu:add_tab("Ceo Manager Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CEO1 = FMg + 15821 --("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1")
CEO2 = FMg + 15588 --("EXEC_BUY_COOLDOWN")
CEO3 = FMg + 15589 --("EXEC_SELL_COOLDOWN")
SMC1 = 574 + 1 --("gb_contraband_sell")
SMC2 = 574 + 7 --("gb_contraband_sell")
SMC3 = 574 + 584 --("gb_contraband_sell")
SMC4 = 574 + 55 --("gb_contraband_sell")
SMC5 = 574 + 595 --("gb_contraband_sell")
SMC6 = 590 --("GTAO_Exec_SecuroServ_Computer_Sounds") in ("appsecuroserv")
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
CeoManagerMenu:add_imgui(function()
	if checkOnline() then return end
	cratevalue, used = ImGui.DragInt("Crate Value", cratevalue, 10000, 0, 6000000)
	if used then
		globals.set_int(CEO1, cratevalue)
	end
end)

checkbox = CeoManagerMenu:add_checkbox("Start Ceo Manager")

PRPGD = CeoManagerMenu:add_checkbox("Disable Player RP Gain")
script.register_looped("PlayerRPGainDisabler", function(script)
	script:yield()
	if PRPGD:is_enabled() then
		globals.set_float(FMg + 1, 0)
	else
		globals.set_float(FMg + 1, 1)
	end
end)

CeoManagerMenu:add_button("Open Warehouse Screen", function()
	SCRIPT.REQUEST_SCRIPT("apparcadebusinesshub")
	SYSTEM.START_NEW_SCRIPT("apparcadebusinesshub", 8344)
end)

script.register_looped("yimceoloop", function(script)
	script:yield()
	if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
	-- removed useless call
	globals.set_int(CEO2, 0)
	globals.set_int(CEO3, 0)

	if checkbox:is_enabled() == true then
		if locals.get_int(ci, 2) == 1 then
			locals.set_int(ci, SMC5, 1)
			locals.set_int(ci, SMC4, 0)
			locals.set_int(ci, SMC3, 0)
			locals.set_int(ci, SMC2, 7)
			script:sleep(500)
			locals.set_int(ci, SMC1, 99999)
		end
		if locals.get_int(cs, 2) == 1 then
			script:sleep(500)
			locals.set_int(cs, SMC8, 1)
			script:sleep(200)
			locals.set_int(cs, SMC7, 1)
			script:sleep(200)
			locals.set_int(cs, SMC6, 3012)
			script:sleep(1000)
		end
		if locals.get_int(cb, 2) == 1 then
			locals.set_int(cb, SMC9, 1)
			locals.set_int(cb, SMC10, 111)
			locals.set_int(cb, SMC11, 6)
			locals.set_int(cb, SMC12, 4)
			gui.show_message("Your Warehouse is now full! 111/111 Crates")
		end
		if locals.get_int(ci, 2) ~= 1 then
			script:sleep(500)
			if locals.get_int(am, 2) == 1 then
				SCRIPT.REQUEST_SCRIPT("appsecuroserv")
				SYSTEM.START_NEW_SCRIPT("appsecuroserv", 8344)
				SCRIPT.SET_SCRIPT_AS_NO_LONGER_NEEDED("appsecuroserv")
			end
		end
	end
	script:sleep(500)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

NightClubSafeMenu = makeOnlineTab(UseAtYourOwnRiskMenu:add_tab("NightClub Safe Loop Menu"))

SafeAmount = 300000
SafeCapacity = 23769 --NIGHTCLUBMAXSAFEVALUE
IncomeStart = 23746 --NIGHTCLUBINCOMEUPTOPOP5
IncomeEnd = 23765 --NIGHTCLUBINCOMEUPTOPOP100

NCRSCB = NightClubSafeMenu:add_checkbox("Enable Nitghtclub $300k/5s (Safe Remote AFK)")
script.register_looped("nightclubremotelooptest", function(script)
	script:yield()
	if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
	if NCRSCB:is_enabled() == true then
		SafeValue = 1845298 + self.get_id() + 260 + 364 + 5 --("am_mp_nightclub") or we can just use TUNEABLE: NIGHTCLUBMAXSAFEVALUE
		for i = IncomeStart, IncomeEnd do
			globals.set_int(FMg + i, SafeAmount)
		end
		globals.set_int(FMg + SafeCapacity, SafeAmount)
		stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
		script:sleep(2500)
		if globals.get_int(SafeValue) ~= 0 then
		end
		locals.set_int("am_mp_nightclub", NLCl, 1)
		globals.set_int(4516981, 0)
		globals.set_int(4516982, 0)
		globals.set_int(4516983, 0)
		script:sleep(2500)
	end
end)

NightClubSafeMenu:add_separator()

NightClubSafeMenu:add_button("Open Nightclub Screen", function()
	SYSTEM.START_NEW_SCRIPT("appBusinessHub", 1424)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local GVMENU = makeOnlineTab(L7NEG:add_tab("Gun Van Menu "))

local gunvan_locations = {
	vec3:new(-29.532, 6435.136, 31.162),
	vec3:new(1705.214, 4819.167, 41.75),
	vec3:new(1795.522, 3899.753, 33.869),
	vec3:new(1335.536, 2758.746, 51.099),
	vec3:new(795.583, 1210.78, 338.962),
	vec3:new(-3192.67, 1077.205, 20.594),
	vec3:new(-789.719, 5400.921, 33.915),
	vec3:new(-24.384, 3048.167, 40.703),
	vec3:new(2666.786, 1469.324, 24.237),
	vec3:new(-1454.966, 2667.503, 3.2),
	vec3:new(2340.418, 3054.188, 47.888),
	vec3:new(1509.183, -2146.795, 76.853),
	vec3:new(1137.404, -1358.654, 34.322),
	vec3:new(-57.208, -2658.793, 5.737),
	vec3:new(1905.017, 565.222, 175.558),
	vec3:new(974.484, -1718.798, 30.296),
	vec3:new(779.077, -3266.297, 5.719),
	vec3:new(-587.728, -1637.208, 19.611),
	vec3:new(733.99, -736.803, 26.165),
	vec3:new(-1694.632, -454.082, 40.712),
	vec3:new(-1330.726, -1163.948, 4.313),
	vec3:new(-496.618, 40.231, 52.316),
	vec3:new(275.527, 66.509, 94.108),
	vec3:new(260.928, -763.35, 30.559),
	vec3:new(-478.025, -741.45, 30.299),
	vec3:new(894.94, 3603.911, 32.56),
	vec3:new(-2166.511, 4289.503, 48.733),
	vec3:new(1465.633, 6553.67, 13.771),
	vec3:new(1101.032, -335.172, 66.944),
	vec3:new(149.683, -1655.674, 29.028),
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

local function help_marker(text)
	ImGui.SameLine()
	ImGui.TextDisabled("(?)")
	if ImGui.IsItemHovered() then
		ImGui.BeginTooltip()
		ImGui.PushTextWrapPos(ImGui.GetFontSize() * 35)
		ImGui.TextUnformatted(text)
		ImGui.PopTextWrapPos()
		ImGui.EndTooltip()
	end
end

local function render_weapon_editor()
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

		filter_text = ImGui.InputText("Weapon Name", filter_text, 100)
		if ImGui.IsItemActive() then
			is_typing = true
		else
			is_typing = false
		end

		if ImGui.BeginListBox("##weapons", 450, 200) then
			for index, item in ipairs(weapons_data) do
				local display_name = weapons.get_weapon_display_name(item)
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
			local is_weapon_valid = weapons.get_weapon_display_name(weapon_name) ~= ""

			if is_weapon_valid then
				tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, joaat(weapon_name))
			else
				gui.show_error("Gun Van", "Invalid weapon.")
			end
		end

		ImGui.SameLine()

		if ImGui.Button("Remove Weapon") then
			tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, 0)
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

script.register_looped("Gun Van", function()
	if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
	gun_van_loc = globals.get_int(2652581 + 2706)

	if is_typing then
		PAD.DISABLE_ALL_CONTROL_ACTIONS(0)
	end

	if weapon_skins then
		tunables.set_bool(1490225691, false)
	end

	if livery_lock then
		local value = locals.get_int("gunclub_shop", 206 + 747)
		if value ~= nil then
			value = value | (1 << 8)
			locals.set_int("gunclub_shop", 206 + 747, value)
		end
	end

	if gta_plus_blip then
		local gun_van_sprite = HUD.GET_FIRST_BLIP_INFO_ID(844)

		tunables.set_float(15999531, 10000.0)
		if HUD.DOES_BLIP_EXIST(gun_van_sprite) then
			HUD.SET_BLIP_AS_SHORT_RANGE(gun_van_sprite, false)
		end
	end
end)

GVMENU:add_imgui(function()
	if weapon_editor_popup then
		render_weapon_editor()
	end

	ImGui.Text("Current Location: " .. (gun_van_loc ~= -1 and gun_van_loc + 1 or "N/A"))

	ImGui.SetNextItemWidth(265)
	selected_loc = ImGui.Combo("##selected_loc", selected_loc, van_locations, 30)

	ImGui.SameLine()

	if ImGui.Button("Set New Gun Van Location") then
		globals.set_int(2652581 + 2706, selected_loc)
	end

	ImGui.SameLine()

	if ImGui.Button("Teleport") then
		script.run_in_fiber(function()
			local coords = gunvan_locations[selected_loc + 1]
			PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), coords.x, coords.y, coords.z)
		end)
	end

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
			local value = locals.get_int("gunclub_shop", 206 + 747)
			if value ~= nil then
				value = value & ~(1 << 8)
				locals.set_int("gunclub_shop", 206 + 747, value)
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
	help_marker("Allows 10% off off any weapon in gun van")

	if on_tick then
		if discount then
			globals_set_ints(GVADg + 1, GVADg + 9, 1, 1036831744)
			globals_set_ints(GVTDg + 1, GVTDg + 3, 1, 1036831744)
			globals_set_ints(GVWDg + 1, GVWDg + 5, 1, 1036831744)
		else
			globals_set_ints(GVADg + 1, GVADg + 9, 1, 0)
			globals_set_ints(GVTDg + 1, GVTDg + 3, 1, 0)
			globals_set_ints(GVWDg + 1, GVWDg + 5, 1, 0)
		end
	end
	ImGui.Separator()

	if ImGui.TreeNode("Weapons") then
		for i = 0, 9 do
			local weapon_hash = tunables.get_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. i)

			if weapon_hash ~= 0 then
				local weapon_name = weapons.get_weapon_display_name(weapon_hash)
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
				local throwable_name = weapons.get_weapon_display_name(throwable_hash)
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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---@diagnostic disable: undefined-global, lowercase-global

SCRIPT_NAME = "YimResupplier"
local TAGET_BUILD <const> = "3788.0"

-- ============================================================================
-- JSON LIBRARY (rxi's json.lua)
-- ============================================================================
local function JSON()
	local json = { _version = "0.1.2" }
	local encode
	local escape_char_map = {
		["\\"] = "\\",
		['"'] = '"',
		["\b"] = "b",
		["\f"] = "f",
		["\n"] = "n",
		["\r"] = "r",
		["\t"] = "t",
	}

	local escape_char_map_inv = { ["/"] = "/" }
	for k, v in pairs(escape_char_map) do
		escape_char_map_inv[v] = k
	end

	local function escape_char(c)
		return "\\" .. (escape_char_map[c] or string.format("u%04x", c:byte()))
	end

	local function encode_nil(val)
		return "null"
	end

	local function encode_table(val, stack)
		local res = {}
		stack = stack or {}
		if stack[val] then
			error("circular reference")
		end

		stack[val] = true

		if rawget(val, 1) ~= nil or next(val) == nil then
			local n = 0
			for k in pairs(val) do
				if type(k) ~= "number" then
					error("invalid table: mixed or invalid key types")
				end
				n = n + 1
			end
			if n ~= #val then
				error("invalid table: sparse array")
			end
			for i, v in ipairs(val) do
				table.insert(res, encode(v, stack))
			end
			stack[val] = nil
			return "[" .. table.concat(res, ",") .. "]"
		else
			for k, v in pairs(val) do
				if type(k) ~= "string" then
					error("invalid table: mixed or invalid key types")
				end
				table.insert(res, encode(k, stack) .. ":" .. encode(v, stack))
			end
			stack[val] = nil
			return "{" .. table.concat(res, ",") .. "}"
		end
	end

	local function encode_string(val)
		return '"' .. val:gsub('[%z\1-\31\\"]', escape_char) .. '"'
	end

	local function encode_number(val)
		if val ~= val or val <= -math.huge or val >= math.huge then
			error("unexpected number value '" .. tostring(val) .. "'")
		end
		return string.format("%.14g", val)
	end

	local type_func_map = {
		["nil"] = encode_nil,
		["table"] = encode_table,
		["string"] = encode_string,
		["number"] = encode_number,
		["boolean"] = tostring,
	}

	encode = function(val, stack)
		local t = type(val)
		local f = type_func_map[t]
		if f then
			return f(val, stack)
		end
		error("unexpected type '" .. t .. "'")
	end

	function json.encode(val)
		return (encode(val))
	end

	local parse

	local function create_set(...)
		local res = {}
		for i = 1, select("#", ...) do
			res[select(i, ...)] = true
		end
		return res
	end

	local space_chars = create_set(" ", "\t", "\r", "\n")
	local delim_chars = create_set(" ", "\t", "\r", "\n", "]", "}", ",")
	local escape_chars = create_set("\\", "/", '"', "b", "f", "n", "r", "t", "u")
	local literals = create_set("true", "false", "null")

	local literal_map = {
		["true"] = true,
		["false"] = false,
		["null"] = nil,
	}

	local function next_char(str, idx, set, negate)
		for i = idx, #str do
			if set[str:sub(i, i)] ~= negate then
				return i
			end
		end
		return #str + 1
	end

	local function decode_error(str, idx, msg)
		local line_count = 1
		local col_count = 1
		for i = 1, idx - 1 do
			col_count = col_count + 1
			if str:sub(i, i) == "\n" then
				line_count = line_count + 1
				col_count = 1
			end
		end
		error(string.format("%s at line %d col %d", msg, line_count, col_count))
	end

	local function codepoint_to_utf8(n)
		local f = math.floor
		if n <= 0x7f then
			return string.char(n)
		elseif n <= 0x7ff then
			return string.char(f(n / 64) + 192, n % 64 + 128)
		elseif n <= 0xffff then
			return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)
		elseif n <= 0x10ffff then
			return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128, f(n % 4096 / 64) + 128, n % 64 + 128)
		end
		error(string.format("invalid unicode codepoint '%x'", n))
	end

	local function parse_unicode_escape(s)
		local n1 = tonumber(s:sub(1, 4), 16)
		local n2 = tonumber(s:sub(7, 10), 16)
		if n2 then
			return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)
		else
			return codepoint_to_utf8(n1)
		end
	end

	local function parse_string(str, i)
		local res = ""
		local j = i + 1
		local k = j

		while j <= #str do
			local x = str:byte(j)
			if x < 32 then
				decode_error(str, j, "control character in string")
			elseif x == 92 then
				res = res .. str:sub(k, j - 1)
				j = j + 1
				local c = str:sub(j, j)
				if c == "u" then
					local hex = str:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", j + 1)
						or str:match("^%x%x%x%x", j + 1)
						or decode_error(str, j - 1, "invalid unicode escape in string")
					res = res .. parse_unicode_escape(hex)
					j = j + #hex
				else
					if not escape_chars[c] then
						decode_error(str, j - 1, "invalid escape char '" .. c .. "' in string")
					end
					res = res .. escape_char_map_inv[c]
				end
				k = j + 1
			elseif x == 34 then
				res = res .. str:sub(k, j - 1)
				return res, j + 1
			end
			j = j + 1
		end
		decode_error(str, i, "expected closing quote for string")
	end

	local function parse_number(str, i)
		local x = next_char(str, i, delim_chars)
		local s = str:sub(i, x - 1)
		local n = tonumber(s)
		if not n then
			decode_error(str, i, "invalid number '" .. s .. "'")
		end
		return n, x
	end

	local function parse_literal(str, i)
		local x = next_char(str, i, delim_chars)
		local word = str:sub(i, x - 1)
		if not literals[word] then
			decode_error(str, i, "invalid literal '" .. word .. "'")
		end
		return literal_map[word], x
	end

	local function parse_array(str, i)
		local res = {}
		local n = 1
		i = i + 1
		while 1 do
			local x
			i = next_char(str, i, space_chars, true)
			if str:sub(i, i) == "]" then
				i = i + 1
				break
			end
			x, i = parse(str, i)
			res[n] = x
			n = n + 1
			i = next_char(str, i, space_chars, true)
			local chr = str:sub(i, i)
			i = i + 1
			if chr == "]" then
				break
			end
			if chr ~= "," then
				decode_error(str, i, "expected ']' or ','")
			end
		end
		return res, i
	end

	local function parse_object(str, i)
		local res = {}
		i = i + 1
		while 1 do
			local key, val
			i = next_char(str, i, space_chars, true)
			if str:sub(i, i) == "}" then
				i = i + 1
				break
			end
			if str:sub(i, i) ~= '"' then
				decode_error(str, i, "expected string for key")
			end
			key, i = parse(str, i)
			i = next_char(str, i, space_chars, true)
			if str:sub(i, i) ~= ":" then
				decode_error(str, i, "expected ':' after key")
			end
			i = next_char(str, i + 1, space_chars, true)
			val, i = parse(str, i)
			res[key] = val
			i = next_char(str, i, space_chars, true)
			local chr = str:sub(i, i)
			i = i + 1
			if chr == "}" then
				break
			end
			if chr ~= "," then
				decode_error(str, i, "expected '}' or ','")
			end
		end
		return res, i
	end

	local char_func_map = {
		['"'] = parse_string,
		["0"] = parse_number,
		["1"] = parse_number,
		["2"] = parse_number,
		["3"] = parse_number,
		["4"] = parse_number,
		["5"] = parse_number,
		["6"] = parse_number,
		["7"] = parse_number,
		["8"] = parse_number,
		["9"] = parse_number,
		["-"] = parse_number,
		["t"] = parse_literal,
		["f"] = parse_literal,
		["n"] = parse_literal,
		["["] = parse_array,
		["{"] = parse_object,
	}

	parse = function(str, idx)
		local chr = str:sub(idx, idx)
		local f = char_func_map[chr]
		if f then
			return f(str, idx)
		end
		decode_error(str, idx, "unexpected character '" .. chr .. "'")
	end

	function json.decode(str)
		if type(str) ~= "string" then
			error("expected argument of type string, got " .. type(str))
		end
		local res, idx = parse(str, next_char(str, 1, space_chars, true))
		idx = next_char(str, idx, space_chars, true)
		if idx <= #str then
			decode_error(str, idx, "trailing garbage")
		end
		return res
	end

	return json
end

-- ============================================================================
-- YIMCONFIG SYSTEM
-- ============================================================================
local function YimConfig(DEFAULT_CONFIG)
	local json = JSON()
	local script_json = string.format("%s.json", SCRIPT_NAME)
	local yc = {
		_version = "1.0.0",
		_credits = [[

        ¤ Universal Config System For YimMenu-Lua ¤

      - Original code written by Harmless: https://github.com/harmless05

      - Modified for universal use by SAMURAI (xesdoog): https://github.com/xesdoog

      - Uses rxi's JSON Library: https://github.com/rxi/json.lua
        ]],
	}

	local function file_exists(name)
		local f = io.open(name, "r")
		if f ~= nil then
			f:close()
			return true
		else
			return false
		end
	end

	local writeToFile = function(data)
		local file, _ = io.open(script_json, "w")
		if file == nil then
			log.warning("Failed to write to " .. script_json)
			gui.show_error("YimConfig", "Failed to write to " .. script_json)
			return false
		end
		file:write(json.encode(data))
		file:close()
		return true
	end

	local readFromFile = function()
		local file, _ = io.open(script_json, "r")
		if file == nil then
			return nil
		end
		local content = file:read("*all")
		file:close()
		return json.decode(content)
	end

	local checkAndCreateConfig = function()
		if DEFAULT_CONFIG == nil then
			gui.show_error(
				"YimConfig",
				"Missing default config! Please create a default config table in your main script."
			)
			error("[FATAL] Missing default config! Please create a default config global table in your main script.")
		end
		local exists = file_exists(script_json)
		local config
		if not exists then
			log.debug("Config file not found! Creating a default config...")
			return writeToFile(DEFAULT_CONFIG)
		else
			config = readFromFile()
			if config == nil then
				error("[FATAL] Failed to read config file!")
			end

			for key, defaultValue in pairs(DEFAULT_CONFIG) do
				if config[key] == nil then
					config[key] = defaultValue
				end
			end
			return writeToFile(config)
		end
	end

	local readAndDecodeConfig = function()
		if not checkAndCreateConfig() then
			error("Failed to read config file!", 2)
		end
		return readFromFile()
	end

	yc.save = function(item_tag, value)
		local t = readAndDecodeConfig()
		if t then
			t[item_tag] = value
			if not writeToFile(t) then
				log.warning("Failed to save config to " .. script_json)
			end
		end
	end

	yc.read = function(item_tag)
		local t = readAndDecodeConfig()
		if t then
			return t[item_tag]
		else
			log.warning("Failed to read config from " .. script_json)
		end
	end

	yc.reset = function()
		writeToFile(DEFAULT_CONFIG)
	end

	yc.encode = json.encode
	yc.decode = json.decode

	return yc
end

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================
local TAGET_BUILD = "3889"

function GetBuildNumber()
	local ptr = memory.scan_pattern("8B C3 33 D2 C6 44 24 20")
	if ptr and not ptr:is_null() then
		ptr = ptr:add(0x24)
		if ptr and not ptr:is_null() then
			ptr = ptr:rip()
			if ptr and not ptr:is_null() then
				return ptr:get_string()
			end
		end
	end
	return "Unknown"
end

function formatMoney(value)
	return "$" .. tostring(value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function coloredText(text, wrap_size, color)
	ImGui.PushStyleColor(ImGuiCol.Text, color[1] / 255, color[2] / 255, color[3] / 255, color[4])
	ImGui.PushTextWrapPos(ImGui.GetFontSize() * wrap_size)
	ImGui.TextWrapped(text)
	ImGui.PopTextWrapPos()
	ImGui.PopStyleColor(1)
end

function selfTP(keepVehicle, setHeading, coords, heading)
	script.run_in_fiber(function(selftp)
		STREAMING.REQUEST_COLLISION_AT_COORD(coords.x, coords.y, coords.z)
		selftp:sleep(300)
		if setHeading then
			if heading == nil then
				heading = 0
			end
			ENTITY.SET_ENTITY_HEADING(self.get_ped(), heading)
		end
		if keepVehicle then
			PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), coords.x, coords.y, coords.z)
		else
			TASK.CLEAR_PED_TASKS_IMMEDIATELY(self.get_ped())
			ENTITY.SET_ENTITY_COORDS(self.get_ped(), coords.x, coords.y, coords.z, false, false, false, true)
		end
	end)
end

function getCEOvalue_G(crates)
	local G
	if crates ~= nil then
		if crates == 1 then
			G = 15821
		end
		if crates == 2 then
			G = 15822
		end
		if crates == 3 then
			G = 15823
		end
		if crates == 4 or crates == 5 then
			G = 15824
		end
		if crates == 6 or crates == 7 then
			G = 15825
		end
		if crates == 8 or crates == 9 then
			G = 15826
		end
		if crates >= 10 and crates <= 14 then
			G = 15827
		end
		if crates >= 15 and crates <= 19 then
			G = 15828
		end
		if crates >= 20 and crates <= 24 then
			G = 15829
		end
		if crates >= 25 and crates <= 29 then
			G = 15830
		end
		if crates >= 30 and crates <= 34 then
			G = 15831
		end
		if crates >= 35 and crates <= 39 then
			G = 15832
		end
		if crates >= 40 and crates <= 44 then
			G = 15833
		end
		if crates >= 45 and crates <= 49 then
			G = 15834
		end
		if crates >= 50 and crates <= 59 then
			G = 15835
		end
		if crates >= 60 and crates <= 69 then
			G = 15836
		end
		if crates >= 70 and crates <= 79 then
			G = 15837
		end
		if crates >= 80 and crates <= 89 then
			G = 15838
		end
		if crates >= 90 and crates <= 99 then
			G = 15839
		end
		if crates >= 100 and crates <= 110 then
			G = 15840
		end
		if crates == 111 then
			G = 15841
		end
	else
		G = 0
	end
	return G
end

-- ============================================================================
-- MAIN SCRIPT
-- ============================================================================
	local DEFAULT_CONFIG = {
		cashUpdgrade1 = false,
		cashUpdgrade2 = false,
		cokeUpdgrade1 = false,
		cokeUpdgrade2 = false,
		methUpdgrade1 = false,
		methUpdgrade2 = false,
		weedUpdgrade1 = false,
		weedUpdgrade2 = false,
		fdUpdgrade1 = false,
		fdUpdgrade2 = false,
		bunkerUpdgrade1 = false,
		bunkerUpdgrade2 = false,
		acidUpdgrade = false,
	}

	local CFG = YimConfig(DEFAULT_CONFIG)
	log.info(string.format("Ultimate_Menu_V3_1.73_Legacy.lua: YimConfig v%s successfully loaded\n%s", CFG._version, CFG._credits))

	yim_resupplier = L7NEG:add_tab("YimResupplier")
	
	hangarOwned = false
	fCashOwned = false
	cokeOwned = false
	methOwned = false
	weedOwned = false
	fdOwned = false
	bunkerOwned = false
	acidOwned = false
	hangarTotal = 0
	cashTotal = 0
	cokeTotal = 0
	methTotal = 0
	weedTotal = 0
	fdTotal = 0
	bunkerTotal = 0
	acidTotal = 0
	main_global = 1673807
	cashUpdgrade1 = CFG.read("cashUpdgrade1")
	cashUpdgrade2 = CFG.read("cashUpdgrade2")
	cokeUpdgrade1 = CFG.read("cokeUpdgrade1")
	cokeUpdgrade2 = CFG.read("cokeUpdgrade2")
	methUpdgrade1 = CFG.read("methUpdgrade1")
	methUpdgrade2 = CFG.read("methUpdgrade2")
	weedUpdgrade1 = CFG.read("weedUpdgrade1")
	weedUpdgrade2 = CFG.read("weedUpdgrade2")
	fdUpdgrade1 = CFG.read("fdUpdgrade1")
	fdUpdgrade2 = CFG.read("fdUpdgrade2")
	bunkerUpdgrade1 = CFG.read("bunkerUpdgrade1")
	bunkerUpdgrade2 = CFG.read("bunkerUpdgrade2")
	acidUpdgrade = CFG.read("acidUpdgrade")

	yim_resupplier:add_imgui(function()
		if network.is_session_started() and not (SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0) then
			hangarOwned = stats.get_int(MPX() .. "PROP_HANGAR") ~= 0
			fCashOwned = stats.get_int(MPX() .. "PROP_FAC_SLOT0") ~= 0
			cokeOwned = stats.get_int(MPX() .. "PROP_FAC_SLOT1") ~= 0
			methOwned = stats.get_int(MPX() .. "PROP_FAC_SLOT2") ~= 0
			weedOwned = stats.get_int(MPX() .. "PROP_FAC_SLOT3") ~= 0
			fdOwned = stats.get_int(MPX() .. "PROP_FAC_SLOT4") ~= 0
			bunkerOwned = stats.get_int(MPX() .. "PROP_FAC_SLOT5") ~= 0
			acidOwned = stats.get_int(MPX() .. "PROP_FAC_SLOT6") ~= 0
			ImGui.BeginTabBar("YimResupplier", ImGuiTabBarFlags.None)
			if ImGui.BeginTabItem("Manage Supplies") then
				local wh1Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE0") or 0
				local wh2Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE1") or 0
				local wh3Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE2") or 0
				local wh4Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE3") or 0
				local wh5Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE4") or 0
				local hangarSupply = stats.get_int(MPX() .. "HANGAR_CONTRABAND_TOTAL") or 0
				local cashSupply = stats.get_int(MPX() .. "MATTOTALFORFACTORY0") or 0
				local dfSupply = stats.get_int(MPX() .. "MATTOTALFORFACTORY1") or 0
				local methSupply = stats.get_int(MPX() .. "MATTOTALFORFACTORY2") or 0
				local weedSupply = stats.get_int(MPX() .. "MATTOTALFORFACTORY3") or 0
				local cokeSupply = stats.get_int(MPX() .. "MATTOTALFORFACTORY4") or 0
				local bunkerSupply = stats.get_int(MPX() .. "MATTOTALFORFACTORY5") or 0
				local acidSupply = stats.get_int(MPX() .. "MATTOTALFORFACTORY6") or 0
				local ceoSupply = (wh1Supplies + wh2Supplies + wh3Supplies + wh4Supplies + wh5Supplies)
				ImGui.Spacing()
				ImGui.Text("Hangar Cargo")
				ImGui.Separator()
				if hangarOwned then
					ImGui.Text("Current Supplies:")
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.ProgressBar((hangarSupply / 50), 140, 30)
					if hangarSupply < 50 then
						if ImGui.Button("Source Random Crate(s)") then
							script.run_in_fiber(function()
								stats.set_bool_masked(MPX() .. "DLC22022PSTAT_BOOL3", true, 9)
							end)
						end
						ImGui.SameLine()
						hangarLoop, used = ImGui.Checkbox("Auto-Fill", hangarLoop)
						if hangarLoop then
							script.run_in_fiber(function(hangarSupp)
								repeat
									stats.set_bool_masked(MPX() .. "DLC22022PSTAT_BOOL3", true, 9)
									hangarSupp:sleep(969)
								until hangarSupply == 50 or hangarLoop == false
							end)
						end
					else
						if hangarLoop then
							hangarLoop = false
						end
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						if ImGui.Button("Teleport##hangar") then
							script.run_in_fiber(function()
								local hangarBlip = HUD.GET_FIRST_BLIP_INFO_ID(569)
								local hangarLoc
								if HUD.DOES_BLIP_EXIST(hangarBlip) then
									hangarLoc = HUD.GET_BLIP_COORDS(hangarBlip)
									selfTP(true, false, hangarLoc)
								end
							end)
						end
					end
				else
					ImGui.Text("You don't own a Hangar.")
				end
				ImGui.Spacing()
				ImGui.Text("CEO Warehouses")
				ImGui.Separator()
				ImGui.Text("Current Supplies:")
				ImGui.SameLine()
				ImGui.Dummy(10, 1)
				ImGui.SameLine()
				ImGui.ProgressBar((ceoSupply / 555), 140, 30)
				if ceoSupply < 555 then
					if ImGui.Button("Source Random Crate(s)##ceo") then
						script.run_in_fiber(function(fillceo)
							for i = 12, 16 do
								stats.set_bool_masked(MPX() .. "FIXERPSTAT_BOOL1", true, i)
								fillceo:sleep(500)
							end
						end)
					end
					ImGui.SameLine()
					ceoLoop, used = ImGui.Checkbox("Auto-Fill##ceo", ceoLoop)
					if ceoLoop then
						script.run_in_fiber(function(ceoloop)
							repeat
								for i = 12, 16 do
									stats.set_bool_masked(MPX() .. "FIXERPSTAT_BOOL1", true, i)
									ceoloop:sleep(500)
								end
								ceoloop:sleep(969)
							until ceoSupply == 555 or ceoLoop == false
						end)
					end
				else
					if ceoLoop then
						ceoLoop = false
					end
				end
				if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
					if ImGui.Button("Teleport To Office") then
						script.run_in_fiber(function()
							local ceoBlip = HUD.GET_FIRST_BLIP_INFO_ID(475)
							local ceoLoc
							if HUD.DOES_BLIP_EXIST(ceoBlip) then
								ceoLoc = HUD.GET_BLIP_COORDS(ceoBlip)
								selfTP(true, false, ceoLoc)
							end
						end)
					end
				end
				ImGui.Spacing()
				ImGui.Text("MC Supplies")
				ImGui.Separator()
				if fCashOwned then
					ImGui.Text("Fake Cash:")
					ImGui.SameLine()
					ImGui.Dummy(55, 1)
					ImGui.SameLine()
					ImGui.ProgressBar((cashSupply / 100), 140, 30)
					if math.ceil(cashSupply) < 100 then
						ImGui.SameLine()
						if ImGui.Button(" Fill ##FakeCash") then
							globals.set_int(main_global + 0 + 1, 1)
						end
						ImGui.SameLine()
						ImGui.Dummy(5, 1)
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						if ImGui.Button("Teleport##fc") then
							script.run_in_fiber(function()
								local fcBlip = HUD.GET_FIRST_BLIP_INFO_ID(500)
								local fcLoc
								if HUD.DOES_BLIP_EXIST(fcBlip) then
									fcLoc = HUD.GET_BLIP_COORDS(fcBlip)
									selfTP(false, false, fcLoc)
								end
							end)
						end
					end
				else
					ImGui.Text("You don't own a Fake Cash business.")
				end
				if cokeOwned then
					ImGui.Text("Cocaine:")
					ImGui.SameLine()
					ImGui.Dummy(73, 1)
					ImGui.SameLine()
					ImGui.ProgressBar((cokeSupply / 100), 140, 30)
					if math.ceil(cokeSupply) < 100 then
						ImGui.SameLine()
						if ImGui.Button(" Fill ##Cocaine") then
							globals.set_int(main_global + 4 + 1, 1)
						end
						ImGui.SameLine()
						ImGui.Dummy(5, 1)
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						if ImGui.Button("Teleport##coke") then
							script.run_in_fiber(function()
								local cokeBlip = HUD.GET_FIRST_BLIP_INFO_ID(497)
								local cokeLoc
								if HUD.DOES_BLIP_EXIST(cokeBlip) then
									cokeLoc = HUD.GET_BLIP_COORDS(cokeBlip)
									selfTP(false, false, cokeLoc)
								end
							end)
						end
					end
				else
					ImGui.Text("You don't own a Cocaine business.")
				end
				if methOwned then
					ImGui.Text("Meth:")
					ImGui.SameLine()
					ImGui.Dummy(95, 1)
					ImGui.SameLine()
					ImGui.ProgressBar((methSupply / 100), 140, 30)
					if math.ceil(methSupply) < 100 then
						ImGui.SameLine()
						if ImGui.Button(" Fill ##Meth") then
							globals.set_int(main_global + 2 + 1, 1)
						end
						ImGui.SameLine()
						ImGui.Dummy(5, 1)
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						if ImGui.Button("Teleport##meth") then
							script.run_in_fiber(function()
								local methBlip = HUD.GET_FIRST_BLIP_INFO_ID(499)
								local methLoc
								if HUD.DOES_BLIP_EXIST(methBlip) then
									methLoc = HUD.GET_BLIP_COORDS(methBlip)
									selfTP(false, false, methLoc)
								end
							end)
						end
					end
				else
					ImGui.Text("You don't own a Meth business.")
				end
				if weedOwned then
					ImGui.Text("Weed:")
					ImGui.SameLine()
					ImGui.Dummy(90, 1)
					ImGui.SameLine()
					ImGui.ProgressBar((weedSupply / 100), 140, 30)
					if math.ceil(weedSupply) < 100 then
						ImGui.SameLine()
						if ImGui.Button(" Fill ##Weed") then
							globals.set_int(main_global + 3 + 1, 1)
						end
						ImGui.SameLine()
						ImGui.Dummy(5, 1)
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						if ImGui.Button("Teleport##weed") then
							script.run_in_fiber(function()
								local weedBlip = HUD.GET_FIRST_BLIP_INFO_ID(496)
								local weedLoc
								if HUD.DOES_BLIP_EXIST(weedBlip) then
									weedLoc = HUD.GET_BLIP_COORDS(weedBlip)
									selfTP(false, false, weedLoc)
								end
							end)
						end
					end
				else
					ImGui.Text("You don't own a Weed business.")
				end
				if fdOwned then
					ImGui.Text("Document Forgery: ")
					ImGui.SameLine()
					ImGui.ProgressBar((dfSupply / 100), 140, 30)
					if math.ceil(dfSupply) < 100 then
						ImGui.SameLine()
						if ImGui.Button(" Fill ##DocumentForgery") then
							globals.set_int(main_global + 1 + 1, 1)
						end
						ImGui.SameLine()
						ImGui.Dummy(5, 1)
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						if ImGui.Button("Teleport##fd") then
							script.run_in_fiber(function()
								local fdBlip = HUD.GET_FIRST_BLIP_INFO_ID(498)
								local fdLoc
								if HUD.DOES_BLIP_EXIST(fdBlip) then
									fdLoc = HUD.GET_BLIP_COORDS(fdBlip)
									selfTP(false, false, fdLoc)
								end
							end)
						end
					end
				else
					ImGui.Text("You don't own a Document Forgery office.")
				end
				if bunkerOwned then
					ImGui.Text("Bunker:")
					ImGui.SameLine()
					ImGui.Dummy(80, 1)
					ImGui.SameLine()
					ImGui.ProgressBar((bunkerSupply / 100), 140, 30)
					if math.ceil(bunkerSupply) < 100 then
						ImGui.SameLine()
						if ImGui.Button(" Fill ##Bunker") then
							globals.set_int(main_global + 5 + 1, 1)
						end
						ImGui.SameLine()
						ImGui.Dummy(5, 1)
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						if ImGui.Button("Teleport##bunker") then
							script.run_in_fiber(function()
								local bunkerBlip = HUD.GET_FIRST_BLIP_INFO_ID(557)
								local bunkerLoc
								if HUD.DOES_BLIP_EXIST(bunkerBlip) then
									bunkerLoc = HUD.GET_BLIP_COORDS(bunkerBlip)
									selfTP(true, false, bunkerLoc)
								end
							end)
						end
					end
				else
					ImGui.Text("You don't own a Bunker.")
				end
				if acidOwned then
					ImGui.Text("Acid Lab:")
					ImGui.SameLine()
					ImGui.Dummy(70, 1)
					ImGui.SameLine()
					ImGui.ProgressBar((acidSupply / 100), 140, 30)
					if math.ceil(acidSupply) < 100 then
						ImGui.SameLine()
						if ImGui.Button(" Fill ##AcidLab") then
							globals.set_int(main_global + 6 + 1, 1)
						end
						ImGui.SameLine()
						ImGui.Dummy(5, 1)
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						if ImGui.Button("Teleport##acid") then
							script.run_in_fiber(function()
								local acidBlip = HUD.GET_FIRST_BLIP_INFO_ID(848)
								local acidLoc
								if HUD.DOES_BLIP_EXIST(acidBlip) then
									acidLoc = HUD.GET_BLIP_COORDS(acidBlip)
									selfTP(true, false, acidLoc)
								end
							end)
						end
					end
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.Dummy(1, 10)
						coloredText(
							"WARNING!\10Teleport buttons might be broken in public sessions.",
							40,
							{ 255, 204, 0, 0.8 }
						)
					end
				else
					ImGui.Text("You don't own an Acid Lab.")
				end
				ImGui.EndTabItem()
			end
			if ImGui.BeginTabItem("Production Overview") then
				--------------------------------------- Hangar ----------------------------------------------------------------------
				if hangarOwned then
					ImGui.Text("Hangar:")
					local hangarCargo = stats.get_int(MPX() .. "HANGAR_CONTRABAND_TOTAL") or 0
					hangarTotal = hangarCargo * 30000
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(hangarCargo / 50),
						160,
						25,
						tostring(hangarCargo) .. " Crates (" .. tostring(math.floor(hangarCargo / 0.5)) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(formatMoney(hangarTotal))
				end
				--------------------------------------- CEO ----------------------------------------------------------------------
				ImGui.Separator()
				ImGui.Text("CEO:")
				local wh1Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE0") or 0
				local wh2Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE1") or 0
				local wh3Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE2") or 0
				local wh4Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE3") or 0
				local wh5Supplies = stats.get_int(MPX() .. "CONTOTALFORWHOUSE4") or 0
				if wh1Supplies ~= nil and wh1Supplies > 0 then
					wh1Value = (globals.get_int(262145 + (getCEOvalue_G(wh1Supplies))))
				else
					wh1Value = 0
				end
				if wh2Supplies ~= nil and wh2Supplies > 0 then
					wh2Value = (globals.get_int(262145 + (getCEOvalue_G(wh2Supplies))))
				else
					wh2Value = 0
				end
				if wh3Supplies ~= nil and wh3Supplies > 0 then
					wh3Value = (globals.get_int(262145 + (getCEOvalue_G(wh3Supplies))))
				else
					wh3Value = 0
				end
				if wh4Supplies ~= nil and wh4Supplies > 0 then
					wh4Value = (globals.get_int(262145 + (getCEOvalue_G(wh4Supplies))))
				else
					wh4Value = 0
				end
				if wh5Supplies ~= nil and wh5Supplies > 0 then
					wh5Value = (globals.get_int(262145 + (getCEOvalue_G(wh5Supplies))))
				else
					wh5Value = 0
				end
				local ceoSupply = (wh1Supplies + wh2Supplies + wh3Supplies + wh4Supplies + wh5Supplies)
				ceoTotal = (
					(wh1Value * wh1Supplies)
					+ (wh2Value * wh2Supplies)
					+ (wh3Value * wh3Supplies)
					+ (wh4Value * wh4Supplies)
					+ (wh5Value * wh5Supplies)
				)
				ImGui.Text("Product:")
				ImGui.SameLine()
				ImGui.Dummy(5, 1)
				ImGui.SameLine()
				ImGui.ProgressBar(
					(ceoSupply / 555),
					160,
					25,
					tostring(ceoSupply) .. " Crates (" .. tostring(math.floor((ceoSupply / 555) * 100)) .. "%)"
				)
				ImGui.SameLine()
				ImGui.Dummy(10, 1)
				ImGui.SameLine()
				ImGui.Text("Value:")
				ImGui.SameLine()
				ImGui.Text(formatMoney(ceoTotal))
				--------------------------------------- Fake Cash -------------------------------------------------------------------
				if fCashOwned then
					ImGui.Separator()
					ImGui.Text("Fake Cash:")
					ImGui.SameLine()
					cashUpdgrade1, used = ImGui.Checkbox("Equipment Upgrade##cash", cashUpdgrade1)
					ImGui.SameLine()
					if used then
						CFG.save("cashUpdgrade1", cashUpdgrade1)
					end
					cashUpdgrade2, used = ImGui.Checkbox("Staff Upgrade##cash", cashUpdgrade2)
					if used then
						CFG.save("cashUpdgrade2", cashUpdgrade2)
					end
					if cashUpdgrade1 then
						cashOffset1 = globals.get_int(262145 + 17415)
					else
						cashOffset1 = 0
					end
					if cashUpdgrade2 then
						cashOffset2 = globals.get_int(262145 + 17421)
					else
						cashOffset2 = 0
					end
					local cashProduct = stats.get_int(MPX() .. "PRODTOTALFORFACTORY0") or 0
					cashTotal = ((globals.get_int(262145 + 17409) + cashOffset1 + cashOffset2) * cashProduct)
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(cashProduct / 40),
						160,
						25,
						tostring(cashProduct) .. " Boxes (" .. tostring(math.floor(cashProduct * 2.5)) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(formatMoney(cashTotal))
				end
				---------------------------------------Coke----------------------------------------------------------------------
				if cokeOwned then
					ImGui.Separator()
					ImGui.Text("Cocaine:    ")
					ImGui.SameLine()
					cokeUpdgrade1, used = ImGui.Checkbox("Equipment Upgrade##coke", cokeUpdgrade1)
					ImGui.SameLine()
					if used then
						CFG.save("cokeUpdgrade1", cokeUpdgrade1)
					end
					cokeUpdgrade2, used = ImGui.Checkbox("Staff Upgrade##coke", cokeUpdgrade2)
					if used then
						CFG.save("cokeUpdgrade2", cokeUpdgrade2)
					end
					if cokeUpdgrade1 then
						cokeOffset1 = globals.get_int(262145 + 17416)
					else
						cokeOffset1 = 0
					end
					if cokeUpdgrade2 then
						cokeOffset2 = globals.get_int(262145 + 17422)
					else
						cokeOffset2 = 0
					end
					local cokeProduct = stats.get_int(MPX() .. "PRODTOTALFORFACTORY1") or 0
					cokeTotal = ((globals.get_int(262145 + 17410) + cokeOffset1 + cokeOffset2) * cokeProduct)
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(cokeProduct / 10),
						160,
						25,
						tostring(cokeProduct) .. " Kilos (" .. tostring(cokeProduct * 10) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(formatMoney(cokeTotal))
				end
				---------------------------------------Meth-----------------------------------------------------------------------
				if methOwned then
					ImGui.Separator()
					ImGui.Text("Meth:        ")
					ImGui.SameLine()
					methUpdgrade1, used = ImGui.Checkbox("Equipment Upgrade##meth", methUpdgrade1)
					ImGui.SameLine()
					if used then
						CFG.save("methUpdgrade1", methUpdgrade1)
					end
					methUpdgrade2, used = ImGui.Checkbox("Staff Upgrade##meth", methUpdgrade2)
					if used then
						CFG.save("methUpdgrade2", methUpdgrade2)
					end
					if methUpdgrade1 then
						methOffset1 = globals.get_int(262145 + 17417)
					else
						methOffset1 = 0
					end
					if methUpdgrade2 then
						methOffset2 = globals.get_int(262145 + 17423)
					else
						methOffset2 = 0
					end
					local methProduct = stats.get_int(MPX() .. "PRODTOTALFORFACTORY2") or 0
					methTotal = ((globals.get_int(262145 + 17411) + methOffset1 + methOffset2) * methProduct)
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(methProduct / 20),
						160,
						25,
						tostring(methProduct) .. " Pounds (" .. tostring(methProduct * 5) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(formatMoney(methTotal))
				end
				---------------------------------------Weed------------------------------------------------------------------------
				if weedOwned then
					ImGui.Separator()
					ImGui.Text("Weed:       ")
					ImGui.SameLine()
					weedUpdgrade1, used = ImGui.Checkbox("Equipment Upgrade##weed", weedUpdgrade1)
					ImGui.SameLine()
					if used then
						CFG.save("weedUpdgrade1", weedUpdgrade1)
					end
					weedUpdgrade2, used = ImGui.Checkbox("Staff Upgrade##weed", weedUpdgrade2)
					if used then
						CFG.save("weedUpdgrade2", weedUpdgrade2)
					end
					if weedUpdgrade1 then
						weedOffset1 = globals.get_int(262145 + 17418)
					else
						weedOffset1 = 0
					end
					if weedUpdgrade2 then
						weedOffset2 = globals.get_int(262145 + 17424)
					else
						weedOffset2 = 0
					end
					local weedProduct = stats.get_int("MPX_PRODTOTALFORFACTORY3")
					weedTotal = ((globals.get_int(262145 + 17412) + weedOffset1 + weedOffset2) * weedProduct)
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(weedProduct / 80),
						160,
						25,
						tostring(weedProduct) .. " Pounds (" .. tostring(math.floor(weedProduct / 8 * 10)) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(formatMoney(weedTotal))
				end
				---------------------------------------Document Forgery------------------------------------------------------------
				if fdOwned then
					ImGui.Separator()
					ImGui.Text("Fake ID:    ")
					ImGui.SameLine()
					fdUpdgrade1, used = ImGui.Checkbox("Equipment Upgrade##fd", fdUpdgrade1)
					ImGui.SameLine()
					if used then
						CFG.save("fdUpdgrade1", fdUpdgrade1)
					end
					fdUpdgrade2, used = ImGui.Checkbox("Staff Upgrade##fd", fdUpdgrade2)
					if used then
						CFG.save("fdUpdgrade2", fdUpdgrade2)
					end
					if fdUpdgrade1 then
						fdOffset1 = globals.get_int(262145 + 17414)
					else
						fdOffset1 = 0
					end
					if fdUpdgrade2 then
						fdOffset2 = globals.get_int(262145 + 17420)
					else
						fdOffset2 = 0
					end
					local fdProduct = stats.get_int("MPX_PRODTOTALFORFACTORY4")
					fdTotal = ((globals.get_int(262145 + 17408) + fdOffset1 + fdOffset2) * fdProduct)
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(fdProduct / 60),
						160,
						25,
						tostring(fdProduct) .. " Boxes (" .. tostring(math.floor(fdProduct / 6 * 10)) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(formatMoney(fdTotal))
				end
				---------------------------------------Bunker-----------------------------------------------------------------------
				if bunkerOwned then
					ImGui.Separator()
					ImGui.Text("Bunker:     ")
					ImGui.SameLine()
					bunkerUpdgrade1, used = ImGui.Checkbox("Equipment Upgrade##bunker", bunkerUpdgrade1)
					ImGui.SameLine()
					if used then
						CFG.save("bunkerUpdgrade1", bunkerUpdgrade1)
					end
					bunkerUpdgrade2, used = ImGui.Checkbox("Staff Upgrade##bunker", bunkerUpdgrade2)
					if used then
						CFG.save("bunkerUpdgrade2", bunkerUpdgrade2)
					end
					if bunkerUpdgrade1 then
						bunkerOffset1 = globals.get_int(262145 + 21345)
					else
						bunkerOffset1 = 0
					end
					if bunkerUpdgrade2 then
						bunkerOffset2 = globals.get_int(262145 + 21344)
					else
						bunkerOffset2 = 0
					end
					local bunkerProduct = stats.get_int("MPX_PRODTOTALFORFACTORY5")
					bunkerTotal = ((globals.get_int(262145 + 21343) + bunkerOffset1 + bunkerOffset2) * bunkerProduct)
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(bunkerProduct / 100),
						160,
						25,
						tostring(bunkerProduct) .. " Crates (" .. tostring(bunkerProduct) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(
						"BC: " .. formatMoney(bunkerTotal) .. "\nLS: " .. formatMoney(math.floor(bunkerTotal * 1.5))
					)
				end
				---------------------------------------Acid Lab-------------------------------------------------------------------
				if acidOwned then
					ImGui.Separator()
					ImGui.Text("Acid Lab:   ")
					ImGui.SameLine()
					acidUpdgrade, used = ImGui.Checkbox("Equipment Upgrade##acid", acidUpdgrade)
					if used then
						CFG.save("acidUpdgrade", acidUpdgrade)
					end
					if acidUpdgrade then
						acidOffset = globals.get_int(262145 + 17419)
					else
						acidOffset = 0
					end
					local acidProduct = stats.get_int("MPX_PRODTOTALFORFACTORY6")
					acidTotal = ((globals.get_int(262145 + 17413) + acidOffset) * acidProduct)
					ImGui.Text("Product:")
					ImGui.SameLine()
					ImGui.Dummy(5, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(
						(acidProduct / 100),
						160,
						25,
						tostring(acidProduct) .. " Sheets (" .. tostring(math.floor(acidProduct / 16 * 10)) .. "%)"
					)
					ImGui.SameLine()
					ImGui.Dummy(10, 1)
					ImGui.SameLine()
					ImGui.Text("Value:")
					ImGui.SameLine()
					ImGui.Text(formatMoney(acidTotal))
				end
				ImGui.Spacing()
				ImGui.Separator()
				local finalAmt = (
					hangarTotal
					+ ceoTotal
					+ cashTotal
					+ cokeTotal
					+ methTotal
					+ weedTotal
					+ fdTotal
					+ bunkerTotal
					+ acidTotal
				)
				ImGui.Spacing()
				ImGui.Text("Total Profit = " .. formatMoney(finalAmt))
				ImGui.EndTabItem()
			end
			if ImGui.BeginTabItem("Business Safes") then
				if stats.get_int("MPX_PROP_NIGHTCLUB") ~= 0 then
					ImGui.Spacing()
					ImGui.Spacing()
					ImGui.Text("¤ Nightclub ¤")
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						ImGui.Dummy(50, 1)
						ImGui.SameLine()
						if ImGui.Button("Teleport##nc") then
							script.run_in_fiber(function()
								local ncBlip = HUD.GET_FIRST_BLIP_INFO_ID(614)
								local ncLoc
								if HUD.DOES_BLIP_EXIST(ncBlip) then
									ncLoc = HUD.GET_BLIP_COORDS(ncBlip)
									selfTP(false, false, ncLoc)
								end
							end)
						end
					end
					local currentNcPop = stats.get_int("MPX_CLUB_POPULARITY")
					local popDiff = 1000 - currentNcPop
					local currNcSafeMoney = stats.get_int("MPX_CLUB_SAFE_CASH_VALUE")
					ImGui.Text("Popularity: ")
					ImGui.SameLine()
					ImGui.Dummy(35, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(currentNcPop / 1000, 160, 25, tostring(currentNcPop))
					if currentNcPop < 1000 then
						ImGui.SameLine()
						if ImGui.Button("Max Popularity") then
							stats.set_int("MPX_CLUB_POPULARITY", currentNcPop + popDiff)
							gui.show_success("YimResupplier", "Nightclub popularity increased.")
						end
					end
					ImGui.Text("Safe: ")
					ImGui.SameLine()
					ImGui.Dummy(75, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(currNcSafeMoney / 250000, 160, 25, formatMoney(currNcSafeMoney))
					ImGui.Separator()
				end
				if stats.get_int("MPX_PROP_ARCADE") ~= 0 then
					ImGui.Spacing()
					ImGui.Spacing()
					ImGui.Text("¤ Arcade ¤")
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						ImGui.Dummy(60, 1)
						ImGui.SameLine()
						if ImGui.Button("Teleport##arcade") then
							script.run_in_fiber(function()
								local arBlip = HUD.GET_FIRST_BLIP_INFO_ID(740)
								local arLoc
								if HUD.DOES_BLIP_EXIST(arBlip) then
									arLoc = HUD.GET_BLIP_COORDS(arBlip)
									selfTP(false, false, arLoc)
								end
							end)
						end
					end
					local currArSafeMoney = stats.get_int("MPX_ARCADE_SAFE_CASH_VALUE")
					ImGui.Text("Safe: ")
					ImGui.SameLine()
					ImGui.Dummy(75, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(currArSafeMoney / 100000, 160, 25, formatMoney(currArSafeMoney))
					ImGui.Separator()
				end
				if stats.get_int("MPX_PROP_SECURITY_OFFICE") ~= 0 then
					ImGui.Spacing()
					ImGui.Spacing()
					ImGui.Text("¤ Agency ¤")
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						ImGui.Dummy(60, 1)
						ImGui.SameLine()
						if ImGui.Button("Teleport##agnc") then
							script.run_in_fiber(function()
								local agncBlip = HUD.GET_FIRST_BLIP_INFO_ID(826)
								local agncLoc
								if HUD.DOES_BLIP_EXIST(agncBlip) then
									agncLoc = HUD.GET_BLIP_COORDS(agncBlip)
									selfTP(false, false, agncLoc)
								end
							end)
						end
					end
					local currAgSafeMoney = stats.get_int("MPX_FIXER_SAFE_CASH_VALUE")
					ImGui.Text("Safe: ")
					ImGui.SameLine()
					ImGui.Dummy(75, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(currAgSafeMoney / 250000, 160, 25, formatMoney(currAgSafeMoney))
					ImGui.Separator()
				end
				if stats.get_int("MPX_PROP_CLUBHOUSE") ~= 0 then
					ImGui.Spacing()
					ImGui.Spacing()
					ImGui.Text("¤ MC Clubhouse ¤")
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						ImGui.Dummy(10, 1)
						ImGui.SameLine()
						if ImGui.Button("Teleport##mc") then
							script.run_in_fiber(function()
								local mcBlip = HUD.GET_FIRST_BLIP_INFO_ID(492)
								local mcLoc
								if HUD.DOES_BLIP_EXIST(mcBlip) then
									mcLoc = HUD.GET_BLIP_COORDS(mcBlip)
									selfTP(false, false, mcLoc)
								end
							end)
						end
					end
					local currClubHouseBarProfit = stats.get_int("MPX_BIKER_BAR_RESUPPLY_CASH")
					ImGui.Text("Bar Earnings: ")
					ImGui.SameLine()
					ImGui.Dummy(15, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(currClubHouseBarProfit / 100000, 160, 25, formatMoney(currClubHouseBarProfit))
					ImGui.Separator()
				end
				if stats.get_int("MPX_PROP_BAIL_OFFICE") ~= 0 then
					ImGui.Spacing()
					ImGui.Spacing()
					ImGui.Text("¤ Bail Office ¤")
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						ImGui.Dummy(40, 1)
						ImGui.SameLine()
						if ImGui.Button("Teleport##bail") then
							script.run_in_fiber(function()
								local bailBlip = HUD.GET_FIRST_BLIP_INFO_ID(893)
								local bailLoc
								if HUD.DOES_BLIP_EXIST(bailBlip) then
									bailLoc = HUD.GET_BLIP_COORDS(bailBlip)
									bailLoc.y = bailLoc.y + 1.2
									selfTP(false, false, bailLoc)
								end
							end)
						end
					end
					local currBailSafe = stats.get_int("MPX_BAIL_SAFE_CASH_VALUE")
					ImGui.Text("Safe: ")
					ImGui.SameLine()
					ImGui.Dummy(75, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(currBailSafe / 100000, 160, 25, formatMoney(currBailSafe))
					ImGui.Separator()
				end
				if stats.get_int("MPX_SALVAGE_YARD_OWNED") ~= 0 then
					ImGui.Spacing()
					ImGui.Spacing()
					ImGui.Text("¤ Salvage Yard ¤")
					if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
						ImGui.SameLine()
						ImGui.Dummy(20, 1)
						ImGui.SameLine()
						if ImGui.Button("Teleport##salvage") then
							script.run_in_fiber(function()
								local slvgBlip = HUD.GET_FIRST_BLIP_INFO_ID(867)
								local slvgLoc
								if HUD.DOES_BLIP_EXIST(slvgBlip) then
									slvgLoc = HUD.GET_BLIP_COORDS(slvgBlip)
									selfTP(false, true, slvgLoc, 180)
								end
							end)
						end
					end
					local currSalvSafe = stats.get_int("MPX_SALVAGE_SAFE_CASH_VALUE")
					ImGui.Text("Safe: ")
					ImGui.SameLine()
					ImGui.Dummy(75, 1)
					ImGui.SameLine()
					ImGui.ProgressBar(currSalvSafe / 250000, 160, 25, formatMoney(currSalvSafe))
				end
				if INTERIOR.GET_INTERIOR_FROM_ENTITY(self.get_ped()) == 0 then
					ImGui.Dummy(1, 10)
					coloredText(
						"WARNING!\10Teleport buttons might be broken in public sessions.",
						40,
						{ 255, 204, 0, 0.8 }
					)
				end
				ImGui.EndTabItem()
			end
		else
			ImGui.Text("\nUnavailable in Single Player.\n\n")
		end
	end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ReportsMenu = L7NEG:add_tab("Reports Menu")
ReportsMenu:add_imgui(function()
	if checkOnline() then return end
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
	ImGui.Separator()
	ImGui.Text("Now onto your commends:")
	ImGui.Separator()
	ImGui.Text("Friendly: " .. stats.get_int("MPPLY_FRIENDLY"))
	ImGui.Text("Helpful: " .. stats.get_int("MPPLY_HELPFUL"))
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WareHouseDataEditorMenu = makeOnlineTab(L7NEG7:add_tab("WareHouse Data Editor"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WareHouseDataEditorMenu:add_button("Auto-Reset stats-0/0Sales", function()
	stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", 0)
	stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", 0)
	stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", 0)
	stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", 0)
	stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", 0)
	globals.set_int(CSg1, 11)
	globals.set_int(CSg2, 1)
	script:sleep(300)
	globals.set_int(CSg2, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7N = makeOnlineTab(L7NEG7:add_tab("Tutorial ReadMe"))

L7NEG7N:add_text("     Ceo Crates Method       ", function() end)
L7NEG7N:add_text("   First Enter Your Warehouse   ", function() end)
L7NEG7N:add_text(
	"   Then Stand In Front Of Your Warehouse Computer And Then Active The Enable Ceo Manager    ",
	function() end
)
L7NEG7N:add_text("", function() end)
L7NEG7N:add_text("https://l7neg.is-a.dev/discord", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HeistsDataEditorMenu = makeOnlineTab(L7NEG:add_tab("Heists Data Editor Menu"))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local ApartmentDataEditorMenu = HeistsDataEditorMenu:add_tab("Apartment Heist ")
ApartmentDataEditorMenu:add_text("Preps")
ApartmentDataEditorMenu:add_button("Complete Preps", function()
    stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
    gui.show_message("Apartment Heist", "Preps should've been completed")
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("For Fleeca:")
ApartmentDataEditorMenu:add_text("Pay for the preparation, start the first mission and as soon as you are sent to scout\nchange the session, come back to planning room, press \"Complete Preps\" near white board and press \"E\"")
ApartmentDataEditorMenu:add_text("For Other Heist:")
ApartmentDataEditorMenu:add_text("Start the mission and leave after the 1st cutscene ends, press \"Complete Preps\" near white board and press \"E\"")
ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_button("Kill Cooldown", function()
    globals.set_int(ACDg + 1 + (PLAYER.PLAYER_ID() * 77) + 76, -1)
    gui.show_message("Apartment Heist", "Cooldown should've been killed")
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Change Session", function()
    changeSession(8)
end)

local heistCuts = {
    easy = {
        [1328892776] = {-5862, 2981},
        [964111671] =  {-1614, 857},  
        [1131632450] = {-1168, 634},
        [1967927346] = {-1596, 848},
        [1182286714] = {-700, 400}
    },
    normal = {
        [1328892776] = {-2878, 1489},
        [964111671] =  {-756, 428},
        [1131632450] = {-534, 317},
        [1967927346] = {-748, 424},
        [1182286714] = {-300, 200}
    },
    hard = {
        [1328892776] = {-2284, 1192},
        [964111671] =  {-584, 342},
        [1131632450] = {-406, 253},
        [1967927346] = {-578, 339},
        [1182286714] = {-220, 160}
    }
}

ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Works only for you. Allows you to get 12 millions bonus for The Pacific Standard Job on hard difficulty.\nEnable before starting the heist. Has a cooldown.")

local apartmentBonus = ApartmentDataEditorMenu:add_checkbox("12mil Bonus")
local previousState = false

script.register_looped("SN_Apartment_Bonus", function(script)
    script:yield()
    if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
    local currentState = apartmentBonus:is_enabled()
    if currentState ~= previousState then
        stats.set_int(joaat("MPPLY_HEISTFLOWORDERPROGRESS"), currentState and 268435455 or 134217727)
        stats.set_bool(joaat("MPPLY_AWD_HST_ORDER"), not currentState)
        stats.set_int(joaat("MPPLY_HEISTTEAMPROGRESSBITSET"), currentState and 268435455 or 134217727)
        stats.set_bool(joaat("MPPLY_AWD_HST_SAME_TEAM"), not currentState)
        stats.set_int(joaat("MPPLY_HEISTNODEATHPROGREITSET"), currentState and 268435455 or 134217727)
        stats.set_bool(joaat("MPPLY_AWD_HST_ULT_CHAL"), not currentState)
        gui.show_message("12mil Bonus", currentState and "Bonus should've been applied. Don't forget about difficulty" or "Bonus should've been unapplied")
        previousState = currentState
    end
    script:sleep(100)
end)

ApartmentDataEditorMenu:add_separator()
local difficultyKeys = {"easy", "normal", "hard"}
ApartmentDataEditorMenu:add_button("3mil Payout", function()
    script.run_in_fiber(function(ap)
        local key = globals.get_int(ACDg + (PLAYER.PLAYER_ID() * 77) + 24 + 2)
        local difficultyG = globals.get_int(AHDg)
        local difficulty = difficultyKeys[difficultyG + 1]
        local cuts = heistCuts[difficulty][key]
        if cuts then
            globals.set_int(ACg1, 100 - (cuts[2] * locals.get_int("fmmc_launcher", HGGs1)))
            globals.set_int(ACg2, cuts[2])
            if key ~= 1328892776 then
                globals.set_int(ACg3, cuts[2])
                globals.set_int(ACg4, cuts[2])
            end
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
            ap:sleep(1000)
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 202, 1)
            ap:sleep(1000)
            globals.set_int(ACg5, -1 * (-100 + cuts[1]) / 2)
            gui.show_message("Apartment Heist", "Cuts should've been applied")
        end
    end)
end)
ApartmentDataEditorMenu:add_separator()


local apartCut1 = 0
local apartCut2 = 0
local apartCut3 = 0
local apartCut4 = 0
ApartmentDataEditorMenu:add_imgui(
    function ()
        PAD.DISABLE_CONTROL_ACTION(2, 237, true)
        ImGui.Text("Custom Cuts:")
        ImGui.SetNextItemWidth(150)
        apartCut1 = ImGui.InputInt("Cut 1", apartCut1)
        ImGui.SameLine()
        ImGui.SetNextItemWidth(150)
        apartCut2 = ImGui.InputInt("Cut 2", apartCut2)
        ImGui.SetNextItemWidth(150)
        apartCut3 = ImGui.InputInt("Cut 3", apartCut3)
        ImGui.SameLine()
        ImGui.SetNextItemWidth(150)
        apartCut4 = ImGui.InputInt("Cut 4", apartCut4)
        if ImGui.Button("Set Cuts") then
            script.run_in_fiber(function(ccut)
                local heistType = locals.get_int("fmmc_launcher", HGGs1)
                local multiplier = (heistType == 1328892776) and 2 or 4
                globals.set_int(ACg1, 100 - (apartCut1 * multiplier))
                globals.set_int(ACg2, 100 - (apartCut2 * multiplier))
                globals.set_int(ACg3, 100 - (apartCut3 * multiplier))
                globals.set_int(ACg4, 100 - (apartCut4 * multiplier))
                PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
                ccut:sleep(1000)
                PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 202, 1)
                ccut:sleep(1000)
                globals.set_int(ACg5, -1 * (-100 + globals.get_int(ACg1)) / multiplier)
                gui.show_message("Apartment Heist", "Cuts should've been applied")
            end)
        end
    end
)
ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Extras")
ApartmentDataEditorMenu:add_button("Bypass Fleeca Hack", function()
    locals.set_int("fm_mission_controller", AFHl, 7)
    gui.show_message("Apartment Heist", "Hacking process should've been skipped")
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Bypass Fleeca Drill", function()
    locals.set_float("fm_mission_controller", AFDl, 100)
    gui.show_message("Apartment Heist", "Drilling process should've been skipped")
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Bypass Pacific Hack", function()
    locals.set_int("fm_mission_controller", AFPl, 9)
    gui.show_message("Apartment Heist", "Hacking process should've been skipped")
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Skip Checkpoint", function()
    locals.set_int("fm_mission_controller", AHSo, locals.get_int("fm_mission_controller", AHSo) | (1 << 17))
	gui.show_message("Apartment Heist", "Checkpoint should've been skipped")
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Unlock All Jobs", function()
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0", globals.get_int(AUAJg1))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1", globals.get_int(AUAJg2))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2", globals.get_int(AUAJg3))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3", globals.get_int(AUAJg4))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3_L", 5)
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4", globals.get_int(AUAJg5))
    stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4_L", 5)
	gui.show_message("Apartment Heist", "All jobs should've been unlocked. Don't forget to restart the game")
end)
ApartmentDataEditorMenu:add_button("Solo Launch",
function()
	if locals.get_int("fmmc_launcher", HGGs1) ~= nil then
		if locals.get_int("fmmc_launcher", HGGs1) ~= 0 then
			if locals.get_int("fmmc_launcher", HGGs1) > 1 then
					locals.set_int("fmmc_launcher", HGGs2, 1)
                    globals.set_int(794989 + 4 + 1 + (locals.get_int("fmmc_launcher", HGGs1) * 95) + 75, 1)
			end
			globals.set_int(HGLs1, 1)
            globals.set_int(HGLs2, 1)
            globals.set_int(HGLs3, 1)
            globals.set_int(HGLs4, 0)
		end
	end
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Skip Cutscene", SkipCutscene)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Force Ready", function()
    script.run_in_fiber(function(script)
        network.force_script_host("fm_mission_controller")
        script:sleep(1000)
        for i = 1, 4 do
            globals.set_int(2658291 + 1 + ((i - 1) * 468) + 270, 6)
        end
        gui.show_message("Apartment Heist", "Everyone should've been forced ready")
    end)
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Instant Finish", function()
    script.run_in_fiber(function(script)
        network.force_script_host("fm_mission_controller")
        script:sleep(1000)
        local heistType = globals.get_int(ACDg + (PLAYER.PLAYER_ID() * 77) + 24 + 2)
        if heistType == 1182286714 then
            locals.set_int("fm_mission_controller", AIFl2, 5)
            locals.set_int("fm_mission_controller", AIFl3, 80)
            locals.set_int("fm_mission_controller", AIFl4, 10000000)
            locals.set_int("fm_mission_controller", AIFl5, 99999)
            locals.set_int("fm_mission_controller", AIFl6, 99999)
        else
            locals.set_int("fm_mission_controller", AIFl1, 12)
            locals.set_int("fm_mission_controller", AIFl4, 99999)
            locals.set_int("fm_mission_controller", AIFl5, 99999)
            locals.set_int("fm_mission_controller", AIFl6, 99999)
        end
    end)
end)
ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("Note: After Clicking Unlock All Heists, restart the game")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Agency tab
local AgencyContracts = {
    {name = "None", index = 3},
    {name = "Nightclub", index = 4},
    {name = "Marina", index = 12},
    {name = "Nightlife Leak", index = 28},
    {name = "Country Club", index = 60},
    {name = "Guest List", index = 123},
    {name = "High Society Leak", index = 254},
    {name = "Davis", index = 508},
    {name = "Ballas", index = 1020},
    {name = "South Central Leak", index = 2044},
    {name = "Studio Time", index = 2045},
    {name = "Don't Fuck With Dre", index = 4095}
}

local contractNames = {}
for i, contract in ipairs(AgencyContracts) do
    table.insert(contractNames, contract.name)
end
local sContract = 0
local SN_Agency = HeistsDataEditorMenu:add_tab("Agency ")
SN_Agency:add_text("Money")
local agencySafe = SN_Agency:add_checkbox("Agency Safe Loop")
script.register_looped("agencyloop", function(script)
    script:yield()
    if agencySafe:is_enabled() == true then
        gui.show_message("Business Manager", "Supplying Agency Safe with money")
        stats.set_int(MPX() .. "FIXER_COUNT", 500)
        stats.set_int(MPX() .. "FIXER_PASSIVE_PAY_TIME_LEFT", -1)
        script:sleep(500)
    end
end)
SN_Agency:add_separator()
SN_Agency:add_imgui(function()
    ImGui.Text("Contract:")
    ImGui.SetNextItemWidth(200)
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

SN_Agency:add_button("Complete Preps", function()
    stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
    stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
    stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
	gui.show_message("Agency", "Preps should've been completed")
end)
SN_Agency:add_separator()
SN_Agency:add_text("Payouts:")
local agencyPayoutValue = 0
SN_Agency:add_imgui(function()
    agencyPayoutValue, _ = ImGui.InputInt("##AgencyPayout", agencyPayoutValue)
end)
SN_Agency:add_button("Max", function()
    agencyPayoutValue = 2500000
    gui.show_message("Agency", "Payout should've been maximized. Don't forget to apply")
end)
SN_Agency:add_button("Apply Payout", function()
    local payout = agencyPayoutValue
    tunables.set_int("FIXER_FINALE_LEADER_CASH_REWARD", payout)
    gui.show_message("Agency", "Payout should've been applied")
end)
SN_Agency:add_text("Use 'Apply Payout' after you can see the minimap.")
SN_Agency:add_separator()
SN_Agency:add_button("Instant Finish", function()
    locals.set_int("fm_mission_controller_2020", AGFl1, 51338752)
    locals.set_int("fm_mission_controller_2020", AGFl2, 50)
	gui.show_message("Agency", "Heist should've been finished")
end)
SN_Agency:add_sameline()
SN_Agency:add_button("Skip Cutscene", SkipCutscene)
SN_Agency:add_sameline()
SN_Agency:add_button("Kill Cooldowns", function()
    tunables.set_int("FIXER_STORY_COOLDOWN_POSIX", 0)
    tunables.set_int("FIXER_SECURITY_CONTRACT_COOLDOWN_TIME", 0)
    tunables.set_int("REQUEST_FRANKLIN_PAYPHONE_HIT_COOLDOWN", 0)
    stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
    gui.show_message("Agency", "Cooldowns should've been killed")
end)
SN_Agency:add_separator()
SN_Agency:add_text("After All choices and pressing Complete Preps wait for sometime")

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
    { name = "Data Contract", index = 7 }
}

local autoSelectedIndex = 0
local SN_Autoshop = HeistsDataEditorMenu:add_tab("Autoshop ")
SN_Autoshop:add_imgui(function()
    ImGui.Text("Contract:")
    autoSelectedIndex = ImGui.Combo("##AutoContract", autoSelectedIndex, { AutoShopContracts[1].name, AutoShopContracts[2].name, AutoShopContracts[3].name, AutoShopContracts[4].name, AutoShopContracts[5].name, AutoShopContracts[6].name, AutoShopContracts[7].name, AutoShopContracts[8].name, AutoShopContracts[9].name }, 9)
end)
SN_Autoshop:add_button("Apply & Complete Preps", function()
    local contract = AutoShopContracts[autoSelectedIndex + 1].index
    stats.set_int(MPX() .. "TUNER_CURRENT", contract)
    stats.set_int(MPX() .. "TUNER_GEN_BS", (contract == 1 and 4351 or 12543))
    locals.set_int("tuner_planning", ASRBl, 2)
    gui.show_message("Autoshop", "Preps should've been completed")
end)
SN_Autoshop:add_button("Reset Preps", function()
    stats.set_int(MPX() .. "TUNER_GEN_BS", 12467)
    locals.set_int("tuner_planning", ASRBl, 2)
    gui.show_message("Autoshop", "Preps should've been reset")
end)
SN_Autoshop:add_button("Redraw Board", function()
    locals.set_int("tuner_planning", ASRBl, 2)
    gui.show_message("Autoshop", "Board should've been redrawn")
end)
SN_Autoshop:add_separator()
SN_Autoshop:add_text("Payouts:")
local autoPayoutValue = 0
SN_Autoshop:add_imgui(function()
    autoPayoutValue, _ = ImGui.InputInt("##AutoPayout", autoPayoutValue)
end)
SN_Autoshop:add_button("Max", function()
    autoPayoutValue = 2000000
    gui.show_message("Autoshop", "Payout should've been maximized. Don't forget to apply")
end)
SN_Autoshop:add_button("Apply Payout", function()
    local payout = autoPayoutValue
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD0", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD1", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD2", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD3", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD4", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD5", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD6", payout)
    tunables.set_int("TUNER_ROBBERY_LEADER_CASH_REWARD7", payout)
    tunables.set_float("TUNER_ROBBERY_CONTACT_FEE", 0.0)
    gui.show_message("Autoshop", "Payout should've been applied")
end)
SN_Autoshop:add_text("Use 'Apply Payout' after you can see the minimap.")
SN_Autoshop:add_separator()
SN_Autoshop:add_text("Extras")
SN_Autoshop:add_button("Instant Finish", function ()
	locals.set_int("fm_mission_controller_2020", ASIFl1, 51338977)
	locals.set_int("fm_mission_controller_2020", ASIFl2, 101)
	gui.show_message("Autoshop", "Heist should've been finished")
end)
SN_Autoshop:add_sameline()
SN_Autoshop:add_button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Salvage Yard --
local SalvageYard = {
    robberies = {
        { name = "Cargo Ship", index = 0 },
        { name = "Gangbanger", index = 1 },
        { name = "Duggan", index = 2 },
        { name = "Podium", index = 3 },
        { name = "McTony", index = 4 }
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
        { name = "Kanjo SJ", index = 99  },
        { name = "Previon", index = 100 }
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
        { name = "Can Claim", index = 1 }
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
        cooldown_weekly = "SALV23_VEH_ROBBERY_WEEK_ID"
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
    keep_index = 0
}
local slot2 = {
    robbery_index = 0,
    vehicle_index = 0,
    mod_index = 0,
    keep_index = 0
}
local slot3 = {
    robbery_index = 0,
    vehicle_index = 0,
    mod_index = 0,
    keep_index = 0
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
local SN_Salvage = HeistsDataEditorMenu:add_tab("Salvage Yard ")
SN_Salvage:add_imgui(function()
    local nIndex, changed = ImGui.Combo("##Slot", ssIndex, slot_names, #slot_names)
    if changed then
        ssIndex = nIndex
    end
    local currSlot = ssIndex + 1
    local slots = {slot1, slot2, slot3}
    local slot = slots[currSlot]

    local nIndex, changed = ImGui.Combo("Robbery", slot.robbery_index, robbery_names, #robbery_names)
    if changed then
        slot.robbery_index = nIndex
        gui.show_message("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " robbery: " .. robbery_names[slot.robbery_index + 1])
    end

    nIndex, changed = ImGui.Combo("Vehicle", slot.vehicle_index, vehicle_names, #vehicle_names)
    if changed then
        slot.vehicle_index = nIndex
        gui.show_message("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " vehicle: " .. vehicle_names[slot.vehicle_index + 1])
    end

    nIndex, changed = ImGui.Combo("Modification", slot.mod_index, mod_names, #mod_names)
    if changed then
        slot.mod_index = nIndex
        gui.show_message("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " modification: " .. mod_names[slot.mod_index + 1])
    end

    nIndex, changed = ImGui.Combo("Status", slot.keep_index, keep_names, #keep_names)
    if changed then
        slot.keep_index = nIndex
        gui.show_message("Salvage Yard", "Selected " .. slot_names[ssIndex + 1] .. " status: " .. keep_names[slot.keep_index + 1])
    end

    if ImGui.Button("Apply Changes") then
        local robbery = SalvageYard.robberies[slot.robbery_index + 1].index
        local vehicle = SalvageYard.vehicles[slot.vehicle_index + 1].index
        local mod = SalvageYard.modifications[slot.mod_index + 1].index
        local keep = SalvageYard.keeps[slot.keep_index + 1].index
        tunables.set_int(SalvageYard.tunables["robbery_slot" .. currSlot .. "_type"], robbery)
        tunables.set_int(SalvageYard.tunables["vehicle_slot" .. currSlot .. "_type"], vehicle + mod * 100)
        tunables.set_int(SalvageYard.tunables["vehicle_slot" .. currSlot .. "_cankeep"], keep)
        locals.set_int("vehrob_planning", SYRl1, 2)
        gui.show_message("Salvage Yard", slot_names[ssIndex + 1] .. " changes should've been applied")
    end
    ImGui.SameLine()
    if ImGui.Button("Make Available") then
        stats.set_int(MPX() .. "SALV23_VEHROB_STATUS" .. (currSlot - 1), 0)
        locals.set_int("vehrob_planning", SYRl1, 2)
        gui.show_message("Salvage Yard", slot_names[ssIndex + 1] .. " should've been made Available")
    end
end)

SN_Salvage:add_text("")
SN_Salvage:add_text("Preps")
SN_Salvage:add_separator()
SN_Salvage:add_button("Complete Preps", function()
    stats.set_int(MPX() .. "SALV23_GEN_BS", -1)
    stats.set_int(MPX() .. "SALV23_SCOPE_BS", -1)
    stats.set_int(MPX() .. "SALV23_FM_PROG", -1)
    stats.set_int(MPX() .. "SALV23_INST_PROG", -1)
    locals.set_int("vehrob_planning", SYRl1, 2)
    gui.show_message("Salvage Yard", "Preps should've been completed")
end)
SN_Salvage:add_sameline()   
SN_Salvage:add_button("Reset Preps", function()
    stats.set_int(MPX() .. "SALV23_GEN_BS", 0)
    stats.set_int(MPX() .. "SALV23_SCOPE_BS", 0)
    stats.set_int(MPX() .. "SALV23_FM_PROG", 0)
    stats.set_int(MPX() .. "SALV23_INST_PROG", 0)
    locals.set_int("vehrob_planning", SYRl1, 2)
    gui.show_message("Salvage Yard", "Preps should've been reset")
end)
SN_Salvage:add_button("Reload Screen", function()
    locals.set_int("vehrob_planning", SYRl1, 2)
    gui.show_message("Salvage Yard", "Screen should've been reloaded")
end)
SN_Salvage:add_button("Skip Weekly Cooldown", function()
    tunables.set_int(SalvageYard.tunables.cooldown_weekly, stats.get_int(MPX() .. "SALV23_WEEK_SYNC") + 1)
    locals.set_int("vehrob_planning", SYRl1, 2)
    gui.show_message("Salvage Yard", "Cooldown should've been skipped")
end)

SN_Salvage:add_separator()
SN_Salvage:add_text("Payout")
local sell_value_slot1 = SN_Salvage:add_input_int("Sell Value Slot 1")
sell_value_slot1:set_value(0)
local sell_value_slot2 = SN_Salvage:add_input_int("Sell Value Slot 2")
sell_value_slot2:set_value(0)
local sell_value_slot3 = SN_Salvage:add_input_int("Sell Value Slot 3")
sell_value_slot3:set_value(0)
SN_Salvage:add_button("Apply Sell Values", function()
    tunables.set_int(SalvageYard.tunables.vehicle_slot1_value, sell_value_slot1:get_value())
    tunables.set_int(SalvageYard.tunables.vehicle_slot2_value, sell_value_slot2:get_value())
    tunables.set_int(SalvageYard.tunables.vehicle_slot3_value, sell_value_slot3:get_value())
    locals.set_int("vehrob_planning", SYRl1, 2)
    gui.show_message("Salvage Yard", "Sell values should've been applied")
end)

SN_Salvage:add_text("")
SN_Salvage:add_text("Misc")
SN_Salvage:add_separator()
SN_Salvage:add_button("Instant Finish", function()    
    for _, mission in ipairs(SalvageYard.salvage_missions) do
        local value = locals.get_int(mission.script, mission.step1)
        locals.set_int(mission.script, mission.step1, value | (1 << 11))
        locals.set_int(mission.script, mission.step2, 2)
    end
	gui.show_message("Salvage Yard", "Heist should've been finished")
end)
SN_Salvage:add_sameline()
SN_Salvage:add_button("Instant Sell", function()
    local player_ped = PLAYER.PLAYER_PED_ID()
    PED.SET_PED_COORDS_KEEP_VEHICLE(player_ped, 1169.0, -2976.0, 6.0)
	gui.show_message("Salvage Yard", "Sell mission should've been finished")
end)
SN_Salvage:add_sameline()
SN_Salvage:add_button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cluckin Bell --
local cluckperps = {
	{ id = 0 , name = "Slush Fund"},
	{ id = 1 , name = "Breaking and Entering"},
	{ id = 3 , name = "Concealed Rewards"},
	{ id = 7 , name = "Hit And Run"},
	{ id = 15, name = "Disorganized Crime"},
	{ id = 31, name = "Scene of Crime"}
}

local SN_Cluck = HeistsDataEditorMenu:add_tab("Cluckin Bell Heist ")

SN_Cluck:add_text("Complete Preps")

for _,cluckprep in ipairs(cluckperps) do
	SN_Cluck:add_button(cluckprep.name,
	function ()
		stats.set_int(MPX() .. "SALV23_INST_PROG", cluckprep.id)
	end)
	SN_Cluck:add_sameline()
end
SN_Cluck:add_separator()
SN_Cluck:add_text("Reset preps")
SN_Cluck:add_button("Reset Preps",
function ()
	stats.set_int(MPX() .. "SALV23_INST_PROG", 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Doomsday --
local function DoomsdayActSetter(progress, status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", progress)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
end

local SN_Doomsday = HeistsDataEditorMenu:add_tab("Doomsday Heist ")
SN_Doomsday:add_text("Doomsday Acts")
SN_Doomsday:add_button("Data Breaches",
function ()
	DoomsdayActSetter(503, 229383)
end)
SN_Doomsday:add_sameline()
SN_Doomsday:add_button("Bogdan Problem",
function ()
	DoomsdayActSetter(240, 229378)
end)
SN_Doomsday:add_sameline()
SN_Doomsday:add_button("Doomsday Scenario",
function ()
	DoomsdayActSetter(16368, 229380)
end)

local DoomsdayHeists = {
    [503]   = {975000, 1218750},
    [240]   = {1425000, 1771250},
    [16368] = {1800000, 2250000}
}

local function SetDoomsdayMaxPayout()
    local heist = stats.get_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG")
    local difficulty = globals.get_int(AHDg)
    if difficulty == 0 then difficulty = 1 end

    local heistData = DoomsdayHeists[heist]
    if heistData == nil then return end

    local payout = heistData[difficulty]
    local maxPayout = 2550000
    local cut = math.floor(maxPayout / (payout / 100))
    
    return cut
end

SN_Doomsday:add_separator()
SN_Doomsday:add_text("Custom Cuts:")
local dmsdyCut1 = SN_Doomsday:add_input_int("Cut 1")
local dmsdyCut2 = SN_Doomsday:add_input_int("Cut 2")
local dmsdyCut3 = SN_Doomsday:add_input_int("Cut 3")
local dmsdyCut4 = SN_Doomsday:add_input_int("Cut 4")

local Presets = {
    { name = "All - 0%", index = 0 },
    { name = "All - 85%", index = 85 },
    { name = "All - 100%", index = 100 },
    { name = "2.55mil Payout", index = -1 }
}

local presetNames = {}
for _, preset in ipairs(Presets) do
    table.insert(presetNames, preset.name)
end
local sPresetIndex = 0

SN_Doomsday:add_imgui(function()
    ImGui.Text("Presets:")
	ImGui.SetNextItemWidth(170)
    local nIndex, changed = ImGui.Combo("##DoomsdayPreset", sPresetIndex, presetNames, #presetNames)
    if changed then
        sPresetIndex = nIndex
        local selected = Presets[sPresetIndex + 1]
        local cutValue = selected.index
        if cutValue == -1 then
            cutValue = SetDoomsdayMaxPayout()
        end
        if dmsdyCut1 then dmsdyCut1:set_value(cutValue) end
        if dmsdyCut2 then dmsdyCut2:set_value(cutValue) end
        if dmsdyCut3 then dmsdyCut3:set_value(cutValue) end
        if dmsdyCut4 then dmsdyCut4:set_value(cutValue) end
    end
end)

SN_Doomsday:add_button("Apply Cuts", function()
    globals.set_int(DCg1, dmsdyCut1:get_value())
    globals.set_int(DCg2, dmsdyCut2:get_value())
    globals.set_int(DCg3, dmsdyCut3:get_value())
    globals.set_int(DCg4, dmsdyCut4:get_value())
    gui.show_message("Doomsday Heist", "Cuts should've been applied")
end)
SN_Doomsday:add_separator()
SN_Doomsday:add_text("Preps")
SN_Doomsday:add_button("Reset Preps",
function ()
	DoomsdayActSetter(240, 0)
	gui.show_message("Doomsday Heist", "Preps should've been reset")
end)
SN_Doomsday:add_sameline()
SN_Doomsday:add_button("Complete Preps",
function ()
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
end)
SN_Doomsday:add_separator()
SN_Doomsday:add_text("Extras")
SN_Doomsday:add_button("By Act III Pass hack",
function ()
	locals.set_int("fm_mission_controller", DDSHl, 3)
end)
SN_Doomsday:add_sameline()
SN_Doomsday:add_button("Solo Launch",
function()
	if locals.get_int("fmmc_launcher", HGGs1) ~= nil then
		if locals.get_int("fmmc_launcher", HGGs1) ~= 0 then
			if locals.get_int("fmmc_launcher", HGGs1) > 1 then
					locals.set_int("fmmc_launcher", HGGs2, 1)
                    globals.set_int(794989 + 4 + 1 + (locals.get_int("fmmc_launcher", HGGs1) * 95) + 75, 1)
			end
			globals.set_int(HGLs1, 1)
            globals.set_int(HGLs2, 1)
            globals.set_int(HGLs3, 1)
            globals.set_int(HGLs4, 0)
		end
	end
end)
SN_Doomsday:add_button("Instant Finish", function()
    locals.set_int("fm_mission_controller", DDIF1, 12)
    locals.set_int("fm_mission_controller", DDIF2, 150)
    locals.set_int("fm_mission_controller", DDIF3, 99999)
    locals.set_int("fm_mission_controller", DDIF4, 99999)
    locals.set_int("fm_mission_controller", DDIF5, 80)
	gui.show_message("Doomsday Heist", "Heist should've been finished")
end)
SN_Doomsday:add_sameline()
SN_Doomsday:add_button("Force Ready", function()
    script.run_in_fiber(function(script)
        network.force_script_host("fm_mission_controller")
        script:sleep(1000)
        for i = 1, 4 do
            globals.set_int(1882572 + 1 + ((i - 1) * 315) + 43 + 11 + i, 1)
        end
        gui.show_message("Doomsday Heist", "Everyone should've been forced ready")
    end)
end)
SN_Doomsday:add_sameline()
SN_Doomsday:add_button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Casino Heist --
local CasinoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Casino Heist")

CasinoHeistEditorMenu:add_text("One Click Setups:")
CasinoHeistEditorMenu:add_button("Casino Silent&Sneaky (Diamonds)", function()
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
CasinoHeistEditorMenu:add_button("Casino The Big Con (Diamonds)", function()
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
CasinoHeistEditorMenu:add_button("Casino Aggressive (Diamonds)", function()
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

CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Preps:")

DiamondCasinoDifficulties = {
    { name = "Normal", index = 0 },
    { name = "Hard", index = 1 }
}

diamondApproachList = {
    { name = "Silent n Snea.", index = 1 },
    { name = "Big Con", index = 2 },
    { name = "Aggressive", index = 3 }
}

diamondGunmanList = {
    { name = "Karl Abolaji", index = 1 },
    { name = "Charlie Reed", index = 3 },
    { name = "Patrick McRear.", index = 5 },
    { name = "Gustavo Mota", index = 2 },
    { name = "Chester McCoy", index = 4 }
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
    { name = "Assault Rifle II", index = 4 }
}

diamondDriverList = {
    { name = "Karim Denz", index = 1 },
    { name = "Zach Nelson", index = 4 },
    { name = "Taliana Martinez", index = 2 },
    { name = "Eddie Toh", index = 3 },
    { name = "Chester McCoy", index = 5 }
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
    { name = "Everon", index = 5 }
}

diamondHackerList = {
    { name = "Rickie Lukens", index = 1 },
    { name = "Yohan Blair", index = 3 },
    { name = "Christian Feltz", index = 2 },
    { name = "Page Harris", index = 5 },
    { name = "Avi Schwartz.", index = 4 }
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
    { name = "Hockey Set", index = 12 }
}

diamondGuardsList = {
    { name = "Elite", index = 0 },
    { name = "Pro", index = 1 },
    { name = "Unit", index = 2 },
    { name = "Rookie", index = 3 }
}

diamondKeycardsList = {
    { name = "None", index = 0 },
    { name = "Level 1", index = 1 },
    { name = "Level 2", index = 2 }
}

diamondTargetList = {
    { name = "Cash", index = 0 },
    { name = "Arts", index = 2 },
    { name = "Gold", index = 1 },
    { name = "Diamonds", index = 3 }
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
    { tunable = "HEIST3_HACKERS_PAIGE_CUT", default = 9 }
}

diamondDifficultyNames = {}
for _, item in ipairs(DiamondCasinoDifficulties) do
    table.insert(diamondDifficultyNames, item.name)
end
diamondDifficultyIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Difficulty", diamondDifficultyIndex, diamondDifficultyNames, #diamondDifficultyNames)
    if changed then
        diamondDifficultyIndex = nIndex
    end
end)

diamondApproachNames = {}
for _, item in ipairs(diamondApproachList) do
    table.insert(diamondApproachNames, item.name)
end
diamondApproachIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Approach", diamondApproachIndex, diamondApproachNames, #diamondApproachNames)
    if changed then
        diamondApproachIndex = nIndex
    end
end)

diamondGunmanNames = {}
for _, item in ipairs(diamondGunmanList) do
    table.insert(diamondGunmanNames, item.name)
end
diamondGunmanIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Gunman", diamondGunmanIndex, diamondGunmanNames, #diamondGunmanNames)
    if changed then
        diamondGunmanIndex = nIndex
        diamondLoadoutIndex = 0
    end
end)

local diamondLoadoutIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local gIndex = diamondGunmanList[diamondGunmanIndex + 1].index
    local filnames = {}
    local count = 0
    for _, item in ipairs(diamondLoadoutList) do
        if item.index == gIndex then
            count = count + 1
            table.insert(filnames, item.name)
        end
    end
    local nIndex, changed = ImGui.Combo("Loadout", diamondLoadoutIndex, filnames, count)
    if changed then
        diamondLoadoutIndex = nIndex
    end
end)

local diamondDriverNames = {}
for _, item in ipairs(diamondDriverList) do
    table.insert(diamondDriverNames, item.name)
end
local diamondDriverIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Driver", diamondDriverIndex, diamondDriverNames, #diamondDriverNames)
    if changed then
        diamondDriverIndex = nIndex
        diamondVehiclesIndex = 0
    end
end)

local diamondVehiclesIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local dIndex = diamondDriverList[diamondDriverIndex + 1].index
    local filnames = {}
    local count = 0
    for _, item in ipairs(diamondVehiclesList) do
        if item.index == dIndex then
            count = count + 1
            table.insert(filnames, item.name)
        end
    end
    local nIndex, changed = ImGui.Combo("Vehicles", diamondVehiclesIndex, filnames, count)
    if changed then
        diamondVehiclesIndex = nIndex
    end
end)

local diamondHackerNames = {}
for _, item in ipairs(diamondHackerList) do
    table.insert(diamondHackerNames, item.name)
end
local diamondHackerIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Hacker", diamondHackerIndex, diamondHackerNames, #diamondHackerNames)
    if changed then
        diamondHackerIndex = nIndex
    end
end)

local diamondMasksNames = {}
for _, item in ipairs(diamondMasksList) do
    table.insert(diamondMasksNames, item.name)
end
local diamondMasksIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Masks", diamondMasksIndex, diamondMasksNames, #diamondMasksNames)
    if changed then
        diamondMasksIndex = nIndex
    end
end)

local diamondGuardsNames = {}
for _, item in ipairs(diamondGuardsList) do
    table.insert(diamondGuardsNames, item.name)
end
local diamondGuardsIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Guards", diamondGuardsIndex, diamondGuardsNames, #diamondGuardsNames)
    if changed then
        diamondGuardsIndex = nIndex
    end
end)

local diamondKeycardsNames = {}
for _, item in ipairs(diamondKeycardsList) do
    table.insert(diamondKeycardsNames, item.name)
end
local diamondKeycardsIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Keycards", diamondKeycardsIndex, diamondKeycardsNames, #diamondKeycardsNames)
    if changed then
        diamondKeycardsIndex = nIndex
    end
end)

local diamondTargetNames = {}
for _, item in ipairs(diamondTargetList) do
    table.insert(diamondTargetNames, item.name)
end
local diamondTargetIndex = 0
CasinoHeistEditorMenu:add_imgui(function()
    local nIndex, changed = ImGui.Combo("Target", diamondTargetIndex, diamondTargetNames, #diamondTargetNames)
    if changed then
        diamondTargetIndex = nIndex
    end
end)

local function payoutSelected()
    -- Placeholder for payout logic if needed
end

CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_button("Apply & Complete Preps", function()
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
    locals.set_int("gb_casino_heist_planning", DCRBl, 2)
    gui.show_message("Diamond Casino Heist", "Preps should've been completed")
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Reset Preps", function()
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
    locals.set_int("gb_casino_heist_planning", DCRBl, 2)
    gui.show_message("Diamond Casino Heist", "Preps should've been reset")
end)

CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Cuts:")
local casinoCrewCuts = CasinoHeistEditorMenu:add_checkbox("Remove Crew Cuts")
script.register_looped("DiamondCasino_Crew", function()
    if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
    local remove = casinoCrewCuts:is_enabled()
    for _, cut in ipairs(DiamondCasinoCrewCut) do
        if remove then
            tunables.set_int(cut.tunable, 0)
        else
            tunables.set_int(cut.tunable, cut.default)
        end
    end
end)

local function SetDiamondMaxPayout()
    local approach = stats.get_int(MPX() .. "H3OPT_APPROACH")
    local hardApproach = stats.get_int(MPX() .. "H3_HARD_APPROACH")
    local target = stats.get_int(MPX() .. "H3OPT_TARGET")
    local difficulty = (approach == hardApproach) and 2 or 1
    
    local payouts = {
        [0] = { 2115000, 2326500 },
        [2] = { 2350000, 2585000 },
        [1] = { 2585000, 2843500 },
        [3] = { 3290000, 3619000 }
    }
    
    if payouts[target] == nil then return 100, 100 end
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

local casinoPc1 = CasinoHeistEditorMenu:add_input_int("Player Cut 1")
local casinoPc2 = CasinoHeistEditorMenu:add_input_int("Player Cut 2")
local casinoPc3 = CasinoHeistEditorMenu:add_input_int("Player Cut 3")
local casinoPc4 = CasinoHeistEditorMenu:add_input_int("Player Cut 4")

local Presets = {
    { name = "All - 0%", index = 0 },
    { name = "All - 85%", index = 85 },
    { name = "All - 100%", index = 100 },
    { name = "3.6mil Payout", index = -1 }
}

local presetNames = {}
for _, preset in ipairs(Presets) do
    table.insert(presetNames, preset.name)
end
local sPresetIndex = 0

CasinoHeistEditorMenu:add_imgui(function()
    if isOffline() then return end
    ImGui.Text("Presets:")
	ImGui.SetNextItemWidth(170)
    local nIndex, changed = ImGui.Combo("##DiamondPreset", sPresetIndex, presetNames, #presetNames)
    if changed then
        sPresetIndex = nIndex
        local selected = Presets[sPresetIndex + 1]
        local hostCut = selected.index
        local otherCut = selected.index
        if selected.index == -1 then
            hostCut, otherCut = SetDiamondMaxPayout()
            casinoCrewCuts:set_enabled(true)
        else
            casinoCrewCuts:set_enabled(false)
        end
        if casinoPc1 then casinoPc1:set_value(hostCut) end
        if casinoPc2 then casinoPc2:set_value(otherCut) end
        if casinoPc3 then casinoPc3:set_value(otherCut) end
        if casinoPc4 then casinoPc4:set_value(otherCut) end
    end
end)

CasinoHeistEditorMenu:add_button("Apply Cuts", function()
    globals.set_int(DCCg1, casinoPc1:get_value())
    globals.set_int(DCCg2, casinoPc2:get_value())
    globals.set_int(DCCg3, casinoPc3:get_value())
    globals.set_int(DCCg4, casinoPc4:get_value())
    gui.show_message("Casino Heist", "Cuts should've been applied")
end)

CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_button("Reload Screen", function()
	locals.set_int("gb_casino_heist_planning", DCRBl, 2)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Solo Launch", function()
	if locals.get_int("fmmc_launcher", HGGs1) ~= nil and locals.get_int("fmmc_launcher", HGGs1) ~= 0 then
		if locals.get_int("fmmc_launcher", HGGs1) > 1 then
			locals.set_int("fmmc_launcher", HGGs2, 1)
			globals.set_int(794989 + 4 + 1 + (locals.get_int("fmmc_launcher", HGGs1) * 95) + 75, 1)
		end
		globals.set_int(HGLs1, 1); globals.set_int(HGLs2, 1); globals.set_int(HGLs3, 1); globals.set_int(HGLs4, 0)
	end
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Kill Cooldown", function()
    stats.set_int(MPX() .. "H3_COMPLETEDPOSIX", -1)
    stats.set_int("MPPLY_H3_COOLDOWN", -1)
    gui.show_message("Diamond Casino Heist", "Cooldown should've been killed")
end)

local CasinoHeistExtra = CasinoHeistEditorMenu:add_tab("Extras")
CasinoHeistExtra:add_text("Hacks")
local casinoAutograbber = CasinoHeistExtra:add_checkbox("Autograbber")
script.register_looped("casinoAg", function(script)
    script:yield()
    if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
    if casinoAutograbber:is_enabled() then
        if locals.get_int(FMC, DCAg) == 3 then
            locals.set_int(FMC, DCAg, 4)
        elseif locals.get_int(FMC, DCAg) == 4 then
            locals.set_float(FMC, DCAs, 2.0)
        end
    end
end)
CasinoHeistExtra:add_button("Bypass Fingerprint Hack", function()
	if locals.get_int(FMC, DCFHl) == 4 then locals.set_int(FMC, DCFHl, 5) end
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Keypad Hack", function()
	if locals.get_int(FMC, DCKHl) ~= 4 then locals.set_int(FMC, DCKHl, 5) end
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Drill Vault Door", function()
	locals.set_int(FMC, DCDVDl1, locals.get_int(FMC, DCDVDl2))
end)
CasinoHeistExtra:add_button("Instant Finish", function()
    local approachType = stats.get_int(MPX() .. "H3OPT_APPROACH")
    if approachType == 3 then
        locals.set_int(FMC, DCXf1, 12); locals.set_int(FMC, DCXf3, 80)
        locals.set_int(FMC, DCXf4, 10000000); locals.set_int(FMC, DCXf5, 99999); locals.set_int(FMC, DCXf6, 99999)
    else    
        locals.set_int(FMC, DCXf2, 5); locals.set_int(FMC, DCXf3, 80)
        locals.set_int(FMC, DCXf4, 10000000); locals.set_int(FMC, DCXf5, 99999); locals.set_int(FMC, DCXf6, 99999)
    end
	gui.show_message("Instant Heist Passed", "Activated")
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Force Ready", function()
    script.run_in_fiber(function(script)
        network.force_script_host(FMC); script:sleep(1000)
        for i = 1, 4 do globals.set_int(1882572 + 1 + ((i - 1) * 315) + 43 + 11 + i, 1) end
    end)
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Skip Cutscene", SkipCutscene)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cayo Heist --

-- Cayo Heist --
local CayoPericoCrewCut = {
    { tunable = "IH_DEDUCTION_PAVEL_CUT", default = -0.02 },
    { tunable = "IH_DEDUCTION_FENCING_FEE", default = -0.1 }
}

local cayoPrimaryTargets = {
    {name="Panther Statue", id = 5},
    {name="Medrazo Files", id = 4},
    {name="Diamond", id = 3},
    {name="Bonds", id = 2},
    {name="Necklace", id = 1},
    {name="Tequila", id = 0}
}

local function CayoCompletePreps()
    stats.set_int(MPX() .. "H4CNF_UNIFORM", -1)
    stats.set_int(MPX() .. "H4CNF_GRAPPEL", -1)
    stats.set_int(MPX() .. "H4CNF_TROJAN", 5)
    stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
    stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
    stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
    stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 10)
    stats.set_int(MPX() .. "H4CNF_BS_GEN", -1)
    stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
    stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
    stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
end

local function CayoTargetsSetter(cash, weed, coke, gold, where, target, value)
    stats.set_int(MPX() .. "H4LOOT_CASH_" .. where, cash)
    stats.set_int(MPX() .. "H4LOOT_CASH_" .. where .. "_SCOPED", cash)
    stats.set_int(MPX() .. "H4LOOT_WEED_" .. where, weed)
    stats.set_int(MPX() .. "H4LOOT_WEED_" .. where .. "_SCOPED", weed)
    stats.set_int(MPX() .. "H4LOOT_COKE_" .. where, coke)
    stats.set_int(MPX() .. "H4LOOT_COKE_" .. where .. "_SCOPED", coke)
    stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where, gold)
    stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where .. "_SCOPED", gold)
    if target ~= "NONE" then
        stats.set_int(MPX() .. "H4LOOT_" .. target .. "_V", value)
    end
end

local function CayoPaintingsToggler(Enabled)
    if Enabled then
        stats.set_int(MPX() .. "H4LOOT_PAINT", 127)
        stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 127)
        stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
    else
        stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
        stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
    end
end

local function CutsPresetter(global_start, global_finish, cut)
    globals.set_int(GCg, cut)
    for i = global_start, global_finish do
        globals.set_int(i, cut)
    end
end

local cayoSecondaryTargets = {
    { name = "None", caps = "NONE", amount = {
        compound = { cash = 0, weed = 0, coke = 0, gold = 0 },
        island = { cash = 0, weed = 0, coke = 0, gold = 0 }
    }, value = 0 },
    { name = "Gold", caps = "GOLD", amount = {
        compound = { cash = 0, weed = 0, coke = 0, gold = 255 },
        island = { cash = 0, weed = 0, coke = 0, gold = 16777215 }
    }, value = 333333 },
    { name = "Cocaine", caps = "COKE", amount = {
        compound = { cash = 0, weed = 0, coke = 255, gold = 0 },
        island = { cash = 0, weed = 0, coke = 16777215, gold = 0 }
    }, value = 202500 },
    { name = "Weed", caps = "WEED", amount = {
        compound = { cash = 0, weed = 255, coke = 0, gold = 0 },
        island = { cash = 0, weed = 16777215, coke = 0, gold = 0 }
    }, value = 135000 },
    { name = "Cash", caps = "CASH", amount = {
        compound = { cash = 255, weed = 0, coke = 0, gold = 0 },
        island = { cash = 16777215, weed = 0, coke = 0, gold = 0 }
    }, value = 83250 }
}

local cayoLocations = {
    {name="Front Gate", x=4990.0386, y=-5717.6895, z=19.876024},
    {name="El Rubio's Office", x=5010.12, y=-5750.1353, z=28.844675},
    {name="Primary Target", x=5006.7, y=-5756.2, z=15.483983},
    {name="Secondary Target", x=4999.764160, y=-5749.863770, z=14.840000},
    {name="Safe Zone", x=4771.479, y=-6165.737, z=-39.079613},
    {name="Entrance Drinage Pipe", x=5043.74, y=-5815.3193, z=-10.574497},
    {name="Enter Cayo Perico", x=5053.8516, y=-5772.852, z=-4.1588774},
    {name="Elevator", x=5012.1533, y=-5749.0107, z=28.945145},
}

local cayoApproachVehicles = {
    {name="Longfin", id = 65345},
    {name="Patrol Boat", id = 65313},
    {name="Stealth Annihilator", id = 65425},
    {name="Velum", id = 65289},
    {name="Alkonost", id = 65413},
    {name="Kosatka", id = 65283},
    {name="All Ways", id = 65535},
}

local cayoWeapons = {
    {name="Aggressor", id = 1},
    {name="Conspirator", id = 2},
    {name="Crackshot", id = 3},
    {name="Saboteur", id = 4},
    {name="Marksman", id = 5},
}

-- Move these variables outside to maintain state
local sPrimary = 0
local compoundI = 0
local islandI = 0
local sApproach = 0
local sWeapon = 0
local bagValue = 0
local addPaintings = false
local cayocut1 = 0
local cayocut2 = 0
local cayocut3 = 0
local cayocut4 = 0
local cayoCrewCuts = false

local CayoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Cayo Perico Heist ")

-- Put EVERYTHING inside add_imgui
CayoHeistEditorMenu:add_imgui(function()
    if checkOnline() then return end
    
    -- Cayo Bag Size Editor
    ImGui.Text("Cayo Bag Size Editor")
    bagValue, _ = ImGui.InputInt("Bag Size", bagValue)
    if ImGui.Button("Set Bag Size") then
        globals.set_int(CPBg, bagValue)
        gui.show_message("Cayo Perico", "Bag size set to " .. bagValue)
    end
    
    ImGui.Separator()
    
    -- Primary Target
    ImGui.Text("Primary Target:")
    local primaryNames = {}
    for _, target in ipairs(cayoPrimaryTargets) do
        table.insert(primaryNames, target.name)
    end
    local nIndex, changed = ImGui.Combo("##CayoPrimary", sPrimary, primaryNames, #primaryNames)
    if changed then
        sPrimary = nIndex
        local selected = cayoPrimaryTargets[sPrimary + 1]
        stats.set_int(MPX() .. "H4CNF_TARGET", selected.id)
        gui.show_message("Cayo Perico", "Primary target set to: " .. selected.name)
    end
    
    ImGui.Separator()
    
    -- Secondary Targets
    local targetNames = {}
    for i, target in ipairs(cayoSecondaryTargets) do
        table.insert(targetNames, target.name)
    end
    
    ImGui.Text("Compound Target:")
    local nCompoundI, clickedCompound = ImGui.Combo("##Compound", compoundI, targetNames, #targetNames)
    if clickedCompound then
        compoundI = nCompoundI
        local selected = cayoSecondaryTargets[compoundI + 1]
        CayoTargetsSetter(
            selected.amount.compound.cash,
            selected.amount.compound.weed,
            selected.amount.compound.coke,
            selected.amount.compound.gold,
            "C",
            selected.caps,
            selected.value
        )
        gui.show_message("Cayo Perico", "Compound target set to: " .. selected.name)
    end
    
    ImGui.Text("Island Target:")
    local nIslandI, clickedIsland = ImGui.Combo("##Island", islandI, targetNames, #targetNames)
    if clickedIsland then
        islandI = nIslandI
        local selected = cayoSecondaryTargets[islandI + 1]
        CayoTargetsSetter(
            selected.amount.island.cash,
            selected.amount.island.weed,
            selected.amount.island.coke,
            selected.amount.island.gold,
            "I",
            selected.caps,
            selected.value
        )
        gui.show_message("Cayo Perico", "Island target set to: " .. selected.name)
    end
    
    ImGui.Text("")
    addPaintings, _ = ImGui.Checkbox("Paintings", addPaintings)
    
    ImGui.Separator()
    
    -- Difficulty
    ImGui.Text("Difficulty:")
    if ImGui.Button("Hard") then
        stats.set_int(MPX() .. "H4_PROGRESS", 131055)
    end
    ImGui.SameLine()
    if ImGui.Button("Normal") then
        stats.set_int(MPX() .. "H4_PROGRESS", 126823)
    end
    
    ImGui.Separator()
    
    -- Approach
    local approachNames = {}
    for _, veh in ipairs(cayoApproachVehicles) do
        table.insert(approachNames, veh.name)
    end
    ImGui.Text("Approach:")
    local nIndex2, changed2 = ImGui.Combo("##CayoApproach", sApproach, approachNames, #approachNames)
    if changed2 then
        sApproach = nIndex2
        local selected = cayoApproachVehicles[sApproach + 1]
        stats.set_int(MPX() .. "H4_MISSIONS", selected.id)
        gui.show_message("Cayo Perico", "Approach set to: " .. selected.name)
    end
    
    ImGui.Separator()
    
    -- Weapons
    local weaponNames = {}
    for _, wep in ipairs(cayoWeapons) do
        table.insert(weaponNames, wep.name)
    end
    ImGui.Text("Weapons:")
    local nIndex3, changed3 = ImGui.Combo("##CayoWeapon", sWeapon, weaponNames, #weaponNames)
    if changed3 then
        sWeapon = nIndex3
        local selected = cayoWeapons[sWeapon + 1]
        stats.set_int(MPX() .. "H4CNF_WEAPONS", selected.id)
        gui.show_message("Cayo Perico", "Weapon loadout set to: " .. selected.name)
    end
    
    ImGui.Separator()
    
    -- Preps
    if ImGui.Button("Complete Preps") then
        CayoPaintingsToggler(addPaintings)
        CayoCompletePreps()
        locals.set_int("heist_island_planning", CPRSl, 2)
    end
    ImGui.SameLine()
    if ImGui.Button("Reset Preps") then
        stats.set_int(MPX() .. "H4_PROGRESS", 0)
        stats.set_int(MPX() .. "H4_MISSIONS", 0)
        stats.set_int(MPX() .. "H4CNF_APPROACH", 0)
        stats.set_int(MPX() .. "H4CNF_TARGET", -1)
        stats.set_int(MPX() .. "H4CNF_BS_GEN", 0)
        stats.set_int(MPX() .. "H4CNF_BS_ENTR", 0)
        stats.set_int(MPX() .. "H4CNF_BS_ABIL", 0)
        stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 0)
        locals.set_int("heist_island_planning", CPRSl, 2)
    end
    
    ImGui.Separator()
    
    -- Crew Cuts
    ImGui.Text("Removes fencing fee and Pavel's cut")
    cayoCrewCuts, _ = ImGui.Checkbox("Remove Crew Cuts", cayoCrewCuts)
    -- Note: script.register_looped for this should be handled separately
    
    ImGui.Separator()
    
    -- Cuts
    ImGui.Text("Cuts to All")
    if ImGui.Button("100") then
        CutsPresetter(CPCg1, CPCg4, 100)
    end
    
    ImGui.Text("")
    ImGui.Text("Custom Cut")
    cayocut1, _ = ImGui.InputInt("Cut 1", cayocut1)
    cayocut2, _ = ImGui.InputInt("Cut 2", cayocut2)
    cayocut3, _ = ImGui.InputInt("Cut 3", cayocut3)
    cayocut4, _ = ImGui.InputInt("Cut 4", cayocut4)
    if ImGui.Button("Set") then
        globals.set_int(CPCg1, cayocut1)
        globals.set_int(CPCg2, cayocut2)
        globals.set_int(CPCg3, cayocut3)
        globals.set_int(CPCg4, cayocut4)
    end
    
    ImGui.Separator()
    
    -- Reload Planning Screen
    ImGui.Text("Reload Planning Screen")
    if ImGui.Button("Reload Planning Screen") then
        locals.set_int("heist_island_planning", CPRSl, 2)
        gui.show_message("Cayo Perico Heist", "Screen should've been reloaded")
    end
    
    ImGui.Separator()
    
    -- Extras
    ImGui.Text("Extras")
    if ImGui.Button("Bypass Drainage Cut") then
        locals.set_int("fm_mission_controller_2020", CPSTCl, 6)
        gui.show_message("Cayo Perico Heist", "Cutting process should've been skipped")
    end
    ImGui.SameLine()
    if ImGui.Button("Bypass Fingerprint Scanner") then
        locals.set_int("fm_mission_controller_2020", CPFHl, 5)
        gui.show_message("Cayo Perico Heist", "Hacking process should've been skipped")
    end
    ImGui.SameLine()
    if ImGui.Button("Bypass Plasma Cutter") then
        locals.set_float("fm_mission_controller_2020", CPPCCl, 100.0)
        gui.show_message("Cayo Perico Heist", "Cutting process should've been skipped")
    end
    
    if ImGui.Button("Remove All CCTV's") then
        for _, ent in pairs(entities.get_all_objects_as_handles()) do
            for __, cam in pairs(CamList) do
                if ENTITY.GET_ENTITY_MODEL(ent) == cam then
                    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
                    ENTITY.DELETE_ENTITY(ent)
                end
            end
        end
    end
    
    if ImGui.Button("Instant Finish") then
        locals.set_int("fm_mission_controller_2020", CPXf1, 9)
        locals.set_int("fm_mission_controller_2020", CPXf2, 50)
        gui.show_message("Cayo Perico Heist", "Heist should've been finished")
    end
    ImGui.SameLine()
    if ImGui.Button("Skip Cutscene") then
        SkipCutscene()
    end
    ImGui.SameLine()
    if ImGui.Button("Force Ready") then
        script.run_in_fiber(function(script)
            network.force_script_host("fm_mission_controller_2020")
            script:sleep(1000)
            for i = 1, 4 do
                globals.set_int(1979868 + 1 + ((i - 1) * 27) + 7 + i, 1)
            end
            gui.show_message("Cayo Perico Heist", "Everyone should've been forced ready")
        end)
    end
    
    if ImGui.Button("Kill Cooldown (after solo)") then
        stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659643454)
        stats.set_int(MPX() .. "H4_COOLDOWN", 0)
        stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
        gui.show_message("Cayo Perico Heist", "Cooldown should've been killed")
    end
    ImGui.SameLine()
    if ImGui.Button("Kill Cooldown (after team)") then
        stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659429119)
        stats.set_int(MPX() .. "H4_COOLDOWN", 0)
        stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
        gui.show_message("Cayo Perico Heist", "Cooldown should've been killed")
    end
    
    ImGui.Text("After clicking the Kill Cooldown button, go offline and then come back online")
    
    ImGui.Separator()
    
    -- Teleports
    ImGui.Text("Teleports")
    
    for i, location in ipairs(cayoLocations) do
        if ImGui.Button(location.name) then
            local ped = PLAYER.PLAYER_PED_ID()
            PED.SET_PED_COORDS_KEEP_VEHICLE(ped, location.x, location.y, location.z)
        end
        
        if i < 6 or i == 7 then
            ImGui.SameLine()
        end
    end
end)

-- Handle the Crew Cuts loop separately
script.register_looped("SN_CayoPerico_Crew", function(script)
    script:yield()
    if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then return end
    for _, cut in ipairs(CayoPericoCrewCut) do
        if cayoCrewCuts then
            tunables.set_float(cut.tunable, 0)
        else
            tunables.set_float(cut.tunable, cut.default)
        end
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Kortz Center Heist --
local KortzCenterHeistMenu = HeistsDataEditorMenu:add_tab("Kortz Center Heist")

-- State variables
local k26_general_bs = 0
local k26_robbery_prog = 0
local k26_heist_target = 0
local k26_scoping_bs = -1
local k26_poi_bs = -1

-- Bag size & multiplier variables
local bagSizeValue = 100
local weeklyMultiplierValue = 4.0

-- Primary Target Names
local k26Targets = {
    {name = "La Dernière Débauche", id = 0, payout = 481250},
    {name = "Hare Oneself Think", id = 1, payout = 304500},
    {name = "The Downfall of Rome", id = 2, payout = 305000},
    {name = "Brother Brother", id = 3, payout = 305500},
    {name = "A Cast of Characters", id = 4, payout = 306000},
    {name = "Gone To Seed", id = 5, payout = 306500},
    {name = "True Love", id = 6, payout = 307000},
    {name = "Breathless", id = 7, payout = 307500},
    {name = "Consumato", id = 8, payout = 308000},
    {name = "I Hear Voices", id = 9, payout = 308500},
    {name = "Winter, Nowhere in Particular", id = 10, payout = 309000},
    {name = "The Girl With the Pearl Necklace", id = 11, payout = 309500},
    {name = "Chat on Fruit", id = 12, payout = 310000},
    {name = "Pumpkin", id = 13, payout = 310500},
    {name = "Twindifference", id = 14, payout = 311000},
    {name = "Stacks Study V", id = 15, payout = 311500},
    {name = "I, Fruit", id = 16, payout = 312000},
    {name = "To Beat About the Bush", id = 17, payout = 312500},
    {name = "In Excess of Success", id = 18, payout = 313000},
    {name = "Juiced", id = 19, payout = 313500},
    {name = "A Winding Road Home", id = 20, payout = 314000},
    {name = "Teckels", id = 21, payout = 314500},
    {name = "Trust", id = 22, payout = 315000},
    {name = "Until Death", id = 23, payout = 315500},
    {name = "What Are Melons?", id = 24, payout = 316000},
    {name = "The Outcome of Endeavour", id = 25, payout = 365000},
    {name = "Mi O Melee", id = 26, payout = 317000}
}

local targetNames = {}
for _, target in ipairs(k26Targets) do
    table.insert(targetNames, target.name)
end

-- Helper function to set bits
local function setK26Bit(stat, bit, name)
    local current = stats.get_int(MPX() .. stat)
    stats.set_int(MPX() .. stat, current | bit)
    gui.show_message("Kortz Center Heist", name .. " enabled")
end

-- Helper function to check if Kortz Heist is active
local function isKortzHeistActive()
    return SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("fm_mission_controller_v3")) > 0
end

-- Kortz Center Cracker Functions using YimMenu API
local function KortzSkipDataCrack()
    if isKortzHeistActive() then
        for b = 0, 7 do
            locals.set_int("fm_mission_controller_v3", 1386 + (b * 4), 1)
        end
        gui.show_message("Kortz Center Cracker", "Data crack skipped")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

local function KortzSkipFingerprint()
    if isKortzHeistActive() then
        locals.set_int("fm_mission_controller_v3", 26464, 5)
        gui.show_message("Kortz Center Cracker", "Fingerprint hack skipped")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

local function KortzAutoAccessCode()
    if isKortzHeistActive() then
        for i = 0, 2 do
            locals.set_int("fm_mission_controller_v3", 32416 + 1 + (i * 2) + 1, 0)
            locals.set_float("fm_mission_controller_v3", 32416 + 1 + (i * 2), 0.0)
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 237, 1.0)
        end
        gui.show_message("Kortz Center Cracker", "Access code entered")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

local function KortzDisableLasers()
    if isKortzHeistActive() then
        locals.set_int("fm_mission_controller_v3", 70416, 4294784)
        globals.set_int(1935234, 1)
        gui.show_message("Kortz Center Cracker", "Lasers disabled")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

local function KortzSkipVaultDoor()
    if isKortzHeistActive() then
        locals.set_int("fm_mission_controller_v3", 27512, 5)
        gui.show_message("Kortz Center Cracker", "Vault door hack skipped")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

local function KortzCutGlass()
    if isKortzHeistActive() then
        locals.set_float("fm_mission_controller_v3", 32453 + (4 * 13) + 3, 100.0)
        gui.show_message("Kortz Center Cracker", "Glass cut instantly")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

local function KortzTakePrimary()
    if isKortzHeistActive() then
        locals.set_int("fm_mission_controller_v3", 28953 + 11, 15)
        locals.set_int("fm_mission_controller_v3", 28953 + 11, 17)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 237, 1.0)
        gui.show_message("Kortz Center Cracker", "Primary target taken! Don't forget to hammer the clip once")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

local function KortzTakeSecondary()
    if isKortzHeistActive() then
        locals.set_int("fm_mission_controller_v3", 28953 + 11, 3)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 219, 1.0)
        gui.show_message("Kortz Center Cracker", "Secondary target taken! Don't forget to cut down once")
    else
        gui.show_message("Kortz Center Cracker", "Heist not active!")
    end
end

-- Skip cooldown function
local function KortzSkipCooldown()
    globals.set_int(FMg + 37503, 0)   -- Normal cooldown
    globals.set_int(FMg + 37504, 0)   -- Hard mode cooldown
    gui.show_message("Kortz Center Heist", "Cooldowns skipped! You can start again")
end

-- Auto-hack state variable
local autoAllHacks = false

-- Auto-hack loop
script.register_looped("KortzCenterAutoHack", function(script)
    script:yield()
    if not network.is_session_started() or SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("maintransition")) > 0 then 
        return 
    end
    
    if autoAllHacks and isKortzHeistActive() then
        for b = 0, 7 do
            locals.set_int("fm_mission_controller_v3", 1386 + (b * 4), 1)
        end
        locals.set_int("fm_mission_controller_v3", 27512, 5)
        for i = 0, 2 do
            locals.set_int("fm_mission_controller_v3", 32416 + 1 + (i * 2) + 1, 0)
            locals.set_float("fm_mission_controller_v3", 32416 + 1 + (i * 2), 0.0)
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 237, 1.0)
        end
        locals.set_int("fm_mission_controller_v3", 70416, 4294784)
        globals.set_int(1935234, 1)
        locals.set_int("fm_mission_controller_v3", 26464, 5)
        locals.set_float("fm_mission_controller_v3", 32453 + (4 * 13) + 3, 100.0)
        locals.set_int("fm_mission_controller_v3", 28953 + 11, 15)
        locals.set_int("fm_mission_controller_v3", 28953 + 11, 17)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 237, 1.0)
        gui.show_message("Kortz Center Cracker", "Primary target taken! Don't forget to hammer the clip once")
        locals.set_int("fm_mission_controller_v3", 28953 + 11, 3)
        PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, 219, 1.0)
        gui.show_message("Kortz Center Cracker", "Secondary target taken! Don't forget to cut down once")
    end
    
    script:sleep(500)
end)

-- Main Kortz Center Heist Tab
KortzCenterHeistMenu:add_imgui(function()
    if checkOnline() then return end
    
    -- General Settings
    ImGui.Text("General Settings")
    ImGui.Separator()
    
    -- Primary Target
    ImGui.Text("Primary Target:")
    local nIndex, changed = ImGui.Combo("##K26Target", k26_heist_target, targetNames, #targetNames)
    if changed then
        k26_heist_target = nIndex
        stats.set_int(MPX() .. "K26_HEIST_TARGET", k26_heist_target)
        gui.show_message("Kortz Center Heist", "Primary target set to: " .. targetNames[k26_heist_target + 1])
    end
    
    ImGui.Separator()
    
    -- Cooldown Skip
    ImGui.Text("Cooldowns:")
    if ImGui.Button("Skip Cooldown") then
        KortzSkipCooldown()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Sets both normal and hard mode cooldowns to 0 so you can start again")
    end
    
    ImGui.Separator()
    
    -- Bag Capacity Editor
    ImGui.Text("Bag Capacity:")
    bagSizeValue, _ = ImGui.InputInt("##BagSize", bagSizeValue)
    if ImGui.Button("Set Bag Size") then
        if bagSizeValue < 1 then
            gui.show_message("Kortz Center Heist", "Bag size must be at least 1!")
        else
            globals.set_int(FMg + 38037, bagSizeValue)
            gui.show_message("Kortz Center Heist", "Bag capacity set to " .. bagSizeValue)
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Default is 100. How much you can carry in the heist")
    end
    
    ImGui.Separator()
    
    -- Weekly Multiplier Editor
    ImGui.Text("Weekly Bonus Multiplier:")
    weeklyMultiplierValue, _ = ImGui.InputFloat("##WeeklyMultiplier", weeklyMultiplierValue)
    if ImGui.Button("Set Weekly Multiplier") then
        if weeklyMultiplierValue < 1.0 then
            gui.show_message("Kortz Center Heist", "Multiplier must be at least 1.0!")
        else
            globals.set_float(FMg + 38199, weeklyMultiplierValue)
            gui.show_message("Kortz Center Heist", "Weekly multiplier set to " .. weeklyMultiplierValue .. "x")
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Default is 4.0x. First sale of the week bonus multiplier")
    end
    
    ImGui.Separator()
    
    -- Difficulty
    ImGui.Text("Difficulty:")
    if ImGui.Button("Hard Mode") then
        stats.set_int(MPX() .. "K26_GENERAL_BS", 1784442458)
        gui.show_message("Kortz Center Heist", "Hard Mode enabled")
    end
    ImGui.SameLine()
    if ImGui.Button("Normal Mode") then
        local current = stats.get_int(MPX() .. "K26_GENERAL_BS")
        stats.set_int(MPX() .. "K26_GENERAL_BS", current & ~1784442458)
        gui.show_message("Kortz Center Heist", "Normal Mode enabled")
    end
    
    ImGui.Separator()
    
    -- Prep Work
    ImGui.Text("Prep Work")
    ImGui.Separator()
    
    -- Scope Out
    if ImGui.Button("Scope Out Kortz Center") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 1)
        gui.show_message("Kortz Center Heist", "Kortz Center scoped out")
    end
    ImGui.SameLine()
    if ImGui.Button("Unscope Out") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") & ~1)
        gui.show_message("Kortz Center Heist", "Kortz Center unscoped")
    end
    
    -- Disguises
    if ImGui.Button("Alpha Mail Disguise") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 2)
        gui.show_message("Kortz Center Heist", "Alpha Mail Disguise acquired")
    end
    ImGui.SameLine()
    if ImGui.Button("Hazmat Suit") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 4)
        gui.show_message("Kortz Center Heist", "Hazmat Suit acquired")
    end
    
    -- Equipment
    if ImGui.Button("Staff Key Card") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 8)
        gui.show_message("Kortz Center Heist", "Staff Key Card acquired")
    end
    ImGui.SameLine()
    if ImGui.Button("Tactical Equipment") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 16)
        gui.show_message("Kortz Center Heist", "Tactical Equipment acquired")
    end
    
    if ImGui.Button("Hacking Device") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 32)
        gui.show_message("Kortz Center Heist", "Hacking Device acquired")
    end
    ImGui.SameLine()
    if ImGui.Button("Access Code") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 64)
        gui.show_message("Kortz Center Heist", "Access Code acquired")
    end
    
    -- Vehicles
    ImGui.Text("Vehicles:")
    if ImGui.Button("Armored Caracara") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 256)
        gui.show_message("Kortz Center Heist", "Armored Caracara unlocked")
    end
    ImGui.SameLine()
    if ImGui.Button("Annihilator Stealth") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 512)
        gui.show_message("Kortz Center Heist", "Annihilator Stealth unlocked")
    end
    ImGui.SameLine()
    if ImGui.Button("Manchez (Any Color)") then
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", stats.get_int(MPX() .. "K26_ROBBERY_PROG") | 1024)
        gui.show_message("Kortz Center Heist", "Manchez unlocked")
    end
    
    ImGui.Separator()
    
    -- Optional Prep Work
    ImGui.Text("Optional Prep Work (Requires POI)")
    ImGui.Separator()
    
    if ImGui.Button("Scope Points of Interest") then
        stats.set_int(MPX() .. "K26_POI_BS", -1)
        gui.show_message("Kortz Center Heist", "Points of Interest scoped")
    end
    
    ImGui.Text("General Upgrades:")
    
    if ImGui.Button("Guard Routes") then
        setK26Bit("K26_GENERAL_BS", 32, "Guard Routes")
    end
    ImGui.SameLine()
    if ImGui.Button("Glass Cutter") then
        setK26Bit("K26_GENERAL_BS", 64, "Glass Cutter")
    end
    
    if ImGui.Button("Power Drills") then
        setK26Bit("K26_GENERAL_BS", 128, "Power Drills")
    end
    ImGui.SameLine()
    if ImGui.Button("EMP Charges") then
        setK26Bit("K26_GENERAL_BS", 256, "EMP Charges")
    end
    
    ImGui.Text("Loadouts:")
    if ImGui.Button("Street Loadout") then
        setK26Bit("K26_GENERAL_BS", 512, "Street Loadout")
    end
    ImGui.SameLine()
    if ImGui.Button("Security Loadout") then
        setK26Bit("K26_GENERAL_BS", 1024, "Security Loadout")
    end
    ImGui.SameLine()
    if ImGui.Button("Military Loadout") then
        setK26Bit("K26_GENERAL_BS", 2048, "Military Loadout")
    end
    
    ImGui.Text("Manchez Colors:")
    if ImGui.Button("Red Manchez") then
        setK26Bit("K26_GENERAL_BS", 131072, "Red Manchez")
    end
    ImGui.SameLine()
    if ImGui.Button("Blue Manchez") then
        setK26Bit("K26_GENERAL_BS", 262144, "Blue Manchez")
    end
    ImGui.SameLine()
    if ImGui.Button("Green Manchez") then
        setK26Bit("K26_GENERAL_BS", 524288, "Green Manchez")
    end
    ImGui.SameLine()
    if ImGui.Button("Yellow Manchez") then
        setK26Bit("K26_GENERAL_BS", 1048576, "Yellow Manchez")
    end
    
    if ImGui.Button("Manhole Key") then
        setK26Bit("K26_GENERAL_BS", 134217728, "Manhole Key")
    end
    ImGui.SameLine()
    if ImGui.Button("Weak Guards") then
        setK26Bit("K26_GENERAL_BS", -2147483648, "Weak Guards")
    end
    
    ImGui.Separator()
    
    -- Secondary Targets
    ImGui.Text("Secondary Targets")
    if ImGui.Button("Scope All Secondary Targets") then
        stats.set_int(MPX() .. "K26_SCOPING_BS", -1)
        gui.show_message("Kortz Center Heist", "All secondary targets scoped")
    end
    
    ImGui.Separator()
    
    -- Quick Actions
    ImGui.Text("Quick Actions")
    if ImGui.Button("Complete All Preps") then
        stats.set_int(MPX() .. "K26_GENERAL_BS", -1)
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", 65535)
        stats.set_int(MPX() .. "K26_SCOPING_BS", -1)
        stats.set_int(MPX() .. "K26_POI_BS", -1)
        gui.show_message("Kortz Center Heist", "All preps completed")
    end
    ImGui.SameLine()
    if ImGui.Button("Reset All Preps") then
        stats.set_int(MPX() .. "K26_GENERAL_BS", 0)
        stats.set_int(MPX() .. "K26_ROBBERY_PROG", 0)
        stats.set_int(MPX() .. "K26_SCOPING_BS", 0)
        stats.set_int(MPX() .. "K26_POI_BS", 0)
        gui.show_message("Kortz Center Heist", "All preps reset")
    end
    
    if ImGui.Button("Reload Planning Board") then
        stats.set_int(MPX() .. "K26_GENERAL_BS2", stats.get_int(MPX() .. "K26_GENERAL_BS2") + 1)
        gui.show_message("Kortz Center Heist", "Planning board reloaded")
    end
    
    ImGui.Separator()
    
    -- Extras
    ImGui.Text("Extras")
    if ImGui.Button("Skip Cutscene") then
        SkipCutscene()
        gui.show_message("Kortz Center Heist", "Cutscene skipped")
    end
end)

-- Kortz Center Cracker (Sub-tab inside Kortz Center Heist)
local KortzCenterCrackerMenu = KortzCenterHeistMenu:add_tab("Mission Cracker")

KortzCenterCrackerMenu:add_imgui(function()
    if checkOnline() then return end
    
    local isHeistActive = isKortzHeistActive()
    
    if not isHeistActive then
        ImGui.TextColored(0.6, 0.6, 0.6, 1.0, "Please start The Kortz Center Heist first.")
        ImGui.TextColored(0.6, 0.6, 0.6, 1.0, " ")
        return
    end
    
    ImGui.Text("The Kortz Center Heist - Hacks")
    ImGui.Separator()
    
    -- Master Auto-Hack Checkbox
    local changed
    autoAllHacks, changed = ImGui.Checkbox("Enable All Auto-Hacks", autoAllHacks)
    if changed then
        if autoAllHacks then
            gui.show_message("Kortz Center Cracker", "All auto-hacks enabled")
        else
            gui.show_message("Kortz Center Cracker", "All auto-hacks disabled")
        end
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Automatically performs all hacks when needed")
    end
    
    ImGui.Separator()
    ImGui.TextColored(0.6, 0.6, 0.6, 1.0, "Manual Hacks (Press when needed)")
    ImGui.Separator()
    
    -- Row 1
    if ImGui.Button("Skip Data Crack") then
        KortzSkipDataCrack()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press when doing the data crack minigame")
    end
    
    ImGui.SameLine()
    
    if ImGui.Button("Skip Fingerprint Hack") then
        KortzSkipFingerprint()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press when doing the fingerprint hacking")
    end
    
    -- Row 2
    if ImGui.Button("Auto-Enter Access Code") then
        script.run_in_fiber(function(script)
            KortzAutoAccessCode()
            script:sleep(100)
        end)
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press when entering the PC access code")
    end
    
    ImGui.SameLine()
    
    if ImGui.Button("Disable Lasers") then
        KortzDisableLasers()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press to disable the laser grid")
    end
    
    -- Row 3
    if ImGui.Button("Skip Vault Door Hack") then
        KortzSkipVaultDoor()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press to skip signal nodes hacking")
    end
    
    ImGui.SameLine()
    
    if ImGui.Button("Cut Glass") then
        KortzCutGlass()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press to cut display cases instantly")
    end
    
    -- Row 4
    if ImGui.Button("Take Primary Target") then
        script.run_in_fiber(function(script)
            KortzTakePrimary()
            script:sleep(1000)
        end)
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press to take the primary target instantly - Don't forget to hammer the clip once")
    end
    
    ImGui.SameLine()
    
    if ImGui.Button("Take Secondary Target") then
        KortzTakeSecondary()
    end
    if ImGui.IsItemHovered() then
        ImGui.SetTooltip("Press to take a secondary target instantly - Don't forget to cut down once")
    end
    
    ImGui.Separator()
    ImGui.TextColored(0.6, 0.6, 0.6, 1.0, "Toggle the checkbox above for full automation")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MissionsSelectorAndCooldownMenu = makeOnlineTab(L7NEG:add_tab("Missions Selector And cooldown Menu"))

MissionsSelectorAndCooldownMenu:add_button("Remove Dax Fooligan missions CoolDown ", function()
	stats.set_int(MPX() .. "XM22JUGGALOWORKCDTIMER", -1)
end)

MissionsSelectorAndCooldownMenu:add_button("Remove VIP/MC Cooldown", function()
	stats.set_int("MPPLY_VIPGAMEPLAYDISABLEDTIMER", 0)
end)

MissionsSelectorAndCooldownMenu:add_button("Skip Yacht Missions", function()
	stats.set_int(MPX() .. "YACHT_MISSION_PROG", 0)
	stats.set_int(MPX() .. "YACHT_MISSION_FLOW", 21845)
	stats.set_int(MPX() .. "CASINO_DECORATION_GIFT_1", -1)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CreditsMenu = L7NEG:add_tab("Credits")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Yimura = CreditsMenu:add_tab("Yimura and his team/maintainers")
Yimura:add_text("Source:")
Yimura:add_text("https://github.com/Mr-X-GTA/YimMenu")
Yimura:add_text("https://github.com/YimMenu/YimMenuV2")

SILENTSALO = CreditsMenu:add_tab("Silent")
SILENTSALO:add_text("Source:")
SILENTSALO:add_text("https://github.com/SilentSal0/Silent-Night")
SILENTSALO:add_text("Maintained by nightli:")
SILENTSALO:add_text("https://github.com/xnightli06x/Silent-Night")

XESDDOOG = CreditsMenu:add_tab("SAMURAI aka xesdoog")
XESDDOOG:add_text("Source:")
XESDDOOG:add_text("https://github.com/YimMenu-Lua/YimResupplier")

IMAGINENOTHING = CreditsMenu:add_tab("ImagineNothing")
IMAGINENOTHING:add_text("For Kortz Center Heist stats and Locals/globals:")
IMAGINENOTHING:add_text("https://www.unknowncheats.me/forum/4742522-post603.html")
IMAGINENOTHING:add_text("https://www.unknowncheats.me/forum/4746347-post762.html")

SLON = CreditsMenu:add_tab("SLON")
SLON:add_text("Source:")
SLON:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")

Alestarov = CreditsMenu:add_tab("Alestarov")
Alestarov:add_text("Source:")
Alestarov:add_text("https://github.com/YimMenu-Lua/Alestarov-Menu")

YOUMENU = CreditsMenu:add_tab("And You <3")
YOUMENU:add_text("Yes You Without You Or Your PRs and support You Give Me This Script Would Be Nothing Fr So Big Thanks To You All")
YOUMENU:add_text("You can report Bugs And Make PRs With Features Down Bellow:")
YOUMENU:add_text("https://github.com/UltimateMenu/UltimateMenu/issues")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------