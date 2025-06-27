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

is_player_male = (ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == joaat("mp_m_freemode_01"))

local currentlevel = stats.get_int(MPX() .. "CHAR_RANK_FM")
local currentrp = stats.get_int(MPX() .. "CHAR_XP_FM")
local currentcrewlevel = stats.get_int("MPPLY_CURRENT_CREW_RANK")

script.register_looped("AutoStatsUpdater", function(script)
    local success, err = pcall(function()
        local newlevel = stats.get_int(MPX() .. "CHAR_RANK_FM")
        local newrp = stats.get_int(MPX() .. "CHAR_XP_FM")
        local newcrewlevel = stats.get_int("MPPLY_CURRENT_CREW_RANK")

        if newlevel ~= currentlevel or newrp ~= currentrp or newcrewlevel ~= currentcrewlevel then
            currentlevel = newlevel
            currentrp = newrp
            currentcrewlevel = newcrewlevel
        end
    end)
    
    if not success then
        gui.show_message("Stats Update Error", "Failed to update stats: " .. tostring(err))
    end
end)

--Required Scripts--

FMC = "fm_mission_controller"
FMMCL = "fmmc_launcher"
FMC2020 = "fm_mission_controller_2020"
HIP = "heist_island_planning"

--Globals & Locals & Variables--

FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
CSg1    = 1575038 						-- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);
CSg2    = 1574589 						-- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE
CSg3    = 1574589 + 2 					-- change session (quit) 3 					// Guide:   MP_POST_MATCH_TRANSITION_SCENE

-- Apartment Heist
ACg1 = 1931323 + 1 + 1 -- global apartment player 1 cut global ("fmmc_launcher")
ACg2 = 1931323 + 1 + 2 -- global apartment player 2 cut global ("fmmc_launcher")
ACg3 = 1931323 + 1 + 3 -- global apartment player 3 cut global ("fmmc_launcher")
ACg4 = 1931323 + 1 + 4 -- global apartment player 4 cut global ("fmmc_launcher")
ACg5 = 1933291 + 3008 + 1 -- local apartment player 1 cut global ("fmmc_launcher")
AUAJg1 = FMg + 9101 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9106 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9113 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9119 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9125 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 19787 -- apartment instant finish local 1
AIFl4 = 19787 + 2686 -- apartment instant finish local 2
AIFl5 = 28407 + 1 -- apartment instant finish local 3
AIFl6 = 31663 + 1 + 68
AFHl = 11818 + 24 -- apartment fleeca hack local
AFDl = 10107 + 11 -- apartment fleeca drill local
AHSo = 19789  -- Apartment heist skip checkpoint

-- Diamond Casino Heist
DCRBl = 208 -- diamond casino reload board local
DCCg1 = 1967717 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global ("gb_casino_heist_planning")
DCCg2 = 1967717 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global ("gb_casino_heist_planning")
DCCg3 = 1967717 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global ("gb_casino_heist_planning")
DCCg4 = 1967717 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global ("gb_casino_heist_planning")
DCCl = FMg + 28313 -- ("CH_LESTER_CUT")
DCCh = FMg + 28349 - 1 --("2027377935")
DCCd = FMg + 28344 - 1 --("88090906")
DCCgun = FMg + 28339 - 1 --("74718927")
DCFHl = 53127 -- diamond casino fingerprint hack local
DCKHl = 54193 -- diamond casino keypad hack local
DCDVDl1 = 10107 + 7 -- diamond casino drill vault door local 1 --("DLC_HEIST_MINIGAME_FLEECA_DRILLING_SCENE") in ("fm_mission_controller")
DCDVDl2 = 10107 + 37 -- diamond casino drill vault door local 2 --("fm_mission_controller")
DCXf1 = 19787
DCXf2 = 19787 + 1062
DCXf3 = 19787 + 1740 + 1
DCXf4 = 19787 + 2686
DCXf5 = 28407 + 1
DCXf6 = 31663 + 1 + 68

-- Cayo Perico Heist
CPRSl = 1566 -- cayo perico reload screen local
CPCg1 = 1974520 + 831 + 56 + 1 -- cayo perico player 1 cut global --("heist_island_planning")
CPCg2 = 1974520 + 831 + 56 + 2 -- cayo perico player 2 cut global --("heist_island_planning")
CPCg3 = 1974520 + 831 + 56 + 3 -- cayo perico player 3 cut global --("heist_island_planning")
CPCg4 = 1974520 + 831 + 56 + 4 -- cayo perico player 4 cut global --("heist_island_planning")
CPFHl = 25058 -- cayo perico fingerprint hack local ("heist") in ("fm_mission_controller_2020")
CPPCCl = 31123 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") in ("fm_mission_controller_2020")
CPSTCl = 29883 -- cayo perico drainage pipe cut local ("IntroFinished") in ("fm_mission_controller_2020")
CPXf1 = 54353 -- cayo perico instant finish local 1
CPXf2 = 54353 + 1776 + 1 -- cayo perico instant finish local 2

-- Doomsday Heist
DDSHl = 1294 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1963610 + 812 + 50 + 1 -- doomsday player 1 cut global --("gb_gang_ops_planning")
DCg2 = 1963610 + 812 + 50 + 2 -- doomsday player 2 cut global --("gb_gang_ops_planning")
DCg3 = 1963610 + 812 + 50 + 3 -- doomsday player 3 cut global --("gb_gang_ops_planning")
DCg4 = 1963610 + 812 + 50 + 4 -- doomsday player 4 cut global --("gb_gang_ops_planning")

IHPB = 54353 --Instant Heist Passed Local Base (Casino And CayoPerico)
IHPL = 54353 + 1776 + 1 --Instant Heist Passed Locals (Casino And CayoPerico)

NLCl = 204 + 32 + 1 --("nightclub_office_cutscene") in ("am_mp_nightclub")

SNOW = FMg + 4413
halloweatherAddress = FMg + 32157

--BV = Ballastic Value----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BV = FMg + 20024

--CCBL = Casino Chips Buy Limit-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CCBL0 = FMg + 26534
CCBL1 = FMg + 26535

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1 = FMg + 29210

--PSV=Panther Statue-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PSV = FMg + 29462

--PDIAMOND=Pink Diamond---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PDIAMOND = FMg + 29460

--BB=Bearer Bonds---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BB = FMg + 29459

--RN=Ruby Necklace--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN = FMg + 29458

--TEQUILA=Tequila---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TEQUILA = FMg + 29457

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG = gui.get_tab("Ultimate Menu 1.71 GTA Legacy")

L7NEG:add_text("                      Ultimate Menu 1.71 ")
L7NEG:add_text("                                v2.7")

L7NEG:add_imgui(function()
    ImGui.Text("Your level                " .. currentlevel)
    ImGui.Text("Your RP Value      " .. currentrp)
    ImGui.Text("Current Crew Level   " .. currentcrewlevel)
end)

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
	if RemoveTransactionError then
		globals.set_int(4538671, 0)
		globals.set_int(4538672, 0)
		globals.set_int(4538673, 0)
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
    0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000,
    28500, 33400, 38700, 44200, 50200, 56400, 63000, 69900, 77100, 84700,
    92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100,
    188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,
    312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800,
    465200, 482000, 499000, 516300, 533800, 551600, 569600, 588000, 606500, 625400,
    644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900,
    849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700,
    1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100,
    1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300
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

rpmvalue = globals.get_float(FMg + 1)
TunMenu:add_imgui(function()
	rpmvalue, used = ImGui.DragInt("RP", rpmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 1, rpmvalue)
	end
end)

apmvalue = globals.get_float(FMg + 25489)
TunMenu:add_imgui(function()
	apmvalue, used = ImGui.DragInt("AP", apmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 25489, apmvalue)
	end
end)

srmvalue = globals.get_float(FMg + 30979)
TunMenu:add_imgui(function()
	srmvalue, used = ImGui.DragInt("Street Races", srmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 30979, srmvalue)
	end
end)

pmvalue = globals.get_float(FMg + 30980)
TunMenu:add_imgui(function()
	pmvalue, used = ImGui.DragInt("Pursuits", pmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 30980, pmvalue)
	end
end)

f2fmvalue = globals.get_float(FMg + 30981)
TunMenu:add_imgui(function()
	f2fmvalue, used = ImGui.DragInt("Face2Face", f2fmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 30981, f2fmvalue)
	end
end)

lscmmvalue = globals.get_float(FMg + 30982)
TunMenu:add_imgui(function()
	lscmmvalue, used = ImGui.DragInt("LS Car Meet", lscmmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 30982, lscmmvalue)
	end
end)

lscmotmvalue = globals.get_float(FMg + 30983)
TunMenu:add_imgui(function()
	lscmotmvalue, used = ImGui.DragInt("LS Car Meet on track", lscmotmvalue, 1, 100000)
	if used then
		globals.set_float(FMg + 30983, lscmotmvalue)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

OnlineServicesMenu = L7NEG:add_tab("Online Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoServicesMenu = OnlineServicesMenu:add_tab("Casino Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local cslots = "casino_slots"
slots_random_results_table = 1370
prize_wheel_win_state = 300 
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

---Full Account Unlocker Tool---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FAUT = RecoveryMenu:add_tab("Full Account Unlock Menu")

--Character's Stats-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CSU = FAUT:add_tab("Character's Stats")

CSU:add_button("Max Character Skills", function()
	stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
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
local weekly_words_global = 2739243 --("am_challenges")
local objectives_state_global = 1574745 --("am_challenges")

FAUT:add_button("Complete All Daily & Weekly Challenges", function()
	script.run_in_fiber(function(script)
		for i = 0, 2 do --Unlock all daily rewards.
			local objective = globals.get_int(current_objectives_global + (1 + (0 * 5571)) + 681 + 4245 + (1 + (i * 3)))
			globals.set_int(objectives_state_global + 1 + (1 + (i * 1)), objective)
		end
		globals.set_int(objectives_state_global, 1)
		globals.set_int(
			weekly_words_global + (1 + (0 * 6)) + 1,
			globals.get_int(weekly_words_global + (1 + (0 * 6)) + 2)
		) --Unlock Weekly Objective
	end)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

LSCMUnlockeRecoveryMenu = RecoveryMenu:add_tab("LSCM Unlocker Menu")

LSCMUnlockeRecoveryMenu:add_button("Unlock All Rep Lvl 1000", function()
	for i = FMg + 30958, FMg + 30987 do
		globals.set_float(i, 100000)
	end
end)

LSCMUnlockeRecoveryMenu:add_button("LSCM Prize Ride Unlock", function()
	stats.set_bool(MPX() .. "CARMEET_PV_CHLLGE_CMPLT", true)
	stats.set_bool(MPX() .. "CARMEET_PV_CLMED", false)
end)

LSCMUnlockeRecoveryMenu:add_button("Unlock Trade Prices for Headlights", function() stats_set_packed_bools(24980, 24991, true) end)

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
	gun_van_loc = globals.get_int(2652584 + 2706)

	if is_typing then
		PAD.DISABLE_ALL_CONTROL_ACTIONS(0)
	end

	if weapon_skins then
		tunables.set_bool(1490225691, false)
	end

	if livery_lock then
		local value = locals.get_int("gunclub_shop", 142 + 747) | (1 << 8)
		locals.set_int("gunclub_shop", 142 + 747, value)
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
		globals.set_int(2652584 + 2706, selected_loc)
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

L7NEG7 = L7NEG:add_tab("Ultimate Money Methods Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AirCargoMenu = L7NEG7:add_tab("Air Cargo Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CARGO1 = FMg + 22492
CARGO2 = FMg + 22493
CARGO3 = FMg + 22494
CARGO4 = FMg + 22495
CARGO5 = FMg + 22496
CARGO6 = FMg + 22497
CARGO7 = FMg + 22498
CARGO8 = FMg + 22499
CARGO9 = FMg + 22500

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
		globals.set_float(FMg + 22475, 0)
	else
		globals.set_float(FMg + 22475, 0.025)
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

NightClubSafeMenu = L7NEG7:add_tab("NightClub Safe Loop Menu")

SafeAmount = 250000
SafeCapacity = 23680 --NIGHTCLUBMAXSAFEVALUE
IncomeStart = 23657 --NIGHTCLUBINCOMEUPTOPOP5
IncomeEnd = 23676 --NIGHTCLUBINCOMEUPTOPOP100

NCRSCB = NightClubSafeMenu:add_checkbox("Enable Nitghtclub $300k/3.5s (Safe Remote AFK)")
script.register_looped("nightclubremotelooptest", function(script)
	script:yield()
	if NCRSCB:is_enabled() == true then
		SafeValue = 1845225 + self.get_id() + 260 + 358 + 5 --("am_mp_nightclub")
		for i = IncomeStart, IncomeEnd do
			globals.set_int(FMg + i, SafeAmount)
		end
		globals.set_int(FMg + SafeCapacity, SafeAmount)
		stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
		script:sleep(2500)
		if globals.get_int(SafeValue) ~= 0 then
		end
		locals.set_int("am_mp_nightclub", NLCl, 1)
		globals.set_int(4538671, 0)
		globals.set_int(4538672, 0)
		globals.set_int(4538673, 0)
		script:sleep(1000)
	end
end)

NightClubSafeMenu:add_separator()

NightClubSafeMenu:add_button("Open Nightclub Screen", function()
	SCRIPT.REQUEST_SCRIPT("appBusinessHub")
	SYSTEM.START_NEW_SCRIPT("appBusinessHub", 1424)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

UseAtYourOwnRiskMenu = L7NEG7:add_tab("Use At Your Own Risk Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CeoManagerMenu = UseAtYourOwnRiskMenu:add_tab("Ceo Manager Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--©️ 2024 ΞΛZТΞΛ#0157/SLON
CEO1 = FMg + 15732
CEO2 = FMg + 15499
CEO3 = FMg + 15500
SMC1 = 565 + 1 --("gb_contraband_sell")
SMC2 = 565 + 7 --("gb_contraband_sell")
SMC3 = 565 + 584 --("gb_contraband_sell")
SMC4 = 565 + 55 --("gb_contraband_sell")
SMC5 = 565 + 595 --("gb_contraband_sell")
SMC6 = 581 --("GTAO_Exec_SecuroServ_Computer_Sounds") in ("appsecuroserv")
SMC7 = 761 --("MP_WH_SELL") or ("WH_MFREASON_12") in ("appsecuroserv")
SMC8 = 762 --("MP_WH_SELL") or ("WH_MFREASON_12") in ("appsecuroserv")
SMC9 = 623 + 5 --("SPEECH_PARAMS_SHOUTED_CRITICAL") in ("gb_contraband_buy")
SMC10 = 623 + 1 --func_91() in ("gb_contraband_buy")
SMC11 = 623 + 191 --("gb_contraband_buy")
SMC12 = 623 + 192 --("gb_contraband_buy")

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
    ImGui.Text("Griefing: " ..stats.get_int("MPPLY_GRIEFING"))
	ImGui.Text("Exploiting: " ..stats.get_int("MPPLY_EXPLOITS"))
	ImGui.Text("Abusing Bugs: " ..stats.get_int("MPPLY_GAME_EXPLOITS"))
	ImGui.Text("Annoying People In Text: " ..stats.get_int("MPPLY_TC_ANNOYINGME"))
	ImGui.Text("Hate Speech In Voice: " ..stats.get_int("MPPLY_VC_HATE"))
	ImGui.Text("Offensive Language: " ..stats.get_int("MPPLY_OFFENSIVE_LANGUAGE"))
	ImGui.Text("Offensive Tagplate: " ..stats.get_int("MPPLY_OFFENSIVE_TAGPLATE"))
	ImGui.Text("Offensive Content: " ..stats.get_int("MPPLY_OFFENSIVE_UGC"))
	ImGui.Text("Bad Crew Name: " ..stats.get_int("MPPLY_BAD_CREW_NAME"))
	ImGui.Text("Bad Crew Motto: " ..stats.get_int("MPPLY_BAD_CREW_MOTTO"))
	ImGui.Text("Bad Crew Status: " ..stats.get_int("MPPLY_BAD_CREW_STATUS"))
	ImGui.Text("Bad Crew Emblem: " ..stats.get_int("MPPLY_BAD_CREW_EMBLEM"))
	ImGui.Separator()
	ImGui.Text("Now onto your commends:")
	ImGui.Separator()
	ImGui.Text("Friendly: " ..stats.get_int("MPPLY_FRIENDLY"))
	ImGui.Text("Helpful: " ..stats.get_int("MPPLY_HELPFUL"))
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
end
)
ApartmentDataEditorMenu:add_button("Play the Heist Solo",
function()
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
ApartmentDataEditorMenu:add_button("Instant Finish",
function()
	locals.set_int(FMC, AIFl3, 12)
	locals.set_int(FMC, AIFl4, 99999)
	locals.set_int(FMC, AIFl5, 99999)
	locals.set_int(FMC, AIFl6, 99999)
end
)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Instant Finish (Pacific)", function()
    locals.set_int(FMC, 19787 + 1062, 5)
    locals.set_int(FMC, 19787 + 1740 + 1, 80)
    locals.set_int(FMC, 19787 + 2686, 10000000)
    locals.set_int(FMC, 28407 + 1, 99999)
    locals.set_int(FMC, 31663 + 1 + 68, 99999)
end
)
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
	locals.set_int(FMC, 19787, 12)
	locals.set_int(FMC, 19787 + 2686, 10000000)
	locals.set_int(FMC, 29011 + 1, 99999)
	locals.set_int(FMC, 31663 + 69, 99999)
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

Yimura = CreditsMenu:add_tab("Yimura")
Yimura:add_text("Yim Menu Cheat Developer")
Yimura:add_text("Cheat on GitHub:")
Yimura:add_text("https://github.com/YimMenu/YimMenuV2/tree/enhanced")

L7NEGDEV = CreditsMenu:add_tab("L7NEG")
L7NEGDEV:add_text("Coded This W Script With <3 To You All")
L7NEGDEV:add_text("Source:")
L7NEGDEV:add_text("https://github.com/Utimate-Menu/Utimate-Menu")

SILENTSALO = CreditsMenu:add_tab("Silent")
SILENTSALO:add_text("For His W Useful Unlocks Along With Casino And Gunvan Menu")
SILENTSALO:add_text("Source:")
SILENTSALO:add_text("https://github.com/SilentSal0/Silent-Night")

SLON = CreditsMenu:add_tab("SLON")
SLON:add_text("For ''YimCeo v0.6 by Slon_.lua'' Code")
SLON:add_text("Source:")
SLON:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")

Alestarov = CreditsMenu:add_tab("Alestarov")
Alestarov:add_text("For 1 Click Cayo Setup")
Alestarov:add_text("Source:")
Alestarov:add_text("https://github.com/YimMenu-Lua/Alestarov-Menu")

YOUMENU = CreditsMenu:add_tab("And You <3")
YOUMENU:add_text("Yes You Without You Or Your PRs and support You Give Me This Script Would Be Nothing Fr So Big Thanks To You All")
YOUMENU:add_text("You can report Bugs And Make PRs With Features Down Bellow:")
YOUMENU:add_text("https://github.com/Utimate-Menu/Utimate-Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
