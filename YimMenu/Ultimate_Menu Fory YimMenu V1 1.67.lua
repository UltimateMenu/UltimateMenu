
--[[SET NO CLIP CONTROLS BELOW
USE LINK BELOW TO FIND THE KEYCODE VALUES YOU NEED
https://keycodes.l7neg.tk/ ]]

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
MPX = PI 
PI = stats.get_int("MPPLY_LAST_MP_CHAR") 
if PI == 0 then MPX = "MP0_" else MPX = "MP1_" end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG = gui.get_tab("Ultimate Menu 1.67 By L7NEG")

gui.show_message("Ultimate Menu Succefully Loaded")
gui.show_message("Join Discord For More Updates")
gui.show_message("https://sub.l7neg.tk/discord")


local function Text(text)
	L7NEG:add_button(text,  function() end)
end

Text("Ultimate Menu 1.67 [V1]")
Text("https://l7neg.tk")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self = L7NEG:add_tab("Self Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_button("Remove Orbital Cannon Cooldown", function() 
 STATS.STAT_SET_INT(joaat(MPX .. "ORBITAL_CANNON_COOLDOWN"), 0, true)
end)

Self:add_button("Remove Transaction Error", function() 
for i = 4536677, 4536679 do globals.set_int(i, 0) end 
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

	StoryCharacters:add_button("Max Michael's's Cash", function() 
    STATS.STAT_SET_INT(joaat("SP0_TOTAL_CASH"), 2147483646, true) end)

    StoryCharacters:add_button("Max Franklin's Cash", function() 
    STATS.STAT_SET_INT(joaat("SP1_TOTAL_CASH"), 2147483646, true) end)

    StoryCharacters:add_button("Max Trevor's Cash", function() 
    STATS.STAT_SET_INT(joaat("SP2_TOTAL_CASH"), 2147483646, true) end)
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG3 = L7NEG:add_tab("1.67 Unlocker Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG3:add_button("Unlock Missed Guns In The GunVan", function()
globals.set_int(262145 + 34094 + 3, -22923932) ----- RailGun
globals.set_int(262145 + 34094 + 4, -1238556825) ----- WidoMaker
globals.set_int(262145 + 34094 + 5, -1355376991) ----- RayPistol
globals.set_int(262145 + 34094 + 6, 1198256469) ----- HellBringer
globals.set_int(262145 + 34094 + 7, 350597077) ----- TecPistol
globals.set_int(262145 + 34094 + 8, 2138347493) ----- FireWork Launcher
end)

L7NEG3:add_button("Unlock Taxi Livery for Eudora", function()
	PlayerIndex = globals.get_int(1574907)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	STATS.STAT_SET_MASKED_INT(MPX .. "DLC22022PSTAT_INT536", 10, 16, 8)
end)

L7NEG3:add_button("Unlock Taxi Livery for Broadway", function()
	STATS.STAT_SET_INT(joaat(MPX .. "AWD_TAXIDRIVER"), 50, true)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGEVENTS = L7NEG:add_tab("Events Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGSNOW = L7NEGEVENTS:add_tab("Snow Toggle Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGSNOW:add_button("Toggle Snow On", function ()
           globals.set_int(262145 + 4752, 1)
end)


L7NEGSNOW:add_button("Toggle Snow Off", function ()
           globals.set_int(262145 + 4752, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Full Account Unlocker Tool---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	FAUT = L7NEG:add_tab("Full Account Unlock Menu")
				   
--Character's Stats-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	CSU = FAUT:add_tab("Character's Stats")
	
	AcMenu = CSU:add_tab("Achievements")
			
			Acv0 = false
			AG = 4542602 + 1
											 
	AcMMenu = AcMenu:add_tab("Unlock One By One Menu")
	
	AcMMenu:add_button("Welcome to Los Santos", function() globals.set_int(AG, 1) end)
	AcMMenu:add_button("A Friendship Resurrected", function() globals.set_int(AG, 2) end)
	AcMMenu:add_button("A Fair Day's Pay", function() globals.set_int(AG, 3) end)
	AcMMenu:add_button("The Moment of Truth", function() globals.set_int(AG, 4) end)
	AcMMenu:add_button("To Live or Die in Los Santos", function() globals.set_int(AG, 5) end)
	AcMMenu:add_button("Diamond Hard", function() globals.set_int(AG, 6) end)
	AcMMenu:add_button("Subversive", function() globals.set_int(AG, 7) end)
	AcMMenu:add_button("Blitzed", function() globals.set_int(AG, 8) end)
	AcMMenu:add_button("Small Town, Big Job", function() globals.set_int(AG, 9) end)
	AcMMenu:add_button("The Government Gimps", function() globals.set_int(AG, 10) end)
	AcMMenu:add_button("The Big One!", function() globals.set_int(AG, 11) end)
	AcMMenu:add_button("Solid Gold, Baby!", function() globals.set_int(AG, 12) end)
	AcMMenu:add_button("Career Criminal", function() globals.set_int(AG, 13) end)
	AcMMenu:add_button("San Andreas Sightseer", function() globals.set_int(AG, 14) end)
	AcMMenu:add_button("All's Fare in Love and War", function() globals.set_int(AG, 15) end)
	AcMMenu:add_button("TP Industries Arms Race", function() globals.set_int(AG, 16) end)
	AcMMenu:add_button("Multi-Disciplined", function() globals.set_int(AG, 17) end)
	AcMMenu:add_button("From Beyond the Stars", function() globals.set_int(AG, 18) end)
	AcMMenu:add_button("A Mystery, Solved", function() globals.set_int(AG, 19) end)
	AcMMenu:add_button("Waste Management", function() globals.set_int(AG, 20) end)
	AcMMenu:add_button("Red Mist", function() globals.set_int(AG, 21) end)
	AcMMenu:add_button("Show Off", function() globals.set_int(AG, 22) end)
	AcMMenu:add_button("Kifflom!", function() globals.set_int(AG, 23) end)
	AcMMenu:add_button("Three Man Army", function() globals.set_int(AG, 24) end)
	AcMMenu:add_button("Out of Your Depth", function() globals.set_int(AG, 25) end)
	AcMMenu:add_button("Altruist Acolyte", function() globals.set_int(AG, 26) end)
	AcMMenu:add_button("A Lot of Cheddar", function() globals.set_int(AG, 27) end)
	AcMMenu:add_button("Trading Pure Alpha", function() globals.set_int(AG, 28) end)
	AcMMenu:add_button("Pimp My Sidearm", function() globals.set_int(AG, 29) end)
	AcMMenu:add_button("Wanted:Alive Or Alive", function() globals.set_int(AG, 30) end)
	AcMMenu:add_button("Los Santos Customs", function() globals.set_int(AG, 31) end)
	AcMMenu:add_button("Close Shave", function() globals.set_int(AG, 32) end)
	AcMMenu:add_button("Off the Plane", function() globals.set_int(AG, 33) end)
	AcMMenu:add_button("Three-Bit Gangster", function() globals.set_int(AG, 34) end)
	AcMMenu:add_button("Making Moves", function() globals.set_int(AG, 35) end)
	AcMMenu:add_button("Above the Law", function() globals.set_int(AG, 36) end)
	AcMMenu:add_button("Numero Uno", function() globals.set_int(AG, 37) end)
	AcMMenu:add_button("The Midnight Club", function() globals.set_int(AG, 38) end)
	AcMMenu:add_button("Unnatural Selection", function() globals.set_int(AG, 39) end)
	AcMMenu:add_button("Backseat Driver", function() globals.set_int(AG, 40) end)
	AcMMenu:add_button("Run Like The Wind", function() globals.set_int(AG, 41) end)
	AcMMenu:add_button("Clean Sweep", function() globals.set_int(AG, 42) end)
	AcMMenu:add_button("Decorated", function() globals.set_int(AG, 43) end)
	AcMMenu:add_button("Stick Up Kid", function() globals.set_int(AG, 44) end)
	AcMMenu:add_button("Enjoy Your Stay", function() globals.set_int(AG, 45) end)
	AcMMenu:add_button("Crew Cut", function() globals.set_int(AG, 46) end)
	AcMMenu:add_button("Full Refund", function() globals.set_int(AG, 47) end)
	AcMMenu:add_button("Dialling Digits", function() globals.set_int(AG, 48) end)
	AcMMenu:add_button("American Dream", function() globals.set_int(AG, 49) end)
	AcMMenu:add_button("A New Perspective", function() globals.set_int(AG, 50) end)
	AcMMenu:add_button("Be Prepared", function() globals.set_int(AG, 51) end)
	AcMMenu:add_button("In the Name of Science", function() globals.set_int(AG, 52) end)
	AcMMenu:add_button("Dead Presidents", function() globals.set_int(AG, 53) end)
	AcMMenu:add_button("Parole Day", function() globals.set_int(AG, 54) end)
	AcMMenu:add_button("Shot Caller", function() globals.set_int(AG, 55) end)
	AcMMenu:add_button("Four Way", function() globals.set_int(AG, 56) end)
	AcMMenu:add_button("Live a Little", function() globals.set_int(AG, 57) end)
	AcMMenu:add_button("Can't Touch This", function() globals.set_int(AG, 58) end)
	AcMMenu:add_button("Mastermind", function() globals.set_int(AG, 59) end)
	AcMMenu:add_button("Vinewood Visionary", function() globals.set_int(AG, 60) end)
	AcMMenu:add_button("Majestic", function() globals.set_int(AG, 61) end)
	AcMMenu:add_button("Humans of Los Santos", function() globals.set_int(AG, 62) end)
	AcMMenu:add_button("First Time Director", function() globals.set_int(AG, 63) end)
	AcMMenu:add_button("Animal Lover", function() globals.set_int(AG, 64) end)
	AcMMenu:add_button("Ensemble Piece", function() globals.set_int(AG, 65) end)
	AcMMenu:add_button("Cult Movie", function() globals.set_int(AG, 66) end)
	AcMMenu:add_button("Location Scout", function() globals.set_int(AG, 67) end)
	AcMMenu:add_button("Method Actor", function() globals.set_int(AG, 68) end)
	AcMMenu:add_button("Cryptozoologist", function() globals.set_int(AG, 69) end)
	AcMMenu:add_button("Getting Started", function() globals.set_int(AG, 70) end)
	AcMMenu:add_button("The Data Breaches", function() globals.set_int(AG, 71) end)
	AcMMenu:add_button("The Bogdan Problem", function() globals.set_int(AG, 72) end)
	AcMMenu:add_button("The Doomsday Scenario", function() globals.set_int(AG, 73) end)
	AcMMenu:add_button("A World Worth Saving", function() globals.set_int(AG, 74) end)
	AcMMenu:add_button("Orbital Obliteration", function() globals.set_int(AG, 75) end)
	AcMMenu:add_button("Elitist", function() globals.set_int(AG, 76) end)
	AcMMenu:add_button("Masterminds", function() globals.set_int(AG, 77) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG6 = L7NEG:add_tab("LSCM Unlocker Menu")

L7NEG6:add_button("Unlock All Rep Lvl 1000", function() for i = 262145 + 31835, 262145 + 31862 do globals.set_float(i, 100000) end end)

LSCMNote = L7NEG6:add_tab("Read Me Tutorial")

    LSCMNote:add_button("Buy a membership, activate, sit in", function() end)
	LSCMNote:add_button("a test car and go to the track", function() end)
	LSCMNote:add_button("", function() end)
	LSCMNote:add_button("If your level is not 1, then activate", function() end)
	LSCMNote:add_button("and buy something in the LSCM store", function() end)
	LSCMNote:add_button("", function() end)
	LSCMNote:add_button("If you've used LS Tuner awards unlock", function() end)
	LSCMNote:add_button("before, all unlocks will be temporary only", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
--© 2023 L7NEG's Official Discord Server. All Rights Reserved--

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7 = L7NEG:add_tab("Ultimate Money Methods Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CEO2=277873

CEO3=277874

CEO1=278108

local cs = "appsecuroserv"

local ci = "gb_contraband_sell"

local cb = "gb_contraband_buy"

local am = "am_mp_warehouse"

local am2= "am_mp_peds"

checkbox = L7NEG7:add_checkbox("Enable Ceo Manager")

script.register_looped("yimceoloop", function (script)

    globals.set_int(CEO1, 6000000)

    globals.set_int(CEO2, 0)

    globals.set_int(CEO3, 0)

    script:yield()



    if checkbox:is_enabled() == true then

        if locals.get_int(ci, 2) == 1 then

            locals.set_int(ci, 1136, 1)

            locals.set_int(ci, 596, 0)

            locals.set_int(ci, 1125, 0) 

            locals.set_int(ci, 548, 7)

            script:sleep(500)

            locals.set_int(ci, 542, 99999)  

        end

        if locals.get_int(cs, 2) == 1 then

            script:sleep(500)

            locals.set_int(cs, 737, 1)

            script:sleep(200)

            locals.set_int(cs, 738, 1)

            script:sleep(200)

            locals.set_int(cs, 556, 3012)

            script:sleep(1000)

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

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
MPX = PI 
PI = stats.get_int("MPPLY_LAST_MP_CHAR") 
if PI == 0 then MPX = "MP0_" else MPX = "MP1_" end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7:add_checkbox("Enable Nitghtclub $250k/15s (Safe AFK)")
script.register_looped("nightclubloop", function(script)
    script:yield()
    if checkbox:is_enabled() == true then
        log.info("Starting")
        STATS.STAT_SET_INT(joaat(MPX .. "CLUB_POPULARITY"), 1000, true)
        STATS.STAT_SET_INT(joaat(MPX .. "CLUB_PAY_TIME_LEFT"), -1, true)
		log.info("Finished")
        script:sleep(2500)
    end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG8 = L7NEG7:add_tab("WareHouse Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG8:add_button("Auto-Reset stats-0/0Sales", function()
        STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_BUY_COMPLETE"), 0, true)
        STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_BUY_UNDERTAKEN"), 0, true)
        STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_SELL_COMPLETE"),  0, true)
        STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_SELL_UNDERTAKEN"),  0, true)
        STATS.STAT_SET_INT(joaat(MPX .. "LIFETIME_CONTRA_EARNINGS"),  0, true)
        globals.set_int(1575020, 11)         ----PlayerSessionBlank--------
        globals.set_int(1574589, 1)         ----PlayerSessionNew----------
        sleep(0.2)
        globals.set_int(1574589, 0)         ----PlayerSessionNew------
    end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7N = L7NEG7:add_tab("Tutorial ReadMe")

L7NEG7N:add_button("     Ceo Crates Method       ", function() end)
L7NEG7N:add_button("   First Enter Your Warehouse   ", function() end)
L7NEG7N:add_button("   Then Stand In Front Of Your Warehouse Computer And Then Active The Enable Ceo Manager    ", function() end)
L7NEG7N:add_button("", function() end)
L7NEG7N:add_button("https://dsc.gg/l7neg-", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGH = L7NEG:add_tab("Heists Data Editor Menu")

--Required Stats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
MPX = PI 
PI = stats.get_int("MPPLY_LAST_MP_CHAR") 
if PI == 0 then MPX = "MP0_" else MPX = "MP1_" end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGAPARTMENT = L7NEGH:add_tab("Apartment Data Editor")

L7NEGAPARTMENT:add_button("Skip Current Apartment Heist Preps", function()
		STATS.STAT_SET_INT(joaat(MPX .. "HEIST_PLANNING_STAGE"), -1, true)
end)

L7NEGAPARTMENT:add_sameline()

L7NEGAPARTMENT:add_button("Reset Current Apartment Heist Preps", function()
		STATS.STAT_SET_INT(joaat(MPX .. "HEIST_PLANNING_STAGE"), 0, true)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


L7NEGCASINO = L7NEGH:add_tab("Casino Heist")

L7NEGCASINO:add_button("One Click Setup Casino Silent&Sneaky", function()
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

L7NEGCASINO:add_button("One Click Setup Casino The Big Con. Mode", function()
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

L7NEGCASINO:add_button("One Click Setup Casino Agrresive Mode", function()
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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGCAYO = L7NEGH:add_tab("Cayo Perlco Heist")

L7NEGCAYO:add_button("One Click Setup Panther + Hard Mode", function()
		        STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_BS_GEN"), 131071, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_BS_ENTR"), 63, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_BS_ABIL"), 63, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_WEAPONS"), 5, true)
		        STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_WEP_DISRP"), 3, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_ARM_DISRP"), 3, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_HEL_DISRP"), 3, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_TARGET"), 5, true)
		        STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_TROJAN"), 2, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4CNF_APPROACH"), -1, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_CASH_I"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_CASH_C"), 0, true)
		        STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_WEED_I"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_WEED_C"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_COKE_I"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_COKE_C"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_CASH_I"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_GOLD_I"), 0, true)
		        STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_GOLD_C"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_PAINT"), -1, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4_PROGRESS"), 131055, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_CASH_I_SCOPED"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_CASH_C_SCOPED"), 0, true)
		        STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_WEED_I_SCOPED"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_WEED_C_SCOPED"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_COKE_I_SCOPED"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_COKE_C_SCOPED"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_GOLD_I_SCOPED"), 0, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_GOLD_C_SCOPED"), 0, true)
		        STATS.STAT_SET_INT(joaat(MPX .. "H4LOOT_PAINT_SCOPED"), -1, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4_MISSIONS"), 65535, true)
                STATS.STAT_SET_INT(joaat(MPX .. "H4_PLAYTHROUGH_STATUS"), 32, true)               
end)

L7NEGCAYO:add_button("Remove All CCTV's", function()
    for _, ent in pairs(entities.get_all_objects_as_handles()) do
        for __, cam in pairs(CamList) do
            if ENTITY.GET_ENTITY_MODEL(ent) == cam then
                ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent,true,true) --不执行这个下面会删除失败 @nord123#9579
                ENTITY.DELETE_ENTITY(ent)               
            end
        end
    end
end)
CamList = {   --credits heist control
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

CPVMenu = L7NEGCAYO:add_tab("Size/Value Editor")

CPVMenu:add_button("Max Bag Size", function() globals.set_int(262145 + 29939, 2147483647) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGDOOMSDAY = L7NEGH:add_tab("Doomsday Heist Editor")

L7NEGDOOMSDAY:add_button("One Click Setup Act 1: The Data Breaches", function()
		        STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FLOW_MISSION_PROG"), 7, true)
                STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FM_MISSION_PROG"), 7, true) 
end)

L7NEGDOOMSDAY:add_button("One Click Setup Act 2: The Bodgan Problem", function()
		        STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FLOW_MISSION_PROG"), 240, true)
                STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FM_MISSION_PROG"), 248, true) 
end)

L7NEGDOOMSDAY:add_button("One Click Setup Act 3: Doomsday Scenario", function()
		        STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FLOW_MISSION_PROG"), 15872, true)
                STATS.STAT_SET_INT(joaat(MPX .. "GANGOPS_FM_MISSION_PROG"), 16128, true) 
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG5 = L7NEG:add_tab("Missions Selector And cooldown Menu")

L7NEG5:add_button("Remove Dax Missions CoolDown ", function()
STATS.STAT_SET_INT(joaat(MPX .. "XM22JUGGALOWORKCDTIMER"), -1, true) 
end)

L7NEG5:add_button("Remove VIP/MC Cool Down", function() 
STATS.STAT_SET_INT(joaat("MPPLY_VIPGAMEPLAYDISABLEDTIMER"), 0, true) end)

L7NEG5:add_button("Skip Yacht Misions", function() 
STATS.STAT_SET_INT(joaat(MPX .. "YACHT_MISSION_PROG"), 0, true) 
STATS.STAT_SET_INT(joaat(MPX .. "YACHT_MISSION_FLOW"), 21845, true) 
STATS.STAT_SET_INT(joaat(MPX .. "CASINO_DECORATION_GIFT_1"), -1, true) end)	

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG1 = L7NEG:add_tab("Credits")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Yimura = L7NEG1:add_tab("Yimura")
Yimura:add_text("Yim Menu Cheat Developer")
Yimura:add_text("Cheat on GitHub:")
Yimura:add_text("https://github.com/YimMenu/YimMenu")

L7NEGDEV = L7NEG1:add_tab("L7NEG")
L7NEGDEV:add_text("Codded This W Script With <3 To You All")
L7NEGDEV:add_text("Profile on GitHub:")
L7NEGDEV:add_text("https://github.com/L7NEG")

SLON = L7NEG1:add_tab("SLON")
SLON:add_text("The code from the script ''YimCeo v0.3 by Slon_.lua'' was implemented")
SLON:add_text("Original Script On UnKnownCheats.me:")
SLON:add_text("https://www.unknowncheats.me/forum/grand-theft-auto-v/591335-yimceo-ceo-crates-method-yimmenu.html")

Alestarov = L7NEG1:add_tab("Alestarov")
Alestarov:add_text("For His W 1 Click Cayo Setup")
Alestarov:add_text("Profile on GitHub:")
Alestarov:add_text("https://github.com/Alestarov")

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--DV=Enable Deleted Vehicles----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DV1=262145+14908
DV2=262145+14916
DV3=262145+17482
DV4=262145+17500
DV5=262145+19311
DV6=262145+19335
DV7=262145+20392
DV8=262145+20395
DV9=262145+25969
DV10=262145+25975
DV11=262145+25980
DV12=262145+26000
DV13=262145+26956
DV14=262145+26957
DV15=262145+28820
DV16=262145+28840
DV17=262145+28863
DV18=262145+28866
DV19=262145+30348
DV20=262145+30364
DV21=262145+31216
DV22=262145+31232
DV23=262145+32099
DV24=262145+32113
DV25=262145+33341
DV26=262145+33359
DV27=262145+34212
DV28=262145+34227
DV29=262145+17654
DV30=262145+17675
DV31=262145+21274
DV32=262145+21279
DV33=262145+22073
DV34=262145+22092
DV35=262145+23041
DV36=262145+23068
DV37=262145+24262
DV38=262145+24277
DV39=262145+24353
DV40=262145+24375
DV41=262145+29534
DV42=262145+29541
DV43=262145+29883
DV44=262145+29889

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 xox_00 = 1
 xox_01 = 1
 xox_0 = 1
 xox_1 = 1
 xox_2 = 1
 xox_3 = 1
 xox_4 = 1
 xox_5 = 1
 xox_6 = 1
 xox_7 = 1
 xox_8 = 1
 xox_9 = 1
 xox_10 = 1
 xox_11 = 1
 xox_12 = 1
 xox_13 = 1
 xox_14 = 1
 xox_15 = 1
 xox_16 = 1
 xox_17 = 1
 xox_18 = 1
 xox_19 = 1
 xox_20 = 1
 xox_21 = 1
 xox_22 = 1
 xox_23 = 1
 xox_24 = 1
 xox_25 = 1
 xox_26 = 1
 xox_27 = 1
 xox_28 = 1
 xox_29 = 1
 xox_30 = 1
 xox_31 = 1
 xox_32 = 1
 xox_33 = 1
 xox_34 = 1
 xox_35 = 1
 xox_36 = 1
 xox_37 = 1

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
                                                                                                                                 
                                                                         dddddddd                                                
        CCCCCCCCCCCCC                                                    d::::::d  iiii           tttt                           
     CCC::::::::::::C                                                    d::::::d i::::i       ttt:::t                           
   CC:::::::::::::::C                                                    d::::::d  iiii        t:::::t                           
  C:::::CCCCCCCC::::C                                                    d:::::d               t:::::t                           
 C:::::C       CCCCCCrrrrr   rrrrrrrrr       eeeeeeeeeeee        ddddddddd:::::d iiiiiii ttttttt:::::ttttttt        ssssssssss   
C:::::C              r::::rrr:::::::::r    ee::::::::::::ee    dd::::::::::::::d i:::::i t:::::::::::::::::t      ss::::::::::s  
C:::::C              r:::::::::::::::::r  e::::::eeeee:::::ee d::::::::::::::::d  i::::i t:::::::::::::::::t    ss:::::::::::::s 
C:::::C              rr::::::rrrrr::::::re::::::e     e:::::ed:::::::ddddd:::::d  i::::i tttttt:::::::tttttt    s::::::ssss:::::s
C:::::C               r:::::r     r:::::re:::::::eeeee::::::ed::::::d    d:::::d  i::::i       t:::::t           s:::::s  ssssss 
C:::::C               r:::::r     rrrrrrre:::::::::::::::::e d:::::d     d:::::d  i::::i       t:::::t             s::::::s      
C:::::C               r:::::r            e::::::eeeeeeeeeee  d:::::d     d:::::d  i::::i       t:::::t                s::::::s   
 C:::::C       CCCCCC r:::::r            e:::::::e           d:::::d     d:::::d  i::::i       t:::::t    ttttttssssss   s:::::s 
  C:::::CCCCCCCC::::C r:::::r            e::::::::e          d::::::ddddd::::::ddi::::::i      t::::::tttt:::::ts:::::ssss::::::s
   CC:::::::::::::::C r:::::r             e::::::::eeeeeeee   d:::::::::::::::::di::::::i      tt::::::::::::::ts::::::::::::::s 
     CCC::::::::::::C r:::::r              ee:::::::::::::e    d:::::::::ddd::::di::::::i        tt:::::::::::tt s:::::::::::ss  
        CCCCCCCCCCCCC rrrrrrr                eeeeeeeeeeeeee     ddddddddd   dddddiiiiiiii          ttttttttttt    sssssssssss    
                                                                                                                                 
                                                                                                                                 
                                                                                                                                 
                                                                                                                                 
          Resources used -> Ultimate controller  
                         -> YimCeo by SLON                                                                                                       
                         -> API - Thank you Yimura <3 
                         -> Complied & Editied By L7NEG 
--]]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
