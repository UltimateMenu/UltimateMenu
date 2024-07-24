--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function MPX()
	local PI = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PI == 0 then
		return "MP0_"
	else
		return "MP1_"
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

--Required Scripts--

FMC = "fm_mission_controller"
FMC2020 = "fm_mission_controller_2020"
HIP = "heist_island_planning"

--Globals & Locals & Variables--

FMg = 262145 -- free mode global ("CASH_MULTIPLIER") //correct
ACg1 = 1928958 + 1 + 1 -- global apartment player 1 cut global
ACg2 = 1928958 + 1 + 2 -- global apartment player 2 cut global
ACg3 = 1928958 + 1 + 3 -- global apartment player 3 cut global
ACg4 = 1928958 + 1 + 4 -- global apartment player 4 cut global
ACg5 = 1930201 + 3008 + 1 -- local apartment player 1 cut global

AUAJg1 = FMg + 9101 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9106 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9113 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9119 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9125 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 19746 -- apartment instant finish local 1
AIFl4 = 28365 + 1 -- apartment instant finish local 2
AIFl5 = 31621 + 69 -- apartment instant finish local 3

DCRBl = 185 -- diamond casino reload board local
DCCg1 = 1964849 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global
DCCg2 = 1964849 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
DCCg3 = 1964849 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
DCCg4 = 1964849 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
DCCl = FMg + 28313 -- Casino_Cut_Lester_offset
DCCh = FMg + 28349 - 1 --Casino_Cut_Hacker_offset
DCCd = FMg + 28344 - 1 --Casino_Cut_Driver_offset
DCCgun = FMg + 28339 - 1 --Casino_Cut_Gunman_offset
DCFHl = 53019 -- diamond casino fingerprint hack local
DCKHl = 54085 -- diamond casino keypad hack local
DCDVDl1 = 10109 + 7 -- diamond casino drill vault door local 1
DCDVDl2 = 10109 + 37 -- diamond casino drill vault door local 2

GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)
CPRSl = 1546 -- cayo perico reload screen local //correct
CPCg1 = 1971648 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1971648 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1971648 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1971648 + 831 + 56 + 4 -- cayo perico player 4 cut global
CPBg = FMg + 29211 -- cayo perico bag global (1859395035)
CPFHl = 24880 -- cayo perico fingerprint hack local
CPPCCl = 30939 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds")
CPSTCl = 29700 -- cayo perico drainage pipe cut local

DDSHl = 1271 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1960755 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1960755 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1960755 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1960755 + 812 + 50 + 4 -- doomsday player 4 cut global

SNOW = 262145 + 4413

--BV = Ballastic Value----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BV = 262145 + 20024

--CCBL = Casino Chips Buy Limit-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CCBL0 = 262145 + 26535
CCBL1 = 262145 + 26536

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1 = 262145 + 29211

--PSV=Panther Statue-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PSV = 262145 + 29463

--PDIAMOND=Pink Diamond---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PDIAMOND = 262145 + 29461

--BB=Bearer Bonds---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BB = 262145 + 29460

--RN=Ruby Necklace--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN = 262145 + 29459

--TEQUILA=Tequila---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TEQUILA = 262145 + 29458

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG = gui.get_tab("Ultimate Menu 1.69 By L7NEG")

L7NEG:add_text("                      Ultimate Menu 1.69 ")
L7NEG:add_text("                                v2.2")

LVLVal = stats.get_int(MPX() .. "CHAR_RANK_FM")

L7NEG:add_imgui(function()
	LVLVal = ImGui.SliderInt("Your level", LVLVal, LVLVal, LVLVal)
end)

RPVal = stats.get_int(MPX() .. "CHAR_XP_FM")

L7NEG:add_imgui(function()
	RPVal = ImGui.SliderInt("Your RP Value", RPVal, RPVal, RPVal)
end)

CCLVLVal = stats.get_int("MPPLY_CURRENT_CREW_RANK")

L7NEG:add_imgui(function()
	CCLVLVal = ImGui.SliderInt("Current Crew Level", CCLVLVal, CCLVLVal, CCLVLVal)
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
script.register_looped("Remove Transaction Error", function(script)
	script:yield()
	if RTPT:is_enabled() then
		globals.set_int(4537456, 0)
		globals.set_int(4537457, 0)
		globals.set_int(4537458, 0)
	else
	end
end)

Self:add_button("Remove Orbital Cannon Cooldown", function()
	stats.set_int(MPX() .. "ORBITAL_CANNON_COOLDOWN", 0)
end)

Self:add_button("Refil Nightclub Popularity", function()
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

TunMenu = L7NEG:add_tab("Tunables Menu")

rpmvalue = globals.get_float(262145 + 1)
TunMenu:add_imgui(function()
	rpmvalue, used = ImGui.DragInt("RP", rpmvalue, 1, 100000)
	if used then
		globals.set_float(262145 + 1, rpmvalue)
	end
end)

apmvalue = globals.get_float(262145 + 25490)
TunMenu:add_imgui(function()
	apmvalue, used = ImGui.DragInt("AP", apmvalue, 1, 100000)
	if used then
		globals.set_float(262145 + 25490, apmvalue)
	end
end)

srmvalue = globals.get_float(262145 + 30980)
TunMenu:add_imgui(function()
	srmvalue, used = ImGui.DragInt("Street Races", srmvalue, 1, 100000)
	if used then
		globals.set_float(262145 + 30980, srmvalue)
	end
end)

pmvalue = globals.get_float(262145 + 30981)
TunMenu:add_imgui(function()
	pmvalue, used = ImGui.DragInt("Pursuits", pmvalue, 1, 100000)
	if used then
		globals.set_float(262145 + 30981, pmvalue)
	end
end)

f2fmvalue = globals.get_float(262145 + 30982)
TunMenu:add_imgui(function()
	f2fmvalue, used = ImGui.DragInt("Face2Face", f2fmvalue, 1, 100000)
	if used then
		globals.set_float(262145 + 30982, f2fmvalue)
	end
end)

lscmmvalue = globals.get_float(262145 + 30983)
TunMenu:add_imgui(function()
	lscmmvalue, used = ImGui.DragInt("LS Car Meet", lscmmvalue, 1, 100000)
	if used then
		globals.set_float(262145 + 30983, lscmmvalue)
	end
end)

lscmotmvalue = globals.get_float(262145 + 30984)
TunMenu:add_imgui(function()
	lscmotmvalue, used = ImGui.DragInt("LS Car Meet on track", lscmotmvalue, 1, 100000)
	if used then
		globals.set_float(262145 + 30984, lscmotmvalue)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

OnlineServicesMenu = L7NEG:add_tab("Online Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoServicesMenu = OnlineServicesMenu:add_tab("Casino Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

slots_random_results_table = 1348

prize_wheel_win_state = 280
prize_wheel_prize = 14
prize_wheel_prize_state = 45

globals_tuneable = 262145

fm_mission_controller_cart_grab = 10255
fm_mission_controller_cart_grab_speed = 14
fm_mission_controller_cart_autograb = false

CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Casino Chips")
chipsVal = 1800
CasinoServicesMenu:add_imgui(function()
	chipsVal, used = ImGui.SliderInt("Casino Chips Buy Limit", chipsVal, 1800, 2147483647)
	if used then
		globals.set_int(CCBL0, chipsVal)
		globals.set_int(CCBL1, chipsVal)
	end
end)

bypass_casino_bans = CasinoServicesMenu:add_checkbox("Bypass Casino Cooldown")
CasinoServicesMenu:add_text("Winning too much too quickly might get you banned, enable this at your own risk.")
CasinoServicesMenu:add_separator()

CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Slots")
rig_slot_machine = CasinoServicesMenu:add_checkbox("Rig Slot Machines")

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

if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_slots")) ~= 0 then
	local needs_run = false
	if rig_slot_machine:is_enabled() then
		for slots_iter = 3, 196, 1 do
			if slots_iter ~= 67 and slots_iter ~= 132 then
				if locals.get_int("casino_slots", slots_random_results_table + slots_iter) ~= 6 then
					needs_run = true
				end
			end
		end
	else
		local sum = 0
		for slots_iter = 3, 196, 1 do
			if slots_iter ~= 67 and slots_iter ~= 132 then
				sum = sum + locals.get_int("casino_slots", slots_random_results_table + slots_iter)
			end
		end
		needs_run = sum == 1152
	end
	if needs_run then
		for slots_iter = 3, 196, 1 do
			if slots_iter ~= 67 and slots_iter ~= 132 then
				local slot_result = 6
				if rig_slot_machine:is_enabled() == false then
					math.randomseed(os.time() + slots_iter)
					slot_result = math.random(0, 7)
				end
				locals.set_int("casino_slots", slots_random_results_table + slots_iter, slot_result)
			end
		end
	end
end
if bypass_casino_bans:is_enabled() then
	stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
end
if gui.is_open() and CasinoServicesMenu:is_selected() then
	casino_heist_approach = stats.get_int(MPX() .. "H3OPT_APPROACH")
	casino_heist_target = stats.get_int(MPX() .. "H3OPT_TARGET")
	casino_heist_last_approach = stats.get_int(MPX() .. "H3_LAST_APPROACH")
	casino_heist_hard = stats.get_int(MPX() .. "H3_HARD_APPROACH")
	casino_heist_gunman = stats.get_int(MPX() .. "H3OPT_CREWWEAP")
	casino_heist_driver = stats.get_int(MPX() .. "H3OPT_CREWDRIVER")
	casino_heist_hacker = stats.get_int(MPX() .. "H3OPT_CREWHACKER")
	casino_heist_weapons = stats.get_int(MPX() .. "H3OPT_WEAPS")
	casino_heist_cars = stats.get_int(MPX() .. "H3OPT_VEHS")
	casino_heist_masks = stats.get_int(MPX() .. "H3OPT_MASKS")
end
if HUD.IS_PAUSE_MENU_ACTIVE() then
	PAD.DISABLE_CONTROL_ACTION(0, 348, true)
	PAD.DISABLE_CONTROL_ACTION(0, 204, true)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DLCUnlockerMenu = L7NEG:add_tab("1.69 Unlocker Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DLCUnlockerMenu:add_button("Unlock Police Cars Trade Price", function()
	stats.set_int(MPX() .. "MOST_TIME_ON_3_PLUS_STARS", 300000)
	stats.set_int(MPX() .. "SALV23_SCOPE_BS", -1)
	stats.set_int(MPX() .. "SALV23_INST_PROG", -1)
	stats.set_int(MPX() .. "SALV23_GEN_BS", -1)
end)

DLCUnlockerMenu:add_button("Unlock Xmass 2023 Gifts", function()
	globals.set_int(262145 + 35157, 1) --XMASGIFTS2023
	globals.set_int(262145 + 35158, 1) --NEWYEARSGIFTS2023
end)

DLCUnlockerMenu:add_button("Unlock Taxi Livery for Eudora", function()
	stats.set_masked_int(MPX() .. "DLC22022PSTAT_INT536", 10, 16, 8)
end)

DLCUnlockerMenu:add_button("Unlock Taxi Livery for Broadway", function()
	stats.set_int(MPX() .. "AWD_TAXIDRIVER", 50)
end)

DLCUnlockerMenu:add_separator()
DLCUnlockerMenu:add_text("Removed Vehicles")

DVT = DLCUnlockerMenu:add_checkbox("Enable Deleted Vehicles")
script.register_looped("Deleted Vehicles", function(script)
	script:yield()
	if DVT:is_enabled() then
		globals.set_int(262145 + 22565, 1)
		globals.set_int(262145 + 14708, 1)
		globals.set_int(262145 + 34371, 1)
		globals.set_int(262145 + 34373, 1)
		globals.set_int(262145 + 34451, 1)
		globals.set_int(262145 + 34349, 1)
		globals.set_int(262145 + 34527, 1)
		globals.set_int(262145 + 34533, 1)
		globals.set_int(262145 + 17356, 1)
		globals.set_int(262145 + 17372, 1)
		globals.set_int(262145 + 34589, 1)
		globals.set_int(262145 + 35492, 1)
		globals.set_int(262145 + 34415, 1)
		globals.set_int(262145 + 34417, 1)
		globals.set_int(262145 + 34465, 1)
		globals.set_int(262145 + 34573, 1)
		globals.set_int(262145 + 34499, 1)
		globals.set_int(262145 + 34495, 1)
		globals.set_int(262145 + 34493, 1)
		globals.set_int(262145 + 34511, 1)
		globals.set_int(262145 + 28191, 1)
		globals.set_int(262145 + 34501, 1)
		globals.set_int(262145 + 34333, 1)
		globals.set_int(262145 + 34551, 1)
		globals.set_int(262145 + 34553, 1)
		globals.set_int(262145 + 34409, 1)
		globals.set_int(262145 + 34365, 1)
		globals.set_int(262145 + 34569, 1)
		globals.set_int(262145 + 34571, 1)
		globals.set_int(262145 + 23726, 1)
		globals.set_int(262145 + 34401, 1)
		globals.set_int(262145 + 17230, 1)
		globals.set_int(262145 + 25367, 1)
		globals.set_int(262145 + 34335, 1)
		globals.set_int(262145 + 34337, 1)
		globals.set_int(262145 + 34339, 1)
		globals.set_int(262145 + 34341, 1)
		globals.set_int(262145 + 34325, 1)
		globals.set_int(262145 + 18947, 1)
		globals.set_int(262145 + 18948, 1)
		globals.set_int(262145 + 22564, 1)
		globals.set_int(262145 + 17229, 1)
		globals.set_int(262145 + 34367, 1)
		globals.set_int(262145 + 34331, 1)
		globals.set_int(262145 + 21603, 1)
		globals.set_int(262145 + 17364, 1)
		globals.set_int(262145 + 25369, 1)
		globals.set_int(262145 + 34431, 1)
		globals.set_int(262145 + 34453, 1)
		globals.set_int(262145 + 34497, 1)
		globals.set_int(262145 + 25387, 1)
		globals.set_int(262145 + 34455, 1)
		globals.set_int(262145 + 34403, 1)
		globals.set_int(262145 + 17355, 1)
		globals.set_int(262145 + 34399, 1)
		globals.set_int(262145 + 34323, 1)
		globals.set_int(262145 + 34437, 1)
		globals.set_int(262145 + 23717, 1)
		globals.set_int(262145 + 17358, 1)
		globals.set_int(262145 + 17370, 1)
		globals.set_int(262145 + 34467, 1)
		globals.set_int(262145 + 34433, 1)
		globals.set_int(262145 + 34435, 1)
		globals.set_int(262145 + 34351, 1)
		globals.set_int(262145 + 34411, 1)
		globals.set_int(262145 + 34587, 1)
		globals.set_int(262145 + 34565, 1)
		globals.set_int(262145 + 34523, 1)
		globals.set_int(262145 + 34369, 1)
		globals.set_int(262145 + 34563, 1)
		globals.set_int(262145 + 34559, 1)
		globals.set_int(262145 + 34481, 1)
		globals.set_int(262145 + 19951, 1)
		globals.set_int(262145 + 34581, 1)
		globals.set_int(262145 + 34577, 1)
		globals.set_int(262145 + 22556, 1)
		globals.set_int(262145 + 34585, 1)
		globals.set_int(262145 + 34473, 1)
		globals.set_int(262145 + 25386, 1)
		globals.set_int(262145 + 22563, 1)
		globals.set_int(262145 + 34457, 1)
		globals.set_int(262145 + 34513, 1)
		globals.set_int(262145 + 22557, 1)
		globals.set_int(262145 + 28201, 1)
		globals.set_int(262145 + 34405, 1)
		globals.set_int(262145 + 34541, 1)
		globals.set_int(262145 + 34459, 1)
		globals.set_int(262145 + 34535, 1)
		globals.set_int(262145 + 34429, 1)
		globals.set_int(262145 + 25383, 1)
		globals.set_int(262145 + 34439, 1)
		globals.set_int(262145 + 34387, 1)
		globals.set_int(262145 + 34361, 1)
		globals.set_int(262145 + 34557, 1)
		globals.set_int(262145 + 34503, 1)
		globals.set_int(262145 + 34583, 1)
		globals.set_int(262145 + 28830, 1)
		globals.set_int(262145 + 28190, 1)
		globals.set_int(262145 + 25379, 1)
		globals.set_int(262145 + 17232, 1)
		globals.set_int(262145 + 34353, 1)
		globals.set_int(262145 + 34555, 1)
		globals.set_int(262145 + 34597, 1)
		globals.set_int(262145 + 23729, 1)
		globals.set_int(262145 + 14703, 1)
		globals.set_int(262145 + 25385, 1)
		globals.set_int(262145 + 34471, 1)
		globals.set_int(262145 + 25396, 1)
		globals.set_int(262145 + 34443, 1)
		globals.set_int(262145 + 34441, 1)
		globals.set_int(262145 + 25397, 1)
		globals.set_int(262145 + 34591, 1)
		globals.set_int(262145 + 34475, 1)
		globals.set_int(262145 + 34561, 1)
		globals.set_int(262145 + 25389, 1)
		globals.set_int(262145 + 34485, 1)
		globals.set_int(262145 + 34567, 1)
		globals.set_int(262145 + 34427, 1)
		globals.set_int(262145 + 34529, 1)
		globals.set_int(262145 + 34595, 1)
		globals.set_int(262145 + 22560, 1)
		globals.set_int(262145 + 34505, 1)
		globals.set_int(262145 + 34355, 1)
		globals.set_int(262145 + 34357, 1)
		globals.set_int(262145 + 21607, 1)
		globals.set_int(262145 + 17363, 1)
		globals.set_int(262145 + 17373, 1)
		globals.set_int(262145 + 34483, 1)
		globals.set_int(262145 + 17223, 1)
		globals.set_int(262145 + 34507, 1)
		globals.set_int(262145 + 34531, 1)
		globals.set_int(262145 + 21606, 1)
		globals.set_int(262145 + 22558, 1)
		globals.set_int(262145 + 22562, 1)
		globals.set_int(262145 + 34593, 1)
		globals.set_int(262145 + 34521, 1)
		globals.set_int(262145 + 34377, 1)
		globals.set_int(262145 + 34393, 1)
		globals.set_int(262145 + 34469, 1)
		globals.set_int(262145 + 34489, 1)
		globals.set_int(262145 + 19953, 1)
		globals.set_int(262145 + 34509, 1)
		globals.set_int(262145 + 25393, 1)
		globals.set_int(262145 + 34463, 1)
		globals.set_int(262145 + 34461, 1)
		globals.set_int(262145 + 17366, 1)
		globals.set_int(262145 + 34515, 1)
		globals.set_int(262145 + 22561, 1)
		globals.set_int(262145 + 22554, 1)
		globals.set_int(262145 + 34519, 1)
		globals.set_int(262145 + 34345, 1)
		globals.set_int(262145 + 34347, 1)
		globals.set_int(262145 + 34547, 1)
		globals.set_int(262145 + 34579, 1)
		globals.set_int(262145 + 28831, 1)
		globals.set_int(262145 + 34445, 1)
		globals.set_int(262145 + 34575, 1)
		globals.set_int(262145 + 34359, 1)
		globals.set_int(262145 + 34479, 1)
		globals.set_int(262145 + 23781, 1)
		globals.set_int(262145 + 34539, 1)
		globals.set_int(262145 + 34383, 1)
		globals.set_int(262145 + 34381, 1)
		globals.set_int(262145 + 34379, 1)
		globals.set_int(262145 + 34545, 1)
		globals.set_int(262145 + 22551, 1)
		globals.set_int(262145 + 34343, 1)
		globals.set_int(262145 + 34549, 1)
		globals.set_int(262145 + 34525, 1)
		globals.set_int(262145 + 23780, 1)
		globals.set_int(262145 + 34537, 1)
		globals.set_int(262145 + 34327, 1)
		globals.set_int(262145 + 29156, 1)
		globals.set_int(262145 + 20830, 1)
		globals.set_int(262145 + 17371, 1)
		globals.set_int(262145 + 25370, 1)
		globals.set_int(262145 + 17221, 1)
		globals.set_int(262145 + 34407, 1)
		globals.set_int(262145 + 34477, 1)
		globals.set_int(262145 + 26330, 1)
		globals.set_int(262145 + 34375, 1)
		globals.set_int(262145 + 29605, 1)
		globals.set_int(262145 + 34487, 1)
		globals.set_int(262145 + 22566, 1)
		globals.set_int(262145 + 34397, 1)
		globals.set_int(262145 + 34543, 1)
		globals.set_int(262145 + 34517, 1)
		globals.set_int(262145 + 17369, 1)
		globals.set_int(262145 + 20828, 1)
		globals.set_int(262145 + 34423, 1)
		globals.set_int(262145 + 34425, 1)
		globals.set_int(262145 + 34395, 1)
		globals.set_int(262145 + 34447, 1)
		globals.set_int(262145 + 34449, 1)
		globals.set_int(262145 + 25384, 1)
		globals.set_int(262145 + 17354, 1)
		globals.set_int(262145 + 25381, 1)
		globals.set_int(262145 + 34599, 1)
	else
		globals.set_int(262145 + 22565, 0)
		globals.set_int(262145 + 14708, 0)
		globals.set_int(262145 + 34371, 0)
		globals.set_int(262145 + 34373, 0)
		globals.set_int(262145 + 34451, 0)
		globals.set_int(262145 + 34349, 0)
		globals.set_int(262145 + 34527, 0)
		globals.set_int(262145 + 34533, 0)
		globals.set_int(262145 + 17356, 0)
		globals.set_int(262145 + 17372, 0)
		globals.set_int(262145 + 34589, 0)
		globals.set_int(262145 + 35492, 0)
		globals.set_int(262145 + 34415, 0)
		globals.set_int(262145 + 34417, 0)
		globals.set_int(262145 + 34465, 0)
		globals.set_int(262145 + 34573, 0)
		globals.set_int(262145 + 34499, 0)
		globals.set_int(262145 + 34495, 0)
		globals.set_int(262145 + 34493, 0)
		globals.set_int(262145 + 34511, 0)
		globals.set_int(262145 + 28191, 0)
		globals.set_int(262145 + 34501, 0)
		globals.set_int(262145 + 34333, 0)
		globals.set_int(262145 + 34551, 0)
		globals.set_int(262145 + 34553, 0)
		globals.set_int(262145 + 34409, 0)
		globals.set_int(262145 + 34365, 0)
		globals.set_int(262145 + 34569, 0)
		globals.set_int(262145 + 34571, 0)
		globals.set_int(262145 + 23726, 0)
		globals.set_int(262145 + 34401, 0)
		globals.set_int(262145 + 17230, 0)
		globals.set_int(262145 + 25367, 0)
		globals.set_int(262145 + 34335, 0)
		globals.set_int(262145 + 34337, 0)
		globals.set_int(262145 + 34339, 0)
		globals.set_int(262145 + 34341, 0)
		globals.set_int(262145 + 34325, 0)
		globals.set_int(262145 + 18947, 0)
		globals.set_int(262145 + 18948, 0)
		globals.set_int(262145 + 22564, 0)
		globals.set_int(262145 + 17229, 0)
		globals.set_int(262145 + 34367, 0)
		globals.set_int(262145 + 34331, 0)
		globals.set_int(262145 + 21603, 0)
		globals.set_int(262145 + 17364, 0)
		globals.set_int(262145 + 25369, 0)
		globals.set_int(262145 + 34431, 0)
		globals.set_int(262145 + 34453, 0)
		globals.set_int(262145 + 34497, 0)
		globals.set_int(262145 + 25387, 0)
		globals.set_int(262145 + 34455, 0)
		globals.set_int(262145 + 34403, 0)
		globals.set_int(262145 + 17355, 0)
		globals.set_int(262145 + 34399, 0)
		globals.set_int(262145 + 34323, 0)
		globals.set_int(262145 + 34437, 0)
		globals.set_int(262145 + 23717, 0)
		globals.set_int(262145 + 17358, 0)
		globals.set_int(262145 + 17370, 0)
		globals.set_int(262145 + 34467, 0)
		globals.set_int(262145 + 34433, 0)
		globals.set_int(262145 + 34435, 0)
		globals.set_int(262145 + 34351, 0)
		globals.set_int(262145 + 34411, 0)
		globals.set_int(262145 + 34587, 0)
		globals.set_int(262145 + 34565, 0)
		globals.set_int(262145 + 34523, 0)
		globals.set_int(262145 + 34369, 0)
		globals.set_int(262145 + 34563, 0)
		globals.set_int(262145 + 34559, 0)
		globals.set_int(262145 + 34481, 0)
		globals.set_int(262145 + 19951, 0)
		globals.set_int(262145 + 34581, 0)
		globals.set_int(262145 + 34577, 0)
		globals.set_int(262145 + 22556, 0)
		globals.set_int(262145 + 34585, 0)
		globals.set_int(262145 + 34473, 0)
		globals.set_int(262145 + 25386, 0)
		globals.set_int(262145 + 22563, 0)
		globals.set_int(262145 + 34457, 0)
		globals.set_int(262145 + 34513, 0)
		globals.set_int(262145 + 22557, 0)
		globals.set_int(262145 + 28201, 0)
		globals.set_int(262145 + 34405, 0)
		globals.set_int(262145 + 34541, 0)
		globals.set_int(262145 + 34459, 0)
		globals.set_int(262145 + 34535, 0)
		globals.set_int(262145 + 34429, 0)
		globals.set_int(262145 + 25383, 0)
		globals.set_int(262145 + 34439, 0)
		globals.set_int(262145 + 34387, 0)
		globals.set_int(262145 + 34361, 0)
		globals.set_int(262145 + 34557, 0)
		globals.set_int(262145 + 34503, 0)
		globals.set_int(262145 + 34583, 0)
		globals.set_int(262145 + 28830, 0)
		globals.set_int(262145 + 28190, 0)
		globals.set_int(262145 + 25379, 0)
		globals.set_int(262145 + 17232, 0)
		globals.set_int(262145 + 34353, 0)
		globals.set_int(262145 + 34555, 0)
		globals.set_int(262145 + 34597, 0)
		globals.set_int(262145 + 23729, 0)
		globals.set_int(262145 + 14703, 0)
		globals.set_int(262145 + 25385, 0)
		globals.set_int(262145 + 34471, 0)
		globals.set_int(262145 + 25396, 0)
		globals.set_int(262145 + 34443, 0)
		globals.set_int(262145 + 34441, 0)
		globals.set_int(262145 + 25397, 0)
		globals.set_int(262145 + 34591, 0)
		globals.set_int(262145 + 34475, 0)
		globals.set_int(262145 + 34561, 0)
		globals.set_int(262145 + 25389, 0)
		globals.set_int(262145 + 34485, 0)
		globals.set_int(262145 + 34567, 0)
		globals.set_int(262145 + 34427, 0)
		globals.set_int(262145 + 34529, 0)
		globals.set_int(262145 + 34595, 0)
		globals.set_int(262145 + 22560, 0)
		globals.set_int(262145 + 34505, 0)
		globals.set_int(262145 + 34355, 0)
		globals.set_int(262145 + 34357, 0)
		globals.set_int(262145 + 21607, 0)
		globals.set_int(262145 + 17363, 0)
		globals.set_int(262145 + 17373, 0)
		globals.set_int(262145 + 34483, 0)
		globals.set_int(262145 + 17223, 0)
		globals.set_int(262145 + 34507, 0)
		globals.set_int(262145 + 34531, 0)
		globals.set_int(262145 + 21606, 0)
		globals.set_int(262145 + 22558, 0)
		globals.set_int(262145 + 22562, 0)
		globals.set_int(262145 + 34593, 0)
		globals.set_int(262145 + 34521, 0)
		globals.set_int(262145 + 34377, 0)
		globals.set_int(262145 + 34393, 0)
		globals.set_int(262145 + 34469, 0)
		globals.set_int(262145 + 34489, 0)
		globals.set_int(262145 + 19953, 0)
		globals.set_int(262145 + 34509, 0)
		globals.set_int(262145 + 25393, 0)
		globals.set_int(262145 + 34463, 0)
		globals.set_int(262145 + 34461, 0)
		globals.set_int(262145 + 17366, 0)
		globals.set_int(262145 + 34515, 0)
		globals.set_int(262145 + 22561, 0)
		globals.set_int(262145 + 22554, 0)
		globals.set_int(262145 + 34519, 0)
		globals.set_int(262145 + 34345, 0)
		globals.set_int(262145 + 34347, 0)
		globals.set_int(262145 + 34547, 0)
		globals.set_int(262145 + 34579, 0)
		globals.set_int(262145 + 28831, 0)
		globals.set_int(262145 + 34445, 0)
		globals.set_int(262145 + 34575, 0)
		globals.set_int(262145 + 34359, 0)
		globals.set_int(262145 + 34479, 0)
		globals.set_int(262145 + 23781, 0)
		globals.set_int(262145 + 34539, 0)
		globals.set_int(262145 + 34383, 0)
		globals.set_int(262145 + 34381, 0)
		globals.set_int(262145 + 34379, 0)
		globals.set_int(262145 + 34545, 0)
		globals.set_int(262145 + 22551, 0)
		globals.set_int(262145 + 34343, 0)
		globals.set_int(262145 + 34549, 0)
		globals.set_int(262145 + 34525, 0)
		globals.set_int(262145 + 23780, 0)
		globals.set_int(262145 + 34537, 0)
		globals.set_int(262145 + 34327, 0)
		globals.set_int(262145 + 29156, 0)
		globals.set_int(262145 + 20830, 0)
		globals.set_int(262145 + 17371, 0)
		globals.set_int(262145 + 25370, 0)
		globals.set_int(262145 + 17221, 0)
		globals.set_int(262145 + 34407, 0)
		globals.set_int(262145 + 34477, 0)
		globals.set_int(262145 + 26330, 0)
		globals.set_int(262145 + 34375, 0)
		globals.set_int(262145 + 29605, 0)
		globals.set_int(262145 + 34487, 0)
		globals.set_int(262145 + 22566, 0)
		globals.set_int(262145 + 34397, 0)
		globals.set_int(262145 + 34543, 0)
		globals.set_int(262145 + 34517, 0)
		globals.set_int(262145 + 17369, 0)
		globals.set_int(262145 + 20828, 0)
		globals.set_int(262145 + 34423, 0)
		globals.set_int(262145 + 34425, 0)
		globals.set_int(262145 + 34395, 0)
		globals.set_int(262145 + 34447, 0)
		globals.set_int(262145 + 34449, 0)
		globals.set_int(262145 + 25384, 0)
		globals.set_int(262145 + 17354, 0)
		globals.set_int(262145 + 25381, 0)
		globals.set_int(262145 + 34599, 0)
	end
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

---Full Account Unlocker Tool---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FAUT = L7NEG:add_tab("Full Account Unlock Menu")

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
AG = 4543384 + 1


AcMenu:add_button("Unlock All Achievements", function()
	script.run_in_fiber(function(script)
		for i = 0, 77 do
			script:sleep(200)
			globals.set_int(AG, i)
		if i == 77 then
			gui.show_message("Achivements", "Unlocked 77 Achivements")
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

-- Look for what reads DISABLE_DAILY_OBJECTIVES and then there should be a while loop that stops at 3.
local current_objectives_global = 2359296
local weekly_words_global = 2737992
local objectives_state_global = 1574744

FAUT:add_button("Complete All Daily & Weekly Challenges", function()
	script.run_in_fiber(function(script)
		for i = 0, 2 do --Unlock all daily rewards.
			local objective = globals.get_int(current_objectives_global + (1 + (0 * 5570)) + 681 + 4244 + (1 + (i * 3)))
			globals.set_int(objectives_state_global + 1 + (1 + (i * 1)), objective)
		end
		globals.set_int(objectives_state_global, 1)
		globals.set_int(
			weekly_words_global + (1 + (0 * 6)) + 1,
			globals.get_int(weekly_words_global + (1 + (0 * 6)) + 2)
		) --Unlock Weekly Objective
	end)
end)

FAUT:add_separator()

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function unlock_packed_bools(from, to)
	for i = from, to do
		stats.set_packed_stat_bool(i, true)
	end
end

local function Text(text)
	FAUT:add_text(text, function() end)
end
Text("==========================")
Text("One Click Unlocker Section")
Text("==========================")
Text("Rewards,Unlocks,Progess And")
Text("Achievements")
Text("Make Sure You have 50 mil In Every")
Text("Business")
Text("In The Game Before Applying In Do a")
Text("Sale Of ")
Text("Each Business And Do a Round In")
Text("Shooting Range After You Activate It")
Text("Join a New Session To Apply ")
Text("==========================")
FAUT:add_button("Unlock All", function()
	unlock_packed_bools(110, 113) --Red Check Pajamas, Green Check Pajamas, Black Check Pajamas, I Heart LC T-shirt
	unlock_packed_bools(115, 115) --Roosevelt
	unlock_packed_bools(124, 124) --Sanctus
	unlock_packed_bools(129, 129) --Albany Hermes
	unlock_packed_bools(135, 137) --Vapid Clique, Buzzard Attack Chopper, Insurgent Pick-Up
	unlock_packed_bools(3593, 3599) --'Statue Of Happiness' T-shirt, 'Pisswasser' Beer Hat, 'Benedict' Beer Hat, 'J Lager' Beer Hat, 'Patriot' Beer Hat, 'Blarneys' Beer Hat, 'Supa Wet' Beer Hat
	unlock_packed_bools(3604, 3605) --Liberator, Sovereign
	unlock_packed_bools(3608, 3609) --'Elitas' T-shirt, High Flyer Parachute Bag
	unlock_packed_bools(3616, 3616) --Please Stop Me Mask
	unlock_packed_bools(3750, 3750) --Stocking
	unlock_packed_bools(3765, 3769) --The Fleeca Job, The Prison Break, The Humane Labs Raid, Series A Funding, The Pacific Standard Job (Elite Challenges)
	unlock_packed_bools(3770, 3781) --'Death Defying' T-shirt, 'For Hire' T-shirt, 'Gimme That' T-shirt, 'Asshole' T-shirt, 'Can't Touch This' T-shirt, 'Decorated' T-shirt, 'Psycho Killer' T-shirt, 'One Man Army' T-shirt, 'Shot Caller' T-shirt, 'Showroom' T-shirt, 'Elite Challenge' T-Shirt, 'Elite Lousy' T-Shirt
	unlock_packed_bools(3783, 3802) --Fake Dix White T-Shirt, Fake Dix Gold T-Shirt, Fake Didier Sachs T-Shirt, Fake Enema T-Shirt, Fake Le Chien No2 T-Shirt, Fake Le Chien Crew T-Shirt, Fake Santo Capra T-Shirt, Fake Vapid T-Shirt, Fake Perseus T-Shirt, Fake Sessanta Nove T-Shirt, 'Vinewood Zombie' T-shirt, 'Meltdown' T-shirt, 'I Married My Dad' T-shirt, 'Die Already 4' T-shirt, 'The Shoulder Of Orion II' T-shirt, 'Nelson In Naples' T-shirt, 'The Many Wives of Alfredo Smith' T-shirt, 'An American Divorce' T-shirt, 'The Loneliest Robot' T-shirt, 'Capolavoro' T-shirt
	unlock_packed_bools(4247, 4269) --'Magnetics Script' Hat, 'Magnetics Block' Hat, 'Low Santos' Hat, 'Boars' Hat, 'Benny's' Hat, 'Westside' Hat, 'Eastside' Hat, 'Strawberry' Hat, 'S.A.' Hat, 'Davis' Hat, 'Vinewood Zombie' T-shirt, 'Knife After Dark' T-shirt, 'The Simian' T-shirt, 'Zombie Liberals In The Midwest' T-shirt, 'Twilight Knife' T-shirt, 'Butchery and Other Hobbies' T-shirt, 'Cheerleader Massacre 3' T-shirt, 'Cannibal Clown' T-shirt, 'Hot Serial Killer Stepmom' T-shirt, 'Splatter And Shot' T-shirt, 'Meathook For Mommy' T-shirt, 'Psycho Swingers' T-shirt, 'Vampires On The Beach' T-shirt
	unlock_packed_bools(4300, 4327) --Brown Corpse Bride Bobblehead, White Corpse Bride Bobblehead, Pink Corpse Bride Bobblehead, White Mask Slasher Bobblehead, Red Mask Slasher Bobblehead, Yellow Mask Slasher Bobblehead, Blue Zombie Bobblehead, Green Zombie Bobblehead, Pale Zombie Bobblehead, Possessed Urchin Bobblehead, Demonic Urchin Bobblehead, Gruesome Urchin Bobblehead, Tuxedo Frank Bobblehead, Purple Suit Frank Bobblehead, Stripped Suit Frank Bobblehead, Black Mummy Bobblehead, White Mummy Bobblehead, Brown Mummy Bobblehead, Pale Werewolf Bobblehead, Dark Werewolf Bobblehead, Gray Werewolf Bobblehead, Fleshy Vampire Bobblehead, Bloody Vampire Bobblehead, B&W Vampire Bobblehead, Halloween Loop 1, Halloween Loop 2, Franken Stange, Lurcher
	unlock_packed_bools(4333, 4335) --Naughty Cap, Nice Cap, Abominable Snowman
	unlock_packed_bools(7467, 7495) --'Accountant' T-shirt, 'Bahama Mamas' T-shirt, 'Drone' T-shirt, 'Grotti' T-shirt, 'Golf' T-shirt, 'Maisonette' T-shirt, 'Manopause' T-shirt, 'Marlowe' T-shirt, 'Meltdown' T-shirt, 'Pacific Bluffs' T-shirt, 'Prolaps' T-shirt, 'Tennis' T-shirt, 'Toe Shoes' T-shirt, 'Crest' T-shirt, 'Vanilla Unicorn' T-shirt, Pastel Blue Pajamas, Pastel Yellow Pajamas, Pastel Pink Pajamas, Pastel Green Pajamas, Vibrant Check Pajamas, Blue Check Pajamas, Red Swirl Motif Pajamas, White Graphic Pajamas, Blue Swirl Pajamas, Yellow Swirl Pajamas, Red Swirl Pajamas, Navy Pinstripe Pajamas, Bold Pinstripe Pajamas, Orange Pinstripe Pajamas
	unlock_packed_bools(7515, 7528) --Pastel Blue Smoking Jacket, Pastel Yellow Smoking Jacket, Pastel Pink Smoking Jacket, Pastel Green Smoking Jacket, Vibrant Check Smoking Jacket, Blue Check Smoking Jacket, Red Swirl Motif Smoking Jacket, White Graphic Smoking Jacket, Blue Swirl Smoking Jacket, Yellow Swirl Smoking Jacket, Red Swirl Smoking Jacket, Navy Pinstripe Smoking Jacket, Bold Pinstripe Smoking Jacket, Orange Pinstripe Smoking Jacket
	unlock_packed_bools(7551, 7551) --DCTL T-Shirt
	unlock_packed_bools(7595, 7601) --White Jock Cranley Suit, Red Jock Cranley Suit, Blue Jock Cranley Suit, Black Jock Cranley Suit, Pink Jock Cranley Suit, Gold Jock Cranley Suit, Silver Jock Cranley Suit
	unlock_packed_bools(9362, 9385) --Western Brand White T-Shirt, Western Brand Black T-Shirt, Western Logo White T-Shirt, Western Logo Black T-Shirt, Steel Horse Solid Logo T-Shirt, Steel Horse Logo T-Shirt, Steel Horse Brand White T-Shirt, Steel Horse Brand Black T-Shirt, Nagasaki White T-Shirt, Nagasaki White and Red T-Shirt, Nagasaki Black T-Shirt, Purple Helmets Black T-Shirt, Principe Black T-Shirt, Black Steel Horse Hoodie, Steel Horse Brand White T-Shirt, Western Black Hoodie, Western Logo White T-Shirt, Nagasaki White Hoodie, Nagasaki White and Red Hoodie, Nagasaki Black Hoodie, Purple Helmets Black Hoodie, Principe Logo, Crosswalk T-Shirt, R* Crosswalk T-Shirt
	unlock_packed_bools(9426, 9440) --Base5 T-Shirt, Bitch'n' Dog Food T-Shirt, BOBO T-Shirt, Bounce FM T-Shirt, Crocs Bar T-Shirt, Emotion 98.3 T-Shirt, Fever 105 T-Shirt, Flash T-Shirt, Homies Sharp T-Shirt, K-DST T-Shirt, KJAH Radio T-Shirt, K-ROSE T-Shirt, Victory Fist T-Shirt, Vinyl Countdown T-Shirt, Vivisection T-Shirt
	unlock_packed_bools(9443, 9443) --Unicorn
	unlock_packed_bools(9461, 9481) --Ballistic Equipment, LS UR T-Shirt, Non-Stop-Pop FM T-Shirt, Radio Los Santos T-Shirt, Los Santos Rock Radio T-Shirt, Blonded Los Santos 97.8 FM T-Shirt, West Coast Talk Radio T-Shirt, Radio Mirror Park T-Shirt, Rebel Radio T-Shirt, Channel X T-Shirt, Vinewood Boulevard Radio T-Shirt, FlyLo FM T-Shirt, Space 103.2 T-Shirt, West Coast Classics T-Shirt, East Los FM T-Shirt, The Lab T-Shirt, The Lowdown 91.1 T-Shirt, WorldWide FM T-Shirt, Soulwax FM T-Shirt, Blue Ark T-Shirt, Blaine County Radio T-Shirt
	unlock_packed_bools(15381, 15382) --APC SAM Battery, Ballistic Equipment
	unlock_packed_bools(15388, 15423) --Black Ammu-Nation Cap, Black Ammu-Nation Hoodie, Black Ammu-Nation T-Shirt, Black Coil Cap, Black Coil T-Shirt, Black Hawk & Little Hoodie, Black Hawk & Little Logo T-Shirt, Black Hawk & Little T-Shirt, Black Shrewsbury Hoodie, Black Vom Feuer Cap, Black Warstock Hoodie, Green Vom Feuer T-Shirt, Red Hawk & Little Cap, Warstock Cap, White Ammu-Nation T-Shirt, White Coil Hoodie, White Coil T-Shirt, White Hawk & Little Hoodie, White Hawk & Little T-Shirt, White Shrewsbury T-Shirt, White Shrewsbury Cap, White Shrewsbury Hoodie, White Shrewsbury Logo T-Shirt, White Vom Feuer Cap, White Vom Feuer Hoodie, Wine Coil Cap, Yellow Vom Feuer Logo T-Shirt, Yellow Vom Feuer T-Shirt, Yellow Warstock T-Shirt, Blue R* Class of '98, Red R* Class of '98, Noise Rockstar Logo T-Shirt, Noise T-Shirt, Razor T-Shirt, Black Rockstar Camo, White Rockstar Camo
	unlock_packed_bools(15425, 15439) --Knuckleduster Pocket T-Shirt, Rockstar Logo Blacked Out T-Shirt, Rockstar Logo White Out T-Shirt, Half-track 20mm Quad Autocannon, Weaponized Tampa Dual Remote Minigun, Weaponized Tampa Rear-Firing Mortar, Weaponized Tampa Front Missile Launchers, Dune FAV 40mm Grenade Launcher, Dune FAV 7.62mm Minigun, Insurgent Pick-Up Custom .50 Cal Minigun, Insurgent Pick-Up Custom Heavy Armor Plating, Technical Custom 7.62mm Minigun, Technical Custom Ram-bar, Technical Custom Brute-bar, Technical Custom Heavy Chassis Armor
	unlock_packed_bools(15447, 15474) --Oppressor Missiles, Fractal Livery Set, Digital Livery Set, Geometric Livery Set, Nature Reserve Livery, Naval Battle Livery, Anti-Aircraft Trailer Dual 20mm Flak, Anti-Aircraft Trailer Homing Missile Battery, Mobile Operations Center Rear Turrets, Incendiary Rounds, Hollow Point Rounds, Armor Piercing Rounds, Full Metal Jacket Rounds, Explosive Rounds, Pistol Mk II Mounted Scope, Pistol Mk II Compensator, SMG Mk II Holographic Sight, SMG Mk II Heavy Barrel, Heavy Sniper Mk II Night Vision Scope, Heavy Sniper Mk II Thermal Scope, Heavy Sniper Mk II Heavy Barrel, Combat MG Mk II Holographic Sight, Combat MG Mk II Heavy Barrel, Assault Rifle Mk II Holographic Sight, Assault Rifle Mk II Heavy Barrel, Carbine Rifle Mk II Holographic Sight, Carbine Rifle Mk II Heavy Barrel, Proximity Mines
	unlock_packed_bools(15491, 15499) --Weaponized Tampa Heavy Chassis Armor, Brushstroke Camo Mk II Weapon Livery, Skull Mk II Weapon Livery, Sessanta Nove Mk II Weapon Livery, Perseus Mk II Weapon Livery, Leopard Mk II Weapon Livery, Zebra Mk II Weapon Livery, Geometric Mk II Weapon Livery, Boom! Mk II Weapon Livery
	unlock_packed_bools(15552, 15560) --Bronze Greatest Dancer Trophy, Bronze Number One Nightclub Trophy, Bronze Battler Trophy, Silver Greatest Dancer Trophy, Silver Number One Nightclub Trophy, Silver Battler Trophy, Gold Greatest Dancer Trophy, Gold Number One Nightclub Trophy, Gold Battler Trophy
	unlock_packed_bools(18099, 18099) --The Forest
	unlock_packed_bools(18116, 18118) --The Data Breaches, The Bogdan Problem, The Doomsday Scenario (Elite Challenges)
	unlock_packed_bools(18121, 18125) --Green Wireframe Bodysuit, Orange Wireframe Bodysuit, Blue Wireframe Bodysuit, Pink Wireframe Bodysuit, Yellow Wireframe Bodysuit
	unlock_packed_bools(18134, 18137) --Hideous Krampus Mask, Fearsome Krampus Mask, Odious Krampus Mask, Heinous Krampus Mask
	unlock_packed_bools(22124, 22132) --Maisonette Los Santos T-Shirt, Studio Los Santos T-Shirt, Galaxy T-Shirt, Gefängnis T-Shirt, Omega T-Shirt, Technologie T-Shirt, Paradise T-Shirt, The Palace T-Shirt, Tony's Fun House T-Shirt
	unlock_packed_bools(22137, 22139) --Nightclub Hotspot Trophy
	unlock_packed_bools(24963, 25000) --Apocalypse Cerberus, Future Shock Cerberus, Apocalypse Brutus, Nightmare Cerberus, Apocalypse ZR380, Future Shock Brutus, Impaler, Bolt Burger Hunger T-Shirt, Apocalypse Sasquatch - Livery set, Rat-Truck, Glendale, Slamvan, Dominator, Issi Classic, Spacesuit Alien T-Shirt set, Gargoyle, Future Shock Deathbike - Light Armor w/ Shield, Blue Lights, Electric Blue Lights, Mint Green Lights, Lime Green Lights, Yellow Lights, Golden Shower Lights, Orange Lights, Red Lights, Pony Pink Lights, Hot Pink Lights, Purple Lights, Blacklight Lights, Taxi Custom, Dozer, Clown Van, Trashmaster, Barracks Semi, Mixer, Space Docker, Tractor, Nebula Bodysuit set
	unlock_packed_bools(25002, 25002) --Up-n-Atomizer
	unlock_packed_bools(25005, 25006) --Epsilon Robes, Kifflom T-Shirt
	unlock_packed_bools(25008, 25009) --The Rookie
	unlock_packed_bools(25018, 25099) --Black & White Bones Festive Sweater, Slasher Festive Sweater, Black & Red Bones Festive Sweater, Red Bones Festive Sweater, Burger Shot Festive Sweater, Red Bleeder Festive Sweater, Blue Bleeder Festive Sweater, Blue Cluckin' Festive Sweater, Green Cluckin' Festive Sweater, Blue Slaying Festive Sweater, Green Slaying Festive Sweater, Hail Santa Festive Sweater, Merry Sprunkmas Festive Sweater, Ice Cold Sprunk Festive Sweater, Albany T-Shirt, Albany Vintage T-Shirt, Annis T-Shirt, Benefactor T-Shirt, BF T-Shirt, Bollokan T-Shirt, Bravado T-Shirt, Brute T-Shirt, Buckingham T-Shirt, Canis T-Shirt, Chariot T-Shirt, Cheval T-Shirt, Classique T-Shirt, Coil T-Shirt, Declasse T-Shirt, Dewbauchee T-Shirt, Dilettante T-Shirt, Dinka T-Shirt, Dundreary T-Shirt, Emperor T-Shirt, Enus T-Shirt, Fathom T-Shirt, Gallivanter T-Shirt, Grotti T-Shirt, Hijak T-Shirt, HVY T-Shirt, Imponte T-Shirt, Invetero T-Shirt, Jobuilt T-Shirt, Karin T-Shirt, Lampadati T-Shirt, Maibatsu T-Shirt, Mamba T-Shirt, Mammoth T-Shirt, MTL T-Shirt, Obey T-Shirt, Ocelot T-Shirt, Overflod T-Shirt, Pegassi T-Shirt, Pfister T-Shirt, Progen T-Shirt, Rune T-Shirt, Schyster T-Shirt, Shitzu T-Shirt, Truffade T-Shirt, Ubermacht T-Shirt, Vapid T-Shirt, Vulcar T-Shirt, Weeny T-Shirt, Willard T-Shirt, Albany Nostalgia T-Shirt, Albany USA T-Shirt, Albany Dealership T-Shirt, Annis JPN T-Shirt, BF Surfer T-Shirt, Bollokan Prairie T-Shirt, Bravado Stylized T-Shirt, Brute Impregnable T-Shirt, Brute Heavy Duty T-Shirt, Buckingham Luxe T-Shirt, Canis USA T-Shirt, Canis American Legend T-Shirt, Canis Wolf T-Shirt, Cheval Marshall T-Shirt, Coil USA T-Shirt, Coil Raiden T-Shirt, Declasse Logo T-Shirt, Declasse Girl T-Shirt
	unlock_packed_bools(25101, 25109) --Nightmare Brutus, Apocalypse Scarab, Future Shock Scarab, Nightmare Scarab, Future Shock ZR380, Nightmare ZR380, Apocalypse Imperator, Future Shock Imperator, Nightmare Imperator
	unlock_packed_bools(25111, 25134) --Future Shock Deathbike - Reinforced Armor w/ Shield, Future Shock Deathbike - Heavy Armor w/ Shield, Future Shock Sasquatch - Livery set, Nightmare Sasquatch - Livery set, Apocalypse Cerberus - Livery set, Future Shock Cerberus - Livery set, All variants of Sasquatch - Light Armor, All variants of Sasquatch - Reinforced Armor, All variants of Sasquatch - Heavy Armor, Nightmare Cerberus - Livery set, Apocalypse Bruiser - Livery set, Future Shock Bruiser - Livery set, Nightmare Bruiser - Livery set, Apocalypse Slamvan - Livery set, All variants of Cerberus - Body Spikes, Future Shock Slamvan - Livery set, All variants of Cerberus - Light Armor, All variants of Cerberus - Reinforced Armor, All variants of Cerberus - Heavy Armor, Nightmare Slamvan - Livery set, Apocalypse Brutus - Livery set, Future Shock Brutus - Livery set, Nightmare Brutus - Livery set, Apocalypse Scarab - Livery set
	unlock_packed_bools(25136, 25179) --All variants of Bruiser - Body Spikes, Future Shock Scarab - Livery set, Nightmare Scarab - Livery set, All variants of Bruiser - Light Armor, All variants of Bruiser - Reinforced Armor, All variants of Bruiser - Heavy Armor, Apocalypse Dominator - Livery set, Future Shock Dominator - Livery set, Nightmare Dominator - Livery set, Apocalypse Impaler - Livery set, Future Shock Impaler - Livery set, Nightmare Impaler - Livery set, All variants of Slamvan - Body Spikes, Apocalypse Imperator - Livery set, Future Shock Imperator - Livery set, All variants of Slamvan - Light Armor, All variants of Slamvan - Reinforced Armor, All variants of Slamvan - Heavy Armor, Nightmare Imperator - Livery set, Apocalypse ZR380 - Livery set, Future Shock ZR380 - Livery set, Nightmare ZR380 - Livery set, Apocalypse Issi - Livery set, Future Shock Issi - Livery set, All variants of Brutus - Light Armor, All variants of Brutus - Reinforced Armor, All variants of Brutus - Heavy Armor, Nightmare Issi - Livery set, Apocalypse Deathbike - Livery set, Future Shock Deathbike - Livery set, Nightmare Deathbike - Livery set, All variants of Sasquatch - Heavy Armored Front, Apocalypse Scarab - Body Spikes set, Future Shock Scarab - Body Spikes set, Nightmare Scarab - Body Spikes set, All variants of Sasquatch - Heavy Armored Hood, All variants of Sasquatch - Mohawk Exhausts, All variants of Scarab - Light Armor, All variants of Scarab - Reinforced Armor, All variants of Scarab - Heavy Armor, All variants of Sasquatch - Dual Mohawk Exhausts, Apocalypse & Nightmare Sasquatch - Rear Spears Left, Optics Headset Mask set, All variants of Dominator - Body Spikes
	unlock_packed_bools(25181, 25237) --Apocalypse & Nightmare Sasquatch - Rear Spears Right, Apocalypse & Nightmare Sasquatch - Skull Cross, All variants of Dominator - Light Armor, All variants of Dominator - Reinforced Armor, All variants of Dominator - Heavy Armor, Apocalypse & Nightmare Sasquatch - Ram Skull Cross, Apocalypse & Nightmare Sasquatch - Blonde Doll Cross, All variants of Impaler - Body Spikes, Apocalypse & Nightmare Sasquatch - Brunette Doll Cross, Apocalypse & Nightmare Cerberus - Bastioned Ram-bars, All variants of Impaler - Light Armor, All variants of Impaler - Reinforced Armor, All variants of Impaler - Heavy Armor, All variants of Cerberus - Bolstered Hood Cage, All variants of Cerberus - Reinforced Riot Hood, All variants of Cerberus - Juggernaut Hood, Apocalypse & Nightmare Cerberus - War Spearheads, All variants of Imperator - Body Spikes, Apocalypse & Nightmare Cerberus - War Spear Kit, Apocalypse & Nightmare Cerberus - Nade Spearheads, Apocalypse & Nightmare Cerberus - Nade Spear Kit, All variants of Imperator - Light Armor, All variants of Imperator - Reinforced Armor, All variants of Imperator - Heavy Armor, Apocalypse & Nightmare Cerberus - Skull Spearheads, Apocalypse & Nightmare Cerberus - Skull Spear Kit, Apocalypse & Nightmare Cerberus - Arrow Spearheads, Apocalypse & Nightmare Cerberus - Arrow Spear Kit, All variants of ZR380 - Body Spikes, Apocalypse & Nightmare Cerberus - Tridents, Apocalypse & Nightmare Cerberus - Wasteland Ritual, All variants of ZR380 - Light Armor, All variants of ZR380 - Reinforced Armor, All variants of ZR380 - Heavy Armor, Future Shock Cerberus - Panel Detail, Future Shock Cerberus - Crane Pipes, All variants of Issi - Body Spikes, Future Shock Cerberus - Hedgehog, Future Shock Cerberus - Hedgehog MK2, Future Shock Bruiser - Heavy Plated Armored Grille / Apocalypse & Nightmare Bruiser - Diamond Heavy Armor Grille, All variants of Issi - Light Armor, All variants of Issi - Reinforced Armor, All variants of Issi - Heavy Armor, All variants of Bruiser - Twin Oval Exhaust, Cluckin' Bell Mask, All variants of Bruiser - Long Triple Rear Exhausts, All variants of Bruiser - Front & Rear Triple Exhausts, All variants of Deathbike - Light Armor, All variants of Deathbike - Reinforced Armor, All variants of Deathbike - Heavy Armor, Kinetic Mines, Apocalypse Bruiser - Skull & Cross / Nightmare Bruiser - Painted Skull & Cross, Spike Mines, Slick Mines, Sticky Mines, EMP Mines, RC Bandito
	unlock_packed_bools(25244, 25400) --Robot Bodysuit set, Hero Bodysuit set, Shapes Bodysuit set, Contours Bodysuit set, Martian Bodysuit set, Reptile Bodysuit set, Galaxy Bodysuit set, Space Creature Suits, Space Cyclops Suits, Space Horror Suits, Retro Spacesuits, Astronaut Suits, Space Traveler Suits, Character Suits: Pogo Space Monkey, Character Suits: Republican Space Ranger, Death Bird Mask set, Stalker Mask set, Raider Mask set, Marauder Mask set, Paco the Taco Mask, Burger Shot Mask, Space Rangers T-Shirt set, Space Ranger Logo T-Shirt set, Phases T-Shirt set, Rocket Splash T-Shirt set, Two Moons T-Shirt set, Freedom Isn't Free T-Shirt set, Apocalyptic Raider Top set, Apocalyptic Leather Feather Top set, Apocalyptic Mercenary Vest set, Benedict Light Beer Hoodie, Taco Bomb Hoodie, Cluckin' Bell Logo Bomb Hoodie, Patriot Beer Hoodie, Pisswasser Hoodie, Burger Shot Hoodie, Corn Dog Hoodie, Donut Hoodie, Lucky Plucker Hoodie, Logger Light Hoodie, Pizza Hoodie, Fries Hoodie, Mushrooms Hoodie, Redwood Hoodie, eCola Infectious Hoodie, Cluckin' Bell Logo Hoodie, Lemons Hoodie, Tacos Hoodie, Burger Shot Pattern Sweater, Burger Shot Logo Sweater, Burger Shot Sweater, Sprunk Sweater set, Wigwam Sweater, Taco Bomb Chili Sweater, Taco Bomb Sweater set, Cluckin' Bell Logo Bomb Sweater, Blue Cluckin' Bell Sweater, Black Cluckin' Bell Sweater, eCola Sweater set, MeTV Sweater set, Heat Sweater set, Degenatron Sweater, Pisswasser Sweater set, Bolt Burger Sweater, Lucky Plucker Logo Bomb Sweater, Lucky Plucker Sweater, Burger Shot Hockey Shirt set, Cluckin' Bell Hockey Shirt set, Wigwam Hockey Shirt, Redwood Hockey Shirt, Bean Machine Hockey Shirt, Red eCola Hockey Shirt, Black eCola Hockey Shirt, Phat Chips Hockey Shirt set, Sprunk Hockey Shirt set, Sprunk Classic Hockey Shirt, Burger Shot Black T-Shirt, Burger Shot Logo T-Shirt, Cluckin' Bell Logo T-Shirt, Cluckin' Bell Black T-Shirt, Cluckin' Bell Filled Logo T-Shirt, eCola Black T-Shirt, Lucky Plucker T-Shirt, Pisswasser T-Shirt, Sprunk T-Shirt, Taco Bomb Chili T-Shirt, Taco Bomb Black T-Shirt, Up-n-Atom Hamburgers T-Shirt, Up-n-Atom Logo T-Shirt, Wigwam T-Shirt, Degenatron ROYGBIV T-Shirt, CNT T-Shirt, Qub3d T-Shirt, Righteous Slaughter T-Shirt, Space Monkey Full T-Shirt, Space Monkey Pixel T-Shirt, Space Monkey Enemy T-Shirt, Burger Shot Bleeder T-Shirt, Heat Rises T-Shirt, Space Monkey Logo T-Shirt, Space Monkey Suit T-Shirt, Space Monkey Face T-Shirt, Space Monkey Mosaic T-Shirt, Bolt Burger Logo T-Shirt, Exsorbeo 720 T-Shirt, Heat Ball Logo T-Shirt set, Heat Logo T-Shirt set, Heat Pop Art Logo T-Shirt set, MeTV Logo T-Shirt set, MeTV 90s T-Shirt set, Burger Shot Target T-Shirt, eCola Infectious T-Shirt, Up-n-Atom White T-Shirt, Jock Cranley Patriot T-Shirt, CCC TV T-Shirt, Degenatron Logo T-Shirt, eCola White T-Shirt, eCola Pass It On T-Shirt, Tw@ T-Shirt, Chain Pants set, Chain Shorts set, Leather Stitch Pants set, Raider Pants set, Light Ups Shoes set, Flaming Skull Boots set, Skull Harness Boots set, Plated Boots set, Burger Shot Food Cap set, Apocalypse Bruiser - Double Cross Ram Skull / Nightmare Bruiser - Painted Ram Skull & Cross, Burger Shot Logo Cap, Burger Shot Bullseye Cap, Cluckin' Bell Logo Cap set, Apocalypse Bruiser - Cross & Skull Large Blade Kit / Nightmare Bruiser - Painted Skull Large Blade Kit, Cluckin' Bell Logos Cap, Hotdogs Cap set, Taco Bomb Cap set, Apocalypse Bruiser - Ram Skull Nade Kit / Nightmare Bruiser - Painted Ram Skull Nade Kit, Apocalypse Bruiser - Ram Skull Medieval Kit / Nightmare Bruiser - Painted Skull Medieval Kit, Lucky Plucker Cap set, Lucky Plucker Logos Cap set, Apocalypse Bruiser - Ram Skull Medieval Madness / Nightmare Bruiser - Painted Skull Medieval Madness, Apocalypse Bruiser - Barrels & Junk, Pisswasser Cap set, Apocalypse Bruiser - Skeleton Cage, Future Shock Bruiser - Light Cover, Future Shock Bruiser - Spare Tire, Taco Canvas Hat, Burger Shot Canvas Hat, Cluckin' Bell Canvas Hat, Hotdogs Canvas Hat, Shunt Boost, Boost Upgrade 20%, Boost Upgrade 60%, Boost Upgrade 100%, Jump Upgrade 20%, Jump Upgrade 60%, Jump Upgrade 100%
	unlock_packed_bools(25405, 25405) --Festive tint (Up-n-Atomizer)
	unlock_packed_bools(25407, 25511) --Future Shock Bruiser - Crates, Nightmare Bruiser - Large Burger, Nightmare Bruiser - Large Doughnuts, Nightmare Bruiser - Large eCola Cans, All variants of Slamvan - Rear Bumper Reinforced Armor, All variants of Slamvan - Rear Bumper Heavy Armor, Apocalypse Slamvan - Basic Spears, Apocalypse Slamvan - Battle Cross, Apocalypse Slamvan - War Cross, Apocalypse Slamvan - Battle Spears, Apocalypse Slamvan - War Spears, Nightmare Slamvan - Knife Spears, Nightmare Slamvan - Fork & Knife, Apocalypse & Nightmare Brutus - Gassed Up Bar, Apocalypse & Nightmare Brutus - Roadblock, Apocalypse & Nightmare Brutus - Junk Trunk, Apocalypse & Nightmare Brutus - Fire Spitters, Apocalypse & Nightmare Brutus - Hell Chambers, Apocalypse & Nightmare Brutus - Heavy Armored Arches, Apocalypse & Nightmare Brutus - Toothy, Apocalypse & Nightmare Brutus - Armored Spares, Apocalypse & Nightmare Brutus - Armored Supplies, Apocalypse & Nightmare Brutus - Eternally Chained, Apocalypse & Nightmare Brutus - Speared, Future Shock Scarab - Primary Full Armor, All variants of Scarab - Secondary Full Armor, All variants of Scarab - Carbon Full Armor, Future Shock Scarab - Heavy Duty Cooling / Apocalypse & Nightmare Scarab - Air Filtration Vents & Long Range Equipment, Apocalypse & Nightmare Scarab - Rusty Full Armor, Apocalypse & Nightmare Scarab - Rear War Poles, Apocalypse & Nightmare Scarab - Rear Spears, Apocalypse & Nightmare Scarab - Skull Cross, Apocalypse & Nightmare Scarab - Skull Cross w/ War Poles, Apocalypse & Nightmare Scarab - Skull Cross w/ Spears, Apocalypse & Nightmare Scarab - Load'a War Poles, Apocalypse & Nightmare Scarab - Load'a Spears, Apocalypse & Nightmare Scarab - Scarab Mega Cover set, Apocalypse & Nightmare Scarab - Armored Mega Cover set, Apocalypse & Nightmare Scarab - Cage, Apocalypse & Nightmare Scarab - Plated Cage, Future Shock Scarab - Livery Armor, Future Shock Scarab - Primary Full Armor, Future Shock Scarab - Livery Full Armor, Future Shock Scarab - Carbon Full Armor, Future Shock Scarab - Matte Full Armor, Future Shock Scarab - Futuristic Panel Armor, Future Shock Scarab - Plated Livery Full Armor, All variants of Dominator - Triple Front Exhausts, All variants of Dominator - Horn Exhausts, All variants of Dominator - Triple Rear Exhausts, Apocalypse & Nightmare Dominator - Rear Pointing War Poles, Apocalypse & Nightmare Dominator - Front Facing Axes, Apocalypse & Nightmare Dominator - Front Facing Spears, Apocalypse & Nightmare Dominator - Unholy Cross, Apocalypse & Nightmare Dominator - Brutal Unholy Cross, Apocalypse & Nightmare Dominator - Bunch of War Poles, Apocalypse & Nightmare Dominator - Front Pointing War Poles, Apocalypse & Nightmare Dominator - Skull Hood, Apocalypse & Nightmare Impaler - Got Pole?, Apocalypse & Nightmare Impaler - Getting Medieval, Apocalypse & Nightmare Impaler - Wasteland Peacock, Apocalypse & Nightmare Impaler - Shish-Kebbabed, Apocalypse & Nightmare Impaler - It's A Stick Up, Apocalypse & Nightmare Impaler - The Dark Ages, Apocalypse & Nightmare Impaler - Dolly Spearton, Apocalypse & Nightmare Impaler - War Poles, All variants of Imperator - Shakotan Exhaust, Apocalypse & Nightmare Imperator - Whole Lotta Pole, Apocalypse & Nightmare Imperator - Getting Medieval, Apocalypse & Nightmare Imperator - It's A Stick Up, Apocalypse & Nightmare Imperator - Boom On A Spear, Apocalypse & Nightmare Imperator - Village Justice, Apocalypse & Nightmare Imperator - Wasteland Peacock, Apocalypse & Nightmare Imperator - Shish-Kebbabed, Apocalypse & Nightmare Imperator - Junk Pipes, Apocalypse & Nightmare Imperator - Mega Zorst, Apocalypse & Nightmare Imperator - Ride 'Em Cowboy, Apocalypse & Nightmare Imperator - Cannibal Totem, All variants of ZR380 - Side Exhausts, All variants of ZR380 - Spike Exhausts, Apocalypse & Nightmare ZR380 - Mismatch, Future Shock ZR380 - Ray Gun Exhausts, Future Shock ZR380 - Sprint Car Wing, Future Shock ZR380 - Armor Plating Mk. 3, Future Shock ZR380 - Rear Phantom Covers, All variants of Issi - Heavy Duty Ram Bar, Apocalypse & Nightmare Issi - Spear, Apocalypse & Nightmare Issi - Left War Poles, Apocalypse & Nightmare Issi - Dolly Spearton, Apocalypse & Nightmare Issi - Right War Poles, Apocalypse & Nightmare Issi - Skull Cross, Apocalypse & Nightmare Issi - Dolly Spearton Set, Apocalypse & Nightmare Issi - Dual War Poles, Apocalypse & Nightmare Issi - Dolly Spearton W/ War Pole, Apocalypse & Nightmare Issi - Skull Cross W/ Spear, Apocalypse & Nightmare Issi - Skull Cross W/ War Pole, Apocalypse & Nightmare Issi - Skull Cross W/ Dolly, Apocalypse & Nightmare Issi - Left Spear, Apocalypse & Nightmare Issi - Right Spear, Apocalypse & Nightmare Issi - Left Skull Axe, Apocalypse & Nightmare Issi - Right Axe, Apocalypse & Nightmare Issi - Dual Spears, Apocalypse & Nightmare Issi - Spear & Axe, Apocalypse & Nightmare Issi - Axe & Spear, Apocalypse & Nightmare Issi - Dual Axes
	unlock_packed_bools(25516, 25516) --RC Tank
	unlock_packed_bools(25520, 25521) --Metal Detector
	unlock_packed_bools(26811, 26964) --Action Figures, Playing Cards
	unlock_packed_bools(26968, 27088) --Impotent Rage Outfit, High Roller, Tiger Scuba, Sprunk Racing Suit, Neon Bodysuit, Extreme Strike Vest, The Chimera (Outfit), White Racing Suit, The Reconnaissance (Outfit), Blue Jock Cranley Suit, Italian Biker Suit, The Hazard (Outfit), Mid Strike Vest, Splinter Gorka Suit, The Gunfighter (Outfit), Black Plate Carrier*, Hunter Leather Fur Jacket, Chamois Plate Carrier*, Black Heavy Utility Vest, The Puff (Outfit), Ox Blood Patched Cut, Color Geo PRB Leather, Blue Tactical Blouson, Orange Big Cat*, Color Geo Sweater, Vivid Gradient Puffer, Color Diamond Sweater, Classic SN Print Sweater, Power Motocross, The Buzz (Outfit), Pegassi Racing Jacket, Woodland Camo Parka, Le Chien Print Sweater, The Pincer (Outfit), Vibrant Gradient Shortsleeve, Urban Gradient Shortsleeve, White Chevron SC Track, Slalom Motocross, Blue Savanna Shortsleeve, Green Didier Sachs Field, Candy Motocross, Tutti Frutti Pattern Sweater, The Vespucci (Outfit), Contrast Camo Service Shirt, Tropical Pattern Sweater, Black Service Shirt, SecuroServ 1 (Outfit), Black Sports Blagueurs Hoodie, Gold Shiny T-Shirt, OJ Shortsleeve, Primary Squash Hoodie, Purple Camo Bigness Hoodie, Bold Abstract Bigness Hoodie, Pink SN Hoodie, Red Boating Blazer, Multicolor Leaves Shortsleeve, Neon Leaves Güffy Hoodie, Black Dotted Shortsleeve, Drive Motocross, Red Patterned Shortsleeve, Steel Horse Satin Jacket, Orange Squash Hoodie, Regal Loose Shirt, White Güffy Hoodie, Stealth Utility Vest, Red Floral Sweater, Black & Red Bigness Jersey, The Slick (Outfit), Splat Squash Sweater, Tan Hooded Jacket, Brushstroke Combat Shirt, White & Red Bigness Jersey, Black Combat Top, Lime Longline Hoodie, Red Bold Check, Bold Camo Sand Castle Sweater, Red Combat Shirt, Red Mist XI Dark, Cyan Manor Sweater, Flecktarn Sleeveless Shirt, Forest Camo Battle Vest, LS Jardineros Dark, Liberty Cocks Dark, Angelica T-Shirt, Hinterland Ship Sweater, Wine Sleeveless Shirt, Cobble Sleeveless, Black Dense Logo Sweater*, White Flying Bravo Hoodie, Cat T-Shirt*, Color Geo T-Shirt, Bold Abstract Bigness T-Shirt, Neon Leaves Güffy T-Shirt, Black Baggy Hoodie, White Manor Zigzag T-Shirt, Double P Baseball Shirt, Aqua Camo Rolled Tee, Dark Woodland T-Shirt, White Bigness T-Shirt, Black No Retreat Tank, White Benny's T-Shirt, Red Smuggler Tank, Angels of Death Vivid Tee, Blue Hit & Run Tank, Waves T-Shirt*, Beige Turtleneck, Hinterland Nugget T-Shirt, Mustard Güffy Tank, Nagasaki White and Red Hoodie, Grotti Tee, Western Logo Black Tee, Butchery and other Hobbies, Black Ammu-Nation Hoodie*, Fake Santo Capra T-Shirt, Death Defying T-Shirt, Bahama Mamas, Showroom T-Shirt, LS UR Tee, J Lager Beer Hat, Unicorn, Gingerbread
	unlock_packed_bools(27109, 27115) --The Diamond Classic T-Shirt, The Diamond Vintage T-Shirt, Red The Diamond LS T-Shirt, Blue The Diamond Resort LS T-Shirt, Red The Diamond Resort T-Shirt, Blue D Casino T-Shirt, Red The Diamond Classic T-Shirt
	unlock_packed_bools(27120, 27145) --White The Diamond Hoodie, Black The Diamond Hoodie, Ash The Diamond Hoodie, Gray The Diamond Hoodie, Red The Diamond Hoodie, Orange The Diamond Hoodie, Blue The Diamond Hoodie, Black The Diamond Silk Robe, White The Diamond Cap, Black The Diamond Cap, White LS Diamond Cap, Black LS Diamond Cap, Red The Diamond Cap, Orange The Diamond Cap, Blue LS Diamond Cap, Green The Diamond Cap, Orange LS Diamond Cap, Purple The Diamond Cap, Pink LS Diamond Cap, White The Diamond LS Tee*, Black The Diamond LS Tee, Black The Diamond Resort LS Tee, White The Diamond Resort Tee, Black The Diamond Resort Tee, Black LS Diamond Tee, Black D Casino Tee
	unlock_packed_bools(27147, 27182) --I've Been Shamed Tee, Blue I've Been Shamed Tee, Fame or Shame Stars Tee, Red Fame or Shame Stars Tee, No Talent Required Tee, Red No Talent Required Tee, Team Tracey Tee, Blue Team Tracey Tee, Monkey Business Tee, Red Monkey Business Tee, Fame or Shame Logo Tee, Blue Fame or Shame Logo Tee, Stars Fame or Shame Robe, Black Fame or Shame Robe, Red Stars Fame or Shame Robe, Red Fame or Shame Robe, White Fame or Shame Robe, Black Fame or Shame Shades, Red Fame or Shame Shades, Blue Fame or Shame Shades, White Fame or Shame Shades, Gold Fame or Shame Mics, Silver Fame or Shame Mics, Red Fame or Shame Kronos, Green Fame or Shame Kronos, Blue Fame or Shame Kronos, Black Fame or Shame Kronos, America Loves You Tee, Blue America Loves You Tee, Fame or Shame No Evil Tee, You're So Original! Tee, Red You're So Original! Tee, Oh No He Didn't! Tee, Blue Oh No He Didn't! Tee, You're Awful Tee, Red You're Awful Tee
	unlock_packed_bools(27184, 27213) --Invade and Persuade Enemies T-Shirt, Invade and Persuade Oil T-Shirt, Invade and Persuade Tour T-Shirt, Invade and Persuade Green T-Shirt, Invade and Persuade RON T-Shirt, Street Crimes Hoods T-Shirt, Street Crimes Punks T-Shirt, Street Crimes Yokels T-Shirt, Street Crimes Bikers T-Shirt, Street Crimes Action T-Shirt, Street Crimes Boxart T-Shirt, Street Crimes Logo T-Shirt, Claim What's Yours T-Shirt, Choose Your Side T-Shirt, Street Crimes Color Gangs T-Shirt, Street Crimes Red Gangs T-Shirt, White Street Crimes Icons T-Shirt, Black Street Crimes Icons T-Shirt, Invade and Persuade Logo T-Shirt, Mission I T-Shirt, Mission II T-Shirt, Mission IV T-Shirt, Mission III T-Shirt, Invade and Persuade Boxart T-Shirt, Invade and Persuade Invader T-Shirt, Invade and Persuade Suck T-Shirt, Invade and Persuade Jets T-Shirt, Invade and Persuade Gold T-Shirt, Invade and Persuade Hero T-Shirt, Invade and Persuade Barrels T-Shirt
	unlock_packed_bools(27247, 27247) --Madam Nazar (Arcade Trophy)
	unlock_packed_bools(28099, 28148) --Signal Jammers
	unlock_packed_bools(28158, 28158) --Navy Revolver
	unlock_packed_bools(28171, 28191) --Green Reindeer Lights Bodysuit, Ho-Ho-Ho Sweater, Traditional Festive Lights Bodysuit, Yellow Reindeer Lights Bodysuit, Neon Festive Lights Bodysuit, Plushie Grindy T-Shirt, Plushie Saki T-Shirt , Plushie Humpy T-Shirt, Plushie Smoker T-Shirt, Plushie Poopie T-Shirt, Plushie Muffy T-Shirt, Plushie Wasabi Kitty T-Shirt, Plushie Princess T-Shirt, Plushie Master T-Shirt, Pixel Pete's T-Shirt, Wonderama T-Shirt, Warehouse T-Shirt, Eight Bit T-Shirt, Insert Coin T-Shirt, Videogeddon T-Shirt, Nazar Speaks T-Shirt
	unlock_packed_bools(28194, 28196) --Silent & Sneaky, The Big Con, Aggressive (Elite Challenges)
	unlock_packed_bools(28197, 28222) --Badlands Revenge II Gunshot T-Shirt, Badlands Revenge II Eagle T-Shirt, Badlands Revenge II Pixtro T-Shirt, Badlands Revenge II Romance T-Shirt, Badlands Revenge II Bear T-Shirt, Badlands Revenge II Help Me T-Shirt & Badlands Revenge II Retro T-Shirt, Race and Chase Decor T-Shirt, Race and Chase Vehicles T-Shirt, Race and Chase Finish T-Shirt, Crotch Rockets T-Shirt, Street Legal T-Shirt & Get Truckin' T-Shirt, Wizard's Ruin Loot T-Shirt, The Wizard's Ruin Rescue T-Shirt, The Wizard's Ruin Vow T-Shirt, Thog Mighty Sword T-Shirt, Thog T-Shirt & Thog Bod T-Shirt, Space Monkey 3 T-Shirt, Space Monkey Space Crafts T-Shirt, Space Monkey Pixel T-Shirt, Space Monkey Boss Fights T-Shirt, Radioactive Space Monkey T-Shirt & Space Monkey Art T-Shirt, Monkey's Paradise T-Shirt, Retro Defender of the Faith T-Shirt, Penetrator T-Shirt, Defender of the Faith T-Shirt, Love Professor His T-Shirt & Love Professor Hers T-Shirt, Love Professor Nemesis T-Shirt, Love Professor Friendzoned T-Shirt, Love Professor Secrets T-Shirt & Love Professor Score T-Shirt, Shiny Wasabi Kitty Claw T-Shirt, Pixtro T-Shirt, Akedo T-Shirt & Arcade Trophy T-Shirt
	unlock_packed_bools(28224, 28227) --White Dog With Cone T-Shirt, Yellow Dog With Cone T-Shirt, Dog With Cone Slip-Ons & Dog With Cone Chain, Refuse Collectors Outfit, Undertakers Outfit, Valet Outfit
	unlock_packed_bools(28229, 28249) --Prison Guards, FIB Suits, Black Scuba, Gruppe Sechs Gear, Bugstars Uniforms, Maintenance Outfit, Yung Ancestors Outfit, Firefighter Outfit, Orderly Armor Outfit, Upscale Armor Outfit, Evening Armor Outfit, Reinforced: Padded Combat Outfit, Reinforced: Bulk Combat Outfit, Reinforced: Compact Combat Outfit, Balaclava Crook Outfit, Classic Crook Outfit, High-end Crook Outfit, Infiltration: Upgraded Tech Outfit, Infiltration: Advanced Tech Outfit, Infiltration: Modernized Tech Outfit, Degenatron Glitch T-Shirt
	unlock_packed_bools(28254, 28255) --Get Metal T-Shirt / Axe of Fury T-Shirt, 11 11 T-Shirt / Axe of Fury T-Shirt
	unlock_packed_bools(30230, 30251) --Movie Props, Space Interloper Outfit
	unlock_packed_bools(30254, 30295) --King Of QUB3D T-Shirt, Qubism T-Shirt, God Of QUB3D T-Shirt, QUB3D Boxart T-Shirt, Qub3d Qub3s T-Shirt, Yacht Captain Outfit, BCTR Aged T-Shirt, BCTR T-Shirt, Cultstoppers Aged T-Shirt, Cultstoppers T-Shirt, Daily Globe Aged T-Shirt, Daily Globe T-Shirt, Eyefind Aged T-Shirt, Eyefind T-Shirt, Facade Aged T-Shirt, Facade T-Shirt, Fruit Aged T-Shirt, Fruit T-Shirt, LSHH Aged T-Shirt, LSHH T-Shirt, MyRoom Aged T-Shirt, MyRoom T-Shirt, Rebel Aged T-Shirt, Rebel T-Shirt, Six Figure Aged T-Shirt, Six Figure T-Shirt, Trash Or Treasure Aged T-Shirt, Trash Or Treasure T-Shirt, Tw@ Logo Aged T-Shirt, Tw@ Logo T-Shirt, Vapers Den Aged T-Shirt, Vapers Den T-Shirt, WingIt Aged T-Shirt, WingIt T-Shirt, ZiT Aged T-Shirt, ZiT T-Shirt, Green Dot Tech Mask, Orange Dot Tech Mask, Blue Dot Tech Mask, Pink Dot Tech Mask, Lemon Sports Track Pants, Lemon Sports Track Top
	unlock_packed_bools(30524, 30557) --Grotti Aged T-Shirt, Lampadati Aged T-Shirt, Ocelot Aged T-Shirt, Overflod Aged T-Shirt, Pegassi Aged T-Shirt, Pfister Aged T-Shirt, Vapid Aged T-Shirt, Weeny Aged T-Shirt, Blue The Diamond Resort LS Aged T-Shirt, KJAH Radio Aged T-Shirt, K-Rose Aged T-Shirt, Emotion 98.3 Aged T-Shirt, KDST Aged T-Shirt, Bounce FM Aged T-Shirt, Fake Vapid Aged T-Shirt, I Married My Dad Aged T-Shirt, ToeShoes Aged T-Shirt, Vanilla Unicorn Aged T-Shirt, Steel Horse Solid Logo Aged T-Shirt, Black Western Logo Aged T-Shirt, White Nagasaki Aged T-Shirt, Black Principe Aged T-Shirt, Noise Aged T-Shirt, Noise Rockstar Logo Aged T-Shirt, Razor Aged T-Shirt, White Rockstar Camo Aged T-Shirt, LSUR Aged T-Shirt, Rebel Radio Aged T-Shirt, Channel X Aged T-Shirt, Albany Vintage Aged T-Shirt, Benefactor Aged T-Shirt, Bravado Aged T-Shirt, Declasse Aged T-Shirt, Dinka Aged T-Shirt
	unlock_packed_bools(30563, 30693) --Panther Varsity Jacket Closed, Panther Tour Jacket, Broker Prolaps Basketball Top, Panic Prolaps Basketball Top, Gussét Frog T-Shirt, Warped Still Slipping T-Shirt, Yellow Still Slipping T-Shirt, Black Rockstar T-Shirt, Black Exsorbeo 720 Logo T-Shirt, Manor PRBG T-Shirt, Manor Tie-dye T-Shirt, Open Wheel Sponsor T-Shirt, Rockstar Yellow Pattern T-Shirt, Rockstar Gray Pattern T-Shirt, Rockstar Rolling T-Shirt, Santo Capra Patterns Sweater, Rockstar Studio Colors Sweater, Bigness Jackal Sweater, Bigness Tie-dye Sweater, Bigness Faces Sweater, Broker Prolaps Basketball Shorts, Panic Prolaps Basketball Shorts, Exsorbeo 720 Sports Shorts, Bigness Tie-dye Sports Pants, Enus Yeti Forwards Cap, 720 Forwards Cap, Exsorbeo 720 Forwards Cap, Güffy Double Logo Forwards Cap, Rockstar Forwards Cap, Blue Bangles (L), Red Bangles (L), Pink Bangles (L), Yellow Bangles (L), Orange Bangles (L), Green Bangles (L), Red & Blue Bangles (L), Yellow & Orange Bangles (L), Green & Pink Bangles (L), Rainbow Bangles (L), Sunset Bangles (L), Tropical Bangles (L), Blue & Pink Glow Shades, Red Glow Shades, Orange Glow Shades, Yellow Glow Shades, Green Glow Shades, Blue Glow Shades, Pink Glow Shades, Blue & Magenta Glow Shades, Purple & Yellow Glow Shades, Blue & Yellow Glow Shades, Pink & Yellow Glow Shades, Red & Yellow Glow Shades, Blue Glow Necklace, Red Glow Necklace, Pink Glow Necklace, Yellow Glow Necklace, Orange Glow Necklace, Green Glow Necklace, Festival Glow Necklace, Carnival Glow Necklace, Tropical Glow Necklace, Hot Glow Necklace, Neon Glow Necklace, Party Glow Necklace, Sunset Glow Necklace, Radiant Glow Necklace, Sunrise Glow Necklace, Session Glow Necklace, Combat Shotgun, Perico Pistol, White Keinemusik T-Shirt, Blue Keinemusik T-Shirt, Moodymann T-Shirt, Palms Trax T-Shirt, Midnight Tint Oversize Shades, Sunset Tint Oversize Shades, Black Tint Oversize Shades, Blue Tint Oversize Shades, Gold Tint Oversize Shades, Green Tint Oversize Shades, Orange Tint Oversize Shades, Red Tint Oversize Shades, Pink Tint Oversize Shades, Yellow Tint Oversize Shades, Lemon Tint Oversize Shades, Gold Rimmed Oversize Shades, White Checked Round Shades, Pink Checked Round Shades, Yellow Checked Round Shades, Red Checked Round Shades, White Round Shades, Black Round Shades, Pink Tinted Round Shades, Blue Tinted Round Shades, Green Checked Round Shades, Blue Checked Round Shades, Orange Checked Round Shades, Green Tinted Round Shades, Brown Square Shades, Yellow Square Shades, Black Square Shades, Tortoiseshell Square Shades, Green Square Shades, Red Square Shades, Pink Tinted Square Shades, Blue Tinted Square Shades, White Square Shades, Pink Square Shades, All White Square Shades, Mono Square Shades, Green Calavera Mask, Navy Calavera Mask, Cherry Calavera Mask, Orange Calavera Mask, Purple Calavera Mask, Dark Blue Calavera Mask, Lavender Calavera Mask, Yellow Calavera Mask, Pink Calavera Mask, Neon Stitch Emissive Mask, Vibrant Stitch Emissive Mask, Pink Stitch Emissive Mask, Blue Stitch Emissive Mask, Neon Skull Emissive Mask, Vibrant Skull Emissive Mask, Pink Skull Emissive Mask, Orange Skull Emissive Mask, Dark X-Ray Emissive Mask, Bright X-Ray Emissive Mask, Purple X-Ray Emissive Mask
	unlock_packed_bools(30699, 30704) --Palms Trax LS T-Shirt, Moodymann Whatupdoe T-Shirt, Moodymann Big D T-Shirt, Keinemusik Cayo Perico T-Shirt, Still Slipping Blarneys T-Shirt, Still Slipping Friend T-Shirt
	unlock_packed_bools(31708, 31714) --CircoLoco Records - Blue EP, CircoLoco Records - Green EP, CircoLoco Records - Violet EP, CircoLoco Records - Black EP, Moodymann - Kenny's Backyard Boogie, NEZ - You Wanna?, NEZ ft. Schoolboy Q - Let's Get It
	unlock_packed_bools(31736, 31736) --The Frontier Outfit
	unlock_packed_bools(31755, 31755) --Auto Shop Race 'n Chase
	unlock_packed_bools(31760, 31764) --Faces of Death T-Shirt, Straight to Video T-Shirt, Monkey See Monkey Die T-Shirt, Trained to Kill T-Shirt, The Director T-Shirt
	unlock_packed_bools(31766, 31777) --Sprunk Forwards Cap, eCola Forwards Cap, Black Banshee T-Shirt, Blue Banshee T-Shirt, LS Customs T-Shirt, Rockstar Games Typeface T-Shirt, Wasted! T-Shirt, Baseball Bat T-Shirt, Knuckleduster T-Shirt, Rampage T-Shirt, Penitentiary Coveralls, LS Customs Coveralls
	unlock_packed_bools(31779, 31796) --The Ringleader Outfit, The Knuckles Outfit, The Breaker Outfit, The Dealer Outfit, Bearsy, Banshee Hoodie, eCola Varsity, Sprunk Varsity, LS Customs Varsity, LS Customs Tour Jacket, eCola Bodysuit, Sprunk Bodysuit, Sprunk Chute Bag, eCola Chute Bag, Halloween Chute Bag, Sprunk Chute, eCola Chute, Halloween Chute
	unlock_packed_bools(31805, 31808) --The Old Hand Outfit, The Overworked Outfit, The Longshoreman Outfit, The Underpaid Outfit
	unlock_packed_bools(31810, 31824) --Annis ZR350, Pfister Comet S2, Dinka Jester RR, Emperor Vectre, Ubermacht Cypher, Pfister Growler, Karin Calico GTF, Annis Remus, Vapid Dominator ASP, Karin Futo GTX, Dinka RT3000, Vulcar Warrener HKR, Karin Sultan RS Classic, Vapid Dominator GTT, Karin Previon
	unlock_packed_bools(31826, 31858) --Emperor Forwards Cap / Emperor Backwards Cap, Beige Knit Sneakers, Gray Emperor Classic Hoodie, Pursuit Series (Gameplay), Cyan Check Sleeveless Puffer, Dinka SPL (Wheel Mod), Blue Hayes Retro Racing, White Emperor Motors T-Shirt, Quick Fix (Gameplay), Cyan Check Puffer, Euros - Speed Trail (Livery), Never Barcode Print Hoodie, Hayes Modern Racing, Diversion (Gameplay), Gray Leather Bomber, Futo GTX - Chokusen Dorifuto (Livery), Karin Forwards Cap / Karin Backwards Cap, Cream Knit Sneakers, Private Takeover (Gameplay), Yellow Pfister Hoodie, Retro Turbofan (Wheel Mod), Red Check Sleeveless Puffer, White Hayes Retro Racing, Setup (Gameplay), Navy Emperor Motors T-Shirt, RT3000 - Stance Andreas (Livery), Red Check Puffer, Never Triangle Print Hoodie, Wingman (Gameplay), LTD Modern Racing, Jester RR - 10 Minute Car (Livery), Green Crowex Pro Racing Suit, Mustard Tan Leather Bomber
	unlock_packed_bools(31860, 31863) --Omnis Forwards Cap / Omnis Backwards Cap, Conical Turbofan (Wheel Mod), Black Knit Sneakers, Green Emperor Classic Hoodie
	unlock_packed_bools(31865, 31868) --Green Geo Sleeveless Puffer, ZR350 - Atomic Drift Team (Livery), White Globe Oil Retro Racing, Yellow Annis Rally T-Shirt
	unlock_packed_bools(31870, 31928) --Green Geo Puffer, Warrener HKR - Classic Vulcar (Livery), Life ZigZag Print Hoodie, Blue Dinka Modern Racing, Gray Benefactor Racing Suit, Orange Tan Leather Bomber, Ice Storm (Wheel Mod), Annis Forwards Cap / Annis Backwards Cap, Gray & Purple Knit Sneakers, Black Crowex Pro Racing Suit, Gray Pfister Hoodie, Calico GTF - Fukaru Rally (Livery), Black Geo Sleeveless Puffer, Green Crowex Retro Racing, Blue Xero Gas Racing Suit, Blue Annis Noise T-Shirt, Remus - Blue Lightning (Livery), Black Geo Puffer, Life Static Print Hoodie, Dark Benefactor Racing Suit, Red Dinka Modern Racing, Super Turbine (Wheel Mod), Chestnut Tan Leather Bomber, Vapid Forwards Cap / Vapid Backwards Cap, Red Xero Gas Racing Suit, Gray & Magenta Knit Sneakers, Dominator GTT - Oldschool Oval (Livery), Black Vapid Ellie Hoodie, Cream Bigness Sleeveless Puffer, Wildstyle Racing Suit, Red Globe Oil Retro Racing, Tailgater S - Crevis Race (Livery), Light Dinka T-Shirt, Cream Bigness Puffer, Modern Mesh (Wheel Mod), Never Crosshair Print Hoodie, Euros - Drift Tribe (Livery), Yellow Vapid Modern Racing, Dark Tan Leather Bomber, Forged Star (Wheel Mod), Light Dinka Forwards Cap / Light Dinka Backwards Cap, Futo GTX - Drift King (Livery), Gray & Aqua Knit Sneakers, Gray Karin Hoodie, Showflake (Wheel Mod), Purple Bigness Sleeveless Puffer, RT3000 - Atomic Motorsport (Livery), Black Crowex Retro Racing, Black Annis Noise T-Shirt, Giga Mesh (Wheel Mod), Purple Bigness Puffer, Jester RR - Yogarishima (Livery), Hiding Print Hoodie, Ubermacht Modern Racing, Mesh Meister (Wheel Mod), Ox Blood Leather Bomber, ZR350 - Kisama Chevrons (Livery), Dark Dinka Forwards Cap / Dark Dinka Backwards Cap, White & Pink Knit Sneakers
	unlock_packed_bools(31930, 31933) --Navy Vapid Ellie Hoodie, Warrener HKR - Classic Vulcar Alt (Livery), Green Aztec Sleeveless Puffer, Calico GTF - Disruption Rally (Livery)
	unlock_packed_bools(31935, 31938) --Blue Atomic Retro Racing, Remus - Annis Tech (Livery), Dark Dinka T-Shirt, Dominator GTT - Resto Mod Racer (Livery)
	unlock_packed_bools(31940, 31943) --Green Aztec Puffer, Tailgater S - Redwood (Livery), Life Binary Print Hoodie, Euros - King Scorpion (Livery)
	unlock_packed_bools(31945, 31948) --White Güffy Modern Racing, Futo GTX - Tandem Battle (Livery), Dark Nut Leather Bomber, RT3000 - Dinka Performance (Livery)
	unlock_packed_bools(31950, 31953) --White Güffy Forwards Cap / White Güffy Backwards Cap, Jester RR - Fuque (Livery), Gray & Yellow Knit Sneakers, ZR350 - Winning is Winning (Livery)
	unlock_packed_bools(31955, 31958) --Navy Karin Hoodie, Warrener HKR - Redwood Racing (Livery), Black Aztec Sleeveless Puffer, Calico GTF - Redwood Rally (Livery)
	unlock_packed_bools(31960, 31963) --Yellow Atomic Retro Racing, Remus - Atomic Motorsport (Livery), Light Vapid Ellie T-Shirt, Dominator GTT - Flame On (Livery)
	unlock_packed_bools(31965, 31968) --Black Aztec Puffer, Tailgater S - Disruption Logistics (Livery), Lucky Penny Print Hoodie, Euros - Sprunk Light (Livery)
	unlock_packed_bools(31970, 31973) --Black Güffy Modern Racing, Futo GTX - Itasha Drift (Livery), Navy Blue Leather Bomber, RT3000 - Shiny Wasabi Kitty (Livery)
	unlock_packed_bools(31975, 31978) --Black Güffy Forwards Cap / Black Güffy Backwards Cap, Jester RR - Xero Gas Rally (Livery), Grayscale Knit Sneakers, ZR350 - Annis Racing Tribal (Livery)
	unlock_packed_bools(31980, 31983) --Light Obey Hoodie, Warrener HKR - Vulcar Turbo (Livery), Cream Splinter Sleeveless Puffer, Calico GTF - Prolaps Rally (Livery)
	unlock_packed_bools(31985, 31988) --Blue Redwood Retro Racing, Remus - Shiny Wasabi Kitty (Livery), Dark Vapid Ellie T-Shirt, Dominator GTT - The Patriot (Livery)
	unlock_packed_bools(31990, 31993) --Cream Splinter Puffer, Tailgater S - Colored Camo Livery (Livery), Light Dinka Modern Racing, Euros - Candybox Gold (Livery)
	unlock_packed_bools(31995, 31998) --Dark Green Leather Bomber, Futo GTX - Stance Andreas (Livery), Hellion Forwards Cap / Hellion Backwards Cap, RT3000 - Total Fire (Livery)
	unlock_packed_bools(32000, 32003) --Gray & Cyan Knit Sneakers, Jester RR - Split Siberia (Livery), Black Ubermacht Hoodie, ZR350 - Annis Racing Tribal Alt (Livery)
	unlock_packed_bools(32005, 32008) --Dark Splinter Sleeveless Puffer, Warrener HKR - Vulcar Turbo Alt (Livery), White Logo Ruiner T-Shirt, Calico GTF - Xero Gas Rally (Livery)
	unlock_packed_bools(32010, 32013) --Dark Splinter Puffer, Remus - Fukaru Motorsport (Livery), Dark Dinka Modern Racing, Dominator GTT - 70s Street Machine (Livery)
	unlock_packed_bools(32015, 32018) --White Leather Bomber, Tailgater S - Army Camo Solid (Livery), Lampadati Forwards Cap / Lampadati Backwards Cap, Lilac Knit Sneakers
	unlock_packed_bools(32020, 32023) --Dark Obey Hoodie, Green Latin Sleeveless Puffer, Gray Vapid Truck T-Shirt, Green Latin Puffer
	unlock_packed_bools(32025, 32028) --Blue Bravado Modern Racing, Red Leather Bomber, White Knit Sneakers, Red Ubermacht Hoodie
	unlock_packed_bools(32030, 32033) --Black Latin Sleeveless Puffer, White Obey Omnis T-Shirt, Black Latin Puffer, Black Bravado Modern Racing
	unlock_packed_bools(32035, 32038) --Ice Knit Sneakers, Blue Annis Noise Hoodie, Orange Camo Sleeveless Puffer, Light Blue Vapid Truck T-Shirt
	unlock_packed_bools(32040, 32043) --Orange Camo Puffer, Imponte Modern Racing, Aqua Sole Knit Sneakers, Green Emperor Modern Hoodie
	unlock_packed_bools(32045, 32048) --Aqua Camo Sleeveless Puffer, Black Vapid USA T-Shirt, Aqua Camo Puffer, Xero Modern Racing
	unlock_packed_bools(32050, 32053) --Smoky Knit Sneakers, Gray Annis Noise Hoodie, Gradient Sleeveless Puffer, Red Obey Omnis T-Shirt
	unlock_packed_bools(32055, 32058) --Gradient Puffer, White & Gold Knit Sneakers, Dark Emperor Modern Hoodie, Red Logo Ruiner T-Shirt
	unlock_packed_bools(32060, 32063) --Orange Knit Sneakers, Light Dinka Hoodie, Blue Bravado Gauntlet T-Shirt, Pink Vibrant Knit Sneakers
	unlock_packed_bools(32065, 32074) --Gold Lampadati Hoodie, Black Bravado Gauntlet T-Shirt, Lime Highlight Knit Sneakers, Dark Dinka Hoodie, Pfister Pocket T-Shirt, Purple Fade Knit Sneakers, Karin 90s T-Shirt, Teal Knit Sneakers, Black & Lime Knit Sneakers, Cyan Fade Knit Sneakers
	unlock_packed_bools(32084, 32084) --Red Highlight Knit Sneakers
	unlock_packed_bools(32094, 32094) --Broker Forwards Cap / Broker Backwards Cap
	unlock_packed_bools(32104, 32104) --Annis Hellion 4x4 T-Shirt
	unlock_packed_bools(32114, 32114) --Pink Gradient Sleeveless Puffer
	unlock_packed_bools(32124, 32124) --Fade Broker Modern Racing
	unlock_packed_bools(32134, 32134) --Tricolor Lampadati Hoodie
	unlock_packed_bools(32144, 32144) --Mono Leather Bomber
	unlock_packed_bools(32154, 32154) --Pink Gradient Puffer
	unlock_packed_bools(32164, 32164) --Red Redwood Retro Racing
	unlock_packed_bools(32174, 32174) --Crash Out Print Hoodie
	unlock_packed_bools(32224, 32224) --Tuned For Speed Racing Suit
	unlock_packed_bools(32319, 32323) --police5 trade price
	unlock_packed_bools(34262, 34361) --LD Organics
	unlock_packed_bools(32273, 32273) --White Born x Raised T-Shirt
	unlock_packed_bools(32275, 32275) --Circoloco T-Shirt
	unlock_packed_bools(32287, 32287) --Dr. Dre
	unlock_packed_bools(32295, 32311) --Orange Goldfish, Purple Goldfish, Bronze Goldfish, Clownfish, Juvenile Gull, Sooty Gull, Black-headed Gull, Herring Gull, Brown Sea Lion, Dark Sea Lion, Spotted Sea Lion, Gray Sea Lion, Green Festive T-Shirt, Red Festive T-Shirt, Orange DJ Pooh T-Shirt, White WCC DJ Pooh T-Shirt, Blue WCC DJ Pooh T-Shirt
	unlock_packed_bools(32315, 32316) --Navy Coveralls, Gray Coveralls, Marathon Hoodie
	unlock_packed_bools(32366, 32366) --Declasse Draugur (Trade Price)
	unlock_packed_bools(32407, 32408) --Bottom Dollar Jacket, The Bottom Dollar
	unlock_packed_bools(34372, 34375) --Horror Pumpkin, Dinka Kanjo SJ (Trade Price), Dinka Postlude (Trade Price), Black LD Organics Cap / White LD Organics T-Shirt
	unlock_packed_bools(34378, 34411) --Junk Energy Chute Bag, Junk Energy Chute, Pumpkin T-Shirt, Pacific Standard Varsity, Pacific Standard Sweater, Cliffford Varsity, Cliffford Hoodie, The Diamond Casino Varsity, The Diamond Strike Vest, Strickler Hat, Sinsimito Cuban Shirt, CLO_E1M_O_MUM, Manor Geo Forwards Cap, Apricot Perseus Forwards Cap, Still Slipping Tie-dye Forwards Cap, Lemon Festive Beer Hat, Bigness Hand-drawn Dome, Grimy Stitched, Pale Stitched, Gray Cracked Puppet, Blushed Cracked Puppet, Green Emissive Lady Liberty, President, Gold Beat Off Earphones, White Spiked Gauntlet (L), Manor Geo Hoodie, Pumpkin Hoodie, LS Smoking Jacket, Hand-Drawn Biker Bomber, Have You Seen Me? Sweater, Still Slipping Tie-dye T-Shirt, Manor Geo Track Pants, Apricot Perseus Track Pants, Sasquatch
	unlock_packed_bools(34415, 34510) --Green Vintage Frank, Brown Vintage Frank, Gray Vintage Frank, Pale Vintage Mummy, Green Vintage Mummy, Weathered Vintage Mummy, Conquest, Death, Famine, War, Black Tech Demon, Gray Tech Demon, White Tech Demon, Green Tech Demon, Orange Tech Demon, Purple Tech Demon, Pink Tech Demon, Red Detail Tech Demon, Blue Detail Tech Demon, Yellow Detail Tech Demon, Green Detail Tech Demon, Pink Detail Tech Demon, Orange & Gray Tech Demon, Red Tech Demon, Camo Tech Demon, Aqua Camo Tech Demon, Brown Digital Tech Demon, Gold Tech Demon, Orange & Cream Tech Demon, Green & Yellow Tech Demon, Pink Floral Tech Demon, Black & Green Tech Demon, White & Red Tech Demon, Carbon Tech Demon, Carbon Teal Tech Demon, Black & White Tech Demon, Painted Tiger, Gray Painted Tiger, Gold Painted Tiger, Ornate Painted Tiger, Gray Yeti Flat Cap, Woodland Yeti Flat Cap, Green FB Flat Cap, Blue FB Flat Cap, Gray Lézard Flat Cap, Green Lézard Flat Cap, Light Plaid Lézard Flat Cap, Dark Plaid Lézard Flat Cap, White Striped Lézard Flat Cap, Red Striped Lézard Flat Cap, Brown Crevis Flat Cap, Gray Crevis Flat Cap, Black Broker Flat Cap, Burgundy Broker Flat Cap, White Beat Off Earphones, Yellow Beat Off Earphones, Salmon Beat Off Earphones, Orange Beat Off Earphones, Purple Beat Off Earphones, Pink Beat Off Earphones, Turquoise Beat Off Earphones, Blue Beat Off Earphones, Black Beat Off Earphones, Gray Beat Off Earphones, Teal Beat Off Earphones, Red Beat Off Earphones, Wild Striped Pool Sliders, Neon Striped Pool Sliders, Black SC Coin Pool Sliders, White SC Coin Pool Sliders, Black SC Pattern Pool Sliders, Pink SC Pattern Pool Sliders, Blue SC Pattern Pool Sliders, Camo Yeti Pool Sliders, Gray Camo Yeti Pool Sliders, Black Bigness Pool Sliders, Purple Bigness Pool Sliders, Camo Bigness Pool Sliders, Black Blagueurs Pool Sliders, White Blagueurs Pool Sliders, Pink Blagueurs Pool Sliders, Gray Cimicino Pool Sliders, Rouge Cimicino Pool Sliders, Navy DS Pool Sliders, Red DS Pool Sliders, Floral Güffy Pool Sliders, Green Güffy Pool Sliders, White Güffy Pool Sliders, Blue Heat Pool Sliders, Red ProLaps Pool Sliders, Black LD Organics T-Shirt, Green UFO Boxer Shorts, White UFO Boxer Shorts, Gray Believe Backwards Cap, Black Believe Backwards Cap, Glow Believe Backwards Cap
	unlock_packed_bools(34703, 34705) --White Vintage Vampire, Dark Green Vintage Vampire, Light Green Vintage Vampire
	unlock_packed_bools(34730, 34737) --Green Festive Beer Hat, Red Snowflake Beer Hat, Blue Snowflake Beer Hat, Red Holly Beer Hat, Pisswasser Festive Beer Hat, Blarneys Festive Beer Hat, Red Reindeer Beer Hat, Borfmas Beer Hat
	unlock_packed_bools(34761, 34761) --Gooch Outfit
	unlock_packed_bools(36630, 36654) --Snowman
	unlock_packed_bools(36699, 36770) --Ice Vinyl, Ice Vinyl Cut, Mustard Vinyl, Mustard Vinyl Cut, Dark Blue Vinyl, Dark Blue Vinyl Cut, Yellow SN Rooster Revere Collar, Red SC Dragon Revere Collar, Blue SC Dragon Revere Collar, Camo Roses Slab Denim, Orange Trickster Type Denim, Black VDG Cardigan, Blue DS Panthers Cardigan, Red DS Panthers Cardigan, Pink SC Baroque Cardigan, Downtown Cab Co. Revere Collar, Valentines Blazer, 420 Smoking Jacket, Yeti Year of the Rabbit T-Shirt, Gray Yeti Combat Shirt, Black Sprunk Festive, Dark Logger Festive, White Logger Festive, Green Logger Festive, Red Logger Festive, Blue Patriot Logo Festive, Black Patriot Logo Festive, Blue Patriot Festive, Red Patriot Festive, Red Pisswasser Festive, Gold Pisswasser Festive, Red Pisswasser Logo Festive, Gold Pisswasser Logo Festive, Green Pride Brew Festive, Yellow Pride Brew Festive, Yellow Holly Pride Festive, White Holly Pride Festive, Sprunk Snowflakes Festive, Broker Checkerboard T-Shirt, Yeti Ape Tucked T-Shirt, Black Bigness Ski, White Bigness Ski, Black Enema Flourish Ski, Teal Enema Flourish Ski, Magenta Enema Flourish Ski, Camo Roses Slab Forwards, Lime Leopard Slab Forwards, Red SC Dragon Embroidered, Classic DS Tiger Embroidered, Gray DS Tiger Embroidered, Black VDG Bandana Wide, Orange Trickster Type Wide, Gray Yeti Battle Pants, Broker Checkerboard Cargos, 420 Smoking Pants, Camo Roses Slab Canvas, Lime Leopard Slab Canvas, White Signs Squash Ugglies & Socks, Traditional Painted Rabbit, Twilight Painted Rabbit, Noh Painted Rabbit, Lime SC Coin Wraps, Pink SC Coin Wraps, Tan Bracelet Ensemble, Red Manor Round Brow Shades, Le Chien Whistle Necklace, Heartbreak Pendant, Rabbit, Budonk-adonk!, The Red-nosed, The Nutcracker, The GoPostal
	unlock_packed_bools(36774, 36788) --Johnny On The Spot Polo, The Gooch Mask, Snowman Outfit, Gold New Year Glasses, Silver New Year Glasses, Rainbow New Year Glasses, Yellow Holly Beer Hat, Green Reindeer Beer Hat, Zebra Dome, Purple Snakeskin Spiked, Manor Surano Jacket, Pistol Mk II - Season's Greetings (Livery), Pump Shotgun - Dildodude Camo (Livery), Micro SMG - Dildodude Camo (Livery)
	unlock_packed_bools(36809, 36809) --Nemesis T-Shirts
	unlock_packed_bools(41316, 41325) --Ghosts Exposed
	unlock_packed_bools(41593, 41593) --The Merryweather Outfit
	unlock_packed_bools(41656, 41659) --Squaddie (Trade Price), Suede Bucks Finish, Employee of the Month Finish, Uncle T Finish
	unlock_packed_bools(41671, 41671) --Manchez Scout (Trade Price)
	unlock_packed_bools(41802, 41802) --Johnny On The Spot Polo
	unlock_packed_bools(41894, 41894) --Hinterland Work T-Shirt
	unlock_packed_bools(41897, 41902) --Love Fist T-Shirt, San Andreas Federal Reserve T-Shirt, Los Santos, San Andreas T-Shirt, Heist Mask T-Shirt, Los Santos Map T-Shirt, PRB T-Shirt
	unlock_packed_bools(41915, 41980) --LS Pounders Cap, Vom Feuer Camo Cap, Western MC Cap, Red & White Ammu-Nation Cap, Santo Capra Cap, Alpine Hat, Alien Tracksuit Pants, Scarlet Vintage Devil Mask, Amber Vintage Devil Mask, Green Vintage Devil Mask, Green Vintage Witch Mask, Yellow Vintage Witch Mask, Orange Vintage Witch Mask, Green Vintage Skull Mask, White Vintage Skull Mask, Brown Vintage Skull Mask, Orange Vintage Werewolf Mask, Blue Vintage Werewolf Mask, Brown Vintage Werewolf Mask, Green Vintage Zombie Mask, Brown Vintage Zombie Mask, Teal Vintage Zombie Mask, Turkey Mask, Royal Calacas Mask, Maritime Calacas Mask, Romance Calacas Mask, Floral Calacas Mask, Stanier LE Cruiser (Trade Price), The Homie, The Retired Criminal, The Groupie, Black SC Ornate Mini Dress, Dark Manor Racing Suit, Bright Manor Racing Suit, Hinterland Bomber Jacket, Red Happy Moon T-Shirt, Black Happy Moon T-Shirt, White Happy Moon T-Shirt, Rockstar Says Relax Tucked T-Shirt, Trevor Heist Mask Tucked T-Shirt, Franklin Heist Mask Tucked T-Shirt, Michael Heist Mask Tucked T-Shirt, Bugstars Tucked T-Shirt, STD Contractors Tucked T-Shirt, Black Los Santos Tucked T-Shirt, San Andreas Republic Tucked T-Shirt, Go Go Space Monkey Tucked T-Shirt, Vom Feuer Camo Tucked T-Shirt, Black SC Ornate Tucked T-Shirt, Warstock Tucked T-Shirt, Western San Andreas Tucked T-Shirt, Ride or Die Tucked T-Shirt, Bourgeoix Tucked T-Shirt, Blêuter'd Tucked T-Shirt, Cherenkov Tucked T-Shirt, Moodymann Portrait Tucked T-Shirt, Rockstar Silver Jubilee Tucked T-Shirt, Rockstar NY Hoodie, Dollar Daggers Hoodie, Merryweather Hoodie, Go Go Space Monkey Hoodie, Rockstar Lion Crest T-Shirt, Ammu-Nation Baseball T-Shirt, Alien Hooded Tracksuit Top, Manor Benefactor Surano T-Shirt, LS Smoking Jacket
	unlock_packed_bools(41994, 41994) --Junk Energy Racing Suit
	unlock_packed_bools(41996, 41996) --??? T-Shirt
	unlock_packed_bools(42054, 42054) --Strapz Bandana
	unlock_packed_bools(42063, 42063) --The LS Panic
	unlock_packed_bools(42068, 42069) --Snowman Finish, Santa's Helper Finish
	unlock_packed_bools(42111, 42111) --The Coast Guard
	unlock_packed_bools(42119, 42123) --Yeti Outfit, Snowman Finish, Santa's Helper Finish, Skull Santa Finish, riot unlocked
	unlock_packed_bools(42125, 42125) --riot trade price
	unlock_packed_bools(42128, 42146) --eCola Festive Sweater, Sprunk Festive Sweater, 1 Party Hat, 2 Party Hat, 3 Party Hat, 4 Party Hat, 5 Party Hat, 6 Party Hat, 7 Party Hat, 8 Party Hat, 9 Party Hat, 10 Party Hat, 11 Party Hat, 12 Party Hat, 13 Party Hat, 14 Party Hat, 15 Party Hat, Bronze Party Outfit, Silver Party Outfit
	unlock_packed_bools(42148, 42149) --Snowball Launcher, DâM-FunK - Even the Score
	unlock_packed_bools(42152, 42190) --The LSDS, The McTony Security, Wooden Dragon Mask, Contrast Dragon Mask, Regal Dragon Mask, Midnight Dragon Mask, Pink Heart Shades, Red Heart Shades, Orange Heart Shades, Yellow Heart Shades, Green Heart Shades, Blue Heart Shades, Purple Heart Shades, Black Heart Shades, Fireworks Bucket Hat, Stars and Stripes Bucket Hat, Lady Liberty Bucket Hat, Green Festive Tree Hat, Red Festive Tree Hat, Brown Festive Reindeer Hat, White Festive Reindeer Hat, Bronze New Year's Hat, Gold New Year's Hat, Silver New Year's Hat, Sprunk x eCola Bodysuit, Rockstar Racing Suit, Rockstar Helmet, Coil Earth Day Tee, IR Earth Day Tee, White High Brass Tee, Black High Brass Tee, Black Lunar New Year Tee, Bigness Carnival Sports Tee, Green 420 Dress, Red Lunar New Year Dress, Carnival Sun Dress, Carnival Bandana, Bigness Carnival Bucket Hat, Black 420 Forwards Cap
	unlock_packed_bools(42217, 42217) --Cluckin' Bell Forwards Cap
	unlock_packed_bools(42233, 42234) --BOXVILLE6, BENSON2
	unlock_packed_bools(42239, 42242) --CAVALCADE3, IMPALER5, POLGAUNTLET, DORADO
	unlock_packed_bools(42244, 42247) --BALLER8, TERMINUS, BOXVILLE6, BENSON2
	unlock_packed_bools(42249, 42249) --Candy Cane
	unlock_packed_bools(42280, 42284) --Unlock pizzaboy, poldominator10, poldorado, polimpaler5, polimpaler6 trade price.
	unlock_packed_bools(42257, 42268) --The Street Artist, Ghosts Exposed 2024, Ghosts Exposed Outfit
	unlock_packed_bools(42286, 42287) --Ludendorff Survivor, Pizza This... Forwards Cap, Pizza This... Backwards Cap, Pizza This... Outfit
	unlock_packed_bools(51189, 51189) -- Spray Can
	unlock_packed_bools(51196, 51197) --The Shocker, Bottom Dollar Bail Enforcement tint for Stungun
	unlock_packed_bools(51215, 51258) --Alpine Outfit, Brown Alpine Hat, Pisswasser Good Time Tee, Gold Pisswasser Shorts, Mid Autumn Festival Shirt, Mid Autumn Festival Sundress (female), Día de Muertos Tee, Halloween Spooky Tee, Black Demon Goat Mask, Red Demon Goat Mask, Tan Demon Goat Mask, Black Creepy Cat Mask, Gray Creepy Cat Mask, Brown Creepy Cat Mask, Gray Hooded Skull Mask, Red Hooded Skull Mask, Blue Hooded Skull Mask, Red Flaming Skull Mask, Green Flaming Skull Mask, Orange Flaming Skull Mask, Orange Glow Skeleton Onesie, Purple Glow Skeleton Onesie, Green Glow Skeleton Onesie, Tan Turkey, Brown Turkey, Rockstar Red Logo Sweater, Silver Gun Necklace, Black Gun Necklace, Gold Gun Necklace, Rose Gun Necklace, Bronze Gun Necklace, Black Yeti Fall Sweater, White Yeti Fall Sweater, Red Yeti Fall Sweater, The Diamond Jackpot Tee, Cobalt Jackal Racing Jersey, Cobalt Jackal Racing Pants, Khaki 247 Chino Pants, Demon Biker Jacket, Purple Güffy Cardigan, SA Denim Biker Jacket, Green 247 Shirt, Barbed Wire Shirt, Ride or Die Gaiter, Pizza This... Tee
	if is_player_male then
		unlock_packed_bools(3483, 3492) --Death Defying T-Shirt (Male), For Hire T-Shirt (Male), Gimme That T-Shirt (Male), Asshole T-Shirt (Male), Can't Touch This T-Shirt (Male), Decorated T-Shirt (Male), Psycho Killer T-Shirt (Male), One Man Army T-Shirt (Male), Shot Caller T-Shirt (Male), Showroom T-Shirt (Male)
		unlock_packed_bools(6082, 6083) --Black Benny's T-Shirt, White Benny's T-Shirt
		unlock_packed_bools(6097, 6097) --I Heart LC (T-Shirt) (Male)
		unlock_packed_bools(6169, 6169) --DCTL T-Shirt (Male)
		unlock_packed_bools(6303, 6304) --Crosswalk Tee (Male), R* Crosswalk Tee (Male)
		unlock_packed_bools(15708, 15708) --Black The Black Madonna Emb. Tee (Male)
		unlock_packed_bools(15710, 15710) --The Black Madonna Star Tee (Male)
		unlock_packed_bools(15717, 15717) --White Dixon Repeated Logo Tee (Male)
		unlock_packed_bools(15720, 15720) --Black Dixon Wilderness Tee (Male)
		unlock_packed_bools(15724, 15724) --Tale Of Us Black Box Tee (Male)
		unlock_packed_bools(15728, 15728) --Black Tale Of Us Emb. Tee (Male)
		unlock_packed_bools(15730, 15730) --Black Solomun Yellow Logo Tee (Male)
		unlock_packed_bools(15732, 15732) --White Solomun Tee (Male)
		unlock_packed_bools(15737, 15737) --??? (Tattoo) (Male)
		unlock_packed_bools(15887, 15887) --Lucky 7s (Tattoo) (Male)
		unlock_packed_bools(15894, 15894) --The Royals (Tattoo) (Male)
		unlock_packed_bools(28393, 28416) --Badlands Revenge II Retro Tee (Male), Badlands Revenge II Pixtro Tee (Male), Degenatron Glitch Tee (Male), Degenatron Logo Tee (Male), The Wizard's Ruin Rescue Tee (Male), The Wizard's Ruin Vow Tee (Male), Space Monkey Art Tee (Male), Crotch Rockets Tee (Male), Street Legal Tee (Male), Get Truckin' Tee (Male), Arcade Trophy Tee (Male), Videogeddon Tee (Male), Insert Coin Tee (Male), Plushie Princess Tee (Male), Plushie Wasabi Kitty Tee (Male), Plushie Master Tee (Male), Plushie Muffy Tee (Male), Plushie Humpy Tee (Male), Plushie Saki Tee (Male), Plushie Grindy Tee (Male), Plushie Poopie Tee (Male), Plushie Smoker Tee (Male), Shiny Wasabi Kitty Claw Tee (Male), Nazar Speaks Tee (Male)
		unlock_packed_bools(28447, 28451) --11 11 Tee (Male), King Of QUB3D Tee (Male), Qubism Tee (Male), God Of QUB3D Tee (Male), QUB3D Boxart Tee (Male)
		unlock_packed_bools(28452, 28478) --Channel X Aged Tee (Male), Rebel Radio Aged Tee (Male), LSUR Aged Tee (Male), Steel Horse Solid Logo Aged Tee (Male), Black Western Logo Aged Tee (Male), White Nagasaki Aged Tee (Male), Black Principe Aged Tee (Male), Albany Vintage Aged Tee (Male), Benefactor Aged Tee (Male), Bravado Aged Tee (Male), Declasse Aged Tee (Male), Dinka Aged Tee (Male), Grotti Aged Tee (Male), Lampadati Aged Tee (Male), Ocelot Aged Tee (Male), Overflod Aged Tee (Male), Pegassi Aged Tee (Male), Pfister Aged Tee (Male), Vapid Aged Tee (Male), Weeny Aged Tee (Male), Toe Shoes Aged T-Shirt (Male), Vanilla Unicorn Aged T-Shirt (Male), Fake Vapid Aged T-Shirt (Male), I Married My Dad Aged T-Shirt (Male), White Rockstar Camo Aged Tee (Male), Razor Aged T-Shirt (Male), Noise Rockstar Logo Aged Tee (Male)
		unlock_packed_bools(30355, 30361) --Noise Aged Tee (Male), Emotion 98.3 Aged T-Shirt (Male), KDST Aged T-Shirt (Male), KJAH Radio Aged T-Shirt (Male), Bounce FM Aged T-Shirt (Male), K-Rose Aged T-Shirt (Male), Blue The Diamond Resort LS Aged Tee (Male)
		unlock_packed_bools(30407, 30410) --White Keinemusik Tee (Male), Blue Keinemusik Tee (Male), Moodymann Tee (Male), Palms Trax Tee (Male)
		unlock_packed_bools(30418, 30422) --Faces of Death Tee (Male), Straight to Video Tee (Male), Monkey See Monkey Die Tee (Male), Trained to Kill Tee (Male), The Director Tee (Male)
		unlock_packed_bools(41273, 41284) --Monkey (Tattoo) (Male), Dragon (Tattoo) (Male), Snake (Tattoo) (Male), Goat (Tattoo) (Male), Rat (Tattoo) (Male), Rabbit (Tattoo) (Male), Ox (Tattoo) (Male), Pig (Tattoo) (Male), Rooster (Tattoo) (Male), Dog (Tattoo) (Male), Horse (Tattoo) (Male), Tiger (Tattoo) (Male)
		unlock_packed_bools(41293, 41293) --Hinterland Work T-Shirt (Male)
	else
		unlock_packed_bools(3496, 3505) --Death Defying Top (Female), For Hire Top (Female), Gimme That Top (Female), Asshole Top (Female), Can't Touch This Top (Female), Decorated Top (Female), Psycho Killer Top (Female), One Man Army Top (Female), Shot Caller Top (Female), Showroom Top (Female)
		unlock_packed_bools(6091, 6092) --Black Benny's T-Shirt, White Benny's T-Shirt
		unlock_packed_bools(6106, 6106) --I Heart LC (T-Shirt) (Female)
		unlock_packed_bools(6181, 6181) --DCTL T-Shirt (Female)
		unlock_packed_bools(6316, 6317) --Crosswalk Tee (Female), R* Crosswalk Tee (Female)
		unlock_packed_bools(15719, 15719) --Black The Black Madonna Emb. Tee (Female)
		unlock_packed_bools(15721, 15721) --The Black Madonna Star Tee (Female)
		unlock_packed_bools(15728, 15728) --White Dixon Repeated Logo Tee (Female)
		unlock_packed_bools(15731, 15731) --Black Dixon Wilderness Tee (Female)
		unlock_packed_bools(15735, 15735) --Tale Of Us Black Box Tee (Female)
		unlock_packed_bools(15739, 15739) --Black Tale Of Us Emb. Tee (Female)
		unlock_packed_bools(15741, 15741) --Black Solomun Yellow Logo Tee (Female)
		unlock_packed_bools(15743, 15743) --White Solomun Tee (Female)
		unlock_packed_bools(15748, 15748) --??? (Tattoo) (Female)
		unlock_packed_bools(15898, 15898) --Lucky 7s (Tattoo) (Female)
		unlock_packed_bools(15905, 15905) --The Royals (Tattoo) (Female)
		unlock_packed_bools(28404, 28427) --Badlands Revenge II Retro Tee (Female), Badlands Revenge II Pixtro Tee (Female), Degenatron Glitch Tee (Female), Degenatron Logo Tee (Female), The Wizard's Ruin Rescue Tee (Female), The Wizard's Ruin Vow Tee (Female), Space Monkey Art Tee (Female), Crotch Rockets Tee (Female), Street Legal Tee (Female), Get Truckin' Tee (Female), Arcade Trophy Tee (Female), Videogeddon Tee (Female), Insert Coin Tee (Female), Plushie Princess Tee (Female), Plushie Wasabi Kitty Tee (Female), Plushie Master Tee (Female), Plushie Muffy Tee (Female), Plushie Humpy Tee (Female), Plushie Saki Tee (Female), Plushie Grindy Tee (Female), Plushie Poopie Tee (Female), Plushie Smoker Tee (Female), Shiny Wasabi Kitty Claw Tee (Female), Nazar Speaks Tee (Female)
		unlock_packed_bools(28458, 28462) --11 11 Tee (Female), King Of QUB3D Tee (Female), Qubism Tee (Female), God Of QUB3D Tee (Female), QUB3D Boxart Tee (Female)
		unlock_packed_bools(28463, 28478) --Channel X Aged Tee (Female), Rebel Radio Aged Tee (Female), LSUR Aged Tee (Female), Steel Horse Solid Logo Aged Tee (Female), Black Western Logo Aged Tee (Female), White Nagasaki Aged Tee (Female), Black Principe Aged Tee (Female), Albany Vintage Aged Tee (Female), Benefactor Aged Tee (Female), Bravado Aged Tee (Female), Declasse Aged Tee (Female), Dinka Aged Tee (Female), Grotti Aged Tee (Female), Lampadati Aged Tee (Female), Ocelot Aged Tee (Female), Overflod Aged Tee (Female)
		unlock_packed_bools(30418, 30421) --White Keinemusik Tee (Female), Blue Keinemusik Tee (Female), Moodymann Tee (Female), Palms Trax Tee (Female)
		unlock_packed_bools(30355, 30372) --Pegassi Aged Tee (Female), Pfister Aged Tee (Female), Vapid Aged Tee (Female), Weeny Aged Tee (Female), Toe Shoes Aged T-Shirt (Female), Vanilla Unicorn Aged T-Shirt (Female), Fake Vapid Aged T-Shirt (Female), I Married My Dad Aged T-Shirt (Female), White Rockstar Camo Aged Tee (Female), Razor Aged T-Shirt (Female), Noise Rockstar Logo Aged Tee (Female), Noise Aged Tee (Female), Emotion 98.3 Aged T-Shirt (Female), KDST Aged T-Shirt (Female), KJAH Radio Aged T-Shirt (Female), Bounce FM Aged T-Shirt (Female), K-Rose Aged T-Shirt (Female), Blue The Diamond Resort LS Aged Tee (Female)
		unlock_packed_bools(30429, 30433) --Faces of Death Tee (Female), Straight to Video Tee (Female), Monkey See Monkey Die Tee (Female), Trained to Kill Tee (Female), The Director Tee (Female)
		unlock_packed_bools(41285, 41296) --Monkey (Tattoo) (Female), Dragon (Tattoo) (Female), Snake (Tattoo) (Female), Goat (Tattoo) (Female), Rat (Tattoo) (Female), Rabbit (Tattoo) (Female), Ox (Tattoo) (Female), Pig (Tattoo) (Female), Rooster (Tattoo) (Female), Dog (Tattoo) (Female), Horse (Tattoo) (Female), Tiger (Tattoo) (Female)
		unlock_packed_bools(41304, 41304) --Hinterland Work T-Shirt (Female)
	end
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 240)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", 229378)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 240)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", 229378)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", 16368)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", 229380)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
	stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
	stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
	stats.set_int(MPX() .. "FIXER_STORY_BS", -1)
	stats.set_int(MPX() .. "FIXER_STORY_STRAND", -1)
	stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
	stats.set_int(MPX() .. "FIXER_SC_VEH_RECOVERED", 100)
	stats.set_int(MPX() .. "FIXER_SC_VAL_RECOVERED", 100)
	stats.set_int(MPX() .. "FIXER_SC_GANG_TERMINATED", 100)
	stats.set_int(MPX() .. "FIXER_SC_VIP_RESCUED", 100)
	stats.set_int(MPX() .. "FIXER_SC_ASSETS_PROTECTED", 100)
	stats.set_int(MPX() .. "FIXER_SC_EQ_DESTROYED", 100)
	stats.set_int(MPX() .. "FIXER_COUNT", 500)
	stats.set_int(MPX() .. "FIXER_EARNINGS", 26340756)
	stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", -1)
	stats.set_int("MPPLY_XMASLIVERIES0", -1)
	stats.set_int("MPPLY_XMASLIVERIES1", -1)
	stats.set_int("MPPLY_XMASLIVERIES2", -1)
	stats.set_int("MPPLY_XMASLIVERIES3", -1)
	stats.set_int("MPPLY_XMASLIVERIES5", -1)
	stats.set_int("MPPLY_XMASLIVERIES6", -1)
	stats.set_int("MPPLY_XMASLIVERIES7", -1)
	stats.set_int("MPPLY_XMASLIVERIES8", -1)
	stats.set_int("MPPLY_XMASLIVERIES9", -1)
	stats.set_int("MPPLY_XMASLIVERIES10", -1)
	stats.set_int("MPPLY_XMASLIVERIES11", -1)
	stats.set_int("MPPLY_XMASLIVERIES12", -1)
	stats.set_int("MPPLY_XMASLIVERIES13", -1)
	stats.set_int("MPPLY_XMASLIVERIES14", -1)
	stats.set_int("MPPLY_XMASLIVERIES15", -1)
	stats.set_int("MPPLY_XMASLIVERIES16", -1)
	stats.set_int("MPPLY_XMASLIVERIES17", -1)
	stats.set_int("MPPLY_XMASLIVERIES18", -1)
	stats.set_int("MPPLY_XMASLIVERIES19", -1)
	stats.set_int("MPPLY_XMASLIVERIES20", -1)
	stats.set_int(MPX() .. "AWD_WATCH_YOUR_STEP", 15)
	stats.set_int(MPX() .. "AWD_TOWER_OFFENSE", 15)
	stats.set_int(MPX() .. "AWD_READY_FOR_WAR", 60)
	stats.set_int(MPX() .. "AWD_THROUGH_A_LENS", 60)
	stats.set_int(MPX() .. "AWD_SPINNER", 60)
	stats.set_int(MPX() .. "AWD_YOUMEANBOOBYTRAPS", 15)
	stats.set_int(MPX() .. "AWD_MASTER_BANDITO", 12)
	stats.set_int(MPX() .. "AWD_SITTING_DUCK", 60)
	stats.set_int(MPX() .. "AWD_CROWDPARTICIPATION", 60)
	stats.set_int(MPX() .. "AWD_KILL_OR_BE_KILLED", 60)
	stats.set_int(MPX() .. "AWD_MASSIVE_SHUNT", 60)
	stats.set_int(MPX() .. "AWD_YOURE_OUTTA_HERE", 110)
	stats.set_int(MPX() .. "AWD_WEVE_GOT_ONE", 52)
	stats.set_int(MPX() .. "AWD_TIME_SERVED", 110)
	stats.set_int(MPX() .. "AWD_CAREER_WINNER", 110)
	stats.set_int(MPX() .. "AWD_ARENA_WAGEWORKER", 1100000)
	stats.set_int(MPX() .. "CH_ARC_CAB_CLAW_TROPHY", -1)
	stats.set_int(MPX() .. "CH_ARC_CAB_LOVE_TROPHY", -1)
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
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_0", 50)
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_1", 50)
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_2", 50)
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_3", 50)
	stats.set_int(MPX() .. "IAP_MA0_MOON_DIST", 2147483647)
	stats.set_int(MPX() .. "AWD_FACES_OF_DEATH", 50)
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS5", 50000000)
	stats.set_int(MPX() .. "VCM_FLOW_PROGRESS", -1)
	stats.set_int(MPX() .. "VCM_STORY_PROGRESS", -1)
	stats.set_int(MPX() .. "MKRIFLE_MK2_KILLS", 500)
	stats.set_int(MPX() .. "MKRIFLE_MK2_DEATHS", 100)
	stats.set_int(MPX() .. "MKRIFLE_MK2_SHOTS", 500)
	stats.set_int(MPX() .. "MKRIFLE_MK2_HITS", 500)
	stats.set_int(MPX() .. "MKRIFLE_MK2_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MKRIFLE_MK2_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MKRIFLE_MK2_DB_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MKRIFLE_MK2_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "AWD_ODD_JOBS", 52)
	stats.set_int(MPX() .. "AWD_PREPARATION", 50)
	stats.set_int(MPX() .. "AWD_ASLEEPONJOB", 20)
	stats.set_int(MPX() .. "AWD_DAICASHCRAB", 100000)
	stats.set_int(MPX() .. "AWD_BIGBRO", 40)
	stats.set_int(MPX() .. "HIGHEST_SKITTLES", 900)
	stats.set_int(MPX() .. "NUMBER_NEAR_MISS", 1000)
	stats.set_int(MPX() .. "LAP_DANCED_BOUGHT", 100)
	stats.set_int(MPX() .. "CARS_EXPLODED", 500)
	stats.set_int(MPX() .. "CARS_COPS_EXPLODED", 300)
	stats.set_int(MPX() .. "BIKES_EXPLODED", 100)
	stats.set_int(MPX() .. "BOATS_EXPLODED", 168)
	stats.set_int(MPX() .. "HELIS_EXPLODED", 98)
	stats.set_int(MPX() .. "PLANES_EXPLODED", 138)
	stats.set_int(MPX() .. "QUADBIKE_EXPLODED", 50)
	stats.set_int(MPX() .. "BICYCLE_EXPLODED", 48)
	stats.set_int(MPX() .. "SUBMARINE_EXPLODED", 28)
	stats.set_int(MPX() .. "DEATHS", 499)
	stats.set_int(MPX() .. "DIED_IN_DROWNING", 833)
	stats.set_int(MPX() .. "DIED_IN_DROWNINGINVEHICLE", 833)
	stats.set_int(MPX() .. "DIED_IN_EXPLOSION", 833)
	stats.set_int(MPX() .. "DIED_IN_FALL", 833)
	stats.set_int(MPX() .. "DIED_IN_FIRE", 833)
	stats.set_int(MPX() .. "DIED_IN_ROAD", 833)
	stats.set_int(MPX() .. "NO_PHOTOS_TAKEN", 100)
	stats.set_int(MPX() .. "PROSTITUTES_FREQUENTED", 100)
	stats.set_int(MPX() .. "BOUNTSONU", 200)
	stats.set_int(MPX() .. "BOUNTPLACED", 500)
	stats.set_int(MPX() .. "PASS_DB_KILLS", 300)
	stats.set_int(MPX() .. "PASS_DB_PLAYER_KILLS", 300)
	stats.set_int(MPX() .. "PASS_DB_SHOTS", 300)
	stats.set_int(MPX() .. "PASS_DB_HITS", 300)
	stats.set_int(MPX() .. "PASS_DB_HITS_PEDS_VEHICLES", 300)
	stats.set_int(MPX() .. "PASS_DB_HEADSHOTS", 300)
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
	stats.set_int(MPX() .. "FAVOUTFITBIKETIMECURRENT", 884483972)
	stats.set_int(MPX() .. "FAVOUTFITBIKETIME1ALLTIME", 884483972)
	stats.set_int(MPX() .. "FAVOUTFITBIKETYPECURRENT", 884483972)
	stats.set_int(MPX() .. "FAVOUTFITBIKETYPEALLTIME", 884483972)
	stats.set_int(MPX() .. "MC_CONTRIBUTION_POINTS", 1000)
	stats.set_int(MPX() .. "MEMBERSMARKEDFORDEATH", 700)
	stats.set_int(MPX() .. "MCKILLS", 500)
	stats.set_int(MPX() .. "MCDEATHS", 700)
	stats.set_int(MPX() .. "RIVALPRESIDENTKILLS", 700)
	stats.set_int(MPX() .. "RIVALCEOANDVIPKILLS", 700)
	stats.set_int(MPX() .. "MELEEKILLS", 700)
	stats.set_int(MPX() .. "CLUBHOUSECONTRACTSCOMPLETE", 700)
	stats.set_int(MPX() .. "CLUBHOUSECONTRACTEARNINGS", 32698547)
	stats.set_int(MPX() .. "CLUBCHALLENGESCOMPLETED", 700)
	stats.set_int(MPX() .. "MEMBERCHALLENGESCOMPLETED", 700)
	stats.set_int(MPX() .. "HITS", 100000)
	stats.set_int(MPX() .. "MKRIFLE_KILLS", 500)
	stats.set_int(MPX() .. "MKRIFLE_DEATHS", 100)
	stats.set_int(MPX() .. "MKRIFLE_SHOTS", 500)
	stats.set_int(MPX() .. "MKRIFLE_HITS", 500)
	stats.set_int(MPX() .. "MKRIFLE_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MKRIFLE_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MKRIFLE_DB_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MKRIFLE_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BETAMOUNT", 500)
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
	stats.set_int(MPX() .. "KILLS_ENEMY_GANG_MEMBERS", 100)
	stats.set_int(MPX() .. "KILLS_FRIENDLY_GANG_MEMBERS", 100)
	stats.set_int(MPX() .. "KILLS_BY_OTHERS", 100)
	stats.set_int(MPX() .. "HITS", 600)
	stats.set_int(MPX() .. "BIGGEST_VICTIM_KILLS", 500)
	stats.set_int(MPX() .. "ARCHENEMY_KILLS", 500)
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
	stats.set_int(MPX() .. "TOTAL_TIME_CINEMA", 2147483647)
	stats.set_int(MPX() .. "NO_TIMES_CINEMA", 500)
	stats.set_int(MPX() .. "TIME_AS_A_PASSENGER", 2147483647)
	stats.set_int(MPX() .. "TIME_AS_A_DRIVER", 2147483647)
	stats.set_int(MPX() .. "TIME_SPENT_FLYING", 2147483647)
	stats.set_int(MPX() .. "TIME_IN_CAR", 2147483647)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_UNDERTABC", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_COMPLETBC", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S1_0", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S2_0", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S3_0", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_UNDERTA1", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_COMPLET1", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_UNDERTA1", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_COMPLET1", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC1", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC1", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S1_1", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S2_1", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S3_1", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_UNDERTA2", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_COMPLET2", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_UNDERTA2", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_COMPLET2", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC2", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC2", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S1_2", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S2_2", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S3_2", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_UNDERTA3", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_COMPLET3", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_UNDERTA3", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_COMPLET3", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC3", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC3", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S1_3", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S2_3", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S3_3", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_UNDERTA4", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_COMPLET4", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_UNDERTA4", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_COMPLET4", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC4", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC4", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S1_4", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S2_4", 500)
	stats.set_int(MPX() .. "BKR_PROD_STOP_COUT_S3_4", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_UNDERTA5", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_COMPLET5", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC5", 500)
	stats.set_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC5", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_UNDERTA5", 500)
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_COMPLET5", 500)
	stats.set_int(MPX() .. "BUNKER_UNITS_MANUFAC", 500)
	stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_UNDETAK", 500)
	stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_COMPLET", 500)
	stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_UNDETAK", 500)
	stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_COMPLET", 500)
	stats.set_int(MPX() .. "LFETIME_HANGAR_EARNINGS", 29654123)
	stats.set_int(MPX() .. "LFETIME_HANGAR_EARN_BONUS", 15987456)
	stats.set_int(MPX() .. "RIVAL_HANGAR_CRATES_STOLEN", 500)
	stats.set_int(MPX() .. "LFETIME_IE_STEAL_STARTED", 500)
	stats.set_int(MPX() .. "LFETIME_IE_EXPORT_STARTED", 500)
	stats.set_int(MPX() .. "LFETIME_IE_EXPORT_COMPLETED", 500)
	stats.set_int(MPX() .. "LFETIME_IE_MISSION_EARNINGS", 59654897)
	stats.set_int(MPX() .. "AT_FLOW_IMPEXP_NUM", 500)
	stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
	stats.set_int(MPX() .. "NIGHTCLUB_VIP_APPEAR", 300)
	stats.set_int(MPX() .. "NIGHTCLUB_JOBS_DONE", 500)
	stats.set_int(MPX() .. "NIGHTCLUB_EARNINGS", 39856412)
	stats.set_int(MPX() .. "HUB_SALES_COMPLETED", 500)
	stats.set_int(MPX() .. "HUB_EARNINGS", 29865423)
	stats.set_int(MPX() .. "DANCE_COMBO_DURATION_MINS", 86400000)
	stats.set_int(MPX() .. "NIGHTCLUB_PLAYER_APPEAR", 500)
	stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_SOLD", 500)
	stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_MADE", 500)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_1", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_10", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_11", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_12", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_2", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_3", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_4", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_5", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_6", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_7", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_8", -1)
	stats.set_int(MPX() .. "ADMIN_CLOTHES_GV_BS_9", -1)
	stats.set_int(MPX() .. "ADMIN_WEAPON_GV_BS_1", -1)
	stats.set_int(MPX() .. "AIR_LAUNCHES_OVER_40M", 25)
	stats.set_int(MPX() .. "AWD_5STAR_WANTED_AVOIDANCE", 50)
	stats.set_int(MPX() .. "AWD_CAR_BOMBS_ENEMY_KILLS", 25)
	stats.set_int(MPX() .. "AWD_CARS_EXPORTED", 50)
	stats.set_int(MPX() .. "AWD_CONTROL_CROWDS", 25)
	stats.set_int(MPX() .. "AWD_DAILYOBJCOMPLETED", 100)
	stats.set_int(MPX() .. "AWD_DO_HEIST_AS_MEMBER", 25)
	stats.set_int(MPX() .. "AWD_DO_HEIST_AS_THE_LEADER", 25)
	stats.set_int(MPX() .. "AWD_DROPOFF_CAP_PACKAGES", 100)
	stats.set_int(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
	stats.set_int(MPX() .. "AWD_FINISH_HEISTS", 50)
	stats.set_int(MPX() .. "AWD_FM_DM_3KILLSAMEGUY", 50)
	stats.set_int(MPX() .. "AWD_FM_DM_KILLSTREAK", 100)
	stats.set_int(MPX() .. "AWD_FM_DM_STOLENKILL", 50)
	stats.set_int(MPX() .. "AWD_FM_DM_TOTALKILLS", 500)
	stats.set_int(MPX() .. "AWD_FM_DM_WINS", 50)
	stats.set_int(MPX() .. "AWD_FM_GOLF_HOLE_IN_1", 300)
	stats.set_int(MPX() .. "AWD_FM_GOLF_BIRDIES", 25)
	stats.set_int(MPX() .. "AWD_FM_GOLF_WON", 25)
	stats.set_int(MPX() .. "AWD_FM_GTA_RACES_WON", 50)
	stats.set_int(MPX() .. "AWD_FM_RACE_LAST_FIRST", 25)
	stats.set_int(MPX() .. "AWD_FM_RACES_FASTEST_LAP", 50)
	stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_CT_WON", 25)
	stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_RT_WON", 25)
	stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_TG_WON", 25)
	stats.set_int(MPX() .. "AWD_FM_TDM_MVP", 50)
	stats.set_int(MPX() .. "AWD_FM_TDM_WINS", 50)
	stats.set_int(MPX() .. "AWD_FM_TENNIS_ACE", 25)
	stats.set_int(MPX() .. "AWD_FM_TENNIS_WON", 25)
	stats.set_int(MPX() .. "AWD_FMBASEJMP", 25)
	stats.set_int(MPX() .. "AWD_FMBBETWIN", 50000)
	stats.set_int(MPX() .. "AWD_FMCRATEDROPS", 25)
	stats.set_int(MPX() .. "AWD_FMDRIVEWITHOUTCRASH", 30)
	stats.set_int(MPX() .. "AWD_FMHORDWAVESSURVIVE", 10)
	stats.set_int(MPX() .. "AWD_FMKILLBOUNTY", 25)
	stats.set_int(MPX() .. "AWD_FMRALLYWONDRIVE", 25)
	stats.set_int(MPX() .. "AWD_FMRALLYWONNAV", 25)
	stats.set_int(MPX() .. "AWD_FMREVENGEKILLSD", 50)
	stats.set_int(MPX() .. "AWD_FMSHOOTDOWNCOPHELI", 25)
	stats.set_int(MPX() .. "AWD_FMWINAIRRACE", 25)
	stats.set_int(MPX() .. "AWD_FMWINRACETOPOINTS", 25)
	stats.set_int(MPX() .. "AWD_FMWINSEARACE", 25)
	stats.set_int(MPX() .. "AWD_HOLD_UP_SHOPS", 20)
	stats.set_int(MPX() .. "AWD_KILL_CARRIER_CAPTURE", 100)
	stats.set_int(MPX() .. "AWD_KILL_PSYCHOPATHS", 100)
	stats.set_int(MPX() .. "AWD_KILL_TEAM_YOURSELF_LTS", 25)
	stats.set_int(MPX() .. "AWD_LAPDANCES", 25)
	stats.set_int(MPX() .. "AWD_LESTERDELIVERVEHICLES", 25)
	stats.set_int(MPX() .. "AWD_MENTALSTATE_TO_NORMAL", 50)
	stats.set_int(MPX() .. "AWD_NIGHTVISION_KILLS", 100)
	stats.set_int(MPX() .. "AWD_NO_HAIRCUTS", 25)
	stats.set_int(MPX() .. "AWD_ODISTRACTCOPSNOEATH", 25)
	stats.set_int(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
	stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_20M", 25)
	stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_50M", 25)
	stats.set_int(MPX() .. "AWD_PASSENGERTIME", 4)
	stats.set_int(MPX() .. "AWD_PICKUP_CAP_PACKAGES", 100)
	stats.set_int(MPX() .. "AWD_RACES_WON", 50)
	stats.set_int(MPX() .. "AWD_SECURITY_CARS_ROBBED", 25)
	stats.set_int(MPX() .. "AWD_TAKEDOWNSMUGPLANE", 50)
	stats.set_int(MPX() .. "AWD_TIME_IN_HELICOPTER", 4)
	stats.set_int(MPX() .. "AWD_TRADE_IN_YOUR_PROPERTY", 25)
	stats.set_int(MPX() .. "AWD_VEHICLES_JACKEDR", 500)
	stats.set_int(MPX() .. "AWD_WIN_AT_DARTS", 25)
	stats.set_int(MPX() .. "AWD_WIN_CAPTURE_DONT_DYING", 25)
	stats.set_int(MPX() .. "AWD_WIN_CAPTURES", 50)
	stats.set_int(MPX() .. "AWD_WIN_GOLD_MEDAL_HEISTS", 25)
	stats.set_int(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
	stats.set_int(MPX() .. "BOTTLE_IN_POSSESSION", -1)
	stats.set_int(MPX() .. "CHAR_FM_CARMOD_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CARMOD_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CARMOD_3_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CARMOD_4_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CARMOD_5_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CARMOD_6_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CARMOD_7_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_VEHICLE_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_VEHICLE_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_3_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_4_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_5_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED2", -1)
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
	stats.set_int(MPX() .. "CHAR_KIT_13_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_14_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_15_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_16_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_17_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_18_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_19_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_20_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_21_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_22_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_23_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_24_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_25_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_26_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_27_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_28_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_29_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_30_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_30_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_31_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_32_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_33_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_34_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_35_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_36_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_37_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_38_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_39_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_40_FM_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_KIT_41_FM_UNLCK", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_0", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_1", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_2", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_3", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_4", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_5", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_6", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_7", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_8", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_9", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_10", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_11", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_12", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_13", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_14", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_15", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_16", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_17", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_18", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_19", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_20", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_21", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_22", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_23", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_24", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_25", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_26", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_27", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_28", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_29", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_30", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_31", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_32", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_33", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_34", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_35", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_36", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_37", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_38", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_39", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_40", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_41", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_42", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_43", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_44", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_45", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_46", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_47", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_48", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_49", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_50", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_51", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_52", -1)
	stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_53", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE10", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE11", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE12", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE2", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE3", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE4", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE5", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE6", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE7", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE8", -1)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE9", -1)
	stats.set_int(MPX() .. "CHAR_WANTED_LEVEL_TIME5STAR", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_BERD", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_BERD_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_BERD_2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_BERD_3", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_BERD_4", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_BERD_5", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_BERD_6", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_DECL", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET_2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET_3", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET_4", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET_5", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET_6", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_FEET_7", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB_2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB_3", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB_4", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB_5", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB_6", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_JBIB_7", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS_2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS_3", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS_4", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS_5", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS_6", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_LEGS_7", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_OUTFIT", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_10", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_3", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_4", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_5", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_6", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_7", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_8", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_PROPS_9", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL2_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL_2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL_3", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL_4", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL_5", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL_6", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_SPECIAL_7", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_TEETH", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_TEETH_1", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_TEETH_2", -1)
	stats.set_int(MPX() .. "CLTHS_ACQUIRED_TORSO", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD_2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD_3", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD_4", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD_5", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD_6", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_BERD_7", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_DECL", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET_2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET_3", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET_4", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET_5", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET_6", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_FEET_7", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR_2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR_3", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR_4", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR_5", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR_6", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_HAIR_7", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB_2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB_3", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB_4", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB_5", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB_6", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_JBIB_7", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS_2", -1)
	stats.set_int(MPX() .. "CHAR_CREWUNLOCK_1_FM_EQUIP", -1)
	stats.set_int(MPX() .. "CHAR_CREWUNLOCK_2_FM_EQUIP", -1)
	stats.set_int(MPX() .. "CHAR_CREWUNLOCK_3_FM_EQUIP", -1)
	stats.set_int(MPX() .. "CHAR_CREWUNLOCK_4_FM_EQUIP", -1)
	stats.set_int(MPX() .. "CHAR_CREWUNLOCK_5_FM_EQUIP", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_3_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_4_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_5_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_6_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_7_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_8_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_9_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_10_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_CLOTHES_11_UNLCK", -1)
	stats.set_int(MPX() .. "SAVESTRA_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SAVESTRA_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STROMBERG_MG_KILLS", 500)
	stats.set_int(MPX() .. "STROMBERG_MG_DEATHS", 100)
	stats.set_int(MPX() .. "STROMBERG_MG_SHOTS", 500)
	stats.set_int(MPX() .. "STROMBERG_MG_HITS", 500)
	stats.set_int(MPX() .. "STROMBERG_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "STROMBERG_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STROMBERG_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STROMBERG_MISS_KILLS", 500)
	stats.set_int(MPX() .. "STROMBERG_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "STROMBERG_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "STROMBERG_MISS_HITS", 500)
	stats.set_int(MPX() .. "STROMBERG_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STROMBERG_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STROMBERG_TORP_KILLS", 500)
	stats.set_int(MPX() .. "STROMBERG_TORP_DEATHS", 100)
	stats.set_int(MPX() .. "STROMBERG_TORP_SHOTS", 500)
	stats.set_int(MPX() .. "STROMBERG_TORP_HITS", 500)
	stats.set_int(MPX() .. "STROMBERG_TORP_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STROMBERG_TORP_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "THRUSTER_MG_KILLS", 500)
	stats.set_int(MPX() .. "THRUSTER_MG_DEATHS", 100)
	stats.set_int(MPX() .. "THRUSTER_MG_SHOTS", 500)
	stats.set_int(MPX() .. "THRUSTER_MG_HITS", 500)
	stats.set_int(MPX() .. "THRUSTER_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "THRUSTER_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "THRUSTER_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "THRUSTER_MISS_KILLS", 500)
	stats.set_int(MPX() .. "THRUSTER_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "THRUSTER_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "THRUSTER_MISS_HITS", 500)
	stats.set_int(MPX() .. "THRUSTER_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "THRUSTER_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VISERIS_MG_KILLS", 500)
	stats.set_int(MPX() .. "VISERIS_MG_DEATHS", 100)
	stats.set_int(MPX() .. "VISERIS_MG_SHOTS", 500)
	stats.set_int(MPX() .. "VISERIS_MG_HITS", 500)
	stats.set_int(MPX() .. "VISERIS_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "VISERIS_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "VISERIS_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VOLATOL_MG_KILLS", 500)
	stats.set_int(MPX() .. "VOLATOL_MG_DEATHS", 100)
	stats.set_int(MPX() .. "VOLATOL_MG_SHOTS", 500)
	stats.set_int(MPX() .. "VOLATOL_MG_HITS", 500)
	stats.set_int(MPX() .. "VOLATOL_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "VOLATOL_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "VOLATOL_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MULE4_MG_KILLS", 500)
	stats.set_int(MPX() .. "MULE4_MG_DEATHS", 100)
	stats.set_int(MPX() .. "MULE4_MG_SHOTS", 500)
	stats.set_int(MPX() .. "MULE4_MG_HITS", 500)
	stats.set_int(MPX() .. "MULE4_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MULE4_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MULE4_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MULE4_MISS_KILLS", 500)
	stats.set_int(MPX() .. "MULE4_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "MULE4_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "MULE4_MISS_HITS", 500)
	stats.set_int(MPX() .. "MULE4_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MULE4_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MULE4_GL_KILLS", 500)
	stats.set_int(MPX() .. "MULE4_GL_DEATHS", 100)
	stats.set_int(MPX() .. "MULE4_GL_SHOTS", 500)
	stats.set_int(MPX() .. "MULE4_GL_HITS", 500)
	stats.set_int(MPX() .. "MULE4_GL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MULE4_GL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MENACER_MG_KILLS", 500)
	stats.set_int(MPX() .. "MENACER_MG_DEATHS", 100)
	stats.set_int(MPX() .. "MENACER_MG_SHOTS", 500)
	stats.set_int(MPX() .. "MENACER_MG_HITS", 500)
	stats.set_int(MPX() .. "MENACER_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MENACER_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MENACER_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MENACER_TURR_KILLS", 500)
	stats.set_int(MPX() .. "MENACER_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "MENACER_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "MENACER_TURR_HITS", 500)
	stats.set_int(MPX() .. "MENACER_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MENACER_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MENACER_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MENACER_MINI_KILLS", 500)
	stats.set_int(MPX() .. "MENACER_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "MENACER_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "MENACER_MINI_HITS", 500)
	stats.set_int(MPX() .. "MENACER_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MENACER_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MENACER_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MG_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MG_DEATHS", 100)
	stats.set_int(MPX() .. "OPPRESSOR2_MG_SHOTS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MG_HITS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "OPPRESSOR2_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_CANN_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_CANN_DEATHS", 100)
	stats.set_int(MPX() .. "OPPRESSOR2_CANN_SHOTS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_CANN_HITS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_CANN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "OPPRESSOR2_CANN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MISS_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "OPPRESSOR2_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MISS_HITS", 500)
	stats.set_int(MPX() .. "OPPRESSOR2_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "OPPRESSOR2_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER_MG50_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "BRUISER_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "BRUISER_MG50_HITS", 500)
	stats.set_int(MPX() .. "BRUISER_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUISER_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BRUISER_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER2_MG50_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER2_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "BRUISER2_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "BRUISER2_MG50_HITS", 500)
	stats.set_int(MPX() .. "BRUISER2_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUISER2_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BRUISER2_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER2_LAS_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER2_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "BRUISER2_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "BRUISER2_LAS_HITS", 500)
	stats.set_int(MPX() .. "BRUISER2_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUISER2_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BRUISER2_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER3_MG50_KILLS", 500)
	stats.set_int(MPX() .. "BRUISER3_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "BRUISER3_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "BRUISER3_MG50_HITS", 500)
	stats.set_int(MPX() .. "BRUISER3_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUISER3_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BRUISER3_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS_MG50_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "BRUTUS_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS_MG50_HITS", 500)
	stats.set_int(MPX() .. "BRUTUS_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS2_MG50_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS2_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "BRUTUS2_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS2_MG50_HITS", 500)
	stats.set_int(MPX() .. "BRUTUS2_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS2_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BRUTUS2_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS2_LAS_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS2_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "BRUTUS2_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS2_LAS_HITS", 500)
	stats.set_int(MPX() .. "BRUTUS2_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS2_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BRUTUS2_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS3_MG50_KILLS", 500)
	stats.set_int(MPX() .. "BRUTUS3_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "BRUTUS3_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS3_MG50_HITS", 500)
	stats.set_int(MPX() .. "BRUTUS3_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BRUTUS3_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BRUTUS3_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CERBERUS_FLAME_KILLS", 500)
	stats.set_int(MPX() .. "CERBERUS_FLAME_DEATHS", 100)
	stats.set_int(MPX() .. "CERBERUS_FLAME_SHOTS", 500)
	stats.set_int(MPX() .. "CERBERUS_FLAME_HITS", 500)
	stats.set_int(MPX() .. "CERBERUS_FLAME_HEADSHOTS", 500)
	stats.set_int(MPX() .. "CERBERUS_FLAME_HELDTIME", 5963259)
	stats.set_int(MPX() .. "CERBERUS_FLAME_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CERBERUS2_FLAME_KILLS", 500)
	stats.set_int(MPX() .. "CERBERUS2_FLAME_DEATHS", 100)
	stats.set_int(MPX() .. "CERBERUS2_FLAME_SHOTS", 500)
	stats.set_int(MPX() .. "CERBERUS2_FLAME_HITS", 500)
	stats.set_int(MPX() .. "CERBERUS2_FLAME_HEADSHOTS", 500)
	stats.set_int(MPX() .. "CERBERUS2_FLAME_HELDTIME", 5963259)
	stats.set_int(MPX() .. "CERBERUS2_FLAME_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CERBERUS3_FLAME_KILLS", 500)
	stats.set_int(MPX() .. "CERBERUS3_FLAME_DEATHS", 100)
	stats.set_int(MPX() .. "CERBERUS3_FLAME_SHOTS", 500)
	stats.set_int(MPX() .. "CERBERUS3_FLAME_HITS", 500)
	stats.set_int(MPX() .. "CERBERUS3_FLAME_HEADSHOTS", 500)
	stats.set_int(MPX() .. "CERBERUS3_FLAME_HELDTIME", 5963259)
	stats.set_int(MPX() .. "CERBERUS3_FLAME_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DEATHBIKE_MINI_KILLS", 500)
	stats.set_int(MPX() .. "DEATHBIKE_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "DEATHBIKE_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "DEATHBIKE_MINI_HITS", 500)
	stats.set_int(MPX() .. "DEATHBIKE_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DEATHBIKE_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DEATHBIKE_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DEATHBIKE2_LAS_KILLS", 500)
	stats.set_int(MPX() .. "DEATHBIKE2_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "DEATHBIKE2_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "DEATHBIKE2_LAS_HITS", 500)
	stats.set_int(MPX() .. "DEATHBIKE2_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DEATHBIKE2_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DEATHBIKE2_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DEATHBIKE3_MINI_KILLS", 500)
	stats.set_int(MPX() .. "DEATHBIKE3_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "DEATHBIKE3_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "DEATHBIKE3_MINI_HITS", 500)
	stats.set_int(MPX() .. "DEATHBIKE3_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DEATHBIKE3_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DEATHBIKE3_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR4_MG50_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR4_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "DOMINATOR4_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR4_MG50_HITS", 500)
	stats.set_int(MPX() .. "DOMINATOR4_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR4_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DOMINATOR4_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_MG50_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "DOMINATOR5_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_MG50_HITS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DOMINATOR5_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_LAS_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "DOMINATOR5_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_LAS_HITS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR5_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DOMINATOR5_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR6_MG50_KILLS", 500)
	stats.set_int(MPX() .. "DOMINATOR6_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "DOMINATOR6_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR6_MG50_HITS", 500)
	stats.set_int(MPX() .. "DOMINATOR6_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DOMINATOR6_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DOMINATOR6_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER2_MG50_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER2_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "IMPALER2_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "IMPALER2_MG50_HITS", 500)
	stats.set_int(MPX() .. "IMPALER2_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPALER2_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPALER2_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER3_MG50_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER3_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "IMPALER3_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "IMPALER3_MG50_HITS", 500)
	stats.set_int(MPX() .. "IMPALER3_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPALER3_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPALER3_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER3_LAS_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER3_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "IMPALER3_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "IMPALER3_LAS_HITS", 500)
	stats.set_int(MPX() .. "IMPALER3_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPALER3_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPALER3_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER4_MG50_KILLS", 500)
	stats.set_int(MPX() .. "IMPALER4_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "IMPALER4_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "IMPALER4_MG50_HITS", 500)
	stats.set_int(MPX() .. "IMPALER4_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPALER4_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPALER4_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR_MG50_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "IMPERATOR_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR_MG50_HITS", 500)
	stats.set_int(MPX() .. "IMPERATOR_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPERATOR_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR_KIN_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "IMPERATOR_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR_KIN_HITS", 500)
	stats.set_int(MPX() .. "IMPERATOR_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPERATOR_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_MG50_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "IMPERATOR2_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_MG50_HITS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPERATOR2_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_KIN_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "IMPERATOR2_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_KIN_HITS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPERATOR2_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_LAS_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "IMPERATOR2_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_LAS_HITS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR2_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPERATOR2_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_MG50_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "IMPERATOR3_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_MG50_HITS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPERATOR3_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_KIN_KILLS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "IMPERATOR3_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_KIN_HITS", 500)
	stats.set_int(MPX() .. "IMPERATOR3_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "IMPERATOR3_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VALKYRIE_CANNON_KILLS", 500)
	stats.set_int(MPX() .. "VALKYRIE_CANNON_DEATHS", 100)
	stats.set_int(MPX() .. "VALKYRIE_CANNON_SHOTS", 500)
	stats.set_int(MPX() .. "VALKYRIE_CANNON_HITS", 500)
	stats.set_int(MPX() .. "VALKYRIE_CANNON_HEADSHOTS", 500)
	stats.set_int(MPX() .. "VALKYRIE_CANNON_HELDTIME", 5963259)
	stats.set_int(MPX() .. "VALKYRIE_CANNON_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VALKYRIE_TURR_KILLS", 500)
	stats.set_int(MPX() .. "VALKYRIE_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "VALKYRIE_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "VALKYRIE_TURR_HITS", 500)
	stats.set_int(MPX() .. "VALKYRIE_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "VALKYRIE_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "VALKYRIE_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "JB7002_MG_KILLS", 500)
	stats.set_int(MPX() .. "JB7002_MG_DEATHS", 100)
	stats.set_int(MPX() .. "JB7002_MG_SHOTS", 500)
	stats.set_int(MPX() .. "JB7002_MG_HITS", 500)
	stats.set_int(MPX() .. "JB7002_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "JB7002_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "JB7002_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_MG_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_MG_DEATHS", 100)
	stats.set_int(MPX() .. "MINITANK_MG_SHOTS", 500)
	stats.set_int(MPX() .. "MINITANK_MG_HITS", 500)
	stats.set_int(MPX() .. "MINITANK_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MINITANK_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MINITANK_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_FL_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_FL_DEATHS", 100)
	stats.set_int(MPX() .. "MINITANK_FL_SHOTS", 500)
	stats.set_int(MPX() .. "MINITANK_FL_HITS", 500)
	stats.set_int(MPX() .. "MINITANK_FL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MINITANK_FL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_RK_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_RK_DEATHS", 100)
	stats.set_int(MPX() .. "MINITANK_RK_SHOTS", 500)
	stats.set_int(MPX() .. "MINITANK_RK_HITS", 500)
	stats.set_int(MPX() .. "MINITANK_RK_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MINITANK_RK_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_LZ_KILLS", 500)
	stats.set_int(MPX() .. "MINITANK_LZ_DEATHS", 100)
	stats.set_int(MPX() .. "MINITANK_LZ_SHOTS", 500)
	stats.set_int(MPX() .. "MINITANK_LZ_HITS", 500)
	stats.set_int(MPX() .. "MINITANK_LZ_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MINITANK_LZ_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MINITANK_LZ_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "FLAREGUN_KILLS", 500)
	stats.set_int(MPX() .. "FLAREGUN_DEATHS", 100)
	stats.set_int(MPX() .. "FLAREGUN_SHOTS", 500)
	stats.set_int(MPX() .. "FLAREGUN_HITS", 500)
	stats.set_int(MPX() .. "FLAREGUN_HEADSHOTS", 500)
	stats.set_int(MPX() .. "FLAREGUN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "FLAREGUN_DB_HELDTIME", 5963259)
	stats.set_int(MPX() .. "FLAREGUN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "INSURGENT_TURR_KILLS", 500)
	stats.set_int(MPX() .. "INSURGENT_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "INSURGENT_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "INSURGENT_TURR_HITS", 500)
	stats.set_int(MPX() .. "INSURGENT_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "INSURGENT_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "INSURGENT_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SAVAGE_ROCKET_KILLS", 500)
	stats.set_int(MPX() .. "SAVAGE_ROCKET_DEATHS", 100)
	stats.set_int(MPX() .. "SAVAGE_ROCKET_SHOTS", 500)
	stats.set_int(MPX() .. "SAVAGE_ROCKET_HITS", 500)
	stats.set_int(MPX() .. "SAVAGE_ROCKET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SAVAGE_ROCKET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SAVAGE_BULLET_KILLS", 500)
	stats.set_int(MPX() .. "SAVAGE_BULLET_DEATHS", 100)
	stats.set_int(MPX() .. "SAVAGE_BULLET_SHOTS", 500)
	stats.set_int(MPX() .. "SAVAGE_BULLET_HITS", 500)
	stats.set_int(MPX() .. "SAVAGE_BULLET_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SAVAGE_BULLET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SAVAGE_BULLET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL_TURR_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "TECHNICAL_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL_TURR_HITS", 500)
	stats.set_int(MPX() .. "TECHNICAL_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TECHNICAL_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_DEATHS", 100)
	stats.set_int(MPX() .. "VEHBOMB_SHOTS", 500)
	stats.set_int(MPX() .. "VEHBOMB_HITS", 500)
	stats.set_int(MPX() .. "VEHBOMB_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_C_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_C_DEATHS", 100)
	stats.set_int(MPX() .. "VEHBOMB_C_SHOTS", 500)
	stats.set_int(MPX() .. "VEHBOMB_C_HITS", 500)
	stats.set_int(MPX() .. "VEHBOMB_C_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_G_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_G_DEATHS", 100)
	stats.set_int(MPX() .. "VEHBOMB_G_SHOTS", 500)
	stats.set_int(MPX() .. "VEHBOMB_G_HITS", 500)
	stats.set_int(MPX() .. "VEHBOMB_G_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_I_KILLS", 500)
	stats.set_int(MPX() .. "VEHBOMB_I_DEATHS", 100)
	stats.set_int(MPX() .. "VEHBOMB_I_SHOTS", 500)
	stats.set_int(MPX() .. "VEHBOMB_I_HITS", 500)
	stats.set_int(MPX() .. "VEHBOMB_I_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_CANN_KILLS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_CANN_DEATHS", 100)
	stats.set_int(MPX() .. "BOMBUSHKA_CANN_SHOTS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_CANN_HITS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_CANN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BOMBUSHKA_CANN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_DUAL_KILLS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_DUAL_DEATHS", 100)
	stats.set_int(MPX() .. "BOMBUSHKA_DUAL_SHOTS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_DUAL_HITS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_DUAL_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BOMBUSHKA_DUAL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BOMBUSHKA_DUAL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "HAVOK_MINI_KILLS", 500)
	stats.set_int(MPX() .. "HAVOK_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "HAVOK_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "HAVOK_MINI_HITS", 500)
	stats.set_int(MPX() .. "HAVOK_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "HAVOK_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "HAVOK_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "HUNTER_BARR_KILLS", 500)
	stats.set_int(MPX() .. "HUNTER_BARR_DEATHS", 100)
	stats.set_int(MPX() .. "HUNTER_BARR_SHOTS", 500)
	stats.set_int(MPX() .. "HUNTER_BARR_HITS", 500)
	stats.set_int(MPX() .. "HUNTER_BARR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "HUNTER_BARR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "HUNTER_CANNON_KILLS", 500)
	stats.set_int(MPX() .. "HUNTER_CANNON_DEATHS", 100)
	stats.set_int(MPX() .. "HUNTER_CANNON_SHOTS", 500)
	stats.set_int(MPX() .. "HUNTER_CANNON_HITS", 500)
	stats.set_int(MPX() .. "HUNTER_CANNON_HELDTIME", 5963259)
	stats.set_int(MPX() .. "HUNTER_CANNON_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MICROLIGHT_MG_KILLS", 500)
	stats.set_int(MPX() .. "MICROLIGHT_MG_DEATHS", 100)
	stats.set_int(MPX() .. "MICROLIGHT_MG_SHOTS", 500)
	stats.set_int(MPX() .. "MICROLIGHT_MG_HITS", 500)
	stats.set_int(MPX() .. "MICROLIGHT_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MICROLIGHT_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MICROLIGHT_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_NOSE_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_NOSE_DEATHS", 100)
	stats.set_int(MPX() .. "MOGUL_NOSE_SHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_NOSE_HITS", 500)
	stats.set_int(MPX() .. "MOGUL_NOSE_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_NOSE_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MOGUL_NOSE_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_DNOSE_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_DNOSE_DEATHS", 100)
	stats.set_int(MPX() .. "MOGUL_DNOSE_SHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_DNOSE_HITS", 500)
	stats.set_int(MPX() .. "MOGUL_DNOSE_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_DNOSE_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MOGUL_DNOSE_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_TURR_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "MOGUL_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_TURR_HITS", 500)
	stats.set_int(MPX() .. "MOGUL_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MOGUL_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_DTURR_KILLS", 500)
	stats.set_int(MPX() .. "MOGUL_DTURR_DEATHS", 100)
	stats.set_int(MPX() .. "MOGUL_DTURR_SHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_DTURR_HITS", 500)
	stats.set_int(MPX() .. "MOGUL_DTURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MOGUL_DTURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MOGUL_DTURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MG_KILLS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MG_DEATHS", 100)
	stats.set_int(MPX() .. "MOLOTOK_MG_SHOTS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MG_HITS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MOLOTOK_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MISS_KILLS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "MOLOTOK_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MISS_HITS", 500)
	stats.set_int(MPX() .. "MOLOTOK_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MOLOTOK_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "NOKOTA_MG_KILLS", 500)
	stats.set_int(MPX() .. "NOKOTA_MG_DEATHS", 100)
	stats.set_int(MPX() .. "NOKOTA_MG_SHOTS", 500)
	stats.set_int(MPX() .. "NOKOTA_MG_HITS", 500)
	stats.set_int(MPX() .. "NOKOTA_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "NOKOTA_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "NOKOTA_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "NOKOTA_MISS_KILLS", 500)
	stats.set_int(MPX() .. "NOKOTA_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "NOKOTA_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "NOKOTA_MISS_HITS", 500)
	stats.set_int(MPX() .. "NOKOTA_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "NOKOTA_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "PYRO_MG_KILLS", 500)
	stats.set_int(MPX() .. "PYRO_MG_DEATHS", 100)
	stats.set_int(MPX() .. "PYRO_MG_SHOTS", 500)
	stats.set_int(MPX() .. "PYRO_MG_HITS", 500)
	stats.set_int(MPX() .. "PYRO_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "PYRO_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "PYRO_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "PYRO_MISS_KILLS", 500)
	stats.set_int(MPX() .. "PYRO_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "PYRO_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "PYRO_MISS_HITS", 500)
	stats.set_int(MPX() .. "PYRO_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "PYRO_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ROGUE_MG_KILLS", 500)
	stats.set_int(MPX() .. "ROGUE_MG_DEATHS", 100)
	stats.set_int(MPX() .. "ROGUE_MG_SHOTS", 500)
	stats.set_int(MPX() .. "ROGUE_MG_HITS", 500)
	stats.set_int(MPX() .. "ROGUE_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ROGUE_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ROGUE_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ROGUE_CANN_KILLS", 500)
	stats.set_int(MPX() .. "ROGUE_CANN_DEATHS", 100)
	stats.set_int(MPX() .. "ROGUE_CANN_SHOTS", 500)
	stats.set_int(MPX() .. "ROGUE_CANN_HITS", 500)
	stats.set_int(MPX() .. "ROGUE_CANN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ROGUE_CANN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ROGUE_MISS_KILLS", 500)
	stats.set_int(MPX() .. "ROGUE_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "ROGUE_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "ROGUE_MISS_HITS", 500)
	stats.set_int(MPX() .. "ROGUE_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ROGUE_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STARLING_MG_KILLS", 500)
	stats.set_int(MPX() .. "STARLING_MG_DEATHS", 100)
	stats.set_int(MPX() .. "STARLING_MG_SHOTS", 500)
	stats.set_int(MPX() .. "STARLING_MG_HITS", 500)
	stats.set_int(MPX() .. "STARLING_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "STARLING_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STARLING_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STARLING_MISS_KILLS", 500)
	stats.set_int(MPX() .. "STARLING_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "STARLING_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "STARLING_MISS_HITS", 500)
	stats.set_int(MPX() .. "STARLING_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STARLING_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SEABREEZE_MG_KILLS", 500)
	stats.set_int(MPX() .. "SEABREEZE_MG_DEATHS", 100)
	stats.set_int(MPX() .. "SEABREEZE_MG_SHOTS", 500)
	stats.set_int(MPX() .. "SEABREEZE_MG_HITS", 500)
	stats.set_int(MPX() .. "SEABREEZE_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SEABREEZE_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SEABREEZE_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TULA_MG_KILLS", 500)
	stats.set_int(MPX() .. "TULA_MG_DEATHS", 100)
	stats.set_int(MPX() .. "TULA_MG_SHOTS", 500)
	stats.set_int(MPX() .. "TULA_MG_HITS", 500)
	stats.set_int(MPX() .. "TULA_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TULA_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TULA_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TULA_SINGLEMG_KILLS", 500)
	stats.set_int(MPX() .. "TULA_SINGLEMG_DEATHS", 100)
	stats.set_int(MPX() .. "TULA_SINGLEMG_SHOTS", 500)
	stats.set_int(MPX() .. "TULA_SINGLEMG_HITS", 500)
	stats.set_int(MPX() .. "TULA_SINGLEMG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TULA_SINGLEMG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TULA_SINGLEMG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TULA_DUALMG_KILLS", 500)
	stats.set_int(MPX() .. "TULA_DUALMG_DEATHS", 100)
	stats.set_int(MPX() .. "TULA_DUALMG_SHOTS", 500)
	stats.set_int(MPX() .. "TULA_DUALMG_HITS", 500)
	stats.set_int(MPX() .. "TULA_DUALMG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TULA_DUALMG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TULA_DUALMG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TULA_MINI_KILLS", 500)
	stats.set_int(MPX() .. "TULA_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "TULA_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "TULA_MINI_HITS", 500)
	stats.set_int(MPX() .. "TULA_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TULA_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TULA_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MG_KILLS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MG_DEATHS", 100)
	stats.set_int(MPX() .. "VIGILANTE_MG_SHOTS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MG_HITS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "VIGILANTE_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MISS_KILLS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "VIGILANTE_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MISS_HITS", 500)
	stats.set_int(MPX() .. "VIGILANTE_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "VIGILANTE_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BOXVILLE5_TURR_KILLS", 500)
	stats.set_int(MPX() .. "BOXVILLE5_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "BOXVILLE5_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "BOXVILLE5_TURR_HITS", 500)
	stats.set_int(MPX() .. "BOXVILLE5_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BOXVILLE5_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BOXVILLE5_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BLAZER5_CANNON_KILLS", 500)
	stats.set_int(MPX() .. "BLAZER5_CANNON_DEATHS", 100)
	stats.set_int(MPX() .. "BLAZER5_CANNON_SHOTS", 500)
	stats.set_int(MPX() .. "BLAZER5_CANNON_HITS", 500)
	stats.set_int(MPX() .. "BLAZER5_CANNON_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BLAZER5_CANNON_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BLAZER5_CANNON_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "RUINER2_BULLET_KILLS", 500)
	stats.set_int(MPX() .. "RUINER2_BULLET_DEATHS", 100)
	stats.set_int(MPX() .. "RUINER2_BULLET_SHOTS", 500)
	stats.set_int(MPX() .. "RUINER2_BULLET_HITS", 500)
	stats.set_int(MPX() .. "RUINER2_BULLET_HEADSHOTS", 500)
	stats.set_int(MPX() .. "RUINER2_BULLET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "RUINER2_BULLET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "RUINER2_ROCKET_KILLS", 500)
	stats.set_int(MPX() .. "RUINER2_ROCKET_DEATHS", 100)
	stats.set_int(MPX() .. "RUINER2_ROCKET_SHOTS", 500)
	stats.set_int(MPX() .. "RUINER2_ROCKET_HITS", 500)
	stats.set_int(MPX() .. "RUINER2_ROCKET_HEADSHOTS", 500)
	stats.set_int(MPX() .. "RUINER2_ROCKET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "RUINER2_ROCKET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL2_TURR_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL2_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "TECHNICAL2_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL2_TURR_HITS", 500)
	stats.set_int(MPX() .. "TECHNICAL2_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL2_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TECHNICAL2_TURR_ENEMY_KILLS", 500)
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
	stats.set_int(MPX() .. "AWD_CONTRACTOR", 50)
	stats.set_int(MPX() .. "AWD_COLD_CALLER", 50)
	stats.set_int(MPX() .. "AWD_PRODUCER", 60)
	stats.set_int(MPX() .. "FIXERTELEPHONEHITSCOMPL", 10)
	stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", -1)
	stats.set_int(MPX() .. "TWR_INITIALS_0", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_1", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_2", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_3", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_4", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_5", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_6", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_7", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_8", 69644)
	stats.set_int(MPX() .. "TWR_INITIALS_9", 69644)
	stats.set_int(MPX() .. "TWR_SCORE_0", 50)
	stats.set_int(MPX() .. "TWR_SCORE_1", 50)
	stats.set_int(MPX() .. "TWR_SCORE_2", 50)
	stats.set_int(MPX() .. "TWR_SCORE_3", 50)
	stats.set_int(MPX() .. "TWR_SCORE_4", 50)
	stats.set_int(MPX() .. "TWR_SCORE_5", 50)
	stats.set_int(MPX() .. "TWR_SCORE_6", 50)
	stats.set_int(MPX() .. "TWR_SCORE_7", 50)
	stats.set_int(MPX() .. "TWR_SCORE_8", 50)
	stats.set_int(MPX() .. "TWR_SCORE_9", 50)
	stats.set_int(MPX() .. "GGSM_INITIALS_0", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_1", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_2", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_3", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_4", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_5", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_6", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_7", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_8", 69644)
	stats.set_int(MPX() .. "GGSM_INITIALS_9", 69644)
	stats.set_int(MPX() .. "GGSM_SCORE_0", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_1", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_2", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_3", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_4", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_5", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_6", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_7", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_8", 50)
	stats.set_int(MPX() .. "GGSM_SCORE_9", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_0", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_1", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_2", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_3", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_4", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_5", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_6", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_7", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_8", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_9", 69644)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_0", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_1", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_2", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_3", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_4", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_5", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_6", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_7", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_8", 50)
	stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_9", 50)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_0", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_1", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_2", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_3", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_4", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_5", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_6", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_7", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_8", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_INITIALS_9", 69644)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_0", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_1", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_2", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_3", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_4", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_5", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_6", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_7", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_8", 50)
	stats.set_int(MPX() .. "DG_MONKEY_SCORE_9", 50)
	stats.set_int(MPX() .. "IAP_MA0_MOON_DIST", 2147483647)
	stats.set_int(MPX() .. "AWD_FACES_OF_DEATH", 47)
	stats.set_int(MPX() .. "IAP_INITIALS_0", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_1", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_2", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_3", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_4", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_5", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_6", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_7", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_8", 50)
	stats.set_int(MPX() .. "IAP_INITIALS_9", 50)
	stats.set_int(MPX() .. "IAP_SCORE_0", 69644)
	stats.set_int(MPX() .. "IAP_SCORE_1", 50333)
	stats.set_int(MPX() .. "IAP_SCORE_2", 63512)
	stats.set_int(MPX() .. "IAP_SCORE_3", 46136)
	stats.set_int(MPX() .. "IAP_SCORE_4", 21638)
	stats.set_int(MPX() .. "IAP_SCORE_5", 2133)
	stats.set_int(MPX() .. "IAP_SCORE_6", 1215)
	stats.set_int(MPX() .. "IAP_SCORE_7", 2444)
	stats.set_int(MPX() .. "IAP_SCORE_8", 38023)
	stats.set_int(MPX() .. "IAP_SCORE_9", 2233)
	stats.set_int(MPX() .. "SCGW_SCORE_1", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_2", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_3", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_4", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_5", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_6", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_7", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_8", 50)
	stats.set_int(MPX() .. "SCGW_SCORE_9", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_0", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_1", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_2", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_3", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_4", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_5", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_6", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_7", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_8", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_9", 69644)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_0", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_1", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_2", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_3", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_4", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_5", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_6", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_7", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_8", 50)
	stats.set_int(MPX() .. "DG_DEFENDER_SCORE_9", 50)
	stats.set_int(MPX() .. "AWD_CAR_CLUB_MEM", 100)
	stats.set_int(MPX() .. "AWD_SPRINTRACER", 50)
	stats.set_int(MPX() .. "AWD_STREETRACER", 50)
	stats.set_int(MPX() .. "AWD_PURSUITRACER", 50)
	stats.set_int(MPX() .. "AWD_TEST_CAR", 240)
	stats.set_int(MPX() .. "AWD_AUTO_SHOP", 50)
	stats.set_int(MPX() .. "AWD_CAR_EXPORT", 100)
	stats.set_int(MPX() .. "AWD_GROUNDWORK", 40)
	stats.set_int(MPX() .. "AWD_ROBBERY_CONTRACT", 100)
	stats.set_int(MPX() .. "AWD_FACES_OF_DEATH", 100)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS_3", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS_4", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS_5", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS_6", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_LEGS_7", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_OUTFIT", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_10", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_3", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_4", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_5", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_6", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_7", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_8", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_PROPS_9", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL2_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL_2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL_3", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL_4", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL_5", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL_6", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_SPECIAL_7", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_TEETH", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_TEETH_1", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_TEETH_2", -1)
	stats.set_int(MPX() .. "CLTHS_AVAILABLE_TORSO", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_0", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_1", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_10", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_11", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_12", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_13", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_14", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_15", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_16", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_17", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_18", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_19", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_2", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_20", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_21", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_22", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_23", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_24", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_25", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_26", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_27", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_28", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_29", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_3", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_30", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_31", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_32", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_33", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_34", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_35", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_36", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_37", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_38", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_39", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_4", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_40", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_5", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_6", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_7", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_8", -1)
	stats.set_int(MPX() .. "DLC_APPAREL_ACQUIRED_9", -1)
	stats.set_int(MPX() .. "GRENADE_ENEMY_KILLS", 50)
	stats.set_int(MPX() .. "MICROSMG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SMG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ASLTSMG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ASLTRIFLE_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CRBNRIFLE_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ADVRIFLE_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CMBTMG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ASLTMG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "RPG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "LONGEST_WHEELIE_DIST", 1000)
	stats.set_int(MPX() .. "MOST_ARM_WRESTLING_WINS", 25)
	stats.set_int(MPX() .. "NO_CARS_REPAIR", 1000)
	stats.set_int(MPX() .. "VEHICLES_SPRAYED", 500)
	stats.set_int(MPX() .. "NUMBER_NEAR_MISS_NOCRASH", 500)
	stats.set_int(MPX() .. "USJS_FOUND", 50)
	stats.set_int(MPX() .. "USJS_FOUND_MASK", 50)
	stats.set_int(MPX() .. "USJS_COMPLETED", 50)
	stats.set_int(MPX() .. "USJS_TOTAL_COMPLETED", 50)
	stats.set_int(MPX() .. "USJS_COMPLETED_MASK", 50)
	stats.set_int(MPX() .. "MOST_FLIPS_IN_ONE_JUMP", 5)
	stats.set_int(MPX() .. "MOST_SPINS_IN_ONE_JUMP", 5)
	stats.set_int(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
	stats.set_int(MPX() .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
	stats.set_int(MPX() .. "PASS_DB_PLAYER_KILLS", 100)
	stats.set_int(MPX() .. "PISTOL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "PLAYER_HEADSHOTS", 500)
	stats.set_int(MPX() .. "RACES_WON", 50)
	stats.set_int(MPX() .. "SAWNOFF_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_MECH", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
	stats.set_int(MPX() .. "STKYBMB_ENEMY_KILLS", 50)
	stats.set_int(MPX() .. "UNARMED_ENEMY_KILLS", 50)
	stats.set_int(MPX() .. "USJS_COMPLETED", 50)
	stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH", -1)
	stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH2", -1)
	stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH3", -1)
	stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH4", -1)
	stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH5", -1)
	stats.set_int(MPX() .. "CRDEADLINE", 5)
	stats.set_int(MPX() .. "CHAR_FM_ABILITY_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_ABILITY_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_ABILITY_3_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_ABILITY_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_ABILITY_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_ABILITY_3_UNLCK", -1)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_COMPLET", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_UNDERTA", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_COMPLET", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_UNDERTA", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_COMPLET1", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_UNDERTA1", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_COMPLET1", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_UNDERTA1", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_COMPLET2", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_UNDERTA2", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_COMPLET2", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_UNDERTA2", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_COMPLET3", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_UNDERTA3", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_COMPLET3", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_UNDERTA3", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_COMPLET4", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_UNDERTA4", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_COMPLET4", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_UNDERTA4", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_COMPLET5", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_BUY_UNDERTA5", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_COMPLET5", 1000)
	stats.set_int(MPX() .. "LIFETIME_BIKER_SELL_UNDERTA5", 1000)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS0", 20000000)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS1", 20000000)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS2", 20000000)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS3", 20000000)
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS4", 20000000)
	stats.set_int(MPX() .. "LFETIME_BIKER_BUY_COMPLET6", 10) --Allow buying of Stank Breath acid name.
	stats.set_int(MPX() .. "LFETIME_BIKER_SELL_COMPLET6", 10) --Allow buying of Squatch Bait acid name.
	stats.set_packed_stat_int(41241, 5) --Allow buying of Chair Shot acid name.
	stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS6", 1000000) --Allow buying of Fck Your Sleep acid name.
	stats.set_packed_stat_int(7666, 25) --Fill CEO office with money
	unlock_packed_bools(7553, 7594) --Fill CEO office with junk
	stats.set_packed_stat_int(9357, 4) --Fill Clubhouse with money
	unlock_packed_bools(9400, 9414) --Fill Clubhouse with junk
	stats.set_int(MPX() .. "XMAS2023_ADV_MODE_WINS", 6) --Unlock Christmas 2023 liveries.
	stats.set_int("MPPLY_XMAS23_PLATES0", 3) -- ECola & Sprunk Plates
	stats.set_int(MPX() .. "COUNT_HOTRING_RACE", 20) -- Liveries for hotring
	stats.set_int(MPX() .. "FINISHED_SASS_RACE_TOP_3", 20) -- Trade price for hotring/everon2
	stats.set_int(MPX() .. "AWD_DISPATCHWORK", 5) --Trade price for polgreenwood.
	stats.set_packed_stat_int(7671, 100) --Plant on Desk, Plaque Trophy, Shield Trophy
	stats.set_int(MPX() .. "PROG_HUB_BOUNTIES_ALIVE_BS", -1) --Cuff Trophy
	stats.set_int(MPX() .. "LFETIME_IE_EXPORT_COMPLETED", 1000)
	stats.set_int(MPX() .. "LFETIME_IE_MISSION_EARNINGS", 20000000)
	stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_UNDETAK", 1000)
	stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_COMPLET", 1000)
	stats.set_int(MPX() .. "LFETIME_HANGAR_EARNINGS", 20000000)
	stats.set_int(MPX() .. "SR_HIGHSCORE_1", 690)
	stats.set_int(MPX() .. "SR_HIGHSCORE_2", 1860)
	stats.set_int(MPX() .. "SR_HIGHSCORE_3", 2690)
	stats.set_int(MPX() .. "SR_HIGHSCORE_4", 2660)
	stats.set_int(MPX() .. "SR_HIGHSCORE_5", 2650)
	stats.set_int(MPX() .. "SR_HIGHSCORE_6", 450)
	stats.set_int(MPX() .. "SR_TARGETS_HIT", 269)
	stats.set_int(MPX() .. "SR_WEAPON_BIT_SET", -1)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", 9999)
	stats.set_int(MPX() .. "NO_BOUGHT_YUM_SNACKS", 1000)
	stats.set_int(MPX() .. "AWD_DANCE_TO_SOLOMUN", 100)
	stats.set_int(MPX() .. "AWD_DANCE_TO_TALEOFUS", 100)
	stats.set_int(MPX() .. "AWD_DANCE_TO_DIXON", 100)
	stats.set_int(MPX() .. "AWD_DANCE_TO_BLKMAD", 100)
	stats.set_int(MPX() .. "AWD_CLUB_DRUNK", 200)
	stats.set_int(MPX() .. "NUMUNIQUEPLYSINCLUB", 100)
	stats.set_int(MPX() .. "DANCETODIFFDJS", 4)
	stats.set_int(MPX() .. "DANCEPERFECTOWNCLUB", 100)
	stats.set_int(MPX() .. "NIGHTCLUB_HOTSPOT_TIME_MS", 3600000)
	stats.set_int(MPX() .. "ARENAWARS_SKILL_LEVEL", 20)
	stats.set_int(MPX() .. "ARENAWARS_AP_TIER", 1000)
	stats.set_int(MPX() .. "ARENAWARS_AP_LIFETIME", 47551850)
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
	stats.set_int(MPX() .. "ARN_SPECTATOR_DRONE", 1000)
	stats.set_int(MPX() .. "ARN_SPECTATOR_CAMS", 1000)
	stats.set_int(MPX() .. "ARN_SMOKE", 1000)
	stats.set_int(MPX() .. "ARN_DRINK", 1000)
	stats.set_int(MPX() .. "ARN_VEH_MONSTER3", 1000)
	stats.set_int(MPX() .. "ARN_VEH_MONSTER4", 1000)
	stats.set_int(MPX() .. "ARN_VEH_MONSTER5", 1000)
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
	stats.set_int(MPX() .. "ARN_VEH_ISSI6", 1000)
	stats.set_int(MPX() .. "ARN_VEH_IMPERATOR", 1000)
	stats.set_int(MPX() .. "ARN_VEH_IMPERATOR2", 1000)
	stats.set_int(MPX() .. "ARN_VEH_IMPERATOR3", 1000)
	stats.set_int(MPX() .. "ARN_VEH_ZR380", 1000)
	stats.set_int(MPX() .. "ARN_VEH_ZR3802", 1000)
	stats.set_int(MPX() .. "ARN_VEH_ZR3803", 1000)
	stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE", 1000)
	stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE2", 1000)
	stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE3", 1000)
	stats.set_int(MPX() .. "NO_BOUGHT_HEALTH_SNACKS", 1000)
	stats.set_int(MPX() .. "NO_BOUGHT_EPIC_SNACKS", 1000)
	stats.set_int(MPX() .. "NUMBER_OF_ORANGE_BOUGHT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_1_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_2_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_3_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_4_COUNT", 1000)
	stats.set_int(MPX() .. "MP_CHAR_ARMOUR_5_COUNT", 1000)
	stats.set_int(MPX() .. "NUMBER_OF_BOURGE_BOUGHT", 1000)
	stats.set_int(MPX() .. "CIGARETTES_BOUGHT", 1000)
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
	stats.set_int(MPX() .. "FM_ACT_PHN", -1)
	stats.set_int(MPX() .. "FM_ACT_PH2", -1)
	stats.set_int(MPX() .. "FM_ACT_PH3", -1)
	stats.set_int(MPX() .. "FM_ACT_PH4", -1)
	stats.set_int(MPX() .. "FM_ACT_PH5", -1)
	stats.set_int(MPX() .. "FM_VEH_TX1", -1)
	stats.set_int(MPX() .. "FM_ACT_PH6", -1)
	stats.set_int(MPX() .. "FM_ACT_PH7", -1)
	stats.set_int(MPX() .. "FM_ACT_PH8", -1)
	stats.set_int(MPX() .. "FM_ACT_PH9", -1)
	stats.set_int(MPX() .. "LOWRIDER_FLOW_COMPLETE", 3)
	stats.set_int(MPX() .. "LOW_FLOW_CURRENT_PROG", 9)
	stats.set_int(MPX() .. "LOW_FLOW_CURRENT_CALL", 9)
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
	stats.set_int(MPX() .. "SNIPERRFL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "HVYSNIPER_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "KILLS_COP", 4500)
	stats.set_int(MPX() .. "KILLS_SWAT", 500)
	stats.set_int(MPX() .. "CHAR_WANTED_LEVEL_TIME", 5000)
	stats.set_int(MPX() .. "NUMBER_STOLEN_COP_VEHICLE", 200)
	stats.set_int(MPX() .. "NUMBER_STOLEN_CARS", 200)
	stats.set_int(MPX() .. "NUMBER_STOLEN_BIKES", 200)
	stats.set_int(MPX() .. "NUMBER_STOLEN_BOATS", 200)
	stats.set_int(MPX() .. "NUMBER_STOLEN_HELIS", 200)
	stats.set_int(MPX() .. "NUMBER_STOLEN_PLANES", 200)
	stats.set_int(MPX() .. "NUMBER_STOLEN_QUADBIKES", 200)
	stats.set_int(MPX() .. "NUMBER_STOLEN_BICYCLES", 200)
	stats.set_int(MPX() .. "STARS_ATTAINED", 5000)
	stats.set_int(MPX() .. "STARS_EVADED", 4000)
	stats.set_int(MPX() .. "VEHEXPORTED", 500)
	stats.set_int(MPX() .. "TOTAL_NO_SHOPS_HELD_UP", 100)
	stats.set_int(MPX() .. "KILLS_ENEMY_GANG_MEMBERS", 500)
	stats.set_int(MPX() .. "KILLS_FRIENDLY_GANG_MEMBERS", 500)
	stats.set_int(MPX() .. "CR_GANGATTACK_CITY", 500)
	stats.set_int(MPX() .. "CR_GANGATTACK_COUNTRY", 500)
	stats.set_int(MPX() .. "CR_GANGATTACK_LOST", 500)
	stats.set_int(MPX() .. "CR_GANGATTACK_VAGOS", 500)
	stats.set_int(MPX() .. "HORDKILLS", 500)
	stats.set_int(MPX() .. "GHKILLS", 500)
	stats.set_int(MPX() .. "NO_NON_CONTRACT_RACE_WIN", 500)
	stats.set_int(MPX() .. "DB_SHOTTIME", 596)
	stats.set_int(MPX() .. "DB_KILLS", 500)
	stats.set_int(MPX() .. "DB_PLAYER_KILLS", 500)
	stats.set_int(MPX() .. "DB_SHOTS", 500)
	stats.set_int(MPX() .. "DB_HITS", 500)
	stats.set_int(MPX() .. "DB_HITS_PEDS_VEHICLES", 500)
	stats.set_int(MPX() .. "DB_HEADSHOTS", 500)
	stats.set_int(MPX() .. "USJS_COMPLETED", 25)
	stats.set_int(MPX() .. "AWD_FM_RACES_FASTEST_LAP", 50)
	stats.set_int(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE", 1000)
	stats.set_int(MPX() .. "AWD_WIN_CAPTURES", 500)
	stats.set_int(MPX() .. "AWD_DROPOFF_CAP_PACKAGES", 100)
	stats.set_int(MPX() .. "AWD_KILL_CARRIER_CAPTURE", 100)
	stats.set_int(MPX() .. "AWD_FINISH_HEISTS", 50)
	stats.set_int(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
	stats.set_int(MPX() .. "AWD_NIGHTVISION_KILLS", 100)
	stats.set_int(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
	stats.set_int(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
	stats.set_int(MPX() .. "AWD_FMRALLYWONDRIVE", 25)
	stats.set_int(MPX() .. "AWD_FMRALLYWONNAV", 25)
	stats.set_int(MPX() .. "AWD_FMWINAIRRACE", 25)
	stats.set_int(MPX() .. "AWD_FMWINSEARACE", 25)
	stats.set_int(MPX() .. "RACES_WON", 50)
	stats.set_int(MPX() .. "FAVOUTFITBIKETIMECURRENT", 884483972)
	stats.set_int(MPX() .. "FAVOUTFITBIKETIME1ALLTIME", 884483972)
	stats.set_int(MPX() .. "FAVOUTFITBIKETYPECURRENT", 884483972)
	stats.set_int(MPX() .. "FAVOUTFITBIKETYPEALLTIME", 884483972)
	stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", 1000)
	stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", 1000)
	stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", 1000)
	stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", 1000)
	stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", 30000000)
	stats.set_int(MPX() .. "TATTOO_FM_CURRENT_32", 32768)
	stats.set_int(MPX() .. "TATTOO_FM_CURRENT_32", 67108864)
	stats.set_int(MPX() .. "DELUXO_BULLET_HITS", 500)
	stats.set_int(MPX() .. "DELUXO_BULLET_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DELUXO_BULLET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DELUXO_BULLET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DELUXO_ROCKET_KILLS", 500)
	stats.set_int(MPX() .. "DELUXO_ROCKET_DEATHS", 100)
	stats.set_int(MPX() .. "DELUXO_ROCKET_SHOTS", 500)
	stats.set_int(MPX() .. "DELUXO_ROCKET_HITS", 500)
	stats.set_int(MPX() .. "DELUXO_ROCKET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DELUXO_ROCKET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DELUXO_BULLET_KILLS", 500)
	stats.set_int(MPX() .. "DELUXO_BULLET_DEATHS", 100)
	stats.set_int(MPX() .. "DELUXO_BULLET_SHOTS", 500)
	stats.set_int(MPX() .. "COMET4_MG_KILLS", 500)
	stats.set_int(MPX() .. "COMET4_MG_DEATHS", 100)
	stats.set_int(MPX() .. "COMET4_MG_SHOTS", 500)
	stats.set_int(MPX() .. "COMET4_MG_HITS", 500)
	stats.set_int(MPX() .. "COMET4_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "COMET4_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "COMET4_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CHERNOBOG_MISS_KILLS", 500)
	stats.set_int(MPX() .. "CHERNOBOG_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "CHERNOBOG_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "CHERNOBOG_MISS_HITS", 500)
	stats.set_int(MPX() .. "CHERNOBOG_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "CHERNOBOG_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MG_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MG_DEATHS", 100)
	stats.set_int(MPX() .. "BARRAGE_R_MG_SHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MG_HITS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BARRAGE_R_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MINI_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "BARRAGE_R_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MINI_HITS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BARRAGE_R_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_GL_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_GL_DEATHS", 100)
	stats.set_int(MPX() .. "BARRAGE_R_GL_SHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_GL_HITS", 500)
	stats.set_int(MPX() .. "BARRAGE_R_GL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BARRAGE_R_GL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MG_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MG_DEATHS", 100)
	stats.set_int(MPX() .. "BARRAGE_T_MG_SHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MG_HITS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BARRAGE_T_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MINI_KILLS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "BARRAGE_T_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MINI_HITS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "BARRAGE_T_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "BARRAGE_T_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "AVENGER_CANNON_KILLS", 500)
	stats.set_int(MPX() .. "AVENGER_CANNON_DEATHS", 100)
	stats.set_int(MPX() .. "AVENGER_CANNON_SHOTS", 500)
	stats.set_int(MPX() .. "AVENGER_CANNON_HITS", 500)
	stats.set_int(MPX() .. "AVENGER_CANNON_HELDTIME", 5963259)
	stats.set_int(MPX() .. "AVENGER_CANNON_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_TURR_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "AKULA_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "AKULA_TURR_HITS", 500)
	stats.set_int(MPX() .. "AKULA_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "AKULA_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "AKULA_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_DTURR_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_DTURR_DEATHS", 100)
	stats.set_int(MPX() .. "AKULA_DTURR_SHOTS", 500)
	stats.set_int(MPX() .. "AKULA_DTURR_HITS", 500)
	stats.set_int(MPX() .. "AKULA_DTURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "AKULA_DTURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "AKULA_DTURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_MINI_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "AKULA_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "AKULA_MINI_HITS", 500)
	stats.set_int(MPX() .. "AKULA_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "AKULA_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "AKULA_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_BARR_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_BARR_DEATHS", 100)
	stats.set_int(MPX() .. "AKULA_BARR_SHOTS", 500)
	stats.set_int(MPX() .. "AKULA_BARR_HITS", 500)
	stats.set_int(MPX() .. "AKULA_BARR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "AKULA_BARR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_ROCKET_KILLS", 500)
	stats.set_int(MPX() .. "AKULA_ROCKET_DEATHS", 100)
	stats.set_int(MPX() .. "AKULA_ROCKET_SHOTS", 500)
	stats.set_int(MPX() .. "AKULA_ROCKET_HITS", 500)
	stats.set_int(MPX() .. "AKULA_ROCKET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "AKULA_ROCKET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ARENA_MG_KILLS", 500)
	stats.set_int(MPX() .. "ARENA_MG_DEATHS", 100)
	stats.set_int(MPX() .. "ARENA_MG_SHOTS", 500)
	stats.set_int(MPX() .. "ARENA_MG_HITS", 500)
	stats.set_int(MPX() .. "ARENA_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ARENA_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ARENA_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ARENA_HM_KILLS", 500)
	stats.set_int(MPX() .. "ARENA_HM_DEATHS", 100)
	stats.set_int(MPX() .. "ARENA_HM_SHOTS", 500)
	stats.set_int(MPX() .. "ARENA_HM_HITS", 500)
	stats.set_int(MPX() .. "ARENA_HM_HELDTIME", 5963259)
	stats.set_int(MPX() .. "RCMINE_KIN_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "RCMINE_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "RCMINE_KIN_HITS", 500)
	stats.set_int(MPX() .. "RCMINE_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_EMP_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_EMP_DEATHS", 100)
	stats.set_int(MPX() .. "RCMINE_EMP_SHOTS", 500)
	stats.set_int(MPX() .. "RCMINE_EMP_HITS", 500)
	stats.set_int(MPX() .. "RCMINE_EMP_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_SPI_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_SPI_DEATHS", 100)
	stats.set_int(MPX() .. "RCMINE_SPI_SHOTS", 500)
	stats.set_int(MPX() .. "RCMINE_SPI_HITS", 500)
	stats.set_int(MPX() .. "RCMINE_SPI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_SLI_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_SLI_DEATHS", 100)
	stats.set_int(MPX() .. "RCMINE_SLI_SHOTS", 500)
	stats.set_int(MPX() .. "RCMINE_SLI_HITS", 500)
	stats.set_int(MPX() .. "RCMINE_SLI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_TAR_KILLS", 500)
	stats.set_int(MPX() .. "RCMINE_TAR_DEATHS", 100)
	stats.set_int(MPX() .. "RCMINE_TAR_SHOTS", 500)
	stats.set_int(MPX() .. "RCMINE_TAR_HITS", 500)
	stats.set_int(MPX() .. "RCMINE_TAR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_DEATHS", 100)
	stats.set_int(MPX() .. "VEHMINE_SHOTS", 500)
	stats.set_int(MPX() .. "VEHMINE_HITS", 500)
	stats.set_int(MPX() .. "VEHMINE_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_KIN_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "VEHMINE_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "VEHMINE_KIN_HITS", 500)
	stats.set_int(MPX() .. "VEHMINE_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_EMP_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_EMP_DEATHS", 100)
	stats.set_int(MPX() .. "VEHMINE_EMP_SHOTS", 500)
	stats.set_int(MPX() .. "VEHMINE_EMP_HITS", 500)
	stats.set_int(MPX() .. "VEHMINE_EMP_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_SPI_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_SPI_DEATHS", 100)
	stats.set_int(MPX() .. "VEHMINE_SPI_SHOTS", 500)
	stats.set_int(MPX() .. "VEHMINE_SPI_HITS", 500)
	stats.set_int(MPX() .. "VEHMINE_SPI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_SLI_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_SLI_DEATHS", 100)
	stats.set_int(MPX() .. "VEHMINE_SLI_SHOTS", 500)
	stats.set_int(MPX() .. "VEHMINE_SLI_HITS", 500)
	stats.set_int(MPX() .. "VEHMINE_SLI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_TAR_KILLS", 500)
	stats.set_int(MPX() .. "VEHMINE_TAR_DEATHS", 100)
	stats.set_int(MPX() .. "VEHMINE_TAR_SHOTS", 500)
	stats.set_int(MPX() .. "VEHMINE_TAR_HITS", 500)
	stats.set_int(MPX() .. "VEHMINE_TAR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ZR3803_MG50_KILLS", 500)
	stats.set_int(MPX() .. "ZR3803_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "ZR3803_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "ZR3803_MG50_HITS", 500)
	stats.set_int(MPX() .. "ZR3803_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ZR3803_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ZR3803_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ZR3802_MG50_KILLS", 500)
	stats.set_int(MPX() .. "ZR3802_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "ZR3802_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "ZR3802_MG50_HITS", 500)
	stats.set_int(MPX() .. "ZR3802_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ZR3802_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ZR3802_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ZR3802_LAS_KILLS", 500)
	stats.set_int(MPX() .. "ZR3802_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "ZR3802_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "ZR3802_LAS_HITS", 500)
	stats.set_int(MPX() .. "ZR3802_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ZR3802_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ZR3802_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ZR380_MG50_KILLS", 500)
	stats.set_int(MPX() .. "ZR380_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "ZR380_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "ZR380_MG50_HITS", 500)
	stats.set_int(MPX() .. "ZR380_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ZR380_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ZR380_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN4_MG50_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN4_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "SLAMVAN4_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN4_MG50_HITS", 500)
	stats.set_int(MPX() .. "SLAMVAN4_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN4_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SLAMVAN4_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_MG50_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "SLAMVAN5_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_MG50_HITS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SLAMVAN5_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_LAS_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "SLAMVAN5_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_LAS_HITS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN5_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SLAMVAN5_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN6_MG50_KILLS", 500)
	stats.set_int(MPX() .. "SLAMVAN6_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "SLAMVAN6_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN6_MG50_HITS", 500)
	stats.set_int(MPX() .. "SLAMVAN6_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SLAMVAN6_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SLAMVAN6_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB_MG50_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "SCARAB_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "SCARAB_MG50_HITS", 500)
	stats.set_int(MPX() .. "SCARAB_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SCARAB_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SCARAB_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB2_MG50_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB2_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "SCARAB2_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "SCARAB2_MG50_HITS", 500)
	stats.set_int(MPX() .. "SCARAB2_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SCARAB2_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SCARAB2_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB2_LAS_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB2_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "SCARAB2_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "SCARAB2_LAS_HITS", 500)
	stats.set_int(MPX() .. "SCARAB2_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SCARAB2_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SCARAB2_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB3_MG50_KILLS", 500)
	stats.set_int(MPX() .. "SCARAB3_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "SCARAB3_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "SCARAB3_MG50_HITS", 500)
	stats.set_int(MPX() .. "SCARAB3_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SCARAB3_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SCARAB3_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MONSTER3_KIN_KILLS", 500)
	stats.set_int(MPX() .. "MONSTER3_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "MONSTER3_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "MONSTER3_KIN_HITS", 500)
	stats.set_int(MPX() .. "MONSTER3_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MONSTER3_KIN_ENEMY_KILL", 500)
	stats.set_int(MPX() .. "MONSTER4_KIN_KILLS", 500)
	stats.set_int(MPX() .. "MONSTER4_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "MONSTER4_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "MONSTER4_KIN_HITS", 500)
	stats.set_int(MPX() .. "MONSTER4_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MONSTER4_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "MONSTER5_KIN_KILLS", 500)
	stats.set_int(MPX() .. "MONSTER5_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "MONSTER5_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "MONSTER5_KIN_HITS", 500)
	stats.set_int(MPX() .. "MONSTER5_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "MONSTER5_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ISSI4_MG50_KILLS", 500)
	stats.set_int(MPX() .. "ISSI4_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "ISSI4_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "ISSI4_MG50_HITS", 500)
	stats.set_int(MPX() .. "ISSI4_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ISSI4_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ISSI4_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ISSI4_KIN_KILLS", 500)
	stats.set_int(MPX() .. "ISSI4_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "ISSI4_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "ISSI4_KIN_HITS", 500)
	stats.set_int(MPX() .. "ISSI4_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ISSI4_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ISSI5_MG50_KILLS", 500)
	stats.set_int(MPX() .. "ISSI5_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "ISSI5_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "ISSI5_MG50_HITS", 500)
	stats.set_int(MPX() .. "ISSI5_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ISSI5_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ISSI5_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ISSI5_LAS_KILLS", 500)
	stats.set_int(MPX() .. "ISSI5_LAS_DEATHS", 100)
	stats.set_int(MPX() .. "ISSI5_LAS_SHOTS", 500)
	stats.set_int(MPX() .. "ISSI5_LAS_HITS", 500)
	stats.set_int(MPX() .. "ISSI5_LAS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ISSI5_LAS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ISSI5_LAS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ISSI5_KIN_KILLS", 500)
	stats.set_int(MPX() .. "ISSI5_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "ISSI5_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "ISSI5_KIN_HITS", 500)
	stats.set_int(MPX() .. "ISSI5_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ISSI5_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ISSI6_MG50_KILLS", 500)
	stats.set_int(MPX() .. "ISSI6_MG50_DEATHS", 100)
	stats.set_int(MPX() .. "ISSI6_MG50_SHOTS", 500)
	stats.set_int(MPX() .. "ISSI6_MG50_HITS", 500)
	stats.set_int(MPX() .. "ISSI6_MG50_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ISSI6_MG50_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ISSI6_MG50_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ISSI6_KIN_KILLS", 500)
	stats.set_int(MPX() .. "ISSI6_KIN_DEATHS", 100)
	stats.set_int(MPX() .. "ISSI6_KIN_SHOTS", 500)
	stats.set_int(MPX() .. "ISSI6_KIN_HITS", 500)
	stats.set_int(MPX() .. "ISSI6_KIN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ISSI6_KIN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ARN_SPECTATOR_KILLS", 500)
	stats.set_int(MPX() .. "ARN_LIFETIME_KILLS", 500)
	stats.set_int(MPX() .. "ARN_LIFETIME_DEATHS", 100)
	stats.set_int(MPX() .. "TRSMALL2_QUAD_KILLS", 500)
	stats.set_int(MPX() .. "TRSMALL2_QUAD_DEATHS", 100)
	stats.set_int(MPX() .. "TRSMALL2_QUAD_SHOTS", 500)
	stats.set_int(MPX() .. "TRSMALL2_QUAD_HITS", 500)
	stats.set_int(MPX() .. "TRSMALL2_QUAD_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TRSMALL2_QUAD_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TRSMALL2_QUAD_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TRSMALL2_DUAL_KILLS", 500)
	stats.set_int(MPX() .. "TRSMALL2_DUAL_DEATHS", 100)
	stats.set_int(MPX() .. "TRSMALL2_DUAL_SHOTS", 500)
	stats.set_int(MPX() .. "TRSMALL2_DUAL_HITS", 500)
	stats.set_int(MPX() .. "TRSMALL2_DUAL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TRSMALL2_DUAL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TRSMALL2_MISS_KILLS", 500)
	stats.set_int(MPX() .. "TRSMALL2_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "TRSMALL2_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "TRSMALL2_MISS_HITS", 500)
	stats.set_int(MPX() .. "TRSMALL2_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TRSMALL2_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TRLARGE_CANNON_KILLS", 500)
	stats.set_int(MPX() .. "TRLARGE_CANNON_DEATHS", 100)
	stats.set_int(MPX() .. "TRLARGE_CANNON_SHOTS", 500)
	stats.set_int(MPX() .. "TRLARGE_CANNON_HITS", 500)
	stats.set_int(MPX() .. "TRLARGE_CANNON_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TRLARGE_CANNON_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_MINI_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "POUNDER2_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "POUNDER2_MINI_HITS", 500)
	stats.set_int(MPX() .. "POUNDER2_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "POUNDER2_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "POUNDER2_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_MISS_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "POUNDER2_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "POUNDER2_MISS_HITS", 500)
	stats.set_int(MPX() .. "POUNDER2_MISS_HEADSHOTS", 500)
	stats.set_int(MPX() .. "POUNDER2_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "POUNDER2_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_BARR_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_BARR_DEATHS", 100)
	stats.set_int(MPX() .. "POUNDER2_BARR_SHOTS", 500)
	stats.set_int(MPX() .. "POUNDER2_BARR_HITS", 500)
	stats.set_int(MPX() .. "POUNDER2_BARR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "POUNDER2_BARR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_GL_KILLS", 500)
	stats.set_int(MPX() .. "POUNDER2_GL_DEATHS", 100)
	stats.set_int(MPX() .. "POUNDER2_GL_SHOTS", 500)
	stats.set_int(MPX() .. "POUNDER2_GL_HITS", 500)
	stats.set_int(MPX() .. "POUNDER2_GL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "POUNDER2_GL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MG_KILLS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MG_DEATHS", 100)
	stats.set_int(MPX() .. "SCRAMJET_MG_SHOTS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MG_HITS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SCRAMJET_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MISS_KILLS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "SCRAMJET_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MISS_HITS", 500)
	stats.set_int(MPX() .. "SCRAMJET_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SCRAMJET_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MG_KILLS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MG_DEATHS", 100)
	stats.set_int(MPX() .. "SPEEDO4_MG_SHOTS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MG_HITS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SPEEDO4_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SPEEDO4_TURR_KILLS", 500)
	stats.set_int(MPX() .. "SPEEDO4_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "SPEEDO4_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "SPEEDO4_TURR_HITS", 500)
	stats.set_int(MPX() .. "SPEEDO4_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SPEEDO4_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SPEEDO4_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MINI_KILLS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "SPEEDO4_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MINI_HITS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SPEEDO4_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SPEEDO4_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_BAR_KILLS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_BAR_DEATHS", 100)
	stats.set_int(MPX() .. "STRIKEFORCE_BAR_SHOTS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_BAR_HITS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_BAR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STRIKEFORCE_BAR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_CAN_KILLS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_CAN_DEATHS", 100)
	stats.set_int(MPX() .. "STRIKEFORCE_CAN_SHOTS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_CAN_HITS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_CAN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STRIKEFORCE_CAN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_MIS_KILLS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_MIS_DEATHS", 100)
	stats.set_int(MPX() .. "STRIKEFORCE_MIS_SHOTS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_MIS_HITS", 500)
	stats.set_int(MPX() .. "STRIKEFORCE_MIS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "STRIKEFORCE_MIS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TERBYTE_MISS_KILLS", 500)
	stats.set_int(MPX() .. "TERBYTE_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "TERBYTE_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "TERBYTE_MISS_HITS", 500)
	stats.set_int(MPX() .. "TERBYTE_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TERBYTE_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TERBYTE_HMISS_KILLS", 500)
	stats.set_int(MPX() .. "TERBYTE_HMISS_DEATHS", 100)
	stats.set_int(MPX() .. "TERBYTE_HMISS_SHOTS", 500)
	stats.set_int(MPX() .. "TERBYTE_HMISS_HITS", 500)
	stats.set_int(MPX() .. "TERBYTE_HMISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TERBYTE_HMISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CARACARA_MINI_KILLS", 500)
	stats.set_int(MPX() .. "CARACARA_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "CARACARA_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "CARACARA_MINI_HITS", 500)
	stats.set_int(MPX() .. "CARACARA_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "CARACARA_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "CARACARA_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "CARACARA_TURR_KILLS", 500)
	stats.set_int(MPX() .. "CARACARA_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "CARACARA_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "CARACARA_TURR_HITS", 500)
	stats.set_int(MPX() .. "CARACARA_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "CARACARA_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "CARACARA_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SPARROW_MINI_KILLS", 500)
	stats.set_int(MPX() .. "SPARROW_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "SPARROW_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "SPARROW_MINI_HITS", 500)
	stats.set_int(MPX() .. "SPARROW_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "SPARROW_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SPARROW_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SPARROW_ROCKET_KILLS", 500)
	stats.set_int(MPX() .. "SPARROW_ROCKET_DEATHS", 100)
	stats.set_int(MPX() .. "SPARROW_ROCKET_SHOTS", 500)
	stats.set_int(MPX() .. "SPARROW_ROCKET_HITS", 500)
	stats.set_int(MPX() .. "SPARROW_ROCKET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "SPARROW_ROCKET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "APC_CANN_KILLS", 500)
	stats.set_int(MPX() .. "APC_CANN_DEATHS", 100)
	stats.set_int(MPX() .. "APC_CANN_SHOTS", 500)
	stats.set_int(MPX() .. "APC_CANN_HITS", 500)
	stats.set_int(MPX() .. "APC_CANN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "APC_CANN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "APC_MISS_KILLS", 500)
	stats.set_int(MPX() .. "APC_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "APC_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "APC_MISS_HITS", 500)
	stats.set_int(MPX() .. "APC_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "APC_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "APC_MG_KILLS", 500)
	stats.set_int(MPX() .. "APC_MG_DEATHS", 100)
	stats.set_int(MPX() .. "APC_MG_SHOTS", 500)
	stats.set_int(MPX() .. "APC_MG_HITS", 500)
	stats.set_int(MPX() .. "APC_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "APC_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "APC_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "ARDENT_MG_KILLS", 500)
	stats.set_int(MPX() .. "ARDENT_MG_DEATHS", 100)
	stats.set_int(MPX() .. "ARDENT_MG_SHOTS", 500)
	stats.set_int(MPX() .. "ARDENT_MG_HITS", 500)
	stats.set_int(MPX() .. "ARDENT_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "ARDENT_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "ARDENT_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DUNE3_MG_KILLS", 500)
	stats.set_int(MPX() .. "DUNE3_MG_DEATHS", 100)
	stats.set_int(MPX() .. "DUNE3_MG_SHOTS", 500)
	stats.set_int(MPX() .. "DUNE3_MG_HITS", 500)
	stats.set_int(MPX() .. "DUNE3_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DUNE3_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DUNE3_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DUNE3_GL_KILLS", 500)
	stats.set_int(MPX() .. "DUNE3_GL_DEATHS", 100)
	stats.set_int(MPX() .. "DUNE3_GL_SHOTS", 500)
	stats.set_int(MPX() .. "DUNE3_GL_HITS", 500)
	stats.set_int(MPX() .. "DUNE3_GL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DUNE3_GL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "DUNE3_MINI_KILLS", 500)
	stats.set_int(MPX() .. "DUNE3_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "DUNE3_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "DUNE3_MINI_HITS", 500)
	stats.set_int(MPX() .. "DUNE3_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "DUNE3_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "DUNE3_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "HALFTRACK_DUAL_KILLS", 500)
	stats.set_int(MPX() .. "HALFTRACK_DUAL_DEATHS", 100)
	stats.set_int(MPX() .. "HALFTRACK_DUAL_SHOTS", 500)
	stats.set_int(MPX() .. "HALFTRACK_DUAL_HITS", 500)
	stats.set_int(MPX() .. "HALFTRACK_DUAL_HEADSHOTS", 500)
	stats.set_int(MPX() .. "HALFTRACK_DUAL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "HALFTRACK_DUAL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "HALFTRACK_QUAD_KILLS", 500)
	stats.set_int(MPX() .. "HALFTRACK_QUAD_DEATHS", 100)
	stats.set_int(MPX() .. "HALFTRACK_QUAD_SHOTS", 500)
	stats.set_int(MPX() .. "HALFTRACK_QUAD_HITS", 500)
	stats.set_int(MPX() .. "HALFTRACK_QUAD_HEADSHOTS", 500)
	stats.set_int(MPX() .. "HALFTRACK_QUAD_HELDTIME", 5963259)
	stats.set_int(MPX() .. "HALFTRACK_QUAD_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "INSURGENT3_MINI_KILLS", 500)
	stats.set_int(MPX() .. "INSURGENT3_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "INSURGENT3_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "INSURGENT3_MINI_HITS", 500)
	stats.set_int(MPX() .. "INSURGENT3_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "INSURGENT3_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "INSURGENT3_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "INSURGENT3_TURR_KILLS", 500)
	stats.set_int(MPX() .. "INSURGENT3_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "INSURGENT3_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "INSURGENT3_TURR_HITS", 500)
	stats.set_int(MPX() .. "INSURGENT3_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "INSURGENT3_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "INSURGENT3_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "NIGHTSHARK_MG_KILLS", 500)
	stats.set_int(MPX() .. "NIGHTSHARK_MG_DEATHS", 100)
	stats.set_int(MPX() .. "NIGHTSHARK_MG_SHOTS", 500)
	stats.set_int(MPX() .. "NIGHTSHARK_MG_HITS", 500)
	stats.set_int(MPX() .. "NIGHTSHARK_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "NIGHTSHARK_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "NIGHTSHARK_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MG_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MG_DEATHS", 100)
	stats.set_int(MPX() .. "OPPRESSOR_MG_SHOTS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MG_HITS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "OPPRESSOR_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MISS_KILLS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "OPPRESSOR_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MISS_HITS", 500)
	stats.set_int(MPX() .. "OPPRESSOR_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "OPPRESSOR_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_MISS_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_MISS_DEATHS", 100)
	stats.set_int(MPX() .. "TAMPA3_MISS_SHOTS", 500)
	stats.set_int(MPX() .. "TAMPA3_MISS_HITS", 500)
	stats.set_int(MPX() .. "TAMPA3_MISS_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TAMPA3_MISS_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_MORT_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_MORT_DEATHS", 100)
	stats.set_int(MPX() .. "TAMPA3_MORT_SHOTS", 500)
	stats.set_int(MPX() .. "TAMPA3_MORT_HITS", 500)
	stats.set_int(MPX() .. "TAMPA3_MORT_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TAMPA3_MORT_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_FMINI_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_FMINI_DEATHS", 100)
	stats.set_int(MPX() .. "TAMPA3_FMINI_SHOTS", 500)
	stats.set_int(MPX() .. "TAMPA3_FMINI_HITS", 500)
	stats.set_int(MPX() .. "TAMPA3_FMINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TAMPA3_FMINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TAMPA3_FMINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_DMINI_KILLS", 500)
	stats.set_int(MPX() .. "TAMPA3_DMINI_DEATHS", 100)
	stats.set_int(MPX() .. "TAMPA3_DMINI_SHOTS", 500)
	stats.set_int(MPX() .. "TAMPA3_DMINI_HITS", 500)
	stats.set_int(MPX() .. "TAMPA3_DMINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TAMPA3_DMINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TAMPA3_DMINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_MINI_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_MINI_DEATHS", 100)
	stats.set_int(MPX() .. "TECHNICAL3_MINI_SHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_MINI_HITS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_MINI_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_MINI_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TECHNICAL3_MINI_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_TURR_KILLS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_TURR_DEATHS", 100)
	stats.set_int(MPX() .. "TECHNICAL3_TURR_SHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_TURR_HITS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_TURR_HEADSHOTS", 500)
	stats.set_int(MPX() .. "TECHNICAL3_TURR_HELDTIME", 5963259)
	stats.set_int(MPX() .. "TECHNICAL3_TURR_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_ROCKET_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_ROCKET_DEATHS", 100)
	stats.set_int(MPX() .. "KHANJALI_ROCKET_SHOTS", 500)
	stats.set_int(MPX() .. "KHANJALI_ROCKET_HITS", 500)
	stats.set_int(MPX() .. "KHANJALI_ROCKET_HELDTIME", 5963259)
	stats.set_int(MPX() .. "KHANJALI_ROCKET_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_HCANN_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_HCANN_DEATHS", 100)
	stats.set_int(MPX() .. "KHANJALI_HCANN_SHOTS", 500)
	stats.set_int(MPX() .. "KHANJALI_HCANN_HITS", 500)
	stats.set_int(MPX() .. "KHANJALI_HCANN_HELDTIME", 5963259)
	stats.set_int(MPX() .. "KHANJALI_HCANN_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_MG_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_MG_DEATHS", 100)
	stats.set_int(MPX() .. "KHANJALI_MG_SHOTS", 500)
	stats.set_int(MPX() .. "KHANJALI_MG_HITS", 500)
	stats.set_int(MPX() .. "KHANJALI_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "KHANJALI_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "KHANJALI_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_GL_KILLS", 500)
	stats.set_int(MPX() .. "KHANJALI_GL_DEATHS", 100)
	stats.set_int(MPX() .. "KHANJALI_GL_SHOTS", 500)
	stats.set_int(MPX() .. "KHANJALI_GL_HITS", 500)
	stats.set_int(MPX() .. "KHANJALI_GL_HELDTIME", 5963259)
	stats.set_int(MPX() .. "KHANJALI_GL_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "REVOLTER_MG_KILLS", 500)
	stats.set_int(MPX() .. "REVOLTER_MG_DEATHS", 100)
	stats.set_int(MPX() .. "REVOLTER_MG_SHOTS", 500)
	stats.set_int(MPX() .. "REVOLTER_MG_HITS", 500)
	stats.set_int(MPX() .. "REVOLTER_MG_HEADSHOTS", 500)
	stats.set_int(MPX() .. "REVOLTER_MG_HELDTIME", 5963259)
	stats.set_int(MPX() .. "REVOLTER_MG_ENEMY_KILLS", 500)
	stats.set_int(MPX() .. "SAVESTRA_MG_KILLS", 500)
	stats.set_int(MPX() .. "SAVESTRA_MG_DEATHS", 100)
	stats.set_int(MPX() .. "SAVESTRA_MG_SHOTS", 500)
	stats.set_int(MPX() .. "SAVESTRA_MG_HITS", 500)
	stats.set_int(MPX() .. "SAVESTRA_MG_HEADSHOTS", 500)
	stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_0", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_1", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_2", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_3", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_4", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_5", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_6", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_7", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_8", -1)
	stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_9", -1)
	stats.set_int("MPPLY_HEIST_ACH_TRACKER", -1)
	stats.set_int("MPPLY_GANGOPS_ALLINORDER", 100)
	stats.set_int("MPPLY_GANGOPS_LOYALTY", 100)
	stats.set_int("MPPLY_GANGOPS_CRIMMASMD", 100)
	stats.set_int("MPPLY_GANGOPS_LOYALTY2", 100)
	stats.set_int("MPPLY_GANGOPS_LOYALTY3", 100)
	stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", 100)
	stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", 100)
	stats.set_int("MPPLY_GANGOPS_SUPPORT", 100)
	stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", 600)
	stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", 1000)
	stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", 100)
	stats.set_int("MPPLY_TOTAL_RACES_WON", 500)
	stats.set_int("MPPLY_TOTAL_RACES_LOST", 250)
	stats.set_int("MPPLY_TOTAL_CUSTOM_RACES_WON", 500)
	stats.set_int("MPPLY_TOTAL_DEATHMATCH_LOST", 250)
	stats.set_int("MPPLY_TOTAL_DEATHMATCH_WON", 500)
	stats.set_int("MPPLY_TOTAL_TDEATHMATCH_LOST", 250)
	stats.set_int("MPPLY_TOTAL_TDEATHMATCH_WON", 500)
	stats.set_int("MPPLY_SHOOTINGRANGE_WINS", 500)
	stats.set_int("MPPLY_SHOOTINGRANGE_LOSSES", 250)
	stats.set_int("MPPLY_TENNIS_MATCHES_WON", 500)
	stats.set_int("MPPLY_TENNIS_MATCHES_LOST", 250)
	stats.set_int("MPPLY_GOLF_WINS", 500)
	stats.set_int("MPPLY_GOLF_LOSSES", 250)
	stats.set_int("MPPLY_DARTS_TOTAL_WINS", 500)
	stats.set_int("MPPLY_DARTS_TOTAL_MATCHES", 750)
	stats.set_int("MPPLY_SHOOTINGRANGE_TOTAL_MATCH", 800)
	stats.set_int("MPPLY_BJ_WINS", 500)
	stats.set_int("MPPLY_BJ_LOST", 250)
	stats.set_int("MPPLY_RACE_2_POINT_WINS", 500)
	stats.set_int("MPPLY_RACE_2_POINT_LOST", 250)
	stats.set_int("MPPLY_KILLS_PLAYERS", 3593)
	stats.set_int("MPPLY_DEATHS_PLAYER", 1002)
	stats.set_int("MPPLY_MISSIONS_CREATED", 500)
	stats.set_int("MPPLY_LTS_CREATED", 500)
	stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", 1598)
	stats.set_int("MPPLY_FM_MISSION_LIKES", 1500)
	stats.set_packed_stat_int(7315, 6) --WEAPON_STONE_HATCHET
	stats.set_packed_stat_int(18981, 4) --WEAPON_DOUBLEACTION
	stats.set_packed_stat_int(18982, 3) --Parts of the TM-02 Khanjali (tracks, remote grenade launcher and turret end/muzzle brake)
	stats.set_packed_stat_int(18983, 3) --Parts of the RCV (plow, door and water hose)
	stats.set_packed_stat_int(18984, 3) --Parts of the Chernobog (door, dual headlight set and wheels)
	stats.set_packed_stat_int(18985, 3) --Parts of the Thruster (exhaust, small rotors and handlebars/joysticks)
	stats.set_packed_stat_int(18986, 3) --Parts of the Avenger (wing, nose camera and rotor blade)
	stats.set_packed_stat_int(22050, 5) --Oppressor MK2 Trade Price
	stats.set_packed_stat_int(22051, 50) --Carved Wooden Box (Nightclub)
	stats.set_packed_stat_int(22052, 100) --Ammo Box
	stats.set_packed_stat_int(22053, 20) --Meth
	stats.set_packed_stat_int(22054, 80) --Weed
	stats.set_packed_stat_int(22055, 60) --Passports
	stats.set_packed_stat_int(22056, 40) --Crumpled Cash
	stats.set_packed_stat_int(22057, 10) --Impotent Rage Statue
	stats.set_packed_stat_int(22058, 20) --Gold Business Battle Trophy (Nightclub)
	stats.set_packed_stat_int(22063, 20) --Dinka Go Go Monkey Blista
	stats.set_packed_stat_int(41237, 10) --Taxi Livery
	stats.set_int(MPX() .. "HOLDUPS_BITSET", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED2", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_3_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_4_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED2", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED3", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED4", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED5", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED6", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_2_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_3_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_4_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_5_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_6_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_7_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_8_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_9_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_10_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_11_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_12_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_13_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_14_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_15_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_16_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_17_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_18_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_19_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_20_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_HAIRCUT_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK1", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK2", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK3", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK4", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK5", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK6", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK7", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK8", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK9", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK10", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK11", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK12", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK13", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK14", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK15", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK16", -1)
	stats.set_int(MPX() .. "CHAR_HAIR_UNLCK17", -1)
	stats.set_int(MPX() .. "CHAR_FM_HEALTH_1_UNLCK", -1)
	stats.set_int(MPX() .. "CHAR_FM_HEALTH_2_UNLCK", -1)
	stats.set_int(MPX() .. "RANKAP_UNLK_0", -1)
	stats.set_int(MPX() .. "RANKAP_UNLK_1", -1)
	stats.set_int(MPX() .. "RANKAP_UNLK_2", -1)
	stats.set_int(MPX() .. "RANKAP_UNLK_3", -1)
	stats.set_int(MPX() .. "CHAR_CREWUNLOCK_1_UNLCK", -1)
	stats.set_int(MPX() .. "PISTOL_ENEMY_KILLS", 600) -- Weapon Tints for Pistol
	stats.set_int(MPX() .. "CMBTPISTOL_ENEMY_KILLS", 600) -- Weapon Tints for Combat Pistol
	stats.set_int(MPX() .. "APPISTOL_ENEMY_KILLS", 600) -- Weapon Tints for AP Pistol
	stats.set_int(MPX() .. "MICROSMG_ENEMY_KILLS", 600) -- Weapon Tints for Micro SMG
	stats.set_int(MPX() .. "SMG_ENEMY_KILLS", 600) -- Weapon Tints for SMG
	stats.set_int(MPX() .. "ASLTSMG_ENEMY_KILLS", 600) -- Weapon Tints for Assault SMG
	stats.set_int(MPX() .. "ASLTRIFLE_ENEMY_KILLS", 600) -- Weapon Tints for Assault Rifle
	stats.set_int(MPX() .. "CRBNRIFLE_ENEMY_KILLS", 600) -- Weapon Tints for Carbine Rifle
	stats.set_int(MPX() .. "ADVRIFLE_ENEMY_KILLS", 600) -- Weapon Tints for Advanced Rifle
	stats.set_int(MPX() .. "MG_ENEMY_KILLS", 600) -- Weapon Tints for MG
	stats.set_int(MPX() .. "CMBTMG_ENEMY_KILLS", 600) -- Weapon Tints for Combat MG
	stats.set_int(MPX() .. "PUMP_ENEMY_KILLS", 600) -- Weapon Tints for Pump Shotgun
	stats.set_int(MPX() .. "SAWNOFF_ENEMY_KILLS", 600) -- Weapon Tints for Sawed-Off Shotgun
	stats.set_int(MPX() .. "ASLTSHTGN_ENEMY_KILLS", 600) -- Weapon Tints for Assault Shotgun
	stats.set_int(MPX() .. "SNIPERRFL_ENEMY_KILLS", 600) -- Weapon Tints for Sniper Rifle
	stats.set_int(MPX() .. "HVYSNIPER_ENEMY_KILLS", 600) -- Weapon Tints for Heavy Sniper
	stats.set_int(MPX() .. "GRNLAUNCH_ENEMY_KILLS", 600) -- Weapon Tints for Grenade Launcher
	stats.set_int(MPX() .. "RPG_ENEMY_KILLS", 600) -- Weapon Tints for Rocket Launcher
	stats.set_int(MPX() .. "MINIGUNS_ENEMY_KILLS", 600) -- Weapon Tints for Minigun
	unlock_packed_bools(25010, 25010) -- Skip arena wall help.
	unlock_packed_bools(25014, 25014) -- Skip arena wall tutorial.
	stats.set_int(MPX() .. "FIXER_HQ_OWNED", 1) -- Trade Price for buffalo4
	unlock_packed_bools(32312, 32312)
	stats.set_int(MPX() .. "REV_NV_KILLS", 50) -- Navy Revolver Kills
	stats.set_int(MPX() .. "XM22_FLOW", -1) -- Acid Lab Unlock
	stats.set_int(MPX() .. "XM22_MISSIONS", -1) -- Acid Lab Unlock
	stats.set_int(MPX() .. "AWD_CALLME", tunables.get_int(654710993)) -- Acid Lab Equipment Unlock
	stats.set_int(MPX() .. "H3_VEHICLESUSED", -1) -- Trade Price for Diamond Casino Heist Finale.
	stats.set_int(MPX() .. "H4_H4_DJ_MISSIONS", -1) -- Trade Price for weevil
	stats.set_int(MPX() .. "H4_PROGRESS", -1) -- Trade Price for winky
	stats.set_int(MPX() .. "TUNER_GEN_BS", -1) -- Trade Price for tailgater2
	stats.set_int(MPX() .. "ULP_MISSION_PROGRESS", -1) -- Trade Price greenwood/conada
	stats.set_int(MPX() .. "SUM23_AVOP_PROGRESS", -1) -- Trade Price Raiju
	stats.set_int(MPX() .. "GANGOPS_FLOW_BITSET_MISS0", -1) -- Trade Price for deluxo/akula/riot2/stromberg/chernobog/barrage/khanjali/volatol/thruster
	stats.set_bool(MPX() .. "AWD_TAXISTAR", true) -- Trade Price for taxi
	stats.set_bool("MPPLY_AWD_HST_ORDER", true)
	stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", true)
	stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", true)
	stats.set_int(MPX() .. "AT_FLOW_VEHICLE_BS", -1) -- Trade price for dune4/dune5/wastelander/blazer5/phantom2/voltic2/technical2/boxville5/ruiner2
	stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_COMPLET", 50) -- Trade price for microlight/rogue/alphaz1/havok/starling/molotok/tula/bombushka/howard/mogul/pyro/seabreeze/nokota/hunter
	stats.set_int(MPX() .. "SALV23_GEN_BS", -1) -- polgauntlet trade price
	stats.set_int(MPX() .. "SALV23_SCOPE_BS", -1) -- police5 trade price
	stats.set_int(MPX() .. "MOST_TIME_ON_3_PLUS_STARS", 300000) -- police4 trade price
end)
FAUT:add_separator()
Text("==========================")
FAUT:add_button("Time Related Stats 1 Click Only", function()
	stats.set_int("MPPLY_TOTAL_PLAYING_TIME", 2073600000)
	stats.set_int("MPPLY_LEADERBOARD_PLAYING_TIME", 2073600000)
	stats.set_int("MPPLY_MP_PLAYING_TIME_NEW", 2073600000)
	stats.set_int("MPPLY_LONGEST_PLAYING_TIME", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_CAR", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_PLANE", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_HELI", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_QUADBIKE", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_BIKE", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_BICYCLE", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_BOAT", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_SUBMARINE", 2073600000)
	stats.set_int("MPPLY_TIME_SWIMMING", 2073600000)
	stats.set_int("MPPLY_TIME_WALKING", 2073600000)
	stats.set_int("MPPLY_TIME_UNDERWATER", 2073600000)
	stats.set_int("MPPLY_TIME_IN_WATER", 2073600000)
	stats.set_int("MPPLY_TIME_IN_COVER", 2073600000)
	stats.set_int("MPPLY_TIME_DRIVING_PASSENGER", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_ON_PHONE", 2073600000)
	stats.set_int("MPPLY_TIME_AS_A_PASSENGER", 2073600000)
	stats.set_int("MPPLY_TIME_AS_A_DRIVER", 2073600000)
	stats.set_int("MPPLY_TIME_SPENT_FLYING", 2073600000)
	stats.set_int("MPPLY_TIME_IN_CAR", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_DEATHMAT", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_FREEMODE", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_MISSION_CREATO", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_RACES", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_ON_MISS", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_UNDERWATER", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_CINEMA", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_LOAD_SCREEN", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_IN_LOBBY", 2073600000)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_DEATHMAT", 2147483647)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_RACES", 2147483647)
	stats.set_int("MPPLY_TOTAL_TIME_LOAD_SCREEN", 1047483647)
	stats.set_int("MPPLY_TOTAL_TIME_IN_LOBBY", 1047483647)
	stats.set_int(MPX() .. "TIME_AS_A_DRIVER", 2147483647)
	stats.set_int(MPX() .. "TIME_SPENT_FLYING", 2147483647)
	stats.set_int(MPX() .. "TIME_IN_CAR", 2147483647)
	stats.set_int(MPX() .. "TIME_AS_A_PASSENGER", 2147483647)
	stats.set_int(MPX() .. "TOTAL_TIME_CINEMA", 2147483647)
	stats.set_int(MPX() .. "TOTAL_CHASE_TIME", 432000000)
	stats.set_int(MPX() .. "ARN_SPEC_BOX_TIME_MS", 86400000)
	stats.set_int(MPX() .. "LONGEST_PLAYING_TIME", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_CAR", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_PLANE", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_HELI", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_QUADBIKE", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_BIKE", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_BICYCLE", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_BOAT", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_SUBMARINE", 1047483647)
	stats.set_int(MPX() .. "TIME_SWIMMING", 1047483647)
	stats.set_int(MPX() .. "TIME_WALKING", 1047483647)
	stats.set_int(MPX() .. "TIME_UNDERWATER", 1047483647)
	stats.set_int(MPX() .. "TIME_IN_WATER", 1047483647)
	stats.set_int(MPX() .. "TIME_IN_COVER", 1047483647)
	stats.set_int(MPX() .. "TIME_DRIVING_PASSENGER", 1047483647)
	stats.set_int(MPX() .. "TOTAL_TIME_SPENT_ON_PHONE", 1047483647)
	stats.set_int(MPX() .. "TIME_AS_A_PASSENGER", 1047483647)
	stats.set_int(MPX() .. "TIME_AS_A_DRIVER", 1047483647)
	stats.set_int(MPX() .. "TIME_SPENT_FLYING", 1047483647)
	stats.set_int(MPX() .. "TIME_IN_CAR", 1047483647)
	stats.set_int(MPX() .. "TOTAL_TIME_UNDERWATER", 1047483647)
	stats.set_int(MPX() .. "TOTAL_TIME_CINEMA", 1047483647)
end)
FAUT:add_separator()
Text("==========================")
FAUT:add_button("Bools Unlocks 1 Click Only", function()
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
	stats.set_bool(MPX() .. "IAP_CHALLENGE_2v", true)
	stats.set_bool(MPX() .. "IAP_CHALLENGE_3", true)
	stats.set_bool(MPX() .. "IAP_CHALLENGE_4v", true)
	stats.set_bool(MPX() .. "IAP_GOLD_TANK", true)
	stats.set_bool(MPX() .. "SCGW_WON_NO_DEATHS", true)
	stats.set_bool(MPX() .. "AWD_KINGOFQUB3D", true)
	stats.set_bool(MPX() .. "AWD_QUBISM", true)
	stats.set_bool(MPX() .. "AWD_QUIBITS", true)
	stats.set_bool(MPX() .. "AWD_GODOFQUB3D", true)
	stats.set_bool(MPX() .. "AWD_STRAIGHT_TO_VIDEO", true)
	stats.set_bool(MPX() .. "AWD_MONKEY_C_MONKEY_DO", true)
	stats.set_bool(MPX() .. "AWD_TRAINED_TO_KILL", true)
	stats.set_bool(MPX() .. "AWD_DIRECTOR", true)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_RSC_SEEN", true)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_BWL_SEEN", true)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_MTG_SEEN", true)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_OIL_SEEN", true)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_DEF_SEEN", true)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_FIN_SEEN", true)
	stats.set_bool(MPX() .. "WAS_CHAR_TRANSFERED", true)
	stats.set_bool(MPX() .. "CL_RACE_MODDED_CAR", true)
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
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_0", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_1", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_2", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_3", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_4", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_5", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_6", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_7", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_8", true)
	stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_9", true)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME1", true)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME2", true)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME3", true)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME4", true)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME5", true)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME6", true)
	stats.set_bool(MPX() .. "AWD_ALL_IN_ORDER", true)
	stats.set_bool(MPX() .. "AWD_SUPPORTING_ROLE", true)
	stats.set_bool(MPX() .. "AWD_ACTIVATE_2_PERSON_KEY", true)
	stats.set_bool(MPX() .. "AWD_ALL_ROLES_HEIST", true)
	stats.set_bool(MPX() .. "AWD_LEADER", true)
	stats.set_bool(MPX() .. "AWD_SURVIVALIST", true)
	stats.set_bool(MPX() .. "AWD_BUY_EVERY_GUN", true)
	stats.set_bool(MPX() .. "AWD_DAILYOBJMONTHBONUS", true)
	stats.set_bool(MPX() .. "AWD_DAILYOBJWEEKBONUS", true)
	stats.set_bool(MPX() .. "AWD_DRIVELESTERCAR5MINS", true)
	stats.set_bool(MPX() .. "AWD_FINISH_HEIST_NO_DAMAGE", true)
	stats.set_bool(MPX() .. "AWD_FM25DIFFERENTDM", true)
	stats.set_bool(MPX() .. "AWD_FM25DIFFERENTRACES", true)
	stats.set_bool(MPX() .. "AWD_FM25DIFITEMSCLOTHES", true)
	stats.set_bool(MPX() .. "AWD_FMFURTHESTWHEELIE", true)
	stats.set_bool(MPX() .. "AWD_FM6DARTCHKOUT", true)
	stats.set_bool(MPX() .. "AWD_FM_GOLF_HOLE_IN_1", true)
	stats.set_bool(MPX() .. "AWD_FM_SHOOTRANG_GRAN_WON", true)
	stats.set_bool(MPX() .. "AWD_FM_TENNIS_5_SET_WINS", true)
	stats.set_bool(MPX() .. "AWD_FMATTGANGHQ", true)
	stats.set_bool(MPX() .. "AWD_FMFULLYMODDEDCAR", true)
	stats.set_bool(MPX() .. "AWD_FMKILL3ANDWINGTARACE", true)
	stats.set_bool(MPX() .. "AWD_FMKILLSTREAKSDM", true)
	stats.set_bool(MPX() .. "AWD_FMMOSTKILLSGANGHIDE", true)
	stats.set_bool(MPX() .. "AWD_FMMOSTKILLSSURVIVE", true)
	stats.set_bool(MPX() .. "AWD_FMPICKUPDLCCRATE1ST", true)
	stats.set_bool(MPX() .. "AWD_FMRACEWORLDRECHOLDER", true)
	stats.set_bool(MPX() .. "AWD_FMTATTOOALLBODYPARTS", true)
	stats.set_bool(MPX() .. "AWD_FMWINALLRACEMODES", true)
	stats.set_bool(MPX() .. "AWD_FMWINCUSTOMRACE", true)
	stats.set_bool(MPX() .. "AWD_FMWINEVERYGAMEMODE", true)
	stats.set_bool(MPX() .. "AWD_SPLIT_HEIST_TAKE_EVENLY", true)
	stats.set_bool(MPX() .. "AWD_STORE_20_CAR_IN_GARAGES", true)
	stats.set_bool(MPX() .. "SR_TIER_1_REWARD", true)
	stats.set_bool(MPX() .. "SR_TIER_3_REWARD", true)
	stats.set_bool(MPX() .. "SR_INCREASE_THROW_CAP", true)
	stats.set_bool(MPX() .. "AWD_CLUB_COORD", true)
	stats.set_bool(MPX() .. "AWD_CLUB_HOTSPOT", true)
	stats.set_bool(MPX() .. "AWD_CLUB_CLUBBER", true)
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
	stats.set_bool(MPX() .. "AWD_CONTACT_SPORT", true)
	stats.set_bool(MPX() .. "AWD_UNSTOPPABLE", true)
	stats.set_bool(MPX() .. "LOW_FLOW_CS_DRV_SEEN", true)
	stats.set_bool(MPX() .. "LOW_FLOW_CS_TRA_SEEN", true)
	stats.set_bool(MPX() .. "LOW_FLOW_CS_FUN_SEEN", true)
	stats.set_bool(MPX() .. "LOW_FLOW_CS_PHO_SEEN", true)
	stats.set_bool(MPX() .. "LOW_FLOW_CS_FIN_SEEN", true)
	stats.set_bool(MPX() .. "LOW_BEN_INTRO_CS_SEEN", true)
	stats.set_bool(MPX() .. "CASINOPSTAT_BOOL0", true)
	stats.set_bool(MPX() .. "CASINOPSTAT_BOOL1", true)
	stats.set_bool(MPX() .. "FILM4SHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "FILM5SHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "FILM6SHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "FILM7SHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "FILM8SHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "FILM9SHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "ACCOUNTANTSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "BAHAMAMAMASHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "DRONESHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "GROTTISHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "GOLFSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "MAISONETTESHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "MANOPAUSESHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "MELTDOWNSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "PACIFICBLUFFSSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "PROLAPSSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "TENNISSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "TOESHOESSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "VANILLAUNICORNSHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "MARLOWESHIRTUNLOCK", true)
	stats.set_bool(MPX() .. "CRESTSHIRTUNLOCK", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_ALLINORDER", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY2", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD2", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY3", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD3", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD", true)
	stats.set_bool("MPPLY_MELEECHLENGECOMPLETED", true)
	stats.set_bool("MPPLY_HEADSHOTCHLENGECOMPLETED", true)
	stats.set_bool("MPPLY_AWD_COMPLET_HEIST_MEM", true)
	stats.set_bool("MPPLY_AWD_COMPLET_HEIST_1STPER", true)
	stats.set_bool("MPPLY_AWD_FLEECA_FIN", true)
	stats.set_bool("MPPLY_AWD_HST_ORDER", true)
	stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", true)
	stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", true)
	stats.set_bool("MPPLY_AWD_HUMANE_FIN", true)
	stats.set_bool("MPPLY_AWD_PACIFIC_FIN", true)
	stats.set_bool("MPPLY_AWD_PRISON_FIN", true)
	stats.set_bool("MPPLY_AWD_SERIESA_FIN", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_IAA", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_SUBMARINE", true)
	stats.set_bool("MPPLY_AWD_GANGOPS_MISSILE", true)
end)

FAUT:add_separator()
FAUT:add_button("Unlock Diamond Casino Heist Outfits", function()
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL1", true, 63) -- Refuse Collectors
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 0) -- Undertakers
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 1) -- Valet Outfits
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 3) -- Prison Guards
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 4) -- FIB Suits
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 6) -- Gruppe Sechs Gear
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 7) -- Bugstars Uniforms
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 8) -- Maintenance
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 9) -- Yung Ancestors
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 10) -- Firefighter Gear
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 11) -- Orderly Armor
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 12) -- Upscale Armor
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 13) -- Evening Armor
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 14) -- Reinforced: Padded Combat
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 15) -- Reinforced: Bulk Combat
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 16) -- Reinforced: Compact Combat
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 17) -- Balaclava Crook
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 18) -- Classic Crook
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 19) -- High-end Crook
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 20) -- Infiltration: Upgraded Tech
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 21) -- Infiltration: Advanced Tech
	stats.set_bool_masked(MPX() .. "CASINOHSTPSTAT_BOOL2", true, 22) -- Infiltration: Modernized Tech
end)

FAUT:add_separator()
FAUT:add_button("Unlock Taxi Livery for Eudora", function()
	stats.set_masked_int(MPX() .. "DLC22022PSTAT_INT536", 10, 16, 8)
end)

FAUT:add_button("Unlock Taxi Livery for Broadway", function()
	stats.set_int(MPX() .. "AWD_TAXIDRIVER", 50)
end)

FAUT:add_button("Unlock Oppressor MKII Trade Price", function()
	stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 5, 5, 5) --Pegassi Oppressor Mk II (Trade Price)
end)

Text("Join New Session Once And")
Text("Notifications Will Stop")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

LSCMUnlockeRecoveryMenu = L7NEG:add_tab("LSCM Unlocker Menu")

LSCMUnlockeRecoveryMenu:add_button("Unlock All Rep Lvl 1000", function()
	for i = 262145 + 30958, 262145 + 30987 do
		globals.set_float(i, 100000)
	end
end)

LSCMUnlockeRecoveryMenu:add_button("LSCM Prize Ride Unlock", function()
	stats.set_bool(MPX() .. "CARMEET_PV_CHLLGE_CMPLT", true)
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

--© 2023 L7NEG's Official Discord Server. All Rights Reserved--

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7 = L7NEG:add_tab("Ultimate Money Methods Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CeoManagerMenu = L7NEG7:add_tab("Ceo Manager Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--©️ 2024 ΞΛZТΞΛ#0157/SLON
CEO1 = 262145 + 15732
CEO2 = 262145 + 15499
CEO3 = 262145 + 15500
SMC1 = 545 + 1
SMC2 = 545 + 7
SMC3 = 545 + 584
SMC4 = 545 + 55
SMC5 = 545 + 595
SMC6 = 560
SMC7 = 741
SMC8 = 742
SMC9 = 603 + 5
SMC10 = 603 + 1
SMC11 = 603 + 191
SMC12 = 603 + 192

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

local gun_van_tab = L7NEG:add_tab("Gun Van Menu")

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
	gun_van_loc = globals.get_int(2652592 + 2671)

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

gun_van_tab:add_imgui(function()
	if weapon_editor_popup then
		render_weapon_editor()
	end

	ImGui.Text("Current Location: " .. (gun_van_loc ~= -1 and gun_van_loc + 1 or "N/A"))

	ImGui.SetNextItemWidth(265)
	selected_loc = ImGui.Combo("##selected_loc", selected_loc, van_locations, 30)

	ImGui.SameLine()

	if ImGui.Button("Set New Gun Van Location") then
		globals.set_int(2652592 + 2671, selected_loc)
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

WareHouseDataEditorMenu = CeoManagerMenu:add_tab("WareHouse Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WareHouseDataEditorMenu:add_button("Reset Crate Sell Stats-0/0 Sales", function()
	stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", 0)
	stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", 0)
	stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", 0)
	stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", 0)
	stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", 0)
	globals.set_int(1575035, 11) ----PlayerSessionBlank--------
	globals.set_int(1574589, 1) ----PlayerSessionNew----------
	sleep(2)
	globals.set_int(1574589, 0) ----PlayerSessionNew------
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

NightClubSafeMenu = L7NEG7:add_tab("NightClub Safe Loop Menu")

NCSCB = NightClubSafeMenu:add_checkbox("Enable Nitghtclub $250k/15s (Safe AFK)")
script.register_looped("nightclubloop", function(script)
	script:yield()
	if NCSCB:is_enabled() == true then
		stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
		stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
		script:sleep(2500)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HeistsDataEditorMenu = L7NEG:add_tab("Heists Data Editor Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ApartmentDataEditorMenu = HeistsDataEditorMenu:add_tab("Apartment Data Editor Menu")

ApartmentDataEditorMenu:add_button("Skip Current Apartment Heist Preps", function()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
end)

ApartmentDataEditorMenu:add_sameline()

ApartmentDataEditorMenu:add_button("Reset Current Apartment Heist Preps", function()
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
end)
ApartmentDataEditorMenu:add_text("Note: After Clicking Unlock All jobs, restart the game")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Casino Heist")

fm_mission_controller_cart_grab = 10255
fm_mission_controller_cart_grab_speed = 14
fm_mission_controller_cart_autograb = false

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

CasinoHeistEditorMenu:add_button("One Click Setup Casino Agrresive Mode", function()
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
	locals.set_int(FMC2020, 50150, 9)
	locals.set_int(FMC2020, 50150 + 1770 + 1, 50)
	gui.show_message("Instant Heist Passed", "Activated")
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
	locals.set_int(HIP, 1546, 2)
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
	locals.set_int(FMC2020, 50150, 9)
	locals.set_int(FMC2020, 50150 + 1770 + 1, 50)
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
	locals.set_int(HIP, 1546, 2)
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
DoomsdayHeistEditorMenu:add_text("By pass Doomsday Scenario hack")
DoomsdayHeistEditorMenu:add_button("By Act III Pass hack", function()
	locals.set_int(FMC, DDSHl, 3)
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Instant Heist Passed")
DoomsdayHeistEditorMenu:add_button("Instant Finish $$", function()
	locals.set_int(FMC, 19746, 12)
	locals.set_int(FMC, 19746 + 2686, 10000000)
	locals.set_int(FMC, 28365 + 1, 99999)
	locals.set_int(FMC, 31621 + 69, 99999)
	gui.show_message("Instant Heist Passed", "Activated")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MissionsSelectorAndCooldownMenu = L7NEG:add_tab("Missions Selector And cooldown Menu")

MissionsSelectorAndCooldownMenu:add_button("Remove Dax Missions CoolDown ", function()
	stats.set_int(MPX() .. "_XM22JUGGALOWORKCDTIMER", -1)
end)

MissionsSelectorAndCooldownMenu:add_button("Remove VIP/MC Cool Down", function()
	stats.set_int("MPPLY_VIPGAMEPLAYDISABLEDTIMER", 0)
end)

MissionsSelectorAndCooldownMenu:add_button("Skip Yacht Misions", function()
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
Yimura:add_text("https://github.com/YimMenu/YimMenu")

L7NEGDEV = CreditsMenu:add_tab("L7NEG")
L7NEGDEV:add_text("Codded This W Script With <3 To You All")
L7NEGDEV:add_text("Source:")
L7NEGDEV:add_text("https://github.com/YimMenu-Lua/Utimate-Menu")

PLANTINDESK = CreditsMenu:add_tab("plantindesk")
PLANTINDESK:add_text("For His W Cuts Editor And Useful Heists Hax")
PLANTINDESK:add_text("Source:")
PLANTINDESK:add_text("https://github.com/plantindesk/Silent-Night")

SILENTSALO = CreditsMenu:add_tab("Silent")
SILENTSALO:add_text("For His W Useful Unlocls Along With Casino And Gunvan Menu")
SILENTSALO:add_text("Source:")
SILENTSALO:add_text("https://github.com/SilentSal0/Silent-Night")

visionary2709 = CreditsMenu:add_tab("visionary2709")
visionary2709:add_text("For His W Updated Globals of 200 Vehicles")
visionary2709:add_text("Source:")
visionary2709:add_text("https://github.com/YimMenu-Lua/Removed-vehicles")

SLON = CreditsMenu:add_tab("SLON")
SLON:add_text("For ''YimCeo v0.6 by Slon_.lua'' Code")
SLON:add_text("Source:")
SLON:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")

Alestarov = CreditsMenu:add_tab("Alestarov")
Alestarov:add_text("For 1 Click Cayo Setup")
Alestarov:add_text("Source:")
Alestarov:add_text("https://github.com/YimMenu-Lua/Alestarov-Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
