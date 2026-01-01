-- only initialize if local ped is rendered 1st time

script.run_in_fiber(function()
    local ped = 0

    if NETWORK and NETWORK.NETWORK_IS_SESSION_STARTED then
        repeat
            ped = PLAYER.PLAYER_PED_ID()
        until NETWORK.NETWORK_IS_PLAYER_ACTIVE(PLAYER.PLAYER_ID()) and ped ~= 0 and ENTITY.DOES_ENTITY_EXIST(ped)
    else
        repeat
            ped = PLAYER.PLAYER_PED_ID()
        until ped ~= 0 and ENTITY.DOES_ENTITY_EXIST(ped)
    end

    repeat
    until PLAYER.IS_PLAYER_CONTROL_ON(PLAYER.PLAYER_ID())

    ENTITY.SET_ENTITY_HEALTH(ped, 200)
end)

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function MPX()
	local PI = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PI == 0 then
		return "MP0_"
	elseif PI == 1 then
		return "MP1_"
	else
		return "MP0_"
	end
end

local function SPX()
	local PI = ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID())
	if PI == joaat("Player_Zero") then
		return "SP0_"
	elseif PI == joaat("Player_One") then
		return "SP1_"
	elseif PI == joaat("Player_Two") then
		return "SP2_"
	else
		return "SP0_"
	end
end

local function CutsPresetter(global_start, global_finish, cut)
    globals.set_int(GCg, cut)
    for i = global_start, global_finish do
        globals.set_int(i, cut)        
    end
end

is_player_male = (ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == joaat("mp_m_freemode_01"))

currentlevel = stats.get_int(MPX() .. "CHAR_RANK_FM")
currentcrewlevel = stats.get_int("MPPLY_CURRENT_CREW_RANK")

--Required Scripts--

FMC = "fm_mission_controller"
FMMCL = "fmmc_launcher"
FMC2020 = "fm_mission_controller_2020"
HIP = "heist_island_planning"

--Globals & Locals & Variables--

FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
CSg1 = 1575042 -- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);
CSg2 = 1574589 -- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE
CSg3 = 1574589 + 2 -- change session (quit) 3 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE

-- Apartment Heist
ACg1 = 1935536 + 1 + 1 -- global apartment player 1 cut global ("fmmc_launcher")
ACg2 = 1935536 + 1 + 2 -- global apartment player 2 cut global ("fmmc_launcher")
ACg3 = 1935536 + 1 + 3 -- global apartment player 3 cut global ("fmmc_launcher")
ACg4 = 1935536 + 1 + 4 -- global apartment player 4 cut global ("fmmc_launcher")
ACg5 = 1937504 + 3008 + 1 -- local apartment player 1 cut global ("fmmc_launcher")
AUAJg1 = FMg + 9184 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9189 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9196 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9202 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9208 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 19791 -- apartment instant finish local 1
AIFl4 = 19791 + 2686 -- apartment instant finish local 2
AIFl5 = 28412 + 1 -- apartment instant finish local 3
AIFl6 = 31668 + 1 + 68
AFHl = 11821 + 24 -- apartment fleeca hack local
AFDl = 10109 + 11 -- apartment fleeca drill local
AHSo = 19791 -- Apartment heist skip checkpoint
ADSCS1 = 31668 -- Apartment & Diamond Casino heist card swipe skip
ADSCS2 = 62430 -- Apartment & Diamond Casino heist card swipe skip

-- Diamond Casino Heist
DCRBl = 208 -- diamond casino reload board local
DCCg1 = 1971951 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global ("gb_casino_heist_planning")
DCCg2 = 1971951 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global ("gb_casino_heist_planning")
DCCg3 = 1971951 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global ("gb_casino_heist_planning")
DCCg4 = 1971951 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global ("gb_casino_heist_planning")
DCCl = FMg + 28401 -- ("CH_LESTER_CUT")
DCCh = FMg + 28437 - 1 --("2027377935")
DCCd = FMg + 28432 - 1 --("88090906")
DCCgun = FMg + 28427 - 1 --("74718927")
DCFHl = 53132 -- diamond casino fingerprint hack local
DCKHl = 54198 -- diamond casino keypad hack local
DCDVDl1 = 10109 + 7 -- diamond casino drill vault door local 1 --("DLC_HEIST_MINIGAME_FLEECA_DRILLING_SCENE") in ("fm_mission_controller")
DCDVDl2 = 10109 + 37 -- diamond casino drill vault door local 2 --("fm_mission_controller")
DCXf1 = 19791
DCXf2 = 19791 + 1062
DCXf3 = 19791 + 1740 + 1
DCXf4 = 19791 + 2686
DCXf5 = 28412 + 1
DCXf6 = 31668 + 1 + 68

-- Cayo Perico Heist
CPRSl = 1568 -- cayo perico reload screen local
CPCg1 = 1978755 + 831 + 56 + 1 -- cayo perico player 1 cut global --("heist_island_planning")
CPCg2 = 1978755 + 831 + 56 + 2 -- cayo perico player 2 cut global --("heist_island_planning")
CPCg3 = 1978755 + 831 + 56 + 3 -- cayo perico player 3 cut global --("heist_island_planning")
CPCg4 = 1978755 + 831 + 56 + 4 -- cayo perico player 4 cut global --("heist_island_planning")
CPFHl = 26084 -- cayo perico fingerprint hack local ("heist") in ("fm_mission_controller_2020")
CPPCCl = 32187 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") in ("fm_mission_controller_2020")
CPSTCl = 30947 -- cayo perico drainage pipe cut local ("IntroFinished") in ("fm_mission_controller_2020")
CPXf1 = 55789 -- cayo perico instant finish local 1
CPXf2 = 55789 + 1776 + 1 -- cayo perico instant finish local 2

-- Doomsday Heist
DDSHl = 1296 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1967983 + 812 + 50 + 1 -- doomsday player 1 cut global --("gb_gang_ops_planning")
DCg2 = 1967983 + 812 + 50 + 2 -- doomsday player 2 cut global --("gb_gang_ops_planning")
DCg3 = 1967983 + 812 + 50 + 3 -- doomsday player 3 cut global --("gb_gang_ops_planning")
DCg4 = 1967983 + 812 + 50 + 4 -- doomsday player 4 cut global --("gb_gang_ops_planning")
GCg = 2686090 + 6772 -- global cut global (value2 = value2 * (num / 100f);)

IHPB = 55789 --Instant Heist Passed Local Base (Casino And CayoPerico)
IHPL = 55789 + 1776 + 1 --Instant Heist Passed Locals (Casino And CayoPerico)

NLCl = 206 + 32 + 19 + 1 --("nightclub_office_cutscene") in ("am_mp_nightclub")

SNOW = FMg + 4413
halloweatherAddress = FMg + 32246

--BV = Ballastic Value----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BV = FMg + 20113

--CCBL = Casino Chips Buy Limit-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CCBL0 = FMg + 26623
CCBL1 = FMg + 26624

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1 = FMg + 29299

--PSV=Panther Statue-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PSV = FMg + 29551

--PDIAMOND=Pink Diamond---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PDIAMOND = FMg + 29549

--BB=Bearer Bonds---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BB = FMg + 29548

--RN=Ruby Necklace--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN = FMg + 29547

--TEQUILA=Tequila---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TEQUILA = FMg + 29546

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG = gui.add_tab("Ultimate Menu 1.72 Legacy")

L7NEG:add_text("       Ultimate Menu 1.72 Legacy ")
L7NEG:add_text("                       v2.8")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self = L7NEG:add_tab("Self Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AGCT = Self:add_checkbox("Unlock Gender Change")
script.register_looped("UnlockGenderChange", function(script)
	script:yield()
	if AGCT:is_enabled() then
		stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
	else
		stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", 52)
	end
end)

RTPT = Self:add_checkbox("Remove Transaction Error")
script.register_looped("RemoveTransactionError", function(script)
	if RTPT.value then
		globals.set_int(4516902, 0)
		globals.set_int(4516903, 0)
		globals.set_int(4516904, 0)
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

StoryCharacters = L7NEG:add_tab("Story Mode")

CurrentSPMoneyValue = stats.get_int(SPX() .. "TOTAL_CASH")
StoryCharacters:add_imgui(function()
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

RecoveryMenu = L7NEG:add_tab("Recovery Menu")

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

RankSetter:add_text("Your current Rank is " .. currentlevel)

RankSetter:add_separator()

local rpLevel = RankSetter:add_input_int("Rank")

RankSetter:add_button("Set Rank", function()
	local rankValue = rpLevel:get_value()

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
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CrewRankSetter = RecoveryMenu:add_tab("Set Crew Rank menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CrewRankSetter:add_text("Your Current Crew Rank is " .. currentcrewlevel)

CrewRankSetter:add_separator()

local rpLevel = CrewRankSetter:add_input_int("Rank")

CrewRankSetter:add_button("Set Slot 1 Crew Rank", function()
	local rankValue = rpLevel:get_value()

	if rankValue <= 0 or rankValue > 8000 then
		gui.show_message(
			"ERROR",
			"Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
		)
	else
		stats.set_int("MPPLY_CREW_LOCAL_XP_0", getRP(rankValue))
		gui.show_message("Crew Rank Setter", "Your Crew Slot 1 Rank was set to " .. rankValue .. ", .")
	end
end)

CrewRankSetter:add_button("Set Slot 2 Crew Rank", function()
	local rankValue = rpLevel:get_value()

	if rankValue <= 0 or rankValue > 8000 then
		gui.show_message(
			"ERROR",
			"Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
		)
	else
		stats.set_int("MPPLY_CREW_LOCAL_XP_1", getRP(rankValue))
		gui.show_message("Crew Rank Setter", "Your Crew Slot 2 Rank was set to " .. rankValue .. ", .")
	end
end)

CrewRankSetter:add_button("Set Slot 3 Crew Rank", function()
	local rankValue = rpLevel:get_value()

	if rankValue <= 0 or rankValue > 8000 then
		gui.show_message(
			"ERROR",
			"Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
		)
	else
		stats.set_int("MPPLY_CREW_LOCAL_XP_2", getRP(rankValue))
		gui.show_message("Crew Rank Setter", "Your Crew Slot 3 Rank was set to " .. rankValue .. ", .")
	end
end)

CrewRankSetter:add_button("Set Slot 4 Crew Rank", function()
	local rankValue = rpLevel:get_value()

	if rankValue <= 0 or rankValue > 8000 then
		gui.show_message(
			"ERROR",
			"Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
		)
	else
		stats.set_int("MPPLY_CREW_LOCAL_XP_3", getRP(rankValue))
		gui.show_message("Crew Rank Setter", "Your Crew Slot 4 Rank was set to " .. rankValue .. ", .")
	end
end)

CrewRankSetter:add_button("Set Slot 5 Crew Rank", function()
	local rankValue = rpLevel:get_value()

	if rankValue <= 0 or rankValue > 8000 then
		gui.show_message(
			"ERROR",
			"Your Crew level " .. rankValue .. " cannot be set because it is outside the valid range (1-8000)."
		)
	else
		stats.set_int("MPPLY_CREW_LOCAL_XP_4", getRP(rankValue))
		gui.show_message("Crew Rank Setter", "Your Crew Slot 5 Rank was set to " .. rankValue .. ", .")
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TunMenu = L7NEG:add_tab("Tunables Menu")

local currentapmultiplier = globals.get_float(FMg + 25489)
TunMenu:add_text("AP")
TunMenu:add_text("Your AP Multiplier is " .. currentapmultiplier)
local apmvalue = TunMenu:add_input_float("AP")
TunMenu:add_button("Set Money Multiplier", function()
	globals.set_float(FMg + 25489, apmvalue:get_value())
	gui.show_message("AP Multiplier", "Your AP Multiplier was set to " .. apmvalue:get_value() .. ".")
end)
TunMenu:add_separator()

local currentsrmultiplier = globals.get_float(FMg + 25489)
TunMenu:add_text("Street Races")
TunMenu:add_text("Your Street Races Multiplier is " .. currentsrmultiplier)
local srmvalue = TunMenu:add_input_float("Street Races")
TunMenu:add_button("Set Money Multiplier", function()
	globals.set_float(FMg + 25489, srmvalue:get_value())
	gui.show_message(
		"Street Races Multiplier",
		"Your Street Races Multiplier was set to " .. apmvalue:get_value() .. "."
	)
end)
TunMenu:add_separator()

srmvalue = globals.get_float(FMg + 31068)
TunMenu:add_imgui(function()
	srmvalue, used = ImGui.DragInt("Street Races", srmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 31068, srmvalue)
	end
end)

pmvalue = globals.get_float(FMg + 31069)
TunMenu:add_imgui(function()
	pmvalue, used = ImGui.DragInt("Pursuits", pmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 31069, pmvalue)
	end
end)

f2fmvalue = globals.get_float(FMg + 31070)
TunMenu:add_imgui(function()
	f2fmvalue, used = ImGui.DragInt("Face2Face", f2fmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 31070, f2fmvalue)
	end
end)

lscmmvalue = globals.get_float(FMg + 31071)
TunMenu:add_imgui(function()
	lscmmvalue, used = ImGui.DragInt("LS Car Meet", lscmmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 31071, lscmmvalue)
	end
end)

lscmotmvalue = globals.get_float(FMg + 31072)
TunMenu:add_imgui(function()
	lscmotmvalue, used = ImGui.DragInt("LS Car Meet on track", lscmotmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 31072, lscmotmvalue)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

OnlineServicesMenu = L7NEG:add_tab("Online Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoServicesMenu = OnlineServicesMenu:add_tab("Casino Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local cslots = "casino_slots"
slots_random_results_table = 1372
prize_wheel_win_state = 302
prize_wheel_prize = 14
prize_wheel_prize_state = 45

CasinoServicesMenu:add_text("Casino Chips")
chipsVal = 1800
CasinoServicesMenu:add_imgui(function()
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

EventsMenu = L7NEG:add_tab("Events Menu")

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
	globals.set_int(FMg + 34951, 1) -- enable the event 1833904680
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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FAUT:add_button("Unlock WM 29 Pistol", function()
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
end)

FAUT:add_button("Unlock The Shocker", function()
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
end)

FAUT:add_button("Unlock The Snowball Launcher", function()
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
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CSU = FAUT:add_tab("Character's Stats")

CSU:add_button("Max Character Skills", function()
	stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
	gui.show_message("Character Skills", "Your Character Skills Is Maxxed Out.")
end)

AcMenu = CSU:add_tab("Achievements")

Acv0 = false
AG = 4546910 + 1 --("CHEAT_ACHIEVE")

AcMenu:add_button("Unlock All Achievements", function()
	script.run_in_fiber(function(script)
		for i = 0, 77 do
			script:sleep(200)
			globals.set_int(AG, i)
			if i == 77 then
				gui.show_message("Achievements", "Unlocked 77 Achievements")
			end
		end
	end)
end)

AcMMenu = AcMenu:add_tab("Unlock One By One Menu")

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
local weekly_objectives_global = 2731933 --("am_challenges")
local objectives_state_global = 1574745 --("am_challenges")

FAUT:add_button("Complete All Daily & Weekly Challenges", function()
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
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

LSCMUnlockeRecoveryMenu = RecoveryMenu:add_tab("LSCM Unlocker Menu")

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local GVMENU = L7NEG:add_tab("Gun Van Menu ")

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

-- Originally by SilentSalo
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

local selected_loc = 0
local selected_slot = 0
local is_typing = false
local weapon_skins = false
local gta_plus_blip = false
local livery_lock = false
local weapon_editor_popup = false
local filter_text = ""
local weapon_name = ""

local gun_van_loc = 0

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
	gun_van_loc = globals.get_int(2652579 + 2706)

	if is_typing then
		PAD.DISABLE_ALL_CONTROL_ACTIONS(0)
	end

	if weapon_skins then
		tunables.set_bool(1490225691, false)
	end

	if livery_lock then
		local value = locals.get_int("gunclub_shop", 199 + 747) | (1 << 8)
		locals.set_int("gunclub_shop", 199 + 747, value)
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
		globals.set_int(2652579 + 2706, selected_loc)
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
			local value = locals.get_int("gunclub_shop", 142 + 747) & ~(1 << 8)
			locals.set_int("gunclub_shop", 142 + 747, value)
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
local TAGET_BUILD <const> = "3725.0"

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
local function YimConfig()
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
		local exists = io.exists(script_json)
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
function GetBuildNumber()
	local pBuildNum = memory.scan_pattern("8B C3 33 D2 C6 44 24 20"):add(0x24):rip()
	return pBuildNum:get_string()
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
local CFG = YimConfig()
log.info(string.format("YimConfig v%s successfully loaded\n%s", CFG._version, CFG._credits))

if GetBuildNumber() == TAGET_BUILD then
	yim_resupplier = L7NEG:add_tab("YimResupplier")
	DEFAULT_CONFIG = {
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
	local hangarOwned = false
	local fCashOwned = false
	local cokeOwned = false
	local methOwned = false
	local weedOwned = false
	local fdOwned = false
	local bunkerOwned = false
	local acidOwned = false
	local hangarTotal = 0
	local cashTotal = 0
	local cokeTotal = 0
	local methTotal = 0
	local weedTotal = 0
	local fdTotal = 0
	local bunkerTotal = 0
	local acidTotal = 0
	local main_global = 1673807
	local cashUpdgrade1 = CFG.read("cashUpdgrade1")
	local cashUpdgrade2 = CFG.read("cashUpdgrade2")
	local cokeUpdgrade1 = CFG.read("cokeUpdgrade1")
	local cokeUpdgrade2 = CFG.read("cokeUpdgrade2")
	local methUpdgrade1 = CFG.read("methUpdgrade1")
	local methUpdgrade2 = CFG.read("methUpdgrade2")
	local weedUpdgrade1 = CFG.read("weedUpdgrade1")
	local weedUpdgrade2 = CFG.read("weedUpdgrade2")
	local fdUpdgrade1 = CFG.read("fdUpdgrade1")
	local fdUpdgrade2 = CFG.read("fdUpdgrade2")
	local bunkerUpdgrade1 = CFG.read("bunkerUpdgrade1")
	local bunkerUpdgrade2 = CFG.read("bunkerUpdgrade2")
	local acidUpdgrade = CFG.read("acidUpdgrade")

	yim_resupplier:add_imgui(function()
		if network.is_session_started() and not script.is_active("maintransition") then
			hangarOwned = stats.get_int("MPX_PROP_HANGAR") ~= 0
			fCashOwned = stats.get_int("MPX_PROP_FAC_SLOT0") ~= 0
			cokeOwned = stats.get_int("MPX_PROP_FAC_SLOT1") ~= 0
			methOwned = stats.get_int("MPX_PROP_FAC_SLOT2") ~= 0
			weedOwned = stats.get_int("MPX_PROP_FAC_SLOT3") ~= 0
			fdOwned = stats.get_int("MPX_PROP_FAC_SLOT4") ~= 0
			bunkerOwned = stats.get_int("MPX_PROP_FAC_SLOT5") ~= 0
			acidOwned = stats.get_int("MPX_PROP_FAC_SLOT6") ~= 0
			ImGui.BeginTabBar("YimResupplier", ImGuiTabBarFlags.None)
			if ImGui.BeginTabItem("Manage Supplies") then
				local wh1Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE0")
				local wh2Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE1")
				local wh3Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE2")
				local wh4Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE3")
				local wh5Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE4")
				local hangarSupply = stats.get_int("MPX_HANGAR_CONTRABAND_TOTAL")
				local cashSupply = stats.get_int("MPX_MATTOTALFORFACTORY0")
				local dfSupply = stats.get_int("MPX_MATTOTALFORFACTORY1")
				local methSupply = stats.get_int("MPX_MATTOTALFORFACTORY2")
				local weedSupply = stats.get_int("MPX_MATTOTALFORFACTORY3")
				local cokeSupply = stats.get_int("MPX_MATTOTALFORFACTORY4")
				local bunkerSupply = stats.get_int("MPX_MATTOTALFORFACTORY5")
				local acidSupply = stats.get_int("MPX_MATTOTALFORFACTORY6")
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
								stats.set_bool_masked("MPX_DLC22022PSTAT_BOOL3", true, 9)
							end)
						end
						ImGui.SameLine()
						hangarLoop, used = ImGui.Checkbox("Auto-Fill", hangarLoop)
						if hangarLoop then
							script.run_in_fiber(function(hangarSupp)
								repeat
									stats.set_bool_masked("MPX_DLC22022PSTAT_BOOL3", true, 9)
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
								stats.set_bool_masked("MPX_FIXERPSTAT_BOOL1", true, i)
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
									stats.set_bool_masked("MPX_FIXERPSTAT_BOOL1", true, i)
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
					local hangarCargo = stats.get_int("MPX_HANGAR_CONTRABAND_TOTAL")
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
				local wh1Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE0")
				local wh2Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE1")
				local wh3Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE2")
				local wh4Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE3")
				local wh5Supplies = stats.get_int("MPX_CONTOTALFORWHOUSE4")
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
					local cashProduct = stats.get_int("MPX_PRODTOTALFORFACTORY0")
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
					local cokeProduct = stats.get_int("MPX_PRODTOTALFORFACTORY1")
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
					local methProduct = stats.get_int("MPX_PRODTOTALFORFACTORY2")
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
else
	gui.show_warning("YimResupplier", "YimResupplier is outdated.\nPlease update the script!")
	yim_resupplier = L7NEG:add_tab("YimResupplier")
	yim_resupplier:add_text("YimResupplier is outdated.\n\nPlease update the script.")
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7 = L7NEG:add_tab("Ultimate Money Methods Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BusinessesMenu = L7NEG7:add_tab("Businesses Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoMenu = BusinessesMenu:add_tab("Air Cargo Menu")

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
	globals.get_int(CARGO1, HangarCrateVlaue)
	globals.set_int(CARGO2, HangarCrateVlaue)
	globals.set_int(CARGO3, HangarCrateVlaue)
	globals.get_int(CARGO4, HangarCrateVlaue)
	globals.set_int(CARGO5, HangarCrateVlaue)
	globals.set_int(CARGO6, HangarCrateVlaue)
	globals.get_int(CARGO7, HangarCrateVlaue)
	globals.set_int(CARGO8, HangarCrateVlaue)
	globals.set_int(CARGO9, HangarCrateVlaue)
	gui.show_message("Crate Value Setter", "Your Crates Values was set to " .. HangarCrateVlaue .. ".")
end)

AirCargoMenu:add_separator()

RCRT = AirCargoMenu:add_checkbox("Remove Ron's Cut")
script.register_looped("RonCutRemover", function(script)
	script:yield()
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

AirCargoEditorMenu = AirCargoMenu:add_tab("Air Cargo Data Editor")

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

UseAtYourOwnRiskMenu = L7NEG7:add_tab("Use At Your Own Risk Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CeoManagerMenu = UseAtYourOwnRiskMenu:add_tab("Ceo Manager Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--©️ 2024 ΞΛZТΞΛ#0157/SLON
CEO1 = FMg + 15821 --("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1")
CEO2 = FMg + 15588 --("EXEC_BUY_COOLDOWN")
CEO3 = FMg + 15589 --("EXEC_SELL_COOLDOWN")
SMC1 = 567 + 1 --("gb_contraband_sell")
SMC2 = 567 + 7 --("gb_contraband_sell")
SMC3 = 567 + 584 --("gb_contraband_sell")
SMC4 = 567 + 55 --("gb_contraband_sell")
SMC5 = 567 + 595 --("gb_contraband_sell")
SMC6 = 583 --("GTAO_Exec_SecuroServ_Computer_Sounds") in ("appsecuroserv")
SMC7 = 763 --("MP_WH_SELL") or ("WH_MFREASON_12") in ("appsecuroserv")
SMC8 = 764 --("MP_WH_SELL") or ("WH_MFREASON_12") in ("appsecuroserv")
SMC9 = 625 + 5 --("SPEECH_PARAMS_SHOUTED_CRITICAL") in ("gb_contraband_buy")
SMC10 = 625 + 1 --func_91() in ("gb_contraband_buy")
SMC11 = 625 + 191 --("gb_contraband_buy")
SMC12 = 625 + 192 --("gb_contraband_buy")

local cs = "appsecuroserv"

local ci = "gb_contraband_sell"

local cb = "gb_contraband_buy"

local am = "am_mp_warehouse"

local am2 = "am_mp_peds"

cratevalue = 0
CeoManagerMenu:add_imgui(function()
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
	globals.get_int(CEO1)
	globals.set_int(CEO2, 0)
	globals.set_int(CEO3, 0)
	script:yield()

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

NightClubSafeMenu = UseAtYourOwnRiskMenu:add_tab("NightClub Safe Loop Menu")

SafeAmount = 300000
SafeCapacity = 23769 --NIGHTCLUBMAXSAFEVALUE
IncomeStart = 23746 --NIGHTCLUBINCOMEUPTOPOP5
IncomeEnd = 23765 --NIGHTCLUBINCOMEUPTOPOP100

NCRSCB = NightClubSafeMenu:add_checkbox("Enable Nitghtclub $300k/5s (Safe Remote AFK)")
script.register_looped("nightclubremotelooptest", function(script)
	script:yield()
	if NCRSCB:is_enabled() == true then
		SafeValue = 1845250 + self.get_id() + 260 + 364 + 5 --("am_mp_nightclub")
		for i = IncomeStart, IncomeEnd do
			globals.set_int(FMg + i, SafeAmount)
		end
		globals.set_int(FMg + SafeCapacity, SafeAmount)
		stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
		script:sleep(2500)
		if globals.get_int(SafeValue) ~= 0 then
		end
		locals.set_int("am_mp_nightclub", NLCl, 1)
		globals.set_int(4516902, 0)
		globals.set_int(4516903, 0)
		globals.set_int(4516904, 0)
		script:sleep(2500)
	end
end)

NightClubSafeMenu:add_separator()

NightClubSafeMenu:add_button("Open Nightclub Screen", function()
	SCRIPT.REQUEST_SCRIPT("appBusinessHub")
	SYSTEM.START_NEW_SCRIPT("appBusinessHub", 1424)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MoneyRemoverMenu = L7NEG:add_tab("Money Remover Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

moneyremovervalue = globals.get_int(BV)
MoneyRemoverMenu:add_imgui(function()
	moneyremovervalue, used = ImGui.DragInt("Set Ballastic Value", moneyremovervalue, 1000000, 1000000, 2147483647)
	if used then
		globals.set_int(BV, moneyremovervalue)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ReportsMenu = L7NEG:add_tab("Reports Menu")
ReportsMenu:add_imgui(function()
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

WareHouseDataEditorMenu = CeoManagerMenu:add_tab("WareHouse Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WareHouseDataEditorMenu:add_button("Reset Crate Sell Stats-0/0 Sales", function()
	stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", 0)
	stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", 0)
	stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", 0)
	stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", 0)
	stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", 0)
	globals.set_int(CSg1, 11)
	globals.set_int(CSg2, 1)
	globals.set_int(CSg2, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HeistsDataEditorMenu = L7NEG:add_tab("Heists Data Editor Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ApartmentDataEditorMenu = HeistsDataEditorMenu:add_tab("Apartment Data Editor Menu")

ApartmentDataEditorMenu:add_button("Skip Preps", function()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
end)

ApartmentDataEditorMenu:add_sameline()

ApartmentDataEditorMenu:add_button("Reset Preps", function()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", 0)
end)

ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("For Fleeca:")
ApartmentDataEditorMenu:add_text(
	'Pay for the preparation, start the first mission and as soon as you are sent to scout\nchange the session, come back to planning room, press "Complete Preps" near white board and press "E"'
)
ApartmentDataEditorMenu:add_text("For Other Heist:")
ApartmentDataEditorMenu:add_text(
	'Start the mission and leave after the 1st cutscene ends, press "Complete Preps" near white board and press "E"'
)

ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Cuts to All")
ApartmentDataEditorMenu:add_text("Fleeca Job Heist:")
ApartmentDataEditorMenu:add_button("100", function()
	globals.set_int(ACg1, -200)
	globals.set_int(ACg2, 100)
end)
ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("Other Heists:")
ApartmentDataEditorMenu:add_button("100", function()
	globals.set_int(ACg1, -300)
	globals.set_int(ACg2, 100)
	globals.set_int(ACg3, 100)
	globals.set_int(ACg4, 100)
end)

local apartCut1 = 0
local apartCut2 = 0
local apartCut3 = 0
local apartCut4 = 0
ApartmentDataEditorMenu:add_imgui(function()
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
	ImGui.Text("For Fleeca Heist")
	if ImGui.Button("Set Cuts") then
		globals.set_int(ACg1, 100 - (apartCut1 * 2))
		globals.set_int(ACg2, apartCut2)
	end
	ImGui.Text("For Other Heists")
	if ImGui.Button("Set Cuts") then
		globals.set_int(ACg1, 100 - (apartCut1 * 4))
		globals.set_int(ACg2, apartCut2)
		globals.set_int(ACg3, apartCut3)
		globals.set_int(ACg4, apartCut4)
	end
	if ImGui.Button("Set Negative to Positive (own)") then
		globals.set_int(ACg5, -1 * (-100 + globals.get_int(ACg1)) / 2)
	end
end)
ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Extras")
ApartmentDataEditorMenu:add_button("Bypass Fleeca Hack", function()
	locals.set_int(FMC, AFHl, 7)
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Bypass Fleeca Drill", function()
	locals.set_float(FMC, AFDl, 100)
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Skip Checkpoint", function()
	locals.set_int(FMC, AHSo, locals.get_int(FMC, AHSo) | (1 << 17))
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Bypass Card Swipe", function()
	locals.set_int(FMC, ADSCS1, 8)
	locals.set_int(FMC, ADSCS2, 5)
end)

ApartmentDataEditorMenu:add_button("Play the Heist Solo", function()
	if locals.get_int(FMMCL, 19990 + 34) ~= nil then
		if locals.get_int(FMMCL, 19990 + 34) ~= 0 then
			if locals.get_int(FMMCL, 19990 + 34) > 1 then
				locals.set_int(FMMCL, 19990 + 15, 1)
				globals.set_int(794954 + 4 + 1 + (locals.get_int(FMMCL, 19990 + 34) * 95) + 75, 1)
			end
			globals.set_int(4718592 + 3539, 1)
			globals.set_int(4718592 + 3540, 1)
			globals.set_int(4718592 + 3542 + 1, 1)
			globals.set_int(4718592 + 184007 + 1, 0)
		end
	end
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
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Instant Finish", function()
	locals.set_int(FMC, AIFl3, 12)
	locals.set_int(FMC, AIFl4, 99999)
	locals.set_int(FMC, AIFl5, 99999)
	locals.set_int(FMC, AIFl6, 99999)
end)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Instant Finish (Pacific)", function()
	locals.set_int(FMC, 19791 + 1062, 5)
	locals.set_int(FMC, 19791 + 1740 + 1, 80)
	locals.set_int(FMC, 19791 + 2686, 10000000)
	locals.set_int(FMC, 28412 + 1, 99999)
	locals.set_int(FMC, 31668 + 1 + 68, 99999)
end)
ApartmentDataEditorMenu:add_text("Note: After Clicking Unlock All jobs, restart the game")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Casino Heist")

CasinoHeistEditorMenu:add_button("One Click Setup Casino Silent&Sneaky", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 1)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 127)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 262399)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

CasinoHeistEditorMenu:add_button("One Click Setup Casino The Big Con. Mode", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 2)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 3)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 913623)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

CasinoHeistEditorMenu:add_button("One Click Setup Casino Aggressive Mode", function()
	stats.set_int(MPX() .. "H3OPT_APPROACH", 3)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", 1)
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
	stats.set_int(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
	stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
	stats.set_int(MPX() .. "H3OPT_CREWHACKER", 5)
	stats.set_int(MPX() .. "H3OPT_VEHS", 2)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 1)
	stats.set_int(MPX() .. "H3OPT_BITSET0", 1835223)
	stats.set_int(MPX() .. "H3OPT_MASKS", 2)
end)

CasinoHeistEditorMenu:add_text("Preps")
CasinoHeistEditorMenu:add_text("")
local function CasinoApproachSetter(last_approach, hard_approach, approach, selected_approach)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", last_approach)
	stats.set_int(MPX() .. "H3_HARD_APPROACH", hard_approach)
	stats.set_int(MPX() .. "H3_APPROACH", approach)
	stats.set_int(MPX() .. "H3OPT_APPROACH", selected_approach)
end
local function CasinoCompletePreps()
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_BITSET0", -1)
	stats.set_int(MPX() .. "H3OPT_BITSET1", -1)
	stats.set_int(MPX() .. "H3OPT_COMPLETEDPOSIX", -1)
end
CasinoHeistEditorMenu:add_text("Primary Target")
CasinoHeistEditorMenu:add_button("Diamond", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 3)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Gold", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 1)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Arts", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 2)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Cash", function()
	stats.set_int(MPX() .. "H3OPT_TARGET", 0)
end)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Select Apprach")
CasinoHeistEditorMenu:add_button("Silent & Sneaky", function()
	CasinoApproachSetter(2, 1, 3, 1)
	STATS.STAT_SET_INT(MPX() .. "H3OPT_BITSET1", 127)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Big Con", function()
	CasinoApproachSetter(1, 2, 3, 2)
	STATS.STAT_SET_INT(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Aggressive", function()
	CasinoApproachSetter(2, 3, 1, 3)
	STATS.STAT_SET_INT(MPX() .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Gun Man")
local gunman = 0
local driver = 0
local hacker = 0
local mask = 0
local casinoPc1 = 0
local casinoPc2 = 0
local casinoPc3 = 0
local casinoPc4 = 0
local GunManLoadoutSi = {
	"Karl Abolaji/Micro SMG",
	"Karl Abolaji/Machine Pistol",
	"Charlie Reed/Assault SMG",
	"Charlie Reed/Bullpup Shotgun",
	"Patrick McReary/Combat PDW",
	"Patrick McReary/Assault Rifle",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/Pump Shotgun Mk II",
	"Chester McCoy/Carbine Rifle Mk II",
}
local GunManLoadoutBC = {
	"Karl Abolaji/Micro SMG",
	"Karl Abolaji/Double Barrel Shotgun",
	"Charlie Reed/Machine Pistol",
	"Charlie Reed/Sweeper Shotgun",
	"Patrick McReary/Sawed-Off Shotgun",
	"Patrick McReary/Compact Rifle",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/SMG Mk II",
	"Chester McCoy/Bullpup Rifle Mk II",
}
local GunManLoadoutAg = {
	"Karl Abolaji/Sawed-Off Shotgun",
	"Karl Abolaji/Heavy Revolver",
	"Charlie Reed/Assault SMG",
	"Charlie Reed/Pump Shotgun",
	"Patrick McReary/Heavy Shotgun",
	"Patrick McReary/Combat MG",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/Pump Shotgun Mk II",
	"Chester McCoy/Assault Rifle Mk II",
}
local DriverLoad = {
	"Karim Denz/Issi Classic",
	"Karim Denz/Asbo",
	"Karim Denz/Blista Kanjo",
	"Karim Denz/Sentinel Classic",
	"Zach Nelson/Manchez",
	"Zach Nelson/Stryder",
	"Zach Nelson/Defiler",
	"Zach Nelson/Lectro",
	"Taliana Martinez/Retinue Mk II",
	"Taliana Martinez/Drift Yosemite",
	"Taliana Martinez/Sugoi",
	"Taliana Martinez/Jugular",
	"Eddie Toh/Sultan Classic",
	"Eddie Toh/Gauntlet Classic",
	"Eddie Toh/Ellie",
	"Eddie Toh/Komoda",
	"Chester McCoy/Zhaba",
	"Chester McCoy/Vagrant",
	"Chester McCoy/Outlaw",
	"Chester McCoy/Everon",
}
local hackerLoad = {
	"Select",
	"Rickie Lukens",
	"Christian Feltz",
	"Yohan Blair",
	"Avi Schwartzman",
	"Page Harris",
}
local maskLoad = {
	"Select",
	"Geometic Set",
	"Hunter Set",
	"Oni Half Mask Set",
	"Emoji Set",
	"Ornate Skull Set",
	"Lucky Fruit Set",
	"Guerilla Set",
	"Clown Set",
	"Animal Set",
	"Riot Set",
	"Oni Full Mask Set",
	"Hockey Set",
}
CasinoHeistEditorMenu:add_imgui(function()
	if stats.get_int(MPX() .. "H3OPT_APPROACH") == 1 then
		ImGui.SetNextItemWidth(265)
		gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutSi, 10)
	elseif stats.get_int(MPX() .. "H3OPT_APPROACH") == 2 then
		ImGui.SetNextItemWidth(265)
		gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutBC, 10)
	elseif stats.get_int(MPX() .. "H3OPT_APPROACH") == 3 then
		ImGui.SetNextItemWidth(265)
		gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutAg, 10)
	end

	if ImGui.Button("Set Loadout") then
		ImGui.Text(gunman)
		if gunman <= 1 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 1)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman)
		elseif gunman <= 4 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 3)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 2)
		elseif gunman <= 6 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 5)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 4)
		elseif gunman <= 8 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 2)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 6)
		elseif gunman <= 10 then
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
			stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 8)
		end
	end
	ImGui.Separator()
	ImGui.Text("Getaway Vehicles")
	ImGui.SetNextItemWidth(265)
	driver = ImGui.Combo("", driver, DriverLoad, 20)
	if ImGui.Button("Set Getaway Vehicle") then
		ImGui.Text(driver)
		if driver <= 3 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 1)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver)
		elseif driver <= 7 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 4)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 4)
		elseif driver <= 11 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 2)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 8)
		elseif driver <= 15 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 3)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 12)
		elseif driver <= 19 then
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", 5)
			stats.set_int(MPX() .. "H3OPT_VEHS", driver - 16)
		end
	end
	ImGui.Separator()
	ImGui.Text("Hacker")
	ImGui.SetNextItemWidth(265)
	hacker = ImGui.Combo("Hacker", hacker, hackerLoad, 6)
	if ImGui.Button("Set Hacker") then
		ImGui.Text(hacker)
		stats.set_int(MPX() .. "H3OPT_CREWHACKER", hacker)
	end
	ImGui.Separator()
	ImGui.Text("Mask")
	ImGui.SetNextItemWidth(265)
	ImGui.SetNextItemWidth(265)
	mask = ImGui.Combo("Masks", mask, maskLoad, 13)
	if ImGui.Button("Set Mask") then
		ImGui.Text(mask)
		stats.set_int(MPX() .. "H3OPT_MASKS", mask)
	end
	ImGui.Separator()
	if ImGui.Button("Complete preps") then
		CasinoCompletePreps()
	end
	ImGui.Separator()
	ImGui.Text("Cuts")
	ImGui.Text("Preset Cut")
	if ImGui.Button("Set Cut to 100") then
		CutsPresetter(DCCg1, DCCg4, 100)
	end
	casinoPc1 = ImGui.InputInt("Player Cut 1", casinoPc1)
	casinoPc2 = ImGui.InputInt("Player Cut 2", casinoPc2)
	casinoPc3 = ImGui.InputInt("Player Cut 3", casinoPc3)
	casinoPc4 = ImGui.InputInt("Player Cut 4", casinoPc4)
	if ImGui.Button("Set Player Cuts") then
		globals.set_int(DCCg1, casinoPc1)
		globals.set_int(DCCg2, casinoPc2)
		globals.set_int(DCCg3, casinoPc3)
		globals.set_int(DCCg4, casinoPc4)
	end
end)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_button("Reload Planning Screen", function()
	locals.set_int("gb_casino_heist_planning", DCRBl, 2)
end)

CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Instant Heist Passed")
CasinoHeistEditorMenu:add_button("Instant Finish $$", function()
	local approachType = stats.get_int(MPX() .. "H3OPT_APPROACH")
	if approachType == 3 then
		locals.set_int(FMC, DCXf1, 12)
		locals.set_int(FMC, DCXf3, 80)
		locals.set_int(FMC, DCXf4, 10000000)
		locals.set_int(FMC, DCXf5, 99999)
		locals.set_int(FMC, DCXf6, 99999)
		gui.show_message("Instant Heist Passed", "Activated")
	else
		locals.set_int(FMC, DCXf2, 12)
		locals.set_int(FMC, DCXf3, 80)
		locals.set_int(FMC, DCXf4, 10000000)
		locals.set_int(FMC, DCXf5, 99999)
		locals.set_int(FMC, DCXf6, 99999)
		gui.show_message("Instant Heist Passed", "Activated")
	end
end)

local CasinoHeistExtra = CasinoHeistEditorMenu:add_tab("Extras")
CasinoHeistExtra:add_text("Make Lester, Driver, Hacker, and Gunman cut to 0%")
CasinoHeistExtra:add_button("Make Fees to 0", function()
	globals.set_int(DCCgun, 0)
	globals.set_int(DCCh, 0)
	globals.set_int(DCCl, 0)
	globals.set_int(DCCd, 0)
end)
CasinoHeistExtra:add_text("Hacks")
CasinoHeistExtra:add_button("Bypass Casino Fingerprint Hack", function()
	if locals.get_int(FMC, DCFHl) == 4 then
		locals.set_int(FMC, DCFHl, 5)
	end
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Keypad Hack", function()
	if locals.get_int(FMC, DCKHl) ~= 4 then
		locals.set_int(FMC, DCKHl, 5)
	end
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Drill Vault Door", function()
	locals.set_int(FMC, DCDVDl1, locals.get_int(FMC, DCDVDl2))
end)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Drill Vault Door", function()
	locals.set_int(FMC, ADSCS1, 8)
	locals.set_int(FMC, ADSCS2, 5)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Updated by DeadlineEm, I used your modest menu version for ideas for this.

-- Deleting enemies does not allow the keycards to drop, so teleport into the
-- seondary buildings to grab the loot, you can open the door for others from
-- the inside
local CayoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Cayo Perico Editor")

CayoHeistEditorMenu:add_text("Cuts to All")
CayoHeistEditorMenu:add_button("100", function()
	CutsPresetter(CPCg1, CPCg4, 100)
end)
CayoHeistEditorMenu:add_text("")
CayoHeistEditorMenu:add_text("Custom Cut")
local cayocut1 = CayoHeistEditorMenu:add_input_int("Cut 1")
local cayocut2 = CayoHeistEditorMenu:add_input_int("Cut 2")
local cayocut3 = CayoHeistEditorMenu:add_input_int("Cut 3")
local cayocut4 = CayoHeistEditorMenu:add_input_int("Cut 4")
CayoHeistEditorMenu:add_button("Set", function()
	globals.set_int(CPCg1, cayocut1:get_value())
	globals.set_int(CPCg2, cayocut2:get_value())
	globals.set_int(CPCg3, cayocut3:get_value())
	globals.set_int(CPCg4, cayocut4:get_value())
end)
CayoHeistEditorMenu:add_separator()

CayoHeistEditorMenu:add_text("Non-Legit Presets")

CayoHeistEditorMenu:add_button("Panther/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 5)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Panther Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)
CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Diamond/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 3)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Diamond Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Bonds/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 2)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Bonds Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Necklace/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 1)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Necklace Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Tequila/Gold (Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 0)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 1191817)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Tequila Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)
CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Legit Presets")

CayoHeistEditorMenu:add_button("Panther/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 5) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(PSV, 1900000) -- Panther Value -- 1900000 shows as 2,090,000 in-game on the board. 190,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Panther Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Diamond/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 3) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(PDIAMOND, 1300000) -- Diamond Value  -- 1300000 shows as 1,430,000 in-game. 130,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Diamond Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Bonds/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 2) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(BB, 770000) -- Bonds Value -- 770000 shows as 847,000 in-game.  77,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Bonds Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Necklace/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 1) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(RN, 700000) -- Necklace Value -- 700000 shows as 770,000 in-game. 70,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Necklace Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Tequila/Gold (L. Hard)", function()
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 131071)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_WEAPONS", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_TARGET", 0) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
	stats.set_int(MPX() .. "H4CNF_TROJAN", 2)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
	-- Island Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_I", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I", 0)

	-- Compound Loot // -1 shows all, 0 shows none
	stats.set_int(MPX() .. "H4LOOT_CASH_C", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 131055) -- 131055 // Hard Mode  -  130667 // Solo Normal??

	-- These are what is set when you find loot throughout the island/compound
	stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", 0)
	stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", -1)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)

	-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
	stats.set_int(MPX() .. "H4LOOT_GOLD_V", 45375)
	globals.set_int(TEQUILA, 693000) -- Tequila Value -- 630000 shows as 693,000. 63,000 difference.

	stats.set_int(MPX() .. "H4_MISSIONS", 65535)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 32)

	gui.show_message("Cayo Heist", "Tequila Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Reset Presets Completely")
CayoHeistEditorMenu:add_button("Reset Heist Completely", function()
	stats.set_int(MPX() .. "H4_MISSIONS", 0)
	stats.set_int(MPX() .. "H4_PROGRESS", 0)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 0)
	stats.set_int(MPX() .. "H4CNF_APPROACH", 0)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 0)
	stats.set_int(MPX() .. "H4CNF_BS_GEN", 0)
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text(
	"Press this after clicking one of the above presets or after the reset heist Completely Option"
)
CayoHeistEditorMenu:add_button("Reset Kosatka Board", function()
	locals.set_int(HIP, CPRSl, 2)
	gui.show_message("Cayo Heist", "Planning board has been reset!")
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("During Heist")
CayoHeistEditorMenu:add_button("Skip Drainage Cut", function()
	locals.set_int(FMC2020, CPSTCl, 6)
	gui.show_message("Cayo Heist", "Bypassed Drainage Cut")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Skip Fingerprint Scanner", function()
	locals.set_int(FMC2020, CPFHl, 5)
	gui.show_message("Cayo Heist", "Bypassed Fingerprint Scanner")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Skip Glass Cut", function()
	locals.set_float(FMC2020, CPPCCl, 100.0)
	gui.show_message("Cayo Heist", "Bypassed Plasma Cutter")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Remove All CCTV's", function()
	for _, ent in pairs(entities.get_all_objects_as_handles()) do
		for __, cam in pairs(CamList) do
			if ENTITY.GET_ENTITY_MODEL(ent) == cam then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
				ENTITY.DELETE_ENTITY(ent)
			end
		end
	end
end)
CamList = {
	joaat("prop_cctv_cam_01a"),
	joaat("prop_cctv_cam_01b"),
	joaat("prop_cctv_cam_02a"),
	joaat("prop_cctv_cam_03a"),
	joaat("prop_cctv_cam_04a"),
	joaat("prop_cctv_cam_04c"),
	joaat("prop_cctv_cam_05a"),
	joaat("prop_cctv_cam_06a"),
	joaat("prop_cctv_cam_07a"),
	joaat("prop_cs_cctv"),
	joaat("p_cctv_s"),
	joaat("hei_prop_bank_cctv_01"),
	joaat("hei_prop_bank_cctv_02"),
	joaat("ch_prop_ch_cctv_cam_02a"),
	joaat("xm_prop_x17_server_farm_cctv_01"),
}

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Delete Mission NPC's", function() -- Thanks to RazorGamerX for the help on this
	for index, ped in ipairs(entities.get_all_peds_as_handles()) do
		local model = ENTITY.GET_ENTITY_MODEL(ped)
		if model == 0x7ED5AD78 or model == 0x6C8C08E5 or model == 0x995B3F9F or model == 0xB881AEE then
			ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, true, true)
			PED.DELETE_PED(ped)
		end
	end
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("After Heist")
CayoHeistEditorMenu:add_button("Skip Cooldown", function()
	-- Solo Skip
	stats.set_int("MP0_H4_TARGET_POSIX", 1659643454)
	stats.set_int("MP0_H4_COOLDOWN", 0)
	stats.set_int("MP0_H4_COOLDOWN_HARD", 0)
	-- Multiplayer Skip
	stats.set_int("MP0_H4_TARGET_POSIX", 1659429119)
	stats.set_int("MP0_H4_COOLDOWN", 0)
	stats.set_int("MP0_H4_COOLDOWN_HARD", 0)
	-- Solo Skip (Second Character)
	stats.set_int("MP1_H4_TARGET_POSIX", 1659643454)
	stats.set_int("MP1_H4_COOLDOWN", 0)
	stats.set_int("MP1_H4_COOLDOWN_HARD", 0)
	-- Multiplayer Skip (Second Character)
	stats.set_int("MP1_H4_TARGET_POSIX", 1659429119)
	stats.set_int("MP1_H4_COOLDOWN", 0)
	stats.set_int("MP1_H4_COOLDOWN_HARD", 0)

	gui.show_message("Cayo Heist", "Skipped Cayo Perico Cooldown for all characters")
	gui.show_message("Cayo Heist", "Go to story mode and come back to apply the reset")
end)
CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("How to Set Up or Bypass Cooldown:")
CayoHeistEditorMenu:add_text(
	"Make sure you have completed the heist and you are standing in front of the planning screen"
)
CayoHeistEditorMenu:add_text("Click Skip Cooldown, then click on your Preset and click Reset Kosatka Board")

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Instant Heist Passed")
CayoHeistEditorMenu:add_button("Instant Finish $$", function()
	locals.set_int(FMC2020, IHPB, 9)
	locals.set_int(FMC2020, IHPL, 50)
	gui.show_message("Instant Heist Passed", "Activated")
end)

-- Cayo Bag Size & Value Editor
local cayoSizeEditor = CayoHeistEditorMenu:add_tab("Size/Value Editor")
cayoSizeEditor:add_text("Bag Size Editor")
bagSizeVal = 1800
cayoSizeEditor:add_imgui(function()
	bagSizeVal, used = ImGui.SliderInt("Bag Size", bagSizeVal, 1800, 7200) -- 7200 = 4 players, this works if you want more money solo and it adjusts so you can always have full bags
	if used then
		globals.set_int(BAS1, bagSizeVal)
		gui.show_message("Bag Size Modified!")
	end
end)

cayoSizeEditor:add_text("Custom Bag Size Editor")
custombagSizeVal = 1800
cayoSizeEditor:add_imgui(function()
	custombagSizeVal, used = ImGui.SliderInt("Custom Bag Size", custombagSizeVal, 1800, 2147483646)
	if used then
		globals.set_int(BAS1, custombagSizeVal)
		gui.show_message("Custom Bag Size Modified!")
	end
end)

cayoSizeEditor:add_separator()
cayoSizeEditor:add_text("Primary Target Editors")
pantherSizeVal = 1900000
cayoSizeEditor:add_imgui(function()
	pantherSizeVal, used = ImGui.SliderInt("Panther Value", pantherSizeVal, 1900000, 3800000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(PSV, pantherSizeVal)
		gui.show_message("Panther Value Modified!", out)
	end
end)

diamondSizeVal = 1300000
cayoSizeEditor:add_imgui(function()
	diamondSizeVal, used = ImGui.SliderInt("Diamond Value", diamondSizeVal, 1300000, 2600000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(PDIAMOND, diamondSizeVal)
		gui.show_message("Diamond Value Modified!", out)
	end
end)

bondSizeVal = 770000
cayoSizeEditor:add_imgui(function()
	bondSizeVal, used = ImGui.SliderInt("Bonds Value", bondSizeVal, 770000, 1540000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(BB, bondSizeVal)
		gui.show_message("Bonds Value Modified!", out)
	end
end)

necklaceSizeVal = 700000
cayoSizeEditor:add_imgui(function()
	necklaceSizeVal, used = ImGui.SliderInt("Necklace Value", necklaceSizeVal, 700000, 1400000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(RN, necklaceSizeVal)
		gui.show_message("Necklace Value Modified!", out)
	end
end)

tequilaSizeVal = 693000
cayoSizeEditor:add_imgui(function()
	tequilaSizeVal, used = ImGui.SliderInt("Tequila Value", tequilaSizeVal, 693000, 1400000) -- Double the original price
	out = "Reset the board to see changes"

	if used then
		globals.set_int(TEQUILA, tequilaSizeVal)
		gui.show_message("Tequila Value Modified!", out)
	end
end)

cayoSizeEditor:add_separator()
cayoSizeEditor:add_text("Secondary Target Editors")

goldSizeVal = 45375
cayoSizeEditor:add_imgui(function()
	goldSizeVal, used = ImGui.SliderInt("Gold Value", goldSizeVal, 45375, 181500) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_GOLD_V", goldSizeVal)
		gui.show_message("Gold Value Modified!", out)
	end
end)

cokeSizeVal = 25312
cayoSizeEditor:add_imgui(function()
	cokeSizeVal, used = ImGui.SliderInt("Coke Value", cokeSizeVal, 25312, 101248) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_COKE_V", cokeSizeVal)
		gui.show_message("Coke Value Modified!", out)
	end
end)

paintSizeVal = 22500
cayoSizeEditor:add_imgui(function()
	paintSizeVal, used = ImGui.SliderInt("Paintings Value", paintSizeVal, 22500, 90000) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", paintSizeVal)
		gui.show_message("Paintings Value Modified!", out)
	end
end)

weedSizeVal = 16875
cayoSizeEditor:add_imgui(function()
	weedSizeVal, used = ImGui.SliderInt("Weed Value", weedSizeVal, 16875, 67500) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_WEED_V", weedSizeVal)
		gui.show_message("Weed Value Modified!", out)
	end
end)

cashSizeVal = 10406
cayoSizeEditor:add_imgui(function()
	cashSizeVal, used = ImGui.SliderInt("Cash Value", cashSizeVal, 10406, 41624) -- Quadruple the original price
	out = "Reset the board to see changes"

	if used then
		stats.set_int(MPX() .. "H4LOOT_WEED_V", cashSizeVal)
		gui.show_message("Cash Value Modified!", out)
	end
end)
cayoSizeEditor:add_text("These values seem incorrect, but the game reads them properly.")
cayoSizeEditor:add_text("Minimum values are exact defaults for ALL targets.")
cayoSizeEditor:add_separator()
cayoSizeEditor:add_text("Press this after setting values.")
cayoSizeEditor:add_button("Reset Kosatka Board", function()
	locals.set_int(HIP, 1566, 2)
	gui.show_message("Cayo Heist", "Planning board has been reset!")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DoomsdayHeistEditorMenu = HeistsDataEditorMenu:add_tab("Doomsday Heist Editor")

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 1: The Data Breaches", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 7)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 7)
end)

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 2: The Bodgan Problem", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 240)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 248)
end)

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 3: Doomsday Scenario", function()
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 15872)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", 16128)
end)

DoomsdayHeistEditorMenu:add_text("Set Doomsday Heist Cuts")
DoomsdayHeistEditorMenu:add_text("Preset Cut")
DoomsdayHeistEditorMenu:add_button("100", function()
	CutsPresetter(DCg1, DCg4, 100)
end)
DoomsdayHeistEditorMenu:add_text("Custom Cuts")
local dmsdyCut1 = DoomsdayHeistEditorMenu:add_input_int("Cut 1")
local dmsdyCut2 = DoomsdayHeistEditorMenu:add_input_int("Cut 2")
local dmsdyCut3 = DoomsdayHeistEditorMenu:add_input_int("Cut 3")
local dmsdyCut4 = DoomsdayHeistEditorMenu:add_input_int("Cut 4")
DoomsdayHeistEditorMenu:add_button("Set Cuts", function()
	globals.set_int(DCg1, dmsdyCut1:get_value())
	globals.set_int(DCg2, dmsdyCut2:get_value())
	globals.set_int(DCg3, dmsdyCut3:get_value())
	globals.set_int(DCg4, dmsdyCut4:get_value())
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Preps")
DoomsdayHeistEditorMenu:add_button("Reset Preps", function()
	DoomsdayActSetter(240, 0)
end)

DoomsdayHeistEditorMenu:add_sameline()
DoomsdayHeistEditorMenu:add_button("Complete Preps", function()
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Bypass Doomsday Scenario hack")
DoomsdayHeistEditorMenu:add_button("By Act III Pass hack", function()
	locals.set_int(FMC, DDSHl, 3)
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Instant Heist Passed")
DoomsdayHeistEditorMenu:add_button("Instant Finish $$", function()
	locals.set_int(FMC, 19791, 12)
	locals.set_int(FMC, 19791 + 2686, 10000000)
	locals.set_int(FMC, 28412 + 1, 99999)
	locals.set_int(FMC, 31668 + 69, 99999)
	gui.show_message("Instant Heist Passed", "Activated")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MissionsSelectorAndCooldownMenu = L7NEG:add_tab("Missions Selector And cooldown Menu")

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
Yimura:add_text("Yim Menu Cheat Developer For Legacy And Enhanced")
Yimura:add_text("GitHub:")
Yimura:add_text("https://github.com/YimMenu/YimMenu")
Yimura:add_text("https://github.com/YimMenu/YimMenuV2")

L7NEGDEV = CreditsMenu:add_tab("L7NEG")
L7NEGDEV:add_text("Coded This W Script With <3 To You All")
L7NEGDEV:add_text("Source:")
L7NEGDEV:add_text("https://github.com/UltimateMenu/UltimateMenu")

SILENTSALO = CreditsMenu:add_tab("Silent")
SILENTSALO:add_text("For His W Useful Unlocks Along With Casino And Gunvan Menu")
SILENTSALO:add_text("Source:")
SILENTSALO:add_text("https://github.com/SilentSal0/Silent-Night")

XESDDOOG = CreditsMenu:add_tab("SAMURAI aka xesdoog")
XESDDOOG:add_text("For His W YimResupplier Script")
XESDDOOG:add_text("Source:")
XESDDOOG:add_text("https://github.com/YimMenu-Lua/YimResupplier")
XESDDOOG:add_text("https://github.com/YimMenu-Lua/Samurais-Scripts")

SLON = CreditsMenu:add_tab("SLON")
SLON:add_text("For ''YimCeo v0.6 by Slon_.lua'' Code")
SLON:add_text("Source:")
SLON:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")

Alestarov = CreditsMenu:add_tab("Alestarov")
Alestarov:add_text("For 1 Click Cayo Setup")
Alestarov:add_text("Source:")
Alestarov:add_text("https://github.com/YimMenu-Lua/Alestarov-Menu")

YOUMENU = CreditsMenu:add_tab("And You <3")
YOUMENU:add_text(
	"Yes You Without You Or Your PRs and support You Give Me This Script Would Be Nothing Fr So Big Thanks To You All"
)
YOUMENU:add_text("You can report Bugs And Make PRs With Features Down Bellow:")
YOUMENU:add_text("https://github.com/UltimateMenu/UltimateMenu/issues")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
