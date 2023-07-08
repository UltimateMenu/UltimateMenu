
--[[SET NO CLIP CONTROLS BELOW
USE LINK BELOW TO FIND THE KEYCODE VALUES YOU NEED
https://keycodeinfo.l7neg.repl.co/developers/ ]]

go_up = 16
go_down = 17
go_forward = 38
go_back = 40
turn_left = 37
turn_right = 39
dec_speed = 109
inc_speed = 107

-------------------------------------------------------------------------------------------------

MenuRootTab = gui.get_tab("Ultimate Menu 1.67 By L7NEG")

local function Text(text)
	MenuRootTab:add_button(text,  function() end)
end

Text("  Ultimate Menu 1.67 [V1 Beta] ")
Text("                   https://l7neg.tk               ")

--------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------

L7NEG3 = MenuRootTab:add_tab("1.67 Unlocker Menu")

-----------------------------------------------------------------------------------

L7NEG3:add_button("Unlock GunVan RailGun", function()
globals.set_int(262145 + 33840 + 3, -22923932) ----- RailGun
end)

-----------------------------------------------------------------------------------

L7NEGEVENTS = MenuRootTab:add_tab("Events Menu")

----------------------------------------------------------------------------------------------------------------------------------

L7NEGSNOW = L7NEGEVENTS:add_tab("Snow Toggle Menu")

--------------------------------------------------------------------------------------------------------------

L7NEGSNOW:add_button("Toggle Snow On", function ()
           globals.set_int(262145 + 4752, 1)
end)


L7NEGSNOW:add_button("Toggle Snow Off", function ()
           globals.set_int(262145 + 4752, 0)
end)

---------------------------------------------------------------------------------------------------------------------------------

L7NEGMW29 = L7NEGEVENTS:add_tab("MW29 Event Menu")

---------------------------------------------------------------------------------------------------------------------------------

L7NEGMW29:add_button("Enable Weazel Bank Shootout Event", function()
    globals.set_int(262145 + 34059, 1) -- Tunable:ENABLE_MAZEBANKSHOOTOUT_DLC22022
    globals.set_int(2756259 + 3 + 1, 172)
    globals.set_int(2756259 + 2, 6)
end)

function Status()
end
 
L7NEGMW29:add_checkbox("Is The Event Enabled", function()
	if script("fm_content_bank_shootout"):is_active() then
		return true
	end
	return false
end, Status)

local function teleport_myself(x,y,z)
	 localplayer:set_position((vector3(x, y, z)))
 end

L7NEGMW29:add_button("Teleport NO1", function()
	 teleport_myself(-926.20, -501.58, 35.79)
 end)

L7NEGMW29:add_button("Teleport NO2", function()
	 teleport_myself(-894.06, -448.18, 174.15)
 end)

----------------------------------------------------------------------------------------------------------------------------------

L7NEGMW29README = L7NEGMW29:add_tab("Read Me")

L7NEGMW29README:add_button("==============================", function() end)

L7NEGMW29README:add_button("     Instructions", function() end)

L7NEGMW29README:add_button("==============================", function() end)

L7NEGMW29README:add_button("First Go Public Session", function() end)

L7NEGMW29README:add_button("Then Teleport  To  Place NO1", function() end)

L7NEGMW29README:add_button("Then Active Enable Weazel Bank", function() end)

L7NEGMW29README:add_button("Shootout Event", function() end)

L7NEGMW29README:add_button("Then Stand AFK And Waiting For 20m", function() end)

L7NEGMW29README:add_button("After That, From 20:00 To 06:00, Wait", function() end)
 
L7NEGMW29README:add_button("For", function() end)

L7NEGMW29README:add_button("The Appearance Of a Red Marker", function() end)

L7NEGMW29README:add_button("Use The Teleport NO2 To Get On Top Of", function() end)

L7NEGMW29README:add_button("The Building To Get The MW29", function() end)

L7NEGMW29README:add_button("If It Does Not Appear", function() end)

L7NEGMW29README:add_button("Then Change The Session", function() end)


----------------------------------------------------------------------------------------------------------------------------------

L7NEGGOOCH = L7NEGEVENTS:add_tab("Gooch Spawn Menu")

----------------------------------------------------------------------------------------------------------------------------------

L7NEGGOOCH:add_button("Spawn Gooch", function()
    globals.set_int(2756259 + 3 + 1, 171)
    globals.set_int(2756259 + 2, 6)
end)

----------------------------------------------------------------------------------------------------------------------------------

---Full Account Unlocker Tool---

	FAUT = MenuRootTab:add_tab("Full Account Unlock Menu")
				   
--Character's Stats--

	CSU = FAUT:add_tab("Character's Stats")
	
	AcMenu = CSU:add_tab("Achievements")
			
			Acv0 = false
			AG = 4542602 + 1
		local function AchUnlock()
		while Acv0 == true do for i = 1, 78 do globals.set_int(4542602 + 1 , i) end end end
	AcMenu:add_checkbox("Unlock All", function() return Acv0 end, function() Acv0 = not Acv0 AchUnlock(Acv0) end)
											 
	AcMMenu = AcMenu:add_tab("Unlock One By One")
	
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
	
	AcMenu:add_button("", function() end)
	
	AcNote = AcMenu:add_tab("Read Me")
	
	AcNote:add_button("                         Unlock All:", function() end)
	AcNote:add_button(" Unlocks all achievements auto; ≈10 mins;", function() end)
	AcNote:add_button("               to turn off the option,", function() end)
	AcNote:add_button("     close the menu via «Menu Settings»", function() end)
	
-----------------------------------------------------------------------------------------------------------------------------------------

      ColMenu = CSU:add_tab("Collectibles Menu")
	
	ColTMenu = ColMenu:add_tab("Unlock All (Temporarily)")
	
	ColTMenu:add_button("Action Figures", function() globals.set_int(2764906 + 209 , 100) end)
	ColTMenu:add_button("Movie Props", function() globals.set_int(2764906 + 494 , 10) end)
	ColTMenu:add_button("Playing Cards", function() globals.set_int(2764906 + 210 , 54) end)
	ColTMenu:add_button("Signal Jammers", function() globals.set_int(2764906 + 211 , 50) end)
      ColTMenu:add_button("LD Organics", function() globals.set_int(2764906 + 593 , 100) end)
      ColTMenu:add_button("Buried Stashs", function() globals.set_int(2764906 + 553 , 10) end)
      ColTMenu:add_button("Jack o Lantern", function() globals.set_int(2764906 + 591 , 10) end)
      ColTMenu:add_button("Hidden Caches", function() globals.set_int(2764906 + 504 , 10) end)
      ColTMenu:add_button("Treasure Chests", function() globals.set_int(2764906 + 506 , 30) end)
	
	ColPMenu = ColMenu:add_tab("Unlock All (Permanently)")
	
	ColPMenu:add_button("Action Figures", function() globals.set_int(2764906 + 209 , 99) end)
	ColPMenu:add_button("Movie Props", function() globals.set_int(2764906 + 494 , 9) end)
	ColPMenu:add_button("Playing Cards", function() globals.set_int(2764906 + 210 , 53) end)
	ColPMenu:add_button("Signal Jammers", function() globals.set_int(2764906 + 211 , 49) end)
      ColPMenu:add_button("LD Organics", function() globals.set_int(2764906 + 593 , 99) end)
      ColPMenu:add_button("Buried Stashs", function() globals.set_int(2764906 + 553 , 9) end)
      ColPMenu:add_button("Jack o Lantern", function() globals.set_int(2764906 + 591 , 9) end)
      ColPMenu:add_button("Hidden Caches", function() globals.set_int(2764906 + 504 , 9) end)
	ColPMenu:add_button("Treasure Chests", function() globals.set_int(2764906 + 506 , 29) end)

	ColPMenu:add_button("", function() end)
	
	ColPNote = ColPMenu:add_tab("Read Me")
	
	ColPNote:add_button("     First, find the item you want, select", function() end)
	ColPNote:add_button("    an option, and then pick up the item", function() end)

------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------

     L7NEG6 = MenuRootTab:add_tab("LSCM Unlocker Menu")


L7NEG6:add_button("LSCM Prize Ride Unlock", function() stats.set_bool(MPX .. "CARMEET_PV_CHLLGE_CMPLT", true) end)

--------------------------------------------------------------------------------------------------------------------------------------------
	
	CSNote = MenuRootTab:add_tab("Read Me")

---------------------------------------------------------------------------------------------------------------------------------------------
	
	CSNote:add_button("                Unlock «Change Gender»:", function() end)
	CSNote:add_button("     Unlocks «Change Gender» option while", function() end)
	CSNote:add_button("                editing your character", function() end)

-------------------------------------------------------------------------------------------------------------------------------------------------
	
--© 2023 L7NEG's Official Discord Server. All Rights Reserved--

--------------------------------------------------------------------------------------------------------------



L7NEG7 = MenuRootTab:add_tab("Ultimate Money Methods Menu")

L7NEG7:add_checkbox("Start Ceo Banager",
  function()
    return boolCeoBanager
  end,
  function()
    boolCeoBanager = not boolCeoBanager;
    funcCeoBanger(boolCeoBanager)
  end
)

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Required Script Handles
local scrWarehouse = script("am_mp_warehouse")
local scrSellContraband = script("gb_contraband_sell")
local scrBuyContraband = script("gb_contraband_buy")
local scrSecuroServ = script("appsecuroserv")

-- get the right variable prefix
if stats.get_int("MPPLY_LAST_MP_CHAR") == 0 then
  MPX = "MP0_"
else
  MPX = "MP1_"
end

local function funcCeoBanger(isRunning)

  while isRunning == true do
    local numLifetimeSales = stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE")
    if scrWarehouse:is_active() then
          globals.set_int(277933, 6000000)
        end
                           globals.set_int(4536673,  0)
                           globals.set_int(4536673,  0)


        if scrSecuroServ:is_active() then
          scrSecuroServ:set_int(736, 1)
          sleep(1)
          scrSecuroServ:set_int(737, 1)
          sleep(1)
          scrSecuroServ:set_int(555, 3012)
        end

-----------------------------------------------------------------------------------------------------------------

        if scrSellContraband:is_active() then
          scrSellContraband:set_int(1135, 1)
          scrSellContraband:set_int(595, 0)
          scrSellContraband:set_int(1124, 0)

--------------------------------------------------------------------------------------------------------------------

          scrSellContraband:set_int(547, 7)
          sleep(1)
          scrSellContraband:set_int(541,  99999)
        end
      end
    end

-----------------------------------------------------------------------------------------------------------------

    if scrBuyContraband:is_active() then
        sleep(1)
        scrBuyContraband:set_int(603, 1)
        scrBuyContraband:set_int(599, 111)  
        scrBuyContraband:set_int(789, 6)
        scrBuyContraband:set_int(790, 4)
      end

-------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------This Feature Improved By ----------AKA L7NEG  If-------------- -You Take It Without Credits Then You Are A c/p------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------

L7NEG7N = L7NEG7:add_tab("Tutorial ReadMe")

L7NEG7N:add_button("     Ceo Crates Method       ", function() end)
L7NEG7N:add_button("   First Enter Your Warehouse   ", function() end)
L7NEG7N:add_button("Next Start Ultimate Money Manager       ", function() end)
L7NEG7N:add_button("     Finally Active The Auto Sell Afk       ", function() end)
L7NEG7N:add_button("", function() end)
L7NEG7N:add_button("https://dsc.gg/l7neg-", function() end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------

L7NEG1 = MenuRootTab:add_tab("Credits")

--------------------------------------------------------------------------------------------------------------
L7NEG1:add_button("---Kiddion---", function() end)

L7NEG1:add_button("---Ryze---", function() end)

L7NEG1:add_button("---ΞΛZТΞΛ#3171/SLON---", function() end)

L7NEG1:add_button("---MxGta#1746---", function() end)

L7NEG1:add_button("---Apple Vegas---", function() end)

L7NEG1:add_button("Discord Server For Any Help", function() end)

L7NEG1:add_button("https://dsc.gg/l7neg-", function() end)

-------------------------------------------------------------------------------------------------------------
														


----------------------credits ultimate controller-------------------------------------------------------

ACL1=262145+17425
ACL2=262145+17396
ACL3=262145+18949
ACL4=262145+21869
ACL5=262145+21870
ACL6=262145+21866
TEB1=262145+32702
TEB2=262145+32688
DWU1=262145+33975
DWU2=262145+34113
PEY1=262145+27133
PEY2=262145+27894
RPN1=262145+29991
RPN2=262145+29992
TEQ1=262145+29982
RUN1=262145+29983
BEB1=262145+29984
PID1=262145+29985
PAS1=262145+29987
BAS1=262145+29732
RLC1=262145+28817
RLC2=262145+28831
RLC3=262145+28467
RLC4=262145+28818
RLC5=262145+28819
RLC6=262145+28820
RLC7=262145+28821
RLC8=262145+28822
RLC9=262145+28823
RLC10=262145+28824
RLC11=262145+28825
RLC12=262145+28826
RLC13=262145+28827
RLC14=262145+28828
RLC15=262145+28829
RLC16=262145+28830
CDP1=262145+28808
CGP1=262145+28807
CAP1=262145+28806
CCP1=262145+28805
RCP1=262145+31701
RCP2=262145+31765
PAP1=262145+31727
PAH1=262145+31728
DRD1=262145+34062
GUV1=262145+33799
GUV2=262145+33877
TJC1=262145+33770
BSM1=262145+21509
BSM2=262145+21510
EBD1=262145+21621
EBD2=262145+21645
EBD3=262145+21647
EBD4=262145+21650
EBD5=262145+21654
EBD6=262145+21656
EBD7=262145+21658
EBD8=262145+21660
EBD9=262145+21666
EBD10=262145+21668
EBD11=262145+21671
EBD12=262145+21673
EBD13=262145+21675
EBD14=262145+21678
EBD15=262145+21689
EBD16=262145+21691
EBD17=262145+21695
EBD18=262145+21697
EBD19=262145+21699
EBD20=262145+21702
RBD1=262145+21557
RBS1=262145+21555
RBS2=262145+21556
BSU1=262145+21532
BSU2=262145+21531
Csp1=262145+15788
Csp2=262145+15789
CSP3=262145+15790
CSP4=262145+15791
CSP5=262145+15792
CSP6=262145+15793
CSP7=262145+15794
CSP8=262145+15795
CSP9=262145+15796
Csp10=262145+15797
Csp11=262145+15798
Csp12=262145+15799
Csp13=262145+15800
Csp14=262145+15801
Csp15=262145+15802
Csp16=262145+15803
Csp17=262145+15804
Csp18=262145+15805
Csp19=262145+15806
Csp20=262145+15807
Csp21=262145+15808
CRC1=262145+15553
CRC2=262145+15554
NRC1=262145+24447
NRC2=262145+24489
NCR3=262145+24490
PSU1=262145+24107
PSU2=262145+24113
PSU3=262145+24108
PSU4=262145+24109
PSU5=262145+24110
PSU6=262145+24111
PSU7=262145+24112
SGV1=262145+24381
SAV1=262145+24382
PHV1=262145+24383
OPV1=262145+24384
PCV1=262145+24385
CCV1=262145+24386
CSV1=262145+24387
RTC1=262145+24496
ALV1=262145+22811
AMV1=262145+22812
AAV1=262145+22813
CHV1=262145+22814
COV1=262145+22815
JEV1=262145+22816
MSV1=262145+22817
NAV1=262145+22818
TAV1=262145+22819
RRC1=262145+22793
SUP1=262145+17391
SUP2=262145+17395
SUP3=262145+17394
SUP4=262145+17393
SUP5=262145+17392
EMD1=262145+15567
EMD2=262145+18510
EMD3=262145+18514
EMD4=262145+18516
EMD5=262145+18520
EMD6=262145+18523
EMD7=262145+18547
EMD8=262145+18550
EMD9=262145+18552
EMD10=262145+18557
EMD11=262145+18561
EMD12=262145+18565
EMD13=262145+18570
EMD14=262145+18575
RSC1=262145+18953
RSD1=262145+18954
GSM1=262145+18247
MSM1=262145+19066
MSM2=262145+19067
ACC1=262145+31126
CHA1=262145+31127
LOM1=262145+31128
EXT1=262145+31132
MHT1=262145+31136
MMT1=262145+31137
MLT1=262145+31138
TOR1=262145+19412
MIR1=262145+19413
STR1=262145+19414
UCR1=262145+19416
UCS1=262145+19417
VHR1=262145+19682
VHR2=262145+19685
VHR3=262145+19314
VHR4=262145+19683
VHR5=262145+19684
RRC1=262145+19661
RRC2=262145+19662
RRC3=262145+19663
SAH1=262145+19418
SPD1=262145+19419
REM1=262145+20288
RMU1=262145+1
APU1=262145+25926
SRM1=262145+31649
PRM1=262145+31650
SCM1=262145+31651
HH1=262145+31652
LCM1=262145+31653
LMT1=262145+31654
AWA1=262145+24058
AWA2=262145+24060
AWA3=262145+24067
AWA4=262145+24069
AWO1=262145+24052
AWO2=262145+24054
AWO3=262145+24061
AWO4=262145+24063
AWR1=262145+24055
AWR2=262145+24057
AWR3=262145+24064
AWR4=262145+24066
EG1=262145+13149
EB1=262145+13150
CC1=262145+15891
CC2=262145+18025
RF7=262145+12843
RB2=262145+12851
RB3=262145+15890
RB4=262145+12848
RB5=262145+12849
RB6=262145+12850
RF1=262145+12842
RF2=262145+12846
RF3=262145+15968
RF4=262145+15973
RF5=262145+19302
RF6=262145+19304
RF8=262145+12845
RF9=262145+15969
RF10=262145+15970
RF11=262145+15971
RF12=262145+15980
IS1=262145+25302
IS2=262145+25303
IS3=262145+25304
RV1=262145+12832
RM1=262145+28408
RSU1=262145+30187
RSU2=262145+30188
RC1=262145+13081
NM1=262145+8352
NM2=262145+8353
NM3=262145+8354
NM4=262145+8355
NM5=262145+8356
NM6=262145+8357
NM7=262145+8358
NM8=262145+8359
NM9=262145+8360
DR1=262145+33958
DR2=262145+33973
MU1=262145+32865
CG1=262145+24219
CG2=262145+24220
UA1=262145+31859
UA2=262145+31870
CD1=262145+31871
CD2=262145+31872
CD3=262145+31873
AC1=262145+27530
AC2=262145+27531
AC3=262145+27532
AC4=262145+27533
PC1=262145+28200
PC2=262145+28205
PC3=262145+27945
PC4=262145+28011
VU1=262145+7059
VU2=262145+12030
VU3=262145+12031
VU4=262145+12032
VU5=262145+12033
VU5=262145+12034
VU6=262145+13396
VU7=262145+13397
ID1=262145+8259
ID2=262145+8268
ID3=262145+8274
ID4=262145+8297
ID5=262145+8303
HA1=262145+11996
HA2=262145+12036
HA3=262145+12041
HA4=262145+12042
HA5=262145+12043
HA7=262145+12045
HA8=262145+12046
HA9=262145+12047
HA10=262145+12048
HA11=262145+12059
HA12=262145+12702
HA13=262145+17488
XM1=262145+4763
XM2=262145+30902
XM3=262145+25834
XM4=262145+25835
XM5=262145+25836
XM6=262145+19139
XM6=262145+19139
XM7=262145+9395
XM8=262145+9396
XM8=262145+9397
XM9=262145+9398
XM10=262145+12710
XM11=262145+23412
XM12=262145+23413
XM13=262145+23414
XM44=262145+23415
XM15=262145+24203
XM16=262145+12711
XM17=262145+12713
XM18=262145+19256
XM19=262145+23056
XM20=262145+12816
XM21=262145+12817
XM22=262145+12818
XM23=262145+12819
XM24=262145+19115
XM25=262145+19116
XM26=262145+19117
XM27=262145+19118
XM28=262145+23434
XM27=262145+23435
XM29=262145+23436
XM30=262145+23437
XM31=262145+25838
XM32=262145+25841
XM33=262145+25839
XM34=262145+25840
XM35=262145+28690
XM36=262145+28691
XM37=262145+28692
XM38=262145+28693
XM39=262145+31410
XM40=262145+31411
XM41=262145+31756
XM42=262145+31757
XM43=262145+23407
XM45=262145+9449
XM46=262145+9451
XM47=262145+33916
XM48=262145+33917
SN1=262145+4752
CA1=262145+21109
CA2=262145+21112
CA3=262145+21118
CA4=262145+21121
CA5=262145+21129
CA6=262145+21122
CA7=262145+21132
CA8=262145+21134
HA1=262145+12591
MS5=262145+12613
BS1=262145+15222
BS2=262145+15224
BS3=262145+15226
BS4=262145+15228
BS5=262145+15230
BS6=262145+15236
BS7=262145+24205
BS8=262145+24208
BS9=262145+23951
BS10=262145+24210
RS4=262145+24212
BS12=262145+24215
BS13=262145+18255
KT1=262145+24221
KT2=262145+24230
MC1=262145+15225
MC2=262145+17532
MC2=262145+17532
MC3=262145+17553
MC3=262145+17553
MS1=262145+11955
MS2=262145+15229
MS3=262145+11964
MS4=262145+12601
RS1=262145+24204
RS2=262145+24209
RS3=262145+24211
RS5=262145+24214
RS6=262145+24216
RS7=262145+24217
RS8=262145+24744
RS9=262145+24763
CT1=262145+24704
CT2=262145+24712
DT1=262145+24918
DT2=262145+24941
HO1=262145+21110
HO2=262145+21114
HO3=262145+21117
HO4=262145+21119
HO5=262145+21124
HO6=262145+21126
HO7=262145+21130
HO8=262145+21133
SH1=262145+25826
SH2=262145+21111
SH3=262145+21113
SH4=262145+21115
SH5=262145+21116
SH6=262145+21120
SH7=262145+21125
SH8=262145+21131
SH9=262145+21135
SH10=262145+21136
SH11=262145+21147
WB1=262145+16783
WB2=262145+16790
SS2=262145+23411
AC1=262145+25842
AC2=262145+25919
AR1=262145+27027
AR2=262145+27033
AR3=262145+28316
AR4=262145+28335
LS1=262145+29685
LS2=262145+29720
LT1=262145+31187
LT2=262145+31208
LT3=262145+31019
LT4=262145+31025
CP1=262145+30209
CP2=262145+30277
CP3=262145+30282
CP4=262145+30301
CP5=262145+30866
CP6=262145+30901
RE1=262145+24608
RE2=262145+24612
RE3=262145+24609
RB1=262145+12843
RB2=262145+12851
RB3=262145+15890
RB4=262145+12848
RB5=262145+12849
RB6=262145+12850
RB7=262145+12853
RB8=262145+12854
TTM1=262145+24345
BRE1=262145+21295
BRE2=262145+21547
BRE3=262145+21548
BRE4=262145+21549
BRE5=262145+21551
BRE6=262145+21552
LUN1=262145+31628
LUN2=262145+31655
HAS2=262145+12600
RS5=262145+24214
BS11=262145+24214				 
MS5=262145+12613

--Skin Changer  

NORS1=2639783+61

NORS2=2639783+48

--Request Services

REQS1=2793046 --Offset

--Lobby Switch

LOBS1=1575017
LOBS2=1574589	

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 e0 = false
 e1 = false
 e2 = false
 e3 = false
 e4 = false
 e5 = false
 e6 = false
 e7 = false
 e8 = false
 e9 = false
 e10 = false
 e11 = false
 e12 = false
 e13 = false
 e14 = false
 e15 = false
 e16 = false
 e17 = false
 e18 = false
 e19 = false
 e20 = false
 e21 = false
 e22 = false
 e23 = false
 e24 = false
 e25 = false
 e26 = false
 e27 = false
 e28 = false
 e29 = false
 e30 = false
 e31 = false
 e32 = false
 e33 = false
 e34 = false
 e35 = false
 e36 = false
 e37 = false
 e38 = false
 e39 = false
 e40 = false
 e41 = false
 e42 = false
 e43 = false
 e44 = false
 e45 = false
 e46 = false
 e47 = false
 e48 = false
 e49 = false
 e50 = false
 e51 = false
 e52 = false
 e53 = false

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Required Stats--
		
		MPX = PI 
		PI = stats.get_int("MPPLY_LAST_MP_CHAR") 
		if PI == 0 then MPX = "MP0_" else MPX = "MP1_" end
		ASS = script("appsecuroserv")
		GCS = script("gb_contraband_sell")
		GCB = script("gb_contraband_buy")
		AMW = script("am_mp_warehouse")
		GB = script("gb_gunrunning")
		FMC = script("fm_mission_controller")
		FMC20 = script("fm_mission_controller_2020") 
		FormatMoney = (function (n)
		n = tostring(n) return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "") end)
		freemodeglobal = 262145 
            fmC2020 = script("fm_mission_controller_2020")
            fmC = script("fm_mission_controller")
            function TP(x, y, z, yaw, roll, pitch)
            if localplayer:is_in_vehicle()
            then
            localplayer:get_current_vehicle():set_position(x, y, z)
            localplayer:get_current_vehicle():set_rotation(yaw, roll, pitch)
            else localplayer:set_position(x, y, z)
            localplayer:set_rotation(yaw, roll, pitch)
            end
            end 

            function smallPlayer()
            	if localplayer == nil then
		return nil
      	end
      	return localplayer:get_config_flag(223)
            end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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
                                                                                                                                 
                                                                                                                                 
                                                                                                                                 
                                                                                                                                 
          Resources used -> BIG Menu by BIGBOOM  
                         -> Ultimate Menu V10 1.66 by L7NEG                                                                                                                       
                         -> Ultimate controller  
                         -> Simple Manager by SLON                                                                                                       
                         -> RyzeKiddions.lua by Pichocles#0427  
                         -> API - Thank you kiddion <3 
                         
                         -> Complied & Editied By L7NEG 
--]]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
