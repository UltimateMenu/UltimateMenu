--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MPX = PI
PI = stats.get_int("MPPLY_LAST_MP_CHAR")
if PI == 0 then
	MPX = "MP0_"
else
	MPX = "MP1_"
end

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
DCCl = FMg +28313  -- Casino_Cut_Lester_offset
DCCh = FMg+28349-1 --Casino_Cut_Hacker_offset
DCCd = FMg+28344-1 --Casino_Cut_Driver_offset
DCCgun = FMg + 28339-1 --Casino_Cut_Gunman_offset
DCFHl = 53019      -- diamond casino fingerprint hack local
DCKHl = 54085      -- diamond casino keypad hack local
DCDVDl1 = 10109 + 7 -- diamond casino drill vault door local 1
DCDVDl2 = 10109 + 37 -- diamond casino drill vault door local 2

GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)
CPRSl = 1546 -- cayo perico reload screen local //correct
CPCg1 = 1971648 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1971648 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1971648 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1971648 + 831 + 56 + 4 -- cayo perico player 4 cut global
CPBg = FMg + 29211 -- cayo perico bag global (1859395035)
CPFHl = 24880  -- cayo perico fingerprint hack local 
CPPCCl = 30939 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") 
CPSTCl = 29700 -- cayo perico drainage pipe cut local

DDSHl = 1271 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1960755 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1960755 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1960755 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1960755 + 812 + 50 + 4 -- doomsday player 4 cut global

--BV = Ballastic Value----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BV = 262145 + 20024

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

L7NEG:add_text("        Ultimate Menu 1.69 ")
L7NEG:add_text("                  v2.2")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self = L7NEG:add_tab("Self Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_button("Remove Orbital Cannon Cooldown", function()
	STATS.STAT_SET_INT(joaat(MPX .. "ORBITAL_CANNON_COOLDOWN"), 0, true)
end)

Self:add_button("Remove Transaction Error", function()
	for i = 4537456, 4537458 do
		globals.set_int(i, 0)
	end
end)

Self:add_button("Refil Nightclub Popularity", function()
	STATS.STAT_SET_INT(joaat(MPX .. "CLUB_POPULARITY"), 1000, true)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_button("Refill Inventory/Armour", function()
	STATS.STAT_SET_INT(joaat(MPX .. "NO_BOUGHT_YUM_SNACKS"), 30, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NO_BOUGHT_HEALTH_SNACKS"), 15, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NO_BOUGHT_EPIC_SNACKS"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_CHAMP_BOUGHT"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_ORANGE_BOUGHT"), 11, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_BOURGE_BOUGHT"), 10, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_SPRUNK_BOUGHT"), 10, true)
	STATS.STAT_SET_INT(joaat(MPX .. "CIGARETTES_BOUGHT"), 20, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_1_COUNT"), 10, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_2_COUNT"), 10, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_3_COUNT"), 10, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_4_COUNT"), 10, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_5_COUNT"), 10, true)
	STATS.STAT_SET_INT(joaat(MPX .. "BREATHING_APPAR_BOUGHT"), 20, true)
end)

Self:add_button("Refill Inv/Armour x1000", function()
	STATS.STAT_SET_INT(joaat(MPX .. "NO_BOUGHT_YUM_SNACKS"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NO_BOUGHT_HEALTH_SNACKS"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NO_BOUGHT_EPIC_SNACKS"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_CHAMP_BOUGHT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_ORANGE_BOUGHT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_BOURGE_BOUGHT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "NUMBER_OF_SPRUNK_BOUGHT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "CIGARETTES_BOUGHT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_1_COUNT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_2_COUNT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_3_COUNT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_4_COUNT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "MP_CHAR_ARMOUR_5_COUNT"), 1000, true)
	STATS.STAT_SET_INT(joaat(MPX .. "BREATHING_APPAR_BOUGHT"), 1000, true)
end)

StoryCharacters = L7NEG:add_tab("Story Mode")

MichaelsMoneyValue = stats.get_int("SP0_TOTAL_CASH")
StoryCharacters:add_imgui(function()
MichaelsMoneyValue, used = ImGui.SliderInt("Michael's Cash", MichaelsMoneyValue, 0, 2147483646)
    if used then
        STATS.STAT_SET_INT(joaat("SP0_TOTAL_CASH"), MichaelsMoneyValue, true)
    end
end)

FranklinsMoneyValue = stats.get_int("SP1_TOTAL_CASH")
StoryCharacters:add_imgui(function()
FranklinsMoneyValue, used = ImGui.SliderInt("Franklin's Cash", FranklinsMoneyValue, 0, 2147483646)
    if used then
        STATS.STAT_SET_INT(joaat("SP1_TOTAL_CASH"), FranklinsMoneyValue, true)
    end
end)

TrevorsMoneyValue = stats.get_int("SP2_TOTAL_CASH")
StoryCharacters:add_imgui(function()
TrevorsMoneyValue, used = ImGui.SliderInt("Trevor's Cash", TrevorsMoneyValue, 0, 2147483646)
    if used then
        STATS.STAT_SET_INT(joaat("SP2_TOTAL_CASH"), TrevorsMoneyValue, true)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TunMenu = L7NEG:add_tab("Tunables Menu")

rpmvalue = globals.get_float(262145 + 1)
TunMenu:add_imgui(function()
    rpmvalue, used = ImGui.DragInt("RP", rpmvalue, 1, 0, 100000)
    if used then
        globals.set_float(262145 + 1, rpmvalue)
    end
end)

apmvalue = globals.get_float(262145 + 25490)
TunMenu:add_imgui(function()
    apmvalue, used = ImGui.DragInt("AP", apmvalue, 1, 0, 100000)
    if used then
        globals.set_float(262145 + 25490, apmvalue)
    end
end)

srmvalue = globals.get_float(262145 + 30980)
TunMenu:add_imgui(function()
    srmvalue, used = ImGui.DragInt("Street Races", srmvalue, 1, 0, 100000)
    if used then
        globals.set_float(262145 + 30980, srmvalue)
    end
end)

pmvalue = globals.get_float(262145 + 30981)
TunMenu:add_imgui(function()
    pmvalue, used = ImGui.DragInt("Pursuits", pmvalue, 1, 0, 100000)
    if used then
        globals.set_float(262145 + 30981, pmvalue)
    end
end)

f2fmvalue = globals.get_float(262145 + 30982)
TunMenu:add_imgui(function()
    f2fmvalue, used = ImGui.DragInt("Face2Face", f2fmvalue, 1, 0, 100000)
    if used then
        globals.set_float(262145 + 30982, f2fmvalue)
    end
end)

lscmmvalue = globals.get_float(262145 + 30983)
TunMenu:add_imgui(function()
    lscmmvalue, used = ImGui.DragInt("LS Car Meet", lscmmvalue, 1, 0, 100000)
    if used then
        globals.set_float(262145 + 30983, lscmmvalue)
    end
end)

lscmotmvalue = globals.get_float(262145 + 30984)
TunMenu:add_imgui(function()
    lscmotmvalue, used = ImGui.DragInt("LS Car Meet on track", lscmotmvalue, 1, 0, 100000)
    if used then
        globals.set_float(262145 + 30984, lscmotmvalue)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

OnlineServicesMenu = L7NEG:add_tab("Online Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoServicesMenu = OnlineServicesMenu:add_tab("Casino Services Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
blackjack_cards         = 116
blackjack_table_players = 1776
blackjack_decks         = 846
 
three_card_poker_cards           = blackjack_cards
three_card_poker_table           = 749
three_card_poker_current_deck    = 168
three_card_poker_anti_cheat      = 1038
three_card_poker_anti_cheat_deck = 799
three_card_poker_deck_size       = 55
 
roulette_master_table   = 124
roulette_outcomes_table = 1357
roulette_ball_table     = 153
 
slots_random_results_table = 1348
 
prize_wheel_win_state   = 280
prize_wheel_prize       = 14
prize_wheel_prize_state = 45
 
globals_tuneable        = 262145
 
fm_mission_controller_cart_grab       = 10255
fm_mission_controller_cart_grab_speed = 14
fm_mission_controller_cart_autograb   = false
 
bypass_casino_bans = CasinoServicesMenu:add_checkbox("Bypass Casino Cooldown")
CasinoServicesMenu:add_text("Winning too much too quickly might get you banned, enable this at your own risk.")
CasinoServicesMenu:add_separator()
 
CasinoServicesMenu:add_text("Poker") --If his name is Al Pacino and he said, "It's not Al anymore, it's Dunk!", then his name should now be Dunk Pacino.
force_poker_cards = CasinoServicesMenu:add_checkbox("Force all Players Hands to Royal Flush")
CasinoServicesMenu:add_sameline()
set_dealers_poker_cards = CasinoServicesMenu:add_checkbox("Force Dealer's Hand to Bad Beat")
set_dealers_poker_cards:set_enabled(false)
 
function set_poker_cards(player_id, players_current_table, card_one, card_two, card_three)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (player_id * 3), card_one)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (1) + (player_id * 3), card_one)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (player_id * 3), card_two)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (player_id * 3), card_two)
    locals.set_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (player_id * 3), card_three)
    locals.set_int("three_card_poker", (three_card_poker_anti_cheat) + (three_card_poker_anti_cheat_deck) + (1) + (1 + (players_current_table * three_card_poker_deck_size)) + (3) + (player_id * 3), card_three)
end
 
function get_cardname_from_index(card_index)
    if card_index == 0 then
        return "Rolling"
    end
 
    local card_number = math.fmod(card_index, 13)
    local cardName = ""
    local cardSuit = ""
 
    if card_number == 1 then
        cardName = "Ace"
    elseif card_number == 11 then
        cardName = "Jack"
    elseif card_number == 12 then
        cardName = "Queen"
    elseif card_number == 13 then
        cardName = "King"
    else
        cardName = tostring(card_number)
    end
 
    if card_index >= 1 and card_index <= 13 then
        cardSuit = "Clubs"
    elseif card_index >= 14 and card_index <= 26 then
        cardSuit = "Diamonds"
    elseif card_index >= 27 and card_index <= 39 then
        cardSuit = "Hearts"
    elseif card_index >= 40 and card_index <= 52 then
        cardSuit = "Spades"
    end
 
    return cardName .. " of " .. cardSuit
end
 
CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Blackjack")
CasinoServicesMenu:add_text("Dealer's face down card: ")
CasinoServicesMenu:add_sameline()
dealers_card_gui_element = CasinoServicesMenu:add_input_string("##dealers_card_gui_element")
 
CasinoServicesMenu:add_button("Set Dealer's Hand To Bust", function()
    script.run_in_fiber(function (script)
        local player_id = PLAYER.PLAYER_ID()
        while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("blackjack", 3, 0) ~= player_id do 
            network.force_script_host("blackjack")
            gui.show_message("CasinoPacino", "Taking control of the blackjack script.") --If you see this spammed, someone if fighting you for control.
            script:yield()
        end
        local blackjack_table = locals.get_int("blackjack", blackjack_table_players + 1 + (player_id * 8) + 4) --The Player's current table he is sitting at.
        if blackjack_table ~= -1 then
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1, 11)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 2, 12)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 3, 13)
            locals.set_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 12, 3)
        end
    end)
end)
 
CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Roulette")
force_roulette_wheel = CasinoServicesMenu:add_checkbox("Force Roulette Wheel to Land On Red 18")
 
CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Slots")
rig_slot_machine = CasinoServicesMenu:add_checkbox("Rig Slot Machines")
 
CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Lucky Wheel")
 
CasinoServicesMenu:add_button("Give Podium Vehicle", function ()
    script.run_in_fiber(function (script)
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 18)
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11) 
        end
    end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Mystery Prize", function ()
    script.run_in_fiber(function (script)
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 11)
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11) 
        end
    end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give $50,000", function ()
    script.run_in_fiber(function (script)
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 19)
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11) 
        end
    end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give 25,000 Chips", function ()
    script.run_in_fiber(function (script)
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 15)
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11) 
        end
    end)
end)
CasinoServicesMenu:add_button("Give 15,000RP", function ()
    script.run_in_fiber(function (script)
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 17)
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11) 
        end
    end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Discount", function ()
    script.run_in_fiber(function (script)
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 4)
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11) 
        end
    end)
end)
CasinoServicesMenu:add_sameline()
CasinoServicesMenu:add_button("Give Clothing", function ()
    script.run_in_fiber(function (script)
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_lucky_wheel")) ~= 0 then
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize), 8)
            locals.set_int("casino_lucky_wheel", (prize_wheel_win_state) + (prize_wheel_prize_state), 11) 
        end
    end)
end)
 

 
CasinoServicesMenu:add_separator()
CasinoServicesMenu:add_text("Casino Heist")
 
CasinoServicesMenu:add_imgui(function()
    fm_mission_controller_cart_autograb,_ = ImGui.Checkbox("Auto Grab Cash/Gold/Diamonds", fm_mission_controller_cart_autograb)
end)
 
script.register_looped("Casino Pacino Thread", function (script)
    if force_poker_cards:is_enabled() then
        local player_id = PLAYER.PLAYER_ID()
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("three_card_poker")) ~= 0 then
            while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("three_card_poker", 3, 0) ~= player_id do 
                network.force_script_host("three_card_poker")
                gui.show_message("CasinoPacino", "Taking control of the three_card_poker script.") --If you see this spammed, someone if fighting you for control.
                script:sleep(500)
            end
            local players_current_table = locals.get_int("three_card_poker", three_card_poker_table + 1 + (player_id * 9) + 2) --The Player's current table he is sitting at.
            if (players_current_table ~= -1) then -- If the player is sitting at a poker table
                local player_0_card_1 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (1) + (0 * 3))
                local player_0_card_2 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (2) + (0 * 3))
                local player_0_card_3 = locals.get_int("three_card_poker", (three_card_poker_cards) + (three_card_poker_current_deck) + (1 + (players_current_table * three_card_poker_deck_size)) + (2) + (3) + (0 * 3))
                if player_0_card_1 ~= 50 or player_0_card_2 ~= 51 or player_0_card_3 ~= 52 then --Check if we need to overwrite the deck.
                    local total_players = 0
                    for player_iter = 0, 31, 1 do
                        local player_table = locals.get_int("three_card_poker", three_card_poker_table + 1 + (player_iter * 9) + 2)
                        if player_iter ~= player_id and player_table == players_current_table then --An additional player is sitting at the user's table.
                            total_players = total_players + 1
                        end
                    end
                    for playing_player_iter = 0, total_players, 1 do
                        set_poker_cards(playing_player_iter, players_current_table, 50, 51, 52)
                    end
                    if set_dealers_poker_cards:is_enabled() then
                        set_poker_cards(total_players + 1, players_current_table, 1, 8, 22)
                    end
                end
            end
        end
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("blackjack")) ~= 0 then
        local dealers_card = 0
        local blackjack_table = locals.get_int("blackjack", blackjack_table_players + 1 + (PLAYER.PLAYER_ID() * 8) + 4) --The Player's current table he is sitting at.
        if blackjack_table ~= -1 then
            dealers_card = locals.get_int("blackjack", blackjack_cards + blackjack_decks + 1 + (blackjack_table * 13) + 1) --Dealer's facedown card.
            dealers_card_gui_element:set_value(get_cardname_from_index(dealers_card))
        else
            dealers_card_gui_element:set_value("Not sitting at a Blackjack table.")
        end
    else
        dealers_card_gui_element:set_value("Not in Casino.")
    end
    if force_roulette_wheel:is_enabled() then
        local player_id = PLAYER.PLAYER_ID()
        if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casinoroulette")) ~= 0 then
            while NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", -1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 0, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 1, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 2, 0) ~= player_id and NETWORK.NETWORK_GET_HOST_OF_SCRIPT("casinoroulette", 3, 0) ~= player_id do 
                network.force_script_host("casinoroulette")
                gui.show_message("CasinoPacino", "Taking control of the casinoroulette script.") --If you see this spammed, someone if fighting you for control.
                script:sleep(500)
            end
            for tabler_iter = 0, 6, 1 do
                locals.set_int("casinoroulette", (roulette_master_table) + (roulette_outcomes_table) + (roulette_ball_table) + (tabler_iter), 18)
            end
        end
    end
    if SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(joaat("casino_slots")) ~= 0 then
        local needs_run = false
        if rig_slot_machine:is_enabled() then
            for slots_iter = 3, 196, 1 do
                if slots_iter ~= 67 and slots_iter ~= 132 then
                    if locals.get_int("casino_slots", (slots_random_results_table) + (slots_iter)) ~= 6 then
                        needs_run = true
                    end
                end
            end
        else
            local sum = 0
            for slots_iter = 3, 196, 1 do
                if slots_iter ~= 67 and slots_iter ~= 132 then
                    sum = sum + locals.get_int("casino_slots", (slots_random_results_table) + (slots_iter))
                end
            end
            needs_run = sum == 1152
        end
        if needs_run then
            for slots_iter = 3, 196, 1 do
                if slots_iter ~= 67 and slots_iter ~= 132 then
                    local slot_result = 6
                    if rig_slot_machine:is_enabled() == false then
                        math.randomseed(os.time()+slots_iter)
                        slot_result = math.random(0, 7)
                    end
                    locals.set_int("casino_slots", (slots_random_results_table) + (slots_iter), slot_result)
                end
            end
        end
    end
    if bypass_casino_bans:is_enabled() then
        STATS.STAT_SET_INT(joaat("MPPLY_CASINO_CHIPS_WON_GD"), 0, true)
    end
    if gui.is_open() and CasinoServicesMenu:is_selected() then
        casino_heist_approach = stats.get_int("MPX_H3OPT_APPROACH")
        casino_heist_target = stats.get_int("MPX_H3OPT_TARGET")
        casino_heist_last_approach = stats.get_int("MPX_H3_LAST_APPROACH")
        casino_heist_hard = stats.get_int("MPX_H3_HARD_APPROACH")
        casino_heist_gunman = stats.get_int("MPX_H3OPT_CREWWEAP")
        casino_heist_driver = stats.get_int("MPX_H3OPT_CREWDRIVER")
        casino_heist_hacker = stats.get_int("MPX_H3OPT_CREWHACKER")
        casino_heist_weapons = stats.get_int("MPX_H3OPT_WEAPS")
        casino_heist_cars = stats.get_int("MPX_H3OPT_VEHS")
        casino_heist_masks = stats.get_int("MPX_H3OPT_MASKS")
    end
    if HUD.IS_PAUSE_MENU_ACTIVE() then
        PAD.DISABLE_CONTROL_ACTION(0, 348, true)
        PAD.DISABLE_CONTROL_ACTION(0, 204, true)
    end
    if fm_mission_controller_cart_autograb then
        if locals.get_int(FMC, fm_mission_controller_cart_grab) == 3 then
            locals.set_int(FMC, fm_mission_controller_cart_grab, 4)
        elseif locals.get_int(FMC, fm_mission_controller_cart_grab) == 4 then
            locals.set_float(FMC, fm_mission_controller_cart_grab + fm_mission_controller_cart_grab_speed, 2)
        end
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DLCUnlockerMenu = L7NEG:add_tab("1.69 Unlocker Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DLCUnlockerMenu:add_button("Unlock baseball n knife Skins In GunVan", function()
	globals.set_int(262145 + 33309, 0)
	globals.set_int(262145 + 33273 + 9, -1716189206) ----- Knife
	globals.set_int(262145 + 33273 + 10, -1786099057) ----- BaseBall Bat
end)

DLCUnlockerMenu:add_button("Unlock Police Cars Price Trade", function()
	stats.set_int(MPX .. "MOST_TIME_ON_3_PLUS_STARS", 300000)
	stats.set_int(MPX .. "SALV23_SCOPE_BS", -1)
	stats.set_int(MPX .. "SALV23_INST_PROG", -1)
	stats.set_int(MPX .. "SALV23_GEN_BS", -1)
end)

DLCUnlockerMenu:add_button("Enable Xmass 2023 Gifts", function()
	globals.set_int(262145 + 35157, 1) --XMASGIFTS2023
	globals.set_int(262145 + 35158, 1) --NEWYEARSGIFTS2023
end)

DLCUnlockerMenu:add_button("Unlock Missed Guns In The GunVan", function()
	globals.set_int(262145 + 33273 + 5, -22923932) ----- RailGun XM22_GUN_VAN_SLOT_WEAPON_TYPE_5
	globals.set_int(262145 + 33273 + 6, -1238556825) ----- WidoMaker
	globals.set_int(262145 + 33273 + 7, -1355376991) ----- RayPistol
	globals.set_int(262145 + 33273 + 8, 1198256469) ----- HellBringer
	globals.set_int(262145 + 33273 + 9, 350597077) ----- TecPistol
	globals.set_int(262145 + 33273 + 10, 2138347493) ----- FireWork Launcher
end)

DLCUnlockerMenu:add_button("Unlock Taxi Livery for Eudora", function()
	PlayerIndex = globals.get_int(1574925)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	STATS.STAT_SET_MASKED_INT(MPX .. "DLC22022PSTAT_INT536", 10, 16, 8)
end)

DLCUnlockerMenu:add_button("Unlock Taxi Livery for Broadway", function()
	STATS.STAT_SET_INT(joaat(MPX .. "AWD_TAXIDRIVER"), 50, true)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

EventsMenu = L7NEG:add_tab("Events Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SnowToggleMenu = EventsMenu:add_tab("Snow Toggle Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SnowToggleMenu:add_button("Toggle Snow On", function()
	globals.set_int(262145 + 4413, 1)
end)

SnowToggleMenu:add_button("Toggle Snow Off", function()
	globals.set_int(262145 + 4413, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Full Account Unlocker Tool---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FAUT = L7NEG:add_tab("Full Account Unlock Menu")

--Character's Stats-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CSU = FAUT:add_tab("Character's Stats")

CSU:add_button("Max Character Skills", function()
	STATS.STAT_SET_INT(joaat(MPX .. "SCRIPT_INCREASE_DRIV"), 100)
	STATS.STAT_SET_INT(joaat(MPX .. "SCRIPT_INCREASE_FLY"), 100)
	STATS.STAT_SET_INT(joaat(MPX .. "SCRIPT_INCREASE_LUNG"), 100)
	STATS.STAT_SET_INT(joaat(MPX .. "SCRIPT_INCREASE_SHO"), 100)
	STATS.STAT_SET_INT(joaat(MPX .. "SCRIPT_INCREASE_STAM"), 100)
	STATS.STAT_SET_INT(joaat(MPX .. "SCRIPT_INCREASE_STL"), 100)
	STATS.STAT_SET_INT(joaat(MPX .. "SCRIPT_INCREASE_STRN"), 100)
end)

AcMenu = CSU:add_tab("Achievements")

Acv0 = false
AG = 4543384 + 1

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

function unlock_packed_bools(from, to)
    for i = from, to do
        stats.set_packed_stat_bool(i, true)
    end
end

-- Look for what reads DISABLE_DAILY_OBJECTIVES and then there should be a while loop that stops at 3.
local current_objectives_global = 2359296
local weekly_words_global = 2737992
local objectives_state_global = 1574744

wasabi_words = FAUT:add_tab("Unlock All") --WasabiWords™️

wasabi_words:add_button("ShinyWasabi", function() --Original script by ShinyWasabi
    script.run_in_fiber(function (script)
        local is_player_male = (ENTITY.GET_ENTITY_MODEL(PLAYER.PLAYER_PED_ID()) == joaat('mp_m_freemode_01'))
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
        stats.set_int('MPPLY_CREW_NO_HEISTS_0', 2)
        stats.set_int('MPPLY_CREW_NO_HEISTS_1', 5)
        stats.set_int('MPPLY_CREW_NO_HEISTS_2', 5)
        stats.set_int('MPPLY_CREW_NO_HEISTS_3', 5)
        stats.set_int('MPPLY_CREW_NO_HEISTS_4', 5)
        stats.set_int('MPPLY_GANGOPS_LOYALTY2', -1)
        stats.set_int('MPPLY_GANGOPS_LOYALTY3', -1)
        stats.set_int('MPPLY_GANGOPS_CRIMMASMD2', -1)
        stats.set_int('MPPLY_GANGOPS_CRIMMASMD3', -1)
        stats.set_int('MPPLY_GANGOPS_SUPPORT', -1)
        stats.set_int('MPPLY_GANGOPS_ALLINORDER', -1)
        stats.set_int('MPPLY_GANGOPS_LOYALTY', -1)
        stats.set_int('MPPLY_GANGOPS_CRIMMASMD', -1)
        stats.set_int('MPPLY_XMASLIVERIES0', -1)
        stats.set_int('MPPLY_XMASLIVERIES1', -1)
        stats.set_int('MPPLY_XMASLIVERIES2', -1)
        stats.set_int('MPPLY_XMASLIVERIES3', -1)
        stats.set_int('MPPLY_XMASLIVERIES4', -1)
        stats.set_int('MPPLY_XMASLIVERIES5', -1)
        stats.set_int('MPPLY_XMASLIVERIES6', -1)
        stats.set_int('MPPLY_XMASLIVERIES7', -1)
        stats.set_int('MPPLY_XMASLIVERIES8', -1)
        stats.set_int('MPPLY_XMASLIVERIES9', -1)
        stats.set_int('MPPLY_XMASLIVERIES10', -1)
        stats.set_int('MPPLY_XMASLIVERIES11', -1)
        stats.set_int('MPPLY_XMASLIVERIES12', -1)
        stats.set_int('MPPLY_XMASLIVERIES13', -1)
        stats.set_int('MPPLY_XMASLIVERIES14', -1)
        stats.set_int('MPPLY_XMASLIVERIES15', -1)
        stats.set_int('MPPLY_XMASLIVERIES16', -1)
        stats.set_int('MPPLY_XMASLIVERIES17', -1)
        stats.set_int('MPPLY_XMASLIVERIES18', -1)
        stats.set_int('MPPLY_XMASLIVERIES19', -1)
        stats.set_int('MPPLY_XMASLIVERIES20', -1)
        stats.set_int('MPX_HOLDUPS_BITSET', -1)
        stats.set_int('MPX_CHAR_ABILITY_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_ABILITY_2_UNLCK', -1)
        stats.set_int('MPX_CHAR_ABILITY_3_UNLCK', -1)
        stats.set_int('MPX_CHAR_WEAP_UNLOCKED', -1)
        stats.set_int('MPX_CHAR_WEAP_UNLOCKED2', -1)
        stats.set_int('MPX_CHAR_WEAP_ADDON_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_WEAP_ADDON_2_UNLCK', -1)
        stats.set_int('MPX_CHAR_WEAP_ADDON_3_UNLCK', -1)
        stats.set_int('MPX_CHAR_WEAP_ADDON_4_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_UNLOCKED', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_UNLOCKED2', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_UNLOCKED3', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_UNLOCKED4', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_UNLOCKED5', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_UNLOCKED6', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_2_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_3_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_4_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_5_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_6_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_7_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_8_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_9_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_10_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_11_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_12_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_13_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_14_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_15_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_16_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_17_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_18_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_19_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_WEAP_ADDON_20_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_HAIRCUT_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK1', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK2', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK3', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK4', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK5', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK6', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK7', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK8', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK9', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK10', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK11', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK12', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK13', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK14', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK15', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK16', -1)
        stats.set_int('MPX_CHAR_HAIR_UNLCK17', -1)
        stats.set_int('MPX_CHAR_FM_HEALTH_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_HEALTH_2_UNLCK', -1)
        stats.set_int('MPX_CRDEADLINE', 5)
        stats.set_int('MPX_CHAR_CREWUNLOCK_1_FM_EQUIP', -1)
        stats.set_int('MPX_CHAR_CREWUNLOCK_2_FM_EQUIP', -1)
        stats.set_int('MPX_CHAR_CREWUNLOCK_3_FM_EQUIP', -1)
        stats.set_int('MPX_CHAR_CREWUNLOCK_4_FM_EQUIP', -1)
        stats.set_int('MPX_CHAR_CREWUNLOCK_5_FM_EQUIP', -1)
        stats.set_int('MPX_CHAR_KIT_1_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_2_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_3_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_4_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_5_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_6_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_7_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_8_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_9_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_10_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_11_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_12_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_13_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_14_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_15_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_16_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_17_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_18_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_19_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_20_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_21_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_22_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_23_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_24_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_25_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_26_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_27_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_28_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_29_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_30_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_30_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_31_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_32_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_33_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_34_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_35_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_36_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_37_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_38_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_39_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_40_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_KIT_41_FM_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_ABILITY_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_ABILITY_2_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_ABILITY_3_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_2_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_3_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_4_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_5_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_6_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_7_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_8_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_9_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_10_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CLOTHES_11_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_VEHICLE_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_VEHICLE_2_UNLCK', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_0', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_1', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_2', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_3', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_4', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_5', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_6', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_7', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_8', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_9', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_10', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_11', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_12', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_13', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_14', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_15', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_16', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_17', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_18', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_19', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_20', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_21', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_22', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_23', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_24', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_25', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_26', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_27', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_28', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_29', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_30', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_31', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_32', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_33', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_34', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_35', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_36', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_37', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_38', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_39', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_40', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_41', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_42', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_43', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_44', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_45', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_46', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_47', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_48', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_49', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_50', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_51', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_52', -1)
        stats.set_int('MPX_TATTOO_FM_UNLOCKS_53', -1)
        stats.set_int('MPX_RANKAP_UNLK_0', -1)
        stats.set_int('MPX_RANKAP_UNLK_1', -1)
        stats.set_int('MPX_RANKAP_UNLK_2', -1)
        stats.set_int('MPX_RANKAP_UNLK_3', -1)
        stats.set_int('MPX_CHAR_CREWUNLOCK_1_UNLCK', -1)
        stats.set_int('MPX_PISTOL_ENEMY_KILLS', 600) -- Weapon Tints for Pistol
        stats.set_int('MPX_CMBTPISTOL_ENEMY_KILLS', 600) -- Weapon Tints for Combat Pistol
        stats.set_int('MPX_APPISTOL_ENEMY_KILLS', 600) -- Weapon Tints for AP Pistol
        stats.set_int('MPX_MICROSMG_ENEMY_KILLS', 600) -- Weapon Tints for Micro SMG
        stats.set_int('MPX_SMG_ENEMY_KILLS', 600) -- Weapon Tints for SMG
        stats.set_int('MPX_ASLTSMG_ENEMY_KILLS', 600) -- Weapon Tints for Assault SMG
        stats.set_int('MPX_ASLTRIFLE_ENEMY_KILLS', 600) -- Weapon Tints for Assault Rifle
        stats.set_int('MPX_CRBNRIFLE_ENEMY_KILLS', 600) -- Weapon Tints for Carbine Rifle
        stats.set_int('MPX_ADVRIFLE_ENEMY_KILLS', 600) -- Weapon Tints for Advanced Rifle
        stats.set_int('MPX_MG_ENEMY_KILLS', 600) -- Weapon Tints for MG
        stats.set_int('MPX_CMBTMG_ENEMY_KILLS', 600) -- Weapon Tints for Combat MG
        stats.set_int('MPX_PUMP_ENEMY_KILLS', 600) -- Weapon Tints for Pump Shotgun
        stats.set_int('MPX_SAWNOFF_ENEMY_KILLS', 600) -- Weapon Tints for Sawed-Off Shotgun
        stats.set_int('MPX_ASLTSHTGN_ENEMY_KILLS', 600) -- Weapon Tints for Assault Shotgun
        stats.set_int('MPX_SNIPERRFL_ENEMY_KILLS', 600) -- Weapon Tints for Sniper Rifle
        stats.set_int('MPX_HVYSNIPER_ENEMY_KILLS', 600) -- Weapon Tints for Heavy Sniper
        stats.set_int('MPX_GRNLAUNCH_ENEMY_KILLS', 600) -- Weapon Tints for Grenade Launcher
        stats.set_int('MPX_RPG_ENEMY_KILLS', 600) -- Weapon Tints for Rocket Launcher
        stats.set_int('MPX_MINIGUNS_ENEMY_KILLS', 600) -- Weapon Tints for Minigun
        stats.set_int('MPX_SR_WEAPON_BIT_SET', 262143)
        stats.set_bool('MPX_SR_TIER_1_REWARD', true)
        stats.set_bool('MPX_SR_INCREASE_THROW_CAP', true)
        stats.set_bool('MPX_SR_TIER_3_REWARD', true)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_0', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_1', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_2', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_3', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_4', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_5', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_6', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_7', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_8', 3)
        stats.set_int('MPX_PILOT_SCHOOL_MEDAL_9', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_0', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_1', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_2', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_3', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_4', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_5', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_6', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_7', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_8', 3)
        stats.set_int('MPX_PILOT_SCHOOL_LASTMEDAL_9', 3)
        stats.set_int('MPX_CRPILOTSCHOOL', 1)
        stats.set_int('MPX_PILOT_CHECKPOINTCOUNT_9', 27)
        stats.set_float('MPX_PILOT_ELAPSEDTIME_0', 58.0)
        stats.set_float('MPX_PILOT_LANDINGDISTANCE_1', 10.0)
        stats.set_float('MPX_PILOT_LANDINGDISTANCE_2', 2.0)
        stats.set_float('MPX_PILOT_LANDINGDISTANCE_3', 10.0)
        stats.set_float('MPX_PILOT_ELAPSEDTIME_4', 19.0)
        stats.set_float('MPX_PILOT_LANDINGDISTANCE_5', 600.0)
        stats.set_float('MPX_PILOT_LANDINGDISTANCE_6', 25.0)
        stats.set_float('MPX_PILOT_LANDINGDISTANCE_7', 1.0)
        stats.set_float('MPX_PILOT_ELAPSEDTIME_8', 160.0)
        stats.set_float('MPX_PILOT_ELAPSEDTIME_9', 145.0)
        stats.set_float('MPX_PILOT_LASTELAPSEDTIME_0', 58.0)
        stats.set_float('MPX_PILOT_LASTLANDDISTANCE_1', 10.0)
        stats.set_float('MPX_PILOT_LASTLANDDISTANCE_2', 2.0)
        stats.set_float('MPX_PILOT_LASTLANDDISTANCE_3', 10.0)
        stats.set_float('MPX_PILOT_LASTELAPSEDTIME_4', 19.0)
        stats.set_float('MPX_PILOT_LASTLANDDISTANCE_5', 600.0)
        stats.set_float('MPX_PILOT_LASTLANDDISTANCE_6', 25.0)
        stats.set_float('MPX_PILOT_LASTLANDDISTANCE_7', 1.0)
        stats.set_float('MPX_PILOT_LASTELAPSEDTIME_8', 160.0)
        stats.set_float('MPX_PILOT_LASTELAPSEDTIME_9', 145.0)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_0', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_1', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_2', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_3', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_4', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_5', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_6', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_7', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_8', true)
        stats.set_bool('MPX_PILOT_ASPASSEDLESSON_9', true)
        stats.set_int('MPX_CAR_CLUB_REP', 997430)
        stats.set_bool('MPPLY_MELEECHLENGECOMPLETED', true)
        stats.set_bool('MPPLY_HEADSHOTCHLENGECOMPLETED', true)
        stats.set_int('MPX_CHAR_HEIST_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_VEHICLE_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_VEHICLE_2_UNLCK', -1)
        stats.set_int('MPX_CRHEIST', 50)
        stats.set_int('MPX_CR_BANKHEIST1', 10)
        stats.set_int('MPX_CR_COUNTHEIST1', 10)
        stats.set_int('MPX_HEIST_COMPLETION', 26)
        stats.set_int('MPX_HEIST_TOTAL_TIME', 86400000)
        stats.set_int('MPX_HEISTS_ORGANISED', 50)
        stats.set_int('MPX_RACES_WON', 50)
        stats.set_int('MPX_CHAR_FM_PACKAGE_1_COLLECT', -1)
        stats.set_int('MPX_CHAR_FM_PACKAGE_2_COLLECT', -1)
        stats.set_int('MPX_CHAR_FM_PACKAGE_3_COLLECT', -1)
        stats.set_int('MPX_CHAR_FM_PACKAGE_4_COLLECT', -1)
        stats.set_int('MPX_CHAR_FM_PACKAGE_5_COLLECT', -1)
        stats.set_int('MPX_CHAR_FM_PACKAGE_6_COLLECT', -1)
        stats.set_int('MPX_CHAR_FM_PACKAGE_7_COLLECT', -1)
        stats.set_int('MPX_CHAR_FM_PACKAGE_8_COLLECT', -1)
        stats.set_int('MPX_CHAR_NO_FM_PACKAGES_COL', -1)
        stats.set_int('MPX_CHAR_FM_CARMOD_1_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CARMOD_2_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CARMOD_3_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CARMOD_4_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CARMOD_5_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CARMOD_6_UNLCK', -1)
        stats.set_int('MPX_CHAR_FM_CARMOD_7_UNLCK', -1)
        stats.set_int('MPX_NUMBER_SLIPSTREAMS_IN_RACE', 110)
        stats.set_int('MPX_NUMBER_TURBO_STARTS_IN_RACE', 90)
        stats.set_int('MPX_USJS_FOUND', 50)
        stats.set_int('MPX_USJS_COMPLETED', 50)
        stats.set_int('MPPLY_TIMES_RACE_BEST_LAP', 101)
        stats.set_int('MPX_AWD_FMRALLYWONDRIVE', 25)
        stats.set_int('MPX_AWD_FMWINSEARACE', 25)
        stats.set_int('MPX_AWD_FMWINAIRRACE', 25)
        stats.set_int('MPX_AWD_FM_RACES_FASTEST_LAP', 101)
        stats.set_int('MPX_SCRIPT_INCREASE_STAM', 100)
        stats.set_int('MPX_SCRIPT_INCREASE_STRN', 100)
        stats.set_int('MPX_SCRIPT_INCREASE_FLY', 100)
        stats.set_int('MPX_SCRIPT_INCREASE_STL', 100)
        stats.set_int('MPX_SCRIPT_INCREASE_LUNG', 100)
        stats.set_int('MPX_SCRIPT_INCREASE_DRIV', 100)
        stats.set_int('MPX_SCRIPT_INCREASE_SHO', 100)
        stats.set_int('MPX_AWD_DANCE_TO_SOLOMUN', 360)
        stats.set_int('MPX_AWD_DANCE_TO_TALEOFUS', 360)
        stats.set_int('MPX_AWD_DANCE_TO_DIXON', 360)
        stats.set_int('MPX_AWD_DANCE_TO_BLKMAD', 360)
        stats.set_int('MPX_NIGHTCLUB_HOTSPOT_TIME_MS', 40320000)
        stats.set_int('MPX_CASINO_DECORATION_GIFT_1', -1)
        stats.set_bool('MPX_COMPLETE_H4_F_USING_VETIR', true)
        stats.set_bool('MPX_COMPLETE_H4_F_USING_LONGFIN', true)
        stats.set_bool('MPX_COMPLETE_H4_F_USING_ANNIH', true)
        stats.set_bool('MPX_COMPLETE_H4_F_USING_ALKONOS', true)
        stats.set_bool('MPX_COMPLETE_H4_F_USING_PATROLB', true)
        stats.set_int("MPX_ARENAWARS_AP_LIFETIME", 5055000)
        stats.set_int("MPX_ARENAWARS_AP_TIER", 1000)
        stats.set_int("MPX_ARENAWARS_AP", 10040)
        stats.set_int("MPX_ARENAWARS_SKILL_LEVEL", 20)
        stats.set_int("MPX_ARENAWARS_SP", 210)
        stats.set_int("MPX_ARENAWARS_SP_LIFETIME", 210)
        stats.set_int("MPX_ARENAWARS_MATCHES_PLYD", 52500)
        stats.set_int("MPX_ARENAWARS_MATCHES_PLYDT", 52500)
        stats.set_int("MPX_ARENAWARS_CARRER_WINS", 72500)
        stats.set_int("MPX_ARENAWARS_CARRER_WINT", 32500)
        stats.set_int("MPX_ARN_LIFETIME_KILLS", 260000)
        stats.set_int("MPX_ARN_LIFETIME_DEATHS", 20000)
        stats.set_int("MPX_ARN_SPECTATOR_KILLS", 5000)
        stats.set_int("MPX_ARN_W_PASS_THE_BOMB", 11000)
        stats.set_int("MPX_ARN_W_DETONATION", 11000)
        stats.set_int("MPX_ARN_W_ARCADE_RACE", 11000)
        stats.set_int("MPX_ARN_W_CTF", 11000)
        stats.set_int("MPX_ARN_W_TAG_TEAM", 11000)
        stats.set_int("MPX_ARN_W_DESTR_DERBY", 11000)
        stats.set_int("MPX_ARN_W_CARNAGE", 11000)
        stats.set_int("MPX_ARN_W_MONSTER_JAM", 12000)
        stats.set_int("MPX_ARN_W_GAMES_MASTERS", 11000)
        stats.set_int("MPX_ARN_L_PASS_THE_BOMB", 100)
        stats.set_int("MPX_ARN_L_DETONATION", 100)
        stats.set_int("MPX_ARN_L_ARCADE_RACE", 100)
        stats.set_int("MPX_ARN_L_CTF", 100)
        stats.set_int("MPX_ARN_L_TAG_TEAM", 200)
        stats.set_int("MPX_ARN_L_DESTR_DERBY", 100)
        stats.set_int("MPX_ARN_L_CARNAGE", 100)
        stats.set_int("MPX_ARN_L_MONSTER_JAM", 1005)
        stats.set_int("MPX_ARN_L_GAMES_MASTERS", 100)
        stats.set_int("MPX_ARN_VEH_MONSTER3", 90000)
        stats.set_int("MPX_ARN_VEH_MONSTER4", 500)
        stats.set_int("MPX_ARN_VEH_MONSTER5", 500)
        stats.set_int("MPX_ARN_VEH_CERBERUS", 500)
        stats.set_int("MPX_ARN_VEH_CERBERUS2", 500)
        stats.set_int("MPX_ARN_VEH_CERBERUS3", 500)
        stats.set_int("MPX_ARN_VEH_BRUISER", 500)
        stats.set_int("MPX_ARN_VEH_BRUISER2", 500)
        stats.set_int("MPX_ARN_VEH_BRUISER3", 500)
        stats.set_int("MPX_ARN_VEH_SLAMVAN4", 500)
        stats.set_int("MPX_ARN_VEH_SLAMVAN5", 500)
        stats.set_int("MPX_ARN_VEH_SLAMVAN6", 500)
        stats.set_int("MPX_ARN_VEH_BRUTUS", 500)
        stats.set_int("MPX_ARN_VEH_BRUTUS2", 500)
        stats.set_int("MPX_ARN_VEH_BRUTUS3", 500)
        stats.set_int("MPX_ARN_VEH_SCARAB", 500)
        stats.set_int("MPX_ARN_VEH_SCARAB2", 500)
        stats.set_int("MPX_ARN_VEH_SCARAB3", 500)
        stats.set_int("MPX_ARN_VEH_DOMINATOR4", 500)
        stats.set_int("MPX_ARN_VEH_DOMINATOR5", 500)
        stats.set_int("MPX_ARN_VEH_DOMINATOR6", 500)
        stats.set_int("MPX_ARN_VEH_IMPALER2", 500)
        stats.set_int("MPX_ARN_VEH_IMPALER3", 500)
        stats.set_int("MPX_ARN_VEH_IMPALER4", 500)
        stats.set_int("MPX_ARN_VEH_ISSI4", 500)
        stats.set_int("MPX_ARN_VEH_ISSI5", 500)
        stats.set_int("MPX_ARN_VEH_ISSI6", 500)
        stats.set_int("MPX_ARN_VEH_IMPERATOR", 500)
        stats.set_int("MPX_ARN_VEH_IMPERATOR2", 500)
        stats.set_int("MPX_ARN_VEH_IMPERATOR3", 500)
        stats.set_int("MPX_ARN_VEH_ZR380", 500)
        stats.set_int("MPX_ARN_VEH_ZR3802", 500)
        stats.set_int("MPX_ARN_VEH_ZR3803", 500)
        stats.set_int("MPX_ARN_VEH_DEATHBIKE", 500)
        stats.set_int("MPX_ARN_VEH_DEATHBIKE2", 400)
        stats.set_int("MPX_ARN_VEH_DEATHBIKE3", 400)
        stats.set_int("MPX_AWD_WATCH_YOUR_STEP", 20)
        stats.set_int("MPX_AWD_TOWER_OFFENSE", 50)
        stats.set_int("MPX_AWD_THROUGH_A_LENS", 60)
        stats.set_int("MPX_AWD_SPINNER", 80)
        stats.set_int("MPX_AWD_YOUMEANBOOBYTRAPS", 25)
        stats.set_int("MPX_AWD_MASTER_BANDITO", 20)
        stats.set_int("MPX_AWD_SITTING_DUCK", 30)
        stats.set_int("MPX_AWD_CROWDPARTICIPATION", 80)
        stats.set_int("MPX_AWD_KILL_OR_BE_KILLED", 60)
        stats.set_int("MPX_AWD_MASSIVE_SHUNT", 60)
        stats.set_int("MPX_AWD_YOURE_OUTTA_HERE", 220)
        stats.set_int("MPX_AWD_ARENA_WAGEWORKER", 6785341)
        stats.set_int("MPX_AWD_TIME_SERVED", 474020)
        stats.set_int("MPX_AWD_CAREER_WINNER", 36340)
        stats.set_int("MPX_ARN_SPECTATOR_DRONE", 60)
        stats.set_int("MPX_ARN_SPECTATOR_CAMS", 60)
        stats.set_int("MPX_ARN_SMOKE", 50)
        stats.set_int("MPX_ARN_DRINK", 65)
        stats.set_int("MPX_ARN_SPEC_BOX_TIME_MS", 10800000)
        stats.set_int("MPX_AWD_TOP_SCORE", 1045020)
        stats.set_int("MPX_AWD_READY_FOR_WAR", 50)
        stats.set_int("MPX_AWD_WEVE_GOT_ONE", 60)
        stats.set_int("MPX_ARN_W_THEME_SCIFI", 10)
        stats.set_int("MPX_ARN_W_THEME_APOC", 10)
        stats.set_int("MPX_ARN_W_THEME_CONS", 10)
        stats.set_int("MPX_ARN_BS_TRINKET_SAVED", -1) -- Unlock trinket and stickers.
        stats.set_bool("MPX_AWD_UNSTOPPABLE", true)
        stats.set_bool("MPX_AWD_CONTACT_SPORT", true)
        stats.set_bool("MPX_AWD_BEGINNER", true)
        stats.set_bool("MPX_AWD_FIELD_FILLER", true)
        stats.set_bool("MPX_AWD_ARMCHAIR_RACER", true)
        stats.set_bool("MPX_AWD_LEARNER", true)
        stats.set_bool("MPX_AWD_SUNDAY_DRIVER", true)
        stats.set_bool("MPX_AWD_THE_ROOKIE", true)
        stats.set_bool("MPX_AWD_BUMP_AND_RUN", true)
        stats.set_bool("MPX_AWD_GEAR_HEAD", true)
        stats.set_bool("MPX_AWD_DOOR_SLAMMER", true)
        stats.set_bool("MPX_AWD_HOT_LAP", true)
        stats.set_bool("MPX_AWD_ARENA_AMATEUR", true)
        stats.set_bool("MPX_AWD_PAINT_TRADER", true)
        stats.set_bool("MPX_AWD_SHUNTER", true)
        stats.set_bool("MPX_AWD_JOCK", true)
        stats.set_bool("MPX_AWD_WARRIOR", true)
        stats.set_bool("MPX_AWD_T_BONE", true)
        stats.set_bool("MPX_AWD_MAYHEM", true)
        stats.set_bool("MPX_AWD_WRECKER", true)
        stats.set_bool("MPX_AWD_CRASH_COURSE", true)
        stats.set_bool("MPX_AWD_ARENA_LEGEND", true)
        stats.set_bool("MPX_AWD_PEGASUS", true)
        unlock_packed_bools(25010, 25010) -- Skip arena wall help.
        unlock_packed_bools(25014, 25014) -- Skip arena wall tutorial.
        stats.set_bool('MPX_AWD_DEADEYE', true) -- Badlands Revenge II -- Dead Eye
        stats.set_bool('MPX_AWD_PISTOLSATDAWN', true) -- Badlands Revenge II -- Pistols At Dawn
        stats.set_bool('MPX_AWD_TRAFFICAVOI', true) -- Race and Chase -- Beat the Traffic
        stats.set_bool('MPX_AWD_CANTCATCHBRA', true) -- Race and Chase -- All Wheels
        stats.set_bool('MPX_AWD_WIZHARD', true) -- The Wizard's Ruin -- Feelin' Grogy
        stats.set_bool('MPX_AWD_APEESCAPE', true) -- Space Monkey 3: Bananas Gone Bad -- Ape Escape
        stats.set_bool('MPX_AWD_MONKEYKIND', true) -- Space Monkey 3: Bananas Gone Bad -- Monkey Mind
        stats.set_bool('MPX_AWD_AQUAAPE', true) -- Monkey Paradise -- Aquatic Ape
        stats.set_bool('MPX_AWD_KEEPFAITH', true) -- Defender of the Faith -- Keeping The Faith
        stats.set_bool('MPX_AWD_TRUELOVE', true) -- The Love Professor -- True Love
        stats.set_bool('MPX_AWD_NEMESIS', true) -- The Love Professor -- Nemesis
        stats.set_bool('MPX_AWD_FRIENDZONED', true) -- The Love Professor -- Friendzoned
        stats.set_bool('MPX_SCGW_WON_NO_DEATHS', true) -- Street Crimes: Gang Wars Edition -- Win a game without taking any damage
        stats.set_bool('MPX_IAP_CHALLENGE_0', true) -- Invade and Persuade II -- Score over 2,000,000 in a single playthrough
        stats.set_bool('MPX_IAP_CHALLENGE_1', true) -- Invade and Persuade II -- Collect 88 barrels in a single playthrough
        stats.set_bool('MPX_IAP_CHALLENGE_2', true) -- Invade and Persuade II -- Kill 100 animals in a single playthrough
        stats.set_bool('MPX_IAP_CHALLENGE_3', true) -- Invade and Persuade II -- Travel 3,474,000km on the moon
        stats.set_bool('MPX_IAP_CHALLENGE_4', true) -- Invade and Persuade II -- Finish any level of Invade and persuade with over 7 livee
        stats.set_bool('MPX_AWD_KINGOFQUB3D', true) -- QUB3D -- King Of QUB3D
        stats.set_bool('MPX_AWD_QUBISM', true) -- QUB3D -- Qubism
        stats.set_bool('MPX_AWD_GODOFQUB3D', true) -- QUB3D -- God Of QUB3D
        stats.set_bool('MPX_AWD_QUIBITS', true) -- QUB3D -- Qubits
        stats.set_bool('MPX_AWD_ELEVENELEVEN', true) -- Axe Of Fury -- 11 11
        stats.set_bool('MPX_AWD_GOFOR11TH', true) -- Axe Of Fury -- Crank It To 11
        stats.set_bool('MPX_AWD_STRAIGHT_TO_VIDEO', true) -- Camhedz -- Straight To Video
        stats.set_bool('MPX_AWD_MONKEY_C_MONKEY_DO', true) -- Camhedz -- Monkey See Monkey Do
        stats.set_bool('MPX_AWD_TRAINED_TO_KILL', true) -- Camhedz -- Trained to Kill
        stats.set_bool('MPX_AWD_DIRECTOR', true) -- Camhedz -- The Director
        stats.set_int('MPX_AWD_SHARPSHOOTER', 40) -- Badlands Revenge II -- Sharpshooter
        stats.set_int('MPX_AWD_RACECHAMP', 40) -- Race and Chase -- Race Champion
        stats.set_int('MPX_AWD_BATSWORD', 1000000) -- The Wizard's Ruin -- Platinum Sword
        stats.set_int('MPX_AWD_COINPURSE', 950000) -- The Wizard's Ruin -- Platinum Sword -- Coin Purse
        stats.set_int('MPX_AWD_ASTROCHIMP', 3000000) -- Space Monkey 3: Bananas Gone Bad -- Astrochimp
        stats.set_int('MPX_AWD_MASTERFUL', 40000) -- Penetrator -- Masterful
        stats.set_int('MPX_SCGW_NUM_WINS_GANG_0', 55) -- Street Crimes: Gang Wars Edition -- Win 20 games with character 1
        stats.set_int('MPX_SCGW_NUM_WINS_GANG_1', 56) -- Street Crimes: Gang Wars Edition -- Win 20 games with character 2
        stats.set_int('MPX_SCGW_NUM_WINS_GANG_2', 57) -- Street Crimes: Gang Wars Edition -- Win 20 games with character 3
        stats.set_int('MPX_SCGW_NUM_WINS_GANG_3', 58) -- Street Crimes: Gang Wars Edition -- Win 20 games with character 4
        stats.set_int('MPX_IAP_MAX_MOON_DIST', 2147483647) -- Invade and Persuade II -- Travel 3,474,000km on the moon
        stats.set_int('MPX_LAST_ANIMAL', 108) -- Invade and Persuade II -- Kill 100 animals in a single playthrough
        stats.set_int('MPX_CH_ARC_CAB_CLAW_TROPHY', -1) -- Kitty Claw Trophy
        stats.set_int('MPX_CH_ARC_CAB_LOVE_TROPHY', -1) -- The Love Professor Trophy
        stats.set_int('MPX_AWD_FACES_OF_DEATH', 50) -- Camhedz -- Faces Of Death
        stats.set_int("MPX_AWD_COLD_CALLER", 50)
        stats.set_int("MPX_AWD_PRODUCER", 60)
        stats.set_int("MPX_AWD_CONTRACTOR", 50)
        stats.set_int("MPX_FIXER_SC_VEH_RECOVERED", 100)
        stats.set_int("MPX_FIXER_SC_VAL_RECOVERED", 100)
        stats.set_int("MPX_FIXER_SC_GANG_TERMINATED", 100)
        stats.set_int("MPX_FIXER_SC_VIP_RESCUED", 100)
        stats.set_int("MPX_FIXER_SC_ASSETS_PROTECTED", 100)
        stats.set_int("MPX_FIXER_SC_EQ_DESTROYED", 100)
        stats.set_int("MPX_FIXER_COUNT", 600)
        stats.set_int("MPX_FIXER_EARNINGS", 26340756)
        stats.set_int("MPX_PAYPHONE_BONUS_KILL_METHOD", -1)
        stats.set_int("MPX_FIXER_HQ_OWNED", 1) -- Trade Price for buffalo4
        stats.set_int("MPX_FIXER_GENERAL_BS", -8577) -- Trade price for champion/baller7
        stats.set_int("MPX_FIXER_COMPLETED_BS", -1) -- Complete all The Contract missions.
        stats.set_bool("MPX_AWD_TEEING_OFF", true)
        stats.set_bool("MPX_AWD_PARTY_NIGHT", true)
        stats.set_bool("MPX_AWD_BILLIONAIRE_GAMES", true)
        stats.set_bool("MPX_AWD_HOOD_PASS", true)
        stats.set_bool("MPX_AWD_STUDIO_TOUR", true)
        stats.set_bool("MPX_AWD_DONT_MESS_DRE", true)
        stats.set_bool("MPX_AWD_BACKUP", true)
        stats.set_bool("MPX_AWD_SHORTFRANK_1", true)
        stats.set_bool("MPX_AWD_SHORTFRANK_2", true)
        stats.set_bool("MPX_AWD_SHORTFRANK_3", true)
        stats.set_bool("MPX_AWD_CONTR_KILLER", true)
        stats.set_bool("MPX_AWD_DOGS_BEST_FRIEND", true)
        stats.set_bool("MPX_AWD_MUSIC_STUDIO", true)
        stats.set_bool("MPX_AWD_SHORTLAMAR_1", true)
        stats.set_bool("MPX_AWD_SHORTLAMAR_2", true)
        stats.set_bool("MPX_AWD_SHORTLAMAR_3", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_SETUP", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_STRAND", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_PARTY", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_PARTY_2", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_PARTY_F", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_BILL", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_BILL_2", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_BILL_F", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_HOOD", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_HOOD_2", true)
        stats.set_bool("MPX_BS_IMANI_D_APP_HOOD_F", true)
        unlock_packed_bools(32312, 32312)
        stats.set_int('MPX_REV_NV_KILLS', 50) -- Navy Revolver Kills
        stats.set_int("MPX_XM22_FLOW", -1) -- Acid Lab Unlock
        stats.set_int("MPX_XM22_MISSIONS", -1) -- Acid Lab Unlock
        stats.set_int("MPX_AWD_CALLME", tunables.get_int(654710993)) -- Acid Lab Equipment Unlock
        stats.set_int("MPX_H3_VEHICLESUSED", -1) -- Trade Price for Diamond Casino Heist Finale.
        stats.set_int("MPX_H4_H4_DJ_MISSIONS", -1) -- Trade Price for weevil
        stats.set_int("MPX_H4_PROGRESS", -1) -- Trade Price for winky
        stats.set_int("MPX_TUNER_GEN_BS", -1) -- Trade Price for tailgater2
        stats.set_int("MPX_ULP_MISSION_PROGRESS", -1) -- Trade Price greenwood/conada
        stats.set_int("MPX_SUM23_AVOP_PROGRESS", -1) -- Trade Price Raiju
        stats.set_int("MPX_GANGOPS_FLOW_BITSET_MISS0", -1) -- Trade Price for deluxo/akula/riot2/stromberg/chernobog/barrage/khanjali/volatol/thruster
        stats.set_bool("MPX_AWD_TAXISTAR", true) -- Trade Price for taxi
        stats.set_bool("MPPLY_AWD_HST_ORDER", true)
        stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", true)
        stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", true)
        stats.set_int("MPPLY_HEISTFLOWORDERPROGRESS", -1)
        stats.set_int("MPPLY_HEISTNODEATHPROGREITSET", -1)
        stats.set_int("MPPLY_HEISTTEAMPROGRESSBITSET", -1)
        stats.set_int("MPX_AT_FLOW_VEHICLE_BS", -1) -- Trade price for dune4/dune5/wastelander/blazer5/phantom2/voltic2/technical2/boxville5/ruiner2
        stats.set_int("MPX_LFETIME_HANGAR_BUY_COMPLET", 50) -- Trade price for microlight/rogue/alphaz1/havok/starling/molotok/tula/bombushka/howard/mogul/pyro/seabreeze/nokota/hunter
        stats.set_int("MPX_SALV23_GEN_BS", -1) -- polgauntlet trade price
        stats.set_int("MPX_SALV23_SCOPE_BS", -1) -- police5 trade price
        stats.set_int("MPX_MOST_TIME_ON_3_PLUS_STARS", 300000) -- police4 trade price
        stats.set_int("MPX_LOWRIDER_FLOW_COMPLETE", 1)
        stats.set_int("MPX_AT_FLOW_MISSION_PROGRESS", 50)
        stats.set_int("MPX_AT_FLOW_IMPEXP_NUM", 50)
        stats.set_int("MPX_AT_FLOW_BITSET_MISSIONS0", -1)
        stats.set_int("MPX_WVM_FLOW_MISSION_PROGRESS", 50)
        stats.set_int("MPX_WVM_FLOW_IMPEXP_NUM", 50)
        stats.set_int("MPX_WVM_FLOW_BITSET_MISSIONS0", -1)
        stats.set_int("MPX_WVM_FLOW_VEHICLE_BS", -1)
        stats.set_int("MPX_GANGOPS_FLOW_MISSION_PROG", -1)
        stats.set_int("MPX_GANGOPS_FLOW_IMPEXP_NUM", 50)
        stats.set_int("MPX_WAM_FLOW_VEHICLE_BS", -1)
        stats.set_int("MPX_GANGOPS_FLOW_PASSED_BITSET", -1)
        stats.set_int("MPX_VCM_FLOW_PROGRESS", -1)
        stats.set_int("MPX_TUNER_FLOW_BS", -1)
        stats.set_int("MPX_TUNER_MIS_BS", -1)
        stats.set_int("MPX_TUNER_COMP_BS", -1)
        stats.set_int("MPX_GANGOPS_FM_MISSION_PROG", -1)
        stats.set_int("MPX_GANGOPS_FM_BITSET_MISS0", -1)
        stats.set_bool("MPX_UNLOCKED_MESSAGE_FLEECA", true)
        stats.set_bool("MPX_CARMEET_PV_CHLLGE_CMPLT", true)
        --Make it think you've beat all the heists as leader.
        stats.set_int("MPX_HEIST_SAVED_STRAND_0", tunables.get_int('ROOT_ID_HASH_THE_FLECCA_JOB'))
        stats.set_int("MPX_HEIST_SAVED_STRAND_0_L", 5)
        stats.set_int("MPX_HEIST_SAVED_STRAND_1", tunables.get_int('ROOT_ID_HASH_THE_PRISON_BREAK'))
        stats.set_int("MPX_HEIST_SAVED_STRAND_1_L", 5)
        stats.set_int("MPX_HEIST_SAVED_STRAND_2", tunables.get_int('ROOT_ID_HASH_THE_HUMANE_LABS_RAID'))
        stats.set_int("MPX_HEIST_SAVED_STRAND_2_L", 5)
        stats.set_int("MPX_HEIST_SAVED_STRAND_3", tunables.get_int('ROOT_ID_HASH_SERIES_A_FUNDING'))
        stats.set_int("MPX_HEIST_SAVED_STRAND_3_L", 5)
        stats.set_int("MPX_HEIST_SAVED_STRAND_4", tunables.get_int('ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB'))
        stats.set_int("MPX_HEIST_SAVED_STRAND_4_L", 5)
        stats.set_int("MPX_LIFETIME_BUY_COMPLETE", 1025)
        stats.set_int("MPX_LIFETIME_BUY_UNDERTAKEN", 1025)
        stats.set_int("MPX_LIFETIME_SELL_COMPLETE", 1025)
        stats.set_int("MPX_LIFETIME_SELL_UNDERTAKEN", 1025)
        stats.set_int("MPX_LIFETIME_CONTRA_EARNINGS", 25000000) --Contraband Earnings
        stats.set_int("MPX_LFETIME_BIKER_BUY_COMPLET", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_UNDERTA", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_COMPLET", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_UNDERTA", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_COMPLET1", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_UNDERTA1", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_COMPLET1", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_UNDERTA1", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_COMPLET2", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_UNDERTA2", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_COMPLET2", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_UNDERTA2", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_COMPLET3", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_UNDERTA3", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_COMPLET3", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_UNDERTA3", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_COMPLET4", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_UNDERTA4", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_COMPLET4", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_UNDERTA4", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_COMPLET5", 1025)
        stats.set_int("MPX_LFETIME_BIKER_BUY_UNDERTA5", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_COMPLET5", 1025)
        stats.set_int("MPX_LFETIME_BIKER_SELL_UNDERTA5", 1025)
        stats.set_int("MPX_LIFETIME_BKR_SELL_EARNINGS0", 25000000)
        stats.set_int("MPX_LIFETIME_BKR_SELL_EARNINGS1", 25000000)
        stats.set_int("MPX_LIFETIME_BKR_SELL_EARNINGS2", 25000000)
        stats.set_int("MPX_LIFETIME_BKR_SELL_EARNINGS3", 25000000)
        stats.set_int("MPX_LIFETIME_BKR_SELL_EARNINGS4", 25000000)
        stats.set_int("MPX_LFETIME_BIKER_BUY_COMPLET6", 10) --Allow buying of Stank Breath acid name.
        stats.set_int("MPX_LFETIME_BIKER_SELL_COMPLET6", 10) --Allow buying of Squatch Bait acid name.
        stats.set_packed_stat_int(41241, 5) --Allow buying of Chair Shot acid name.
        stats.set_int("MPX_LIFETIME_BKR_SELL_EARNINGS6", 1000000) --Allow buying of Fck Your Sleep acid name.
        stats.set_packed_stat_int(7666, 25) --Fill CEO office with money
        unlock_packed_bools(7553, 7594) --Fill CEO office with junk
        stats.set_packed_stat_int(9357, 4) --Fill Clubhouse with money
        unlock_packed_bools(9400, 9414) --Fill Clubhouse with junk
        stats.set_int("MPX_XMAS2023_ADV_MODE_WINS", 6) --Unlock Christmas 2023 liveries.
        stats.set_int("MPPLY_XMAS23_PLATES0", 3) -- ECola & Sprunk Plates
        stats.set_int("MPX_COUNT_HOTRING_RACE", 20) -- Liveries for hotring
        stats.set_int("MPX_FINISHED_SASS_RACE_TOP_3", 20) -- Trade price for hotring/everon2
        stats.set_int("MPX_AWD_DISPATCHWORK", 5) --Trade price for polgreenwood.
        stats.set_packed_stat_int(7671, 100) --Plant on Desk, Plaque Trophy, Shield Trophy
        stats.set_int("MPX_PROG_HUB_BOUNTIES_ALIVE_BS", -1) --Cuff Trophy
        for i = 0, 2 do --Unlock all daily rewards.
            local objective = globals.get_int(current_objectives_global + (1 + (0 * 5570)) + 681 + 4244 + (1 + (i * 3)))
            globals.set_int(objectives_state_global + 1 + (1 + (i * 1)), objective)
        end
        globals.set_int(objectives_state_global, 1)
        globals.set_int(weekly_words_global + (1 + (0 * 6)) + 1, globals.get_int(weekly_words_global + (1 + (0 * 6)) + 2)) --Unlock Weekly Objective
        gui.show_message('WasabiWordsTM', 'Clichés Subverted')
    end)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG6 = L7NEG:add_tab("LSCM Unlocker Menu")

L7NEG6:add_button("Unlock All Rep Lvl 1000", function()
	for i = 262145 + 30958, 262145 + 30987 do
		globals.set_float(i, 100000)
	end
end)

LSCMNote = L7NEG6:add_tab("Read Me Tutorial")

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
CEO1=262145+15732
CEO2=262145+15499
CEO3=262145+15500
SMC1=545+1
SMC2=545+7
SMC3=545+584
SMC4=545+55
SMC5=545+595
SMC6=560
SMC7=741
SMC8=742
SMC9=603+5
SMC10=603+1
SMC11=603+191
SMC12=603+192

local cs = "appsecuroserv"

local ci = "gb_contraband_sell"

local cb = "gb_contraband_buy"

local am = "am_mp_warehouse"

local am2= "am_mp_peds"

cratevalue = 0
CeoManagerMenu:add_imgui(function()
    cratevalue, used = ImGui.DragInt("Crate Value", cratevalue, 10000, 0, 6000000)
    if used then
        globals.set_int(CEO1, cratevalue)
    end
end)

checkbox = CeoManagerMenu:add_checkbox("Start Ceo Manager")

CeoManagerMenu:add_button("Open Warehouse Screen", function() SCRIPT.REQUEST_SCRIPT("apparcadebusinesshub") SYSTEM.START_NEW_SCRIPT("apparcadebusinesshub", 8344) end)

CeoManagerMenu:add_button("Disable RP Gain", function() globals.set_float(262145 + 1, 0) end)
CeoManagerMenu:add_button("Enable RP Gain", function() globals.set_float(262145 + 1, 1) end)

script.register_looped("yimceoloop", function (script)
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

local van_coordinates = {
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
	vec3:new(149.683, -1655.674, 29.028)
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
	"Davis - 30"
}

-- func_231, gunclub_shop
local allowed_weapons = {
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
	"WEAPON_SNOWLAUNCHER"
}

local selected_loc        = 0
local selected_slot       = 0
local is_typing           = false
local weapon_skins        = false
local gta_plus_blip       = false
local livery_lock         = false
local weapon_editor_popup = false
local filter_text         = ""
local weapon_name         = ""

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

	if ImGui.BeginPopupModal("Weapon Editor", weapon_editor_popup, ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoCollapse | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.Modal) then
		selected_slot = ImGui.Combo("Select Slot", selected_slot, { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }, 10)

		filter_text = ImGui.InputText("Weapon Name", filter_text, 100)
		if ImGui.IsItemActive() then
			is_typing = true
		else
			is_typing = false
		end

		if ImGui.BeginListBox("##weapons", 450, 200) then
			for index, item in ipairs(allowed_weapons) do
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
			selected_slot       = 0
			filter_text         = ""
			weapon_name         = ""
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
			local coords = van_coordinates[selected_loc + 1]
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
	help_marker("Removes the hard-coded lock on special weapon liveries, such as Season's Greetings, Employee of the Month etc.")
	
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
				local weapon_name     = weapons.get_weapon_display_name(weapon_hash)
				local weapon_discount = math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i) * 100.0)

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
				local throwable_name     = weapons.get_weapon_display_name(throwable_hash)
				local throwable_discount = math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i) * 100.0)

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

local daily_collectibles_tab = L7NEG:add_tab("Daily Collectibles Menu")

local challenges_tab     = daily_collectibles_tab:add_tab("Challenges")
local dead_drop_tab      = daily_collectibles_tab:add_tab("G's Cache")
local stash_house_tab    = daily_collectibles_tab:add_tab("Stash House")
local street_dealer_tab  = daily_collectibles_tab:add_tab("Street Dealers")
local shipwrecked_tab    = daily_collectibles_tab:add_tab("Shipwreck")
local hidden_cache_tab   = daily_collectibles_tab:add_tab("Hidden Caches")
local junk_skydive_tab   = daily_collectibles_tab:add_tab("Junk Energy Skydives")
local treasure_chest_tab = daily_collectibles_tab:add_tab("Treasure Chests")
local buried_stash_tab   = daily_collectibles_tab:add_tab("Buried Stashes")
local exotic_exports_tab = daily_collectibles_tab:add_tab("Exotic Exports")
local time_trials_tab    = daily_collectibles_tab:add_tab("Time Trials")
local ls_tags_tab        = daily_collectibles_tab:add_tab("LS Tags")
local madrazo_hits_tab   = daily_collectibles_tab:add_tab("Madrazo Hits")

local global_one          = 1943205
local global_two          = 1943194
local global_three        = 2738934
local global_three_offset = 6898
local global_four_offset  = 6813 --shopui_title_streetdealer
local global_four         = 1882247
local global_five         = 1949771
local global_five_offset  = 5878

local freemode_local_one    = 14436
local freemode_local_two    = 15239
local stash_house_local_one = 119

local current_objectives_global        = 2359296
local current_objectives_global_offset = 5570
local weekly_objectives_global         = 2737992
local objectives_state_global          = 1574744

-- Credit to Senexis: https://github.com/Senexis/RDO-GG-Tunables/blob/main/public/data/daily_objectives.json https://github.com/Senexis/RDO-GG-Tunables/blob/main/public/data/weekly_objectives.json
local daily_challenges = {
  "Participate in a Land Race.",
  "Participate in a Bike Race.",
  "Participate in an Air Race.",
  "Participate in a Sea Race.",
  "Participate in a Rally Race.",
  "Participate in a GTA Race.",
  "Participate in a Non-Contact Race.",
  "Participate in a Team Deathmatch.",
  "Participate in a Deathmatch.",
  "Participate in a Vehicle Deathmatch.",
  "Participate in a Parachute Jump.",
  "Participate in a Last Team Standing.",
  "Participate in a Capture - Contend.",
  "Participate in a Capture - Hold.",
  "Participate in a Capture - Raid.",
  "Participate in a Capture - GTA.",
  "Participate in a Versus Mission.",
  "Complete a Contact Mission.",
  "Participate in a Survival.",
  "Hold up a store.",
  "Complete a Gang Attack.",
  "Participate in an Impromptu Race.",
  "Participate in One on One Deathmatch.",
  "Go to the Movies.",
  "Fly under a bridge in an Air Race.",
  "Ride on one of the Fairground Rides.",
  "Steal a vehicle from the military base.",
  "Mod a vehicle at a car mod shop.",
  "Perform a Stunt Jump.",
  "Deliver an Export vehicle to Simeon.",
  "Collect a Bounty.",
  "Kill a player while Off the Radar.",
  "Kill a revealed player.",
  "Bribe the Cops then cause havoc.",
  "Call a Mugger on another player.",
  "Use some Bull Shark Testosterone.",
  "Collect an Ammo Drop.",
  "Play a game of Darts.",
  "Play a round of Golf.",
  "Play a match of Tennis.",
  "Challenge a player at Arm Wrestling.",
  "Go for a round at the Shooting Range.",
  "Complete a Flight School lesson.",
  "Kill 10 players.",
  "Destroy 10 vehicles.",
  "Steal 10 vehicles.",
  "Escape a 3 star Wanted Level.",
  "Fall for 325 feet and survive.",
  "Parachute from 650 feet.",
  "Deploy your parachute near the ground.",
  "Perform a wheelie for 10 seconds.",
  "Participate in a Capture.",
  "Participate in the Featured Series.",
  "Participate in the Adversary Series.",
  "Participate in the Stunt Series.",
  "Participate in the Special Race Series.",
  "Participate in the Transform Series.",
  "Participate in the SASS Series.",
  "Participate in the Arena War Series.",
  "Participate in the Bunker Series.",
  "Participate in the Race Series.",
  "Participate in the Survival Series.",
  "Participate in a King of the Hill.",
  "Participate in a Client Job.",
  "Participate in VIP Work.",
  "Participate in Club Work.",
  "Participate in a Clubhouse Contract.",
  "Participate in a Business Battle.",
  "Participate in a Freemode Event.",
  "Participate in a Freemode Challenge.",
  "Complete a Lowrider mission.",
  "Complete a Dispatch mission.",
  "Complete a Heist Setup.",
  "Complete a Heist Finale.",
  "Complete a Doomsday Heist Prep.",
  "Complete a Doomsday Heist Setup.",
  "Complete a Doomsday Heist Finale.",
  "Participate in Come Out To Play.",
  "Participate in Siege Mentality.",
  "Participate in Hasta La Vista.",
  "Participate in Cross the Line.",
  "Participate in Hunting Pack.",
  "Participate in Keep the Pace.",
  "Participate in Offense Defense.",
  "Participate in Relay.",
  "Participate in Slasher.",
  "Participate in Extraction.",
  "Participate in Beast vs. Slasher.",
  "Participate in Drop Zone.",
  "Participate in Till Death Do Us Part.",
  "Participate in Sumo.",
  "Participate in Inch By Inch.",
  "Participate in Trading Places.",
  "Participate in Power Play.",
  "Participate in Entourage.",
  "Participate in Slipstream.",
  "Participate in Lost vs Damned.",
  "Participate in Deadline.",
  "Participate in Kill Quota.",
  "Participate in Turf Wars.",
  "Participate in Vehicle Vendetta.",
  "Participate in Collection Time.",
  "Participate in Juggernaut.",
  "Participate in Resurrection.",
  "Participate in Tiny Racers.",
  "Participate in Dawn Raid.",
  "Participate in Overtime Rumble.",
  "Participate in Power Mad.",
  "Participate in Overtime Shootout.",
  "Participate in Motor Wars.",
  "Participate in Bombushka Run.",
  "Participate in Stockpile.",
  "Participate in The Vespucci Job.",
  "Participate in Hunting Pack (Remix).",
  "Participate in Trading Places (Remix).",
  "Participate in Running Back (Remix).",
  "Participate in Sumo (Remix).",
  "Participate in Running Back.",
  "Participate in Every Bullet Counts.",
  "Participate in Rhino Hunt.",
  "Participate in In and Out.",
  "Participate in Bomb Ball.",
  "Participate in Buzzer Beater.",
  "Participate in Carnage.",
  "Participate in Tag Team.",
  "Participate in Games Masters.",
  "Participate in Here Come the Monsters.",
  "Participate in Wreck It.",
  "Participate in Hot Bomb.",
  "Participate in Flag War.",
  "Play the Shooting Range at a Bunker.",
  "Hire a player for your Motorcycle Club.",
  "Hire a player for your Organization.",
  "Set yourself as Looking for Work.",
  "Set yourself as Looking for an MC.",
  "Resupply the Cocaine Lockup.",
  "Resupply the Weed Farm.",
  "Resupply the Counterfeit Cash Factory.",
  "Resupply the Meth Lab.",
  "Resupply the Document Forgery Office.",
  "Resupply the Bunker.",
  "Source Special Cargo.",
  "Source Air-Freight Cargo.",
  "Source Vehicle Cargo.",
  "Sell Special Cargo.",
  "Sell Air-Freight Cargo.",
  "Sell Weapons.",
  "Sell Cocaine.",
  "Sell Weed.",
  "Sell Counterfeit Cash.",
  "Sell Meth.",
  "Sell Forged Documents.",
  "Export Vehicle Cargo.",
  "Sell Goods from your Nightclub.",
  "Complete Club Management.",
  "Order a drink from a bar.",
  "Dance in a player owned Nightclub.",
  "Relax in a hot tub.",
  "Fly a Drone.",
  "Drive an RC Bandito.",
  "Go Scuba Diving.",
  "Have a snowball fight.",
  "Get a headshot with the Double-Action Revolver.",
  "Rampage with the Stone Hatchet.",
  "Modify a MKII weapon.",
  "Modify an aircraft at your Hangar.",
  "Modify a vehicle at your Arena Workshop.",
  "Modify a vehicle at Benny's Original Motor Works.",
  "Modify a vehicle in the Mobile Operations Center.",
  "Modify a vehicle in the Avenger.",
  "Modify a vehicle at the Clubhouse.",
  "Visit The Diamond Casino & Resort.",
  "Complete a mission for The Diamond Casino & Resort.",
  "Spin the Lucky Wheel.",
  "Complete a Special Vehicle Work.",
  "Complete a Simeon Repo.",
  "Complete a Diamond Casino Heist Prep.",
  "Complete The Diamond Casino Heist Finale.",
  "Play any game in an Arcade.",
  "Dance in The Music Locker.",
  "Dance at the Cayo Perico beach party.",
  "Participate in the Street Race Series.",
  "Participate in the Pursuit Series.",
  "Visit the LS Car Meet.",
  "Visit the LS Car Meet with a Personal Vehicle.",
  "Drive an LS Car Meet vehicle in the Test Track.",
  "Spectate the Test Track inside the LS Car Meet.",
  "Participate in a Sprint at the LS Car Meet.",
  "Deliver an Exotic Exports Vehicle to the Docks.",
  "Complete a Planning Work mission.",
  "Complete a Contract for KDJ and Sessanta.",
  "Participate in a Scramble at the LS Car Meet.",
  "Participate in a Head-to-Head at the LS Car Meet.",
  "Complete 1 lap of the Time Trial at the LS Car Meet.",
  "Visit Record A Studios.",
  "Complete a Security Contract.",
  "Complete a Payphone Hit.",
  "Complete an Investigation for Dr. Dre.",
  "Complete a Short Trip.",
  "Participate in a HSW Race.",
  "Participate in the Community Series.",
  "Participate in the Cayo Perico Series.",
  "Participate in Assault on Cayo Perico.",
  "Visit The Freakshop.",
  "Complete a First Dose mission.",
  "Complete a Last Dose mission.",
  "Complete a Fooligan Job.",
  "Complete one fare during Taxi Work.",
  "Raid a Stash House.",
  "Collect G's Cache.",
  "Sell any product to a Street Dealer.",
  "Complete a Junk Energy Time Trial.",
  "Complete a Resupply Mission for the Acid Lab.",
  "Sell Acid.",
  "Complete a Project Overthrow mission.",
  "Complete an LSA Operation.",
  "Complete Slush Fund.",
  "Complete Scene of the Crime.",
  "Participate in the Drag Race Series.",
  "Participate in the Drift Race Series.",
  "Recover a vehicle using the Tow Truck.",
  "Photograph an animal for the LS Tourist Board."
}

local weekly_challenges = {
  "Complete 5 Fooligan Jobs.",
  "Complete the Assassination Bonus on 5 Payphone Hits.",
  "Complete 10 Security Contracts.",
  "Complete 3 Short Trips.",
  "Complete Don't Fuck with Dre.",
  "Complete the Elite Challenge for The Cayo Perico Heist.",
  "Complete The Cayo Perico Heist undetected.",
  "Complete The Cayo Perico Heist without dying.",
  "Complete The Cayo Perico Heist 2 times.",
  "Complete any Diamond Casino Heist Elite Challenge.",
  "Complete The Diamond Casino Heist 2 times.",
  "Rob the Daily Vault in The Diamond Casino Heist.",
  "Complete 5 Casino Works for Agatha Baker.",
  "Complete the Elite Challenge for The Data Breaches.",
  "Complete the Elite Challenge for The Bogdan Problem.",
  "Complete the Elite Challenge for The Doomsday Scenario.",
  "Complete The Doomsday Scenario.",
  "Participate in 10 Arena War modes.",
  "Win 3 Arena War modes.",
  "Complete 5 LSA Operations on Specialist.",
  "Complete 1 Project Overthrow Missions.",
  "Complete 5 Mobile Operations.",
  "Complete 5 Mobile Operations on Hard difficulty.",
  "Complete 5 Special Vehicle Works on Hard difficulty.",
  "Complete 5 Special Vehicle Works.",
  "Complete 10 Clubhouse Contracts.",
  "Complete 5 Motorcycle Club Challenges.",
  "Participate in 5 VIP Challenges.",
  "Complete 3 Heist finales.",
  "Complete all 10 waves of a Survival.",
  "Survive 5 waves in a Survival without dying.",
  "Participate in 6 Drag Races.",
  "Win 5 Races.",
  "Win 5 LS Car Meet Races.",
  "Beat the par time in 3 Time Trials.",
  "Beat the par time in 3 RC Bandito Time Trials.",
  "Win 3 Deathmatches.",
  "Win 3 Team Deathmatches.",
  "Win 3 Drag or Drift Races.",
  "Win 5 Adversary Modes.",
  "Participate in 6 Drift Races.",
  "Complete 25 fares during Taxi Work.",
  "Achieve a gold medal in 10 Junk Energy Skydives.",
  "Beat the par time in 3 Junk Energy Time Trials.",
  "Collect 3 player bounties.",
  "Deliver 3 Export vehicles to Simeon.",
  "Steal from 3 Stash Houses.",
  "Collect 3 G's Caches.",
  "Discover 3 Shipwrecks.",
  "Sell to 3 Street Dealers.",
  "Complete 3 Last Dose Missions.",
  "Complete 3 First Dose Missions.",
  "Collect 10 Hidden Caches.",
  "Complete 5 CEO or VIP Works.",
  "Win 3 Stunt Races.",
  "Win 3 Hotring Series Races.",
  "Win 3 Open Wheel Races.",
  "Win 3 RC Bandito Races.",
  "Win 3 Pursuit Races.",
  "Complete 5 Terrorbyte Client Jobs.",
  "Complete 5 Nightclub Management Missions.",
  "Sell $3,000,000 across all businesses.",
  "Earn $100,000 in wages as an Associate or Bodyguard.",
  "Complete 3 Business Resupply Missions.",
  "Complete 3 Gerald's Last Play Missions.",
  "Complete 3 Premium Deluxe Repo Work Missions.",
  "Complete 3 A Superyacht Life Missions.",
  "Complete 3 Bunker Research Missions.",
  "Complete the Ammu-Nation Contract 3 times.",
  "Complete a Salvage Yard Robbery without dying.",
  "Deliver 10 Exotic Exports vehicles.",
  "Complete 3 Auto Shop Contract Finales.",
  "Deliver 3 vehicles for the Auto Shop Service.",
  "Complete 3 Salvage Yard Robberies.",
  "Complete Scene of the Crime.",
  "Recover 10 vehicles using the Tow Truck.",
  "Photograph 10 animals for Shoot Animals photography.",
  "Create a Job in the Job Creator.",
  "Steal from 2 Armored Trucks.",
  "Take part in 5 Freemode Challenges.",
  "Participate in 5 Freemode Events.",
  "Successfully Complete 10 Stunt Jumps.",
  "Earn $50,000 Arcade daily earnings.",
  "Complete 5 Business Battles.",
  "Complete 3 Last Dose Missions on Hard.",
  "Eat 3 peyote.",
  "Earn $2,000,000 from selling Special Cargo.",
  "Earn $2,000,000 from selling Vehicle Cargo.",
  "Earn $50,000 from Nightclub daily earnings.",
  "Earn $2,000,000 from selling Product.",
  "Complete The Data Breaches.",
  "Complete The Bogdan Problem.",
  "Complete 3 First Dose Missions on Hard.",
  "Win in 3 Snowball Deathmatches.",
  "Win Beast vs. Slasher.",
  "Fight off the Gooch.",
  "Kill your clone in Clone Slasher."
}

local selected_dealer    = 0
local selected_cache     = 0
local selected_skydive   = 0
local selected_treasure  = 0
local selected_stash     = 0
local selected_trial     = 0
local selected_tag       = 0
local esp_gs_cache       = false
local esp_stash_house    = false
local esp_street_dealers = false
local esp_shipwreck      = false
local esp_hidden_caches  = false
local esp_treasure_chest = false
local esp_buried_stash   = false
local esp_exotic_vehicle = false
local esp_ls_tag         = false
local esp_madrazo_hit    = false

local weekly_obj_id            = 0
local weekly_obj_override      = 0
local dead_drop_area           = 0
local dead_drop_loc            = 0
local stash_house_loc          = 0
local shipwrecked_loc          = 0
local hit_loc                  = 0
local max_cocaine              = 0
local max_meth                 = 0
local max_weed                 = 0
local max_acid                 = 0
local total_products           = 0
local all_products             = 0
local vehicle_location         = 0
local vehicle_index            = 0
local vehicle_order            = 0
local active_vehicle           = 0
local vehicle_bitset           = 0
local dead_drop_collected      = false
local stash_house_raided       = false
local shipwrecked_collected    = false
local hit_completed            = false
local exotic_reward_ready      = false
local safe_code                = ""
local daily_obj                = {}
local street_dealer_loc        = {}
local hidden_cache_loc         = {}
local junk_skydive_loc         = {}
local treasure_chest_loc       = {}
local buried_stash_loc         = {}
local time_trial_loc           = {}
local ls_tag_loc               = {}
local hidden_cache_collected   = {}
local treasure_chest_collected = {}
local buried_stash_collected   = {}
local ls_tag_sprayed           = {}
local meth_unit                = {}
local weed_unit                = {}
local cocaine_unit             = {}
local acid_unit                = {}

local function dead_drop_coords(area, location)
    if area == 0 then
        if location == 0 then return vec3:new(1113.557, -645.957, 56.091)
        elseif location == 1 then return vec3:new(1142.874, -662.951, 57.135)
        elseif location == 2 then return vec3:new(1146.691, -703.717, 56.167)
        elseif location == 3 then return vec3:new(1073.542, -678.236, 56.583)
        elseif location == 4 then return vec3:new(1046.454, -722.915, 56.419)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 1 then
        if location == 0 then return vec3:new(2064.713, 3489.88, 44.223)
        elseif location == 1 then return vec3:new(2081.859, 3553.254, 42.157)
        elseif location == 2 then return vec3:new(2014.72, 3551.499, 42.726)
        elseif location == 3 then return vec3:new(1997.019, 3507.838, 39.666)
        elseif location == 4 then return vec3:new(2045.597, 3564.346, 39.343)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 2 then
        if location == 0 then return vec3:new(-1317.344, -1481.97, 3.923)
        elseif location == 1 then return vec3:new(-1350.041, -1478.273, 4.567)
        elseif location == 2 then return vec3:new(-1393.87, -1445.139, 3.437)
        elseif location == 3 then return vec3:new(-1367.034, -1413.992, 2.611)
        elseif location == 4 then return vec3:new(-1269.861, -1426.272, 3.556)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 3 then
        if location == 0 then return vec3:new(-295.468, 2787.385, 59.864)
        elseif location == 1 then return vec3:new(-284.69, 2848.234, 53.266)
        elseif location == 2 then return vec3:new(-329.193, 2803.404, 57.787)
        elseif location == 3 then return vec3:new(-306.847, 2825.6, 58.219)
        elseif location == 4 then return vec3:new(-336.046, 2829.988, 55.448)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 4 then
        if location == 0 then return vec3:new(-1725.245, 233.946, 57.685)
        elseif location == 1 then return vec3:new(-1639.892, 225.521, 60.336)
        elseif location == 2 then return vec3:new(-1648.48, 212.049, 59.777)
        elseif location == 3 then return vec3:new(-1693.318, 156.665, 63.855)
        elseif location == 4 then return vec3:new(-1699.193, 179.574, 63.185)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 5 then
        if location == 0 then return vec3:new(-949.714, -710.658, 19.604)
        elseif location == 1 then return vec3:new(-938.774, -781.817, 19.657)
        elseif location == 2 then return vec3:new(-884.91, -786.863, 15.043)
        elseif location == 3 then return vec3:new(-895.257, -729.943, 19.143)
        elseif location == 4 then return vec3:new(-932.986, -746.452, 19.008)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 6 then
        if location == 0 then return vec3:new(-425.948, 1213.342, 324.936)
        elseif location == 1 then return vec3:new(-387.267, 1137.65, 321.704)
        elseif location == 2 then return vec3:new(-477.999, 1135.36, 320.123)
        elseif location == 3 then return vec3:new(-431.822, 1119.449, 325.964)
        elseif location == 4 then return vec3:new(-387.902, 1161.655, 324.529)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 7 then
        if location == 0 then return vec3:new(-3381.278, 965.534, 7.426)
        elseif location == 1 then return vec3:new(-3427.724, 979.944, 7.526)
        elseif location == 2 then return vec3:new(-3413.606, 961.845, 11.038)
        elseif location == 3 then return vec3:new(-3419.585, 977.595, 11.167)
        elseif location == 4 then return vec3:new(-3425.687, 961.215, 7.536)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 8 then
        if location == 0 then return vec3:new(-688.732, 5828.4, 16.696)
        elseif location == 1 then return vec3:new(-673.425, 5799.744, 16.467)
        elseif location == 2 then return vec3:new(-710.348, 5769.631, 16.75)
        elseif location == 3 then return vec3:new(-699.926, 5801.619, 16.504)
        elseif location == 4 then return vec3:new(-660.359, 5781.733, 18.774)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 9 then
        if location == 0 then return vec3:new(38.717, 6264.173, 32.88)
        elseif location == 1 then return vec3:new(84.67, 6292.286, 30.731)
        elseif location == 2 then return vec3:new(97.17, 6288.558, 38.447)
        elseif location == 3 then return vec3:new(14.453, 6243.932, 35.445)
        elseif location == 4 then return vec3:new(67.52, 6261.744, 32.029)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 10 then
        if location == 0 then return vec3:new(2954.598, 4671.458, 50.106)
        elseif location == 1 then return vec3:new(2911.146, 4637.608, 49.3)
        elseif location == 2 then return vec3:new(2945.212, 4624.044, 49.078)
        elseif location == 3 then return vec3:new(2941.139, 4617.117, 52.114)
        elseif location == 4 then return vec3:new(2895.884, 4686.396, 48.094)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 11 then
        if location == 0 then return vec3:new(1332.319, 4271.446, 30.646)
        elseif location == 1 then return vec3:new(1353.332, 4387.911, 43.541)
        elseif location == 2 then return vec3:new(1337.892, 4321.563, 38.093)
        elseif location == 3 then return vec3:new(1386.603, 4366.511, 42.236)
        elseif location == 4 then return vec3:new(1303.193, 4313.509, 36.939)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 12 then
        if location == 0 then return vec3:new(2720.03, 1572.762, 20.204)
        elseif location == 1 then return vec3:new(2663.161, 1581.395, 24.418)
        elseif location == 2 then return vec3:new(2661.482, 1641.057, 24.001)
        elseif location == 3 then return vec3:new(2671.003, 1561.394, 23.882)
        elseif location == 4 then return vec3:new(2660.104, 1606.54, 28.61)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 13 then
        if location == 0 then return vec3:new(211.775, -934.269, 23.466)
        elseif location == 1 then return vec3:new(198.265, -884.039, 30.696)
        elseif location == 2 then return vec3:new(189.542, -919.726, 29.96)
        elseif location == 3 then return vec3:new(169.504, -934.841, 29.228)
        elseif location == 4 then return vec3:new(212.376, -934.807, 29.007)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    elseif area == 14 then
        if location == 0 then return vec3:new(1330.113, -2520.754, 46.365)
        elseif location == 1 then return vec3:new(1328.954, -2538.302, 46.976)
        elseif location == 2 then return vec3:new(1237.506, -2572.335, 39.791)
        elseif location == 3 then return vec3:new(1244.602, -2563.721, 42.646)
        elseif location == 4 then return vec3:new(1278.421, -2565.117, 43.544)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function street_dealer_coords(location)
    if location == 0 then return vec3:new(550.8953, -1774.5175, 28.3121)
    elseif location == 1 then return vec3:new(-154.924, 6434.428, 30.916)
    elseif location == 2 then return vec3:new(400.9768, 2635.3691, 43.5045)
    elseif location == 3 then return vec3:new(1533.846, 3796.837, 33.456)
    elseif location == 4 then return vec3:new(-1666.642, -1080.0201, 12.1537)
    elseif location == 5 then return vec3:new(-1560.6105, -413.3221, 37.1001)
    elseif location == 6 then return vec3:new(819.2939, -2988.8562, 5.0209)
    elseif location == 7 then return vec3:new(1001.701, -2162.448, 29.567)
    elseif location == 8 then return vec3:new(1388.9678, -1506.0815, 57.0407)
    elseif location == 9 then return vec3:new(-3054.574, 556.711, 0.661)
    elseif location == 10 then return vec3:new(-72.8903, 80.717, 70.6161)
    elseif location == 11 then return vec3:new(198.6676, -167.0663, 55.3187)
    elseif location == 12 then return vec3:new(814.636, -280.109, 65.463)
    elseif location == 13 then return vec3:new(-237.004, -256.513, 38.122)
    elseif location == 14 then return vec3:new(-493.654, -720.734, 22.921)
    elseif location == 15 then return vec3:new(156.1586, 6656.525, 30.5882)
    elseif location == 16 then return vec3:new(1986.3129, 3786.75, 31.2791)
    elseif location == 17 then return vec3:new(-685.5629, 5762.8706, 16.511)
    elseif location == 18 then return vec3:new(1707.703, 4924.311, 41.078)
    elseif location == 19 then return vec3:new(1195.3047, 2630.4685, 36.81)
    elseif location == 20 then return vec3:new(167.0163, 2228.922, 89.7867)
    elseif location == 21 then return vec3:new(2724.0076, 1483.066, 23.5007)
    elseif location == 22 then return vec3:new(1594.9329, 6452.817, 24.3172)
    elseif location == 23 then return vec3:new(-2177.397, 4275.945, 48.12)
    elseif location == 24 then return vec3:new(-2521.249, 2311.794, 32.216)
    elseif location == 25 then return vec3:new(-3162.873, 1115.6418, 19.8526)
    elseif location == 26 then return vec3:new(-1145.026, -2048.466, 12.218)
    elseif location == 27 then return vec3:new(-1304.321, -1318.848, 3.88)
    elseif location == 28 then return vec3:new(-946.727, 322.081, 70.357)
    elseif location == 29 then return vec3:new(-895.112, -776.624, 14.91)
    elseif location == 30 then return vec3:new(-250.614, -1527.617, 30.561)
    elseif location == 31 then return vec3:new(-601.639, -1026.49, 21.55)
    elseif location == 32 then return vec3:new(2712.9868, 4324.1157, 44.8521)
    elseif location == 33 then return vec3:new(726.772, 4169.101, 39.709)
    elseif location == 34 then return vec3:new(178.3272, 3086.2603, 42.0742)
    elseif location == 35 then return vec3:new(2351.592, 2524.249, 46.694)
    elseif location == 36 then return vec3:new(388.9941, 799.6882, 186.6764)
    elseif location == 37 then return vec3:new(2587.9822, 433.6803, 107.6139)
    elseif location == 38 then return vec3:new(830.2875, -1052.7747, 27.6666)
    elseif location == 39 then return vec3:new(-759.662, -208.396, 36.271)
    elseif location == 40 then return vec3:new(-43.7171, -2015.22, 17.017)
    elseif location == 41 then return vec3:new(124.02, -1039.884, 28.213)
    elseif location == 42 then return vec3:new(479.0473, -597.5507, 27.4996)
    elseif location == 43 then return vec3:new(959.67, 3619.036, 31.668)
    elseif location == 44 then return vec3:new(2375.8994, 3162.9954, 47.2087)
    elseif location == 45 then return vec3:new(-1505.687, 1526.558, 114.257)
    elseif location == 46 then return vec3:new(645.737, 242.173, 101.153)
    elseif location == 47 then return vec3:new(1173.1378, -388.2896, 70.5896)
    elseif location == 48 then return vec3:new(-1801.85, 172.49, 67.771)
    elseif location == 49 then return vec3:new(3729.2568, 4524.872, 21.4755)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function shipwrecked_coords(location)
    if location == 0 then return vec3:new(-389.978, -2215.861, 0.565)
    elseif location == 1 then return vec3:new(-872.646, -3121.243, 2.533)
    elseif location == 2 then return vec3:new(-1969.555, -3073.933, 1.899)
    elseif location == 3 then return vec3:new(-1227.362, -1862.997, 1.071)
    elseif location == 4 then return vec3:new(-1684.489, -1077.488, 0.464)
    elseif location == 5 then return vec3:new(-2219.716, -438.266, 0.828)
    elseif location == 6 then return vec3:new(-3099.804, 494.968, 0.134)
    elseif location == 7 then return vec3:new(-3226.636, 1337.312, 0.634)
    elseif location == 8 then return vec3:new(-2879.233, 2247.547, 0.878)
    elseif location == 9 then return vec3:new(-1767.392, 2642.144, 0.089)
    elseif location == 10 then return vec3:new(-180.913, 3081.589, 19.814)
    elseif location == 11 then return vec3:new(-2198.02, 4606.557, 1.402)
    elseif location == 12 then return vec3:new(-1356.295, 5379.136, 0.351)
    elseif location == 13 then return vec3:new(-844.701, 6045.489, 1.201)
    elseif location == 14 then return vec3:new(126.747, 7095.39, 0.484)
    elseif location == 15 then return vec3:new(473.135, 6741.893, -0.009)
    elseif location == 16 then return vec3:new(1469.845, 6629.33, -0.152)
    elseif location == 17 then return vec3:new(2356.588, 6663.491, -0.172)
    elseif location == 18 then return vec3:new(3380.806, 5670.246, 0.898)
    elseif location == 19 then return vec3:new(3198.166, 5091.909, 0.464)
    elseif location == 20 then return vec3:new(3947.421, 4403.337, 0.275)
    elseif location == 21 then return vec3:new(3901.5327, 3323.1387, 0.5902)
    elseif location == 22 then return vec3:new(3646.8667, 3120.687, 0.4864)
    elseif location == 23 then return vec3:new(2891.847, 1790.7085, 1.4015)
    elseif location == 24 then return vec3:new(2779.8674, 1106.5143, -0.0319)
    elseif location == 25 then return vec3:new(2783.5151, 82.6473, -0.0161)
    elseif location == 26 then return vec3:new(2820.225, -759.2029, 1.4572)
    elseif location == 27 then return vec3:new(2772.996, -1606.0311, -0.1129)
    elseif location == 28 then return vec3:new(1818.4303, -2718.4414, 0.1797)
    elseif location == 29 then return vec3:new(987.383, -2681.047, -0.1296)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function hidden_cache_coords(location)
    if location == 0 then return vec3:new(-150.585, -2852.332, -17.97)
    elseif location == 1 then return vec3:new(-540.975, -2465.579, -18.201)
    elseif location == 2 then return vec3:new(15.332, -2323.989, -14.224)
    elseif location == 3 then return vec3:new(461.483, -2386.212, -10.055)
    elseif location == 4 then return vec3:new(839.554, -2782.746, -20.516)
    elseif location == 5 then return vec3:new(1309.934, -2985.761, -21.344)
    elseif location == 6 then return vec3:new(1394.588, -3371.972, -17.855)
    elseif location == 7 then return vec3:new(1067.032, -3610.489, -52.777)
    elseif location == 8 then return vec3:new(371.111, -3226.341, -19.88)
    elseif location == 9 then return vec3:new(-1365.19, -3701.575, -32.056)
    elseif location == 10 then return vec3:new(-1983.722, -2769.391, -22.868)
    elseif location == 11 then return vec3:new(-1295.859, -1948.583, -7.47)
    elseif location == 12 then return vec3:new(-1791.493, -1284.341, -16.36)
    elseif location == 13 then return vec3:new(-1879.817, -1111.846, -19.249)
    elseif location == 14 then return vec3:new(-2086.537, -862.681, -37.465)
    elseif location == 15 then return vec3:new(-2614.496, -636.549, -35.296)
    elseif location == 16 then return vec3:new(-2815.156, -585.703, -59.753)
    elseif location == 17 then return vec3:new(-3412.1304, 165.8565, -32.6174)
    elseif location == 18 then return vec3:new(-3554.145, 817.679, -28.592)
    elseif location == 19 then return vec3:new(-3440.336, 1416.229, -33.629)
    elseif location == 20 then return vec3:new(-3295.557, 2020.828, -20.276)
    elseif location == 21 then return vec3:new(-3020.068, 2527.044, -22.628)
    elseif location == 22 then return vec3:new(-3183.344, 3051.828, -39.251)
    elseif location == 23 then return vec3:new(-3270.3245, 3670.6917, -26.5299)
    elseif location == 24 then return vec3:new(-2860.754, 3912.275, -33.684)
    elseif location == 25 then return vec3:new(-2752.189, 4572.626, -21.415)
    elseif location == 26 then return vec3:new(-2407.659, 4898.846, -45.411)
    elseif location == 27 then return vec3:new(-1408.649, 5734.096, -36.339)
    elseif location == 28 then return vec3:new(-1008.661, 6531.678, -22.122)
    elseif location == 29 then return vec3:new(-811.495, 6667.619, -14.098)
    elseif location == 30 then return vec3:new(-420.119, 7224.093, -44.899)
    elseif location == 31 then return vec3:new(425.78, 7385.154, -44.087)
    elseif location == 32 then return vec3:new(556.131, 7158.932, -38.031)
    elseif location == 33 then return vec3:new(1441.456, 6828.521, -44.977)
    elseif location == 34 then return vec3:new(1820.262, 7017.078, -78.959)
    elseif location == 35 then return vec3:new(2396.039, 6939.861, -104.858)
    elseif location == 36 then return vec3:new(2475.159, 6704.704, -9.333)
    elseif location == 37 then return vec3:new(2696.607, 6655.181, -21.513)
    elseif location == 38 then return vec3:new(3049.285, 6549.182, -36.306)
    elseif location == 39 then return vec3:new(3411.339, 6308.514, -52.545)
    elseif location == 40 then return vec3:new(3770.457, 5838.503, -27.88)
    elseif location == 41 then return vec3:new(3625.00, 5543.203, -26.645)
    elseif location == 42 then return vec3:new(3986.087, 3867.625, -31.705)
    elseif location == 43 then return vec3:new(3846.006, 3683.454, -17.227)
    elseif location == 44 then return vec3:new(4130.328, 3530.792, -27.516)
    elseif location == 45 then return vec3:new(3897.776, 3050.804, -19.277)
    elseif location == 46 then return vec3:new(3751.005, 2672.416, -48.526)
    elseif location == 47 then return vec3:new(3559.241, 2070.137, -38.01)
    elseif location == 48 then return vec3:new(3410.804, 1225.255, -55.684)
    elseif location == 49 then return vec3:new(3373.351, 323.788, -20.246)
    elseif location == 50 then return vec3:new(3152.983, -261.257, -8.355)
    elseif location == 51 then return vec3:new(3192.368, -367.909, -30.311)
    elseif location == 52 then return vec3:new(3178.722, -988.684, -25.133)
    elseif location == 53 then return vec3:new(2701.915, -1365.816, -13.163)
    elseif location == 54 then return vec3:new(3045.378, -1682.987, -31.797)
    elseif location == 55 then return vec3:new(2952.829, -2313.142, -94.421)
    elseif location == 56 then return vec3:new(2361.167, -2728.077, -67.131)
    elseif location == 57 then return vec3:new(1824.039, -2973.19, -41.865)
    elseif location == 58 then return vec3:new(-575.734, -3132.886, -21.879)
    elseif location == 59 then return vec3:new(-1872.968, -2087.878, -61.897)
    elseif location == 60 then return vec3:new(-3205.486, -144.9, -31.784)
    elseif location == 61 then return vec3:new(-1760.539, 5721.301, -74.808)
    elseif location == 62 then return vec3:new(-1293.948, 5886.757, -27.186)
    elseif location == 63 then return vec3:new(-6.032, 7464.313, -12.313)
    elseif location == 64 then return vec3:new(3627.174, 5286.089, -35.437)
    elseif location == 65 then return vec3:new(3978.554, 4987.259, -69.702)
    elseif location == 66 then return vec3:new(3995.491, 4858.986, -37.555)
    elseif location == 67 then return vec3:new(4218.075, 4116.594, -29.013)
    elseif location == 68 then return vec3:new(3795.855, 2327.765, -37.352)
    elseif location == 69 then return vec3:new(3247.753, 1395.029, -50.268)
    elseif location == 70 then return vec3:new(3451.907, 278.014, -99.633)
    elseif location == 71 then return vec3:new(1061.475, 7157.525, -28.239)
    elseif location == 72 then return vec3:new(-1551.109, 5558.511, -22.472)
    elseif location == 73 then return vec3:new(-29.194, -3484.225, -34.377)
    elseif location == 74 then return vec3:new(2981.125, 843.773, -4.586)
    elseif location == 75 then return vec3:new(2446.59, -2413.441, -35.135)
    elseif location == 76 then return vec3:new(423.342, -2864.345, -16.944)
    elseif location == 77 then return vec3:new(668.404, -3173.142, -6.337)
    elseif location == 78 then return vec3:new(-2318.251, 4976.115, -101.11)
    elseif location == 79 then return vec3:new(806.924, 6846.94, -3.666)
    elseif location == 80 then return vec3:new(4404.907, 4617.076, -20.163)
    elseif location == 81 then return vec3:new(3276.699, 1648.139, -44.099)
    elseif location == 82 then return vec3:new(2979.325, 1.033, -16.746)
    elseif location == 83 then return vec3:new(-838.069, -1436.609, -10.248)
    elseif location == 84 then return vec3:new(-3334.358, 3276.015, -27.291)
    elseif location == 85 then return vec3:new(-808.456, 6165.307, -3.398)
    elseif location == 86 then return vec3:new(-397.854, 6783.974, -19.076)
    elseif location == 87 then return vec3:new(95.133, 3898.854, 24.086)
    elseif location == 88 then return vec3:new(660.099, 3760.461, 19.43)
    elseif location == 89 then return vec3:new(2241.487, 4022.88, 25.675)
    elseif location == 90 then return vec3:new(1553.867, 4321.805, 19.761)
    elseif location == 91 then return vec3:new(857.875, 3958.953, 6.001)
    elseif location == 92 then return vec3:new(3431.468, 717.226, -93.674)
    elseif location == 93 then return vec3:new(-1634.57, -1741.677, -34.462)
    elseif location == 94 then return vec3:new(-3378.466, 503.853, -27.274)
    elseif location == 95 then return vec3:new(-1732.212, 5336.15, -7.72)
    elseif location == 96 then return vec3:new(-2612.415, 4266.765, -30.535)
    elseif location == 97 then return vec3:new(3406.32, -584.198, -18.545)
    elseif location == 98 then return vec3:new(-3106.876, 2432.615, -23.172)
    elseif location == 99 then return vec3:new(-2172.952, -3199.194, -33.315)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function junk_skydive_coords(location)
    if location == 0 then return vec3:new(-121.199, -962.557, 26.524)
    elseif location == 1 then return vec3:new(153.572, -721.103, 46.328)
    elseif location == 2 then return vec3:new(-812.47, 299.77, 85.407)
    elseif location == 3 then return vec3:new(-1223.345, 3856.44, 488.126)
    elseif location == 4 then return vec3:new(426.341, 5612.683, 765.588)
    elseif location == 5 then return vec3:new(503.8174, 5506.424, 773.6786)
    elseif location == 6 then return vec3:new(813.5065, 5720.6187, 693.7969)
    elseif location == 7 then return vec3:new(-860.4413, 4729.499, 275.6516)
    elseif location == 8 then return vec3:new(1717.6476, 3295.5166, 40.4591)
    elseif location == 9 then return vec3:new(2033.4845, 4733.43, 40.8773)
    elseif location == 10 then return vec3:new(-1167.212, -2494.621, 12.956)
    elseif location == 11 then return vec3:new(2790.4, 1465.635, 23.518)
    elseif location == 12 then return vec3:new(-782.166, -1452.285, 4.013)
    elseif location == 13 then return vec3:new(-559.43, -909.031, 22.863)
    elseif location == 14 then return vec3:new(-136.551, 6356.967, 30.492)
    elseif location == 15 then return vec3:new(742.95, 2535.935, 72.156)
    elseif location == 16 then return vec3:new(-2952.79, 441.363, 14.251)
    elseif location == 17 then return vec3:new(-1522.113, 1491.642, 110.595)
    elseif location == 18 then return vec3:new(261.555, -209.291, 60.566)
    elseif location == 19 then return vec3:new(739.4191, -1223.1754, 23.7705)
    elseif location == 20 then return vec3:new(-1724.4279, -1129.78, 12.0438)
    elseif location == 21 then return vec3:new(735.9623, 1303.1774, 359.293)
    elseif location == 22 then return vec3:new(2555.3403, 301.0995, 107.4623)
    elseif location == 23 then return vec3:new(-1143.5713, 2683.302, 17.0937)
    elseif location == 24 then return vec3:new(-917.5775, -1155.1293, 3.7723)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function treasure_chest_coords(location)
    if location == 0 then return vec3:new(4877.7646, -4781.151, 1.1379)
    elseif location == 1 then return vec3:new(4535.187, -4703.817, 1.1286)
    elseif location == 2 then return vec3:new(3900.6318, -4704.9194, 3.4813)
    elseif location == 3 then return vec3:new(4823.4844, -4323.176, 4.6816)
    elseif location == 4 then return vec3:new(5175.097, -4678.9375, 1.4205)
    elseif location == 5 then return vec3:new(5590.9507, -5216.8467, 13.351)
    elseif location == 6 then return vec3:new(5457.7954, -5860.7734, 19.0936)
    elseif location == 7 then return vec3:new(4855.598, -5561.794, 26.5093)
    elseif location == 8 then return vec3:new(4854.77, -5162.7295, 1.4387)
    elseif location == 9 then return vec3:new(4178.2944, -4357.763, 1.5826)
    elseif location == 10 then return vec3:new(4942.0825, -5168.135, -3.575)
    elseif location == 11 then return vec3:new(4560.804, -4356.775, -7.888)
    elseif location == 12 then return vec3:new(5598.9644, -5604.2393, -6.0489)
    elseif location == 13 then return vec3:new(5264.7236, -4920.671, -2.8715)
    elseif location == 14 then return vec3:new(4944.2183, -4293.736, -6.6942)
    elseif location == 15 then return vec3:new(4560.804, -4356.775, -7.888)
    elseif location == 16 then return vec3:new(3983.0261, -4540.1865, -6.1264)
    elseif location == 17 then return vec3:new(4414.676, -4651.4575, -5.083)
    elseif location == 18 then return vec3:new(4540.07, -4774.899, -3.9321)
    elseif location == 19 then return vec3:new(4777.6006, -5394.6265, -5.0127)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function buried_stash_coords(location)
    if location == 0 then return vec3:new(5579.7026, -5231.42, 14.2512)
    elseif location == 1 then return vec3:new(5481.595, -5855.187, 19.128)
    elseif location == 2 then return vec3:new(5549.2407, -5747.577, 10.427)
    elseif location == 3 then return vec3:new(5295.542, -5587.4307, 61.3964)
    elseif location == 4 then return vec3:new(5136.9844, -5524.6675, 52.7719)
    elseif location == 5 then return vec3:new(4794.91, -5546.516, 21.4945)
    elseif location == 6 then return vec3:new(4895.3125, -5335.3433, 9.0204)
    elseif location == 7 then return vec3:new(4994.968, -5136.416, 1.476)
    elseif location == 8 then return vec3:new(5323.654, -5276.0596, 33.0353)
    elseif location == 9 then return vec3:new(5362.1177, -5170.0854, 28.035)
    elseif location == 10 then return vec3:new(5164.5522, -4706.8384, 1.1632)
    elseif location == 11 then return vec3:new(4888.6104, -4789.4756, 1.4911)
    elseif location == 12 then return vec3:new(4735.3096, -4687.2236, 1.2879)
    elseif location == 13 then return vec3:new(4887.2036, -4630.111, 13.149)
    elseif location == 14 then return vec3:new(4796.803, -4317.4175, 4.3515)
    elseif location == 15 then return vec3:new(4522.936, -4649.638, 10.037)
    elseif location == 16 then return vec3:new(4408.228, -4470.875, 3.3683)
    elseif location == 17 then return vec3:new(4348.7827, -4311.3193, 1.3335)
    elseif location == 18 then return vec3:new(4235.67, -4552.0557, 4.0738)
    elseif location == 19 then return vec3:new(3901.899, -4720.187, 3.4537)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function exotic_export_coords(location, part)
    if part then
        if location == 0 then return vec3:new(-1297.199, 252.495, 61.813)
        elseif location == 1 then return vec3:new(-1114.101, 479.205, 81.161)
        elseif location == 2 then return vec3:new(-345.267, 662.299, 168.587)
        elseif location == 3 then return vec3:new(-72.605, 902.579, 234.631)
        elseif location == 4 then return vec3:new(-161.232, 274.911, 92.534)
        elseif location == 5 then return vec3:new(-504.323, 424.21, 96.287)
        elseif location == 6 then return vec3:new(-1451.916, 533.495, 118.177)
        elseif location == 7 then return vec3:new(-1979.252, 586.078, 116.479)
        elseif location == 8 then return vec3:new(-1405.117, 81.983, 52.099)
        elseif location == 9 then return vec3:new(-1299.92, -228.464, 59.654)
        elseif location == 10 then return vec3:new(-1409.08, -590.823, 29.317)
        elseif location == 11 then return vec3:new(-1085.162, -476.529, 35.636)
        elseif location == 12 then return vec3:new(-817.325, -1201.59, 5.935)
        elseif location == 13 then return vec3:new(-1873.598, -343.933, 48.26)
        elseif location == 14 then return vec3:new(-1334.625, -1008.972, 6.867)
        elseif location == 15 then return vec3:new(-1043.008, -1010.464, 1.15)
        elseif location == 16 then return vec3:new(-489.189, -596.899, 30.174)
        elseif location == 17 then return vec3:new(-187.144, -175.854, 42.624)
        elseif location == 18 then return vec3:new(871.548, -75.386, 77.764)
        elseif location == 19 then return vec3:new(443.542, 253.197, 102.21)
        elseif location == 20 then return vec3:new(185.595, -1016.005, 28.3)
        elseif location == 21 then return vec3:new(110.261, -714.605, 32.133)
        elseif location == 22 then return vec3:new(-220.102, -590.273, 33.264)
        elseif location == 23 then return vec3:new(-74.575, -619.874, 35.173)
        elseif location == 24 then return vec3:new(283.769, -342.644, 43.92)
        elseif location == 25 then return vec3:new(-237.521, -2059.951, 26.62)
        elseif location == 26 then return vec3:new(-1044.016, -2608.022, 19.775)
        elseif location == 27 then return vec3:new(-801.566, -1313.922, 4.0)
        elseif location == 28 then return vec3:new(-972.578, -1464.273, 4.013)
        elseif location == 29 then return vec3:new(1309.942, -530.154, 70.312)
        elseif location == 30 then return vec3:new(1566.097, -1683.172, 87.205)
        elseif location == 31 then return vec3:new(339.481, 159.143, 102.146)
        elseif location == 32 then return vec3:new(-2316.493, 280.86, 168.467)
        elseif location == 33 then return vec3:new(-3036.574, 105.31, 10.593)
        elseif location == 34 then return vec3:new(-3071.87, 658.171, 9.918)
        elseif location == 35 then return vec3:new(-1534.826, 889.731, 180.803)
        elseif location == 36 then return vec3:new(140.945, 6606.513, 30.845)
        elseif location == 37 then return vec3:new(1362.672, 1178.352, 111.609)
        elseif location == 38 then return vec3:new(1869.749, 2622.154, 44.672)
        elseif location == 39 then return vec3:new(2673.478, 1678.569, 23.488)
        elseif location == 40 then return vec3:new(2593.022, 364.349, 107.457)
        elseif location == 41 then return vec3:new(-1886.248, 2016.572, 139.951)
        elseif location == 42 then return vec3:new(2537.084, -390.048, 91.993)
        elseif location == 43 then return vec3:new(3511.653, 3783.877, 28.925)
        elseif location == 44 then return vec3:new(2002.724, 3769.429, 31.181)
        elseif location == 45 then return vec3:new(-771.927, 5566.46, 32.486)
        elseif location == 46 then return vec3:new(1697.817, 6414.365, 31.73)
        elseif location == 47 then return vec3:new(386.663, 2640.138, 43.493)
        elseif location == 48 then return vec3:new(231.935, 1162.313, 224.464)
        elseif location == 49 then return vec3:new(1700.445, 4937.267, 41.078)
        else return vec3:new(0.0, 0.0, 0.0)
        end
    else
        if location == 0 then return vec3:new(-582.454, -859.433, 25.034)
        elseif location == 1 then return vec3:new(-604.458, -1218.292, 13.507)
        elseif location == 2 then return vec3:new(-229.587, -1483.435, 30.352)
        elseif location == 3 then return vec3:new(28.385, -1707.341, 28.298)
        elseif location == 4 then return vec3:new(-22.296, -1851.577, 24.108)
        elseif location == 5 then return vec3:new(321.798, -1948.141, 23.627)
        elseif location == 6 then return vec3:new(455.602, -1695.263, 28.289)
        elseif location == 7 then return vec3:new(934.148, -1812.944, 29.812)
        elseif location == 8 then return vec3:new(1228.548, -1605.649, 50.736)
        elseif location == 9 then return vec3:new(-329.7, -700.958, 31.912)
        elseif location == 10 then return vec3:new(238.339, -35.01, 68.728)
        elseif location == 11 then return vec3:new(393.61, -649.557, 27.5)
        elseif location == 12 then return vec3:new(246.847, -1162.082, 28.16)
        elseif location == 13 then return vec3:new(124.231, -1472.496, 28.142)
        elseif location == 14 then return vec3:new(1136.156, -773.997, 56.632)
        elseif location == 15 then return vec3:new(1156.682, -1474.145, 33.693)
        elseif location == 16 then return vec3:new(1028.898, -2405.952, 28.494)
        elseif location == 17 then return vec3:new(-936.334, -2692.07, 15.611)
        elseif location == 18 then return vec3:new(-532.351, -2134.219, 4.992)
        elseif location == 19 then return vec3:new(-1530.625, -993.47, 12.017)
        elseif location == 20 then return vec3:new(-1528.444, -427.05, 34.447)
        elseif location == 21 then return vec3:new(-1640.424, -202.879, 54.146)
        elseif location == 22 then return vec3:new(-552.673, 309.154, 82.191)
        elseif location == 23 then return vec3:new(642.042, 587.747, 127.911)
        elseif location == 24 then return vec3:new(-1804.769, 804.137, 137.514)
        elseif location == 25 then return vec3:new(839.097, 2202.196, 50.46)
        elseif location == 26 then return vec3:new(756.539, 2525.957, 72.161)
        elseif location == 27 then return vec3:new(1205.454, 2658.357, 36.824)
        elseif location == 28 then return vec3:new(1991.707, 3078.063, 46.016)
        elseif location == 29 then return vec3:new(1977.207, 3837.1, 30.997)
        elseif location == 30 then return vec3:new(1350.173, 3601.249, 33.899)
        elseif location == 31 then return vec3:new(1819.042, 4592.234, 35.316)
        elseif location == 32 then return vec3:new(2905.354, 4419.682, 47.541)
        elseif location == 33 then return vec3:new(-472.038, 6034.981, 30.341)
        elseif location == 34 then return vec3:new(-165.839, 6454.25, 30.495)
        elseif location == 35 then return vec3:new(-2221.144, 4232.757, 46.132)
        elseif location == 36 then return vec3:new(-3138.864, 1086.83, 19.669)
        elseif location == 37 then return vec3:new(1546.591, 3781.791, 33.06)
        elseif location == 38 then return vec3:new(2717.772, 1391.725, 23.535)
        elseif location == 39 then return vec3:new(-1144.001, 2666.28, 17.094)
        elseif location == 40 then return vec3:new(-2555.512, 2322.827, 32.06)
        elseif location == 41 then return vec3:new(-2340.763, 296.197, 168.467)
        elseif location == 42 then return vec3:new(1122.086, 267.125, 79.856)
        elseif location == 43 then return vec3:new(629.014, 196.173, 96.128)
        elseif location == 44 then return vec3:new(1150.161, -991.569, 44.528)
        elseif location == 45 then return vec3:new(244.916, -860.606, 28.5)
        elseif location == 46 then return vec3:new(-340.099, -876.452, 30.071)
        elseif location == 47 then return vec3:new(387.275, -215.651, 55.835)
        elseif location == 48 then return vec3:new(-1234.105, -1646.832, 3.129)
        elseif location == 49 then return vec3:new(-1062.018, -226.736, 37.155)
        else vec3:new(0.0, 0.0, 0.0)
        end
    end
end

local function standard_trial_coords(location)
    if location == 0 then return vec3:new(-1811.675, -1199.5421, 12.0174)
    elseif location == 1 then return vec3:new(-377.166, 1250.8182, 326.4899)
    elseif location == 2 then return vec3:new(-1253.2399, -380.457, 58.2873)
    elseif location == 3 then return vec3:new(2702.0369, 5145.717, 42.8568)
    elseif location == 4 then return vec3:new(1261.3533, -3278.38, 4.8335)
    elseif location == 5 then return vec3:new(-1554.3121, 2755.0088, 16.8004)
    elseif location == 6 then return vec3:new(637.1439, -1845.8552, 8.2676)
    elseif location == 7 then return vec3:new(-552.626, 5042.7026, 127.9448)
    elseif location == 8 then return vec3:new(-579.1157, 5324.664, 69.2662)
    elseif location == 9 then return vec3:new(1067.343, -2448.2366, 28.0683)
    elseif location == 10 then return vec3:new(1577.189, 6439.966, 23.6996)
    elseif location == 11 then return vec3:new(-199.7486, -1973.3108, 26.6204)
    elseif location == 12 then return vec3:new(-1504.541, 1482.4895, 116.053)
    elseif location == 13 then return vec3:new(-1502.0471, 4940.611, 63.8034)
    elseif location == 14 then return vec3:new(947.562, 142.6773, 79.8307)
    elseif location == 15 then return vec3:new(1246.2249, 2685.1099, 36.5944)
    elseif location == 16 then return vec3:new(-1021.1459, -2580.291, 33.6353)
    elseif location == 17 then return vec3:new(231.9767, 3301.4888, 39.5627)
    elseif location == 18 then return vec3:new(860.353, 536.8055, 124.7803)
    elseif location == 19 then return vec3:new(2820.6514, 1642.2759, 23.668)
    elseif location == 20 then return vec3:new(-2257.7986, 4315.927, 44.5551)
    elseif location == 21 then return vec3:new(526.397, 5624.461, 779.3564)
    elseif location == 22 then return vec3:new(175.2847, -3042.0754, 4.7734)
    elseif location == 23 then return vec3:new(813.3556, 1274.9536, 359.511)
    elseif location == 24 then return vec3:new(77.5248, 3629.9146, 38.6907)
    elseif location == 25 then return vec3:new(1004.6567, 898.837, 209.0257)
    elseif location == 26 then return vec3:new(104.8058, -1938.9818, 19.8037)
    elseif location == 27 then return vec3:new(-985.2776, -2698.696, 12.8307)
    elseif location == 28 then return vec3:new(230.6618, -1399.0258, 29.4856)
    elseif location == 29 then return vec3:new(-546.6672, -2857.9282, 5.0004)
    elseif location == 30 then return vec3:new(-172.8944, 1034.8262, 231.2332)
    elseif location == 31 then return vec3:new(1691.4703, -1458.6351, 111.7033)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function rc_trial_coords(location)
    if location == 0 then return vec3:new(-486.1165, -916.59, 22.964)
    elseif location == 1 then return vec3:new(854.8221, -2189.789, 29.679604)
    elseif location == 2 then return vec3:new(-1730.7411, -188.57533, 57.337273)
    elseif location == 3 then return vec3:new(1409.3899, 1084.5609, 113.33391)
    elseif location == 4 then return vec3:new(-901.63, -779.377, 14.859)
    elseif location == 5 then return vec3:new(2562.03, 2707.7473, 41.071)
    elseif location == 6 then return vec3:new(-1194.2417, -1456.5526, 3.379667)
    elseif location == 7 then return vec3:new(-216.2158, -1109.7155, 21.9008)
    elseif location == 8 then return vec3:new(-889.356, -1071.848, 1.163)
    elseif location == 9 then return vec3:new(885.3417, -255.1916, 68.4006)
    elseif location == 10 then return vec3:new(-948.3436, -491.1428, 35.8333)
    elseif location == 11 then return vec3:new(750.3155, 597.0025, 124.9241)
    elseif location == 12 then return vec3:new(-402.4602, -1701.4429, 17.8213)
    elseif location == 13 then return vec3:new(-601.3092, 5295.396, 69.2145)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function bike_trial_coords(location)
    if location == 0 then return vec3:new(501.6576, 5598.3604, 795.1221)
    elseif location == 1 then return vec3:new(493.7987, 5528.249, 777.3241)
    elseif location == 2 then return vec3:new(2820.5623, 5972.031, 349.5339)
    elseif location == 3 then return vec3:new(-1031.3934, 4721.9556, 235.3456)
    elseif location == 4 then return vec3:new(-1932.808, 1782.2681, 172.2726)
    elseif location == 5 then return vec3:new(-182.0154, 319.3242, 96.7999)
    elseif location == 6 then return vec3:new(1100.4553, -264.2758, 68.268)
    elseif location == 7 then return vec3:new(736.0028, 2574.1477, 74.2793)
    elseif location == 8 then return vec3:new(1746.0431, -1474.762, 111.8385)
    elseif location == 9 then return vec3:new(30.5142, 197.473, 104.6073)
    elseif location == 10 then return vec3:new(145.0902, -605.9424, 46.0762)
    elseif location == 11 then return vec3:new(-447.3499, 1600.9911, 357.3483)
    elseif location == 12 then return vec3:new(-2205.15, 199.7418, 173.6018)
    elseif location == 13 then return vec3:new(1321.0515, -505.2507, 70.4208)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function ls_tag_coords(location)
    if location == 0 then return vec3:new(-977.6928, -2639.573, 16.474)
    elseif location == 1 then return vec3:new(819.4288, -2227.2385, 32.6184)
    elseif location == 2 then return vec3:new(37.9683, -1469.2217, 32.235)
    elseif location == 3 then return vec3:new(-768.9666, -1321.6681, 7.1244)
    elseif location == 4 then return vec3:new(1209.1267, -1505.5887, 36.4654)
    elseif location == 5 then return vec3:new(845.3231, -1203.0039, 27.46)
    elseif location == 6 then return vec3:new(188.2855, -1843.3844, 29.2995)
    elseif location == 7 then return vec3:new(182.0389, -941.2879, 32.2661)
    elseif location == 8 then return vec3:new(-501.2574, -684.436, 35.186)
    elseif location == 9 then return vec3:new(-1636.3019, -1063.8951, 15.1266)
    elseif location == 10 then return vec3:new(1165.2151, -314.1255, 71.217)
    elseif location == 11 then return vec3:new(369.5584, -326.8165, 49.145)
    elseif location == 12 then return vec3:new(-942.4161, -343.455, 40.765)
    elseif location == 13 then return vec3:new(-2066, -345.2393, 15.761)
    elseif location == 14 then return vec3:new(-359.6902, 141.5108, 68.5588)
    elseif location == 15 then return vec3:new(2581.005, 487.5057, 110.868)
    elseif location == 16 then return vec3:new(760.227, 583.9885, 128.3567)
    elseif location == 17 then return vec3:new(-481.0848, 1112.5974, 322.24)
    elseif location == 18 then return vec3:new(-1834.4456, 788.6052, 140.539)
    elseif location == 19 then return vec3:new(-3195.2385, 1318.3502, 11.5263)
    elseif location == 20 then return vec3:new(-2557.941, 2302.0186, 34.956)
    elseif location == 21 then return vec3:new(-2219.9644, 4222.4917, 49.078)
    elseif location == 22 then return vec3:new(2469.77, 4082.911, 39.8446)
    elseif location == 23 then return vec3:new(575.3076, 2676.81, 43.712)
    elseif location == 24 then return vec3:new(2741.5925, 3453.4548, 58.443)
    elseif location == 25 then return vec3:new(1928.9758, 3736.5696, 34.514)
    elseif location == 26 then return vec3:new(1723.0552, 4790.159, 43.9136)
    elseif location == 27 then return vec3:new(-756.7117, 5600.3823, 38.6646)
    elseif location == 28 then return vec3:new(1.7607, 6410.2383, 33.779)
    elseif location == 29 then return vec3:new(1411.0867, 3608.7688, 37.0159)
    else return vec3:new(0.0, 0.0, 0.0)
    end 
end

local function madrazo_hit_coords(location)
    if location == 0 then return vec3:new(1355.1779, 3600.6501, 33.9761)
    elseif location == 1 then return vec3:new(2258.5862, 3146.8416, 47.7513)
    elseif location == 2 then return vec3:new(2414.5872, 4850.1777, 37.2357)
    elseif location == 3 then return vec3:new(-306.0638, 6248.7246, 30.4665)
    elseif location == 4 then return vec3:new(924.7427, -2066.5093, 29.5178)
    elseif location == 5 then return vec3:new(302.9755, -1860.7911, 25.7811)
    elseif location == 6 then return vec3:new(-592.9996, -882.7405, 24.918)
    elseif location == 7 then return vec3:new(-140.1684, -1534.7019, 33.2548)
    elseif location == 8 then return vec3:new(1317.918, -1614.6876, 51.3666)
    elseif location == 9 then return vec3:new(650.728, -2872.411, 5.057)
    elseif location == 10 then return vec3:new(-3137.5437, 1055.0897, 19.3245)
    elseif location == 11 then return vec3:new(-965.4027, -2608.117, 12.981)
    elseif location == 12 then return vec3:new(219.8501, 284.7484, 104.4699)
    elseif location == 13 then return vec3:new(116.2243, 3401.1082, 36.7988)
    elseif location == 14 then return vec3:new(-559.1921, 175.2093, 67.6451)
    else return vec3:new(0.0, 0.0, 0.0)
    end
end

local function format_int(number)
    local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')
    int = int:reverse():gsub("(%d%d%d)", "%1,")
    return minus .. int:reverse():gsub("^,", "") .. fraction
end

local function get_daily_reset_time(target_time)
    local current_utc = os.date("!*t")
    local hours_left  = (24 - current_utc.hour + target_time) % 24
    local mins_left   = 60 - current_utc.min
    local secs_left   = 60 - current_utc.sec
    return hours_left, mins_left, secs_left
end

local function teleport(coords)
    script.run_in_fiber(function()
        PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
    end)
end

local function has_bit_set(address, pos)
    return (address & (1 << pos)) ~= 0
end

local function spawn_vehicle(vehicle_joaat)
    script.run_in_fiber(function(script)
        local load_counter = 0
        while not STREAMING.HAS_MODEL_LOADED(vehicle_joaat) do
            STREAMING.REQUEST_MODEL(vehicle_joaat);
            script:yield();
            if load_counter > 100 then
                return
            else
                load_counter = load_counter + 1
            end
        end
        local location = ENTITY.GET_ENTITY_COORDS(self.get_ped(), false)
        local veh      = VEHICLE.CREATE_VEHICLE(vehicle_joaat, location.x, location.y, location.z, ENTITY.GET_ENTITY_HEADING(self.get_ped()), true, false, false)
        STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(vehicle_joaat)
        DECORATOR.DECOR_SET_INT(veh, "MPBitset", 0)
        local network_id = NETWORK.VEH_TO_NET(veh)
        if NETWORK.NETWORK_GET_ENTITY_IS_NETWORKED(veh) then
            NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(network_id, true)
        end
        VEHICLE.SET_VEHICLE_IS_STOLEN(veh, false)
        PED.SET_PED_INTO_VEHICLE(self.get_ped(), veh, -1)
        ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(veh)
    end)
end

local function get_safe_code()
    local combination_retn = ""
    for i = 0, 2, 1 do
        if i == 2 then
            combination_retn = combination_retn .. string.format("%02d",locals.get_int("fm_content_stash_house", stash_house_local_one + 22 + (1 + (i * 2)) + 1))
        else
            combination_retn = combination_retn .. string.format("%02d",locals.get_int("fm_content_stash_house", stash_house_local_one + 22 + (1 + (i * 2)) + 1)) .. "-"
        end
    end
    return combination_retn
end

local function get_vehicle_name(index, return_joaat)
    local offset        = globals.get_int(global_one + index) + 1
    local vehicle_joaat = globals.get_uint(global_two + offset)
    if return_joaat == true then
        return vehicle_joaat
    else
        return vehicles.get_vehicle_display_name(vehicle_joaat)
    end
end

local function is_second_part(hash)
    if hash == joaat("asbo") then return false
    elseif hash == joaat("brioso") then return false
    elseif hash == joaat("buccaneer2") then return false
    elseif hash == joaat("dominator3") then return false
    elseif hash == joaat("elegy") then return false
    elseif hash == joaat("brawler") then return false
    elseif hash == joaat("flashgt") then return false
    elseif hash == joaat("gauntlet4") then return false
    elseif hash == joaat("issi3") then return false
    elseif hash == joaat("jugular") then return false
    elseif hash == joaat("kamacho") then return false
    elseif hash == joaat("komoda") then return false
    elseif hash == joaat("nightshade") then return false
    elseif hash == joaat("peyote3") then return false
    elseif hash == joaat("phoenix") then return false
    elseif hash == joaat("raiden") then return false
    elseif hash == joaat("retinue") then return false
    elseif hash == joaat("rocoto") then return false
    elseif hash == joaat("ruiner") then return false
    elseif hash == joaat("sabregt2") then return false
    elseif hash == joaat("savestra") then return false
    elseif hash == joaat("chino2") then return false
    elseif hash == joaat("cheburek") then return false
    elseif hash == joaat("cavalcade") then return false
    elseif hash == joaat("buffalo2") then return false
    elseif hash == joaat("alpha") then return false
    elseif hash == joaat("kanjo") then return false
    elseif hash == joaat("kuruma") then return false
    elseif hash == joaat("sentinel3") then return false
    elseif hash == joaat("sultan2") then return false
    elseif hash == joaat("yosemite2") then return false
    elseif hash == joaat("z190") then return false
    elseif hash == joaat("jackal") then return false
    elseif hash == joaat("vstr") then return false
    elseif hash == joaat("vagrant") then return false
    elseif hash == joaat("vamos") then return false
    elseif hash == joaat("tampa2") then return false
    elseif hash == joaat("tornado5") then return false
    elseif hash == joaat("tropos") then return false
    elseif hash == joaat("tulip") then return false
    end
    return true
end

local function get_challenge_time(skydive_location)
    if skydive_location == 0 then return "00:40.00"
    elseif skydive_location == 1 then return "00:40.00"
    elseif skydive_location == 2 then return "00:45.00"
    elseif skydive_location == 3 then return "01:25.00"
    elseif skydive_location == 4 then return "01:45.00"
    elseif skydive_location == 5 then return "01:35.00"
    elseif skydive_location == 6 then return "01:10.00"
    elseif skydive_location == 7 then return "00:40.00"
    elseif skydive_location == 8 then return "02:50.00"
    elseif skydive_location == 9 then return "02:50.00"
    elseif skydive_location == 10 then return "02:00.00"
    elseif skydive_location == 11 then return "01:55.00"
    elseif skydive_location == 12 then return "01:25.00"
    elseif skydive_location == 13 then return "01:20.00"
    elseif skydive_location == 14 then return "02:15.00"
    elseif skydive_location == 15 then return "01:30.00"
    elseif skydive_location == 16 then return "01:30.00"
    elseif skydive_location == 17 then return "01:47.00"
    elseif skydive_location == 18 then return "01:40.00"
    elseif skydive_location == 19 then return "01:50.00"
    elseif skydive_location == 20 then return "01:50.00"
    elseif skydive_location == 21 then return "01:35.00"
    elseif skydive_location == 22 then return "01:55.00"
    elseif skydive_location == 23 then return "01:50.00"
    elseif skydive_location == 24 then return "01:25.00"
    end
    return "unavailable"
end

local function get_par_time(trial_variant, trial_location)
    if trial_variant == 0 then
        if trial_location == 0 then return "01:43.20"
        elseif trial_location == 1 then return "02:04.40"
        elseif trial_location == 2 then return "02:04.90"
        elseif trial_location == 3 then return "00:46.30"
        elseif trial_location == 4 then return "04:09.50"
        elseif trial_location == 5 then return "01:44.00"
        elseif trial_location == 6 then return "00:38.50"
        elseif trial_location == 7 then return "01:10.10"
        elseif trial_location == 8 then return "02:15.00"
        elseif trial_location == 9 then return "02:07.20"
        elseif trial_location == 10 then return "01:41.30"
        elseif trial_location == 11 then return "01:17.80"
        elseif trial_location == 12 then return "00:58.80"
        elseif trial_location == 13 then return "02:29.40"
        elseif trial_location == 14 then return "01:00.00"
        elseif trial_location == 15 then return "01:19.00"
        elseif trial_location == 16 then return "01:43.40"
        elseif trial_location == 17 then return "01:24.20"
        elseif trial_location == 18 then return "02:58.80"
        elseif trial_location == 19 then return "01:26.60"
        elseif trial_location == 20 then return "01:16.60"
        elseif trial_location == 21 then return "00:54.20"
        elseif trial_location == 22 then return "01:40.00"
        elseif trial_location == 23 then return "02:05.00"
        elseif trial_location == 24 then return "02:00.00"
        elseif trial_location == 25 then return "02:35.00"
        elseif trial_location == 26 then return "01:20.00"
        elseif trial_location == 27 then return "02:24.00"
        elseif trial_location == 28 then return "02:16.00"
        elseif trial_location == 29 then return "01:50.00"
        elseif trial_location == 30 then return "01:26.00"
        elseif trial_location == 31 then return "02:10.00"
        end
    elseif trial_variant == 1 then
        if trial_location == 0 then return "01:50.00"
        elseif trial_location == 1 then return "01:30.00"
        elseif trial_location == 2 then return "01:20.00"
        elseif trial_location == 3 then return "01:27.00"
        elseif trial_location == 4 then return "01:10.00"
        elseif trial_location == 5 then return "01:32.00"
        elseif trial_location == 6 then return "02:05.00"
        elseif trial_location == 7 then return "01:12.00"
        elseif trial_location == 8 then return "01:53.00"
        elseif trial_location == 9 then return "01:20.00"
        elseif trial_location == 10 then return "01:23.00"
        elseif trial_location == 11 then return "01:18.00"
        elseif trial_location == 12 then return "01:27.00"
        elseif trial_location == 13 then return "01:22.00"
        end
    elseif trial_variant == 2 then
        if trial_location == 0 then return "02:20.00"
        elseif trial_location == 1 then return "02:00.00"
        elseif trial_location == 2 then return "01:55.00"
        elseif trial_location == 3 then return "01:35.00"
        elseif trial_location == 4 then return "02:10.00"
        elseif trial_location == 5 then return "01:40.00"
        elseif trial_location == 6 then return "02:00.00"
        elseif trial_location == 7 then return "01:50.00"
        elseif trial_location == 8 then return "01:35.00"
        elseif trial_location == 9 then return "01:20.00"
        elseif trial_location == 10 then return "01:50.00"
        elseif trial_location == 11 then return "01:35.00"
        elseif trial_location == 12 then return "02:10.00"
        elseif trial_location == 13 then return "01:50.00"
        end
    end
    return "unavailable"
end

local function draw_text(location, text)
    local _, screen_x, screen_y = GRAPHICS.GET_SCREEN_COORD_FROM_WORLD_COORD(location.x, location.y, location.z, screen_x, screen_y)
    
    HUD.BEGIN_TEXT_COMMAND_DISPLAY_TEXT("STRING")
    HUD.ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text)
    HUD.SET_TEXT_RENDER_ID(1)
    HUD.SET_TEXT_OUTLINE()
    HUD.SET_TEXT_CENTRE(true)
    HUD.SET_TEXT_DROP_SHADOW()
    HUD.SET_TEXT_SCALE(0, 0.3)
    HUD.SET_TEXT_FONT(4)
    HUD.SET_TEXT_COLOUR(255, 255, 255, 240)
    HUD.END_TEXT_COMMAND_DISPLAY_TEXT(screen_x, screen_y, 0)
end

local function draw_esp()
    if esp_gs_cache then
        if not dead_drop_collected then
            local drop_coords = dead_drop_coords(dead_drop_area, dead_drop_loc)
            draw_text(drop_coords, "G's Cache")
        end
    end
    
    if esp_street_dealers then
        local dealer_coords = street_dealer_coords(street_dealer_loc[selected_dealer + 1])
        draw_text(dealer_coords, "Street Dealer " .. selected_dealer + 1)
    end
    
    if esp_shipwreck then
        if not shipwrecked_collected then
            local shipwreck_coords = shipwrecked_coords(shipwrecked_loc)
            draw_text(shipwreck_coords, "Shipwreck")
        end
    end
    
    if esp_hidden_cache then
        if not hidden_cache_collected[selected_cache + 1] then
            local cache_coords = hidden_cache_coords(hidden_cache_loc[selected_cache + 1])
            draw_text(cache_coords, "Hidden Cache " .. selected_cache + 1)
        end
    end
    
    if esp_treasure_chest then
        if not treasure_chest_collected[selected_treasure + 1] then
            local chest_coords = treasure_chest_coords(treasure_chest_loc[selected_treasure + 1])
            draw_text(chest_coords, "Treasure Chest " .. selected_treasure + 1)
        end
    end
    
    if esp_buried_stash then
        if not buried_stash_collected[selected_stash + 1] then
            local stash_coords = buried_stash_coords(buried_stash_loc[selected_stash + 1])
            draw_text(stash_coords, "Buried Stash " .. selected_stash + 1)
        end
    end
    
    if esp_stash_house then
        if not stash_house_raided then
            if HUD.DOES_BLIP_EXIST(HUD.GET_FIRST_BLIP_INFO_ID(845)) then
                local house_coords = HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(845))
                draw_text(house_coords, "Stash House")
            end
        end
    end
    
    if esp_exotic_vehicle then
        if vehicle_bitset ~= 1023 then
            if vehicle_location ~= -1 then
                local vehicle_coords = exotic_export_coords(vehicle_location, is_second_part(globals.get_uint(global_two + vehicle_order)))
                draw_text(vehicle_coords, "Exotic Exports Vehicle")
            end
        end
    end
    
    if esp_ls_tag then
        if not ls_tag_sprayed[selected_tag + 1] then
            local tag_coords = buried_stash_coords(ls_tag_loc[selected_tag + 1])
            draw_text(tag_coords, "LS Tag " .. selected_tag + 1)
        end
    end 
    
    if esp_madrazo_hit then
        if not hit_completed then
            local hit_coords = madrazo_hit_coords(hit_loc)
            draw_text(hit_coords, "Madrazo Hit")
        end
    end
end

script.register_looped("Daily Collectibles", function()
    daily_obj[1]                = globals.get_int(current_objectives_global + (1 + (0 * current_objectives_global_offset)) + 681 + 4244 + (1 + (0 * 3)))
    daily_obj[2]                = globals.get_int(current_objectives_global + (1 + (0 * current_objectives_global_offset)) + 681 + 4244 + (1 + (1 * 3)))
    daily_obj[3]                = globals.get_int(current_objectives_global + (1 + (0 * current_objectives_global_offset)) + 681 + 4244 + (1 + (2 * 3)))
    street_dealer_loc[1]        = globals.get_int(global_three + global_four_offset + 1 + (0 * 7))
    street_dealer_loc[2]        = globals.get_int(global_three + global_four_offset + 1 + (1 * 7))
    street_dealer_loc[3]        = globals.get_int(global_three + global_four_offset + 1 + (2 * 7))
    meth_unit[1]                = globals.get_int(global_three + global_four_offset + 1 + (0 * 7) + 3) -- MPX_STREET_DEALER_0_METH_PRICE
    meth_unit[2]                = globals.get_int(global_three + global_four_offset + 1 + (1 * 7) + 3) -- MPX_STREET_DEALER_1_METH_PRICE
    meth_unit[3]                = globals.get_int(global_three + global_four_offset + 1 + (2 * 7) + 3) -- MPX_STREET_DEALER_2_METH_PRICE
    weed_unit[1]                = globals.get_int(global_three + global_four_offset + 1 + (0 * 7) + 4) -- MPX_STREET_DEALER_0_WEED_PRICE
    weed_unit[2]                = globals.get_int(global_three + global_four_offset + 1 + (1 * 7) + 4) -- MPX_STREET_DEALER_1_WEED_PRICE
    weed_unit[3]                = globals.get_int(global_three + global_four_offset + 1 + (2 * 7) + 4) -- MPX_STREET_DEALER_2_WEED_PRICE
    cocaine_unit[1]             = globals.get_int(global_three + global_four_offset + 1 + (0 * 7) + 2) -- MPX_STREET_DEALER_0_COKE_PRICE
    cocaine_unit[2]             = globals.get_int(global_three + global_four_offset + 1 + (1 * 7) + 2) -- MPX_STREET_DEALER_1_COKE_PRICE
    cocaine_unit[3]             = globals.get_int(global_three + global_four_offset + 1 + (2 * 7) + 2) -- MPX_STREET_DEALER_2_COKE_PRICE
    acid_unit[1]                = globals.get_int(global_three + global_four_offset + 1 + (0 * 7) + 5) -- MPX_STREET_DEALER_0_ACID_PRICE
    acid_unit[2]                = globals.get_int(global_three + global_four_offset + 1 + (1 * 7) + 5) -- MPX_STREET_DEALER_1_ACID_PRICE
    acid_unit[3]                = globals.get_int(global_three + global_four_offset + 1 + (2 * 7) + 5) -- MPX_STREET_DEALER_2_ACID_PRICE
    hit_loc                     = globals.get_int(global_three + 6838)
    vehicle_location            = globals.get_int(global_four + 302 + 1)
    vehicle_index               = globals.get_int(global_four + 302)
    vehicle_order               = (globals.get_int(global_one + vehicle_index + 1) + 1)
    active_vehicle              = globals.get_uint(global_three + global_four_offset + 3)
    exotic_order_cooldown       = globals.get_int(global_five + global_five_offset)
    time_trial_loc[2]           = locals.get_int("freemode", freemode_local_one)
    time_trial_loc[3]           = locals.get_int("freemode", freemode_local_two + 3)
    shipwrecked_loc             = stats.get_int("MPX_DAILYCOLLECT_SHIPWRECKED0")
    hidden_cache_loc[1]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH0")
    hidden_cache_loc[2]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH1")
    hidden_cache_loc[3]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH2")
    hidden_cache_loc[4]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH3")
    hidden_cache_loc[5]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH4")
    hidden_cache_loc[6]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH5")
    hidden_cache_loc[7]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH6")
    hidden_cache_loc[8]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH7")
    hidden_cache_loc[9]         = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH8")
    hidden_cache_loc[10]        = stats.get_int("MPX_DAILYCOLLECTABLES_HIDECACH9")
    junk_skydive_loc[1]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES0")
    junk_skydive_loc[2]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES1")
    junk_skydive_loc[3]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES2")
    junk_skydive_loc[4]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES3")
    junk_skydive_loc[5]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES4")
    junk_skydive_loc[6]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES5")
    junk_skydive_loc[7]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES6")
    junk_skydive_loc[8]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES7")
    junk_skydive_loc[9]         = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES8")
    junk_skydive_loc[10]        = stats.get_int("MPX_DAILYCOLLECT_SKYDIVES9")
    treasure_chest_loc[1]       = stats.get_int("MPX_DAILYCOLLECTABLES_TREASURE0")
    treasure_chest_loc[2]       = stats.get_int("MPX_DAILYCOLLECTABLES_TREASURE1")
    buried_stash_loc[1]         = stats.get_int("MPX_DAILYCOLLECT_BURIEDSTASH0")
    buried_stash_loc[2]         = stats.get_int("MPX_DAILYCOLLECT_BURIEDSTASH1")
    vehicle_bitset              = stats.get_int("MPX_CBV_DELIVERED_BS")
    dead_drop_area              = stats.get_packed_stat_int(41214)
    dead_drop_loc               = stats.get_packed_stat_int(41213)
    stash_house_loc             = stats.get_packed_stat_int(36623)
    ls_tag_loc[1]               = stats.get_packed_stat_int(51546)
    ls_tag_loc[2]               = stats.get_packed_stat_int(51547)
    ls_tag_loc[3]               = stats.get_packed_stat_int(51548)
    ls_tag_loc[4]               = stats.get_packed_stat_int(51549)
    ls_tag_loc[5]               = stats.get_packed_stat_int(51550)
    dead_drop_collected         = stats.get_packed_stat_bool(36628)
    stash_house_raided          = stats.get_packed_stat_bool(36657)
    shipwrecked_collected       = stats.get_packed_stat_bool(31734)
    hidden_cache_collected[1]   = stats.get_packed_stat_bool(30297)
    hidden_cache_collected[2]   = stats.get_packed_stat_bool(30298)
    hidden_cache_collected[3]   = stats.get_packed_stat_bool(30299)
    hidden_cache_collected[4]   = stats.get_packed_stat_bool(30300)
    hidden_cache_collected[5]   = stats.get_packed_stat_bool(30301)
    hidden_cache_collected[6]   = stats.get_packed_stat_bool(30302)
    hidden_cache_collected[7]   = stats.get_packed_stat_bool(30303)
    hidden_cache_collected[8]   = stats.get_packed_stat_bool(30304)
    hidden_cache_collected[9]   = stats.get_packed_stat_bool(30305)
    hidden_cache_collected[10]  = stats.get_packed_stat_bool(30306)
    treasure_chest_collected[1] = stats.get_packed_stat_bool(30307)
    treasure_chest_collected[2] = stats.get_packed_stat_bool(30308)
    buried_stash_collected[1]   = stats.get_packed_stat_bool(25522)
    buried_stash_collected[2]   = stats.get_packed_stat_bool(25523)
    ls_tag_sprayed[1]           = stats.get_packed_stat_bool(42252)
    ls_tag_sprayed[2]           = stats.get_packed_stat_bool(42253)
    ls_tag_sprayed[3]           = stats.get_packed_stat_bool(42254)
    ls_tag_sprayed[4]           = stats.get_packed_stat_bool(42255)
    ls_tag_sprayed[5]           = stats.get_packed_stat_bool(42256)
    hit_completed               = stats.get_packed_stat_bool(42269)
    weekly_obj_id               = tunables.get_int("MP_WEEKLY_OBJECTIVE_ID_OVERRIDE")
    weekly_obj_override         = tunables.get_int("MP_WEEKLY_OBJECTIVE_COUNT_OVERRIDE")
    time_trial_loc[1]           = tunables.get_int("TIMETRIALVARIATION")
    max_cocaine                 = tunables.get_int(1238316723)
    max_meth                    = tunables.get_int(658190943)
    max_weed                    = tunables.get_int(803541362)
    max_acid                    = tunables.get_int(-1171794142)
    safe_code                   = get_safe_code()
    exotic_reward_ready         = MISC.ABSI(NETWORK.GET_TIME_DIFFERENCE(NETWORK.GET_NETWORK_TIME(), exotic_order_cooldown)) >= 30000
    total_products              = (max_cocaine * cocaine_unit[selected_dealer + 1] + max_meth * meth_unit[selected_dealer + 1] + max_weed * weed_unit[selected_dealer + 1] + max_acid * acid_unit[selected_dealer + 1])
    all_products                = (max_cocaine * cocaine_unit[1] + max_meth * meth_unit[1] + max_weed * weed_unit[1] + max_acid * acid_unit[1] + max_cocaine * cocaine_unit[2] + max_meth * meth_unit[2] + max_weed * weed_unit[2] + max_acid * acid_unit[2] + max_cocaine * cocaine_unit[3] + max_meth * meth_unit[3] + max_weed * weed_unit[3] + max_acid * acid_unit[3])
    -- TO-DO: Remove these when LS Tags & Madrazo Hits are officially released
    tunables.set_bool(-2022924242, true)
    tunables.set_bool(-676725789, true)    
    draw_esp()
end)

daily_collectibles_tab:add_imgui(function()
    local hours, minutes, seconds    = get_daily_reset_time(5)
    local hours2, minutes2, seconds2 = get_daily_reset_time(6)
    
    ImGui.Text(string.format("Daily Reset Time (6 AM UTC): %02d:%02d:%02d", hours, minutes, seconds))
    ImGui.Text("- Daily Challenges")
    ImGui.Text("- Hidden Caches")
    ImGui.Text("- Treasure Chests")
    ImGui.Text("- Shipwreck")
    ImGui.Text("- Buried Stashes")
    ImGui.Text("- Junk Energy Skydives")
    
    ImGui.Separator()
    
    ImGui.Text(string.format("Daily Reset Time (7 AM UTC): %02d:%02d:%02d", hours2, minutes2, seconds2))
    ImGui.Text("- Weekly Challenge")
    ImGui.Text("- Exotic Exports")
    ImGui.Text("- Stash House")
    ImGui.Text("- Street Dealers")
    ImGui.Text("- RC Bandito Time Trial")
    ImGui.Text("- Junk Energy Bike Time Trial")
    ImGui.Text("- G's Cache")
end)

challenges_tab:add_imgui(function()
    if ImGui.TreeNode("Daily Challenges") then
        ImGui.Text(daily_challenges[daily_obj[1] + 1])
        ImGui.Text(daily_challenges[daily_obj[2] + 1])
        ImGui.Text(daily_challenges[daily_obj[3] + 1])
        ImGui.TreePop()
    end
    
    if ImGui.TreeNode("Weekly Challenge") then
        ImGui.Text(weekly_challenges[weekly_obj_id + 1])
        ImGui.Text("Override: " .. weekly_obj_override)
        ImGui.TreePop()
    end
    
    if ImGui.Button("Complete all Challenges") then
        for i = 0, 2 do --Unlock all daily rewards.
            local objective = globals.get_int(current_objectives_global + (1 + (0 * current_objectives_global_offset)) + 681 + 4244 + (1 + (i * 3)))
            globals.set_int(objectives_state_global + 1 + (1 + (i * 1)), objective)
        end
        globals.set_int(objectives_state_global, 1)
        globals.set_int(weekly_objectives_global + (1 + (0 * 6)) + 1, globals.get_int(weekly_objectives_global + (1 + (0 * 6)) + 2)) --Unlock Weekly Objective
    end
end)

dead_drop_tab:add_imgui(function()
    ImGui.Text("Status: " .. (dead_drop_collected and "collected" or "ready"))
    
    if ImGui.Button("Teleport") then
        if not dead_drop_collected then
            teleport(dead_drop_coords(dead_drop_area, dead_drop_loc))
        else
            gui.show_message("Daily Collectibles", "G's Cache has already been collected.")
        end
    end
    
    ImGui.SameLine()
    esp_gs_cache = ImGui.Checkbox("Draw ESP", esp_gs_cache)
end)

stash_house_tab:add_imgui(function()
    if not stash_house_raided then
        ImGui.Text("Safe Code: " .. safe_code)
    end
    ImGui.Text("Status: " .. (stash_house_raided and "raided" or "ready"))
    
    if ImGui.Button("Teleport") then
        if not stash_house_raided then
            script.run_in_fiber(function (script)
                if HUD.DOES_BLIP_EXIST(HUD.GET_FIRST_BLIP_INFO_ID(845)) then
                    teleport(HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(845)))
                end
            end)
        else
            gui.show_message("Daily Collectibles", "Stash House has already been raided.")
        end
    end
    
    ImGui.SameLine()
    esp_stash_house = ImGui.Checkbox("Draw ESP", esp_stash_house)
    
    if ImGui.Button("Enter Safe Combination") then
        for i = 0, 2, 1 do
            local safe_combination = locals.get_int("fm_content_stash_house", stash_house_local_one + 22 + (1 + (i * 2)) + 1)
            locals.set_float("fm_content_stash_house", stash_house_local_one + 22 + (1 + (i * 2)), safe_combination)
        end
    end
end)

street_dealer_tab:add_imgui(function()
    selected_dealer = ImGui.Combo("Select Dealer", selected_dealer, { "1", "2", "3" }, 3)
    
    if ImGui.Button("Teleport") then
        teleport(street_dealer_coords(street_dealer_loc[selected_dealer + 1]))
    end
    
    ImGui.SameLine()
    
    esp_street_dealers = ImGui.Checkbox("Draw ESP", esp_street_dealers)
    
    ImGui.Text("Weed: $" .. format_int(max_weed * weed_unit[selected_dealer + 1]) .. " (" .. format_int(max_weed) .. " unit * " .. format_int(weed_unit[selected_dealer + 1]) .. ")")
    ImGui.Text("Meth: $" .. format_int(max_meth * meth_unit[selected_dealer + 1]) .. " (" .. format_int(max_meth) .. " unit * " .. format_int(meth_unit[selected_dealer + 1]) .. ")")
    ImGui.Text("Cocaine: $" .. format_int(max_cocaine * cocaine_unit[selected_dealer + 1]) .. " (" .. format_int(max_cocaine) .. " unit * " .. format_int(cocaine_unit[selected_dealer + 1]) .. ")")
    ImGui.Text("Acid: $" .. format_int(max_acid * acid_unit[selected_dealer + 1]) .. " (" .. format_int(max_acid) .. " unit * " .. format_int(acid_unit[selected_dealer + 1]) .. ")")
    ImGui.Text("Total: $" .. format_int(total_products))
    
    ImGui.Separator()
    
    ImGui.Text("All: $" .. format_int(all_products))
end)

shipwrecked_tab:add_imgui(function()
    ImGui.Text("Status: " .. (shipwrecked_collected and "collected" or "ready"))
    
    if ImGui.Button("Teleport") then
        if not shipwrecked_collected then
            teleport(shipwrecked_coords(shipwrecked_loc))
        else
            gui.show_message("Daily Collectibles", "Shipwreck has already been collected.")
        end
    end

    ImGui.SameLine()
    esp_shipwreck = ImGui.Checkbox("Draw ESP", esp_shipwreck)
end)

hidden_cache_tab:add_imgui(function()
    ImGui.Text("Status: " .. (hidden_cache_collected[selected_cache + 1] and "collected" or "ready"))
    
    selected_cache = ImGui.Combo("Select Cache", selected_cache, { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }, 10)
    
    if ImGui.Button("Teleport") then
        if not hidden_cache_collected[selected_cache + 1] then
            teleport(hidden_cache_coords(hidden_cache_loc[selected_cache + 1]))
        else
            gui.show_message("Daily Collectibles", "Hidden Cache has already been collected.")
        end
    end

    ImGui.SameLine()
    esp_hidden_cache = ImGui.Checkbox("Draw ESP", esp_hidden_cache)
end)

junk_skydive_tab:add_imgui(function()
    ImGui.Text("Challenge Time: " .. get_challenge_time(junk_skydive_loc[selected_skydive + 1]))
    
    selected_skydive = ImGui.Combo("Select Skydive", selected_skydive, { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }, 10)
    
    if ImGui.Button("Teleport") then
        teleport(junk_skydive_coords(junk_skydive_loc[selected_skydive + 1]))
    end
end)

treasure_chest_tab:add_imgui(function()
    ImGui.Text("Status: " .. (treasure_chest_collected[selected_treasure + 1] and "collected" or "ready"))
    
    selected_treasure = ImGui.Combo("Select Treasure", selected_treasure, { "1", "2" }, 2)
    
    if ImGui.Button("Teleport") then
        if not treasure_chest_collected[selected_treasure + 1] then
            teleport(treasure_chest_coords(treasure_chest_loc[selected_treasure + 1]))
        else
            gui.show_message("Daily Collectibles", "Treasure Chest has already been collected.")
        end
    end

    ImGui.SameLine()
    esp_treasure_chest = ImGui.Checkbox("Draw ESP", esp_treasure_chest)
end)

buried_stash_tab:add_imgui(function()
    ImGui.Text("Status: " .. (buried_stash_collected[selected_stash + 1] and "collected" or "ready"))
    
    selected_stash = ImGui.Combo("Select Stash", selected_stash, { "1", "2" }, 2)
    
    if ImGui.Button("Teleport") then
        if not buried_stash_collected[selected_stash + 1] then
            teleport(buried_stash_coords(buried_stash_loc[selected_stash + 1]))
        else
            gui.show_message("Daily Collectibles", "Buried Stash has already been collected.")
        end
    end

    ImGui.SameLine()
    esp_buried_stash = ImGui.Checkbox("Draw ESP", esp_buried_stash)
end)

exotic_exports_tab:add_imgui(function()
    ImGui.Text("Reward Ready: " .. (exotic_reward_ready and "Yes" or "No"))
        
    if ImGui.Button("Teleport to Vehicle") then
        if vehicle_bitset ~= 1023 then
            if vehicle_location ~= -1 then
                teleport(exotic_export_coords(vehicle_location, is_second_part(globals.get_uint(global_two + vehicle_order))))
            else
                gui.show_message("Daily Collectibles", "Please wait until the next vehicle is spawned (90 seconds).")
            end
        else
            gui.show_message("Daily Collectibles", "You have already delivered all the vehicles.")
        end
    end

    ImGui.SameLine()
    esp_exotic_vehicle = ImGui.Checkbox("Draw ESP", esp_exotic_vehicle)
    
    if ImGui.Button("Deliver Vehicle") then
        if vehicle_bitset ~= 1023 then
            if not exotic_reward_ready then
                gui.show_message("Daily Collectibles", "You have just delivered a vehicle. Wait a moment.")
            else
                script.run_in_fiber(function()
                    if HUD.DOES_BLIP_EXIST(HUD.GET_FIRST_BLIP_INFO_ID(780)) then
                        teleport(HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(780)))
                    else
                        gui.show_message("Daily Collectibles", "Please get in an Exotic Exports Vehicle.")
                    end
                end)
            end
        else
            gui.show_message("Daily Collectibles", "You have already delivered all the vehicles.")
        end
    end
    
    if ImGui.Button("Spawn Next Vehicle") then
        if vehicle_bitset ~= 1023 then
            for i = 1, 10 do
                if not has_bit_set(vehicle_bitset, globals.get_int(global_one + i)) then
                    spawn_vehicle(get_vehicle_name(i, true))
                    return
                end
            end
        else
            gui.show_message("Daily Collectibles", "You have already delivered all the vehicles.")
        end
    end
    
    ImGui.Text("Today's List:")
    
    for i = 1, 10 do
        if active_vehicle == get_vehicle_name(i, true) then
            ImGui.Text(i .. " -")
            ImGui.SameLine()
            ImGui.TextColored(0.5, 0.5, 1, 1, get_vehicle_name(i, false) .. " (Active)")
        else
            if has_bit_set(vehicle_bitset, globals.get_int(global_one + i)) then
                ImGui.Text(i .. " -")
                ImGui.SameLine()
                ImGui.TextColored(0, 1, 0, 1, get_vehicle_name(i, false) .. " (Delivered)")
            else
                ImGui.Text(i .. " - " .. get_vehicle_name(i, false))
            end
        end
    end
end)

time_trials_tab:add_imgui(function()
    ImGui.Text("Par Time: " .. get_par_time(selected_trial, time_trial_loc[selected_trial + 1]))
    
    selected_trial = ImGui.Combo("Select Variant", selected_trial, { "Standard Time Trial", "RC Bandito Time Trial", "Junk Energy Bike Time Trial" }, 3)
    
    if ImGui.Button("Teleport##trials") then
        if selected_trial == 0 then teleport(standard_trial_coords(time_trial_loc[1]))
        elseif selected_trial == 1 then teleport(rc_trial_coords(time_trial_loc[2]))
        elseif selected_trial == 2 then teleport(bike_trial_coords(time_trial_loc[3]))
        end
    end
end)

ls_tags_tab:add_imgui(function()
    ImGui.Text("Status: " .. (ls_tag_sprayed[selected_tag + 1] and "sprayed" or "ready"))
    
    selected_tag = ImGui.Combo("Select Tag", selected_tag, { "1", "2", "3", "4", "5" }, 5)
    
    if ImGui.Button("Teleport") then
        if not ls_tag_sprayed[selected_tag + 1] then
            teleport(ls_tag_coords(ls_tag_loc[selected_tag + 1]))
        else
            gui.show_message("Daily Collectibles", "LS Tag has already been sprayed.")
        end
    end
    
    ImGui.SameLine()
    esp_ls_tag = ImGui.Checkbox("Draw ESP", esp_ls_tag) 
end)

madrazo_hits_tab:add_imgui(function()
    ImGui.Text("Status: " .. (hit_completed and "completed" or "ready"))
    
    if ImGui.Button("Teleport") then
        if not hit_completed then
            teleport(madrazo_hit_coords(hit_loc))
        else
            gui.show_message("Daily Collectibles", "Madrazo Hit has already been completed.")
        end
    end

    ImGui.SameLine()
    esp_madrazo_hit = ImGui.Checkbox("Draw ESP", esp_madrazo_hit)   
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WareHouseDataEditorMenu = CeoManagerMenu:add_tab("WareHouse Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

WareHouseDataEditorMenu:add_button("Reset Crate Sell Stats-0/0 Sales", function()
	STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_BUY_COMPLETE"), 0, true)
	STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_BUY_UNDERTAKEN"), 0, true)
	STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_SELL_COMPLETE"), 0, true)
	STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_SELL_UNDERTAKEN"), 0, true)
	STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_CONTRA_EARNINGS"), 0, true)
	globals.set_int(1575035, 11) ----PlayerSessionBlank--------
	globals.set_int(1574589, 1) ----PlayerSessionNew----------
	sleep(2)
	globals.set_int(1574589, 0) ----PlayerSessionNew------
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HeistsDataEditorMenu = L7NEG:add_tab("Heists Data Editor Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ApartmentDataEditorMenu = HeistsDataEditorMenu:add_tab("Apartment Data Editor Menu")

ApartmentDataEditorMenu:add_button("Skip Current Apartment Heist Preps", function()
	STATS.STAT_SET_INT(joaat(MPX .. "HEIST_PLANNING_STAGE"), -1, true)
end)

ApartmentDataEditorMenu:add_sameline()

ApartmentDataEditorMenu:add_button("Reset Current Apartment Heist Preps", function()
	STATS.STAT_SET_INT(joaat(MPX .. "HEIST_PLANNING_STAGE"), 0, true)
end)

ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("For Fleeca:")
ApartmentDataEditorMenu:add_text("Pay for the preparation, start the first mission and as soon as you are sent to scout\nchange the session, come back to planning room, press \"Complete Preps\" near white board and press \"E\"")
ApartmentDataEditorMenu:add_text("For Other Heist:")
ApartmentDataEditorMenu:add_text("Start the mission and leave after the 1st cutscene ends, press \"Complete Preps\" near white board and press \"E\"")


ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Cuts to All")
ApartmentDataEditorMenu:add_text("Fleeca Job Heist:")
ApartmentDataEditorMenu:add_button("100",
function ()
	globals.set_int(ACg1, -200)
	globals.set_int(ACg2, 100)

end
)
ApartmentDataEditorMenu:add_text("")
ApartmentDataEditorMenu:add_text("Other Heists:")
ApartmentDataEditorMenu:add_button("100",
function ()
	globals.set_int(ACg1, -300)
	globals.set_int(ACg2, 100)
	globals.set_int(ACg3, 100)
	globals.set_int(ACg4, 100)
end
)

local apartCut1 = 0
local apartCut2 = 0
local apartCut3 = 0
local apartCut4 = 0
ApartmentDataEditorMenu:add_imgui(
	function ()
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
	end
)
ApartmentDataEditorMenu:add_separator()
ApartmentDataEditorMenu:add_text("Extras")
ApartmentDataEditorMenu:add_button("Bypass Fleeca Hack",
function ()
	locals.set_int(FMC, AFHl, 7)
end
)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Bypass Fleeca Drill",
function ()
	locals.set_float(FMC, AFDl, 100)
end
)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Unlock All Jobs",
function ()
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_0", globals.get_int(AUAJg1))
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_0_L", 5)
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_1", globals.get_int(AUAJg2))
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_1_L", 5)
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_2", globals.get_int(AUAJg3))
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_2_L", 5)
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_3", globals.get_int(AUAJg4))
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_3_L", 5)
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_4", globals.get_int(AUAJg5))
	stats.set_int(MPX .. "HEIST_SAVED_STRAND_4_L", 5)
end
)
ApartmentDataEditorMenu:add_sameline()
ApartmentDataEditorMenu:add_button("Instant Finish",
function()
	locals.set_int(FMC, AIFl3, 12)
	locals.set_int(FMC, AIFl4, 99999)
	locals.set_int(FMC, AIFl5, 99999)
end
)
ApartmentDataEditorMenu:add_text("Note: After Clicking Unlock All jobs, restart the game")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Casino Heist")

CasinoHeistEditorMenu:add_button("One Click Setup Casino Silent&Sneaky", function()
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_APPROACH"), 1, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3_LAST_APPROACH"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_TARGET"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_BITSET1"), 127, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_DISRUPTSHIP"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_KEYLEVELS"), 2, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWWEAP"), 4, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWDRIVER"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWHACKER"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_VEHS"), 2, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_WEAPS"), 1, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_BITSET0"), 262399, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_MASKS"), 2, true)
end)

CasinoHeistEditorMenu:add_button("One Click Setup Casino The Big Con. Mode", function()
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_APPROACH"), 2, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3_LAST_APPROACH"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_TARGET"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_BITSET1"), 799, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_DISRUPTSHIP"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_KEYLEVELS"), 2, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWWEAP"), 4, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWDRIVER"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWHACKER"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_VEHS"), 2, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_WEAPS"), 0, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_BITSET0"), 913623, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_MASKS"), 2, true)
end)

CasinoHeistEditorMenu:add_button("One Click Setup Casino Agrresive Mode", function()
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_APPROACH"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3_LAST_APPROACH"), 1, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_TARGET"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_BITSET1"), 799, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_DISRUPTSHIP"), 3, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_KEYLEVELS"), 2, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWWEAP"), 4, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWDRIVER"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_CREWHACKER"), 5, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_VEHS"), 2, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_WEAPS"), 1, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_BITSET0"), 1835223, true)
	STATS.STAT_SET_INT(joaat(MPX .. "H3OPT_MASKS"), 2, true)
end)


CasinoHeistEditorMenu:add_text("Preps")
CasinoHeistEditorMenu:add_text("")
local function CasinoApproachSetter(last_approach, hard_approach, approach, selected_approach)
	stats.set_int(MPX .. "H3_LAST_APPROACH", last_approach)
	stats.set_int(MPX .. "H3_HARD_APPROACH", hard_approach)
	stats.set_int(MPX .. "H3_APPROACH", approach)
	stats.set_int(MPX .. "H3OPT_APPROACH", selected_approach)
end
local function CasinoCompletePreps()
	stats.set_int(MPX .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX .. "H3OPT_BITSET0", -1)
	stats.set_int(MPX .. "H3OPT_BITSET1", -1)
	stats.set_int(MPX .. "H3OPT_COMPLETEDPOSIX", -1)
end
CasinoHeistEditorMenu:add_text("Primary Target")
CasinoHeistEditorMenu:add_button("Diamond",
function ()
	stats.set_int(MPX .. "H3OPT_TARGET", 3)
end
)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Gold",
function ()
	stats.set_int(MPX .. "H3OPT_TARGET", 1)
end
)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Arts",
function ()
	stats.set_int(MPX .. "H3OPT_TARGET", 2)
end
)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Cash",
function ()
	stats.set_int(MPX .. "H3OPT_TARGET", 0)
end
)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Select Apprach")
CasinoHeistEditorMenu:add_button("Silent & Sneaky",
function ()
	CasinoApproachSetter(2, 1, 3, 1)
	STATS.STAT_SET_INT(MPX .. "H3OPT_BITSET1", 127)
	stats.set_int(MPX .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Big Con",
function ()
	CasinoApproachSetter(1, 2, 3, 2)
	STATS.STAT_SET_INT(MPX .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX .. "H3OPT_WEAPS", 0)
end)
CasinoHeistEditorMenu:add_sameline()
CasinoHeistEditorMenu:add_button("Aggressive",
function ()
	CasinoApproachSetter(2, 3, 1, 3)
	STATS.STAT_SET_INT(MPX .. "H3OPT_BITSET1", 799)
	stats.set_int(MPX .. "H3OPT_WEAPS", 0)
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
	"Chester McCoy/Carbine Rifle Mk II"
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
	"Chester McCoy/Bullpup Rifle Mk II"
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
	"Chester McCoy/Assault Rifle Mk II"
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
	"Chester McCoy/Everon"

}
local hackerLoad = {
	"Select", "Rickie Lukens","Christian Feltz", "Yohan Blair", "Avi Schwartzman",  "Page Harris"
}
local maskLoad = {
	"Select", "Geometic Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set", "Guerilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Full Mask Set", "Hockey Set"
}
CasinoHeistEditorMenu:add_imgui(
	function ()
		if stats.get_int(MPX .. "H3OPT_APPROACH") == 1 then
			ImGui.SetNextItemWidth(265)
			gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutSi, 10)
			
		elseif stats.get_int(MPX .. "H3OPT_APPROACH") == 2 then
			ImGui.SetNextItemWidth(265)
			gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutBC, 10)
		elseif stats.get_int(MPX .. "H3OPT_APPROACH") == 3 then
			ImGui.SetNextItemWidth(265)
			gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutAg, 10)
		end

		if ImGui.Button("Set Loadout") then
			ImGui.Text(gunman)
			if gunman <= 1 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 1)
				stats.set_int(MPX .. "H3OPT_WEAPS", gunman)
			elseif gunman <= 4 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 3)
				stats.set_int(MPX .. "H3OPT_WEAPS", gunman - 2)
			elseif gunman <= 6 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 5)
				stats.set_int(MPX .. "H3OPT_WEAPS", gunman - 4)
			elseif gunman <= 8 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 2)
				stats.set_int(MPX .. "H3OPT_WEAPS", gunman - 6)
			elseif gunman <= 10 then
				stats.set_int(MPX .. "H3OPT_CREWWEAP", 4)
				stats.set_int(MPX .. "H3OPT_WEAPS", gunman - 8)
			end
		end
		ImGui.Separator()
		ImGui.Text("Getaway Vehicles")
		ImGui.SetNextItemWidth(265)
		driver = ImGui.Combo("", driver, DriverLoad, 20)
		if ImGui.Button("Set Getaway Vehicle") then
			ImGui.Text(driver)
			if driver <= 3 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER",1)
				stats.set_int(MPX .. "H3OPT_VEHS", driver)
			elseif driver <= 7 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER",4)
				stats.set_int(MPX .. "H3OPT_VEHS", driver- 4)
			elseif driver <= 11 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER",2)
				stats.set_int(MPX .. "H3OPT_VEHS", driver - 8)
			elseif driver <= 15 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER",3)
				stats.set_int(MPX .. "H3OPT_VEHS", driver - 12)
			elseif driver <= 19 then
				stats.set_int(MPX .. "H3OPT_CREWDRIVER",5)
				stats.set_int(MPX .. "H3OPT_VEHS", driver - 16)
			end
		end
		ImGui.Separator()
		ImGui.Text("Hacker")
		ImGui.SetNextItemWidth(265)
		hacker = ImGui.Combo("Hacker", hacker, hackerLoad, 6)
		if ImGui.Button("Set Hacker") then
			ImGui.Text(hacker)
			stats.set_int(MPX .. "H3OPT_CREWHACKER", hacker)
		end
		ImGui.Separator()
		ImGui.Text("Mask")
		ImGui.SetNextItemWidth(265)
		ImGui.SetNextItemWidth(265)
		mask = ImGui.Combo("Masks", mask, maskLoad, 13)
		if ImGui.Button("Set Mask") then
			ImGui.Text(mask)
			stats.set_int(MPX .. "H3OPT_MASKS", mask)
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
	end
	
)
CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_button("Reload Planning Screen",
function ()
	locals.set_int("gb_casino_heist_planning", DCRBl, 2)
end
)

CasinoHeistEditorMenu:add_separator()
CasinoHeistEditorMenu:add_text("Instant Heist Passed")
CasinoHeistEditorMenu:add_button("Instant Finish $$",
function ()
    locals.set_int(FMC2020, 50150, 9)
    locals.set_int(FMC2020, 50150 + 1770 + 1, 50)
    gui.show_message("Instant Heist Passed", "Activated")
end)

local CasinoHeistExtra = CasinoHeistEditorMenu:add_tab("Extras")
CasinoHeistExtra:add_text("Make Lester, Driver, Hacker, and Gunman cut to 0%")
CasinoHeistExtra:add_button("Make Fees to 0",
function ()
	globals.set_int(DCCgun, 0)
	globals.set_int(DCCh, 0)
	globals.set_int(DCCl, 0)
	globals.set_int(DCCd, 0)
end
)
CasinoHeistExtra:add_text("Hacks")
CasinoHeistExtra:add_button("Bypass Casino Fingerprint Hack",
function ()
	if locals.get_int(FMC,DCFHl) == 4 then
		locals.set_int(FMC,DCFHl, 5)
	end
end
)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Keypad Hack",
function ()
	if locals.get_int(FMC,DCKHl) ~= 4 then
		locals.set_int(FMC,DCKHl, 5)
	end
end
)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Drill Vault Door",
function ()
	locals.set_int(FMC,DCDVDl1, locals.get_int(FMC,DCDVDl2))
end
)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Updated by DeadlineEm, I used your modest menu version for ideas for this.

-- Deleting enemies does not allow the keycards to drop, so teleport into the 
-- seondary buildings to grab the loot, you can open the door for others from
-- the inside
local CayoHeistEditorMenu = HeistsDataEditorMenu:add_tab("Cayo Perico Editor")


CayoHeistEditorMenu:add_text("Cuts to All")
CayoHeistEditorMenu:add_button("100",
function ()
	CutsPresetter(CPCg1, CPCg4, 100)
end
)
CayoHeistEditorMenu:add_text("")
CayoHeistEditorMenu:add_text("Custom Cut")
local cayocut1 = CayoHeistEditorMenu:add_input_int("Cut 1")
local cayocut2 = CayoHeistEditorMenu:add_input_int("Cut 2")
local cayocut3 = CayoHeistEditorMenu:add_input_int("Cut 3")
local cayocut4 = CayoHeistEditorMenu:add_input_int("Cut 4")
CayoHeistEditorMenu:add_button("Set",
function ()
	globals.set_int(CPCg1, cayocut1:get_value())
	globals.set_int(CPCg2, cayocut2:get_value())
	globals.set_int(CPCg3, cayocut3:get_value())
	globals.set_int(CPCg4, cayocut4:get_value())
end)
CayoHeistEditorMenu:add_separator()

CayoHeistEditorMenu:add_text("Non-Legit Presets")

CayoHeistEditorMenu:add_button("Panther/Gold (Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 1191817, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Panther Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)
CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Diamond/Gold (Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 3, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 1191817, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Diamond Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Bonds/Gold (Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 2, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 1191817, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Bonds Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Necklace/Gold (Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 1191817, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Necklace Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()
CayoHeistEditorMenu:add_button("Tequila/Gold (Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 1191817, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Tequila Hard Mode has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)
CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Legit Presets")

CayoHeistEditorMenu:add_button("Panther/Gold (L. Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 5, true) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
		-- Island Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		
		-- Compound Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true) -- 131055 // Hard Mode  -  130667 // Solo Normal??
		
		-- These are what is set when you find loot throughout the island/compound
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
		
		-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 45375, true)
		globals.set_int(PSV, 1900000) -- Panther Value -- 1900000 shows as 2,090,000 in-game on the board. 190,000 difference.
		
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Panther Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Diamond/Gold (L. Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 3, true) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
		-- Island Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		
		-- Compound Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true) -- 131055 // Hard Mode  -  130667 // Solo Normal??
		
		-- These are what is set when you find loot throughout the island/compound
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
		
		-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 45375, true)
		globals.set_int(PDIAMOND, 1300000) -- Diamond Value  -- 1300000 shows as 1,430,000 in-game. 130,000 difference.
		
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Diamond Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Bonds/Gold (L. Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 2, true) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
		-- Island Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		
		-- Compound Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true) -- 131055 // Hard Mode  -  130667 // Solo Normal??
		
		-- These are what is set when you find loot throughout the island/compound
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
		
		-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 45375, true)
		globals.set_int(BB, 770000) -- Bonds Value -- 770000 shows as 847,000 in-game.  77,000 difference.
		
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Bonds Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Necklace/Gold (L. Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 1, true) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
		-- Island Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		
		-- Compound Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true) -- 131055 // Hard Mode  -  130667 // Solo Normal??
		
		-- These are what is set when you find loot throughout the island/compound
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
		
		-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 45375, true)
		globals.set_int(RN, 700000) -- Necklace Value -- 700000 shows as 770,000 in-game. 70,000 difference.
		
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Necklace Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_sameline()

CayoHeistEditorMenu:add_button("Tequila/Gold (L. Hard)", function()
	PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
	if PlayerIndex == 0 then
		mpx = "MP0_"
	else
		mpx = "MP1_"
	end
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_GEN"), 131071, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ENTR"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_BS_ABIL"), 63, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEAPONS"), 5, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_WEP_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_ARM_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_HEL_DISRP"), 3, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TARGET"), 0, true) --Primary Target Values: 0. Tequila, 1. Necklace, 2. Bonds, 3. Diamond, 4. Medrazo Files, 5. Panther
		STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_TROJAN"), 2, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4CNF_APPROACH"), -1, true)
		-- Island Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I"), 0, true)
		
		-- Compound Loot // -1 shows all, 0 shows none
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C"), -1, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PROGRESS"), 131055, true) -- 131055 // Hard Mode  -  130667 // Solo Normal??
		
		-- These are what is set when you find loot throughout the island/compound
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_C_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_C_SCOPED"), -1, true)
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_SCOPED"), 0, true)
		
		-- Payout Values // Set to "Normal" values.  Each value is multiplied by 8, bc there are 8 locations for them.
		STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), 45375, true)
		globals.set_int(TEQUILA, 693000) -- Tequila Value -- 630000 shows as 693,000. 63,000 difference.
		
        STATS.STAT_SET_INT(joaat(mpx .. "H4_MISSIONS"), 65535, true)
        STATS.STAT_SET_INT(joaat(mpx .. "H4_PLAYTHROUGH_STATUS"), 32, true)
	
	gui.show_message("Cayo Heist", "Tequila Hard Mode (Legit) has been set up!")
	gui.show_message("Cayo Heist", "Reset the board to see the changes")
end)

CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("Press this after clicking one of the above presets")
CayoHeistEditorMenu:add_button("Reset Kosatka Board", function()
        locals.set_int(HIP, 1544, 2)
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
	joaat("prop_cctv_cam_01a"), joaat("prop_cctv_cam_01b"), joaat("prop_cctv_cam_02a"), joaat("prop_cctv_cam_03a"),
	joaat("prop_cctv_cam_04a"), joaat("prop_cctv_cam_04c"), joaat("prop_cctv_cam_05a"), joaat("prop_cctv_cam_06a"),
	joaat("prop_cctv_cam_07a"), joaat("prop_cs_cctv"), joaat("p_cctv_s"), joaat("hei_prop_bank_cctv_01"),
	joaat("hei_prop_bank_cctv_02"), joaat("ch_prop_ch_cctv_cam_02a"), joaat("xm_prop_x17_server_farm_cctv_01"),
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
	STATS.STAT_SET_INT(joaat("MP0_H4_TARGET_POSIX"), 1659643454, true)
	STATS.STAT_SET_INT(joaat("MP0_H4_COOLDOWN"), 0, true)
	STATS.STAT_SET_INT(joaat("MP0_H4_COOLDOWN_HARD"), 0, true)
	-- Multiplayer Skip
	STATS.STAT_SET_INT(joaat("MP0_H4_TARGET_POSIX"), 1659429119, true)
	STATS.STAT_SET_INT(joaat("MP0_H4_COOLDOWN"), 0, true)
	STATS.STAT_SET_INT(joaat("MP0_H4_COOLDOWN_HARD"), 0, true)
	-- Solo Skip (Second Character)
	STATS.STAT_SET_INT(joaat("MP1_H4_TARGET_POSIX"), 1659643454, true)
	STATS.STAT_SET_INT(joaat("MP1_H4_COOLDOWN"), 0, true)
	STATS.STAT_SET_INT(joaat("MP1_H4_COOLDOWN_HARD"), 0, true)
	-- Multiplayer Skip (Second Character)
	STATS.STAT_SET_INT(joaat("MP1_H4_TARGET_POSIX"), 1659429119, true)
	STATS.STAT_SET_INT(joaat("MP1_H4_COOLDOWN"), 0, true)
	STATS.STAT_SET_INT(joaat("MP1_H4_COOLDOWN_HARD"), 0, true)
	
	gui.show_message("Cayo Heist", "Skipped Cayo Perico Cooldown for all characters")
	gui.show_message("Cayo Heist", "Go to story mode and come back to apply the reset")
end)
CayoHeistEditorMenu:add_separator()
CayoHeistEditorMenu:add_text("How to Set Up or Bypass Cooldown:")
CayoHeistEditorMenu:add_text("Make sure you have completed the heist and you are standing in front of the planning screen")
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
        gui.show_message('Bag Size Modified!')
    end
end)

cayoSizeEditor:add_text("Custom Bag Size Editor")
custombagSizeVal = 1800
cayoSizeEditor:add_imgui(function()
custombagSizeVal, used = ImGui.SliderInt("Custom Bag Size", custombagSizeVal, 1800, 2147483646)
    if used then
        globals.set_int(BAS1, custombagSizeVal)
        gui.show_message('Custom Bag Size Modified!')
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
		gui.show_message('Panther Value Modified!', out)
    end
end)

diamondSizeVal = 1300000
cayoSizeEditor:add_imgui(function()
diamondSizeVal, used = ImGui.SliderInt("Diamond Value", diamondSizeVal, 1300000, 2600000) -- Double the original price
    out = "Reset the board to see changes"
    
    if used then
        globals.set_int(PDIAMOND, diamondSizeVal)
		gui.show_message('Diamond Value Modified!', out)
    end
end)

bondSizeVal = 770000
cayoSizeEditor:add_imgui(function()
bondSizeVal, used = ImGui.SliderInt("Bonds Value", bondSizeVal, 770000, 1540000) -- Double the original price
    out = "Reset the board to see changes"
    
    if used then
        globals.set_int(BB, bondSizeVal)
		gui.show_message('Bonds Value Modified!', out)
    end
end)

necklaceSizeVal = 700000
cayoSizeEditor:add_imgui(function()
necklaceSizeVal, used = ImGui.SliderInt("Necklace Value", necklaceSizeVal, 700000, 1400000) -- Double the original price
    out = "Reset the board to see changes"
    
    if used then
        globals.set_int(RN, necklaceSizeVal)
		gui.show_message('Necklace Value Modified!', out)
    end
end)

tequilaSizeVal = 693000
cayoSizeEditor:add_imgui(function()
tequilaSizeVal, used = ImGui.SliderInt("Tequila Value", tequilaSizeVal, 693000, 1400000) -- Double the original price
    out = "Reset the board to see changes"
    
    if used then
        globals.set_int(TEQUILA, tequilaSizeVal)
		gui.show_message('Tequila Value Modified!', out)
    end
end)

cayoSizeEditor:add_separator()
cayoSizeEditor:add_text("Secondary Target Editors")

goldSizeVal = 45375
cayoSizeEditor:add_imgui(function()
goldSizeVal, used = ImGui.SliderInt("Gold Value", goldSizeVal, 45375, 181500) -- Quadruple the original price
    out = "Reset the board to see changes"
    
    if used then
		PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
		if PlayerIndex == 0 then
			mpx = "MP0_"
		else
			mpx = "MP1_"
		end
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_GOLD_V"), goldSizeVal, true)
		gui.show_message('Gold Value Modified!', out)
    end
end)

cokeSizeVal = 25312
cayoSizeEditor:add_imgui(function()
cokeSizeVal, used = ImGui.SliderInt("Coke Value", cokeSizeVal, 25312, 101248) -- Quadruple the original price
    out = "Reset the board to see changes"
    
    if used then
		PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
		if PlayerIndex == 0 then
			mpx = "MP0_"
		else
			mpx = "MP1_"
		end
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_COKE_V"), cokeSizeVal, true)
		gui.show_message('Coke Value Modified!', out)
    end
end)

paintSizeVal = 22500
cayoSizeEditor:add_imgui(function()
paintSizeVal, used = ImGui.SliderInt("Paintings Value", paintSizeVal, 22500, 90000) -- Quadruple the original price
    out = "Reset the board to see changes"
    
    if used then
		PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
		if PlayerIndex == 0 then
			mpx = "MP0_"
		else
			mpx = "MP1_"
		end
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_PAINT_V"), paintSizeVal, true)
		gui.show_message('Paintings Value Modified!', out)
    end
end)

weedSizeVal = 16875
cayoSizeEditor:add_imgui(function()
weedSizeVal, used = ImGui.SliderInt("Weed Value", weedSizeVal, 16875, 67500) -- Quadruple the original price
    out = "Reset the board to see changes"
    
    if used then
		PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
		if PlayerIndex == 0 then
			mpx = "MP0_"
		else
			mpx = "MP1_"
		end
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_V"), weedSizeVal, true)
		gui.show_message('Weed Value Modified!', out)
    end
end)

cashSizeVal = 10406
cayoSizeEditor:add_imgui(function()
cashSizeVal, used = ImGui.SliderInt("Cash Value", cashSizeVal, 10406, 41624) -- Quadruple the original price
    out = "Reset the board to see changes"
    
    if used then
		PlayerIndex = stats.get_int("MPPLY_LAST_MP_CHAR")
		if PlayerIndex == 0 then
			mpx = "MP0_"
		else
			mpx = "MP1_"
		end
        STATS.STAT_SET_INT(joaat(mpx .. "H4LOOT_WEED_V"), cashSizeVal, true)
		gui.show_message('Cash Value Modified!', out)
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
	STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FLOW_MISSION_PROG"), 7, true)
	STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FM_MISSION_PROG"), 7, true)
end)

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 2: The Bodgan Problem", function()
	STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FLOW_MISSION_PROG"), 240, true)
	STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FM_MISSION_PROG"), 248, true)
end)

DoomsdayHeistEditorMenu:add_button("One Click Setup Act 3: Doomsday Scenario", function()
	STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FLOW_MISSION_PROG"), 15872, true)
	STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FM_MISSION_PROG"), 16128, true)
end)

DoomsdayHeistEditorMenu:add_text("Set Doomsday Heist Cuts")
DoomsdayHeistEditorMenu:add_text("Preset Cut")
DoomsdayHeistEditorMenu:add_button("100",
function ()
	CutsPresetter(DCg1, DCg4, 100)
end
)
DoomsdayHeistEditorMenu:add_text("Custom Cuts")
local dmsdyCut1 = DoomsdayHeistEditorMenu:add_input_int("Cut 1")
local dmsdyCut2 = DoomsdayHeistEditorMenu:add_input_int("Cut 2")
local dmsdyCut3 = DoomsdayHeistEditorMenu:add_input_int("Cut 3")
local dmsdyCut4 = DoomsdayHeistEditorMenu:add_input_int("Cut 4")
DoomsdayHeistEditorMenu:add_button("Set Cuts",
function ()
	globals.set_int(DCg1, dmsdyCut1:get_value())
	globals.set_int(DCg2, dmsdyCut2:get_value())
	globals.set_int(DCg3, dmsdyCut3:get_value())
	globals.set_int(DCg4, dmsdyCut4:get_value())
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Preps")
DoomsdayHeistEditorMenu:add_button("Reset Preps",
function ()
	DoomsdayActSetter(240, 0)
end)

DoomsdayHeistEditorMenu:add_sameline()
DoomsdayHeistEditorMenu:add_button("Complete Preps",
function ()
	stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1)
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("By pass Doomsday Scenario hack")
DoomsdayHeistEditorMenu:add_button("By Act III Pass hack",
function ()
	locals.set_int(FMC, DDSHl, 3)
end)

DoomsdayHeistEditorMenu:add_separator()
DoomsdayHeistEditorMenu:add_text("Instant Heist Passed")
DoomsdayHeistEditorMenu:add_button("Instant Finish $$",
function ()
    locals.set_int(FMC, 19746, 12)
    locals.set_int(FMC, 19746 + 2686, 10000000)
    locals.set_int(FMC, 28365 + 1, 99999)
    locals.set_int(FMC, 31621 + 69, 99999)
    gui.show_message("Instant Heist Passed", "Activated")
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MissionsSelectorAndCooldownMenu = L7NEG:add_tab("Missions Selector And cooldown Menu")

MissionsSelectorAndCooldownMenu:add_button("Remove Dax Missions CoolDown ", function()
	stats.set_int("MP" .. MPX .. "_XM22JUGGALOWORKCDTIMER", -1)
end)

MissionsSelectorAndCooldownMenu:add_button("Remove VIP/MC Cool Down", function()
	STATS.STAT_SET_INT(joaat("MPPLY_VIPGAMEPLAYDISABLEDTIMER"), 0, true)
end)

MissionsSelectorAndCooldownMenu:add_button("Skip Yacht Misions", function()
	STATS.STAT_SET_INT(joaat(MPX .. "YACHT_MISSION_PROG"), 0, true)
	STATS.STAT_SET_INT(joaat(MPX .. "YACHT_MISSION_FLOW"), 21845, true)
	STATS.STAT_SET_INT(joaat(MPX .. "CASINO_DECORATION_GIFT_1"), -1, true)
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

SLON = CreditsMenu:add_tab("SLON")
SLON:add_text("For ''YimCeo v0.6 by Slon_.lua'' Code")
SLON:add_text("Source:")
SLON:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")

ShineyWassabi = CreditsMenu:add_tab("ShineyWassabi")
ShineyWassabi:add_text("For Unlock All / GunVan Editor Menu And Daily Collectibles Menu")
ShineyWassabi:add_text("Source:")
ShineyWassabi:add_text("https://github.com/YimMenu-Lua/UnlockEverything")
ShineyWassabi:add_text("https://github.com/YimMenu-Lua/GunVan")
ShineyWassabi:add_text("https://github.com/YimMenu-Lua/DailyCollectibles")

Gir489returns = CreditsMenu:add_tab("Gir489returns")
Gir489returns:add_text("For Casino Pacino Menu")
Gir489returns:add_text("Source:")
Gir489returns:add_text("https://github.com/YimMenu-Lua/Casino-Pacino")
Gir489returns:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/593469-casino-pacino-yimmenu.html")

Alestarov = CreditsMenu:add_tab("Alestarov")
Alestarov:add_text("For 1 Click Cayo Setup")
Alestarov:add_text("Source:")
Alestarov:add_text("https://github.com/YimMenu-Lua/Alestarov-Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------