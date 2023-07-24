
--[[SET NO CLIP CONTROLS BELOW
USE LINK BELOW TO FIND THE KEYCODE VALUES YOU NEED
https://keycodes.l7neg.tk/ ]]

go_up = 16
go_down = 17
go_forward = 38
go_back = 40
turn_left = 37
turn_right = 39
dec_speed = 109
inc_speed = 107

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG = menu.add_submenu("Ultimate Menu 1.67 By L7NEG")

local function Text(text)
	L7NEG:add_action(text,  function() end)
end

Text("-----------------------------------------------------")
Text("       ✅ Ultimate Menu 1.67 [V15] ✅ ")
Text("                   https://l7neg.tk               ")
Text("-----------------------------------------------------")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self = L7NEG:add_submenu("Self")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Uv0 = false
		local function SexChanger(On)
			if On then stats.set_int(MPX .. "ALLOW_GENDER_CHANGE", 52) globals.set_int(281050, 0)
			else stats.set_int(MPX .. "ALLOW_GENDER_CHANGE", 0) end end
	Self:add_toggle("Unlock «Change Gender»", function() return Uv0 end, function() Uv0 = not Uv0 SexChanger(Uv0) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_array_item("Online Session", {"Join Public", "Start New Public", "Invite Only", "Closed Crew Session", "Crew Session", "Closed Friend Session", "Find Friend Session", "Solo Session", "Leave Online"}, function() return xox_00 end, function(value) xox_00 = value if value == 1 then globals.set_int(1575020, 0) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 2 then globals.set_int(1575020, 1) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 3 then globals.set_int(1575020, 11) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 4 then globals.set_int(1575020, 2) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 5 then globals.set_int(1575020, 3) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 6 then globals.set_int(1575020, 6) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 7 then globals.set_int(1575020, 9) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 8 then globals.set_int(1575020, 8) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) elseif value == 9 then globals.set_int(1575020, -1) globals.set_int(1574589, 1) sleep(0.2) globals.set_int(1574589, 0) end end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_action("Heal Player", function() menu.heal_all() end)

GodModeState = false
	Self:add_toggle("God Mode", function()
		GodModeState = localplayer:get_godmode()
		return GodModeState
	end, function()
		GodModeState = not GodModeState
		localplayer:set_godmode(GodModeState)
	end)

Self:add_action("Suicide", function() menu.suicide_player() end)

Self:add_toggle("Small Player", function() smallPlayer() end, function(value) localplayer:set_config_flag(223, value) end)

Self:add_toggle("Passive Mode", function() return PassiveMode end, function() PassiveMode = not PassiveMode menu.set_passive(PassiveMode) end)
Self:add_toggle("Off Radar", function() return Offradar end, function() Offradar = not Offradar menu.set_offradar(Offradar) end)
Self:add_toggle("Out Of Sight Area", function() return OutOfSight end, function() OutOfSight = not OutOfSight menu.set_out_of_sight(OutOfSight) end)
Self:add_toggle("Reveal All Players", function() return RevealPlayers end, function() RevealPlayers = not RevealPlayers menu.set_reveal_player(RevealPlayers) end)
Self:add_toggle("Big Map", function() return BigMap end, function() BigMap = not BigMap menu.set_big_map(BigMap) end)
Self:add_toggle("Mobile Radio", function() return MobileRadio end, function() MobileRadio = not MobileRadio menu.set_mobile_radio(MobileRadio) end)
Self:add_action("Remove Orbital Cannon Cooldown", function() 
			stats.set_int(MPX .. "ORBITAL_CANNON_COOLDOWN", 0) end)

Self:add_action("Remove Transaction Error", function() for i = 4536677, 4536679 do globals.set_int(i, 0) end end)

Self:add_action("Refil Nightclub Popularity", function() stats.set_int(MPX .. "CLUB_POPULARITY", 1000) end)

Self:add_action("Clear Wanted Level", function() localplayer:set_wanted_level(0) end)

 Caps = Self:add_submenu("Set Wanted Level")
 Caps:add_action("Set 1 Star", function() localplayer:set_wanted_level(1) end)
 Caps:add_action("Set 2 Stars", function() localplayer:set_wanted_level(2) end)
 Caps:add_action("Set 3 Stars", function() localplayer:set_wanted_level(3) end)
 Caps:add_action("Set 4 Stars", function() localplayer:set_wanted_level(4) end)
 Caps:add_action("Set 5 Stars", function() localplayer:set_wanted_level(5) end)
 Caps:add_action("Set 6 Stars", function() localplayer:set_wanted_level(6) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_action("Refill Inventory/Armour", function()
	stats.set_int(MPX .. "NO_BOUGHT_YUM_SNACKS", 30)
      stats.set_int(MPX .. "NO_BOUGHT_HEALTH_SNACKS", 15)
      stats.set_int(MPX .. "NO_BOUGHT_EPIC_SNACKS", 5)
      stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 5)
      stats.set_int(MPX .. "NUMBER_OF_ORANGE_BOUGHT", 11)
      stats.set_int(MPX .. "NUMBER_OF_BOURGE_BOUGHT", 10)
      stats.set_int(MPX .. "NUMBER_OF_SPRUNK_BOUGHT", 10)
      stats.set_int(MPX .. "CIGARETTES_BOUGHT", 20)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_1_COUNT", 10)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_2_COUNT", 10)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_3_COUNT", 10)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_4_COUNT", 10)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_5_COUNT", 10)
      stats.set_int(MPX .. "BREATHING_APPAR_BOUGHT", 20) 
end) 

Self:add_action("Refill Inv/Armour x1000", function()
 stats.set_int(MPX .. "NO_BOUGHT_YUM_SNACKS", 1000)
 stats.set_int(MPX .. "NO_BOUGHT_HEALTH_SNACKS", 1000)
 stats.set_int(MPX .. "NO_BOUGHT_EPIC_SNACKS", 1000)
 stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
 stats.set_int(MPX .. "NUMBER_OF_ORANGE_BOUGHT", 1000)
 stats.set_int(MPX .. "NUMBER_OF_BOURGE_BOUGHT", 1000)
 stats.set_int(MPX .. "NUMBER_OF_SPRUNK_BOUGHT", 1000)
 stats.set_int(MPX .. "CIGARETTES_BOUGHT", 1000)
 stats.set_int(MPX .. "MP_CHAR_ARMOUR_1_COUNT", 1000)
 stats.set_int(MPX .. "MP_CHAR_ARMOUR_2_COUNT", 1000)
 stats.set_int(MPX .. "MP_CHAR_ARMOUR_3_COUNT", 1000)
 stats.set_int(MPX .. "MP_CHAR_ARMOUR_4_COUNT", 1000)
 stats.set_int(MPX .. "MP_CHAR_ARMOUR_5_COUNT", 1000)
 stats.set_int(MPX .. "BREATHING_APPAR_BOUGHT", 1000)
 end)

statMenu = Self:add_submenu("Online Stats Editor Menu")
normalstat = statMenu:add_submenu("Character Data Editor Menu")
distancestat = statMenu:add_submenu("Distance Data Editor Menu")
timestat = statMenu:add_submenu("Time Data Editor Menu")

normalstat:add_int_range("Earned Money", 500000, 0, 1000000000, function() return stats.get_int("MPPLY_TOTAL_EVC") end, function(value) stats.set_int("MPPLY_TOTAL_EVC",value) end)
normalstat:add_int_range("Spent Money", 500000, 0, 1000000000, function() return stats.get_int("MPPLY_TOTAL_SVC") end, function(value) stats.set_int("MPPLY_TOTAL_SVC",value) end)
normalstat:add_int_range("Players Killed", 10, 0, 999999, function() return stats.get_int("MPPLY_KILLS_PLAYERS") end, function(value) stats.set_int("MPPLY_KILLS_PLAYERS", value) end)
normalstat:add_int_range("Deatsh per player", 10, 0, 999999, function() return stats.get_int("MPPLY_DEATHS_PLAYER") end, function(value) stats.set_int("MPPLY_DEATHS_PLAYER", value) end)
normalstat:add_float_range("PvP K/D Ratio", 0.01, 0, 9999, function() return stats.get_float("MPPLY_KILL_DEATH_RATIO") end, function(value) stats.set_float("MPPLY_KILL_DEATH_RATIO", value) end)
normalstat:add_int_range("Deathmatches Published", 10, 0, 999999, function() return stats.get_int("MPPLY_AWD_FM_CR_DM_MADE") end, function(value) stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", value) end)
normalstat:add_int_range("Races Published", 10, 0, 999999, function() return stats.get_int("MPPLY_AWD_FM_CR_RACES_MADE") end, function(value) stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", value) end)
normalstat:add_int_range("Screenshots Published", 10, 0, 999999, function() return stats.get_int("MPPLY_NUM_CAPTURES_CREATED") end, function(value) stats.set_int("MPPLY_NUM_CAPTURES_CREATED", value) end)
normalstat:add_int_range("LTS Published", 10, 0, 999999, function() return stats.get_int("MPPLY_LTS_CREATED") end, function(value) stats.set_int("MPPLY_LTS_CREATED", value) end)
normalstat:add_int_range("Persons who have played your misions", 10, 0, 999999, function() return stats.get_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP") end, function(value) stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", value) end)
normalstat:add_int_range("Likes to missions", 10, 0, 999999, function() return stats.get_int("MPPLY_AWD_FM_CR_MISSION_SCORE") end, function(value) stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", value) end)
normalstat:add_action("-{Change Session to apply}", function() end)

distancestat:add_float_range("Traveled (metters)", 10.00, 0.00, 99999.00, function() return stats.get_float("MPPLY_CHAR_DIST_TRAVELLED")/1000 end, function(value) stats.set_float("MPPLY_CHAR_DIST_TRAVELLED", value*1000) end)
distancestat:add_float_range("Swiming", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_SWIMMING")/1000 end, function(value) stats.set_float(MPX .. "DIST_SWIMMING", value*1000) end)
distancestat:add_float_range("Walking", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_WALKING")/1000 end, function(value) stats.set_float(MPX .. "DIST_WALKING", value*1000) end)
distancestat:add_float_range("Running", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_RUNNING")/1000 end, function(value) stats.set_float(MPX .. "DIST_RUNNING", value*1000) end)
distancestat:add_float_range("Highest fall without dying", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "LONGEST_SURVIVED_FREEFALL") end, function(value) stats.set_float(MPX .. "LONGEST_SURVIVED_FREEFALL", value) end)
distancestat:add_float_range("Driving Cars", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_CAR")/1000 end, function(value) stats.set_float(MPX .. "DIST_CAR", value*1000) end)
distancestat:add_float_range("Driving motorbikes", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_BIKE")/1000 end, function(value) stats.set_float(MPX .. "DIST_BIKE", value*1000) end)
distancestat:add_float_range("Flying Helicopters", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_HELI")/1000 end, function(value) stats.set_float(MPX .. "DIST_HELI", value*1000) end)
distancestat:add_float_range("Flying Planes", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_PLANE")/1000 end, function(value) stats.set_float(MPX .. "DIST_PLANE", value*1000) end)
distancestat:add_float_range("Driving Botes", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_BOAT")/1000 end, function(value) stats.set_float(MPX .. "DIST_BOAT", value*1000) end)
distancestat:add_float_range("Driving ATVs", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_QUADBIKE")/1000 end, function(value) stats.set_float(MPX .. "DIST_QUADBIKE", value*1000) end)
distancestat:add_float_range("Driving Bicycles", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "DIST_BICYCLE")/1000 end, function(value) stats.set_float(MPX .. "DIST_BICYCLE", value*1000) end)
distancestat:add_float_range("Longest Front Willie", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "LONGEST_STOPPIE_DIST")/1000 end, function(value) stats.set_float(MPX .. "LONGEST_STOPPIE_DIST", value*1000) end)
distancestat:add_float_range("Longest Willie", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "LONGEST_WHEELIE_DIST")/1000 end, function(value) stats.set_float(MPX .. "LONGEST_WHEELIE_DIST", value*1000) end)
distancestat:add_float_range("Largest driving without crashing", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "LONGEST_DRIVE_NOCRASH")/1000 end, function(value) stats.set_float(MPX .. "LONGEST_DRIVE_NOCRASH", value*1000) end)
distancestat:add_float_range("Longest Jump", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "FARTHEST_JUMP_DIST") end, function(value) stats.set_float(MPX .. "FARTHEST_JUMP_DIST", value) end)
distancestat:add_float_range("Longest Jump in Vehicle", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "HIGHEST_JUMP_REACHED") end, function(value) stats.set_float(MPX .. "HIGHEST_JUMP_REACHED", value) end)
distancestat:add_float_range("Highest Hidraulic Jump", 10.00, 0.00, 99999.00, function() return stats.get_float(MPX .. "LOW_HYDRAULIC_JUMP") end, function(value) stats.set_float(MPX .. "LOW_HYDRAULIC_JUMP", value) end)

timestat:add_int_range("Time in FP", 1, 0, 24, function() return math.floor(stats.get_int("MP_FIRST_PERSON_CAM_TIME")/86400000) end, function(value) stats.set_int("MP_FIRST_PERSON_CAM_TIME", value*86400000) end)
timestat:add_int_range("Time In Gta V Online", 1, 0, 24, function() return math.floor(stats.get_int("MP_PLAYING_TIME")/86400000) end, function(value) stats.set_int("MP_PLAYING_TIME", value*86400000) end)
timestat:add_int_range("Time in DeathMatches", 1, 0, 24, function() return math.floor(stats.get_int("MPPLY_TOTAL_TIME_SPENT_DEATHMAT")/86400000) end, function(value) stats.set_int("MPPLY_TOTAL_TIME_SPENT_DEATHMAT", value*86400000) end)
timestat:add_int_range("Time in races", 1, 0, 24, function() return math.floor(stats.get_int("MPPLY_TOTAL_TIME_SPENT_RACES")/86400000) end, function(value) stats.set_int("MPPLY_TOTAL_TIME_SPENT_RACES", value*86400000) end)
timestat:add_int_range("Time in creator mode", 1, 0, 24, function() return math.floor(stats.get_int("MPPLY_TOTAL_TIME_MISSION_CREATO")/86400000) end, function(value) stats.set_int("MPPLY_TOTAL_TIME_MISSION_CREATO", value*86400000) end)
timestat:add_int_range("Longest alone sesion", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "LONGEST_PLAYING_TIME")/86400000) end, function(value) stats.set_int(MPX .. "LONGEST_PLAYING_TIME", value*86400000) end)
timestat:add_int_range("Time with character", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TOTAL_PLAYING_TIME")/86400000) end, function(value) stats.set_int(MPX .. "TOTAL_PLAYING_TIME", value*86400000) end)
timestat:add_int_range("Average Time in sesion", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "AVERAGE_TIME_PER_SESSON")/86400000) end, function(value) stats.set_int(MPX .. "AVERAGE_TIME_PER_SESSON", value*86400000) end)
timestat:add_int_range("Time swiming", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_SWIMMING")/86400000) end, function(value) stats.set_int(MPX .. "TIME_SWIMMING", value*86400000) end)
timestat:add_int_range("Time under water", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_UNDERWATER")/86400000) end, function(value) stats.set_int(MPX .. "TIME_UNDERWATER", value*86400000) end)
timestat:add_int_range("Time walking", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_WALKING")/86400000) end, function(value) stats.set_int(MPX .. "TIME_WALKING", value*86400000) end)
timestat:add_int_range("Time in coverage", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_IN_COVER")/86400000) end, function(value) stats.set_int(MPX .. "TIME_IN_COVER", value*86400000) end)
timestat:add_int_range("Time with stars", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TOTAL_CHASE_TIME")/86400000) end, function(value) stats.set_int(MPX .. "TOTAL_CHASE_TIME", value*86400000) end)
timestat:add_float_range("Last wanted duration", 1.0, 0.0, 24.0, function() return math.floor(stats.get_float(MPX .. "LAST_CHASE_TIME")/86400000) end, function(value) stats.set_float(MPX .. "LAST_CHASE_TIME", value*86400000) end)
timestat:add_float_range("Longest wanted duration", 1.0, 0.0, 24.0, function() return math.floor(stats.get_float(MPX .. "LONGEST_CHASE_TIME")/86400000) end, function(value) stats.set_float(MPX .. "LONGEST_CHASE_TIME", value*86400000) end)
timestat:add_float_range("5 Stars", 1.0, 0.0, 24.0, function() return math.floor(stats.get_float(MPX .. "TOTAL_TIME_MAX_STARS")/86400000) end, function(value) stats.set_float(MPX .. "TOTAL_TIME_MAX_STARS", value*86400000) end)
timestat:add_action("Time Bassicly", function() end)
timestat:add_int_range("Driving Cars", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_DRIVING_CAR")/86400000) end, function(value) stats.set_int(MPX .. "TIME_DRIVING_CAR", value*86400000) end)
timestat:add_int_range("Driving Motorbike", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_DRIVING_BIKE")/86400000) end, function(value) stats.set_int(MPX .. "TIME_DRIVING_BIKE", value*86400000) end)
timestat:add_int_range("Driving Helicopters", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_DRIVING_HELI")/86400000) end, function(value) stats.set_int(MPX .. "TIME_DRIVING_HELI", value*86400000) end)
timestat:add_int_range("Driving Planes", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_DRIVING_PLANE")/86400000) end, function(value) stats.set_int(MPX .. "TIME_DRIVING_PLANE", value*86400000) end)
timestat:add_int_range("Driving Botes", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_DRIVING_BOAT")/86400000) end, function(value) stats.set_int(MPX .. "TIME_DRIVING_BOAT", value*86400000) end)
timestat:add_int_range("Conduciendo ATVs", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_DRIVING_QUADBIKE")/86400000) end, function(value) stats.set_int(MPX .. "TIME_DRIVING_QUADBIKE", value*86400000) end)
timestat:add_int_range("Driving MotorBikes", 1, 0, 24, function() return math.floor(stats.get_int(MPX .. "TIME_DRIVING_BICYCLE")/86400000) end, function(value) stats.set_int(MPX .. "TIME_DRIVING_BICYCLE", value*86400000) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[                                                                                                                                                                        
PPPPPPPPPPPPPPPPP   lllllll                                                                                         LLLLLLLLLLL               iiii                            tttt          
P::::::::::::::::P  l:::::l                                                                                         L:::::::::L              i::::i                        ttt:::t          
P::::::PPPPPP:::::P l:::::l                                                                                         L:::::::::L               iiii                         t:::::t          
PP:::::P     P:::::Pl:::::l                                                                                         LL:::::::LL                                            t:::::t          
  P::::P     P:::::P l::::l   aaaaaaaaaaaaa   yyyyyyy           yyyyyyy    eeeeeeeeeeee    rrrrr   rrrrrrrrr          L:::::L               iiiiiii     ssssssssss   ttttttt:::::ttttttt    
  P::::P     P:::::P l::::l   a::::::::::::a   y:::::y         y:::::y   ee::::::::::::ee  r::::rrr:::::::::r         L:::::L               i:::::i   ss::::::::::s  t:::::::::::::::::t    
  P::::PPPPPP:::::P  l::::l   aaaaaaaaa:::::a   y:::::y       y:::::y   e::::::eeeee:::::eer:::::::::::::::::r        L:::::L                i::::i ss:::::::::::::s t:::::::::::::::::t    
  P:::::::::::::PP   l::::l            a::::a    y:::::y     y:::::y   e::::::e     e:::::err::::::rrrrr::::::r       L:::::L                i::::i s::::::ssss:::::stttttt:::::::tttttt    
  P::::PPPPPPPPP     l::::l     aaaaaaa:::::a     y:::::y   y:::::y    e:::::::eeeee::::::e r:::::r     r:::::r       L:::::L                i::::i  s:::::s  ssssss       t:::::t          
  P::::P             l::::l   aa::::::::::::a      y:::::y y:::::y     e:::::::::::::::::e  r:::::r     rrrrrrr       L:::::L                i::::i    s::::::s            t:::::t          
  P::::P             l::::l  a::::aaaa::::::a       y:::::y:::::y      e::::::eeeeeeeeeee   r:::::r                   L:::::L                i::::i       s::::::s         t:::::t          
  P::::P             l::::l a::::a    a:::::a        y:::::::::y       e:::::::e            r:::::r                   L:::::L         LLLLLL i::::i ssssss   s:::::s       t:::::t    tttttt
PP::::::PP          l::::::la::::a    a:::::a         y:::::::y        e::::::::e           r:::::r                 LL:::::::LLLLLLLLL:::::Li::::::is:::::ssss::::::s      t::::::tttt:::::t
P::::::::P          l::::::la:::::aaaa::::::a          y:::::y          e::::::::eeeeeeee   r:::::r                 L::::::::::::::::::::::Li::::::is::::::::::::::s       tt::::::::::::::t
P::::::::P          l::::::l a::::::::::aa:::a        y:::::y            ee:::::::::::::e   r:::::r                 L::::::::::::::::::::::Li::::::i s:::::::::::ss          tt:::::::::::tt
PPPPPPPPPP          llllllll  aaaaaaaaaa  aaaa       y:::::y               eeeeeeeeeeeeee   rrrrrrr                 LLLLLLLLLLLLLLLLLLLLLLLLiiiiiiii  sssssssssss              ttttttttttt  
                                                    y:::::y                                                                                                                                 
                                                   y:::::y                                                                                                                                  
                                                  y:::::y                                                                                                                                   
                                                 y:::::y                                                                                                                                    
                                                yyyyyyy                                                                                                                                                                                                                                                                                                                             
--]]

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local Config = {}
Config.SubmenuStyle = false
Config.SlamType = 1
Config.SlamHeight = 1
Config.SlamTypes = {"Rhino", "Khanjali", "Halftrack"}
Config.VehicleSpawnGlobal = 2639889
Config.VehicleTypes = {}
Config.VehicleTypes["Super"] = {"Krieger", "Prototipo", "T20"}
Config.VehicleTypes["Sports"] = {"Kuruma", "Kuruma2"}
Config.VehicleTypes["Sports Classic"] = {"Toreador", "Artdent"}
Config.VehicleTypes["Millitary"] = {"Rhino", "Khanjali", "Halftrack"}
Config.VehicleTypes["Bikes"] = {"Oppressor", "Oppressor2", "Akuma"}
Config.VehicleTypes["Planes"] = {"Hydra", "Lazer", "Titan", "Cargoplane"}
 
-- Function definitions
local function null() end
 
local function Text(submenu, text)
	if (submenu ~= nil) then
		submenu:add_action(text, null)
	else
		menu.add_action(text, null)
	end
end
 
local function sqrt(i)
	return math.sqrt(i)
end
 
local function DistanceToSqr(vec1, vec2)
	return ((vec2.x - vec1.x)^2) + ((vec2.y - vec1.y)^2) + ((vec2.z - vec1.z)^2)
end
 
local function Distance(vec1, vec2)
	return sqrt(DistanceToSqr(vec1, vec2))
end
 
local function floor(num)
	return math.floor(num)
end
 
local function clamp(num, min, max)
	if num > max then return max elseif num < min then return min else return num end
end
-- Player / Ped functions
 
local function IsPlayer(ped)
	if ped == nil or ped:get_pedtype() >= 4 then
		return false
	end
	return true
end
 
local function IsNPC(ped)
	if ped == nil or ped:get_pedtype() < 4 then
		return false
	end
	return true
end
 
local function IsModder(ply)
	if not IsPlayer(ply) then return false end
	
	if ply:get_max_health() < 100 then return true end
	if ply:is_in_vehicle() and ply:get_godmode() then return true end
	if ply:get_run_speed() > 1.0 or ply:get_swim_speed() > 1.0 then return true end
 
	return false
end
 
local function GetPlayerCount()
	return player.get_number_of_players()
end
 
local function createVehicle(modelhash, pos)
	globals.set_int(Config.VehicleSpawnGlobal + 44, modelhash)
	globals.set_float(Config.VehicleSpawnGlobal + 40, pos.x)
	globals.set_float(Config.VehicleSpawnGlobal + 41, pos.y)
	globals.set_float(Config.VehicleSpawnGlobal + 42, pos.z)
	globals.set_boolean(Config.VehicleSpawnGlobal + 39, true)
end
 
-- Action functions
 
local function GiveVehicle(ply, model)
	if not ply or ply == nil then return end 
	local pos = ply:get_position()
	local heading = ply:get_heading()
	createVehicle(joaat(model), pos + heading * 10)
end
 
local function TeleportToPlayer(ply, seconds)
	if not ply or ply == nil then return end 
	local pos = ply:get_position()
	if seconds then
		if localplayer:is_in_vehicle() then return end
 
		local oldpos = localplayer:get_position() 
	
		localplayer:set_freeze_momentum(true) 
		localplayer:set_config_flag(292,true)
		localplayer:set_position(pos)
	
		sleep(seconds)
	
		localplayer:set_position(oldpos)
		localplayer:set_freeze_momentum(false) 
		localplayer:set_config_flag(292,false)
		return
	end
 
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(pos)
	else
		localplayer:get_current_vehicle():set_position(pos)
	end
end
 
local function TeleportVehiclesToPlayer(ply)
	if not ply or ply == nil then return end 
 
	local pos = ply:get_position()
	local currentvehicle = nil 
 
	if localplayer:is_in_vehicle() then
		currentvehicle = localplayer:get_current_vehicle()
	end
 
	for veh in replayinterface.get_vehicles() do
		if not currentvehicle or currentvehicle ~= veh then
			veh:set_position(pos)
		end
	end
end
 
local function TeleportClosestVehicleToPlayer(ply)
	if not ply or ply == nil then return end 
 
	local pos = ply:get_position()
	local veh = localplayer:get_nearest_vehicle()
	if not veh then return end
 
	veh:set_position(pos)
end
 
local function TeleportPedsToPlayer(ply, dead)
	if not ply or ply == nil then return end 
 
	local pos = ply:get_position()
	for ped in replayinterface.get_peds() do
		if IsNPC(ped) then
			if not ped:is_in_vehicle() then
				if dead then 
					ped:set_health(0)
				end
				ped:set_position(pos)
			end
		end
	end
end
 
local function ExplodePlayer(ply)
	if not ply or ply == nil then return end 
 
	local pos = ply:get_position()
	local currentvehicle = nil 
 
	if localplayer:is_in_vehicle() then
		currentvehicle = localplayer:get_current_vehicle()
	end
 
	for veh in replayinterface.get_vehicles() do
		if not currentvehicle or currentvehicle ~= veh then
			veh:set_rotation(vector3(0,0,180))
			veh:set_health(-1)
			veh:set_position(pos)
		end
	end
end
 
local function LaunchPlayer(ply)
	if not ply or ply == nil then return end 
 
	local currentvehicle = nil 
 
	if localplayer:is_in_vehicle() then
		currentvehicle = localplayer:get_current_vehicle()
	end
	local i = 0
	for veh in replayinterface.get_vehicles() do
		if not currentvehicle or currentvehicle ~= veh then
			local pos = ply:get_position()
			veh:set_rotation(vector3(0,0,0))
			veh:set_gravity(-100)
			veh:set_position(vector3(pos.x, pos.y, pos.z - 20))
		end
	end
	sleep(1)
	for veh in replayinterface.get_vehicles() do
		if not currentvehicle or currentvehicle ~= veh then
			local pos = ply:get_position()
			veh:set_gravity(9.8)
		end
	end
end
 
local function SlamPlayer(ply, model)
	if not ply or ply == nil then return end 
 
	if model then 
		createVehicle(joaat(model), ply:get_position() + vector3(0,0,10 * Config.SlamHeight))
		return
	end
 
	local currentvehicle = nil 
 
	if localplayer:is_in_vehicle() then
		currentvehicle = localplayer:get_current_vehicle()
	end
	local i = 0
	for veh in replayinterface.get_vehicles() do
		if not currentvehicle or currentvehicle ~= veh then
			local pos = ply:get_position()
			veh:set_rotation(vector3(0,0,0))
			veh:set_gravity(10000)
			veh:set_position(vector3(pos.x, pos.y, pos.z + 10 * Config.SlamHeight))
		end
	end
	sleep(1)
	for veh in replayinterface.get_vehicles() do
		if not currentvehicle or currentvehicle ~= veh then
			local pos = ply:get_position()
			veh:set_gravity(9.8)
		end
	end
end
 
-- Player option 
local selectedplayer = -1
 
local function f_p_o(ply_id, ply, ply_name) -- Format Player Option Text
	local text = ""
 
	if (player.get_player_ped(ply_id) == nil) then return "**Invalid**" end
 
	-- Player Name
	if ply == localplayer then
		text = text.."YOU"
	else
		text = text..ply_name
	end
 
	if IsModder(ply) then
		text = text.."*"
	end
 
	-- Is In GodMode, if not then Player Health
	if ply:get_godmode() then
		text = text.." | God"
	else
		local max_hp = ply:get_max_health()
		text = text.." | "..floor(clamp((ply:get_health() - 100), 0, max_hp)/(max_hp - 100)*100).."\u{2665}"
		local armour = ply:get_armour()
		if armour > 0 then
			text = text.." | "..floor(ply:get_armour()).."\u{1f455}"
		end
	end
 
	-- Is In Vehicle
	if ply:is_in_vehicle() then
		text = text.." | \u{1F697}"
	end
 
	-- Player Wanted Level
	local wanted = ply:get_wanted_level()
 
	if wanted > 0 then
		text = text.." | "..wanted.."\u{2730}"
	end
	-- Player's Distance From You
	text = text.." | "..floor(Distance(ply:get_position(), localplayer:get_position())).." m"
	
	return text
end
 
local function add_player_option(submenu, ply_id, ply, ply_name)
	
	local text = f_p_o(ply_id, ply, ply_name)
 
	local d = ply_id
 
	if (submenu ~= nil) then
		submenu:add_bare_item(text, function() return f_p_o(ply_id, ply, ply_name).."|"..(selectedplayer == ply_id and "\u{2713}" or "\u{25A1}")  end, function() selectedplayer = d end, null, null)
	else
		menu.add_bare_item(text, function() return f_p_o(ply_id, ply, ply_name).."|"..(selectedplayer == ply_id and "\u{2713}" or "\u{25A1}") end, function() selectedplayer = d end, null, null)
	end
end
 
local function add_info_option(submenu, text, funcget, forceplayer)
 
	local func = function() 
		local ply = player.get_player_ped(forceplayer and forceplayer or selectedplayer)
		if not ply then return text..": **Invalid**" end
 
		return text..": "..funcget(ply)
	end
 
	if (submenu ~= nil) then
		submenu:add_bare_item(text..": ", func, null, null, null)
	else
		menu.add_bare_item(text..": ", func, null, null, null)
	end
end
 
-- Building Player List
local L7NEGPL = nil
local was_opened = true
 
local function BuildListSub() -- Deprecated for the moment
	L7NEGPL:add_bare_item("---Player List, "..GetPlayerCount().." Players---", function() was_opened = true return "---L7NEG's Player List, "..GetPlayerCount().." Players---" end, null, null, null)
 
	local popt = {}
	for i = 0, 31 do
		local ply = player.get_player_ped(i)
		if ply then 
			popt[i] = L7NEGPL:add_submenu(f_p_o(i, ply, player.get_player_name(i))) -- add_player_option(L7NEGPL, i, ply, player.get_player_name(i))
			
			add_info_option(popt[i], "Player", function() selectedplayer = i return player.get_player_name(i) end, i)
			local subtp = popt[i]:add_submenu("Teleport Options")
			local subtroll = popt[i]:add_submenu("Trolling Options")
			local subinfo = popt[i]:add_submenu("Player Info")
		
			-- Teleport Options
			add_info_option(subtp, "Player", function() return player.get_player_name(selectedplayer) end)
			subtp:add_action("Teleport To Player", function() TeleportToPlayer(player.get_player_ped(selectedplayer)) end)
			subtp:add_int_range("Teleport To Player Then Back", 1, 1, 5, function() return 2 end, function(n) TeleportToPlayer(player.get_player_ped(selectedplayer), n) end)
			subtp:add_action("Teleport Closest Vehicle To Player", function() TeleportClosestVehicleToPlayer(player.get_player_ped(selectedplayer)) end)
			subtp:add_action("Teleport Vehicles To Player", function() TeleportVehiclesToPlayer(player.get_player_ped(selectedplayer)) end)
			subtp:add_action("Teleport Peds To Player", function() TeleportPedsToPlayer(player.get_player_ped(selectedplayer)) end)
			subtp:add_action("Teleport Dead Peds To Player", function() TeleportPedsToPlayer(player.get_player_ped(selectedplayer), true) end)
		
			--Trolling Options
			add_info_option(subtroll, "Player", function() return player.get_player_name(selectedplayer) end)
			subtroll:add_action("Launch Player", function() LaunchPlayer(player.get_player_ped(selectedplayer)) end)
			subtroll:add_action("Slam Player", function() SlamPlayer(player.get_player_ped(selectedplayer)) end)
			subtroll:add_action("Explode Player", function() ExplodePlayer(player.get_player_ped(selectedplayer)) end)
			subtroll:add_array_item("Slam Player Using", Config.SlamTypes, function() return Config.SlamType end, function(value) Config.SlamType = value SlamPlayer(player.get_player_ped(selectedplayer), Config.SlamTypes[value]) end)
			subtroll:add_int_range("Slam Height", 1, 0, 10, function() return Config.SlamHeight end, function(v) Config.SlamHeight = v end)

			-- Info Panel
		
			add_info_option(subinfo, "Player", function() return player.get_player_name(selectedplayer) end)
			add_info_option(subinfo, "Distance from you", function(p) return floor(Distance(p:get_position(), localplayer:get_position())).." m" end)
			add_info_option(subinfo, "Health", function(p) return floor(clamp((p:get_health() - 100), 0, p:get_max_health())/(p:get_max_health() - 100)*100) end)
			add_info_option(subinfo, "Armour", function(p) return floor(p:get_armour()) end)
			add_info_option(subinfo, "Is In Vehicle", function(p) return (p:is_in_vehicle() and "Yes" or "No") end)
			add_info_option(subinfo, "Vehicle Health", function(p) return ((p:is_in_vehicle() and p:get_current_vehicle() ~= nil) and floor(p:get_current_vehicle():get_health()/(p:get_current_vehicle():get_max_health())*100) or 0) end)
			add_info_option(subinfo, "Is In GodMode", function(p) return (p:get_godmode() and "Yes" or "No") end)
			add_info_option(subinfo, "Is Modder", function(p) return (IsModder(p) and "Yes" or "No") end)
			add_info_option(subinfo, "X", function(p) return p:get_position().x end)
			add_info_option(subinfo, "Y", function(p) return p:get_position().y end)
			add_info_option(subinfo, "Z", function(p) return p:get_position().z end)
		end
	end
end
 
local function BuildList()
	L7NEGPL:add_bare_item("---Player List, "..GetPlayerCount().." Players---", function() was_opened = true return "---Player List, "..GetPlayerCount().." Players---" end, null, null, null)
 
	for i = 0, 31 do
		local ply = player.get_player_ped(i)
		if ply then 
			add_player_option(L7NEGPL, i, ply, player.get_player_name(i))
		end
	end
 
	Text(L7NEGPL, "---End---")
 
	local subtp = L7NEGPL:add_submenu("Teleport Options")
	local subtroll = L7NEGPL:add_submenu("Trolling Options")
	local subinfo = L7NEGPL:add_submenu("Player Info")
 
	-- Teleport Options
	add_info_option(subtp, "Player", function() return player.get_player_name(selectedplayer) end)
	subtp:add_action("Teleport To Player", function() TeleportToPlayer(player.get_player_ped(selectedplayer)) end)
	subtp:add_int_range("Teleport To Player Then Back", 1, 1, 5, function() return 2 end, function(n) TeleportToPlayer(player.get_player_ped(selectedplayer), n) end)
	subtp:add_action("Teleport Closest Vehicle To Player", function() TeleportClosestVehicleToPlayer(player.get_player_ped(selectedplayer)) end)
	subtp:add_action("Teleport Vehicles To Player", function() TeleportVehiclesToPlayer(player.get_player_ped(selectedplayer)) end)
	subtp:add_action("Teleport Peds To Player", function() TeleportPedsToPlayer(player.get_player_ped(selectedplayer)) end)
	subtp:add_action("Teleport Dead Peds To Player", function() TeleportPedsToPlayer(player.get_player_ped(selectedplayer), true) end)
 
	--Trolling Options
	add_info_option(subtroll, "Player", function() return player.get_player_name(selectedplayer) end)
	subtroll:add_action("Launch Player", function() LaunchPlayer(player.get_player_ped(selectedplayer)) end)
	subtroll:add_action("Slam Player", function() SlamPlayer(player.get_player_ped(selectedplayer)) end)
	subtroll:add_action("Explode Player", function() ExplodePlayer(player.get_player_ped(selectedplayer)) end)
	subtroll:add_array_item("Slam Player Using", Config.SlamTypes, function() return Config.SlamType end, function(value) Config.SlamType = value SlamPlayer(player.get_player_ped(selectedplayer), Config.SlamTypes[value]) end)
	subtroll:add_int_range("Slam Height", 1, 0, 10, function() return Config.SlamHeight end, function(v) Config.SlamHeight = v end)
	
	-- Info Panel
 
	add_info_option(subinfo, "Player", function() return player.get_player_name(selectedplayer) end)
	add_info_option(subinfo, "Distance from you", function(p) return floor(Distance(p:get_position(), localplayer:get_position())).." m" end)
	add_info_option(subinfo, "Health", function(p) return floor(clamp((p:get_health() - 100), 0, p:get_max_health())/(p:get_max_health() - 100)*100) end)
	add_info_option(subinfo, "Armour", function(p) return floor(p:get_armour()) end)
	add_info_option(subinfo, "Is In Vehicle", function(p) return (p:is_in_vehicle() and "Yes" or "No") end)
	add_info_option(subinfo, "Vehicle Health", function(p) return ((p:is_in_vehicle() and p:get_current_vehicle() ~= nil) and floor(p:get_current_vehicle():get_health()/(p:get_current_vehicle():get_max_health())*100) or 0) end)
	add_info_option(subinfo, "Is In GodMode", function(p) return (p:get_godmode() and "Yes" or "No") end)
	add_info_option(subinfo, "Is Modder", function(p) return (IsModder(p) and "Yes" or "No") end)
	add_info_option(subinfo, "X", function(p) return p:get_position().x end)
	add_info_option(subinfo, "Y", function(p) return p:get_position().y end)
	add_info_option(subinfo, "Z", function(p) return p:get_position().z end)
end
 
-- List Updater
 
local function Update()
	L7NEGPL:clear() 
	if Config.SubmenuStyle then 
		BuildListSub() 
	else 
		BuildList() 
	end
end

L7NEGPL = L7NEG:add_submenu("Online Players", Update)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGWEAPON = L7NEG:add_submenu("Weapons")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

VehiclesM= L7NEG:add_submenu("Vehicle")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RMenu = L7NEG:add_submenu("Recovery")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RMenu:add_action("Unlock Hidden Car And Weapon Skins", function() stats.set_int("MPPLY_XMASLIVERIES", -1) for i = 1, 20 do stats.set_int("MPPLY_XMASLIVERIES"..i, -1) end end)

RMenu:add_action("Unlock All Flight School", function() stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100) for i = 0, 9 do stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_"..i, -1) stats.set_int(MPX .. "PILOT_SCHOOL_MEDAL_"..i, -1) stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_"..i, true) end end)

RMenu:add_action("Unlock All Bunker Shooting Range", function() stats.set_int(MPX .. "SR_HIGHSCORE_1", 690) stats.set_int(MPX .. "SR_HIGHSCORE_2", 1860) stats.set_int(MPX .. "SR_HIGHSCORE_3", 2690) stats.set_int(MPX .. "SR_HIGHSCORE_4", 2660) stats.set_int(MPX .. "SR_HIGHSCORE_5", 2650) stats.set_int(MPX .. "SR_HIGHSCORE_6", 450) stats.set_int(MPX .. "SR_TARGETS_HIT", 269) stats.set_int(MPX .. "SR_WEAPON_BIT_SET", -1) stats.set_bool(MPX .. "SR_TIER_1_REWARD", true) stats.set_bool(MPX .. "SR_TIER_3_REWARD", true) stats.set_bool(MPX .. "SR_INCREASE_THROW_CAP", true) end)


RMenu:add_action("Unlock All Bunker Research", function()
for j = 0, 63 do
	stats.set_bool_masked(MPX .. "DLCGUNPSTAT_BOOL0", true, j, MPX)
	stats.set_bool_masked(MPX .. "DLCGUNPSTAT_BOOL1", true, j, MPX)
	stats.set_bool_masked(MPX .. "DLCGUNPSTAT_BOOL2", true, j, MPX)
	stats.set_bool_masked(MPX .. "GUNTATPSTAT_BOOL0", true, j, MPX)
	stats.set_bool_masked(MPX .. "GUNTATPSTAT_BOOL1", true, j, MPX)
	stats.set_bool_masked(MPX .. "GUNTATPSTAT_BOOL2", true, j, MPX)
	stats.set_bool_masked(MPX .. "GUNTATPSTAT_BOOL3", true, j, MPX)
	stats.set_bool_masked(MPX .. "GUNTATPSTAT_BOOL4", true, j, MPX)
	stats.set_bool_masked(MPX .. "GUNTATPSTAT_BOOL5", true, j, MPX)
end
local bitSize = 8 for j = 0, 64 / bitSize - 1 do
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT0", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT1", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT2", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT3", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT4", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT5", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT6", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT7", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT8", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT9", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT10", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT11", -1, j * bitSize, bitSize)
 stats.set_masked_int(MPX .. "GUNRPSTAT_INT12", -1, j * bitSize, bitSize)
	end
end)

RMenu:add_action("Unlock All Tattos", function() stats.set_int(mpx .. "TATTOO_FM_CURRENT_32", -1) for i = 0, 47 do stats.set_int(mpx .. "TATTOO_FM_UNLOCKS_"..i, -1) end end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AWRMenu = RMenu:add_submenu("Arena War Recovery Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AWRMenu:add_action("Unlock Colored Headlights", function()
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 18) -- Blue Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 19) -- Electric Blue Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 20) -- Mint Green Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 21) -- Lime Green Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 22) -- Yellow Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 23) -- Golden Shower Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 24) -- Orange Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 25) -- Red Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 26) -- Pony Pink Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 27) -- Hot Pink Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 28) -- Purple Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 29) -- Blacklight Lights
end)

AWRMenu:add_action("Unlock Trade Prices for Colored Headlights", function()
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 18) -- Trade Price Blue Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 19) -- Trade Price Electric Blue Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 20) -- Trade Price Mint Green Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 21) -- Trade Price Lime Green Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 22) -- Trade Price Yellow Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 23) -- Trade Price Golden Shower Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 24) -- Trade Price Orange Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 25) -- Trade Price Red Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 26) -- Trade Price Pony Pink Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 27) -- Trade Price Hot Pink Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 28) -- Trade Price Purple Lights
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 29) -- Trade Price Blacklight Lights
end)

AWRMenu:add_action("Unlock Trade Prices for Arena War Vehicles", function()
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 1) -- Trade Price Apocalypse Cerberus
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 2) -- Trade Price Future Shock Cerberus
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 3) -- Trade Price Apocalypse Brutus
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 4) -- Trade Price Nightmare Cerberus
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 5) -- Trade Price Apocalypse ZR380
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 6) -- Trade Price Future Shock Brutus
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 7) -- Trade Price Impaler
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 10) -- Trade Price Rat-Truck
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 11) -- Trade Price Glendale
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 12) -- Trade Price Slamvan
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 13) -- Trade Price Dominator
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 14) -- Trade Price Issi Classic
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL0", true, 16) -- Trade Price Gargoyle
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 11) -- Trade Price Nightmare Brutus
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 12) -- Trade Price Apocalypse Scarab
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 13) -- Trade Price Future Shock Scarab
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 14) -- Trade Price Nightmare Scarab
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 15) -- Trade Price Future Shock ZR380
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 16) -- Trade Price Nightmare ZR380
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 17) -- Trade Price Apocalypse Imperator
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 18) -- Trade Price Future Shock Imperator
	stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL2", true, 19) -- Trade Price Nightmare Imperator
end)



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RONECLICKMenu = RMenu:add_submenu("One Click Unlocker Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function Text(text)
	RONECLICKMenu:add_action(text,  function() end)
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
RONECLICKMenu:add_action("Stats Part 1", function()
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
		stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240)
		stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229378)
		stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
		stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240)
		stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229378)
		stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
		stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 16368)
		stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 229380)
		stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
		stats.set_int(MPX .. "FIXER_GENERAL_BS", -1)
		stats.set_int(MPX .. "FIXER_COMPLETED_BS", -1)
		stats.set_int(MPX .. "FIXER_STORY_BS", -1)
		stats.set_int(MPX .. "FIXER_STORY_STRAND", -1)
		stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", -1)
		stats.set_int(MPX .. "FIXER_COUNT", 500)
		stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", -1)
		stats.set_int(MPX .. "XMASLIVERIES0", -1)
		stats.set_int(MPX .. "XMASLIVERIES1", -1)
		stats.set_int(MPX .. "XMASLIVERIES2", -1)
		stats.set_int(MPX .. "XMASLIVERIES3", -1)
		stats.set_int(MPX .. "XMASLIVERIES5", -1)
		stats.set_int(MPX .. "XMASLIVERIES6", -1)
		stats.set_int(MPX .. "XMASLIVERIES7", -1)
		stats.set_int(MPX .. "XMASLIVERIES8", -1)
		stats.set_int(MPX .. "XMASLIVERIES9", -1)
		stats.set_int(MPX .. "XMASLIVERIES10", -1)
		stats.set_int(MPX .. "XMASLIVERIES11", -1)
		stats.set_int(MPX .. "XMASLIVERIES12", -1)
		stats.set_int(MPX .. "XMASLIVERIES13", -1)
		stats.set_int(MPX .. "XMASLIVERIES14", -1)
		stats.set_int(MPX .. "XMASLIVERIES15", -1)
		stats.set_int(MPX .. "XMASLIVERIES16", -1)
		stats.set_int(MPX .. "XMASLIVERIES17", -1)
		stats.set_int(MPX .. "XMASLIVERIES18", -1)
		stats.set_int(MPX .. "XMASLIVERIES19", -1)
		stats.set_int(MPX .. "XMASLIVERIES20", -1)
		stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 15)
		stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 15)
		stats.set_int(MPX .. "AWD_READY_FOR_WAR", 60)
		stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 60)
		stats.set_int(MPX .. "AWD_SPINNER", 60)
		stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 15)
		stats.set_int(MPX .. "AWD_MASTER_BANDITO", 12)
		stats.set_int(MPX .. "AWD_SITTING_DUCK", 60)
		stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 60)
		stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 60)
		stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 60)
		stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 110)
		stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 52)
		stats.set_int(MPX .. "AWD_TIME_SERVED", 110)
		stats.set_int(MPX .. "AWD_CAREER_WINNER", 110)
		stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 1100000)
		stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", -1)
		stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", -1)
		stats.set_int(MPX .. "AWD_PREPARATION", 40)
		stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
		stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
		stats.set_int(MPX .. "AWD_BIGBRO", 40)
		stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
		stats.set_int(MPX .. "AWD_RACECHAMP", 40)
		stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
		stats.set_int(MPX .. "AWD_COINPURSE", 950000)
		stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
		stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 50)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 50)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 50)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 50)
		stats.set_int(MPX .. "IAP_MA0_MOON_DIST", 2147483647)
		stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 50)
		stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_3_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_3_UNLCK", -1)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_EARNINGS5", 50000000)
		stats.set_int(MPX .. "VCM_FLOW_PROGRESS", -1)
		stats.set_int(MPX .. "VCM_STORY_PROGRESS", -1)
		stats.set_int(MPX .. "MKRIFLE_MK2_KILLS", 500)
		stats.set_int(MPX .. "MKRIFLE_MK2_DEATHS", 100)
		stats.set_int(MPX .. "MKRIFLE_MK2_SHOTS", 500)
		stats.set_int(MPX .. "MKRIFLE_MK2_HITS", 500)
		stats.set_int(MPX .. "MKRIFLE_MK2_HEADSHOTS", 500)
		stats.set_int(MPX .. "MKRIFLE_MK2_HELDTIME", 5963259)
		stats.set_int(MPX .. "MKRIFLE_MK2_DB_HELDTIME", 5963259)
		stats.set_int(MPX .. "MKRIFLE_MK2_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "AWD_ODD_JOBS", 52)
		stats.set_int(MPX .. "AWD_PREPARATION", 50)
		stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
		stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
		stats.set_int(MPX .. "AWD_BIGBRO", 40)
		stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
		stats.set_int(MPX .. "AWD_RACECHAMP", 40)
		stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
		stats.set_int(MPX .. "AWD_COINPURSE", 950000)
		stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
		stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
		stats.set_int(MPX .. "DM_CURRENT_KILLS", 10000)
		stats.set_int(MPX .. "DM_CURRENT_ASSISTS", 500)
		stats.set_int(MPX .. "DM_CURRENT_DEATHS", 600)
		stats.set_int(MPX .. "DM_HIGHEST_KILLSTREAK", 900)
		stats.set_int(MPX .. "HIGHEST_SKITTLES", 900)
		stats.set_int(MPX .. "NUMBER_NEAR_MISS", 1000)
		stats.set_int(MPX .. "LAP_DANCED_BOUGHT", 100)
		stats.set_int(MPX .. "CARS_EXPLODED", 500)
		stats.set_int(MPX .. "CARS_COPS_EXPLODED", 300)
		stats.set_int(MPX .. "BIKES_EXPLODED", 100)
		stats.set_int(MPX .. "BOATS_EXPLODED", 168)
		stats.set_int(MPX .. "HELIS_EXPLODED", 98)
		stats.set_int(MPX .. "PLANES_EXPLODED", 138)
		stats.set_int(MPX .. "QUADBIKE_EXPLODED", 50)
		stats.set_int(MPX .. "BICYCLE_EXPLODED", 48)
		stats.set_int(MPX .. "SUBMARINE_EXPLODED", 28)
		stats.set_int(MPX .. "DEATHS", 499)
		stats.set_int(MPX .. "DIED_IN_DROWNING", 833)
		stats.set_int(MPX .. "DIED_IN_DROWNINGINVEHICLE", 833)
		stats.set_int(MPX .. "DIED_IN_EXPLOSION", 833)
		stats.set_int(MPX .. "DIED_IN_FALL", 833)
		stats.set_int(MPX .. "DIED_IN_FIRE", 833)
		stats.set_int(MPX .. "DIED_IN_ROAD", 833)
		stats.set_int(MPX .. "NO_PHOTOS_TAKEN", 100)
		stats.set_int(MPX .. "PROSTITUTES_FREQUENTED", 100)
		stats.set_int(MPX .. "BOUNTSONU", 200)
		stats.set_int(MPX .. "BOUNTPLACED", 500)
		stats.set_int(MPX .. "PASS_DB_KILLS", 300)
		stats.set_int(MPX .. "PASS_DB_PLAYER_KILLS", 300)
		stats.set_int(MPX .. "PASS_DB_SHOTS", 300)
		stats.set_int(MPX .. "PASS_DB_HITS", 300)
		stats.set_int(MPX .. "PASS_DB_HITS_PEDS_VEHICLES", 300)
		stats.set_int(MPX .. "PASS_DB_HEADSHOTS", 300)
		stats.set_int(MPX .. "TIRES_POPPED_BY_GUNSHOT", 500)
		stats.set_int(MPX .. "NUMBER_CRASHES_CARS", 300)
		stats.set_int(MPX .. "NUMBER_CRASHES_BIKES", 300)
		stats.set_int(MPX .. "BAILED_FROM_VEHICLE", 300)
		stats.set_int(MPX .. "NUMBER_CRASHES_QUADBIKES", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 300)
		stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 300)
		stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 884483972)
		stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 884483972)
		stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 884483972)
		stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 884483972)
		stats.set_int(MPX .. "MC_CONTRIBUTION_POINTS", 1000)
		stats.set_int(MPX .. "MEMBERSMARKEDFORDEATH", 700)
		stats.set_int(MPX .. "MCKILLS", 500)
		stats.set_int(MPX .. "MCDEATHS", 700)
		stats.set_int(MPX .. "RIVALPRESIDENTKILLS", 700)
		stats.set_int(MPX .. "RIVALCEOANDVIPKILLS", 700)
		stats.set_int(MPX .. "MELEEKILLS", 700)
		stats.set_int(MPX .. "CLUBHOUSECONTRACTSCOMPLETE", 700)
		stats.set_int(MPX .. "CLUBHOUSECONTRACTEARNINGS", 32698547)
		stats.set_int(MPX .. "CLUBCHALLENGESCOMPLETED", 700)
		stats.set_int(MPX .. "MEMBERCHALLENGESCOMPLETED", 700)
		stats.set_int(MPX .. "HITS", 100000)
		stats.set_int(MPX .. "MKRIFLE_KILLS", 500)
		stats.set_int(MPX .. "MKRIFLE_DEATHS", 100)
		stats.set_int(MPX .. "MKRIFLE_SHOTS", 500)
		stats.set_int(MPX .. "MKRIFLE_HITS", 500)
		stats.set_int(MPX .. "MKRIFLE_HEADSHOTS", 500)
		stats.set_int(MPX .. "MKRIFLE_HELDTIME", 5963259)
		stats.set_int(MPX .. "MKRIFLE_DB_HELDTIME", 5963259)
		stats.set_int(MPX .. "MKRIFLE_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BETAMOUNT", 500)
		stats.set_int(MPX .. "GHKILLS", 500)
		stats.set_int(MPX .. "HORDELVL", 10)
		stats.set_int(MPX .. "HORDKILLS", 500)
		stats.set_int(MPX .. "UNIQUECRATES", 500)
		stats.set_int(MPX .. "BJWINS", 500)
		stats.set_int(MPX .. "HORDEWINS", 500)
		stats.set_int(MPX .. "MCMWINS", 500)
		stats.set_int(MPX .. "GANGHIDWINS", 500)
		stats.set_int(MPX .. "KILLS", 800)
		stats.set_int(MPX .. "HITS_PEDS_VEHICLES", 100)
		stats.set_int(MPX .. "SHOTS", 1000)
		stats.set_int(MPX .. "HEADSHOTS", 100)
		stats.set_int(MPX .. "KILLS_ARMED", 650)
		stats.set_int(MPX .. "SUCCESSFUL_COUNTERS", 100)
		stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
		stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
		stats.set_int(MPX .. "KILLS_STEALTH", 100)
		stats.set_int(MPX .. "KILLS_INNOCENTS", 500)
		stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 100)
		stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 100)
		stats.set_int(MPX .. "KILLS_BY_OTHERS", 100)
		stats.set_int(MPX .. "HITS", 600)
		stats.set_int(MPX .. "BIGGEST_VICTIM_KILLS", 500)
		stats.set_int(MPX .. "ARCHENEMY_KILLS", 500)
		stats.set_int(MPX .. "CRARMWREST", 500)
		stats.set_int(MPX .. "CRBASEJUMP", 500)
		stats.set_int(MPX .. "CRDARTS", 500)
		stats.set_int(MPX .. "CRDM", 500)
		stats.set_int(MPX .. "CRGANGHIDE", 500)
		stats.set_int(MPX .. "CRGOLF", 500)
		stats.set_int(MPX .. "CRHORDE", 500)
		stats.set_int(MPX .. "CRMISSION", 500)
		stats.set_int(MPX .. "CRSHOOTRNG", 500)
		stats.set_int(MPX .. "CRTENNIS", 500)
		stats.set_int(MPX .. "TOTAL_TIME_CINEMA", 2147483647)
		stats.set_int(MPX .. "NO_TIMES_CINEMA", 500)
		stats.set_int(MPX .. "TIME_AS_A_PASSENGER", 2147483647)
		stats.set_int(MPX .. "TIME_AS_A_DRIVER", 2147483647)
		stats.set_int(MPX .. "TIME_SPENT_FLYING", 2147483647)
		stats.set_int(MPX .. "TIME_IN_CAR", 2147483647)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_UNDERTABC", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_COMPLETBC", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S1_0", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S2_0", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S3_0", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_UNDERTA1", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_COMPLET1", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_UNDERTA1", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_COMPLET1", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_UNDERTABC1", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_COMPLETBC1", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S1_1", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S2_1", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S3_1", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_UNDERTA2", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_COMPLET2", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_UNDERTA2", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_COMPLET2", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_UNDERTABC2", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_COMPLETBC2", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S1_2", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S2_2", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S3_2", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_UNDERTA3", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_COMPLET3", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_UNDERTA3", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_COMPLET3", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_UNDERTABC3", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_COMPLETBC3", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S1_3", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S2_3", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S3_3", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_UNDERTA4", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_COMPLET4", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_UNDERTA4", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_COMPLET4", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_UNDERTABC4", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_COMPLETBC4", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S1_4", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S2_4", 500)
		stats.set_int(MPX .. "BKR_PROD_STOP_COUT_S3_4", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_UNDERTA5", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_COMPLET5", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_UNDERTABC5", 500)
		stats.set_int(MPX .. "LIFETIME_BKR_SEL_COMPLETBC5", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_UNDERTA5", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_SELL_COMPLET5", 500)
		stats.set_int(MPX .. "BUNKER_UNITS_MANUFAC", 500)
		stats.set_int(MPX .. "CHAR_ABILITY_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_3_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_3_UNLCK", -1)
		stats.set_int(MPX .. "LFETIME_HANGAR_BUY_UNDETAK", 500)
		stats.set_int(MPX .. "LFETIME_HANGAR_BUY_COMPLET", 500)
		stats.set_int(MPX .. "LFETIME_HANGAR_SEL_UNDETAK", 500)
		stats.set_int(MPX .. "LFETIME_HANGAR_SEL_COMPLET", 500)
		stats.set_int(MPX .. "LFETIME_HANGAR_EARNINGS", 29654123)
		stats.set_int(MPX .. "LFETIME_HANGAR_EARN_BONUS", 15987456)
		stats.set_int(MPX .. "RIVAL_HANGAR_CRATES_STOLEN", 500)
		stats.set_int(MPX .. "LFETIME_IE_STEAL_STARTED", 500)
		stats.set_int(MPX .. "LFETIME_IE_EXPORT_STARTED", 500)
		stats.set_int(MPX .. "LFETIME_IE_EXPORT_COMPLETED", 500)
		stats.set_int(MPX .. "LFETIME_IE_MISSION_EARNINGS", 59654897)
		stats.set_int(MPX .. "AT_FLOW_IMPEXP_NUM", 500)
		stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
		stats.set_int(MPX .. "NIGHTCLUB_VIP_APPEAR", 300)
		stats.set_int(MPX .. "NIGHTCLUB_JOBS_DONE", 500)
		stats.set_int(MPX .. "NIGHTCLUB_EARNINGS", 39856412)
		stats.set_int(MPX .. "HUB_SALES_COMPLETED", 500)
		stats.set_int(MPX .. "HUB_EARNINGS", 29865423)
		stats.set_int(MPX .. "DANCE_COMBO_DURATION_MINS", 86400000)
		stats.set_int(MPX .. "NIGHTCLUB_PLAYER_APPEAR", 500)
		stats.set_int(MPX .. "LIFETIME_HUB_GOODS_SOLD", 500)
		stats.set_int(MPX .. "LIFETIME_HUB_GOODS_MADE", 500)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_1", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_10", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_11", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_12", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_2", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_3", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_4", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_5", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_6", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_7", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_8", -1)
		stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_9", -1)
		stats.set_int(MPX .. "ADMIN_WEAPON_GV_BS_1", -1)
		stats.set_int(MPX .. "AIR_LAUNCHES_OVER_40M", 25)
		stats.set_int(MPX .. "AWD_5STAR_WANTED_AVOIDANCE", 50)
		stats.set_int(MPX .. "AWD_CAR_BOMBS_ENEMY_KILLS", 25)
		stats.set_int(MPX .. "AWD_CARS_EXPORTED", 50)
		stats.set_int(MPX .. "AWD_CONTROL_CROWDS", 25)
		stats.set_int(MPX .. "AWD_DAILYOBJCOMPLETED", 100)
		stats.set_int(MPX .. "AWD_DO_HEIST_AS_MEMBER", 25)
		stats.set_int(MPX .. "AWD_DO_HEIST_AS_THE_LEADER", 25)
		stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
		stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
		stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
		stats.set_int(MPX .. "AWD_FM_DM_3KILLSAMEGUY", 50)
		stats.set_int(MPX .. "AWD_FM_DM_KILLSTREAK", 100)
		stats.set_int(MPX .. "AWD_FM_DM_STOLENKILL", 50)
		stats.set_int(MPX .. "AWD_FM_DM_TOTALKILLS", 500)
		stats.set_int(MPX .. "AWD_FM_DM_WINS", 50)
		stats.set_int(MPX .. "AWD_FM_GOLF_HOLE_IN_1", 300)
		stats.set_int(MPX .. "AWD_FM_GOLF_BIRDIES", 25)
		stats.set_int(MPX .. "AWD_FM_GOLF_WON", 25)
		stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 50)
		stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 25)
		stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
		stats.set_int(MPX .. "AWD_FM_SHOOTRANG_CT_WON", 25)
		stats.set_int(MPX .. "AWD_FM_SHOOTRANG_RT_WON", 25)
		stats.set_int(MPX .. "AWD_FM_SHOOTRANG_TG_WON", 25)
		stats.set_int(MPX .. "AWD_FM_TDM_MVP", 50)
		stats.set_int(MPX .. "AWD_FM_TDM_WINS", 50)
		stats.set_int(MPX .. "AWD_FM_TENNIS_ACE", 25)
		stats.set_int(MPX .. "AWD_FM_TENNIS_WON", 25)
		stats.set_int(MPX .. "AWD_FMBASEJMP", 25)
		stats.set_int(MPX .. "AWD_FMBBETWIN", 50000)
		stats.set_int(MPX .. "AWD_FMCRATEDROPS", 25)
		stats.set_int(MPX .. "AWD_FMDRIVEWITHOUTCRASH", 30)
		stats.set_int(MPX .. "AWD_FMHORDWAVESSURVIVE", 10)
		stats.set_int(MPX .. "AWD_FMKILLBOUNTY", 25)
		stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
		stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
		stats.set_int(MPX .. "AWD_FMREVENGEKILLSD", 50)
		stats.set_int(MPX .. "AWD_FMSHOOTDOWNCOPHELI", 25)
		stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
		stats.set_int(MPX .. "AWD_FMWINRACETOPOINTS", 25)
		stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
		stats.set_int(MPX .. "AWD_HOLD_UP_SHOPS", 20)
		stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
		stats.set_int(MPX .. "AWD_KILL_PSYCHOPATHS", 100)
		stats.set_int(MPX .. "AWD_KILL_TEAM_YOURSELF_LTS", 25)
		stats.set_int(MPX .. "AWD_LAPDANCES", 25)
		stats.set_int(MPX .. "AWD_LESTERDELIVERVEHICLES", 25)
		stats.set_int(MPX .. "AWD_MENTALSTATE_TO_NORMAL", 50)
		stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
		stats.set_int(MPX .. "AWD_NO_HAIRCUTS", 25)
		stats.set_int(MPX .. "AWD_ODISTRACTCOPSNOEATH", 25)
		stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
		stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_20M", 25)
		stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_50M", 25)
		stats.set_int(MPX .. "AWD_PASSENGERTIME", 4)
		stats.set_int(MPX .. "AWD_PICKUP_CAP_PACKAGES", 100)
		stats.set_int(MPX .. "AWD_RACES_WON", 50)
		stats.set_int(MPX .. "AWD_SECURITY_CARS_ROBBED", 25)
		stats.set_int(MPX .. "AWD_TAKEDOWNSMUGPLANE", 50)
		stats.set_int(MPX .. "AWD_TIME_IN_HELICOPTER", 4)
		stats.set_int(MPX .. "AWD_TRADE_IN_YOUR_PROPERTY", 25)
		stats.set_int(MPX .. "AWD_VEHICLES_JACKEDR", 500)
		stats.set_int(MPX .. "AWD_WIN_AT_DARTS", 25)
		stats.set_int(MPX .. "AWD_WIN_CAPTURE_DONT_DYING", 25)
		stats.set_int(MPX .. "AWD_WIN_CAPTURES", 50)
		stats.set_int(MPX .. "AWD_WIN_GOLD_MEDAL_HEISTS", 25)
		stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
		stats.set_int(MPX .. "BOTTLE_IN_POSSESSION", -1)
		stats.set_int(MPX .. "CHAR_FM_CARMOD_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_CARMOD_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_CARMOD_3_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_CARMOD_4_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_CARMOD_5_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_CARMOD_6_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_CARMOD_7_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_VEHICLE_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_VEHICLE_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_3_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_4_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_5_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", -1)
		stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", -1)
		stats.set_int(MPX .. "CHAR_KIT_10_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_4_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE10", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE11", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE12", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE2", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE3", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE4", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE5", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE6", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE7", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE8", -1)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE9", -1)
		stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME5STAR", -1)
		stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", -1)
		stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_3", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_4", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_5", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_6", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_DECL", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_3", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_4", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_5", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_6", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_7", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_3", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_4", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_5", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_6", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_7", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_3", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_4", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_5", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_6", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_7", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_OUTFIT", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_10", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_3", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_4", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_5", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_6", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_7", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_8", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_9", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL2_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_3", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_4", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_5", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_6", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_7", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_TEETH", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_TEETH_1", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_TEETH_2", -1)
		stats.set_int(MPX .. "CLTHS_ACQUIRED_TORSO", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_3", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_4", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_5", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_6", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_7", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_DECL", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_3", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_4", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_5", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_6", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_7", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_3", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_4", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_5", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_6", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_7", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_3", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_4", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_5", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_6", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_7", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_2", -1)
end)
RONECLICKMenu:add_action("Stats Part 2",  function()
				stats.set_int(MPX .. "SAVESTRA_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "SAVESTRA_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STROMBERG_MG_KILLS", 500)
		stats.set_int(MPX .. "STROMBERG_MG_DEATHS", 100)
		stats.set_int(MPX .. "STROMBERG_MG_SHOTS", 500)
		stats.set_int(MPX .. "STROMBERG_MG_HITS", 500)
		stats.set_int(MPX .. "STROMBERG_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "STROMBERG_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "STROMBERG_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STROMBERG_MISS_KILLS", 500)
		stats.set_int(MPX .. "STROMBERG_MISS_DEATHS", 100)
		stats.set_int(MPX .. "STROMBERG_MISS_SHOTS", 500)
		stats.set_int(MPX .. "STROMBERG_MISS_HITS", 500)
		stats.set_int(MPX .. "STROMBERG_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "STROMBERG_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STROMBERG_TORP_KILLS", 500)
		stats.set_int(MPX .. "STROMBERG_TORP_DEATHS", 100)
		stats.set_int(MPX .. "STROMBERG_TORP_SHOTS", 500)
		stats.set_int(MPX .. "STROMBERG_TORP_HITS", 500)
		stats.set_int(MPX .. "STROMBERG_TORP_HELDTIME", 5963259)
		stats.set_int(MPX .. "STROMBERG_TORP_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "THRUSTER_MG_KILLS", 500)
		stats.set_int(MPX .. "THRUSTER_MG_DEATHS", 100)
		stats.set_int(MPX .. "THRUSTER_MG_SHOTS", 500)
		stats.set_int(MPX .. "THRUSTER_MG_HITS", 500)
		stats.set_int(MPX .. "THRUSTER_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "THRUSTER_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "THRUSTER_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "THRUSTER_MISS_KILLS", 500)
		stats.set_int(MPX .. "THRUSTER_MISS_DEATHS", 100)
		stats.set_int(MPX .. "THRUSTER_MISS_SHOTS", 500)
		stats.set_int(MPX .. "THRUSTER_MISS_HITS", 500)
		stats.set_int(MPX .. "THRUSTER_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "THRUSTER_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VISERIS_MG_KILLS", 500)
		stats.set_int(MPX .. "VISERIS_MG_DEATHS", 100)
		stats.set_int(MPX .. "VISERIS_MG_SHOTS", 500)
		stats.set_int(MPX .. "VISERIS_MG_HITS", 500)
		stats.set_int(MPX .. "VISERIS_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "VISERIS_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "VISERIS_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VOLATOL_MG_KILLS", 500)
		stats.set_int(MPX .. "VOLATOL_MG_DEATHS", 100)
		stats.set_int(MPX .. "VOLATOL_MG_SHOTS", 500)
		stats.set_int(MPX .. "VOLATOL_MG_HITS", 500)
		stats.set_int(MPX .. "VOLATOL_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "VOLATOL_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "VOLATOL_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MULE4_MG_KILLS", 500)
		stats.set_int(MPX .. "MULE4_MG_DEATHS", 100)
		stats.set_int(MPX .. "MULE4_MG_SHOTS", 500)
		stats.set_int(MPX .. "MULE4_MG_HITS", 500)
		stats.set_int(MPX .. "MULE4_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "MULE4_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "MULE4_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MULE4_MISS_KILLS", 500)
		stats.set_int(MPX .. "MULE4_MISS_DEATHS", 100)
		stats.set_int(MPX .. "MULE4_MISS_SHOTS", 500)
		stats.set_int(MPX .. "MULE4_MISS_HITS", 500)
		stats.set_int(MPX .. "MULE4_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "MULE4_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MULE4_GL_KILLS", 500)
		stats.set_int(MPX .. "MULE4_GL_DEATHS", 100)
		stats.set_int(MPX .. "MULE4_GL_SHOTS", 500)
		stats.set_int(MPX .. "MULE4_GL_HITS", 500)
		stats.set_int(MPX .. "MULE4_GL_HELDTIME", 5963259)
		stats.set_int(MPX .. "MULE4_GL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MENACER_MG_KILLS", 500)
		stats.set_int(MPX .. "MENACER_MG_DEATHS", 100)
		stats.set_int(MPX .. "MENACER_MG_SHOTS", 500)
		stats.set_int(MPX .. "MENACER_MG_HITS", 500)
		stats.set_int(MPX .. "MENACER_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "MENACER_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "MENACER_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MENACER_TURR_KILLS", 500)
		stats.set_int(MPX .. "MENACER_TURR_DEATHS", 100)
		stats.set_int(MPX .. "MENACER_TURR_SHOTS", 500)
		stats.set_int(MPX .. "MENACER_TURR_HITS", 500)
		stats.set_int(MPX .. "MENACER_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "MENACER_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "MENACER_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MENACER_MINI_KILLS", 500)
		stats.set_int(MPX .. "MENACER_MINI_DEATHS", 100)
		stats.set_int(MPX .. "MENACER_MINI_SHOTS", 500)
		stats.set_int(MPX .. "MENACER_MINI_HITS", 500)
		stats.set_int(MPX .. "MENACER_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "MENACER_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "MENACER_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MG_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MG_DEATHS", 100)
		stats.set_int(MPX .. "OPPRESSOR2_MG_SHOTS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MG_HITS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "OPPRESSOR2_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_CANN_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_CANN_DEATHS", 100)
		stats.set_int(MPX .. "OPPRESSOR2_CANN_SHOTS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_CANN_HITS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_CANN_HELDTIME", 5963259)
		stats.set_int(MPX .. "OPPRESSOR2_CANN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MISS_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MISS_DEATHS", 100)
		stats.set_int(MPX .. "OPPRESSOR2_MISS_SHOTS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MISS_HITS", 500)
		stats.set_int(MPX .. "OPPRESSOR2_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "OPPRESSOR2_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUISER_MG50_KILLS", 500)
		stats.set_int(MPX .. "BRUISER_MG50_DEATHS", 100)
		stats.set_int(MPX .. "BRUISER_MG50_SHOTS", 500)
		stats.set_int(MPX .. "BRUISER_MG50_HITS", 500)
		stats.set_int(MPX .. "BRUISER_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUISER_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "BRUISER_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUISER2_MG50_KILLS", 500)
		stats.set_int(MPX .. "BRUISER2_MG50_DEATHS", 100)
		stats.set_int(MPX .. "BRUISER2_MG50_SHOTS", 500)
		stats.set_int(MPX .. "BRUISER2_MG50_HITS", 500)
		stats.set_int(MPX .. "BRUISER2_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUISER2_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "BRUISER2_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUISER2_LAS_KILLS", 500)
		stats.set_int(MPX .. "BRUISER2_LAS_DEATHS", 100)
		stats.set_int(MPX .. "BRUISER2_LAS_SHOTS", 500)
		stats.set_int(MPX .. "BRUISER2_LAS_HITS", 500)
		stats.set_int(MPX .. "BRUISER2_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUISER2_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "BRUISER2_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUISER3_MG50_KILLS", 500)
		stats.set_int(MPX .. "BRUISER3_MG50_DEATHS", 100)
		stats.set_int(MPX .. "BRUISER3_MG50_SHOTS", 500)
		stats.set_int(MPX .. "BRUISER3_MG50_HITS", 500)
		stats.set_int(MPX .. "BRUISER3_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUISER3_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "BRUISER3_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS_MG50_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS_MG50_DEATHS", 100)
		stats.set_int(MPX .. "BRUTUS_MG50_SHOTS", 500)
		stats.set_int(MPX .. "BRUTUS_MG50_HITS", 500)
		stats.set_int(MPX .. "BRUTUS_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUTUS_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS2_MG50_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS2_MG50_DEATHS", 100)
		stats.set_int(MPX .. "BRUTUS2_MG50_SHOTS", 500)
		stats.set_int(MPX .. "BRUTUS2_MG50_HITS", 500)
		stats.set_int(MPX .. "BRUTUS2_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUTUS2_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "BRUTUS2_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS2_LAS_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS2_LAS_DEATHS", 100)
		stats.set_int(MPX .. "BRUTUS2_LAS_SHOTS", 500)
		stats.set_int(MPX .. "BRUTUS2_LAS_HITS", 500)
		stats.set_int(MPX .. "BRUTUS2_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUTUS2_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "BRUTUS2_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS3_MG50_KILLS", 500)
		stats.set_int(MPX .. "BRUTUS3_MG50_DEATHS", 100)
		stats.set_int(MPX .. "BRUTUS3_MG50_SHOTS", 500)
		stats.set_int(MPX .. "BRUTUS3_MG50_HITS", 500)
		stats.set_int(MPX .. "BRUTUS3_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "BRUTUS3_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "BRUTUS3_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CERBERUS_FLAME_KILLS", 500)
		stats.set_int(MPX .. "CERBERUS_FLAME_DEATHS", 100)
		stats.set_int(MPX .. "CERBERUS_FLAME_SHOTS", 500)
		stats.set_int(MPX .. "CERBERUS_FLAME_HITS", 500)
		stats.set_int(MPX .. "CERBERUS_FLAME_HEADSHOTS", 500)
		stats.set_int(MPX .. "CERBERUS_FLAME_HELDTIME", 5963259)
		stats.set_int(MPX .. "CERBERUS_FLAME_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CERBERUS2_FLAME_KILLS", 500)
		stats.set_int(MPX .. "CERBERUS2_FLAME_DEATHS", 100)
		stats.set_int(MPX .. "CERBERUS2_FLAME_SHOTS", 500)
		stats.set_int(MPX .. "CERBERUS2_FLAME_HITS", 500)
		stats.set_int(MPX .. "CERBERUS2_FLAME_HEADSHOTS", 500)
		stats.set_int(MPX .. "CERBERUS2_FLAME_HELDTIME", 5963259)
		stats.set_int(MPX .. "CERBERUS2_FLAME_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CERBERUS3_FLAME_KILLS", 500)
		stats.set_int(MPX .. "CERBERUS3_FLAME_DEATHS", 100)
		stats.set_int(MPX .. "CERBERUS3_FLAME_SHOTS", 500)
		stats.set_int(MPX .. "CERBERUS3_FLAME_HITS", 500)
		stats.set_int(MPX .. "CERBERUS3_FLAME_HEADSHOTS", 500)
		stats.set_int(MPX .. "CERBERUS3_FLAME_HELDTIME", 5963259)
		stats.set_int(MPX .. "CERBERUS3_FLAME_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DEATHBIKE_MINI_KILLS", 500)
		stats.set_int(MPX .. "DEATHBIKE_MINI_DEATHS", 100)
		stats.set_int(MPX .. "DEATHBIKE_MINI_SHOTS", 500)
		stats.set_int(MPX .. "DEATHBIKE_MINI_HITS", 500)
		stats.set_int(MPX .. "DEATHBIKE_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "DEATHBIKE_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "DEATHBIKE_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DEATHBIKE2_LAS_KILLS", 500)
		stats.set_int(MPX .. "DEATHBIKE2_LAS_DEATHS", 100)
		stats.set_int(MPX .. "DEATHBIKE2_LAS_SHOTS", 500)
		stats.set_int(MPX .. "DEATHBIKE2_LAS_HITS", 500)
		stats.set_int(MPX .. "DEATHBIKE2_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "DEATHBIKE2_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "DEATHBIKE2_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DEATHBIKE3_MINI_KILLS", 500)
		stats.set_int(MPX .. "DEATHBIKE3_MINI_DEATHS", 100)
		stats.set_int(MPX .. "DEATHBIKE3_MINI_SHOTS", 500)
		stats.set_int(MPX .. "DEATHBIKE3_MINI_HITS", 500)
		stats.set_int(MPX .. "DEATHBIKE3_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "DEATHBIKE3_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "DEATHBIKE3_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR4_MG50_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR4_MG50_DEATHS", 100)
		stats.set_int(MPX .. "DOMINATOR4_MG50_SHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR4_MG50_HITS", 500)
		stats.set_int(MPX .. "DOMINATOR4_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR4_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "DOMINATOR4_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR5_MG50_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR5_MG50_DEATHS", 100)
		stats.set_int(MPX .. "DOMINATOR5_MG50_SHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR5_MG50_HITS", 500)
		stats.set_int(MPX .. "DOMINATOR5_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR5_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "DOMINATOR5_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR5_LAS_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR5_LAS_DEATHS", 100)
		stats.set_int(MPX .. "DOMINATOR5_LAS_SHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR5_LAS_HITS", 500)
		stats.set_int(MPX .. "DOMINATOR5_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR5_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "DOMINATOR5_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR6_MG50_KILLS", 500)
		stats.set_int(MPX .. "DOMINATOR6_MG50_DEATHS", 100)
		stats.set_int(MPX .. "DOMINATOR6_MG50_SHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR6_MG50_HITS", 500)
		stats.set_int(MPX .. "DOMINATOR6_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "DOMINATOR6_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "DOMINATOR6_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPALER2_MG50_KILLS", 500)
		stats.set_int(MPX .. "IMPALER2_MG50_DEATHS", 100)
		stats.set_int(MPX .. "IMPALER2_MG50_SHOTS", 500)
		stats.set_int(MPX .. "IMPALER2_MG50_HITS", 500)
		stats.set_int(MPX .. "IMPALER2_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPALER2_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPALER2_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPALER3_MG50_KILLS", 500)
		stats.set_int(MPX .. "IMPALER3_MG50_DEATHS", 100)
		stats.set_int(MPX .. "IMPALER3_MG50_SHOTS", 500)
		stats.set_int(MPX .. "IMPALER3_MG50_HITS", 500)
		stats.set_int(MPX .. "IMPALER3_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPALER3_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPALER3_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPALER3_LAS_KILLS", 500)
		stats.set_int(MPX .. "IMPALER3_LAS_DEATHS", 100)
		stats.set_int(MPX .. "IMPALER3_LAS_SHOTS", 500)
		stats.set_int(MPX .. "IMPALER3_LAS_HITS", 500)
		stats.set_int(MPX .. "IMPALER3_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPALER3_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPALER3_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPALER4_MG50_KILLS", 500)
		stats.set_int(MPX .. "IMPALER4_MG50_DEATHS", 100)
		stats.set_int(MPX .. "IMPALER4_MG50_SHOTS", 500)
		stats.set_int(MPX .. "IMPALER4_MG50_HITS", 500)
		stats.set_int(MPX .. "IMPALER4_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPALER4_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPALER4_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR_MG50_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR_MG50_DEATHS", 100)
		stats.set_int(MPX .. "IMPERATOR_MG50_SHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR_MG50_HITS", 500)
		stats.set_int(MPX .. "IMPERATOR_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPERATOR_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR_KIN_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR_KIN_DEATHS", 100)
		stats.set_int(MPX .. "IMPERATOR_KIN_SHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR_KIN_HITS", 500)
		stats.set_int(MPX .. "IMPERATOR_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPERATOR_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR2_MG50_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR2_MG50_DEATHS", 100)
		stats.set_int(MPX .. "IMPERATOR2_MG50_SHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR2_MG50_HITS", 500)
		stats.set_int(MPX .. "IMPERATOR2_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR2_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPERATOR2_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR2_KIN_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR2_KIN_DEATHS", 100)
		stats.set_int(MPX .. "IMPERATOR2_KIN_SHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR2_KIN_HITS", 500)
		stats.set_int(MPX .. "IMPERATOR2_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPERATOR2_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR2_LAS_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR2_LAS_DEATHS", 100)
		stats.set_int(MPX .. "IMPERATOR2_LAS_SHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR2_LAS_HITS", 500)
		stats.set_int(MPX .. "IMPERATOR2_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR2_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPERATOR2_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR3_MG50_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR3_MG50_DEATHS", 100)
		stats.set_int(MPX .. "IMPERATOR3_MG50_SHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR3_MG50_HITS", 500)
		stats.set_int(MPX .. "IMPERATOR3_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR3_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPERATOR3_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR3_KIN_KILLS", 500)
		stats.set_int(MPX .. "IMPERATOR3_KIN_DEATHS", 100)
		stats.set_int(MPX .. "IMPERATOR3_KIN_SHOTS", 500)
		stats.set_int(MPX .. "IMPERATOR3_KIN_HITS", 500)
		stats.set_int(MPX .. "IMPERATOR3_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "IMPERATOR3_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VALKYRIE_CANNON_KILLS", 500)
		stats.set_int(MPX .. "VALKYRIE_CANNON_DEATHS", 100)
		stats.set_int(MPX .. "VALKYRIE_CANNON_SHOTS", 500)
		stats.set_int(MPX .. "VALKYRIE_CANNON_HITS", 500)
		stats.set_int(MPX .. "VALKYRIE_CANNON_HEADSHOTS", 500)
		stats.set_int(MPX .. "VALKYRIE_CANNON_HELDTIME", 5963259)
		stats.set_int(MPX .. "VALKYRIE_CANNON_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VALKYRIE_TURR_KILLS", 500)
		stats.set_int(MPX .. "VALKYRIE_TURR_DEATHS", 100)
		stats.set_int(MPX .. "VALKYRIE_TURR_SHOTS", 500)
		stats.set_int(MPX .. "VALKYRIE_TURR_HITS", 500)
		stats.set_int(MPX .. "VALKYRIE_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "VALKYRIE_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "VALKYRIE_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "JB7002_MG_KILLS", 500)
		stats.set_int(MPX .. "JB7002_MG_DEATHS", 100)
		stats.set_int(MPX .. "JB7002_MG_SHOTS", 500)
		stats.set_int(MPX .. "JB7002_MG_HITS", 500)
		stats.set_int(MPX .. "JB7002_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "JB7002_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "JB7002_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_MG_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_MG_DEATHS", 100)
		stats.set_int(MPX .. "MINITANK_MG_SHOTS", 500)
		stats.set_int(MPX .. "MINITANK_MG_HITS", 500)
		stats.set_int(MPX .. "MINITANK_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "MINITANK_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "MINITANK_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_FL_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_FL_DEATHS", 100)
		stats.set_int(MPX .. "MINITANK_FL_SHOTS", 500)
		stats.set_int(MPX .. "MINITANK_FL_HITS", 500)
		stats.set_int(MPX .. "MINITANK_FL_HELDTIME", 5963259)
		stats.set_int(MPX .. "MINITANK_FL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_RK_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_RK_DEATHS", 100)
		stats.set_int(MPX .. "MINITANK_RK_SHOTS", 500)
		stats.set_int(MPX .. "MINITANK_RK_HITS", 500)
		stats.set_int(MPX .. "MINITANK_RK_HELDTIME", 5963259)
		stats.set_int(MPX .. "MINITANK_RK_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_LZ_KILLS", 500)
		stats.set_int(MPX .. "MINITANK_LZ_DEATHS", 100)
		stats.set_int(MPX .. "MINITANK_LZ_SHOTS", 500)
		stats.set_int(MPX .. "MINITANK_LZ_HITS", 500)
		stats.set_int(MPX .. "MINITANK_LZ_HEADSHOTS", 500)
		stats.set_int(MPX .. "MINITANK_LZ_HELDTIME", 5963259)
		stats.set_int(MPX .. "MINITANK_LZ_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "FLAREGUN_KILLS", 500)
		stats.set_int(MPX .. "FLAREGUN_DEATHS", 100)
		stats.set_int(MPX .. "FLAREGUN_SHOTS", 500)
		stats.set_int(MPX .. "FLAREGUN_HITS", 500)
		stats.set_int(MPX .. "FLAREGUN_HEADSHOTS", 500)
		stats.set_int(MPX .. "FLAREGUN_HELDTIME", 5963259)
		stats.set_int(MPX .. "FLAREGUN_DB_HELDTIME", 5963259)
		stats.set_int(MPX .. "FLAREGUN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "INSURGENT_TURR_KILLS", 500)
		stats.set_int(MPX .. "INSURGENT_TURR_DEATHS", 100)
		stats.set_int(MPX .. "INSURGENT_TURR_SHOTS", 500)
		stats.set_int(MPX .. "INSURGENT_TURR_HITS", 500)
		stats.set_int(MPX .. "INSURGENT_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "INSURGENT_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "INSURGENT_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SAVAGE_ROCKET_KILLS", 500)
		stats.set_int(MPX .. "SAVAGE_ROCKET_DEATHS", 100)
		stats.set_int(MPX .. "SAVAGE_ROCKET_SHOTS", 500)
		stats.set_int(MPX .. "SAVAGE_ROCKET_HITS", 500)
		stats.set_int(MPX .. "SAVAGE_ROCKET_HELDTIME", 5963259)
		stats.set_int(MPX .. "SAVAGE_ROCKET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SAVAGE_BULLET_KILLS", 500)
		stats.set_int(MPX .. "SAVAGE_BULLET_DEATHS", 100)
		stats.set_int(MPX .. "SAVAGE_BULLET_SHOTS", 500)
		stats.set_int(MPX .. "SAVAGE_BULLET_HITS", 500)
		stats.set_int(MPX .. "SAVAGE_BULLET_HEADSHOTS", 500)
		stats.set_int(MPX .. "SAVAGE_BULLET_HELDTIME", 5963259)
		stats.set_int(MPX .. "SAVAGE_BULLET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL_TURR_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL_TURR_DEATHS", 100)
		stats.set_int(MPX .. "TECHNICAL_TURR_SHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL_TURR_HITS", 500)
		stats.set_int(MPX .. "TECHNICAL_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "TECHNICAL_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_DEATHS", 100)
		stats.set_int(MPX .. "VEHBOMB_SHOTS", 500)
		stats.set_int(MPX .. "VEHBOMB_HITS", 500)
		stats.set_int(MPX .. "VEHBOMB_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_C_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_C_DEATHS", 100)
		stats.set_int(MPX .. "VEHBOMB_C_SHOTS", 500)
		stats.set_int(MPX .. "VEHBOMB_C_HITS", 500)
		stats.set_int(MPX .. "VEHBOMB_C_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_G_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_G_DEATHS", 100)
		stats.set_int(MPX .. "VEHBOMB_G_SHOTS", 500)
		stats.set_int(MPX .. "VEHBOMB_G_HITS", 500)
		stats.set_int(MPX .. "VEHBOMB_G_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_I_KILLS", 500)
		stats.set_int(MPX .. "VEHBOMB_I_DEATHS", 100)
		stats.set_int(MPX .. "VEHBOMB_I_SHOTS", 500)
		stats.set_int(MPX .. "VEHBOMB_I_HITS", 500)
		stats.set_int(MPX .. "VEHBOMB_I_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_CANN_KILLS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_CANN_DEATHS", 100)
		stats.set_int(MPX .. "BOMBUSHKA_CANN_SHOTS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_CANN_HITS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_CANN_HELDTIME", 5963259)
		stats.set_int(MPX .. "BOMBUSHKA_CANN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_DUAL_KILLS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_DUAL_DEATHS", 100)
		stats.set_int(MPX .. "BOMBUSHKA_DUAL_SHOTS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_DUAL_HITS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_DUAL_HEADSHOTS", 500)
		stats.set_int(MPX .. "BOMBUSHKA_DUAL_HELDTIME", 5963259)
		stats.set_int(MPX .. "BOMBUSHKA_DUAL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "HAVOK_MINI_KILLS", 500)
		stats.set_int(MPX .. "HAVOK_MINI_DEATHS", 100)
		stats.set_int(MPX .. "HAVOK_MINI_SHOTS", 500)
		stats.set_int(MPX .. "HAVOK_MINI_HITS", 500)
		stats.set_int(MPX .. "HAVOK_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "HAVOK_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "HAVOK_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "HUNTER_BARR_KILLS", 500)
		stats.set_int(MPX .. "HUNTER_BARR_DEATHS", 100)
		stats.set_int(MPX .. "HUNTER_BARR_SHOTS", 500)
		stats.set_int(MPX .. "HUNTER_BARR_HITS", 500)
		stats.set_int(MPX .. "HUNTER_BARR_HELDTIME", 5963259)
		stats.set_int(MPX .. "HUNTER_BARR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "HUNTER_CANNON_KILLS", 500)
		stats.set_int(MPX .. "HUNTER_CANNON_DEATHS", 100)
		stats.set_int(MPX .. "HUNTER_CANNON_SHOTS", 500)
		stats.set_int(MPX .. "HUNTER_CANNON_HITS", 500)
		stats.set_int(MPX .. "HUNTER_CANNON_HELDTIME", 5963259)
		stats.set_int(MPX .. "HUNTER_CANNON_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MICROLIGHT_MG_KILLS", 500)
		stats.set_int(MPX .. "MICROLIGHT_MG_DEATHS", 100)
		stats.set_int(MPX .. "MICROLIGHT_MG_SHOTS", 500)
		stats.set_int(MPX .. "MICROLIGHT_MG_HITS", 500)
		stats.set_int(MPX .. "MICROLIGHT_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "MICROLIGHT_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "MICROLIGHT_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_NOSE_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_NOSE_DEATHS", 100)
		stats.set_int(MPX .. "MOGUL_NOSE_SHOTS", 500)
		stats.set_int(MPX .. "MOGUL_NOSE_HITS", 500)
		stats.set_int(MPX .. "MOGUL_NOSE_HEADSHOTS", 500)
		stats.set_int(MPX .. "MOGUL_NOSE_HELDTIME", 5963259)
		stats.set_int(MPX .. "MOGUL_NOSE_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_DNOSE_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_DNOSE_DEATHS", 100)
		stats.set_int(MPX .. "MOGUL_DNOSE_SHOTS", 500)
		stats.set_int(MPX .. "MOGUL_DNOSE_HITS", 500)
		stats.set_int(MPX .. "MOGUL_DNOSE_HEADSHOTS", 500)
		stats.set_int(MPX .. "MOGUL_DNOSE_HELDTIME", 5963259)
		stats.set_int(MPX .. "MOGUL_DNOSE_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_TURR_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_TURR_DEATHS", 100)
		stats.set_int(MPX .. "MOGUL_TURR_SHOTS", 500)
		stats.set_int(MPX .. "MOGUL_TURR_HITS", 500)
		stats.set_int(MPX .. "MOGUL_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "MOGUL_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "MOGUL_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_DTURR_KILLS", 500)
		stats.set_int(MPX .. "MOGUL_DTURR_DEATHS", 100)
		stats.set_int(MPX .. "MOGUL_DTURR_SHOTS", 500)
		stats.set_int(MPX .. "MOGUL_DTURR_HITS", 500)
		stats.set_int(MPX .. "MOGUL_DTURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "MOGUL_DTURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "MOGUL_DTURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MOLOTOK_MG_KILLS", 500)
		stats.set_int(MPX .. "MOLOTOK_MG_DEATHS", 100)
		stats.set_int(MPX .. "MOLOTOK_MG_SHOTS", 500)
		stats.set_int(MPX .. "MOLOTOK_MG_HITS", 500)
		stats.set_int(MPX .. "MOLOTOK_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "MOLOTOK_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "MOLOTOK_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MOLOTOK_MISS_KILLS", 500)
		stats.set_int(MPX .. "MOLOTOK_MISS_DEATHS", 100)
		stats.set_int(MPX .. "MOLOTOK_MISS_SHOTS", 500)
		stats.set_int(MPX .. "MOLOTOK_MISS_HITS", 500)
		stats.set_int(MPX .. "MOLOTOK_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "MOLOTOK_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "NOKOTA_MG_KILLS", 500)
		stats.set_int(MPX .. "NOKOTA_MG_DEATHS", 100)
		stats.set_int(MPX .. "NOKOTA_MG_SHOTS", 500)
		stats.set_int(MPX .. "NOKOTA_MG_HITS", 500)
		stats.set_int(MPX .. "NOKOTA_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "NOKOTA_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "NOKOTA_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "NOKOTA_MISS_KILLS", 500)
		stats.set_int(MPX .. "NOKOTA_MISS_DEATHS", 100)
		stats.set_int(MPX .. "NOKOTA_MISS_SHOTS", 500)
		stats.set_int(MPX .. "NOKOTA_MISS_HITS", 500)
		stats.set_int(MPX .. "NOKOTA_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "NOKOTA_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "PYRO_MG_KILLS", 500)
		stats.set_int(MPX .. "PYRO_MG_DEATHS", 100)
		stats.set_int(MPX .. "PYRO_MG_SHOTS", 500)
		stats.set_int(MPX .. "PYRO_MG_HITS", 500)
		stats.set_int(MPX .. "PYRO_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "PYRO_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "PYRO_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "PYRO_MISS_KILLS", 500)
		stats.set_int(MPX .. "PYRO_MISS_DEATHS", 100)
		stats.set_int(MPX .. "PYRO_MISS_SHOTS", 500)
		stats.set_int(MPX .. "PYRO_MISS_HITS", 500)
		stats.set_int(MPX .. "PYRO_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "PYRO_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ROGUE_MG_KILLS", 500)
		stats.set_int(MPX .. "ROGUE_MG_DEATHS", 100)
		stats.set_int(MPX .. "ROGUE_MG_SHOTS", 500)
		stats.set_int(MPX .. "ROGUE_MG_HITS", 500)
		stats.set_int(MPX .. "ROGUE_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "ROGUE_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "ROGUE_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ROGUE_CANN_KILLS", 500)
		stats.set_int(MPX .. "ROGUE_CANN_DEATHS", 100)
		stats.set_int(MPX .. "ROGUE_CANN_SHOTS", 500)
		stats.set_int(MPX .. "ROGUE_CANN_HITS", 500)
		stats.set_int(MPX .. "ROGUE_CANN_HELDTIME", 5963259)
		stats.set_int(MPX .. "ROGUE_CANN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ROGUE_MISS_KILLS", 500)
		stats.set_int(MPX .. "ROGUE_MISS_DEATHS", 100)
		stats.set_int(MPX .. "ROGUE_MISS_SHOTS", 500)
		stats.set_int(MPX .. "ROGUE_MISS_HITS", 500)
		stats.set_int(MPX .. "ROGUE_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "ROGUE_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STARLING_MG_KILLS", 500)
		stats.set_int(MPX .. "STARLING_MG_DEATHS", 100)
		stats.set_int(MPX .. "STARLING_MG_SHOTS", 500)
		stats.set_int(MPX .. "STARLING_MG_HITS", 500)
		stats.set_int(MPX .. "STARLING_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "STARLING_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "STARLING_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STARLING_MISS_KILLS", 500)
		stats.set_int(MPX .. "STARLING_MISS_DEATHS", 100)
		stats.set_int(MPX .. "STARLING_MISS_SHOTS", 500)
		stats.set_int(MPX .. "STARLING_MISS_HITS", 500)
		stats.set_int(MPX .. "STARLING_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "STARLING_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SEABREEZE_MG_KILLS", 500)
		stats.set_int(MPX .. "SEABREEZE_MG_DEATHS", 100)
		stats.set_int(MPX .. "SEABREEZE_MG_SHOTS", 500)
		stats.set_int(MPX .. "SEABREEZE_MG_HITS", 500)
		stats.set_int(MPX .. "SEABREEZE_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "SEABREEZE_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "SEABREEZE_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TULA_MG_KILLS", 500)
		stats.set_int(MPX .. "TULA_MG_DEATHS", 100)
		stats.set_int(MPX .. "TULA_MG_SHOTS", 500)
		stats.set_int(MPX .. "TULA_MG_HITS", 500)
		stats.set_int(MPX .. "TULA_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "TULA_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "TULA_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TULA_SINGLEMG_KILLS", 500)
		stats.set_int(MPX .. "TULA_SINGLEMG_DEATHS", 100)
		stats.set_int(MPX .. "TULA_SINGLEMG_SHOTS", 500)
		stats.set_int(MPX .. "TULA_SINGLEMG_HITS", 500)
		stats.set_int(MPX .. "TULA_SINGLEMG_HEADSHOTS", 500)
		stats.set_int(MPX .. "TULA_SINGLEMG_HELDTIME", 5963259)
		stats.set_int(MPX .. "TULA_SINGLEMG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TULA_DUALMG_KILLS", 500)
		stats.set_int(MPX .. "TULA_DUALMG_DEATHS", 100)
		stats.set_int(MPX .. "TULA_DUALMG_SHOTS", 500)
		stats.set_int(MPX .. "TULA_DUALMG_HITS", 500)
		stats.set_int(MPX .. "TULA_DUALMG_HEADSHOTS", 500)
		stats.set_int(MPX .. "TULA_DUALMG_HELDTIME", 5963259)
		stats.set_int(MPX .. "TULA_DUALMG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TULA_MINI_KILLS", 500)
		stats.set_int(MPX .. "TULA_MINI_DEATHS", 100)
		stats.set_int(MPX .. "TULA_MINI_SHOTS", 500)
		stats.set_int(MPX .. "TULA_MINI_HITS", 500)
		stats.set_int(MPX .. "TULA_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "TULA_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "TULA_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VIGILANTE_MG_KILLS", 500)
		stats.set_int(MPX .. "VIGILANTE_MG_DEATHS", 100)
		stats.set_int(MPX .. "VIGILANTE_MG_SHOTS", 500)
		stats.set_int(MPX .. "VIGILANTE_MG_HITS", 500)
		stats.set_int(MPX .. "VIGILANTE_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "VIGILANTE_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "VIGILANTE_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VIGILANTE_MISS_KILLS", 500)
		stats.set_int(MPX .. "VIGILANTE_MISS_DEATHS", 100)
		stats.set_int(MPX .. "VIGILANTE_MISS_SHOTS", 500)
		stats.set_int(MPX .. "VIGILANTE_MISS_HITS", 500)
		stats.set_int(MPX .. "VIGILANTE_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "VIGILANTE_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BOXVILLE5_TURR_KILLS", 500)
		stats.set_int(MPX .. "BOXVILLE5_TURR_DEATHS", 100)
		stats.set_int(MPX .. "BOXVILLE5_TURR_SHOTS", 500)
		stats.set_int(MPX .. "BOXVILLE5_TURR_HITS", 500)
		stats.set_int(MPX .. "BOXVILLE5_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "BOXVILLE5_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "BOXVILLE5_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BLAZER5_CANNON_KILLS", 500)
		stats.set_int(MPX .. "BLAZER5_CANNON_DEATHS", 100)
		stats.set_int(MPX .. "BLAZER5_CANNON_SHOTS", 500)
		stats.set_int(MPX .. "BLAZER5_CANNON_HITS", 500)
		stats.set_int(MPX .. "BLAZER5_CANNON_HEADSHOTS", 500)
		stats.set_int(MPX .. "BLAZER5_CANNON_HELDTIME", 5963259)
		stats.set_int(MPX .. "BLAZER5_CANNON_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "RUINER2_BULLET_KILLS", 500)
		stats.set_int(MPX .. "RUINER2_BULLET_DEATHS", 100)
		stats.set_int(MPX .. "RUINER2_BULLET_SHOTS", 500)
		stats.set_int(MPX .. "RUINER2_BULLET_HITS", 500)
		stats.set_int(MPX .. "RUINER2_BULLET_HEADSHOTS", 500)
		stats.set_int(MPX .. "RUINER2_BULLET_HELDTIME", 5963259)
		stats.set_int(MPX .. "RUINER2_BULLET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "RUINER2_ROCKET_KILLS", 500)
		stats.set_int(MPX .. "RUINER2_ROCKET_DEATHS", 100)
		stats.set_int(MPX .. "RUINER2_ROCKET_SHOTS", 500)
		stats.set_int(MPX .. "RUINER2_ROCKET_HITS", 500)
		stats.set_int(MPX .. "RUINER2_ROCKET_HEADSHOTS", 500)
		stats.set_int(MPX .. "RUINER2_ROCKET_HELDTIME", 5963259)
		stats.set_int(MPX .. "RUINER2_ROCKET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL2_TURR_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL2_TURR_DEATHS", 100)
		stats.set_int(MPX .. "TECHNICAL2_TURR_SHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL2_TURR_HITS", 500)
		stats.set_int(MPX .. "TECHNICAL2_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL2_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "TECHNICAL2_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CRARMWREST", 500)
		stats.set_int(MPX .. "CRBASEJUMP", 500)
		stats.set_int(MPX .. "CRDARTS", 500)
		stats.set_int(MPX .. "CRDM", 500)
		stats.set_int(MPX .. "CRGANGHIDE", 500)
		stats.set_int(MPX .. "CRGOLF", 500)
		stats.set_int(MPX .. "CRHORDE", 500)
		stats.set_int(MPX .. "CRMISSION", 500)
		stats.set_int(MPX .. "CRSHOOTRNG", 500)
		stats.set_int(MPX .. "CRTENNIS", 500)
		stats.set_int(MPX .. "NO_TIMES_CINEMA", 500)
		stats.set_int(MPX .. "AWD_CONTRACTOR", 50)
		stats.set_int(MPX .. "AWD_COLD_CALLER", 50)
		stats.set_int(MPX .. "AWD_PRODUCER", 60)
		stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", 10)
		stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", -1)
		stats.set_int(MPX .. "TWR_INITIALS_0", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_1", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_2", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_3", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_4", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_5", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_6", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_7", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_8", 69644)
		stats.set_int(MPX .. "TWR_INITIALS_9", 69644)
		stats.set_int(MPX .. "TWR_SCORE_0", 50)
		stats.set_int(MPX .. "TWR_SCORE_1", 50)
		stats.set_int(MPX .. "TWR_SCORE_2", 50)
		stats.set_int(MPX .. "TWR_SCORE_3", 50)
		stats.set_int(MPX .. "TWR_SCORE_4", 50)
		stats.set_int(MPX .. "TWR_SCORE_5", 50)
		stats.set_int(MPX .. "TWR_SCORE_6", 50)
		stats.set_int(MPX .. "TWR_SCORE_7", 50)
		stats.set_int(MPX .. "TWR_SCORE_8", 50)
		stats.set_int(MPX .. "TWR_SCORE_9", 50)
		stats.set_int(MPX .. "GGSM_INITIALS_0", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_1", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_2", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_3", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_4", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_5", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_6", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_7", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_8", 69644)
		stats.set_int(MPX .. "GGSM_INITIALS_9", 69644)
		stats.set_int(MPX .. "GGSM_SCORE_0", 50)
		stats.set_int(MPX .. "GGSM_SCORE_1", 50)
		stats.set_int(MPX .. "GGSM_SCORE_2", 50)
		stats.set_int(MPX .. "GGSM_SCORE_3", 50)
		stats.set_int(MPX .. "GGSM_SCORE_4", 50)
		stats.set_int(MPX .. "GGSM_SCORE_5", 50)
		stats.set_int(MPX .. "GGSM_SCORE_6", 50)
		stats.set_int(MPX .. "GGSM_SCORE_7", 50)
		stats.set_int(MPX .. "GGSM_SCORE_8", 50)
		stats.set_int(MPX .. "GGSM_SCORE_9", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_0", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_1", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_2", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_3", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_4", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_5", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_6", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_7", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_8", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_9", 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_0", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_1", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_2", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_3", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_4", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_5", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_6", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_7", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_8", 50)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_9", 50)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_0", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_1", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_2", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_3", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_4", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_5", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_6", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_7", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_8", 69644)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_9", 69644)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_0", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_1", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_2", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_3", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_4", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_5", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_6", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_7", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_8", 50)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_9", 50)
		stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", -1)
		stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", -1)
		stats.set_int(MPX .. "AWD_PREPARATION", 40)
		stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
		stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
		stats.set_int(MPX .. "AWD_BIGBRO", 40)
		stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
		stats.set_int(MPX .. "AWD_RACECHAMP", 40)
		stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
		stats.set_int(MPX .. "AWD_COINPURSE", 950000)
		stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
		stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 50)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 50)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 501)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 50)
		stats.set_int(MPX .. "IAP_MA0_MOON_DIST", 2147483647)
		stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 47)
		stats.set_int(MPX .. "IAP_INITIALS_0", 50)
		stats.set_int(MPX .. "IAP_INITIALS_1", 50)
		stats.set_int(MPX .. "IAP_INITIALS_2", 50)
		stats.set_int(MPX .. "IAP_INITIALS_3", 50)
		stats.set_int(MPX .. "IAP_INITIALS_4", 50)
		stats.set_int(MPX .. "IAP_INITIALS_5", 50)
		stats.set_int(MPX .. "IAP_INITIALS_6", 50)
		stats.set_int(MPX .. "IAP_INITIALS_7", 50)
		stats.set_int(MPX .. "IAP_INITIALS_8", 50)
		stats.set_int(MPX .. "IAP_INITIALS_9", 50)
		stats.set_int(MPX .. "IAP_SCORE_0", 69644)
		stats.set_int(MPX .. "IAP_SCORE_1", 50333)
		stats.set_int(MPX .. "IAP_SCORE_2", 63512)
		stats.set_int(MPX .. "IAP_SCORE_3", 46136)
		stats.set_int(MPX .. "IAP_SCORE_4", 21638)
		stats.set_int(MPX .. "IAP_SCORE_5", 2133)
		stats.set_int(MPX .. "IAP_SCORE_6", 1215)
		stats.set_int(MPX .. "IAP_SCORE_7", 2444)
		stats.set_int(MPX .. "IAP_SCORE_8", 38023)
		stats.set_int(MPX .. "IAP_SCORE_9", 2233)
		stats.set_int(MPX .. "SCGW_SCORE_1", 50)
		stats.set_int(MPX .. "SCGW_SCORE_2", 50)
		stats.set_int(MPX .. "SCGW_SCORE_3", 50)
		stats.set_int(MPX .. "SCGW_SCORE_4", 50)
		stats.set_int(MPX .. "SCGW_SCORE_5", 50)
		stats.set_int(MPX .. "SCGW_SCORE_6", 50)
		stats.set_int(MPX .. "SCGW_SCORE_7", 50)
		stats.set_int(MPX .. "SCGW_SCORE_8", 50)
		stats.set_int(MPX .. "SCGW_SCORE_9", 50)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_0", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_1", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_2", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_3", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_4", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_5", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_6", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_7", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_8", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_9", 69644)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_0", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_1", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_2", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_3", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_4", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_5", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_6", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_7", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_8", 50)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_9", 50)
		stats.set_int(MPX .. "AWD_CAR_CLUB_MEM", 100)
		stats.set_int(MPX .. "AWD_SPRINTRACER", 50)
		stats.set_int(MPX .. "AWD_STREETRACER", 50)
		stats.set_int(MPX .. "AWD_PURSUITRACER", 50)
		stats.set_int(MPX .. "AWD_TEST_CAR", 240)
		stats.set_int(MPX .. "AWD_AUTO_SHOP", 50)
		stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
		stats.set_int(MPX .. "AWD_GROUNDWORK", 40)
		stats.set_int(MPX .. "AWD_ROBBERY_CONTRACT", 100)
		stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 100)
end)
RONECLICKMenu:add_action("Stats Part 3",  function()
			stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_3", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_4", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_5", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_6", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_7", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_OUTFIT", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_10", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_3", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_4", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_5", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_6", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_7", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_8", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_9", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL2_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_3", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_4", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_5", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_6", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_7", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_TEETH", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_TEETH_1", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_TEETH_2", -1)
		stats.set_int(MPX .. "CLTHS_AVAILABLE_TORSO", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_0", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_1", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_10", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_11", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_12", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_13", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_14", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_15", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_16", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_17", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_18", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_19", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_2", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_20", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_21", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_22", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_23", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_24", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_25", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_26", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_27", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_28", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_29", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_3", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_30", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_31", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_32", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_33", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_34", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_35", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_36", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_37", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_38", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_39", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_4", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_40", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_5", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_6", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_7", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_8", -1)
		stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_9", -1)
		stats.set_int(MPX .. "GRENADE_ENEMY_KILLS", 50)
		stats.set_int(MPX .. "MICROSMG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SMG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ASLTSMG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ASLTRIFLE_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CRBNRIFLE_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ADVRIFLE_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CMBTMG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ASLTMG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "RPG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "LONGEST_WHEELIE_DIST", 1000)
		stats.set_int(MPX .. "MOST_ARM_WRESTLING_WINS", 25)
		stats.set_int(MPX .. "NO_CARS_REPAIR", 1000)
		stats.set_int(MPX .. "VEHICLES_SPRAYED", 500)
		stats.set_int(MPX .. "NUMBER_NEAR_MISS_NOCRASH", 500)
		stats.set_int(MPX .. "USJS_FOUND", 50)
		stats.set_int(MPX .. "USJS_FOUND_MASK", 50)
		stats.set_int(MPX .. "USJS_COMPLETED", 50)
		stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 50)
		stats.set_int(MPX .. "USJS_COMPLETED_MASK", 50)
		stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
		stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
		stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
		stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
		stats.set_int(MPX .. "PASS_DB_PLAYER_KILLS", 100)
		stats.set_int(MPX .. "PISTOL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "PLAYER_HEADSHOTS", 500)
		stats.set_int(MPX .. "RACES_WON", 50)
		stats.set_int(MPX .. "SAWNOFF_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SCRIPT_INCREASE_DRIV", 100)
		stats.set_int(MPX .. "SCRIPT_INCREASE_FLY", 100)
		stats.set_int(MPX .. "SCRIPT_INCREASE_LUNG", 100)
		stats.set_int(MPX .. "SCRIPT_INCREASE_MECH", 100)
		stats.set_int(MPX .. "SCRIPT_INCREASE_SHO", 100)
		stats.set_int(MPX .. "SCRIPT_INCREASE_STAM", 100)
		stats.set_int(MPX .. "SCRIPT_INCREASE_STL", 100)
		stats.set_int(MPX .. "SCRIPT_INCREASE_STRN", 100)
		stats.set_int(MPX .. "STKYBMB_ENEMY_KILLS", 50)
		stats.set_int(MPX .. "UNARMED_ENEMY_KILLS", 50)
		stats.set_int(MPX .. "USJS_COMPLETED", 50)
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", -1)
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH2", -1)
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH3", -1)
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH4", -1)
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH5", -1)
		stats.set_int(MPX .. "CRDEADLINE", 5)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_FM_ABILITY_3_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_1_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_2_UNLCK", -1)
		stats.set_int(MPX .. "CHAR_ABILITY_3_UNLCK", -1)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_COMPLET", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_UNDERTA", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_COMPLET", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_UNDERTA", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_COMPLET1", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_UNDERTA1", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_COMPLET1", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_UNDERTA1", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_COMPLET2", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_UNDERTA2", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_COMPLET2", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_UNDERTA2", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_COMPLET3", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_UNDERTA3", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_COMPLET3", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_UNDERTA3", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_COMPLET4", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_UNDERTA4", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_COMPLET4", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_UNDERTA4", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_COMPLET5", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_BUY_UNDERTA5", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_COMPLET5", 1000)
		stats.set_int(MPX .. "LIFETIME_BIKER_SELL_UNDERTA5", 1000)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_EARNINGS0", 20000000)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_EARNINGS1", 20000000)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_EARNINGS2", 20000000)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_EARNINGS3", 20000000)
		stats.set_int(MPX .. "LIFETIME_BKR_SELL_EARNINGS4", 20000000)
		stats.set_int(MPX .. "LFETIME_IE_EXPORT_COMPLETED", 1000)
		stats.set_int(MPX .. "LFETIME_IE_MISSION_EARNINGS", 20000000)
		stats.set_int(MPX .. "LFETIME_HANGAR_SEL_UNDETAK", 1000)
		stats.set_int(MPX .. "LFETIME_HANGAR_SEL_COMPLET", 1000)
		stats.set_int(MPX .. "LFETIME_HANGAR_EARNINGS", 20000000)
		stats.set_int(MPX .. "SR_HIGHSCORE_1", 690)
		stats.set_int(MPX .. "SR_HIGHSCORE_2", 1860)
		stats.set_int(MPX .. "SR_HIGHSCORE_3", 2690)
		stats.set_int(MPX .. "SR_HIGHSCORE_4", 2660)
		stats.set_int(MPX .. "SR_HIGHSCORE_5", 2650)
		stats.set_int(MPX .. "SR_HIGHSCORE_6", 450)
		stats.set_int(MPX .. "SR_TARGETS_HIT", 269)
		stats.set_int(MPX .. "SR_WEAPON_BIT_SET", -1)
		stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 9999)
		stats.set_int(MPX .. "NO_BOUGHT_YUM_SNACKS", 1000)
		stats.set_int(MPX .. "AWD_DANCE_TO_SOLOMUN", 100)
		stats.set_int(MPX .. "AWD_DANCE_TO_TALEOFUS", 100)
		stats.set_int(MPX .. "AWD_DANCE_TO_DIXON", 100)
		stats.set_int(MPX .. "AWD_DANCE_TO_BLKMAD", 100)
		stats.set_int(MPX .. "AWD_CLUB_DRUNK", 200)
		stats.set_int(MPX .. "NUMUNIQUEPLYSINCLUB", 100)
		stats.set_int(MPX .. "DANCETODIFFDJS", 4)
		stats.set_int(MPX .. "DANCEPERFECTOWNCLUB", 100)
		stats.set_int(MPX .. "NIGHTCLUB_HOTSPOT_TIME_MS", 3600000)
		stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 50)
		stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 50)
		stats.set_int(MPX .. "AWD_READY_FOR_WAR", 60)
		stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 60)
		stats.set_int(MPX .. "AWD_SPINNER", 60)
		stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 50)
		stats.set_int(MPX .. "AWD_MASTER_BANDITO", 50)
		stats.set_int(MPX .. "AWD_SITTING_DUCK", 60)
		stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 60)
		stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 60)
		stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 60)
		stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 200)
		stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 52)
		stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 20000000)
		stats.set_int(MPX .. "AWD_TIME_SERVED", 1000)
		stats.set_int(MPX .. "AWD_TOP_SCORE", 500000)
		stats.set_int(MPX .. "AWD_CAREER_WINNER", 1000)
		stats.set_int(MPX .. "ARENAWARS_SKILL_LEVEL", 20)
		stats.set_int(MPX .. "ARENAWARS_AP_TIER", 1000)
		stats.set_int(MPX .. "ARENAWARS_AP_LIFETIME", 47551850)
		stats.set_int(MPX .. "ARN_W_THEME_SCIFI", 1000)
		stats.set_int(MPX .. "ARN_W_THEME_APOC", 1000)
		stats.set_int(MPX .. "ARN_W_THEME_CONS", 1000)
		stats.set_int(MPX .. "ARN_W_PASS_THE_BOMB", 1000)
		stats.set_int(MPX .. "ARN_W_DETONATION", 1000)
		stats.set_int(MPX .. "ARN_W_ARCADE_RACE", 1000)
		stats.set_int(MPX .. "ARN_W_CTF", 1000)
		stats.set_int(MPX .. "ARN_W_TAG_TEAM", 1000)
		stats.set_int(MPX .. "ARN_W_DESTR_DERBY", 1000)
		stats.set_int(MPX .. "ARN_W_CARNAGE", 1000)
		stats.set_int(MPX .. "ARN_W_MONSTER_JAM", 1000)
		stats.set_int(MPX .. "ARN_W_GAMES_MASTERS", 1000)
		stats.set_int(MPX .. "ARN_L_PASS_THE_BOMB", 500)
		stats.set_int(MPX .. "ARN_L_DETONATION", 500)
		stats.set_int(MPX .. "ARN_L_ARCADE_RACE", 500)
		stats.set_int(MPX .. "ARN_L_CTF", 500)
		stats.set_int(MPX .. "ARN_L_TAG_TEAM", 500)
		stats.set_int(MPX .. "ARN_L_DESTR_DERBY", 500)
		stats.set_int(MPX .. "ARN_L_CARNAGE", 500)
		stats.set_int(MPX .. "ARN_L_MONSTER_JAM", 500)
		stats.set_int(MPX .. "ARN_L_GAMES_MASTERS", 500)
		stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
		stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 1000)
		stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 1000)
		stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 500)
		stats.set_int(MPX .. "ARENAWARS_CARRER_WINS", 1000)
		stats.set_int(MPX .. "ARENAWARS_CARRER_WINT", 1000)
		stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYD", 1000)
		stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYDT", 1000)
		stats.set_int(MPX .. "ARN_SPECTATOR_DRONE", 1000)
		stats.set_int(MPX .. "ARN_SPECTATOR_CAMS", 1000)
		stats.set_int(MPX .. "ARN_SMOKE", 1000)
		stats.set_int(MPX .. "ARN_DRINK", 1000)
		stats.set_int(MPX .. "ARN_VEH_MONSTER3", 1000)
		stats.set_int(MPX .. "ARN_VEH_MONSTER4", 1000)
		stats.set_int(MPX .. "ARN_VEH_MONSTER5", 1000)
		stats.set_int(MPX .. "ARN_VEH_CERBERUS", 1000)
		stats.set_int(MPX .. "ARN_VEH_CERBERUS2", 1000)
		stats.set_int(MPX .. "ARN_VEH_CERBERUS3", 1000)
		stats.set_int(MPX .. "ARN_VEH_BRUISER", 1000)
		stats.set_int(MPX .. "ARN_VEH_BRUISER2", 1000)
		stats.set_int(MPX .. "ARN_VEH_BRUISER3", 1000)
		stats.set_int(MPX .. "ARN_VEH_SLAMVAN4", 1000)
		stats.set_int(MPX .. "ARN_VEH_SLAMVAN5", 1000)
		stats.set_int(MPX .. "ARN_VEH_SLAMVAN6", 1000)
		stats.set_int(MPX .. "ARN_VEH_BRUTUS", 1000)
		stats.set_int(MPX .. "ARN_VEH_BRUTUS2", 1000)
		stats.set_int(MPX .. "ARN_VEH_BRUTUS3", 1000)
		stats.set_int(MPX .. "ARN_VEH_SCARAB", 1000)
		stats.set_int(MPX .. "ARN_VEH_SCARAB2", 1000)
		stats.set_int(MPX .. "ARN_VEH_SCARAB3", 1000)
		stats.set_int(MPX .. "ARN_VEH_DOMINATOR4", 1000)
		stats.set_int(MPX .. "ARN_VEH_DOMINATOR5", 1000)
		stats.set_int(MPX .. "ARN_VEH_DOMINATOR6", 1000)
		stats.set_int(MPX .. "ARN_VEH_IMPALER2", 1000)
		stats.set_int(MPX .. "ARN_VEH_IMPALER3", 1000)
		stats.set_int(MPX .. "ARN_VEH_IMPALER4", 1000)
		stats.set_int(MPX .. "ARN_VEH_ISSI4", 1000)
		stats.set_int(MPX .. "ARN_VEH_ISSI5", 1000)
		stats.set_int(MPX .. "ARN_VEH_ISSI6", 1000)
		stats.set_int(MPX .. "ARN_VEH_IMPERATOR", 1000)
		stats.set_int(MPX .. "ARN_VEH_IMPERATOR2", 1000)
		stats.set_int(MPX .. "ARN_VEH_IMPERATOR3", 1000)
		stats.set_int(MPX .. "ARN_VEH_ZR380", 1000)
		stats.set_int(MPX .. "ARN_VEH_ZR3802", 1000)
		stats.set_int(MPX .. "ARN_VEH_ZR3803", 1000)
		stats.set_int(MPX .. "ARN_VEH_DEATHBIKE", 1000)
		stats.set_int(MPX .. "ARN_VEH_DEATHBIKE2", 1000)
		stats.set_int(MPX .. "ARN_VEH_DEATHBIKE3", 1000)
		stats.set_int(MPX .. "NO_BOUGHT_HEALTH_SNACKS", 1000)
		stats.set_int(MPX .. "NO_BOUGHT_EPIC_SNACKS", 1000)
		stats.set_int(MPX .. "NUMBER_OF_ORANGE_BOUGHT", 1000)
		stats.set_int(MPX .. "MP_CHAR_ARMOUR_1_COUNT", 1000)
		stats.set_int(MPX .. "MP_CHAR_ARMOUR_2_COUNT", 1000)
		stats.set_int(MPX .. "MP_CHAR_ARMOUR_3_COUNT", 1000)
		stats.set_int(MPX .. "MP_CHAR_ARMOUR_4_COUNT", 1000)
		stats.set_int(MPX .. "MP_CHAR_ARMOUR_5_COUNT", 1000)
		stats.set_int(MPX .. "NUMBER_OF_BOURGE_BOUGHT", 1000)
		stats.set_int(MPX .. "CIGARETTES_BOUGHT", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_4_WHITE", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_4_RED", 1000)
		stats.set_int(MPX .. "FIREWORK_TYPE_4_BLUE", 1000)
		stats.set_int(MPX .. "FM_ACT_PHN", -1)
		stats.set_int(MPX .. "FM_ACT_PH2", -1)
		stats.set_int(MPX .. "FM_ACT_PH3", -1)
		stats.set_int(MPX .. "FM_ACT_PH4", -1)
		stats.set_int(MPX .. "FM_ACT_PH5", -1)
		stats.set_int(MPX .. "FM_VEH_TX1", -1)
		stats.set_int(MPX .. "FM_ACT_PH6", -1)
		stats.set_int(MPX .. "FM_ACT_PH7", -1)
		stats.set_int(MPX .. "FM_ACT_PH8", -1)
		stats.set_int(MPX .. "FM_ACT_PH9", -1)
		stats.set_int(MPX .. "LOWRIDER_FLOW_COMPLETE", 3)
		stats.set_int(MPX .. "LOW_FLOW_CURRENT_PROG", 9)
		stats.set_int(MPX .. "LOW_FLOW_CURRENT_CALL", 9)
		stats.set_int(MPX .. "CR_GANGOP_MORGUE", 10)
		stats.set_int(MPX .. "CR_GANGOP_DELUXO", 10)
		stats.set_int(MPX .. "CR_GANGOP_SERVERFARM", 10)
		stats.set_int(MPX .. "CR_GANGOP_IAABASE_FIN", 10)
		stats.set_int(MPX .. "CR_GANGOP_STEALOSPREY", 10)
		stats.set_int(MPX .. "CR_GANGOP_FOUNDRY", 10)
		stats.set_int(MPX .. "CR_GANGOP_RIOTVAN", 10)
		stats.set_int(MPX .. "CR_GANGOP_SUBMARINECAR", 10)
		stats.set_int(MPX .. "CR_GANGOP_SUBMARINE_FIN", 10)
		stats.set_int(MPX .. "CR_GANGOP_PREDATOR", 10)
		stats.set_int(MPX .. "CR_GANGOP_BMLAUNCHER", 10)
		stats.set_int(MPX .. "CR_GANGOP_BCCUSTOM", 10)
		stats.set_int(MPX .. "CR_GANGOP_STEALTHTANKS", 10)
		stats.set_int(MPX .. "CR_GANGOP_SPYPLANE", 10)
		stats.set_int(MPX .. "CR_GANGOP_FINALE", 10)
		stats.set_int(MPX .. "CR_GANGOP_FINALE_P2", 10)
		stats.set_int(MPX .. "CR_GANGOP_FINALE_P3", 10)
		stats.set_int(MPX .. "SNIPERRFL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "KILLS_COP", 4500)
		stats.set_int(MPX .. "KILLS_SWAT", 500)
		stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME", 5000)
		stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 200)
		stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 200)
		stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 200)
		stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 200)
		stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 200)
		stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 200)
		stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 200)
		stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 200)
		stats.set_int(MPX .. "STARS_ATTAINED", 5000)
		stats.set_int(MPX .. "STARS_EVADED", 4000)
		stats.set_int(MPX .. "VEHEXPORTED", 500)
		stats.set_int(MPX .. "TOTAL_NO_SHOPS_HELD_UP", 100)
		stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 500)
		stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 500)
		stats.set_int(MPX .. "CR_GANGATTACK_CITY", 500)
		stats.set_int(MPX .. "CR_GANGATTACK_COUNTRY", 500)
		stats.set_int(MPX .. "CR_GANGATTACK_LOST", 500)
		stats.set_int(MPX .. "CR_GANGATTACK_VAGOS", 500)
		stats.set_int(MPX .. "HORDKILLS", 500)
		stats.set_int(MPX .. "GHKILLS", 500)
		stats.set_int(MPX .. "NO_NON_CONTRACT_RACE_WIN", 500)
		stats.set_int(MPX .. "DB_SHOTTIME", 596)
		stats.set_int(MPX .. "DB_KILLS", 500)
		stats.set_int(MPX .. "DB_PLAYER_KILLS", 500)
		stats.set_int(MPX .. "DB_SHOTS", 500)
		stats.set_int(MPX .. "DB_HITS", 500)
		stats.set_int(MPX .. "DB_HITS_PEDS_VEHICLES", 500)
		stats.set_int(MPX .. "DB_HEADSHOTS", 500)
		stats.set_int(MPX .. "LFETIME_BIKER_BUY_COMPLET5", 14)
		stats.set_int(MPX .. "USJS_COMPLETED", 25)
		stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
		stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 1000)
		stats.set_int(MPX .. "AWD_WIN_CAPTURES", 500)
		stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
		stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
		stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
		stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
		stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
		stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
		stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
		stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
		stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
		stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
		stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
		stats.set_int(MPX .. "RACES_WON", 50)
		stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 884483972)
		stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 884483972)
		stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 884483972)
		stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 884483972)
		stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", 1000)
		stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", 1000)
		stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", 1000)
		stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", 1000)
		stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", 30000000)
		stats.set_int(MPX .. "TATTOO_FM_CURRENT_32", 32768)
		stats.set_int(MPX .. "TATTOO_FM_CURRENT_32", 67108864)
		stats.set_int(MPX .. "DELUXO_BULLET_HITS", 500)
		stats.set_int(MPX .. "DELUXO_BULLET_HEADSHOTS", 500)
		stats.set_int(MPX .. "DELUXO_BULLET_HELDTIME", 5963259)
		stats.set_int(MPX .. "DELUXO_BULLET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DELUXO_ROCKET_KILLS", 500)
		stats.set_int(MPX .. "DELUXO_ROCKET_DEATHS", 100)
		stats.set_int(MPX .. "DELUXO_ROCKET_SHOTS", 500)
		stats.set_int(MPX .. "DELUXO_ROCKET_HITS", 500)
		stats.set_int(MPX .. "DELUXO_ROCKET_HELDTIME", 5963259)
		stats.set_int(MPX .. "DELUXO_ROCKET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DELUXO_BULLET_KILLS", 500)
		stats.set_int(MPX .. "DELUXO_BULLET_DEATHS", 100)
		stats.set_int(MPX .. "DELUXO_BULLET_SHOTS", 500)
		stats.set_int(MPX .. "COMET4_MG_KILLS", 500)
		stats.set_int(MPX .. "COMET4_MG_DEATHS", 100)
		stats.set_int(MPX .. "COMET4_MG_SHOTS", 500)
		stats.set_int(MPX .. "COMET4_MG_HITS", 500)
		stats.set_int(MPX .. "COMET4_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "COMET4_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "COMET4_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CHERNOBOG_MISS_KILLS", 500)
		stats.set_int(MPX .. "CHERNOBOG_MISS_DEATHS", 100)
		stats.set_int(MPX .. "CHERNOBOG_MISS_SHOTS", 500)
		stats.set_int(MPX .. "CHERNOBOG_MISS_HITS", 500)
		stats.set_int(MPX .. "CHERNOBOG_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "CHERNOBOG_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MG_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MG_DEATHS", 100)
		stats.set_int(MPX .. "BARRAGE_R_MG_SHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MG_HITS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "BARRAGE_R_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MINI_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MINI_DEATHS", 100)
		stats.set_int(MPX .. "BARRAGE_R_MINI_SHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MINI_HITS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_R_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "BARRAGE_R_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_R_GL_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_R_GL_DEATHS", 100)
		stats.set_int(MPX .. "BARRAGE_R_GL_SHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_R_GL_HITS", 500)
		stats.set_int(MPX .. "BARRAGE_R_GL_HELDTIME", 5963259)
		stats.set_int(MPX .. "BARRAGE_R_GL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MG_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MG_DEATHS", 100)
		stats.set_int(MPX .. "BARRAGE_T_MG_SHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MG_HITS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "BARRAGE_T_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MINI_KILLS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MINI_DEATHS", 100)
		stats.set_int(MPX .. "BARRAGE_T_MINI_SHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MINI_HITS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "BARRAGE_T_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "BARRAGE_T_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "AVENGER_CANNON_KILLS", 500)
		stats.set_int(MPX .. "AVENGER_CANNON_DEATHS", 100)
		stats.set_int(MPX .. "AVENGER_CANNON_SHOTS", 500)
		stats.set_int(MPX .. "AVENGER_CANNON_HITS", 500)
		stats.set_int(MPX .. "AVENGER_CANNON_HELDTIME", 5963259)
		stats.set_int(MPX .. "AVENGER_CANNON_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "AKULA_TURR_KILLS", 500)
		stats.set_int(MPX .. "AKULA_TURR_DEATHS", 100)
		stats.set_int(MPX .. "AKULA_TURR_SHOTS", 500)
		stats.set_int(MPX .. "AKULA_TURR_HITS", 500)
		stats.set_int(MPX .. "AKULA_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "AKULA_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "AKULA_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "AKULA_DTURR_KILLS", 500)
		stats.set_int(MPX .. "AKULA_DTURR_DEATHS", 100)
		stats.set_int(MPX .. "AKULA_DTURR_SHOTS", 500)
		stats.set_int(MPX .. "AKULA_DTURR_HITS", 500)
		stats.set_int(MPX .. "AKULA_DTURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "AKULA_DTURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "AKULA_DTURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "AKULA_MINI_KILLS", 500)
		stats.set_int(MPX .. "AKULA_MINI_DEATHS", 100)
		stats.set_int(MPX .. "AKULA_MINI_SHOTS", 500)
		stats.set_int(MPX .. "AKULA_MINI_HITS", 500)
		stats.set_int(MPX .. "AKULA_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "AKULA_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "AKULA_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "AKULA_BARR_KILLS", 500)
		stats.set_int(MPX .. "AKULA_BARR_DEATHS", 100)
		stats.set_int(MPX .. "AKULA_BARR_SHOTS", 500)
		stats.set_int(MPX .. "AKULA_BARR_HITS", 500)
		stats.set_int(MPX .. "AKULA_BARR_HELDTIME", 5963259)
		stats.set_int(MPX .. "AKULA_BARR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "AKULA_ROCKET_KILLS", 500)
		stats.set_int(MPX .. "AKULA_ROCKET_DEATHS", 100)
		stats.set_int(MPX .. "AKULA_ROCKET_SHOTS", 500)
		stats.set_int(MPX .. "AKULA_ROCKET_HITS", 500)
		stats.set_int(MPX .. "AKULA_ROCKET_HELDTIME", 5963259)
		stats.set_int(MPX .. "AKULA_ROCKET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ARENA_MG_KILLS", 500)
		stats.set_int(MPX .. "ARENA_MG_DEATHS", 100)
		stats.set_int(MPX .. "ARENA_MG_SHOTS", 500)
		stats.set_int(MPX .. "ARENA_MG_HITS", 500)
		stats.set_int(MPX .. "ARENA_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "ARENA_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "ARENA_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ARENA_HM_KILLS", 500)
		stats.set_int(MPX .. "ARENA_HM_DEATHS", 100)
		stats.set_int(MPX .. "ARENA_HM_SHOTS", 500)
		stats.set_int(MPX .. "ARENA_HM_HITS", 500)
		stats.set_int(MPX .. "ARENA_HM_HELDTIME", 5963259)
		stats.set_int(MPX .. "RCMINE_KIN_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_KIN_DEATHS", 100)
		stats.set_int(MPX .. "RCMINE_KIN_SHOTS", 500)
		stats.set_int(MPX .. "RCMINE_KIN_HITS", 500)
		stats.set_int(MPX .. "RCMINE_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_EMP_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_EMP_DEATHS", 100)
		stats.set_int(MPX .. "RCMINE_EMP_SHOTS", 500)
		stats.set_int(MPX .. "RCMINE_EMP_HITS", 500)
		stats.set_int(MPX .. "RCMINE_EMP_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_SPI_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_SPI_DEATHS", 100)
		stats.set_int(MPX .. "RCMINE_SPI_SHOTS", 500)
		stats.set_int(MPX .. "RCMINE_SPI_HITS", 500)
		stats.set_int(MPX .. "RCMINE_SPI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_SLI_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_SLI_DEATHS", 100)
		stats.set_int(MPX .. "RCMINE_SLI_SHOTS", 500)
		stats.set_int(MPX .. "RCMINE_SLI_HITS", 500)
		stats.set_int(MPX .. "RCMINE_SLI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_TAR_KILLS", 500)
		stats.set_int(MPX .. "RCMINE_TAR_DEATHS", 100)
		stats.set_int(MPX .. "RCMINE_TAR_SHOTS", 500)
		stats.set_int(MPX .. "RCMINE_TAR_HITS", 500)
		stats.set_int(MPX .. "RCMINE_TAR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_DEATHS", 100)
		stats.set_int(MPX .. "VEHMINE_SHOTS", 500)
		stats.set_int(MPX .. "VEHMINE_HITS", 500)
		stats.set_int(MPX .. "VEHMINE_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_KIN_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_KIN_DEATHS", 100)
		stats.set_int(MPX .. "VEHMINE_KIN_SHOTS", 500)
		stats.set_int(MPX .. "VEHMINE_KIN_HITS", 500)
		stats.set_int(MPX .. "VEHMINE_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_EMP_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_EMP_DEATHS", 100)
		stats.set_int(MPX .. "VEHMINE_EMP_SHOTS", 500)
		stats.set_int(MPX .. "VEHMINE_EMP_HITS", 500)
		stats.set_int(MPX .. "VEHMINE_EMP_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_SPI_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_SPI_DEATHS", 100)
		stats.set_int(MPX .. "VEHMINE_SPI_SHOTS", 500)
		stats.set_int(MPX .. "VEHMINE_SPI_HITS", 500)
		stats.set_int(MPX .. "VEHMINE_SPI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_SLI_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_SLI_DEATHS", 100)
		stats.set_int(MPX .. "VEHMINE_SLI_SHOTS", 500)
		stats.set_int(MPX .. "VEHMINE_SLI_HITS", 500)
		stats.set_int(MPX .. "VEHMINE_SLI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_TAR_KILLS", 500)
		stats.set_int(MPX .. "VEHMINE_TAR_DEATHS", 100)
		stats.set_int(MPX .. "VEHMINE_TAR_SHOTS", 500)
		stats.set_int(MPX .. "VEHMINE_TAR_HITS", 500)
		stats.set_int(MPX .. "VEHMINE_TAR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ZR3803_MG50_KILLS", 500)
		stats.set_int(MPX .. "ZR3803_MG50_DEATHS", 100)
		stats.set_int(MPX .. "ZR3803_MG50_SHOTS", 500)
		stats.set_int(MPX .. "ZR3803_MG50_HITS", 500)
		stats.set_int(MPX .. "ZR3803_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "ZR3803_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "ZR3803_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ZR3802_MG50_KILLS", 500)
		stats.set_int(MPX .. "ZR3802_MG50_DEATHS", 100)
		stats.set_int(MPX .. "ZR3802_MG50_SHOTS", 500)
		stats.set_int(MPX .. "ZR3802_MG50_HITS", 500)
		stats.set_int(MPX .. "ZR3802_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "ZR3802_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "ZR3802_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ZR3802_LAS_KILLS", 500)
		stats.set_int(MPX .. "ZR3802_LAS_DEATHS", 100)
		stats.set_int(MPX .. "ZR3802_LAS_SHOTS", 500)
		stats.set_int(MPX .. "ZR3802_LAS_HITS", 500)
		stats.set_int(MPX .. "ZR3802_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "ZR3802_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "ZR3802_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ZR380_MG50_KILLS", 500)
		stats.set_int(MPX .. "ZR380_MG50_DEATHS", 100)
		stats.set_int(MPX .. "ZR380_MG50_SHOTS", 500)
		stats.set_int(MPX .. "ZR380_MG50_HITS", 500)
		stats.set_int(MPX .. "ZR380_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "ZR380_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "ZR380_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN4_MG50_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN4_MG50_DEATHS", 100)
		stats.set_int(MPX .. "SLAMVAN4_MG50_SHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN4_MG50_HITS", 500)
		stats.set_int(MPX .. "SLAMVAN4_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN4_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "SLAMVAN4_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN5_MG50_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN5_MG50_DEATHS", 100)
		stats.set_int(MPX .. "SLAMVAN5_MG50_SHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN5_MG50_HITS", 500)
		stats.set_int(MPX .. "SLAMVAN5_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN5_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "SLAMVAN5_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN5_LAS_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN5_LAS_DEATHS", 100)
		stats.set_int(MPX .. "SLAMVAN5_LAS_SHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN5_LAS_HITS", 500)
		stats.set_int(MPX .. "SLAMVAN5_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN5_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "SLAMVAN5_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN6_MG50_KILLS", 500)
		stats.set_int(MPX .. "SLAMVAN6_MG50_DEATHS", 100)
		stats.set_int(MPX .. "SLAMVAN6_MG50_SHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN6_MG50_HITS", 500)
		stats.set_int(MPX .. "SLAMVAN6_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "SLAMVAN6_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "SLAMVAN6_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SCARAB_MG50_KILLS", 500)
		stats.set_int(MPX .. "SCARAB_MG50_DEATHS", 100)
		stats.set_int(MPX .. "SCARAB_MG50_SHOTS", 500)
		stats.set_int(MPX .. "SCARAB_MG50_HITS", 500)
		stats.set_int(MPX .. "SCARAB_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "SCARAB_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "SCARAB_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SCARAB2_MG50_KILLS", 500)
		stats.set_int(MPX .. "SCARAB2_MG50_DEATHS", 100)
		stats.set_int(MPX .. "SCARAB2_MG50_SHOTS", 500)
		stats.set_int(MPX .. "SCARAB2_MG50_HITS", 500)
		stats.set_int(MPX .. "SCARAB2_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "SCARAB2_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "SCARAB2_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SCARAB2_LAS_KILLS", 500)
		stats.set_int(MPX .. "SCARAB2_LAS_DEATHS", 100)
		stats.set_int(MPX .. "SCARAB2_LAS_SHOTS", 500)
		stats.set_int(MPX .. "SCARAB2_LAS_HITS", 500)
		stats.set_int(MPX .. "SCARAB2_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "SCARAB2_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "SCARAB2_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SCARAB3_MG50_KILLS", 500)
		stats.set_int(MPX .. "SCARAB3_MG50_DEATHS", 100)
		stats.set_int(MPX .. "SCARAB3_MG50_SHOTS", 500)
		stats.set_int(MPX .. "SCARAB3_MG50_HITS", 500)
		stats.set_int(MPX .. "SCARAB3_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "SCARAB3_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "SCARAB3_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MONSTER3_KIN_KILLS", 500)
		stats.set_int(MPX .. "MONSTER3_KIN_DEATHS", 100)
		stats.set_int(MPX .. "MONSTER3_KIN_SHOTS", 500)
		stats.set_int(MPX .. "MONSTER3_KIN_HITS", 500)
		stats.set_int(MPX .. "MONSTER3_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "MONSTER3_KIN_ENEMY_KILL", 500)
		stats.set_int(MPX .. "MONSTER4_KIN_KILLS", 500)
		stats.set_int(MPX .. "MONSTER4_KIN_DEATHS", 100)
		stats.set_int(MPX .. "MONSTER4_KIN_SHOTS", 500)
		stats.set_int(MPX .. "MONSTER4_KIN_HITS", 500)
		stats.set_int(MPX .. "MONSTER4_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "MONSTER4_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "MONSTER5_KIN_KILLS", 500)
		stats.set_int(MPX .. "MONSTER5_KIN_DEATHS", 100)
		stats.set_int(MPX .. "MONSTER5_KIN_SHOTS", 500)
		stats.set_int(MPX .. "MONSTER5_KIN_HITS", 500)
		stats.set_int(MPX .. "MONSTER5_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "MONSTER5_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ISSI4_MG50_KILLS", 500)
		stats.set_int(MPX .. "ISSI4_MG50_DEATHS", 100)
		stats.set_int(MPX .. "ISSI4_MG50_SHOTS", 500)
		stats.set_int(MPX .. "ISSI4_MG50_HITS", 500)
		stats.set_int(MPX .. "ISSI4_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "ISSI4_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "ISSI4_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ISSI4_KIN_KILLS", 500)
		stats.set_int(MPX .. "ISSI4_KIN_DEATHS", 100)
		stats.set_int(MPX .. "ISSI4_KIN_SHOTS", 500)
		stats.set_int(MPX .. "ISSI4_KIN_HITS", 500)
		stats.set_int(MPX .. "ISSI4_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "ISSI4_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ISSI5_MG50_KILLS", 500)
		stats.set_int(MPX .. "ISSI5_MG50_DEATHS", 100)
		stats.set_int(MPX .. "ISSI5_MG50_SHOTS", 500)
		stats.set_int(MPX .. "ISSI5_MG50_HITS", 500)
		stats.set_int(MPX .. "ISSI5_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "ISSI5_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "ISSI5_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ISSI5_LAS_KILLS", 500)
		stats.set_int(MPX .. "ISSI5_LAS_DEATHS", 100)
		stats.set_int(MPX .. "ISSI5_LAS_SHOTS", 500)
		stats.set_int(MPX .. "ISSI5_LAS_HITS", 500)
		stats.set_int(MPX .. "ISSI5_LAS_HEADSHOTS", 500)
		stats.set_int(MPX .. "ISSI5_LAS_HELDTIME", 5963259)
		stats.set_int(MPX .. "ISSI5_LAS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ISSI5_KIN_KILLS", 500)
		stats.set_int(MPX .. "ISSI5_KIN_DEATHS", 100)
		stats.set_int(MPX .. "ISSI5_KIN_SHOTS", 500)
		stats.set_int(MPX .. "ISSI5_KIN_HITS", 500)
		stats.set_int(MPX .. "ISSI5_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "ISSI5_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ISSI6_MG50_KILLS", 500)
		stats.set_int(MPX .. "ISSI6_MG50_DEATHS", 100)
		stats.set_int(MPX .. "ISSI6_MG50_SHOTS", 500)
		stats.set_int(MPX .. "ISSI6_MG50_HITS", 500)
		stats.set_int(MPX .. "ISSI6_MG50_HEADSHOTS", 500)
		stats.set_int(MPX .. "ISSI6_MG50_HELDTIME", 5963259)
		stats.set_int(MPX .. "ISSI6_MG50_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ISSI6_KIN_KILLS", 500)
		stats.set_int(MPX .. "ISSI6_KIN_DEATHS", 100)
		stats.set_int(MPX .. "ISSI6_KIN_SHOTS", 500)
		stats.set_int(MPX .. "ISSI6_KIN_HITS", 500)
		stats.set_int(MPX .. "ISSI6_KIN_HELDTIME", 5963259)
		stats.set_int(MPX .. "ISSI6_KIN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 500)
		stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 500)
		stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 100)
		stats.set_int(MPX .. "TRSMALL2_QUAD_KILLS", 500)
		stats.set_int(MPX .. "TRSMALL2_QUAD_DEATHS", 100)
		stats.set_int(MPX .. "TRSMALL2_QUAD_SHOTS", 500)
		stats.set_int(MPX .. "TRSMALL2_QUAD_HITS", 500)
		stats.set_int(MPX .. "TRSMALL2_QUAD_HEADSHOTS", 500)
		stats.set_int(MPX .. "TRSMALL2_QUAD_HELDTIME", 5963259)
		stats.set_int(MPX .. "TRSMALL2_QUAD_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TRSMALL2_DUAL_KILLS", 500)
		stats.set_int(MPX .. "TRSMALL2_DUAL_DEATHS", 100)
		stats.set_int(MPX .. "TRSMALL2_DUAL_SHOTS", 500)
		stats.set_int(MPX .. "TRSMALL2_DUAL_HITS", 500)
		stats.set_int(MPX .. "TRSMALL2_DUAL_HELDTIME", 5963259)
		stats.set_int(MPX .. "TRSMALL2_DUAL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TRSMALL2_MISS_KILLS", 500)
		stats.set_int(MPX .. "TRSMALL2_MISS_DEATHS", 100)
		stats.set_int(MPX .. "TRSMALL2_MISS_SHOTS", 500)
		stats.set_int(MPX .. "TRSMALL2_MISS_HITS", 500)
		stats.set_int(MPX .. "TRSMALL2_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "TRSMALL2_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TRLARGE_CANNON_KILLS", 500)
		stats.set_int(MPX .. "TRLARGE_CANNON_DEATHS", 100)
		stats.set_int(MPX .. "TRLARGE_CANNON_SHOTS", 500)
		stats.set_int(MPX .. "TRLARGE_CANNON_HITS", 500)
		stats.set_int(MPX .. "TRLARGE_CANNON_HELDTIME", 5963259)
		stats.set_int(MPX .. "TRLARGE_CANNON_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_MINI_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_MINI_DEATHS", 100)
		stats.set_int(MPX .. "POUNDER2_MINI_SHOTS", 500)
		stats.set_int(MPX .. "POUNDER2_MINI_HITS", 500)
		stats.set_int(MPX .. "POUNDER2_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "POUNDER2_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "POUNDER2_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_MISS_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_MISS_DEATHS", 100)
		stats.set_int(MPX .. "POUNDER2_MISS_SHOTS", 500)
		stats.set_int(MPX .. "POUNDER2_MISS_HITS", 500)
		stats.set_int(MPX .. "POUNDER2_MISS_HEADSHOTS", 500)
		stats.set_int(MPX .. "POUNDER2_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "POUNDER2_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_BARR_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_BARR_DEATHS", 100)
		stats.set_int(MPX .. "POUNDER2_BARR_SHOTS", 500)
		stats.set_int(MPX .. "POUNDER2_BARR_HITS", 500)
		stats.set_int(MPX .. "POUNDER2_BARR_HELDTIME", 5963259)
		stats.set_int(MPX .. "POUNDER2_BARR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_GL_KILLS", 500)
		stats.set_int(MPX .. "POUNDER2_GL_DEATHS", 100)
		stats.set_int(MPX .. "POUNDER2_GL_SHOTS", 500)
		stats.set_int(MPX .. "POUNDER2_GL_HITS", 500)
		stats.set_int(MPX .. "POUNDER2_GL_HELDTIME", 5963259)
		stats.set_int(MPX .. "POUNDER2_GL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SCRAMJET_MG_KILLS", 500)
		stats.set_int(MPX .. "SCRAMJET_MG_DEATHS", 100)
		stats.set_int(MPX .. "SCRAMJET_MG_SHOTS", 500)
		stats.set_int(MPX .. "SCRAMJET_MG_HITS", 500)
		stats.set_int(MPX .. "SCRAMJET_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "SCRAMJET_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "SCRAMJET_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SCRAMJET_MISS_KILLS", 500)
		stats.set_int(MPX .. "SCRAMJET_MISS_DEATHS", 100)
		stats.set_int(MPX .. "SCRAMJET_MISS_SHOTS", 500)
		stats.set_int(MPX .. "SCRAMJET_MISS_HITS", 500)
		stats.set_int(MPX .. "SCRAMJET_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "SCRAMJET_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SPEEDO4_MG_KILLS", 500)
		stats.set_int(MPX .. "SPEEDO4_MG_DEATHS", 100)
		stats.set_int(MPX .. "SPEEDO4_MG_SHOTS", 500)
		stats.set_int(MPX .. "SPEEDO4_MG_HITS", 500)
		stats.set_int(MPX .. "SPEEDO4_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "SPEEDO4_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "SPEEDO4_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SPEEDO4_TURR_KILLS", 500)
		stats.set_int(MPX .. "SPEEDO4_TURR_DEATHS", 100)
		stats.set_int(MPX .. "SPEEDO4_TURR_SHOTS", 500)
		stats.set_int(MPX .. "SPEEDO4_TURR_HITS", 500)
		stats.set_int(MPX .. "SPEEDO4_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "SPEEDO4_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "SPEEDO4_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SPEEDO4_MINI_KILLS", 500)
		stats.set_int(MPX .. "SPEEDO4_MINI_DEATHS", 100)
		stats.set_int(MPX .. "SPEEDO4_MINI_SHOTS", 500)
		stats.set_int(MPX .. "SPEEDO4_MINI_HITS", 500)
		stats.set_int(MPX .. "SPEEDO4_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "SPEEDO4_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "SPEEDO4_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_BAR_KILLS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_BAR_DEATHS", 100)
		stats.set_int(MPX .. "STRIKEFORCE_BAR_SHOTS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_BAR_HITS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_BAR_HELDTIME", 5963259)
		stats.set_int(MPX .. "STRIKEFORCE_BAR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_CAN_KILLS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_CAN_DEATHS", 100)
		stats.set_int(MPX .. "STRIKEFORCE_CAN_SHOTS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_CAN_HITS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_CAN_HELDTIME", 5963259)
		stats.set_int(MPX .. "STRIKEFORCE_CAN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_MIS_KILLS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_MIS_DEATHS", 100)
		stats.set_int(MPX .. "STRIKEFORCE_MIS_SHOTS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_MIS_HITS", 500)
		stats.set_int(MPX .. "STRIKEFORCE_MIS_HELDTIME", 5963259)
		stats.set_int(MPX .. "STRIKEFORCE_MIS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TERBYTE_MISS_KILLS", 500)
		stats.set_int(MPX .. "TERBYTE_MISS_DEATHS", 100)
		stats.set_int(MPX .. "TERBYTE_MISS_SHOTS", 500)
		stats.set_int(MPX .. "TERBYTE_MISS_HITS", 500)
		stats.set_int(MPX .. "TERBYTE_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "TERBYTE_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TERBYTE_HMISS_KILLS", 500)
		stats.set_int(MPX .. "TERBYTE_HMISS_DEATHS", 100)
		stats.set_int(MPX .. "TERBYTE_HMISS_SHOTS", 500)
		stats.set_int(MPX .. "TERBYTE_HMISS_HITS", 500)
		stats.set_int(MPX .. "TERBYTE_HMISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "TERBYTE_HMISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CARACARA_MINI_KILLS", 500)
		stats.set_int(MPX .. "CARACARA_MINI_DEATHS", 100)
		stats.set_int(MPX .. "CARACARA_MINI_SHOTS", 500)
		stats.set_int(MPX .. "CARACARA_MINI_HITS", 500)
		stats.set_int(MPX .. "CARACARA_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "CARACARA_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "CARACARA_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "CARACARA_TURR_KILLS", 500)
		stats.set_int(MPX .. "CARACARA_TURR_DEATHS", 100)
		stats.set_int(MPX .. "CARACARA_TURR_SHOTS", 500)
		stats.set_int(MPX .. "CARACARA_TURR_HITS", 500)
		stats.set_int(MPX .. "CARACARA_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "CARACARA_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "CARACARA_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SPARROW_MINI_KILLS", 500)
		stats.set_int(MPX .. "SPARROW_MINI_DEATHS", 100)
		stats.set_int(MPX .. "SPARROW_MINI_SHOTS", 500)
		stats.set_int(MPX .. "SPARROW_MINI_HITS", 500)
		stats.set_int(MPX .. "SPARROW_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "SPARROW_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "SPARROW_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SPARROW_ROCKET_KILLS", 500)
		stats.set_int(MPX .. "SPARROW_ROCKET_DEATHS", 100)
		stats.set_int(MPX .. "SPARROW_ROCKET_SHOTS", 500)
		stats.set_int(MPX .. "SPARROW_ROCKET_HITS", 500)
		stats.set_int(MPX .. "SPARROW_ROCKET_HELDTIME", 5963259)
		stats.set_int(MPX .. "SPARROW_ROCKET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "APC_CANN_KILLS", 500)
		stats.set_int(MPX .. "APC_CANN_DEATHS", 100)
		stats.set_int(MPX .. "APC_CANN_SHOTS", 500)
		stats.set_int(MPX .. "APC_CANN_HITS", 500)
		stats.set_int(MPX .. "APC_CANN_HELDTIME", 5963259)
		stats.set_int(MPX .. "APC_CANN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "APC_MISS_KILLS", 500)
		stats.set_int(MPX .. "APC_MISS_DEATHS", 100)
		stats.set_int(MPX .. "APC_MISS_SHOTS", 500)
		stats.set_int(MPX .. "APC_MISS_HITS", 500)
		stats.set_int(MPX .. "APC_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "APC_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "APC_MG_KILLS", 500)
		stats.set_int(MPX .. "APC_MG_DEATHS", 100)
		stats.set_int(MPX .. "APC_MG_SHOTS", 500)
		stats.set_int(MPX .. "APC_MG_HITS", 500)
		stats.set_int(MPX .. "APC_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "APC_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "APC_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "ARDENT_MG_KILLS", 500)
		stats.set_int(MPX .. "ARDENT_MG_DEATHS", 100)
		stats.set_int(MPX .. "ARDENT_MG_SHOTS", 500)
		stats.set_int(MPX .. "ARDENT_MG_HITS", 500)
		stats.set_int(MPX .. "ARDENT_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "ARDENT_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "ARDENT_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DUNE3_MG_KILLS", 500)
		stats.set_int(MPX .. "DUNE3_MG_DEATHS", 100)
		stats.set_int(MPX .. "DUNE3_MG_SHOTS", 500)
		stats.set_int(MPX .. "DUNE3_MG_HITS", 500)
		stats.set_int(MPX .. "DUNE3_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "DUNE3_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "DUNE3_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DUNE3_GL_KILLS", 500)
		stats.set_int(MPX .. "DUNE3_GL_DEATHS", 100)
		stats.set_int(MPX .. "DUNE3_GL_SHOTS", 500)
		stats.set_int(MPX .. "DUNE3_GL_HITS", 500)
		stats.set_int(MPX .. "DUNE3_GL_HELDTIME", 5963259)
		stats.set_int(MPX .. "DUNE3_GL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "DUNE3_MINI_KILLS", 500)
		stats.set_int(MPX .. "DUNE3_MINI_DEATHS", 100)
		stats.set_int(MPX .. "DUNE3_MINI_SHOTS", 500)
		stats.set_int(MPX .. "DUNE3_MINI_HITS", 500)
		stats.set_int(MPX .. "DUNE3_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "DUNE3_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "DUNE3_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "HALFTRACK_DUAL_KILLS", 500)
		stats.set_int(MPX .. "HALFTRACK_DUAL_DEATHS", 100)
		stats.set_int(MPX .. "HALFTRACK_DUAL_SHOTS", 500)
		stats.set_int(MPX .. "HALFTRACK_DUAL_HITS", 500)
		stats.set_int(MPX .. "HALFTRACK_DUAL_HEADSHOTS", 500)
		stats.set_int(MPX .. "HALFTRACK_DUAL_HELDTIME", 5963259)
		stats.set_int(MPX .. "HALFTRACK_DUAL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "HALFTRACK_QUAD_KILLS", 500)
		stats.set_int(MPX .. "HALFTRACK_QUAD_DEATHS", 100)
		stats.set_int(MPX .. "HALFTRACK_QUAD_SHOTS", 500)
		stats.set_int(MPX .. "HALFTRACK_QUAD_HITS", 500)
		stats.set_int(MPX .. "HALFTRACK_QUAD_HEADSHOTS", 500)
		stats.set_int(MPX .. "HALFTRACK_QUAD_HELDTIME", 5963259)
		stats.set_int(MPX .. "HALFTRACK_QUAD_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "INSURGENT3_MINI_KILLS", 500)
		stats.set_int(MPX .. "INSURGENT3_MINI_DEATHS", 100)
		stats.set_int(MPX .. "INSURGENT3_MINI_SHOTS", 500)
		stats.set_int(MPX .. "INSURGENT3_MINI_HITS", 500)
		stats.set_int(MPX .. "INSURGENT3_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "INSURGENT3_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "INSURGENT3_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "INSURGENT3_TURR_KILLS", 500)
		stats.set_int(MPX .. "INSURGENT3_TURR_DEATHS", 100)
		stats.set_int(MPX .. "INSURGENT3_TURR_SHOTS", 500)
		stats.set_int(MPX .. "INSURGENT3_TURR_HITS", 500)
		stats.set_int(MPX .. "INSURGENT3_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "INSURGENT3_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "INSURGENT3_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "NIGHTSHARK_MG_KILLS", 500)
		stats.set_int(MPX .. "NIGHTSHARK_MG_DEATHS", 100)
		stats.set_int(MPX .. "NIGHTSHARK_MG_SHOTS", 500)
		stats.set_int(MPX .. "NIGHTSHARK_MG_HITS", 500)
		stats.set_int(MPX .. "NIGHTSHARK_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "NIGHTSHARK_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "NIGHTSHARK_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MG_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MG_DEATHS", 100)
		stats.set_int(MPX .. "OPPRESSOR_MG_SHOTS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MG_HITS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "OPPRESSOR_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MISS_KILLS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MISS_DEATHS", 100)
		stats.set_int(MPX .. "OPPRESSOR_MISS_SHOTS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MISS_HITS", 500)
		stats.set_int(MPX .. "OPPRESSOR_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "OPPRESSOR_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_MISS_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_MISS_DEATHS", 100)
		stats.set_int(MPX .. "TAMPA3_MISS_SHOTS", 500)
		stats.set_int(MPX .. "TAMPA3_MISS_HITS", 500)
		stats.set_int(MPX .. "TAMPA3_MISS_HELDTIME", 5963259)
		stats.set_int(MPX .. "TAMPA3_MISS_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_MORT_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_MORT_DEATHS", 100)
		stats.set_int(MPX .. "TAMPA3_MORT_SHOTS", 500)
		stats.set_int(MPX .. "TAMPA3_MORT_HITS", 500)
		stats.set_int(MPX .. "TAMPA3_MORT_HELDTIME", 5963259)
		stats.set_int(MPX .. "TAMPA3_MORT_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_FMINI_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_FMINI_DEATHS", 100)
		stats.set_int(MPX .. "TAMPA3_FMINI_SHOTS", 500)
		stats.set_int(MPX .. "TAMPA3_FMINI_HITS", 500)
		stats.set_int(MPX .. "TAMPA3_FMINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "TAMPA3_FMINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "TAMPA3_FMINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_DMINI_KILLS", 500)
		stats.set_int(MPX .. "TAMPA3_DMINI_DEATHS", 100)
		stats.set_int(MPX .. "TAMPA3_DMINI_SHOTS", 500)
		stats.set_int(MPX .. "TAMPA3_DMINI_HITS", 500)
		stats.set_int(MPX .. "TAMPA3_DMINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "TAMPA3_DMINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "TAMPA3_DMINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL3_MINI_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL3_MINI_DEATHS", 100)
		stats.set_int(MPX .. "TECHNICAL3_MINI_SHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL3_MINI_HITS", 500)
		stats.set_int(MPX .. "TECHNICAL3_MINI_HEADSHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL3_MINI_HELDTIME", 5963259)
		stats.set_int(MPX .. "TECHNICAL3_MINI_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL3_TURR_KILLS", 500)
		stats.set_int(MPX .. "TECHNICAL3_TURR_DEATHS", 100)
		stats.set_int(MPX .. "TECHNICAL3_TURR_SHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL3_TURR_HITS", 500)
		stats.set_int(MPX .. "TECHNICAL3_TURR_HEADSHOTS", 500)
		stats.set_int(MPX .. "TECHNICAL3_TURR_HELDTIME", 5963259)
		stats.set_int(MPX .. "TECHNICAL3_TURR_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_ROCKET_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_ROCKET_DEATHS", 100)
		stats.set_int(MPX .. "KHANJALI_ROCKET_SHOTS", 500)
		stats.set_int(MPX .. "KHANJALI_ROCKET_HITS", 500)
		stats.set_int(MPX .. "KHANJALI_ROCKET_HELDTIME", 5963259)
		stats.set_int(MPX .. "KHANJALI_ROCKET_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_HCANN_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_HCANN_DEATHS", 100)
		stats.set_int(MPX .. "KHANJALI_HCANN_SHOTS", 500)
		stats.set_int(MPX .. "KHANJALI_HCANN_HITS", 500)
		stats.set_int(MPX .. "KHANJALI_HCANN_HELDTIME", 5963259)
		stats.set_int(MPX .. "KHANJALI_HCANN_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_MG_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_MG_DEATHS", 100)
		stats.set_int(MPX .. "KHANJALI_MG_SHOTS", 500)
		stats.set_int(MPX .. "KHANJALI_MG_HITS", 500)
		stats.set_int(MPX .. "KHANJALI_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "KHANJALI_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "KHANJALI_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_GL_KILLS", 500)
		stats.set_int(MPX .. "KHANJALI_GL_DEATHS", 100)
		stats.set_int(MPX .. "KHANJALI_GL_SHOTS", 500)
		stats.set_int(MPX .. "KHANJALI_GL_HITS", 500)
		stats.set_int(MPX .. "KHANJALI_GL_HELDTIME", 5963259)
		stats.set_int(MPX .. "KHANJALI_GL_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "REVOLTER_MG_KILLS", 500)
		stats.set_int(MPX .. "REVOLTER_MG_DEATHS", 100)
		stats.set_int(MPX .. "REVOLTER_MG_SHOTS", 500)
		stats.set_int(MPX .. "REVOLTER_MG_HITS", 500)
		stats.set_int(MPX .. "REVOLTER_MG_HEADSHOTS", 500)
		stats.set_int(MPX .. "REVOLTER_MG_HELDTIME", 5963259)
		stats.set_int(MPX .. "REVOLTER_MG_ENEMY_KILLS", 500)
		stats.set_int(MPX .. "SAVESTRA_MG_KILLS", 500)
		stats.set_int(MPX .. "SAVESTRA_MG_DEATHS", 100)
		stats.set_int(MPX .. "SAVESTRA_MG_SHOTS", 500)
		stats.set_int(MPX .. "SAVESTRA_MG_HITS", 500)
		stats.set_int(MPX .. "SAVESTRA_MG_HEADSHOTS", 500)	
end)
RONECLICKMenu:add_action("Stats Part 4",  function()
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
end)
Text("==========================")
RONECLICKMenu:add_action("Time Related Stats 1", function()
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
end)
RONECLICKMenu:add_action("Time Related Stats 2", function()
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
		stats.set_int(MPX .. "TIME_AS_A_DRIVER", 2147483647)
		stats.set_int(MPX .. "TIME_SPENT_FLYING", 2147483647)
		stats.set_int(MPX .. "TIME_IN_CAR", 2147483647)
		stats.set_int(MPX .. "TIME_AS_A_PASSENGER", 2147483647)
		stats.set_int(MPX .. "TOTAL_TIME_CINEMA", 2147483647)
		stats.set_int(MPX .. "TOTAL_CHASE_TIME", 432000000)
		stats.set_int(MPX .. "ARN_SPEC_BOX_TIME_MS", 86400000)
		stats.set_int(MPX .. "LONGEST_PLAYING_TIME", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_CAR", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_PLANE", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_HELI", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_QUADBIKE", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_BIKE", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_BICYCLE", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_BOAT", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_SUBMARINE", 1047483647)
		stats.set_int(MPX .. "TIME_SWIMMING", 1047483647)
		stats.set_int(MPX .. "TIME_WALKING", 1047483647)
		stats.set_int(MPX .. "TIME_UNDERWATER", 1047483647)
		stats.set_int(MPX .. "TIME_IN_WATER", 1047483647)
		stats.set_int(MPX .. "TIME_IN_COVER", 1047483647)
		stats.set_int(MPX .. "TIME_DRIVING_PASSENGER", 1047483647)
		stats.set_int(MPX .. "TOTAL_TIME_SPENT_ON_PHONE", 1047483647)
		stats.set_int(MPX .. "TIME_AS_A_PASSENGER", 1047483647)
		stats.set_int(MPX .. "TIME_AS_A_DRIVER", 1047483647)
		stats.set_int(MPX .. "TIME_SPENT_FLYING", 1047483647)
		stats.set_int(MPX .. "TIME_IN_CAR", 1047483647)
		stats.set_int(MPX .. "TOTAL_TIME_UNDERWATER", 1047483647)
		stats.set_int(MPX .. "TOTAL_TIME_CINEMA", 1047483647)
end)
Text("==========================")
RONECLICKMenu:add_action("Bools Part 1", function()
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
		stats.set_bool(MPX .. "AWD_TEEING_OFF", true)
		stats.set_bool(MPX .. "AWD_PARTY_NIGHT", true)
		stats.set_bool(MPX .. "AWD_BILLIONAIRE_GAMES", true)
		stats.set_bool(MPX .. "AWD_HOOD_PASS", true)
		stats.set_bool(MPX .. "AWD_STUDIO_TOUR", true)
		stats.set_bool(MPX .. "AWD_DONT_MESS_DRE", true)
		stats.set_bool(MPX .. "AWD_BACKUP", true)
		stats.set_bool(MPX .. "AWD_SHORTFRANK_1", true)
		stats.set_bool(MPX .. "AWD_SHORTFRANK_2", true)
		stats.set_bool(MPX .. "AWD_SHORTFRANK_3", true)
		stats.set_bool(MPX .. "AWD_CONTR_KILLER", true)
		stats.set_bool(MPX .. "AWD_DOGS_BEST_FRIEND", true)
		stats.set_bool(MPX .. "AWD_MUSIC_STUDIO", true)
		stats.set_bool(MPX .. "AWD_SHORTLAMAR_1", true)
		stats.set_bool(MPX .. "AWD_SHORTLAMAR_2", true)
		stats.set_bool(MPX .. "AWD_SHORTLAMAR_3", true)
		stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_0", true)
		stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_1", true)
		stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_2", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_SETUP", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_STRAND", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_2", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_F", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_2", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_F", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_2", true)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_F", true)
		stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
		stats.set_bool(MPX .. "AWD_CREWEDUP", true)
		stats.set_bool(MPX .. "AWD_MOVINGON", true)
		stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
		stats.set_bool(MPX .. "AWD_GUNMAN", true)
		stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
		stats.set_bool(MPX .. "AWD_INPLAINSI", true)
		stats.set_bool(MPX .. "AWD_UNDETECTED", true)
		stats.set_bool(MPX .. "AWD_ALLROUND", true)
		stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
		stats.set_bool(MPX .. "AWD_PRO", true)
		stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
		stats.set_bool(MPX .. "AWD_SHAFTED", true)
		stats.set_bool(MPX .. "AWD_COLLECTOR", true)
		stats.set_bool(MPX .. "AWD_DEADEYE", true)
		stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
		stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
		stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
		stats.set_bool(MPX .. "AWD_WIZHARD", true)
		stats.set_bool(MPX .. "AWD_APEESCAP", true)
		stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
		stats.set_bool(MPX .. "AWD_AQUAAPE", true)
		stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
		stats.set_bool(MPX .. "AWD_TRUELOVE", true)
		stats.set_bool(MPX .. "AWD_NEMESIS", true)
		stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
		stats.set_bool(MPX .. "IAP_CHALLENGE_0", true)
		stats.set_bool(MPX .. "IAP_CHALLENGE_1", true)
		stats.set_bool(MPX .. "IAP_CHALLENGE_2v", true)
		stats.set_bool(MPX .. "IAP_CHALLENGE_3", true)
		stats.set_bool(MPX .. "IAP_CHALLENGE_4v", true)
		stats.set_bool(MPX .. "IAP_GOLD_TANK", true)
		stats.set_bool(MPX .. "SCGW_WON_NO_DEATHS", true)
		stats.set_bool(MPX .. "AWD_KINGOFQUB3D", true)
		stats.set_bool(MPX .. "AWD_QUBISM", true)
		stats.set_bool(MPX .. "AWD_QUIBITS", true)
		stats.set_bool(MPX .. "AWD_GODOFQUB3D", true)
		stats.set_bool(MPX .. "AWD_STRAIGHT_TO_VIDEO", true)
		stats.set_bool(MPX .. "AWD_MONKEY_C_MONKEY_DO", true)
		stats.set_bool(MPX .. "AWD_TRAINED_TO_KILL", true)
		stats.set_bool(MPX .. "AWD_DIRECTOR", true)
		stats.set_bool(MPX .. "VCM_FLOW_CS_RSC_SEEN", true)
		stats.set_bool(MPX .. "VCM_FLOW_CS_BWL_SEEN", true)
		stats.set_bool(MPX .. "VCM_FLOW_CS_MTG_SEEN", true)
		stats.set_bool(MPX .. "VCM_FLOW_CS_OIL_SEEN", true)
		stats.set_bool(MPX .. "VCM_FLOW_CS_DEF_SEEN", true)
		stats.set_bool(MPX .. "VCM_FLOW_CS_FIN_SEEN", true)
		stats.set_bool(MPX .. "WAS_CHAR_TRANSFERED", true)
		stats.set_bool(MPX .. "CL_RACE_MODDED_CAR", true)
		stats.set_bool(MPX .. "CL_DRIVE_RALLY", true)
		stats.set_bool(MPX .. "CL_PLAY_GTA_RACE", true)
		stats.set_bool(MPX .. "CL_PLAY_BOAT_RACE", true)
		stats.set_bool(MPX .. "CL_PLAY_FOOT_RACE", true)
		stats.set_bool(MPX .. "CL_PLAY_TEAM_DM", true)
		stats.set_bool(MPX .. "CL_PLAY_VEHICLE_DM", true)
		stats.set_bool(MPX .. "CL_PLAY_MISSION_CONTACT", true)
		stats.set_bool(MPX .. "CL_PLAY_A_PLAYLIST", true)
		stats.set_bool(MPX .. "CL_PLAY_POINT_TO_POINT", true)
		stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_DM", true)
		stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_RACE", true)
		stats.set_bool(MPX .. "CL_SURV_A_BOUNTY", true)
		stats.set_bool(MPX .. "CL_SET_WANTED_LVL_ON_PLAY", true)
		stats.set_bool(MPX .. "CL_GANG_BACKUP_GANGS", true)
		stats.set_bool(MPX .. "CL_GANG_BACKUP_LOST", true)
		stats.set_bool(MPX .. "CL_GANG_BACKUP_VAGOS", true)
		stats.set_bool(MPX .. "CL_CALL_MERCENARIES", true)
		stats.set_bool(MPX .. "CL_PHONE_MECH_DROP_CAR", true)
		stats.set_bool(MPX .. "CL_GONE_OFF_RADAR", true)
		stats.set_bool(MPX .. "CL_FILL_TITAN", true)
		stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
		stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
		stats.set_bool(MPX .. "CL_BUY_INSURANCE", true)
		stats.set_bool(MPX .. "CL_BUY_GARAGE", true)
		stats.set_bool(MPX .. "CL_ENTER_FRIENDS_HOUSE", true)
		stats.set_bool(MPX .. "CL_CALL_STRIPPER_HOUSE", true)
		stats.set_bool(MPX .. "CL_CALL_FRIEND", true)
		stats.set_bool(MPX .. "CL_SEND_FRIEND_REQUEST", true)
		stats.set_bool(MPX .. "CL_W_WANTED_PLAYER_TV", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_0", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_1", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_2", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_3", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_4", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_5", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_6", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_7", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_8", true)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_9", true)
		stats.set_bool(MPX .. "AWD_FIRST_TIME1", true)
		stats.set_bool(MPX .. "AWD_FIRST_TIME2", true)
		stats.set_bool(MPX .. "AWD_FIRST_TIME3", true)
		stats.set_bool(MPX .. "AWD_FIRST_TIME4", true)
		stats.set_bool(MPX .. "AWD_FIRST_TIME5", true)
		stats.set_bool(MPX .. "AWD_FIRST_TIME6", true)
		stats.set_bool(MPX .. "AWD_ALL_IN_ORDER", true)
		stats.set_bool(MPX .. "AWD_SUPPORTING_ROLE", true)
		stats.set_bool(MPX .. "AWD_ACTIVATE_2_PERSON_KEY", true)
		stats.set_bool(MPX .. "AWD_ALL_ROLES_HEIST", true)
		stats.set_bool(MPX .. "AWD_LEADER", true)
		stats.set_bool(MPX .. "AWD_SURVIVALIST", true)
		stats.set_bool(MPX .. "AWD_BUY_EVERY_GUN", true)
		stats.set_bool(MPX .. "AWD_DAILYOBJMONTHBONUS", true)
		stats.set_bool(MPX .. "AWD_DAILYOBJWEEKBONUS", true)
		stats.set_bool(MPX .. "AWD_DRIVELESTERCAR5MINS", true)
		stats.set_bool(MPX .. "AWD_FINISH_HEIST_NO_DAMAGE", true)
		stats.set_bool(MPX .. "AWD_FM25DIFFERENTDM", true)
		stats.set_bool(MPX .. "AWD_FM25DIFFERENTRACES", true)
		stats.set_bool(MPX .. "AWD_FM25DIFITEMSCLOTHES", true)
		stats.set_bool(MPX .. "AWD_FMFURTHESTWHEELIE", true)
		stats.set_bool(MPX .. "AWD_FM6DARTCHKOUT", true)
		stats.set_bool(MPX .. "AWD_FM_GOLF_HOLE_IN_1", true)
		stats.set_bool(MPX .. "AWD_FM_SHOOTRANG_GRAN_WON", true)
		stats.set_bool(MPX .. "AWD_FM_TENNIS_5_SET_WINS", true)
		stats.set_bool(MPX .. "AWD_FMATTGANGHQ", true)
		stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", true)
		stats.set_bool(MPX .. "AWD_FMKILL3ANDWINGTARACE", true)
		stats.set_bool(MPX .. "AWD_FMKILLSTREAKSDM", true)
		stats.set_bool(MPX .. "AWD_FMMOSTKILLSGANGHIDE", true)
		stats.set_bool(MPX .. "AWD_FMMOSTKILLSSURVIVE", true)
		stats.set_bool(MPX .. "AWD_FMPICKUPDLCCRATE1ST", true)
		stats.set_bool(MPX .. "AWD_FMRACEWORLDRECHOLDER", true)
		stats.set_bool(MPX .. "AWD_FMTATTOOALLBODYPARTS", true)
		stats.set_bool(MPX .. "AWD_FMWINALLRACEMODES", true)
		stats.set_bool(MPX .. "AWD_FMWINCUSTOMRACE", true)
		stats.set_bool(MPX .. "AWD_FMWINEVERYGAMEMODE", true)
		stats.set_bool(MPX .. "AWD_SPLIT_HEIST_TAKE_EVENLY", true)
		stats.set_bool(MPX .. "AWD_STORE_20_CAR_IN_GARAGES", true)
		stats.set_bool(MPX .. "SR_TIER_1_REWARD", true)
		stats.set_bool(MPX .. "SR_TIER_3_REWARD", true)
		stats.set_bool(MPX .. "SR_INCREASE_THROW_CAP", true)
		stats.set_bool(MPX .. "AWD_CLUB_COORD", true)
		stats.set_bool(MPX .. "AWD_CLUB_HOTSPOT", true)
		stats.set_bool(MPX .. "AWD_CLUB_CLUBBER", true)
		stats.set_bool(MPX .. "AWD_BEGINNER", true)
		stats.set_bool(MPX .. "AWD_FIELD_FILLER", true)
		stats.set_bool(MPX .. "AWD_ARMCHAIR_RACER", true)
		stats.set_bool(MPX .. "AWD_LEARNER", true)
		stats.set_bool(MPX .. "AWD_SUNDAY_DRIVER", true)
		stats.set_bool(MPX .. "AWD_THE_ROOKIE", true)
		stats.set_bool(MPX .. "AWD_BUMP_AND_RUN", true)
		stats.set_bool(MPX .. "AWD_GEAR_HEAD", true)
		stats.set_bool(MPX .. "AWD_DOOR_SLAMMER", true)
		stats.set_bool(MPX .. "AWD_HOT_LAP", true)
		stats.set_bool(MPX .. "AWD_ARENA_AMATEUR", true)
		stats.set_bool(MPX .. "AWD_PAINT_TRADER", true)
		stats.set_bool(MPX .. "AWD_SHUNTER", true)
		stats.set_bool(MPX .. "AWD_JOCK", true)
		stats.set_bool(MPX .. "AWD_WARRIOR", true)
		stats.set_bool(MPX .. "AWD_T_BONE", true)
		stats.set_bool(MPX .. "AWD_MAYHEM", true)
		stats.set_bool(MPX .. "AWD_WRECKER", true)
		stats.set_bool(MPX .. "AWD_CRASH_COURSE", true)
		stats.set_bool(MPX .. "AWD_ARENA_LEGEND", true)
		stats.set_bool(MPX .. "AWD_PEGASUS", true)
		stats.set_bool(MPX .. "AWD_CONTACT_SPORT", true)
		stats.set_bool(MPX .. "AWD_UNSTOPPABLE", true)
		stats.set_bool(MPX .. "LOW_FLOW_CS_DRV_SEEN", true)
		stats.set_bool(MPX .. "LOW_FLOW_CS_TRA_SEEN", true)
		stats.set_bool(MPX .. "LOW_FLOW_CS_FUN_SEEN", true)
		stats.set_bool(MPX .. "LOW_FLOW_CS_PHO_SEEN", true)
		stats.set_bool(MPX .. "LOW_FLOW_CS_FIN_SEEN", true)
		stats.set_bool(MPX .. "LOW_BEN_INTRO_CS_SEEN", true)
		stats.set_bool(MPX .. "CASINOPSTAT_BOOL0", true)
		stats.set_bool(MPX .. "CASINOPSTAT_BOOL1", true)
		stats.set_bool(MPX .. "FILM4SHIRTUNLOCK", true)
		stats.set_bool(MPX .. "FILM5SHIRTUNLOCK", true)
		stats.set_bool(MPX .. "FILM6SHIRTUNLOCK", true)
		stats.set_bool(MPX .. "FILM7SHIRTUNLOCK", true)
		stats.set_bool(MPX .. "FILM8SHIRTUNLOCK", true)
		stats.set_bool(MPX .. "FILM9SHIRTUNLOCK", true)
		stats.set_bool(MPX .. "ACCOUNTANTSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "BAHAMAMAMASHIRTUNLOCK", true)
		stats.set_bool(MPX .. "DRONESHIRTUNLOCK", true)
		stats.set_bool(MPX .. "GROTTISHIRTUNLOCK", true)
		stats.set_bool(MPX .. "GOLFSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "MAISONETTESHIRTUNLOCK", true)
		stats.set_bool(MPX .. "MANOPAUSESHIRTUNLOCK", true)
		stats.set_bool(MPX .. "MELTDOWNSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "PACIFICBLUFFSSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "PROLAPSSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "TENNISSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "TOESHOESSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "VANILLAUNICORNSHIRTUNLOCK", true)
		stats.set_bool(MPX .. "MARLOWESHIRTUNLOCK", true)
		stats.set_bool(MPX .. "CRESTSHIRTUNLOCK", true)
end)
RONECLICKMenu:add_action("Bools Part 2", function()
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
Text("Join New Session Once And")
Text("Notifications Will Stop")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGMONEYREMOVER = L7NEG:add_submenu("Money Remover Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGMONEYREMOVER:add_int_range("Set Ballastic Value", 1000000, 1000000, 2000000000, function() 
	return globals.get_int(282613)
end, function(value)
	globals.set_int(282613, value)
end)


---global found by dr-NHA On Github Updated By L7NEG
---https://l7neg.tk
---https://dsc.gg/l7neg-

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7 = L7NEG:add_submenu("Ultimate Money Methods Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

VehGodMode = false
	VehiclesM:add_toggle("Vehicle God Mode", function()
		if localplayer ~= nil and localplayer:is_in_vehicle() == true then
			if localplayer:get_current_vehicle():get_godmode() == true then
				VehGodMode = true
				return true
			else
				VehGodMode = false
				return false
			end
		end
	end, function()
		VehGodMode = not VehGodMode
		if VehGodMode then
			if localplayer ~= nil and localplayer:is_in_vehicle() == true then
				localplayer:get_current_vehicle():set_godmode(true)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() == true then
				localplayer:get_current_vehicle():set_godmode(false)
			end
		end
	end)

	SeatbeltState = false
	VehiclesM:add_toggle("Seatbelt", function()
		SeatbeltState = localplayer:get_seatbelt()
		return SeatbeltState
	end, function()
		SeatbeltState = not SeatbeltState
		localplayer:set_seatbelt(SeatbeltState)
	end)

VehiclesM:add_action("Repair Vehicle", function() menu.repair_online_vehicle() end)
VehiclesM:add_action("Remove Insurance Claims", function() menu.remove_insurance_claims() end)
VehiclesM:add_action("Deliver Your Personal Vehicle", function() menu.deliver_personal_vehicle() end)
VehiclesM:add_action("Enter Your Personal Vehicle", function() menu.enter_personal_vehicle() end )

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

carmod =VehiclesM:add_submenu("Wheels Mod Section")

F1Mod = false
OldF1Hash = 0
carmod:add_toggle("F1 - Covers", function()
	return F1Mod
end, function()
	F1Mod = not F1Mod
	if F1Mod then
		if localplayer ~= nil then
			if localplayer:is_in_vehicle() then
				OldF1Hash = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(1492612435)
			end
		end
	else
		if localplayer ~= nil then
			if localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(OldF1Hash)
			end
		end
	end
end)

BennyMod = false
OldBennyHash = 0
carmod:add_toggle("Bennys - Covers", function()
	return BennyMod
end, function()
	BennyMod = not BennyMod
	if BennyMod then
		if localplayer ~= nil then
			if localplayer:is_in_vehicle() then
				OldBennyHash = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(196747873)
			end
		end
	else
		if localplayer ~= nil then
			if localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(OldBennyHash)
			end
		end
	end
end)



HHDs = VehiclesM:add_submenu("Custom Plate")



PlateChar = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", ""}
PI1 = PlateChar[1]
PI1Current = 1
HHDs:add_array_item("Char #1", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI1Current
	end
end, function(value)
	PI1 = PlateChar[value]
	PI1Current = value
end)


PI2 = PlateChar[1]
PI2Current = 1
HHDs:add_array_item("Char #2", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI2Current
	end
end, function(value)
	PI2 = PlateChar[value]
	PI2Current = value
end)


PI3 = PlateChar[1]
PI3Current = 1
HHDs:add_array_item("Char #3", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI3Current
	end
end, function(value)
	PI3 = PlateChar[value]
	PI3Current = value
end)


PI4 = PlateChar[1]
PI4Current = 1
HHDs:add_array_item("Char #4", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI4Current
	end
end, function(value)
	PI4 = PlateChar[value]
	PI4Current = value
end)


PI5 = PlateChar[1]
PI5Current = 1
HHDs:add_array_item("Char #5", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI5Current
	end
end, function(value)
	PI5 = PlateChar[value]
	PI5Current = value
end)


PI6 = PlateChar[1]
PI6Current = 1
HHDs:add_array_item("Char #6", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI6Current
	end
end, function(value)
	PI6 = PlateChar[value]
	PI6Current = value
end)


PI7 = PlateChar[1]
PI7Current = 1
HHDs:add_array_item("Char #7", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI7Current
	end
end, function(value)
	PI7 = PlateChar[value]
	PI7Current = value
end)


PI8 = PlateChar[1]
PI8Current = 1
HHDs:add_array_item("Char #8", PlateChar, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		return PI8Current
	end
end, function(value)
	PI8 = PlateChar[value]
	PI8Current = value
end)


HHDs:add_bare_item("", function()
	return "Apply plate: " .. PI1 .. PI2 .. PI3 .. PI4 .. PI5 .. PI6 .. PI7 .. PI8
end, function()
	if localplayer ~= nil and localplayer:is_in_vehicle() then
		localplayer:get_current_vehicle():set_number_plate_text(PI1 .. PI2 .. PI3 .. PI4 .. PI5 .. PI6 .. PI7 .. PI8)
	end
end, function()
end, function()
end)


HHDs7 = VehiclesM:add_submenu("Car Speed Menu")
local function superChargeVehicle()
	if localplayer == nil then
		return
	end
	
	current_vehicle = localplayer:get_current_vehicle()
		if current_vehicle ~= nil then
			current_vehicle:set_acceleration(1.59)
			current_vehicle:set_gravity(16.8)

		end
end
HHDs7:add_action("Active Car Speed Hack", superChargeVehicle)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGWEAPON:add_action("Full Ammo ", function() menu.max_all_ammo() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGWEAPON1 = L7NEGWEAPON:add_submenu("Weapone Data Editor")
 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local weapon_data = {}
local enabled = false
local function increaseBulletDamageWhenShooting()
	if not enabled then return end
	local weapon = localplayer:get_current_weapon()
	local bullet = weapon:get_bullet_damage()
	if bullet < 100000 then
	weapon_data[weapon:get_name_hash()] = force
          weapon:set_bullet_damage(999900000)
	end

end
 
local hotkey
local function supraABullet()
	if not localplayer or localplayer == nil then return end
	enabled = not enabled
	if enabled then
	menu.register_hotkey(1, increaseBulletDamageWhenShooting)
	else
	end
end

L7NEGWEAPON1:add_toggle("Enable Super Bullet Shoot", function() return enabled end, supraABullet)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SelfRX = Self:add_submenu("Fast Run Ability Unlock")

SelfRX:add_action("Fast Run and Reload", function() 
stats.set_int(MPX .. "CHAR_ABILITY_1_UNLCK", -1) 
stats.set_int(MPX .. "CHAR_ABILITY_2_UNLCK", -1) 
stats.set_int(MPX .. "CHAR_ABILITY_3_UNLCK", -1) 
stats.set_int(MPX .. "CHAR_FM_ABILITY_1_UNLCK", -1) 
stats.set_int(MPX .. "CHAR_FM_ABILITY_2_UNLCK", -1) 
stats.set_int(MPX .. "CHAR_FM_ABILITY_3_UNLCK", -1) 
globals.set_int(1575020, 1) 
globals.set_int(1574589, 1) 
sleep(0.2) 
globals.set_int(1574589, 0) end)
 
SelfRX:add_action("Reset Fast Run And Reload", function() 
stats.set_int(MPX .. "CHAR_ABILITY_1_UNLCK", 0) 
stats.set_int(MPX .. "CHAR_ABILITY_2_UNLCK", 0) 
stats.set_int(MPX .. "CHAR_ABILITY_3_UNLCK", 0) 
stats.set_int(MPX .. "CHAR_FM_ABILITY_1_UNLCK", 0) 
stats.set_int(MPX .. "CHAR_FM_ABILITY_2_UNLCK", 0) 
stats.set_int(MPX .. "CHAR_FM_ABILITY_3_UNLCK", 0) 
globals.set_int(1575020, 1) 
globals.set_int(1574589, 1) 
sleep(0.2) 
globals.set_int(1574589, 0) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGT = L7NEG:add_submenu("Teleports")

L7NEGT:add_action("Teleport To WayPoint", function() menu.teleport_to_waypoint() end)
L7NEGT:add_action("Teleport To Objective", function() menu.teleport_to_objective() end)
L7NEGT:add_action("Teleport  Forward", function() menu.teleport_forward() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TunMenu = L7NEG:add_submenu("Tunables")

TunMenu:add_float_range("RP", 1, 1, 100000, function() return globals.get_float(262145 + 1) end, function(v) globals.set_float(262145 + 1, v) end)

TunMenu:add_float_range("AP", 1, 1, 100000, function() return globals.get_float(288259) end, function(v) globals.set_float(288259, v) end)

TunMenu:add_float_range("Street Races", 1, 1, 100000, function() return globals.get_float(294000) end, function(v) globals.set_float(294000, v) end)

TunMenu:add_float_range("Pursuits", 1, 1, 100000, function() return globals.get_float(294001) end, function(v) globals.set_float(294001, v) end)

TunMenu:add_float_range("Face2Face", 1, 1, 100000, function() return globals.get_float(294003) end, function(v) globals.set_float(294003, v) end)

TunMenu:add_float_range("LS Car Meet", 1, 1, 100000, function() return globals.get_float(294005) end, function(v) globals.set_float(294005, v) end)

TunMenu:add_float_range("LS Car Meet on track", 1, 1, 100000, function() return globals.get_float(294006) end, function(v) globals.set_float(294006, v) end) 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGWORLD = L7NEG:add_submenu("World")

L7NEGNPC = L7NEGWORLD:add_submenu("Npcs Menu")


L7NEGNPC:add_action("Kill All Npcs", function() menu.kill_all_npcs() end)
L7NEGNPC:add_action("Kill Mission Npcs", function() menu.kill_all_mission_peds() end) 

local FreezeNPCS = L7NEGNPC:add_submenu("Freeze All Npcs Menu")

FreezeNPCS:add_action("Enable", function()
    for p in replayinterface.get_peds() do
        if p ~= nil and p ~= localplayer then
            p:set_freeze_momentum(true)
        end
    end
end)
FreezeNPCS:add_action("Disable", function()
    for p in replayinterface.get_peds() do
        if p ~= nil and p ~= localplayer then
            p:set_freeze_momentum(false)
        end
    end
end)


funcmenu = L7NEGWORLD:add_submenu("Cars Menu")
 
local repairmenu = funcmenu:add_submenu("Revieve And Destroy Menu")
 
repairmenu:add_action("Destroy All Cars", function()
    for v in replayinterface.get_vehicles() do
        if v ~= nil then
            v:set_health(0)
        end
    end
end)
 
repairmenu:add_action("Revive All Dead Cars", function()
    for v in replayinterface.get_vehicles() do
        if v ~= nil then
            v:set_health(1000)
        end
    end
end)

L7NEGWORLD:add_action("End Cutscene",
    function()
        menu.end_cutscene()
    end)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGREPORTSVIEWMENU = L7NEG:add_submenu("Reports Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Griefing:".. (string.format("%03d", stats.get_int("MPPLY_GRIEFING"))) end, function() end, function()end, function() return end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Exploits:".. (string.format("%03d", stats.get_int("MPPLY_EXPLOITS"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Bug Exploits:".. (string.format("%03d", stats.get_int("MPPLY_GAME_EXPLOITS"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Text Chat:Annoying Me:".. (string.format("%03d", stats.get_int("MPPLY_TC_ANNOYINGME"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Text Chat:Using Hate Speech:".. (string.format("%03d", stats.get_int("MPPLY_TC_HATE"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Voice Chat:Annoying Me:".. (string.format("%03d", stats.get_int("MPPLY_VC_ANNOYINGME"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Voice Chat:Using Hate Speech:".. (string.format("%03d", stats.get_int("MPPLY_VC_HATE"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Offensive Language:".. (string.format("%03d", stats.get_int("MPPLY_OFFENSIVE_LANGUAGE"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Offensive Tagplate:".. (string.format("%03d", stats.get_int("MPPLY_OFFENSIVE_TAGPLATE"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Offensive Content:".. (string.format("%03d", stats.get_int("MPPLY_OFFENSIVE_UGC"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Bad Crew Name:".. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_NAME"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Bad Crew Motto:".. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_MOTTO"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Bad Crew Status:".. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_STATUS"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Bad Crew Emblem:".. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_EMBLEM"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Friendly:".. (string.format("%03d", stats.get_int("MPPLY_FRIENDLY"))) end, function() end, function()end, function()end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function() return "Helpful:".. (string.format("%03d", stats.get_int("MPPLY_HELPFUL"))) end, function() end, function()end, function()end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGREPORTSVIEWMENU:add_action("--------------------------------------------------", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGREPORTSVIEWMENU:add_action("Delete Reports", function()
    stats.set_int("MPPLY_REPORT_STRENGTH", 0)
    stats.set_int("MPPLY_COMMEND_STRENGTH", 0)
    stats.set_int("MPPLY_GRIEFING", 0)
    stats.set_int("MPPLY_VC_ANNOYINGME", 0)
    stats.set_int("MPPLY_VC_HATE", 0)
    stats.set_int("MPPLY_TC_ANNOYINGME", 0)
    stats.set_int("MPPLY_TC_HATE", 0)
    stats.set_int("MPPLY_OFFENSIVE_LANGUAGE", 0)
    stats.set_int("MPPLY_OFFENSIVE_TAGPLATE", 0)
    stats.set_int("MPPLY_OFFENSIVE_UGC", 0)
    stats.set_int("MPPLY_BAD_CREW_NAME", 0)
    stats.set_int("MPPLY_BAD_CREW_MOTTO", 0)
    stats.set_int("MPPLY_BAD_CREW_STATUS", 0)
    stats.set_int("MPPLY_BAD_CREW_EMBLEM", 0)
    stats.set_int("MPPLY_EXPLOITS", 0)
    stats.set_int("MPPLY_BECAME_BADSPORT_NUM", 0)
    stats.set_int("MPPLY_DESTROYED_PVEHICLES", 0)
    stats.set_int("MPPLY_BECAME_CHEATER_NUM", 0)
    stats.set_int("MPPLY_BADSPORT_MESSAGE", 0)
    stats.set_int("MPPLY_GAME_EXPLOITS", 0)
    stats.set_int("MPPLY_PLAYER_MENTAL_STATE", 0)
    stats.set_int("MPPLY_PLAYERMADE_TITLE", 0)
    stats.set_int("MPPLY_PLAYERMADE_DESC", 0)
    stats.set_bool("MPPLY_ISPUNISHED", false)
    stats.set_bool("MPPLY_WAS_I_BAD_SPORT", false)
    stats.set_bool("MPPLY_WAS_I_CHEATER", false)
    stats.set_bool("MPPLY_CHAR_IS_BADSPORT", false)
    stats.set_int("MPPLY_OVERALL_BADSPORT", 0)
    stats.set_int("MPPLY_OVERALL_CHEAT", 0)
end)


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGH = L7NEG:add_submenu("Heists Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGCONTRACTS = L7NEG:add_submenu("Contracts Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 L7NEG014 = L7NEGCONTRACTS:add_submenu("The Contract Menu")

 L7NEG014:add_action("Set Up Dre Finale Mission", function()
	 PlayerIndex = globals.get_int(1574918)
	 if PlayerIndex == 0 then
		 stats.set_int("MP0_FIXER_STORY_BS", 4092)
		 stats.set_int("MP0_FIXER_STORY_STRAND", -1)
	 else
		 stats.set_int("MP1_FIXER_STORY_BS", 4092)
		 stats.set_int("MP1_FIXER_STORY_STRAND", -1)
	 end
 end)
 
 local function teleport_myself(x,y,z)
	 localplayer:set_position((vector3(x, y, z)))
 end
  
 L7NEG014:add_action("-------------- Teleport Dre --------------------", function() end)
 L7NEG014:add_action("Dre 1", function()
	 teleport_myself(507.766602, -605.932678, 23.451139)
 end)
  
 L7NEG014:add_action("Dre 2", function()
	 teleport_myself(-927.370483, -2923.859131, 12.644426)
 end)
  
 L7NEG014:add_action("Dre 3", function()
	 teleport_myself(-933.519897, -3010.231201, 18.540413)
 end)
 
 L7NEG014:add_action("Dre 4", function()
	 teleport_myself(-3036.250488, 111.499924, 10.599296)
 end)

L7NEG014:add_action("-------No. of security contracts done------", function() end) 
L7NEG014:add_int_range("Asset Protection", 1, 0, 500, function()
 return stats.get_int(MPX .. "FIXER_SC_ASSETS_PROTECTED") end, function(v)
 stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", v) end) 
L7NEG014:add_int_range("Gang Termination", 1, 0, 500, function()
 return stats.get_int(MPX .. "FIXER_SC_GANG_TERMINATED") end, function(v)
 stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", v) end) 
L7NEG014:add_int_range("Liquidize Assets", 1, 0, 500, function()
 return stats.get_int(MPX .. "FIXER_SC_EQ_DESTROYED") end, function(v)
 stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", v) end) 
L7NEG014:add_int_range("Recover Valuables", 1, 0, 500, function()
 return stats.get_int(MPX .. "FIXER_SC_VAL_RECOVERED") end, function(v)
 stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", v) end) 
L7NEG014:add_int_range("Rescue Operation", 1, 0, 500, function()
 return stats.get_int(MPX .. "FIXER_SC_VIP_RESCUED") end, function(v)
 stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", v) end) 
L7NEG014:add_int_range("Vehicle Recovery", 1, 0, 500, function()
 return stats.get_int(MPX .. "FIXER_SC_VEH_RECOVERED") end, function(v)
 stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", v) end) 
L7NEG014:add_int_range("Contract Earnings", 250000, 0, 20000000, function()
 return stats.get_int(MPX .. "FIXER_EARNINGS") end, function(v)
 stats.set_int(MPX .. "FIXER_EARNINGS", v) end)
L7NEG014:add_action("------------Payphone Hits Stats-------------", function() end) 
L7NEG014:add_int_range("Payphone hits Completed", 1, 0, 999, function()
 return stats.get_int(MPX .. "FIXERTELEPHONEHITSCOMPL") end, function(v)
 stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", v) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 L7NEG0 = L7NEGCONTRACTS:add_submenu("Auto Shop Preps Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 L7NEG2 = L7NEG0:add_submenu("Skip Auto Shop Skip Preps Menu")
 L7NEG2:add_array_item("Prep Skip", {"The Union Depository Contract", "The Superdollar Deal", "The Bank Contract", "The ECU Job", "The Prison Contract", "The Agency Deal", "The Lost Contract", "The Data Contract"}, function() return xox_18 end, function(value) if value == 1 then stats.set_int(MPX .. "TUNER_GEN_BS", 12543) stats.set_int(MPX .. "TUNER_CURRENT", 0) elseif value == 2 then stats.set_int(MPX .. "TUNER_GEN_BS", 4351) stats.set_int(MPX .. "TUNER_CURRENT", 1) elseif value == 3 then stats.set_int(MPX .. "TUNER_GEN_BS", 12543) stats.set_int(MPX .. "TUNER_CURRENT", 2) elseif value == 4 then stats.set_int(MPX .. "TUNER_GEN_BS", 12543) stats.set_int(MPX .. "TUNER_CURRENT", 3) elseif value == 5 then stats.set_int(MPX .. "TUNER_GEN_BS", 12543) stats.set_int(MPX .. "TUNER_CURRENT", 4) elseif value == 6 then stats.set_int(MPX .. "TUNER_GEN_BS", 12543) stats.set_int(MPX .. "TUNER_CURRENT", 5) elseif value == 7 then stats.set_int(MPX .. "TUNER_GEN_BS", 12543) stats.set_int(MPX .. "TUNER_CURRENT", 6) else stats.set_int(MPX .. "TUNER_GEN_BS", 12543) stats.set_int(MPX .. "TUNER_CURRENT", 7) end xox_18 = value end) 


function MPX()return stats.get_int("MPPLY_LAST_MP_CHAR") end


L7NEG388 = L7NEG0:add_submenu("Missions Tools")


L7NEG388:add_action("-----------Contracts Stats Editor-----------", function() end) 
L7NEG388:add_int_range("Contracts Done", 1, 0, 9999, function()
 return stats.get_int(MPX .. "TUNER_COUNT") end, function(v)
 stats.set_int(MPX .. "TUNER_COUNT", v) end) 
L7NEG388:add_int_range("Contracts Earnings", 500000, 0, 1000000000, function()
 return stats.get_int(MPX .. "TUNER_EARNINGS") end, function(v)
 stats.set_int(MPX .. "TUNER_EARNINGS", v) end) 

L7NEG388:add_action("----------------------------------------------------", function() end) 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGAPARTMENT = L7NEGH:add_submenu("Apartment Data Editor")

L7NEGAPARTMENT:add_action("Skip Current Apartment Heist Preps", function() stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1) end) 


L7NEGAPCUT = L7NEGAPARTMENT:add_submenu("Apartment Cuts Editor Menu")


L7NEGAPCUT:add_int_range("Apt Player 1", 1.0, 15, 100, function() return globals.get_int(1938365 + 3008 + 1) end, function(value) globals.set_int(1938365 + 3008 + 1, value) end) 
L7NEGAPCUT:add_int_range("Apt Player 2", 1.0, 15, 100, function() return globals.get_int(1938365 + 3008 + 1 + 1) end, function(value) globals.set_int(1938365 + 3008 + 1 + 1, value) end) 
L7NEGAPCUT:add_int_range("Apt Player 3", 1.0, 15, 100, function() return globals.get_int(1938365 + 3008 + 1 + 1 + 1) end, function(value) globals.set_int(1938365 + 3008 + 1 + 1 + 1, value) end) 
L7NEGAPCUT:add_int_range("Apt Player 4", 1.0, 15, 100, function() return globals.get_int(1938365 + 3008 + 1 + 1 + 1 + 1) end, function(value) globals.set_int(1938365 + 3008 + 1 + 1 + 1 + 1, value) end) 


L7NEGAPCUT:add_action("All 200", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 200) end end)

L7NEGAPCUT:add_action("All 179", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 179) end end)
L7NEGAPCUT:add_action("All 150", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 150) end end)
L7NEGAPCUT:add_action("All 120", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 120) end end)
L7NEGAPCUT:add_action("All 100", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 100) end end)

L7NEGAPCUT:add_action("All 85", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 85) end end)
L7NEGAPCUT:add_action("All 75", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 75) end end)
L7NEGAPCUT:add_action("All 50", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 50) end end)
L7NEGAPCUT:add_action("All 25", function() for i = 1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 25) end end)
L7NEGAPCUT:add_action("All 0", function() for i =  1938365 + 3008 + 1, 1938365 + 3008 + 1 + 1 + 1 + 1 do globals.set_int(i, 0) end end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGCASINO = L7NEGH:add_submenu("Casino Data Editor")


local L7NEGCASINO = L7NEGCASINO:add_submenu("Casino Editor Section")
PlayerIndex = globals.get_int(1574918)

	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
 
local function Text(text)
	L7NEGCASINO:add_action(text, function() end)
end
Text(" ___________Casino Setup________")
 
L7NEGCASINO:add_int_range("Target - Cash1/Gold2/Art3/Diam4", 1, 1, 4, function() return stats.get_int(MPX .. "H3OPT_TARGET") end, function(TGT)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	if TGT == 1 then
		H3t = 0
	elseif TGT == 2 then
		H3t = 1
	elseif TGT == 3 then
		H3t = 2
	elseif TGT == 4 then
		H3t = 3
	end
		stats.set_int(MPX .. "H3OPT_TARGET", H3t)
end)
 
L7NEGCASINO:add_int_range("Random Approach - Normal/Hard", 1, 1, 2, function() return 1 end, function(H3lvl)
	LstAp = stats.get_int(MPX .. "H3_LAST_APPROACH")
	HrdAp = stats.get_int(MPX .. "H3_HARD_APPROACH")
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	if H3lvl == 2 then
		Apr = HrdAp
	else
		if LstAp == 2 and HrdAp == 3 then
		Apr = 1
		elseif LstAp == 3 and HrdAp == 2 then
		Apr = 1
		elseif LstAp == 3 and HrdAp == 1 then
		Apr = 2
		elseif LstAp == 1 and HrdAp == 3 then
		Apr = 2
		else
		Apr = 3
		end
	end
		stats.set_int(MPX .. "H3OPT_APPROACH", Apr)
end)
 
L7NEGCASINO:add_int_range("EasyApproach - Snk/BgCon/Aggr", 1, 1, 3, function() return 1 end, function(Approach)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	if Approach == 1 then
		LastApproach = 3
		HardApproach = 2
		Weapon = 1
	elseif Approach == 2 then
		LastApproach = 3
		HardApproach = 1
		Weapon = 0
	else
		LastApproach = 1
		HardApproach = 2
		Weapon = 0
	end
		stats.set_int(MPX .. "H3_LAST_APPROACH", LastApproach)
		stats.set_int(MPX .. "H3_HARD_APPROACH", HardApproach)
		stats.set_int(MPX .. "H3OPT_APPROACH", Approach)
end)
 
L7NEGCASINO:add_int_range("HardApproach - Snk/BgCon/Aggr", 1, 1, 3, function() return stats.get_int(MPX .. "H3_HARD_APPROACH") end, function(Approach)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	if Approach == 1 then
		LastApproach = 3
		HardApproach = 1
	elseif Approach == 2 then
		LastApproach = 3
		HardApproach = 2
	else
		LastApproach = 1
		HardApproach = 3
	end
		stats.set_int(MPX .. "H3_LAST_APPROACH", LastApproach)
		stats.set_int(MPX .. "H3_HARD_APPROACH", Approach)
		stats.set_int(MPX .. "H3OPT_APPROACH", Approach)
end)
 
L7NEGCASINO:add_action("             ---[[Complete Board1]]---", function()
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
		stats.set_int(MPX .. "H3OPT_BITSET1", -1)
end)
 
L7NEGCASINO:add_int_range("Hacker - Rickie 3%/Avi 10%/Paige 9%", 1, 1, 3, function() return stats.get_int(MPX .. "H3OPT_CREWHACKER") end, function(Hkr)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	if Hkr == 1 then
		H3Hcr = 1
	elseif Hkr == 2 then
		H3Hcr = 4
	else
		H3Hcr = 5
	end
		stats.set_int(MPX .. "H3OPT_CREWHACKER", H3Hcr)
end)
 

L7NEGCASINO:add_int_range("Grlla/Clwn/Anml9/Riot/OniF/Hockey", 1, 1, 12, function() return stats.get_int(MPX .. "H3OPT_MASKS") end, function(H3Msk)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
--	hMsk = H3Msk
		stats.set_int(MPX .. "H3OPT_MASKS", H3Msk)
end)

L7NEGCASINO:add_int_range("Weap-Karl/Gus/Char/Ches/Pat", 1, 1, 5, function() return stats.get_int(MPX .. "H3OPT_CREWWEAP") end, function(H3Weap)
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
--	hWeap = H3Weap
		stats.set_int(MPX .. "H3OPT_CREWWEAP", H3Weap)
end)
 
L7NEGCASINO:add_action("       ---[[Complete Board2 - Finale]]---", function()
	PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
		stats.set_int(MPX .. "H3OPT_DISRUPTSHIP", 3)
		stats.set_int(MPX .. "H3OPT_KEYLEVELS", 2)
		stats.set_int(MPX .. "H3OPT_CREWWEAP", 1)
		stats.set_int(MPX .. "H3OPT_CREWDRIVER", 1)
		stats.set_int(MPX .. "H3OPT_VEHS", 3)
		stats.set_int(MPX .. "H3OPT_WEAPS", 0)
		stats.set_int(MPX .. "H3OPT_BITSET0", -129)
end)
 
local function Text(text)
	L7NEGCASINO:add_action(text, function() end)
end

local function Text(text)
	menu.add_action(text, function() end)
end

	
local MPX = stats.get_int("MPPLY_LAST_MP_CHAR")
local Weapon = 0
local function Text(text)
	L7NEGCASINO:add_action(text, function() end)
end
Text("--------------Casino Cuts--------------------")
 
L7NEGCASINO:add_int_range("Casino Player1 Cut", 5.0, 15, 100, function() 
	return globals.get_int(1971696+2325+1)
end, function(value)
	globals.set_int(1971696+2325+1, value)
H3C1 = p1
end)
 
L7NEGCASINO:add_int_range("Casino Player2 Cut", 5.0, 15, 100, function() 
	return globals.get_int(1971696+2325+1+1)
end, function(value)
	globals.set_int(1971696+2325+1+1, value)
H3C2 = p2

end)
 
L7NEGCASINO:add_int_range("Casino Player3 Cut", 5.0, 15, 100, function() 
	return globals.get_int(1971696+2325 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1971696+2325 + 1 + 1 + 1, value)
H3C3 = p3

end)
 
L7NEGCASINO:add_int_range("Casino Player4 Cut", 5.0, 15, 100, function() 
	return globals.get_int(1971696+2325+ 1 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1971696+2325 + 1 + 1 + 1 + 1, value)
H3C4 = p4

end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 L7NEGCAYO = L7NEGH:add_submenu("Cayo Perlco Heist")
 
L7NEGCAYO:add_array_item("Presets", {"H.Panther Only", "H.PinkD Only", "H.B.Bonds Only", "H.R.Necklace Only", "H.Tequila Only", "N.Panther Only", "N.PinkD Only", "N.B.Bonds Only", "N.R.Necklace Only", "N.Tequila Only"}, function()
 return xox_15 end, function(v)
 if v == 1
 then
 stats.set_int(MPX .. "H4_PROGRESS", 131055)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 5)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_V", 403500)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 2
 then
 stats.set_int(MPX .. "H4_PROGRESS", 131055)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 3)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 3
 then
 stats.set_int(MPX .. "H4_PROGRESS", 131055)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 2)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 4
 then
 stats.set_int(MPX .. "H4_PROGRESS", 131055)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 1)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 5
 then
 stats.set_int(MPX .. "H4_PROGRESS", 131055)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 0)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 6
 then
 stats.set_int(MPX .. "H4_PROGRESS", 126823)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 5)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 7
 then
 stats.set_int(MPX .. "H4_PROGRESS", 126823)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 3)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 8
 then
 stats.set_int(MPX .. "H4_PROGRESS", 126823)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 2)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 9
 then
 stats.set_int(MPX .. "H4_PROGRESS", 126823)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 1)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_V", 403500)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 stats.set_int(MPX .. "H4LOOT_COKE_I", 0)
 elseif v == 10
 then
 stats.set_int(MPX .. "H4_PROGRESS", 126823)
 stats.set_int(MPX .. "H4_MISSIONS", 65535)
 stats.set_int(MPX .. "H4CNF_TARGET", 0)
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
 stats.set_int(MPX .. "H4CNF_TROJAN", 5)
 stats.set_int(MPX .. "H4LOOT_GOLD_C", 0)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT", 0)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_I", 0)
 stats.set_int(MPX .. "H4LOOT_CASH_C", 0)
 stats.set_int(MPX .. "H4LOOT_WEED_I", 0)
 end
 xox_15 = v
 end)

L7NEGCAYO:add_array_item("Primary Target", {"Tequila", "Ruby Necklace", "Bearer Bonds", "Pink Diamond", "Panther Statue"}, function()
 return
 xox_0 end, function(value)
 xox_0 = value
 if value == 1
 then
 stats.set_int(MPX .. "H4CNF_TARGET", 0)
 elseif
 value == 2
 then
 stats.set_int(MPX .. "H4CNF_TARGET", 1)
 elseif
 value == 3
 then
 stats.set_int(MPX .. "H4CNF_TARGET", 2)
 elseif
 value == 4
 then
 stats.set_int(MPX .. "H4CNF_TARGET", 3)
 elseif
 value == 5
 then
 stats.set_int(MPX .. "H4CNF_TARGET", 5)
 end
 end)

StMenu = L7NEGCAYO:add_submenu("Secondary Targets") 
StMenu:add_array_item("All Compound Storages", {"Gold", "Paintings", "Cocaine", "Weed", "Cash"}, function()
 return
 xox_1 end, function(value)
 if value == 1
 then
 stats.set_int(MPX .. "H4LOOT_GOLD_C", -1)
 stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", -1)
 elseif
 value == 2
 then
 stats.set_int(MPX .. "H4LOOT_PAINT", -1)
 stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", -1)
 stats.set_int(MPX .. "H4LOOT_PAINT_V", 403500)
 elseif
 value == 3
 then
 stats.set_int(MPX .. "H4LOOT_COKE_C", -1)
 stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", -1)
 elseif
 value == 4
 then
 stats.set_int(MPX .. "H4LOOT_WEED_C", -1)
 stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", -1)
 elseif
 value == 5
 then
 stats.set_int(MPX .. "H4LOOT_CASH_C", -1)
 stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", -1)
 end
 xox_1 = value
 end)

StMenu:add_array_item("All Island Storages", {"Gold", "Cocaine", "Weed", "Cash"}, function()
 return
 xox_2 end, function(value)
 if value == 1
 then
 stats.set_int(MPX .. "H4LOOT_GOLD_I", -1)
 stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", -1)
 elseif
 value == 2
 then
 stats.set_int(MPX .. "H4LOOT_COKE_I", -1)
 stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", -1)
 elseif
 value == 3
 then
 stats.set_int(MPX .. "H4LOOT_WEED_I", -1)
 stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", -1)
 elseif
 value == 4
 then
 stats.set_int(MPX .. "H4LOOT_CASH_I", -1)
 stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", -1)
 end
 xox_2 = value
 end) 

L7NEGCAYO:add_array_item("Weapons", {"Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman"}, function()
 return xox_3 end, function(value)
 if value == 1
 then
 stats.set_int(MPX .. "H4CNF_WEAPONS", 1)
 elseif value == 2
 then
 stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
 elseif value == 3
 then
 stats.set_int(MPX .. "H4CNF_WEAPONS", 3)
 elseif value == 4
 then
 stats.set_int(MPX .. "H4CNF_WEAPONS", 4)
 elseif value == 5
 then
 stats.set_int(MPX .. "H4CNF_WEAPONS", 5)
 end
 xox_3 = value
 end)

L7NEGCAYO:add_array_item("Approach Vehicles", {"Kosatka", "Alkonost", "Velum", "Stealth Annihilator", "Patrol Boat", "Longfin", "All Vehicles"}, function() return xox_4 end, function(value) 
if value == 1 
then 
stats.set_int(MPX .. "H4_MISSIONS", 65283) 
elseif 
value == 2 
then 
stats.set_int(MPX .. "H4_MISSIONS", 65413) 
elseif 
value == 3 
then 
stats.set_int(MPX .. "H4_MISSIONS", 65289) 
elseif 
value == 4 
then 
stats.set_int(MPX .. "H4_MISSIONS", 65425) 
elseif 
value == 5 
then 
stats.set_int(MPX .. "H4_MISSIONS", 65313) 
elseif 
value == 6 
then 
stats.set_int(MPX .. "H4_MISSIONS", 65345) 
elseif 
value == 7 
then 
stats.set_int(MPX .. "H4_MISSIONS", 65535) end xox_4 = value end)
	
L7NEGCAYO:add_array_item("Difficulty", {"Normal", "Hard"}, function() return xox_5 end, function(value) 
if 
value == 1 
then 
stats.set_int(MPX .. "H4_PROGRESS", 126823) 
elseif 
value == 2 
then 
stats.set_int(MPX .. "H4_PROGRESS", 131055) end xox_5 = value end)

L7NEGCAYO:add_action("       ---> Complete Preps - Finale <---", function() 
stats.set_int(MPX .. "H4CNF_UNIFORM", -1) 
stats.set_int(MPX .. "H4CNF_GRAPPEL", -1) 
stats.set_int(MPX .. "H4CNF_TROJAN", 5) 
stats.set_int(MPX .. "H4CNF_WEP_DISRP", 3) 
stats.set_int(MPX .. "H4CNF_ARM_DISRP", 3) 
stats.set_int(MPX .. "H4CNF_HEL_DISRP", 3) end)

L7NEGCAYO:add_action("All POI", function() 
stats.set_int(MPX .. "H4CNF_BS_GEN", -1) 
stats.set_int(MPX .. "H4CNF_BS_ENTR", 63) 
stats.set_int(MPX .. "H4CNF_APPROACH", -1) end)

L7NEGCAYO:add_action("Instant Finish $$", function() fmC2020:set_int(45450, 9) fmC2020:set_int(46829, 50) end)
 
L7NEGCAYO:add_action("---", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGCAYO1911 =  L7NEGCAYO :add_submenu("Skip Cayo Perico Cooldown Menu")

L7NEGCAYO1911:add_action("Skip Cayo Cooldown (Friends Mode)", function()
		   stats.set_int(MPX .. "H4_COOLDOWN", 0)
		   stats.set_int(MPX .. "H4_TARGET_POSIX", 1659429119)
		   stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0) end)
 
 L7NEGCAYO1911:add_action("Skip Cayo Cooldown (Solo Mode)", function()
		  stats.set_int(MPX .. "H4_COOLDOWN", 0)
		  stats.set_int(MPX .. "H4_TARGET_POSIX", 1659643454)
		  stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function Cctv(e) if not localplayer then return end if e then menu.remove_cctvs() else menu.remove_cctvs(nil) end end
L7NEGCAYO:add_toggle("Remove CCTV", function() return e6 end, function() e6 = not e6 Cctv(e6) end) 

L7NEGCAYO:add_action("Skip Drainage cut", function() if fmC2020:is_active() then if fmC2020:get_int(28446) >= 4 or fmC2020:get_int(28446) <= 6 then fmC2020:set_int(28446, 6) end end end)
 
L7NEGCAYO:add_action("Bypass Fingerprint Scanner", function() if fmC2020 and fmC2020:is_active() then if fmC2020:get_int(23669) == 4 then fmC2020:set_int(23669, 5) end end end)

L7NEGCAYO:add_action("Skip Plasma Cutter", function() fmC2020:set_float(29685 + 3, 100.0) end) 

L7NEGCAYO:add_action("Kill mission npcs", function() menu.kill_all_mission_peds() end) 

L7NEGCAYO:add_action("Kill all npcs", function() menu.kill_all_npcs() end)
RestartKosatkaBoard = 1526
 
L7NEGCAYO:add_action("Reset Kosatka Board", function()
	if script("heist_island_planning"):is_active() then
		script("heist_island_planning"):set_int(RestartKosatkaBoard, 2)
	end
end) 
L7NEGCAYO:add_action("---", function() end)

L7NEGCAYO:add_array_item("TP's Scope Out", {"Communications Tower", "Control Tower", "Power Station", "Bolt Cutters #1", "Bolt Cutters #2", "Bolt Cutters #3", "Bolt Cutters #4", "Bolt Cutters #5", "Bolt Cutters #6", "Bolt Cutters #7", "Bolt Cutters #8", "Bolt Cutters #9", "Bolt Cutters #10", "Bolt Cutters #11", "Bolt Cutters #12", "Bolt Cutters #13", "Bolt Cutters #14", "Bolt Cutters #15", "Cutting Powder #1", "Cutting Powder #2", "Cutting Powder #3", "Grappling Hook #1", "Grappling Hook #2", "Grappling Hook #3", "Grappling Hook #4", "Grappling Hook #5", "Grappling Hook #6", "Grappling Hook #7", "Grappling Hook #8", "Grappling Hook #9", "Grappling Hook #10", "Guard Clothes #1", "Guard Clothes #2", "Guard Clothes #3", "Guard Clothes #4", "Guard Clothes #5", "Guard Clothes #6", "Guard Clothes #7", "Signal Box #1", "Signal Box #2", "Signal Box #3", "Supply Truck #1", "Supply Truck #2", "Supply Truck #3", "Supply Truck #4", "Water Tower #1 (North Dock)", "Water Tower #2 (Main Dock)"}, function()
return xox_6 end, function(value)
if value == 1 then TP(5266.797363, -5427.772461, 139.746445, -0.943473, 0.000000, -0.000000)
elseif value == 2 then TP(4350.219238, -4577.410645, 2.899095, -1.119934, -0.000000, 0.000000)
elseif value == 3 then TP(4478.291992, -4580.129883, 4.258523, -2.885009, -0.000000, 0.000000)
elseif value == 4 then TP(5097.452637, -4620.177734, 1.193875, -2.592525, -0.000000, 0.000000)
elseif value == 5 then TP(4880.295898, -5112.941406, 1.053022, 1.313561, -0.000346, 0.000020)
elseif value == 6 then TP(4537.624512, -4542.424805, 3.546365, 1.941974, 0.000004, -0.000007)
elseif value == 7 then TP(5466.320801, -5230.169922, 25.993027, 2.763307, -0.000000, 0.000000)
elseif value == 8 then TP(4075.548828, -4663.984863, 2.994547, -2.552265, -0.000000, 0.000000)
elseif value == 9 then TP(4522.588867, -4509.868652, 3.188455, -2.631163, -0.000000, 0.000000)
elseif value == 10 then TP(4506.013672, -4656.211914, 10.579565, -0.049160, -0.000000, 0.000000)
elseif value == 11 then TP(4803.885742, -4317.895020, 6.201560, -0.422076, -0.000000, 0.000000)
elseif value == 12 then TP(5071.072266, -4639.869629, 2.112077, 0.523910, 0.000000, -0.000000)
elseif value == 13 then TP(5179.191895, -4669.967285, 5.832691, -2.465155, -0.000000, 0.000000)
elseif value == 14 then TP(5214.377441, -5126.496582, 4.925748, -1.519287, -0.000000, 0.000000)
elseif value == 15 then TP(4954.719727, -5180.171875, 2.966018, -2.558609, -0.000000, 0.000000)
elseif value == 16 then TP(4903.507812, -5345.524414, 8.850177, 2.197429, -0.000000, 0.000000)
elseif value == 17 then TP(4756.349609, -5539.995605, 17.625168, 2.077786, -0.000000, 0.000000)
elseif value == 18 then TP(5365.069336, -5438.819824, 47.831707, 0.996262, -0.000000, 0.000000)
elseif value == 19 then TP(5404.111328, -5171.486328, 30.132875, -0.749873, -0.000000, 0.000000)
elseif value == 20 then TP(5214.664551, -5131.837402, 4.938407, -1.654735, -0.000000, 0.000000)
elseif value == 21 then TP(4924.137695, -5271.690918, 4.351841, -2.826915, -0.000000, 0.000000)
elseif value == 22 then TP(4901.115723, -5332.090820, 27.841076, -0.469437, -0.000000, 0.000000)
elseif value == 23 then TP(4882.464355, -4487.831543, 8.713233, 1.552495, -0.000000, 0.000000)
elseif value == 24 then TP(5609.771484, -5653.084473, 8.651618, -2.502223, -0.000000, 0.000000)
elseif value == 25 then TP(5125.838379, -5095.626953, 0.893209, 2.800476, -0.000000, 0.000000)
elseif value == 26 then TP(4529.709961, -4700.855957, 3.120182, 2.906318, -0.000000, 0.000000)
elseif value == 27 then TP(3901.137451, -4690.617676, 2.826484, 2.661214, -0.000000, 0.000000)
elseif value == 28 then TP(5404.485840, -5170.345215, 30.130934, -1.991591, -0.000000, 0.000000)
elseif value == 29 then TP(5333.016602, -5264.369629, 31.446018, 1.854885, -0.000000, 0.000000)
elseif value == 30 then TP(5110.171387, -4579.133301, 28.417776, 0.901852, -0.000000, 0.000000)
elseif value == 31 then TP(5267.243164, -5429.493164, 139.747177, 2.378908, -0.000000, 0.000000)
elseif value == 32 then TP(5059.213867, -4592.870605, 1.595251, -0.291761, -0.000000, 0.000000)
elseif value == 33 then TP(4949.736328, -5320.138672, 6.776219, 3.108989, -0.000000, 0.000000)
elseif value == 34 then TP(4884.802734, -5452.898926, 29.437197, -2.087807, -0.000000, 0.000000)
elseif value == 35 then TP(4764.295898, -4781.471680, 2.501517, -0.586741, -0.000000, 0.000000)
elseif value == 36 then TP(5170.228516, -4677.545898, 1.122545, -0.371411, -0.000000, 0.000000)
elseif value == 37 then TP(5161.595215, -4993.595215, 11.394773, -2.397844, -0.000000, 0.000000)
elseif value == 38 then TP(5128.021484, -5530.752930, 52.743076, 1.605217, -0.000000, 0.000000)
elseif value == 39 then TP(5262.136719, -5432.140625, 64.297203, 2.467814, -0.000000, 0.000000)
elseif value == 40 then TP(5265.863281, -5421.060059, 64.297638, 0.805274, -0.000000, 0.000000)
elseif value == 41 then TP(5266.750977, -5426.982910, 139.746857, -0.631726, -0.000000, 0.000000)
elseif value == 42 then TP(4517.433105, -4531.979492, 2.820656, -1.275829, -0.000000, 0.000000)
elseif value == 43 then TP(5148.460938, -4620.099121, 1.108461, -1.422905, -0.000000, 0.000000)
elseif value == 44 then TP(4901.324219, -5216.216797, 2.768269, -2.631163, -0.000000, 0.000000)
elseif value == 45 then TP(5152.886719, -5143.897949, 0.997772, -0.205993, -0.000000, 0.000000)
elseif value == 46 then TP(5108.437012, -4580.132812, 28.417776, 1.720010, -0.000000, 0.000000)
elseif value == 47 then TP(4903.939453, -5337.220703, 34.306366, 0.821753, -0.000000, 0.000000)
end xox_6 = value end)

L7NEGCAYO:add_array_item("TP's Heist", {"Drainage Pipe", "Entry Drain", "Cayo Office", "Cayo Primary", "Basement Storage", "North Storage", "West Storage", "South Storage", "Cayo Gate", "Escaped"}, function() return xox_7 end, function(value)
if value == 1 then menu.end_cutscene() TP(5045.980957, -5816.833984, -11.489866, 0.884011, -0.000000, 0.000121)
elseif value == 2 then TP(5052.879395, -5771.335938, -6.004176, 1.169803, -0.000000, 0.001638)
elseif value == 3 then menu.end_cutscene() TP(5005.557617, -5754.321289, 27.545269, 2.586560, -0.000000, 0.000000)
elseif value == 4 then menu.end_cutscene() TP(5007.763184, -5756.029785, 14.184443, 2.467127, -0.000000, 0.000000)
elseif value == 5 then menu.end_cutscene() TP(4999.613281, -5749.913086, 13.540487, 2.613005, -0.000000, 0.000000)
elseif value == 6 then TP(5080.862305, -5756.300781, 14.529651, -0.575850, -0.000000, 0.000000)
elseif value == 7 then TP(5030.722168, -5736.470703, 16.565588, 2.439484, -0.000000, 0.000000)
elseif value == 8 then TP(5007.434570, -5787.255859, 16.531698, 0.680315, -0.000000, 0.000000)
elseif value == 9 then menu.end_cutscene() TP(4990.194824, -5716.448730, 18.580215, 0.946360, -0.000000, 0.000000)
elseif value == 10 then menu.end_cutscene() TP(4639.124023, -6010.004883, -7.475036, 1.930023, -0.000000, -0.000000)
end xox_7 = value end)

cutsMenu = L7NEGCAYO:add_submenu("Cuts")
cutsMenu:add_array_item("Preset cuts", {"65 all", "80 all", "90 all", "100 all", "138 all-Panther only", "202 all-PinkD only"}, function()return xox_32 end, function(G) if G == 1 then for i = 1978495 + 881 + 1, 1978495 + 881 + 1 + 1 + 1 + 1 do globals.set_int(i, 65) end elseif G == 2 then for i = 1978495 + 881 + 1, 1978495 + 881 + 1 + 1 + 1 + 1 do globals.set_int(i, 80) end elseif G == 3 then for i = 1978495 + 881 + 1, 1978495 + 881 + 1 + 1 + 1 + 1 do globals.set_int(i, 90) end elseif G == 4 then for i = 1978495 + 881 + 1, 1978495 + 881 + 1 + 1 + 1 + 1 do globals.set_int(i, 100) end elseif G == 5 then for i = 1978495 + 881 + 1, 1978495 + 881 + 1 + 1 + 1 + 1 do globals.set_int(i, 138) end elseif G == 6 then for i = 1978495 + 881 + 1, 1978495 + 881 + 1 + 1 + 1 + 1 do globals.set_int(i, 202) end end xox_32 = value end)

cutsMenu:add_int_range("Player 1", 1, 15, 300, function() return globals.get_int(1978495 + 881 + 1) end, function(value) globals.set_int(1978495 + 881 + 1, value) end)
cutsMenu:add_int_range("Player 2", 1, 15, 300, function() return globals.get_int(1978495 + 881 + 1 + 1) end, function(value) globals.set_int(1978495 + 881 + 1 + 1, value) end) 
cutsMenu:add_int_range("Player 3", 1, 15, 300, function() return globals.get_int(1978495 + 881 + 1 + 1 + 1) end, function(value) globals.set_int(1978495 + 881 + 1 + 1 + 1, value) end) 
cutsMenu:add_int_range("Player 4", 1, 15, 300, function() return globals.get_int(1978495 + 881 + 1 + 1 + 1 + 1) end, function(value) globals.set_int(1978495 + 881 + 1 + 1 + 1 + 1, value) end)

CPVMenu = L7NEGCAYO:add_submenu("Size/Value Editor") 
CPVMenu:add_int_range("Bag Size", 900.0, 1800, 999999999, function() return globals.get_int(BAS1) end, function(value) globals.set_int(BAS1, value) end) 

CPVMenu:add_action("--For default values, Dont Change", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGDOOMSDAY = L7NEGH:add_submenu("Doomsday Heist Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGDOOMSDAY:add_array_item("Doomsday Act", {"I:Data Breaches", "II:Bogdan Problem", "III:Doomsday Senario"}, function()
 return xox_22 end, function(value)
 xox_22 = value
 if value == 1
 then GGP = 503
 GGS = 229383
 elseif
 value == 2
 then GGP = 240
 GGS = 229378
 elseif
 value == 3
 then GGP = 16368
 GGS = 229380
 end
 stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", GGP)
 stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", GGS)
 stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
 end) 

L7NEGDOOMSDAY:add_action("Complete All", function()
 stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1) end)
 
L7NEGDOOMSDAY:add_action("Reset Heist", function()
 stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240)
 stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0)
 stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
 end) 

L7NEGDOOMSDAY:add_action("-----", function()
 end) 

L7NEGDOOMSDAY:add_action("Kill mission npcs", function()
 menu.kill_all_mission_peds()
 end) 

L7NEGDOOMSDAY:add_action("Kill all npcs", function()
 menu.kill_all_npcs()
 end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CasinoT = L7NEGT:add_submenu("Teleport The Casino ")  


local function teleport_myself(x,y,z)
    localplayer:set_position((vector3(x, y, z)))
end
 

CasinoT:add_action("Diamond Casino - Hack Vault 1", function()
	teleport_myself(2510.261475, -224.366699, -72.037163)
end)
 
CasinoT:add_action("Diamond Casino - Hack Vault 2", function()
	teleport_myself(2533.521729, -225.209366, -72.037163)
end)
 
CasinoT:add_action("Diamond Casino - Hack Vault 3", function()
	teleport_myself(2537.823486, -237.452118, -72.037163)
end)

CasinoT:add_action("Diamond Casino - Hack Vault 4", function()
	teleport_myself(2534.049561, -248.194931, -72.037163)
end)

CasinoT:add_action("Diamond Casino - Hack Vault 5", function()
	teleport_myself(2520.342773, -255.425705, -72.037178)
end)

CasinoT:add_action("Diamond Casino - Hack Vault 6", function()
	teleport_myself(2509.844238, -250.968552, -72.037170)
end)

CasinoT:add_action("Diamond Casino - Cash Vault Lobby Enter", function()
	teleport_myself(2521.761719, -287.359192, -60.022976)
end)

CasinoT:add_action("Diamond Casino - Cash Vault Lobby Exit", function()
	teleport_myself(2521.876709, -284.334869, -60.022999)
end)

CayoT = L7NEGT:add_submenu("Teleport The Cayo Perlco ")  


local function teleport_myself(x,y,z)
    localplayer:set_position((vector3(x, y, z)))
end
 

CayoT:add_action("CayoPerico - Main Dock", function()
	teleport_myself(4947.496094, -5168.458008, 1.234270)
end)
 
CayoT:add_action("CayoPerico - Main Loot", function()
	teleport_myself(5010.065430, -5751.291504, 14.184451)
end)
 
CayoT:add_action("CayoPerico - Office", function()
	teleport_myself(5010.203613, -5753.518555, 27.545284)
end)

CayoT:add_action("CayoPerico - Vault Loot", function()
	teleport_myself(4999.764160, -5747.863770, 14.840000)
end)

CayoT:add_action("CayoPerico - Main Loot Gate", function()
	teleport_myself(5009.156738, -5753.715820, 14.173852)
end)

CayoT:add_action("CayoPerico - North Safe Point", function()
	teleport_myself(4961.050781, -5791.280762, 24.966309)
end)

CayoT:add_action("CayoPerico - StorageRoom1", function()
	teleport_myself(5080.922852, -5756.109375, 14.529646)
end)

CayoT:add_action("CayoPerico - StorageRoom2", function()
	teleport_myself(5028.794922, -5735.571777, 16.565603)
end)

CayoT:add_action("CayoPerico - StorageRoom3", function()
	teleport_myself(5008.020020, -5787.345215, 16.531713)
end)

CayoT:add_action("CayoPerico - StorageRoom4", function()
	teleport_myself(5000.289062, -5749.532715, 13.540483)
end)

CayoT:add_action("CayoPerico - PowerStation", function()
	teleport_myself(4477.102539, -4597.295898, 4.283014)
end)

CayoT:add_action("CayoPerico - CommTower", function()
	teleport_myself(5266.018555, -5427.736328, 64.297134)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #01", function()
	teleport_myself(4924.384766, -5243.334473, 1.223530)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #02", function()
	teleport_myself(4999.082520, -5165.239746, 1.464267)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #03", function()
	teleport_myself(4504.116211, -4555.046387, 2.871900)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #04", function()
	teleport_myself(4437.779785, -4447.757812, 3.028435)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #05", function()
	teleport_myself(5136.357910, -4607.321289, 1.332651)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #06", function()
	teleport_myself(5064.508789, -4596.458008, 1.552215)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #07", function()
	teleport_myself(5090.897949, -4682.269043, 1.107239)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #08", function()
	teleport_myself(5194.034668, -5135.017090, 2.046481)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #09", function()
	teleport_myself(5330.440918, -5270.056641, 31.886101)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #10", function()
	teleport_myself(4999.170898, -5165.166504, 1.464278)
end)

CayoT:add_action("CayoPerico - Main Dock Loot #11", function()
	teleport_myself(4961.721680, -5108.724609, 1.681915)
end)

CayoT:add_action("CayoPerico - Hack Tower #01", function()
	teleport_myself(5265.228516, -5429.266113, 107.849457)
end)

CayoT:add_action("CayoPerico - Hack Tower #02", function()
	teleport_myself(5266.385742, -5431.791992, 89.423813)
end)

CayoT:add_action("CayoPerico - Hack Tower #03", function()
	teleport_myself(5265.713867, -5427.803711, 139.747101)
end)

CayoT:add_action("CayoPerico - Exit", function()
	teleport_myself(4990.778809, -5716.004395, 18.580210)
end)



Teleports1 = L7NEGT:add_submenu("Criminal Enterprises Location")



local function teleport_myself(x,y,z)
    localplayer:set_position((vector3(x, y, z)))
end
 

Teleports1:add_action("ULP Missions Place", function()
	teleport_myself(101.928909, -662.696899, 43.792946)
end)



Teleports1:add_action("Intelligence (A)", function()
	teleport_myself(102.285995, -743.904236, 44.454739)
end)

Teleports1:add_action("Intelligence (B)", function()
	teleport_myself(853.439697, -2339.465088, 29.033638)
end)

Teleports1:add_action("Intelligence (Form)", function()
	teleport_myself(135.506348, -411.055298, 39.800133)
end)


Teleports1:add_action("Asset Seizure Junmps (A)", function()
	teleport_myself(326.487152, 247.269836, 120.999054)
end)


Teleports1:add_action("Asset Seizure Junmps (B)", function()
	teleport_myself(322.510529, -1021.790039, 65.800781)
end)

Teleports1:add_action("Asset Seizure Junmps (C)", function()
	teleport_myself(944.160217, -1276.162720, 37.575909)
end)

Teleports1:add_action("Asset Seizure Junmps (D)", function()
	teleport_myself(474.824829, -1491.969238, 41.093029)
end)

Teleports1:add_action("Asset Seizure Junmps (E)", function()
	teleport_myself(-1151.569336, -1464.594971, 13.410949)
end)

Teleports1:add_action("Place The Duggan (04)", function()
	teleport_myself(948.105835, -967.375183, 57.794834)
end)

Teleports1:add_action("Cleanup Fuses #1", function()
	teleport_myself(272.998596, 6255.754395, -161.522446)
end)

Teleports1:add_action("Cleanup Fuses #2", function()
	teleport_myself(255.795135, 6226.052734, -160.722565)
end)

Teleports1:add_action("Cleanup Fuses #3", function()
	teleport_myself(269.060669, 6227.046875, -161.320480)
end)

Teleports1:add_action("Cleanup Fuses #4", function()
	teleport_myself(304.902069, 6283.410156, -161.322891)
end)

Teleports1:add_action("Cleanup Hacker #1", function()
	teleport_myself(207.937408, 6191.559570, -155.720383)
end)

Teleports1:add_action("Cleanup Hacker #2", function()
	teleport_myself(281.390625, 6191.603516, -155.720322)
end)

Teleports1:add_action("Cleanup Hacker #3", function()
	teleport_myself(280.475342, 6135.657715, -155.720428)
end)

Teleports1:add_action("Cleanup Hacker #4", function()
	teleport_myself( 210.218964, 6136.259766, -155.720383)
end)

Teleports1:add_action("Exit Cleanup", function()
	teleport_myself( 369.282410, 6318.566895, -161.227356)
end)


Teleports2 = L7NEGT:add_submenu("Location M14")



Teleports2:add_action("#1 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(660.8411, -2956.858, 10)
	end
end)

Teleports2:add_action("#2 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(792.0984, -501.4656, 35)
	end
end)

Teleports2:add_action("#3 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(-413.1981, 259.6958, 85)
	end
end)

Teleports2:add_action("#4 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(-277.6784, -1164.282, 30)
	end
end)

Teleports2:add_action("#5 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(-1495.806, -889.3169, 15)
	end
end)

Teleports2:add_action("#6 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(-2953.693, 406.7237, 15)
	end
end)

Teleports2:add_action("#7 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(857.9775, 3638.053, 35)
	end
end)

Teleports2:add_action("#8 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(2548.596, 2636.489, 40)
	end
end)

Teleports2:add_action("#9 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(1816.777, 4594.512, 40)
	end
end)

Teleports2:add_action("#10 Possible Location", function()
	if localplayer ~= nil then
		localplayer:set_position(-193.6185, 6395.78, 35)
	end
end)


DLC164 = L7NEGT:add_submenu("Location Gun Van")


DLC164:add_action("#1 - Paleto Bay", function()
	if localplayer ~= nil then
		localplayer:set_position(-29.532, 6435.136, 31.162)
	end
end)

DLC164:add_action("#2 - Grapeseed Discount Store", function()
	if localplayer ~= nil then
		localplayer:set_position(1705.214, 4819.167, 41.75)
	end
end)

DLC164:add_action("#3 - Sandy Shores", function()
	if localplayer ~= nil then
		localplayer:set_position(1795.522, 3899.753, 33.869)
	end
end)

DLC164:add_action("#4 - Grand Senora Desert by the airstrip", function()
	if localplayer ~= nil then
		localplayer:set_position(1335.536, 2758.746, 51.099)
	end
end)

DLC164:add_action("#5 - Vinewood Sign", function()
	if localplayer ~= nil then
		localplayer:set_position(795.583, 1210.78, 338.962)
	end
end)


DLC164:add_action("#6 - Chumash Plaza", function()
	if localplayer ~= nil then
		localplayer:set_position(-3192.67, 1077.205, 20.594)
	end
end)


DLC164:add_action("#7 - Paleto Forest near the sawmill", function()
	if localplayer ~= nil then
		localplayer:set_position(-789.719, 5400.921, 33.915)
	end
end)


DLC164:add_action("#8 - Ortega's trailer", function()
	if localplayer ~= nil then
		localplayer:set_position(-24.384, 3048.167, 40.703)
	end
end)


DLC164:add_action("#9 - Powerplant", function()
	if localplayer ~= nil then
		localplayer:set_position(2666.786, 1469.324, 24.237)
	end
end)


DLC164:add_action("#10 - Powerplant", function()
	if localplayer ~= nil then
		localplayer:set_position(-1454.966, 2667.503, 3.2)
	end
end)

DLC164:add_action("#11 - Grand Senora Desert Scrapyard", function()
	if localplayer ~= nil then
		localplayer:set_position(2340.418, 3054.188, 47.888)
	end
end)


DLC164:add_action("#12 - El Burro Heights scrapyard", function()
	if localplayer ~= nil then
		localplayer:set_position(1509.183, -2146.795, 76.853)
	end
end)

DLC164:add_action("#13 - Murrieta Heights", function()
	if localplayer ~= nil then
		localplayer:set_position(1137.404, -1358.654, 34.322)
	end
end)


DLC164:add_action("#14 - Elysian Island", function()
	if localplayer ~= nil then
		localplayer:set_position(-57.208, -2658.793, 5.737)
	end
end)


DLC164:add_action("#15 - Reservwar", function()
	if localplayer ~= nil then
		localplayer:set_position(1905.017, 565.222, 175.558)
	end
end)


DLC164:add_action("#16 - La Mesa", function()
	if localplayer ~= nil then
		localplayer:set_position(974.484, -1718.798, 30.296)
	end
end)


DLC164:add_action("#17 - Dock Terminal", function()
	if localplayer ~= nil then
		localplayer:set_position(779.077, -3266.297, 5.719)
	end
end)

DLC164:add_action("#18 - la Puerta junkyard", function()
	if localplayer ~= nil then
		localplayer:set_position(-587.728, -1637.208, 19.611)
	end
end)

DLC164:add_action("#19 - La Mesa", function()
	if localplayer ~= nil then
		localplayer:set_position(733.99, -736.803, 26.165)
	end
end)


DLC164:add_action("#20 - La Mesa", function()
	if localplayer ~= nil then
		localplayer:set_position(-1694.632, -454.082, 40.712)
	end
end)



DLC164:add_action("#21 - Vespucci Beach", function()
	if localplayer ~= nil then
		localplayer:set_position(-1330.726, -1163.948, 4.313)
	end
end)

DLC164:add_action("#22 - West Vinewood", function()
	if localplayer ~= nil then
		localplayer:set_position(-496.618, 40.231, 52.316)
	end
end)


DLC164:add_action("#23 - Downtown Vinewood", function()
	if localplayer ~= nil then
		localplayer:set_position(275.527, 66.509, 94.108)
	end
end)

DLC164:add_action("#24 - Pillbox Hill", function()
	if localplayer ~= nil then
		localplayer:set_position(260.928, -763.35, 30.559)
	end
end)


DLC164:add_action("#25 - Little Seoul", function()
	if localplayer ~= nil then
		localplayer:set_position(-478.025, -741.45, 30.299)
	end
end)


DLC164:add_action("#26 - Alamo Sea", function()
	if localplayer ~= nil then
		localplayer:set_position( 894.94, 3603.911, 32.56)
	end
end)

DLC164:add_action("#27 - Hookies", function()
	if localplayer ~= nil then
		localplayer:set_position( -2166.511, 4289.503, 48.733)
	end
end)

DLC164:add_action("#28 - Mt. Chilliad Truck terminal", function()
	if localplayer ~= nil then
		localplayer:set_position( 1465.633,  6553.67, 13.771)
	end
end)

DLC164:add_action("#29 - Mirror Park", function()
	if localplayer ~= nil then
		localplayer:set_position( 1101.032, -335.172, 66.944)
	end
end)


DLC164:add_action("#30 - Davis", function()
	if localplayer ~= nil then
		localplayer:set_position(149.683, -1655.674, 29.028)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG3 = L7NEG:add_submenu("1.67 Unlocker Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG3:add_toggle("Enable Deleted Vehicles", function() 
return end, function(value)
for i = DV1, DV2 
do 
globals.set_boolean(i,value) end 
for j = DV3, DV4 
do 
globals.set_boolean(j,value) end 
for k = DV5, DV6 
do 
globals.set_boolean(k,value) end 
for l = DV7, DV8 
do 
globals.set_boolean(l,value) end  
for z = DV9, DV10
do
globals.set_boolean(z,value) end
for x = DV11, DV12
do
globals.set_boolean(x,value) end
for c = DV15, DV16
do
globals.set_boolean(c,value) end
for v = DV17, DV18
do
globals.set_boolean(v,value) end
for b = DV19, DV20
do
globals.set_boolean(b,value) end
for n = DV21, DV22
do
globals.set_boolean(n,value) end
for m = DV23, DV24
do
globals.set_boolean(m,value) end
for q = DV25, DV26
do
globals.set_boolean(q,value) end
for w = DV27, DV28
do
globals.set_boolean(w,value) end
globals.set_boolean(DV13,value) 
globals.set_boolean(DV14,value) 
end)

L7NEG3:add_action("Unlock Gun Van Missed Guns", function()
globals.set_int(262145 + 34094 + 3, -22923932) ----- RailGun
globals.set_int(262145 + 34094 + 4, -1238556825) ----- WidoMaker
globals.set_int(262145 + 34094 + 5, -1355376991) ----- RayPistol
globals.set_int(262145 + 34094 + 6, 1198256469) ----- HellBringer
globals.set_int(262145 + 34094 + 7, -1786099057) ----- BaseBall Bat
end)

L7NEG3:add_action("Unlock Taxi Livery for Eudora", function()
	stats.set_masked_int(MPX .. "DLC22022PSTAT_INT536", 10, 16, 8)
end)

L7NEG3:add_action("Unlock Taxi Livery for Broadway", function()
	stats.set_int(MPX .. "AWD_TAXIDRIVER", 50)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGEVENTS = L7NEG:add_submenu("Events Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Full Account Unlocker Tool---

	FAUT = Self:add_submenu("Full Account Unlock Menu")
				   
--Character's Stats--

	CSU = FAUT:add_submenu("Character's Stats")
	
	AcMenu = CSU:add_submenu("Achievements")
			
			Acv0 = false
			AG = 4542602 + 1
		local function AchUnlock()
		while Acv0 == true do for i = 1, 78 do globals.set_int(4542602 + 1 , i) end end end
	AcMenu:add_toggle("Unlock All", function() return Acv0 end, function() Acv0 = not Acv0 AchUnlock(Acv0) end)
											 
	AcMMenu = AcMenu:add_submenu("Unlock One By One")
	
	AcMMenu:add_action("Welcome to Los Santos", function() globals.set_int(AG, 1) end)
	AcMMenu:add_action("A Friendship Resurrected", function() globals.set_int(AG, 2) end)
	AcMMenu:add_action("A Fair Day's Pay", function() globals.set_int(AG, 3) end)
	AcMMenu:add_action("The Moment of Truth", function() globals.set_int(AG, 4) end)
	AcMMenu:add_action("To Live or Die in Los Santos", function() globals.set_int(AG, 5) end)
	AcMMenu:add_action("Diamond Hard", function() globals.set_int(AG, 6) end)
	AcMMenu:add_action("Subversive", function() globals.set_int(AG, 7) end)
	AcMMenu:add_action("Blitzed", function() globals.set_int(AG, 8) end)
	AcMMenu:add_action("Small Town, Big Job", function() globals.set_int(AG, 9) end)
	AcMMenu:add_action("The Government Gimps", function() globals.set_int(AG, 10) end)
	AcMMenu:add_action("The Big One!", function() globals.set_int(AG, 11) end)
	AcMMenu:add_action("Solid Gold, Baby!", function() globals.set_int(AG, 12) end)
	AcMMenu:add_action("Career Criminal", function() globals.set_int(AG, 13) end)
	AcMMenu:add_action("San Andreas Sightseer", function() globals.set_int(AG, 14) end)
	AcMMenu:add_action("All's Fare in Love and War", function() globals.set_int(AG, 15) end)
	AcMMenu:add_action("TP Industries Arms Race", function() globals.set_int(AG, 16) end)
	AcMMenu:add_action("Multi-Disciplined", function() globals.set_int(AG, 17) end)
	AcMMenu:add_action("From Beyond the Stars", function() globals.set_int(AG, 18) end)
	AcMMenu:add_action("A Mystery, Solved", function() globals.set_int(AG, 19) end)
	AcMMenu:add_action("Waste Management", function() globals.set_int(AG, 20) end)
	AcMMenu:add_action("Red Mist", function() globals.set_int(AG, 21) end)
	AcMMenu:add_action("Show Off", function() globals.set_int(AG, 22) end)
	AcMMenu:add_action("Kifflom!", function() globals.set_int(AG, 23) end)
	AcMMenu:add_action("Three Man Army", function() globals.set_int(AG, 24) end)
	AcMMenu:add_action("Out of Your Depth", function() globals.set_int(AG, 25) end)
	AcMMenu:add_action("Altruist Acolyte", function() globals.set_int(AG, 26) end)
	AcMMenu:add_action("A Lot of Cheddar", function() globals.set_int(AG, 27) end)
	AcMMenu:add_action("Trading Pure Alpha", function() globals.set_int(AG, 28) end)
	AcMMenu:add_action("Pimp My Sidearm", function() globals.set_int(AG, 29) end)
	AcMMenu:add_action("Wanted: Alive Or Alive", function() globals.set_int(AG, 30) end)
	AcMMenu:add_action("Los Santos Customs", function() globals.set_int(AG, 31) end)
	AcMMenu:add_action("Close Shave", function() globals.set_int(AG, 32) end)
	AcMMenu:add_action("Off the Plane", function() globals.set_int(AG, 33) end)
	AcMMenu:add_action("Three-Bit Gangster", function() globals.set_int(AG, 34) end)
	AcMMenu:add_action("Making Moves", function() globals.set_int(AG, 35) end)
	AcMMenu:add_action("Above the Law", function() globals.set_int(AG, 36) end)
	AcMMenu:add_action("Numero Uno", function() globals.set_int(AG, 37) end)
	AcMMenu:add_action("The Midnight Club", function() globals.set_int(AG, 38) end)
	AcMMenu:add_action("Unnatural Selection", function() globals.set_int(AG, 39) end)
	AcMMenu:add_action("Backseat Driver", function() globals.set_int(AG, 40) end)
	AcMMenu:add_action("Run Like The Wind", function() globals.set_int(AG, 41) end)
	AcMMenu:add_action("Clean Sweep", function() globals.set_int(AG, 42) end)
	AcMMenu:add_action("Decorated", function() globals.set_int(AG, 43) end)
	AcMMenu:add_action("Stick Up Kid", function() globals.set_int(AG, 44) end)
	AcMMenu:add_action("Enjoy Your Stay", function() globals.set_int(AG, 45) end)
	AcMMenu:add_action("Crew Cut", function() globals.set_int(AG, 46) end)
	AcMMenu:add_action("Full Refund", function() globals.set_int(AG, 47) end)
	AcMMenu:add_action("Dialling Digits", function() globals.set_int(AG, 48) end)
	AcMMenu:add_action("American Dream", function() globals.set_int(AG, 49) end)
	AcMMenu:add_action("A New Perspective", function() globals.set_int(AG, 50) end)
	AcMMenu:add_action("Be Prepared", function() globals.set_int(AG, 51) end)
	AcMMenu:add_action("In the Name of Science", function() globals.set_int(AG, 52) end)
	AcMMenu:add_action("Dead Presidents", function() globals.set_int(AG, 53) end)
	AcMMenu:add_action("Parole Day", function() globals.set_int(AG, 54) end)
	AcMMenu:add_action("Shot Caller", function() globals.set_int(AG, 55) end)
	AcMMenu:add_action("Four Way", function() globals.set_int(AG, 56) end)
	AcMMenu:add_action("Live a Little", function() globals.set_int(AG, 57) end)
	AcMMenu:add_action("Can't Touch This", function() globals.set_int(AG, 58) end)
	AcMMenu:add_action("Mastermind", function() globals.set_int(AG, 59) end)
	AcMMenu:add_action("Vinewood Visionary", function() globals.set_int(AG, 60) end)
	AcMMenu:add_action("Majestic", function() globals.set_int(AG, 61) end)
	AcMMenu:add_action("Humans of Los Santos", function() globals.set_int(AG, 62) end)
	AcMMenu:add_action("First Time Director", function() globals.set_int(AG, 63) end)
	AcMMenu:add_action("Animal Lover", function() globals.set_int(AG, 64) end)
	AcMMenu:add_action("Ensemble Piece", function() globals.set_int(AG, 65) end)
	AcMMenu:add_action("Cult Movie", function() globals.set_int(AG, 66) end)
	AcMMenu:add_action("Location Scout", function() globals.set_int(AG, 67) end)
	AcMMenu:add_action("Method Actor", function() globals.set_int(AG, 68) end)
	AcMMenu:add_action("Cryptozoologist", function() globals.set_int(AG, 69) end)
	AcMMenu:add_action("Getting Started", function() globals.set_int(AG, 70) end)
	AcMMenu:add_action("The Data Breaches", function() globals.set_int(AG, 71) end)
	AcMMenu:add_action("The Bogdan Problem", function() globals.set_int(AG, 72) end)
	AcMMenu:add_action("The Doomsday Scenario", function() globals.set_int(AG, 73) end)
	AcMMenu:add_action("A World Worth Saving", function() globals.set_int(AG, 74) end)
	AcMMenu:add_action("Orbital Obliteration", function() globals.set_int(AG, 75) end)
	AcMMenu:add_action("Elitist", function() globals.set_int(AG, 76) end)
	AcMMenu:add_action("Masterminds", function() globals.set_int(AG, 77) end)
	
	AcMenu:add_action("", function() end)
	
	AcNote = AcMenu:add_submenu("Read Me")
	
	AcNote:add_action("                         Unlock All:", function() end)
	AcNote:add_action(" Unlocks all achievements auto; ≈10 mins;", function() end)
	AcNote:add_action("               to turn off the option,", function() end)
	AcNote:add_action("     close the menu via «Menu Settings»", function() end)
	
	AMenu = CSU:add_submenu("Awards")
	
	AMenu:add_action("Unlock All", function()
			stats.set_int(MPX .. "AWD_FM_DM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_MVP", 50)
			stats.set_int(MPX .. "AWD_RACES_WON", 50)
			stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
			stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
			stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 50)
			stats.set_bool(MPX .. "AWD_FMKILL3ANDWINGTARACE", true)
			stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
			stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
			stats.set_bool(MPX .. "AWD_FMWINCUSTOMRACE", true)
			stats.set_int(MPX .. "AWD_FMWINRACETOPOINTS", 25)
			stats.set_bool(MPX .. "CL_RACE_MODDED_CAR", true)
			stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 25)
			stats.set_bool(MPX .. "AWD_FMRACEWORLDRECHOLDER", true)
			stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
			stats.set_bool(MPX .. "AWD_FMWINALLRACEMODES", true)
			stats.set_int(MPX .. "AWD_FMHORDWAVESSURVIVE", 10)
			stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
			stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
			stats.set_int(MPX .. "AWD_NO_ARMWRESTLING_WINS", 25)
			stats.set_int(MPX .. "MOST_ARM_WRESTLING_WINS", 25)
			stats.set_int(MPX .. "AWD_WIN_AT_DARTS", 25)
			stats.set_int(MPX .. "AWD_FM_GOLF_WON", 25)
			stats.set_int(MPX .. "AWD_FM_TENNIS_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_5_SET_WINS", true)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_STASETWIN", true)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_CT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_RT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_TG_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_SHOOTRANG_GRAN_WON", true)
			stats.set_bool(MPX .. "AWD_FMWINEVERYGAMEMODE", true)
			stats.set_int(MPX .. "AWD_WIN_CAPTURES", 50)
			stats.set_int(MPX .. "AWD_WIN_CAPTURE_DONT_DYING", 25)
			stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
			stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
			stats.set_int(MPX .. "AWD_KILL_TEAM_YOURSELF_LTS", 25)
			stats.set_int(MPX .. "AIR_LAUNCHES_OVER_40M", 25)
			stats.set_int(MPX .. "AWD_CARS_EXPORTED", 50)
			stats.set_int(MPX .. "AWD_LESTERDELIVERVEHICLES", 25)
			stats.set_int(MPX .. "TOTAL_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_RACES_LOST", 250)
			stats.set_int(MPX .. "TOTAL_CUSTOM_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_WON", 500)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_WON", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_WINS", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_LOSSES", 250)
			stats.set_int(MPX .. "TENNIS_MATCHES_WON", 500)
			stats.set_int(MPX .. "TENNIS_MATCHES_LOST", 250)
			stats.set_int(MPX .. "GOLF_WINS", 500)
			stats.set_int(MPX .. "GOLF_LOSSES", 250)
			stats.set_int(MPX .. "DARTS_TOTAL_WINS", 500)
			stats.set_int(MPX .. "DARTS_TOTAL_MATCHES", 750)
			stats.set_int(MPX .. "SHOOTINGRANGE_TOTAL_MATCH", 800)
			stats.set_int(MPX .. "BJ_WINS", 500)
			stats.set_int(MPX .. "BJ_LOST", 250)
			stats.set_int(MPX .. "RACE_2_POINT_WINS", 500)
			stats.set_int(MPX .. "RACE_2_POINT_LOST", 250)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "MISSIONS_CREATED", 500)
			stats.set_int(MPX .. "LTS_CREATED", 500)
			stats.set_int(MPX .. "FM_MISSION_LIKES", 1500)
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTDM", true)
			stats.set_int(MPX .. "CR_DIFFERENT_DM", 25)
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTRACES", true)
			stats.set_int(MPX .. "CR_DIFFERENT_RACES", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_20M", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_50M", 25)
			stats.set_int(MPX .. "AWD_FMBASEJMP", 25)
			stats.set_bool(MPX .. "AWD_FMATTGANGHQ", true)
			stats.set_bool(MPX .. "AWD_FM6DARTCHKOUT", true)
			stats.set_int(MPX .. "AWD_FM_GOLF_BIRDIES", 25)
			stats.set_bool(MPX .. "AWD_FM_GOLF_HOLE_IN_1", true)
			stats.set_int(MPX .. "AWD_FM_TENNIS_ACE", 25)
			stats.set_int(MPX .. "AWD_FMBBETWIN", 50000)
			stats.set_int(MPX .. "AWD_LAPDANCES", 25)
			stats.set_int(MPX .. "AWD_FMCRATEDROPS", 25)
			stats.set_bool(MPX .. "AWD_FMPICKUPDLCCRATE1ST", true)
			stats.set_bool(MPX .. "AWD_FM25DIFITEMSCLOTHES", true)
			stats.set_int(MPX .. "AWD_NO_HAIRCUTS", 25)
			stats.set_bool(MPX .. "AWD_BUY_EVERY_GUN", true)
			stats.set_bool(MPX .. "AWD_DRIVELESTERCAR5MINS", true)
			stats.set_bool(MPX .. "AWD_FMTATTOOALLBODYPARTS", true)
			stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_PICKUP_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_MENTALSTATE_TO_NORMAL", 50)
			stats.set_bool(MPX .. "AWD_STORE_20_CAR_IN_GARAGES", true)
			stats.set_int(MPX .. "AWD_TRADE_IN_YOUR_PROPERTY", 25)
			stats.set_bool(MPX .. "AWD_DAILYOBJWEEKBONUS", true)
			stats.set_bool(MPX .. "AWD_DAILYOBJMONTHBONUS", true)
			stats.set_int(MPX .. "AWD_FM_CR_DM_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_RACES_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_PLAYED_BY_PEEP", 1598)
			stats.set_int(MPX .. "AWD_FM_CR_MISSION_SCORE", 100)
			stats.set_bool(MPX .. "CL_DRIVE_RALLY", true)
			stats.set_bool(MPX .. "CL_PLAY_GTA_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_BOAT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_FOOT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_TEAM_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_VEHICLE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_MISSION_CONTACT", true)
			stats.set_bool(MPX .. "CL_PLAY_A_PLAYLIST", true)
			stats.set_bool(MPX .. "CL_PLAY_POINT_TO_POINT", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_RACE", true)
			stats.set_bool(MPX .. "CL_SURV_A_BOUNTY", true)
			stats.set_bool(MPX .. "CL_SET_WANTED_LVL_ON_PLAY", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_GANGS", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_LOST", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_VAGOS", true)
			stats.set_bool(MPX .. "CL_CALL_MERCENARIES", true)
			stats.set_bool(MPX .. "CL_PHONE_MECH_DROP_CAR", true)
			stats.set_bool(MPX .. "CL_GONE_OFF_RADAR", true)
			stats.set_bool(MPX .. "CL_FILL_TITAN", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_BUY_INSURANCE", true)
			stats.set_bool(MPX .. "CL_BUY_GARAGE", true)
			stats.set_bool(MPX .. "CL_ENTER_FRIENDS_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_STRIPPER_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_FRIEND", true)
			stats.set_bool(MPX .. "CL_SEND_FRIEND_REQUEST", true)
			stats.set_bool(MPX .. "CL_W_WANTED_PLAYER_TV", true)
			stats.set_bool(MPX .. "FM_INTRO_CUT_DONE", true)
			stats.set_bool(MPX .. "FM_INTRO_MISS_DONE", true)
			stats.set_bool(MPX .. "SHOOTINGRANGE_SEEN_TUT", true)
			stats.set_bool(MPX .. "TENNIS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "DARTS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "ARMWRESTLING_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "HAS_WATCHED_BENNY_CUTSCE", true)
			stats.set_int(MPX .. "NO_PHOTOS_TAKEN", 100)
			stats.set_int(MPX .. "BOUNTSONU", 200)
			stats.set_int(MPX .. "BOUNTPLACED", 500)
			stats.set_int(MPX .. "BETAMOUNT", 500)
			stats.set_int(MPX .. "CRARMWREST", 500)
			stats.set_int(MPX .. "CRBASEJUMP", 500)
			stats.set_int(MPX .. "CRDARTS", 500)
			stats.set_int(MPX .. "CRDM", 500)
			stats.set_int(MPX .. "CRGANGHIDE", 500)
			stats.set_int(MPX .. "CRGOLF", 500)
			stats.set_int(MPX .. "CRHORDE", 500)
			stats.set_int(MPX .. "CRMISSION", 500)
			stats.set_int(MPX .. "CRSHOOTRNG", 500)
			stats.set_int(MPX .. "CRTENNIS", 500)
			stats.set_int(MPX .. "NO_TIMES_CINEMA", 500)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_2_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_3_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_4_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED2", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "NO_WEAPONS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_MODS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_CLR_MOD_UNLOCK", -1) 
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_4_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_10_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE4", -1)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_BLUE", 1000)
			stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", -1)
		        for i = 2, 19 do stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH"..i, -1) end
		        for j = 1, 19 do stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_"..j.."_UNLCK", -1) end
		        for m = 1, 41 do stats.set_int(MPX .. "CHAR_KIT_"..m.."_FM_UNLCK", -1) end
		        for l = 2, 41 do stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE"..l, -1) end
			stats.set_int(MPX .. "AWD_FMTIME5STARWANTED", 120)
			stats.set_int(MPX .. "AWD_5STAR_WANTED_AVOIDANCE", 50)
			stats.set_int(MPX .. "AWD_FMSHOOTDOWNCOPHELI", 25)
			stats.set_int(MPX .. "AWD_VEHICLES_JACKEDR", 500)
			stats.set_int(MPX .. "AWD_SECURITY_CARS_ROBBED", 25)
			stats.set_int(MPX .. "AWD_HOLD_UP_SHOPS", 20)
			stats.set_int(MPX .. "AWD_ODISTRACTCOPSNOEATH", 25)
			stats.set_int(MPX .. "AWD_ENEMYDRIVEBYKILLS", 100)
			stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME5STAR", 18000000)
			stats.set_int(MPX .. "CARS_COPS_EXPLODED", 300)
			stats.set_int(MPX .. "BIKES_EXPLODED", 100)
			stats.set_int(MPX .. "BOATS_EXPLODED", 168)
			stats.set_int(MPX .. "HELIS_EXPLODED", 98)
			stats.set_int(MPX .. "PLANES_EXPLODED", 138)
			stats.set_int(MPX .. "QUADBIKE_EXPLODED", 50)
			stats.set_int(MPX .. "BICYCLE_EXPLODED", 48)
			stats.set_int(MPX .. "SUBMARINE_EXPLODED", 28)
			stats.set_int(MPX .. "TIRES_POPPED_BY_GUNSHOT", 500)
			stats.set_int(MPX .. "NUMBER_CRASHES_CARS", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_BIKES", 300)
			stats.set_int(MPX .. "BAILED_FROM_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 300)
			stats.set_int(MPX .. "MC_CONTRIBUTION_POINTS", 1000)
			stats.set_int(MPX .. "MEMBERSMARKEDFORDEATH", 700)
			stats.set_int(MPX .. "MCKILLS", 500)
			stats.set_int(MPX .. "MCDEATHS", 700)
			stats.set_int(MPX .. "RIVALPRESIDENTKILLS", 700)
			stats.set_int(MPX .. "RIVALCEOANDVIPKILLS", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTSCOMPLETE", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTEARNINGS", 32698547)
			stats.set_int(MPX .. "CLUBCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "MEMBERCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "GHKILLS", 500)
			stats.set_int(MPX .. "HORDELVL", 10)
			stats.set_int(MPX .. "HORDKILLS", 500)
			stats.set_int(MPX .. "UNIQUECRATES", 500)
			stats.set_int(MPX .. "BJWINS", 500)
			stats.set_int(MPX .. "HORDEWINS", 500)
			stats.set_int(MPX .. "MCMWINS", 500)
			stats.set_int(MPX .. "GANGHIDWINS", 500)
			stats.set_int(MPX .. "KILLS", 800)
			stats.set_int(MPX .. "HITS_PEDS_VEHICLES", 100)
			stats.set_int(MPX .. "SHOTS", 1000)
			stats.set_int(MPX .. "HEADSHOTS", 100)
			stats.set_int(MPX .. "KILLS_ARMED", 650)
			stats.set_int(MPX .. "SUCCESSFUL_COUNTERS", 100)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "KILLS_STEALTH", 100)
			stats.set_int(MPX .. "KILLS_INNOCENTS", 500)
			stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_BY_OTHERS", 100)
			stats.set_int(MPX .. "BIGGEST_VICTIM_KILLS", 500)
			stats.set_int(MPX .. "ARCHENEMY_KILLS", 500)
			stats.set_int(MPX .. "KILLS_COP", 4500)
			stats.set_int(MPX .. "KILLS_SWAT", 500)
			stats.set_int(MPX .. "STARS_ATTAINED", 5000)
			stats.set_int(MPX .. "STARS_EVADED", 4000)
			stats.set_int(MPX .. "VEHEXPORTED", 500)
			stats.set_int(MPX .. "TOTAL_NO_SHOPS_HELD_UP", 100)
			stats.set_int(MPX .. "CR_GANGATTACK_CITY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_COUNTRY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_LOST", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_VAGOS", 1000)
			stats.set_int(MPX .. "NO_NON_CONTRACT_RACE_WIN", 500)
			stats.set_int(MPX .. "DIED_IN_DROWNING", 833)
			stats.set_int(MPX .. "DIED_IN_DROWNINGINVEHICLE", 833)
			stats.set_int(MPX .. "DIED_IN_EXPLOSION", 833)
			stats.set_int(MPX .. "DIED_IN_FALL", 833)
			stats.set_int(MPX .. "DIED_IN_FIRE", 833)
			stats.set_int(MPX .. "DIED_IN_ROAD", 833)
			stats.set_int(MPX .. "GRENADE_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "MICROSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "SMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CRBNRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ADVRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CMBTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "RPG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PISTOL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PLAYER_HEADSHOTS", 500)
			stats.set_int(MPX .. "SAWNOFF_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "STKYBMB_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "UNARMED_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "SNIPERRFL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_50_VEHICLES_BLOWNUP", 500)
			stats.set_int(MPX .. "CARS_EXPLODED", 500)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_FMDRIVEWITHOUTCRASH", 30)
			stats.set_int(MPX .. "AWD_PASSENGERTIME", 4)
			stats.set_int(MPX .. "AWD_TIME_IN_HELICOPTER", 4)
			stats.set_int(MPX .. "AWD_VEHICLE_JUMP_OVER_40M", 25)
			stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_2_UNLCK", -1)
			stats.set_int(MPX .. "NO_CARS_REPAIR", 1000)
			stats.set_int(MPX .. "VEHICLES_SPRAYED", 500)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS_NOCRASH", 500)
			stats.set_int(MPX .. "USJS_FOUND", 50)
			stats.set_int(MPX .. "USJS_COMPLETED", 50)
			stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 50)
			stats.set_int(MPX .. "CRDEADLINE", 5)
			stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 2069146067)
			stats.set_int(MPX .. "LONGEST_WHEELIE_DIST", 1000)
			stats.set_int(MPX .. "RACES_WON", 50)
			stats.set_int(MPX .. "COUNT_HOTRING_RACE", 20)
			stats.set_bool(MPX .. "AWD_FMFURTHESTWHEELIE", true)
			stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", true)
			stats.set_int(MPX .. "AWD_100_HEADSHOTS", 500)
			stats.set_int(MPX .. "AWD_FMOVERALLKILLS", 1000)
			stats.set_int(MPX .. "AWD_FMKILLBOUNTY", 25)
			stats.set_int(MPX .. "AWD_FM_DM_3KILLSAMEGUY", 50)
			stats.set_int(MPX .. "AWD_FM_DM_KILLSTREAK", 100)
			stats.set_int(MPX .. "AWD_FM_DM_STOLENKILL", 50)
			stats.set_int(MPX .. "AWD_FM_DM_TOTALKILLS", 500)
			stats.set_bool(MPX .. "AWD_FMKILLSTREAKSDM", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSGANGHIDE", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSSURVIVE", true)
			stats.set_int(MPX .. "AWD_FMREVENGEKILLSDM", 50)
			stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
			stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
			stats.set_int(MPX .. "AWD_KILL_PSYCHOPATHS", 100)
			stats.set_int(MPX .. "AWD_TAKEDOWNSMUGPLANE", 50)
			stats.set_int(MPX .. "AWD_100_KILLS_PISTOL", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SMG", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SHOTGUN", 500)
			stats.set_int(MPX .. "ASLTRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SNIPER", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_25_KILLS_STICKYBOMBS", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_GRENADES", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_ROCKETLAUNCH", 50)
			stats.set_int(MPX .. "AWD_20_KILLS_MELEE", 50)
			stats.set_int(MPX .. "AWD_CAR_BOMBS_ENEMY_KILLS", 25)
			stats.set_int(MPX .. "MELEEKILLS", 700)
			stats.set_int(MPX .. "HITS", 10000)
			stats.set_int(MPX .. "DEATHS", 499)
			stats.set_int(MPX .. "HIGHEST_SKITTLES", 900)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS", 1000)
			stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
			stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
			stats.set_int(MPX .. "AWD_COMPLETE_HEIST_NOT_DIE", -1)
			stats.set_bool(MPX .. "AWD_FINISH_HEIST_NO_DAMAGE", true)
			stats.set_int(MPX .. "AWD_WIN_GOLD_MEDAL_HEISTS", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_MEMBER", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_THE_LEADER", 25)
			stats.set_bool(MPX .. "AWD_SPLIT_HEIST_TAKE_EVENLY", true)
			stats.set_bool(MPX .. "AWD_ACTIVATE_2_PERSON_KEY", true)
			stats.set_int(MPX .. "AWD_CONTROL_CROWDS", 25)
			stats.set_bool(MPX .. "AWD_ALL_ROLES_HEIST", true)
			stats.set_int(MPX .. "HEIST_COMPLETION", 25)
			stats.set_int(MPX .. "HEISTS_ORGANISED", -1)
			stats.set_int(MPX .. "HEIST_START", -1)
			stats.set_int(MPX .. "HEIST_END", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_PRISON", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_HUMANE", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_NARC", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_ORNATE", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_1", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_2", -1)
			stats.set_int(MPX .. "CR_FLEECA_FINALE", -1)
			stats.set_int(MPX .. "CR_PRISON_PLANE", -1)
			stats.set_int(MPX .. "CR_PRISON_BUS", -1)
			stats.set_int(MPX .. "CR_PRISON_STATION", -1)
			stats.set_int(MPX .. "CR_PRISON_UNFINISHED_BIZ", -1)
			stats.set_int(MPX .. "CR_PRISON_FINALE", -1)
			stats.set_int(MPX .. "CR_HUMANE_KEY_CODES", -1)
			stats.set_int(MPX .. "CR_HUMANE_ARMORDILLOS", -1)
			stats.set_int(MPX .. "CR_HUMANE_EMP", -1)
			stats.set_int(MPX .. "CR_HUMANE_VALKYRIE", -1)
			stats.set_int(MPX .. "CR_HUMANE_FINALE", -1)
			stats.set_int(MPX .. "CR_NARC_COKE", -1)
			stats.set_int(MPX .. "CR_NARC_TRASH_TRUCK", -1)
			stats.set_int(MPX .. "CR_NARC_BIKERS", -1)
			stats.set_int(MPX .. "CR_NARC_WEED", -1)
			stats.set_int(MPX .. "CR_NARC_STEAL_METH", -1)
			stats.set_int(MPX .. "CR_NARC_FINALE", -1)
			stats.set_int(MPX .. "CR_PACIFIC_TRUCKS", -1)
			stats.set_int(MPX .. "CR_PACIFIC_WITSEC", -1)
			stats.set_int(MPX .. "CR_PACIFIC_HACK", -1)
			stats.set_int(MPX .. "CR_PACIFIC_BIKES", -1)
			stats.set_int(MPX .. "CR_PACIFIC_CONVOY", -1)
			stats.set_int(MPX .. "CR_PACIFIC_FINALE", -1)
			stats.set_int(MPX .. "HEIST_ACH_TRACKER", -1)
			stats.set_int(MPX .. "WIN_GOLD_MEDAL_HEISTS", 25)
			stats.set_bool(MPX .. "AWD_FLEECA_FIN", true)
			stats.set_bool(MPX .. "AWD_PRISON_FIN", true)
			stats.set_bool(MPX .. "AWD_HUMANE_FIN", true)
			stats.set_bool(MPX .. "AWD_SERIESA_FIN", true)
			stats.set_bool(MPX .. "AWD_PACIFIC_FIN", true)
			stats.set_bool(MPX .. "AWD_HST_ORDER", true)
			stats.set_bool(MPX .. "AWD_COMPLET_HEIST_MEM", true)
			stats.set_bool(MPX .. "AWD_COMPLET_HEIST_1STPER", true)
			stats.set_bool(MPX .. "AWD_HST_SAME_TEAM", true)
			stats.set_bool(MPX .. "AWD_HST_ULT_CHAL", true)
			stats.set_bool(MPX .. "AWD_MATCHING_OUTFIT_HEIST", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_PRINT", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_1", true)
			stats.set_bool(MPX .. "HEIST_PRE_PLAN_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_FINALE", true)
			stats.set_bool(MPX .. "HEIST_IS_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_STRAND_INTRO_DONE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_ORNATE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_PRISON", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_BIOLAB", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_NARCOTIC", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_AWARD_DONE_PREP", true)
			stats.set_bool(MPX .. "HEIST_AWARD_BOUGHT_IN", true)
			stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -1)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -229384)
			stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1)
			stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", -1)
			stats.set_int(MPX .. "GANGOPS_ALLINORDER", 100)
			stats.set_int(MPX .. "GANGOPS_LOYALTY", 100)
			stats.set_int(MPX .. "GANGOPS_CRIMMASMD", 100)
			stats.set_int(MPX .. "GANGOPS_LOYALTY2", 100)
			stats.set_int(MPX .. "GANGOPS_LOYALTY3", 100)
			stats.set_int(MPX .. "GANGOPS_CRIMMASMD2", 100)
			stats.set_int(MPX .. "GANGOPS_CRIMMASMD3", 100)
			stats.set_int(MPX .. "GANGOPS_SUPPORT", 100)
			stats.set_int(MPX .. "CR_GANGOP_MORGUE", 10)
			stats.set_int(MPX .. "CR_GANGOP_DELUXO", 10)
			stats.set_int(MPX .. "CR_GANGOP_SERVERFARM", 10)
			stats.set_int(MPX .. "CR_GANGOP_IAABASE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALOSPREY", 10)
			stats.set_int(MPX .. "CR_GANGOP_FOUNDRY", 10)
			stats.set_int(MPX .. "CR_GANGOP_RIOTVAN", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINECAR", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_PREDATOR", 10)
			stats.set_int(MPX .. "CR_GANGOP_BMLAUNCHER", 10)
			stats.set_int(MPX .. "CR_GANGOP_BCCUSTOM", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALTHTANKS", 10)
			stats.set_int(MPX .. "CR_GANGOP_SPYPLANE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P2", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P3", 10)
			stats.set_bool(MPX .. "AWD_GANGOPS_IAA", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_SUBMARINE", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_MISSILE", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_ALLINORDER", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_LOYALTY", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_LOYALTY2", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_LOYALTY3", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_CRIMMASMD", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_CRIMMASMD2", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_CRIMMASMD3", true)
			stats.set_bool(MPX .. "AWD_GANGOPS_SUPPORT", true)
		        for j = 0, 63 do stats.set_bool_masked(MPX .. "GANGOPSPSTAT_BOOL0", true, j, MPX) end
			stats.set_masked_int(MPX .. "DLCSMUGCHARPSTAT_INT260", 3, 16, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 24, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 32, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 40, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 48, 8)
			stats.set_int(MPX .. "AWD_DANCE_TO_SOLOMUN", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_TALEOFUS", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_DIXON", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_BLKMAD", 120)
			stats.set_int(MPX .. "AWD_CLUB_DRUNK", 200)
			stats.set_int(MPX .. "NIGHTCLUB_VIP_APPEAR", 700)
			stats.set_int(MPX .. "NIGHTCLUB_JOBS_DONE", 700)
			stats.set_int(MPX .. "NIGHTCLUB_EARNINGS", 5721002)
			stats.set_int(MPX .. "HUB_SALES_COMPLETED", 1001)
			stats.set_int(MPX .. "HUB_EARNINGS", 20721002)
			stats.set_int(MPX .. "DANCE_COMBO_DURATION_MINS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_PLAYER_APPEAR", 100)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_SOLD", 784672)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_MADE", 507822)
			stats.set_int(MPX .. "DANCEPERFECTOWNCLUB", 120)
			stats.set_int(MPX .. "NUMUNIQUEPLYSINCLUB", 120)
			stats.set_int(MPX .. "DANCETODIFFDJS", 4)
			stats.set_int(MPX .. "NIGHTCLUB_HOTSPOT_TIME_MS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_TOTAL", 20)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_MISSION", -1)
			stats.set_int(MPX .. "CLUB_CONTRABAND_MISSION", 1000)
			stats.set_int(MPX .. "HUB_CONTRABAND_MISSION", 1000)
			stats.set_bool(MPX .. "AWD_CLUB_HOTSPOT", true)
			stats.set_bool(MPX .. "AWD_CLUB_CLUBBER", true)
			stats.set_bool(MPX .. "AWD_CLUB_COORD", true)
		        for j = 0, 63 do stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL0", true, j, MPX) stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL1", true, j, MPX) end
		        if (stats.get_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 0, 8) <20) then stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 20, 0, 8) end
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 100, 16, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 20, 24, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 80, 32, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 60, 40, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 40, 48, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 10, 56, 8)
			stats.set_int(MPX .. "ARN_BS_TRINKET_TICKERS", -1)
			stats.set_int(MPX .. "ARN_BS_TRINKET_SAVED", -1)
			stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 50)
			stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 50)
			stats.set_int(MPX .. "AWD_READY_FOR_WAR", 50)
			stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 50)
			stats.set_int(MPX .. "AWD_SPINNER", 50)
			stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 50)
			stats.set_int(MPX .. "AWD_MASTER_BANDITO", 50)
			stats.set_int(MPX .. "AWD_SITTING_DUCK", 50)
			stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 50)
			stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 50)
			stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 50)
			stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 200)
			stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 50)
			stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 1000000)
			stats.set_int(MPX .. "AWD_TIME_SERVED", 1000)
			stats.set_int(MPX .. "AWD_TOP_SCORE", 55000)
			stats.set_int(MPX .. "AWD_CAREER_WINNER", 1000)
			stats.set_int(MPX .. "ARENAWARS_SP", 0)
			stats.set_int(MPX .. "ARENAWARS_SKILL_LEVEL", 20)
			stats.set_int(MPX .. "ARENAWARS_SP_LIFETIME", 100)
			stats.set_int(MPX .. "ARENAWARS_AP", 0)
			stats.set_int(MPX .. "ARENAWARS_AP_TIER", 1000)
			stats.set_int(MPX .. "ARENAWARS_AP_LIFETIME", 5055000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_UNLK", -1)
			stats.set_int(MPX .. "ARN_W_THEME_SCIFI", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_APOC", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_CONS", 1000)
			stats.set_int(MPX .. "ARN_W_PASS_THE_BOMB", 1000)
			stats.set_int(MPX .. "ARN_W_DETONATION", 1000)
			stats.set_int(MPX .. "ARN_W_ARCADE_RACE", 1000)
			stats.set_int(MPX .. "ARN_W_CTF", 1000)
			stats.set_int(MPX .. "ARN_W_TAG_TEAM", 1000)
			stats.set_int(MPX .. "ARN_W_DESTR_DERBY", 1000)
			stats.set_int(MPX .. "ARN_W_CARNAGE", 1000)
			stats.set_int(MPX .. "ARN_W_MONSTER_JAM", 1000)
			stats.set_int(MPX .. "ARN_W_GAMES_MASTERS", 1000)
			stats.set_int(MPX .. "ARN_L_PASS_THE_BOMB", 500)
			stats.set_int(MPX .. "ARN_L_DETONATION", 500)
			stats.set_int(MPX .. "ARN_L_ARCADE_RACE", 500)
			stats.set_int(MPX .. "ARN_L_CTF", 500)
			stats.set_int(MPX .. "ARN_L_TAG_TEAM", 500)
			stats.set_int(MPX .. "ARN_L_DESTR_DERBY", 500)
			stats.set_int(MPX .. "ARN_L_CARNAGE", 500)
			stats.set_int(MPX .. "ARN_L_MONSTER_JAM", 500)
			stats.set_int(MPX .. "ARN_L_GAMES_MASTERS", 500)
			stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 500)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINS", 1000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINT", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYD", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYDT", 1000)
			stats.set_int(MPX .. "ARN_SPEC_BOX_TIME_MS", 86400000)
			stats.set_int(MPX .. "ARN_SPECTATOR_DRONE", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_CAMS", 1000)
			stats.set_int(MPX .. "ARN_SMOKE", 1000)
			stats.set_int(MPX .. "ARN_DRINK", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN4", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN5", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN6", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB2", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB3", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR4", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR5", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR6", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI5", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI", 61000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR3", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR380", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3802", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3803", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE2", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE3", 1000)
			stats.set_bool(MPX .. "AWD_BEGINNER", true)
			stats.set_bool(MPX .. "AWD_FIELD_FILLER", true)
			stats.set_bool(MPX .. "AWD_ARMCHAIR_RACER", true)
			stats.set_bool(MPX .. "AWD_LEARNER", true)
			stats.set_bool(MPX .. "AWD_SUNDAY_DRIVER", true)
			stats.set_bool(MPX .. "AWD_THE_ROOKIE", true)
			stats.set_bool(MPX .. "AWD_BUMP_AND_RUN", true)
			stats.set_bool(MPX .. "AWD_GEAR_HEAD", true)
			stats.set_bool(MPX .. "AWD_DOOR_SLAMMER", true)
			stats.set_bool(MPX .. "AWD_HOT_LAP", true)
			stats.set_bool(MPX .. "AWD_ARENA_AMATEUR", true)
			stats.set_bool(MPX .. "AWD_PAINT_TRADER", true)
			stats.set_bool(MPX .. "AWD_SHUNTER", true)
			stats.set_bool(MPX .. "AWD_JOCK", true)
			stats.set_bool(MPX .. "AWD_WARRIOR", true)
			stats.set_bool(MPX .. "AWD_T_BONE", true)
			stats.set_bool(MPX .. "AWD_MAYHEM", true)
			stats.set_bool(MPX .. "AWD_WRECKER", true)
			stats.set_bool(MPX .. "AWD_CRASH_COURSE", true)
			stats.set_bool(MPX .. "AWD_ARENA_LEGEND", true)
			stats.set_bool(MPX .. "AWD_PEGASUS", true)
			stats.set_bool(MPX .. "AWD_UNSTOPPABLE", true)
			stats.set_bool(MPX .. "AWD_CONTACT_SPORT", true)
			stats.set_masked_int(MPX .. "ARENAWARSPSTAT_INT", 1, 35, 8)
		        for i = 0, 8 do for j = 0, 63 do stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL"..i, true, j, MPX) end end
			stats.set_int(MPX .. "AWD_ODD_JOBS", 50)
			stats.set_int(MPX .. "VCM_FLOW_PROGRESS", -1)
			stats.set_int(MPX .. "VCM_STORY_PROGRESS", 5)
			stats.set_bool(MPX .. "AWD_FIRST_TIME1", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME2", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME3", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME4", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME5", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME6", true)
			stats.set_bool(MPX .. "AWD_ALL_IN_ORDER", true)
			stats.set_bool(MPX .. "AWD_SUPPORTING_ROLE", true)
			stats.set_bool(MPX .. "AWD_LEADER", true)
			stats.set_bool(MPX .. "AWD_SURVIVALIST", true)
			Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD") if Paragon == true then stats.set_bool(MPX .. "CAS_VEHICLE_REWARD",true) else stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false) end
		        for i = 0, 6 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL"..i, true, j, MPX) end end
			stats.set_int(MPX .. "CAS_HEIST_NOTS", -1)
			stats.set_int(MPX .. "CAS_HEIST_FLOW", -1)
			stats.set_int(MPX .. "SIGNAL_JAMMERS_COLLECTED", 50)
			stats.set_int(MPX .. "AWD_PREPARATION", 40)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE0", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE1", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE2", -1)
			stats.set_int(MPX .. "H3_VEHICLESUSED", -1)
			stats.set_int(MPX .. "H3_CR_STEALTH_1A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2B_RAPP", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2C_SIDE", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_3A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_4A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_5A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_1A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_4A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_5A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_1A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A1", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A2", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2BP", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2C", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_3A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_4A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_5A", 100)
			stats.set_int(MPX .. "CR_ORDER", 100)
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAPE", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_RSC_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_BWL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_MTG_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_OIL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_DEF_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_FIN_SEEN", true)
			stats.set_bool(MPX .. "HELP_FURIA", true)
			stats.set_bool(MPX .. "HELP_MINITAN", true)
			stats.set_bool(MPX .. "HELP_YOSEMITE2", true)
			stats.set_bool(MPX .. "HELP_ZHABA", true)
			stats.set_bool(MPX .. "HELP_IMORGEN", true)
			stats.set_bool(MPX .. "HELP_SULTAN2", true)
			stats.set_bool(MPX .. "HELP_VAGRANT", true)
			stats.set_bool(MPX .. "HELP_VSTR", true)
			stats.set_bool(MPX .. "HELP_STRYDER", true)
			stats.set_bool(MPX .. "HELP_SUGOI", true)
			stats.set_bool(MPX .. "HELP_KANJO", true)
			stats.set_bool(MPX .. "HELP_FORMULA", true)
			stats.set_bool(MPX .. "HELP_FORMULA2", true)
			stats.set_bool(MPX .. "HELP_JB7002", true)
		        for i = 0, 4 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL"..i, true, j, MPX) end end
			stats.set_int(MPX .. "AWD_PREPARATION", 50)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 50)
			stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", -1)
			stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", -1)
			stats.set_int(MPX .. "IAP_MAX_MOON_DIST", 2147483647)
			stats.set_int(MPX .. "SCGW_INITIALS_0", 69644)
			stats.set_int(MPX .. "SCGW_INITIALS_1", 50333)
			stats.set_int(MPX .. "SCGW_INITIALS_2", 63512)
			stats.set_int(MPX .. "SCGW_INITIALS_3", 46136)
			stats.set_int(MPX .. "SCGW_INITIALS_4", 21638)
			stats.set_int(MPX .. "SCGW_INITIALS_5", 2133)
			stats.set_int(MPX .. "SCGW_INITIALS_6", 1215)
			stats.set_int(MPX .. "SCGW_INITIALS_7", 2444)
			stats.set_int(MPX .. "SCGW_INITIALS_8", 38023)
			stats.set_int(MPX .. "SCGW_INITIALS_9", 2233)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_0",0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_1", 64)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_2", 8457)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_3", 91275)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_4", 53260)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_5", 78663)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_6", 25103)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_7", 102401)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_8", 12672)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_9", 74380)
			stats.set_int(MPX .. "FOOTAGE_SCORE_0", 284544)
			stats.set_int(MPX .. "FOOTAGE_SCORE_1", 275758)
			stats.set_int(MPX .. "FOOTAGE_SCORE_2", 100000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_3", 90000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_4", 80000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_5", 70000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_6", 60000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_7", 50000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_8", 40000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_9", 30000)
		        for i = 0, 9 do stats.set_int(MPX .. "IAP_INITIALS_"..i, 50) 
			stats.set_int(MPX .. "IAP_SCORE_"..i, 50) 
			stats.set_int(MPX .. "IAP_SCORE_"..i, 50) 
			stats.set_int(MPX .. "SCGW_SCORE_"..i, 50) 
			stats.set_int(MPX .. "DG_DEFENDER_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "DG_DEFENDER_SCORE_"..i, 50) 
			stats.set_int(MPX .. "DG_MONKEY_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "DG_MONKEY_SCORE_"..i, 50) 
			stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "DG_PENETRATOR_SCORE_"..i, 50) 
			stats.set_int(MPX .. "GGSM_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "GGSM_SCORE_"..i, 50) 
			stats.set_int(MPX .. "TWR_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "TWR_SCORE_"..i, 50) end 
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAP", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_0", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_1", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_2", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_3", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_4", true)
			stats.set_bool(MPX .. "IAP_GOLD_TANK", true)
			stats.set_bool(MPX .. "SCGW_WON_NO_DEATHS", true)
		        for j = 290449, 290468 do globals.set_int(j, 1) end 
		        for i = 0, 4 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL"..i, true, j, MPX) end end 
		        for i = 0, 6 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL"..i, true, j, MPX) end end
			stats.set_bool(MPX .. "AWD_KINGOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_QUBISM", true)
			stats.set_bool(MPX .. "AWD_QUIBITS", true)
			stats.set_bool(MPX .. "AWD_GODOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "AWD_GOFOR11TH", true)
			stats.set_masked_int(MPX .. "SU20PSTAT_INT", 1, 35, 8)
		        for i = 0, 1 do for j = 0, 63 do stats.set_bool_masked(MPX .. "SU20PSTAT_BOOL"..i, true, j, MPX) stats.set_bool_masked(MPX .. "SU20TATTOOSTAT_BOOL"..i, true, j, MPX) end end
			stats.set_bool(MPX .. "AWD_INTELGATHER", true)
			stats.set_bool(MPX .. "AWD_COMPOUNDINFILT", true)
			stats.set_bool(MPX .. "AWD_LOOT_FINDER", true)
			stats.set_bool(MPX .. "AWD_MAX_DISRUPT", true)
			stats.set_bool(MPX .. "AWD_THE_ISLAND_HEIST", true)
			stats.set_bool(MPX .. "AWD_GOING_ALONE", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_PRO_THIEF", true)
			stats.set_bool(MPX .. "AWD_CAT_BURGLAR", true)
			stats.set_bool(MPX .. "AWD_ONE_OF_THEM", true)
			stats.set_bool(MPX .. "AWD_GOLDEN_GUN", true)
			stats.set_bool(MPX .. "AWD_ELITE_THIEF", true)
			stats.set_bool(MPX .. "AWD_PROFESSIONAL", true)
			stats.set_bool(MPX .. "AWD_HELPING_OUT", true)
			stats.set_bool(MPX .. "AWD_COURIER", true)
			stats.set_bool(MPX .. "AWD_PARTY_VIBES", true)
			stats.set_bool(MPX .. "AWD_HELPING_HAND", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_VETIR", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_LONGFIN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ANNIH", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ALKONOS", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_PATROLB", true)
			stats.set_int(MPX .. "AWD_LOSTANDFOUND", 500000)
			stats.set_int(MPX .. "AWD_SUNSET", 1800000)
			stats.set_int(MPX .. "AWD_TREASURE_HUNTER", 1000000)
			stats.set_int(MPX .. "AWD_WRECK_DIVING", 1000000)
			stats.set_int(MPX .. "AWD_KEINEMUSIK", 1800000)
			stats.set_int(MPX .. "AWD_PALMS_TRAX", 1800000)
			stats.set_int(MPX .. "AWD_MOODYMANN", 1800000)
			stats.set_int(MPX .. "AWD_FILL_YOUR_BAGS", 1000000000)
			stats.set_int(MPX .. "AWD_WELL_PREPARED", 80)
			stats.set_int(MPX .. "H4_H4_DJ_MISSIONS", -1)
			stats.set_int(MPX .. "H4CNF_APPROACH", -1)
			stats.set_int(MPX .. "H4_MISSIONS", -1)
			stats.set_int(MPX .. "H4_PLAYTHROUGH_STATUS", 100)
		        for i = 0, 2 do for j = 0, 63 do stats.set_bool_masked(MPX .. "HISLANDPSTAT_BOOL"..i, true, j, MPX) end end
			stats.set_int(MPX .. "AWD_CAR_CLUB_MEM", 100)
			stats.set_int(MPX .. "AWD_SPRINTRACER", 50)
			stats.set_int(MPX .. "AWD_STREETRACER", 50)
			stats.set_int(MPX .. "AWD_PURSUITRACER", 50)
			stats.set_int(MPX .. "AWD_TEST_CAR", 240)
			stats.set_int(MPX .. "AWD_AUTO_SHOP", 50)	
			stats.set_int(MPX .. "AWD_GROUNDWORK", 40)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_ROBBERY_CONTRACT", 100)
			stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 100)
			stats.set_bool(MPX .. "AWD_CAR_CLUB", true)
			stats.set_bool(MPX .. "AWD_PRO_CAR_EXPORT", true)
			stats.set_bool(MPX .. "AWD_UNION_DEPOSITORY", true)
			stats.set_bool(MPX .. "AWD_MILITARY_CONVOY", true)
			stats.set_bool(MPX .. "AWD_FLEECA_BANK", true)
			stats.set_bool(MPX .. "AWD_FREIGHT_TRAIN", true)
			stats.set_bool(MPX .. "AWD_BOLINGBROKE_ASS", true)
			stats.set_bool(MPX .. "AWD_IAA_RAID", true)
			stats.set_bool(MPX .. "AWD_METH_JOB", true)
			stats.set_bool(MPX .. "AWD_BUNKER_RAID", true)
			stats.set_bool(MPX .. "AWD_STRAIGHT_TO_VIDEO", true)
			stats.set_bool(MPX .. "AWD_MONKEY_C_MONKEY_DO", true)
			stats.set_bool(MPX .. "AWD_TRAINED_TO_KILL", true)
			stats.set_bool(MPX .. "AWD_DIRECTOR", true)
		        for i = 0, 8 do for j = 0, 63 do stats.set_bool_masked(MPX .. "TUNERPSTAT_BOOL"..i, true, j, MPX) end end
			stats.set_int(MPX .. "AWD_CONTRACTOR", 50)
			stats.set_int(MPX .. "AWD_COLD_CALLER", 50)
			stats.set_int(MPX .. "AWD_PRODUCER", 60)
			stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", -1)
			stats.set_int(MPX .. "FIXER_GENERAL_BS", -1)
			stats.set_int(MPX .. "FIXER_COMPLETED_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_STRAND", -1)
			stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", -1)
			stats.set_int(MPX .. "FIXER_COUNT", 510)
			stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", 85)
			stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", 85)
			stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", 85)
			stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", 85)
			stats.set_int(MPX .. "FIXER_EARNINGS", 19734860)
			stats.set_bool(MPX .. "AWD_TEEING_OFF", true)
			stats.set_bool(MPX .. "AWD_PARTY_NIGHT", true)
			stats.set_bool(MPX .. "AWD_BILLIONAIRE_GAMES", true)
			stats.set_bool(MPX .. "AWD_HOOD_PASS", true)
			stats.set_bool(MPX .. "AWD_STUDIO_TOUR", true)
			stats.set_bool(MPX .. "AWD_DONT_MESS_DRE", true)
			stats.set_bool(MPX .. "AWD_BACKUP", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_1", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_2", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_3", true)
			stats.set_bool(MPX .. "AWD_CONTR_KILLER", true)
			stats.set_bool(MPX .. "AWD_DOGS_BEST_FRIEND", true)
			stats.set_bool(MPX .. "AWD_MUSIC_STUDIO", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_1", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_2", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_3", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_0", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_1", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_SETUP", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_STRAND", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_F", true)
		        for j = 0, 63 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL0", true, j, MPX)
                        stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, j, MPX)
                        stats.set_bool_masked(MPX .. "FIXERTATTOOSTAT_BOOL0", true, j, MPX)
                        end end)
	
	AMMenu = AMenu:add_submenu("Unlock One By One")

	AMMenu:add_action("Victory", function() 
			stats.set_int(MPX .. "AWD_FM_DM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_WINS", 50)
			stats.set_int(MPX .. "AWD_FM_TDM_MVP", 50)
			stats.set_int(MPX .. "AWD_RACES_WON", 50)
			stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
			stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
			stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 50)
			stats.set_bool(MPX .. "AWD_FMKILL3ANDWINGTARACE", true)
			stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
			stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
			stats.set_bool(MPX .. "AWD_FMWINCUSTOMRACE", true)
			stats.set_int(MPX .. "AWD_FMWINRACETOPOINTS", 25)
			stats.set_bool(MPX .. "CL_RACE_MODDED_CAR", true)
			stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 25)
			stats.set_bool(MPX .. "AWD_FMRACEWORLDRECHOLDER", true)
			stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
			stats.set_bool(MPX .. "AWD_FMWINALLRACEMODES", true)
			stats.set_int(MPX .. "AWD_FMHORDWAVESSURVIVE", 10)
			stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
			stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
			stats.set_int(MPX .. "AWD_NO_ARMWRESTLING_WINS", 25)
			stats.set_int(MPX .. "MOST_ARM_WRESTLING_WINS", 25)
			stats.set_int(MPX .. "AWD_WIN_AT_DARTS", 25)
			stats.set_int(MPX .. "AWD_FM_GOLF_WON", 25)
			stats.set_int(MPX .. "AWD_FM_TENNIS_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_5_SET_WINS", true)
			stats.set_bool(MPX .. "AWD_FM_TENNIS_STASETWIN", true)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_CT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_RT_WON", 25)
			stats.set_int(MPX .. "AWD_FM_SHOOTRANG_TG_WON", 25)
			stats.set_bool(MPX .. "AWD_FM_SHOOTRANG_GRAN_WON", true)
			stats.set_bool(MPX .. "AWD_FMWINEVERYGAMEMODE", true)
			stats.set_int(MPX .. "AWD_WIN_CAPTURES", 50)
			stats.set_int(MPX .. "AWD_WIN_CAPTURE_DONT_DYING", 25)
			stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
			stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
			stats.set_int(MPX .. "AWD_KILL_TEAM_YOURSELF_LTS", 25)
			stats.set_int(MPX .. "AIR_LAUNCHES_OVER_40M", 25)
			stats.set_int(MPX .. "AWD_CARS_EXPORTED", 50)
			stats.set_int(MPX .. "AWD_LESTERDELIVERVEHICLES", 25)
			stats.set_int(MPX .. "TOTAL_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_RACES_LOST", 250)
			stats.set_int(MPX .. "TOTAL_CUSTOM_RACES_WON", 500)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_DEATHMATCH_WON", 500)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_LOST", 250)
			stats.set_int(MPX .. "TOTAL_TDEATHMATCH_WON", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_WINS", 500)
			stats.set_int(MPX .. "SHOOTINGRANGE_LOSSES", 250)
			stats.set_int(MPX .. "TENNIS_MATCHES_WON", 500)
			stats.set_int(MPX .. "TENNIS_MATCHES_LOST", 250)
			stats.set_int(MPX .. "GOLF_WINS", 500)
			stats.set_int(MPX .. "GOLF_LOSSES", 250)
			stats.set_int(MPX .. "DARTS_TOTAL_WINS", 500)
			stats.set_int(MPX .. "DARTS_TOTAL_MATCHES", 750)
			stats.set_int(MPX .. "SHOOTINGRANGE_TOTAL_MATCH", 800)
			stats.set_int(MPX .. "BJ_WINS", 500)
			stats.set_int(MPX .. "BJ_LOST", 250)
			stats.set_int(MPX .. "RACE_2_POINT_WINS", 500)
			stats.set_int(MPX .. "RACE_2_POINT_LOST", 250)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "MISSIONS_CREATED", 500)
			stats.set_int(MPX .. "LTS_CREATED", 500)
			stats.set_int(MPX .. "FM_MISSION_LIKES", 1500) end)
	
	AMMenu:add_action("General", function()
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTDM", true)
			stats.set_int(MPX .. "CR_DIFFERENT_DM", 25)
			stats.set_bool(MPX .. "AWD_FM25DIFFERENTRACES", true)
			stats.set_int(MPX .. "CR_DIFFERENT_RACES", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_20M", 25)
			stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_50M", 25)
			stats.set_int(MPX .. "AWD_FMBASEJMP", 25)
			stats.set_bool(MPX .. "AWD_FMATTGANGHQ", true)
			stats.set_bool(MPX .. "AWD_FM6DARTCHKOUT", true)
			stats.set_int(MPX .. "AWD_FM_GOLF_BIRDIES", 25)
			stats.set_bool(MPX .. "AWD_FM_GOLF_HOLE_IN_1", true)
			stats.set_int(MPX .. "AWD_FM_TENNIS_ACE", 25)
			stats.set_int(MPX .. "AWD_FMBBETWIN", 50000)
			stats.set_int(MPX .. "AWD_LAPDANCES", 25)
			stats.set_int(MPX .. "AWD_FMCRATEDROPS", 25)
			stats.set_bool(MPX .. "AWD_FMPICKUPDLCCRATE1ST", true)
			stats.set_bool(MPX .. "AWD_FM25DIFITEMSCLOTHES", true)
			stats.set_int(MPX .. "AWD_NO_HAIRCUTS", 25)
			stats.set_bool(MPX .. "AWD_BUY_EVERY_GUN", true)
			stats.set_bool(MPX .. "AWD_DRIVELESTERCAR5MINS", true)
			stats.set_bool(MPX .. "AWD_FMTATTOOALLBODYPARTS", true)
			stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_PICKUP_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_MENTALSTATE_TO_NORMAL", 50)
			stats.set_bool(MPX .. "AWD_STORE_20_CAR_IN_GARAGES", true)
			stats.set_int(MPX .. "AWD_TRADE_IN_YOUR_PROPERTY", 25)
			stats.set_bool(MPX .. "AWD_DAILYOBJWEEKBONUS", true)
			stats.set_bool(MPX .. "AWD_DAILYOBJMONTHBONUS", true)
			stats.set_int(MPX .. "AWD_FM_CR_DM_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_RACES_MADE", 25)
			stats.set_int(MPX .. "AWD_FM_CR_PLAYED_BY_PEEP", 1598)
			stats.set_int(MPX .. "AWD_FM_CR_MISSION_SCORE", 100)
			stats.set_bool(MPX .. "CL_DRIVE_RALLY", true)
			stats.set_bool(MPX .. "CL_PLAY_GTA_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_BOAT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_FOOT_RACE", true)
			stats.set_bool(MPX .. "CL_PLAY_TEAM_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_VEHICLE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_MISSION_CONTACT", true)
			stats.set_bool(MPX .. "CL_PLAY_A_PLAYLIST", true)
			stats.set_bool(MPX .. "CL_PLAY_POINT_TO_POINT", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_DM", true)
			stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_RACE", true)
			stats.set_bool(MPX .. "CL_SURV_A_BOUNTY", true)
			stats.set_bool(MPX .. "CL_SET_WANTED_LVL_ON_PLAY", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_GANGS", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_LOST", true)
			stats.set_bool(MPX .. "CL_GANG_BACKUP_VAGOS", true)
			stats.set_bool(MPX .. "CL_CALL_MERCENARIES", true)
			stats.set_bool(MPX .. "CL_PHONE_MECH_DROP_CAR", true)
			stats.set_bool(MPX .. "CL_GONE_OFF_RADAR", true)
			stats.set_bool(MPX .. "CL_FILL_TITAN", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", true)
			stats.set_bool(MPX .. "CL_BUY_INSURANCE", true)
			stats.set_bool(MPX .. "CL_BUY_GARAGE", true)
			stats.set_bool(MPX .. "CL_ENTER_FRIENDS_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_STRIPPER_HOUSE", true)
			stats.set_bool(MPX .. "CL_CALL_FRIEND", true)
			stats.set_bool(MPX .. "CL_SEND_FRIEND_REQUEST", true)
			stats.set_bool(MPX .. "CL_W_WANTED_PLAYER_TV", true)
			stats.set_bool(MPX .. "FM_INTRO_CUT_DONE", true)
			stats.set_bool(MPX .. "FM_INTRO_MISS_DONE", true)
			stats.set_bool(MPX .. "SHOOTINGRANGE_SEEN_TUT", true)
			stats.set_bool(MPX .. "TENNIS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "DARTS_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "ARMWRESTLING_SEEN_TUTORIAL", true)
			stats.set_bool(MPX .. "HAS_WATCHED_BENNY_CUTSCE", true)
			stats.set_int(MPX .. "NO_PHOTOS_TAKEN", 100)
			stats.set_int(MPX .. "BOUNTSONU", 200)
			stats.set_int(MPX .. "BOUNTPLACED", 500)
			stats.set_int(MPX .. "BETAMOUNT", 500)
			stats.set_int(MPX .. "CRARMWREST", 500)
			stats.set_int(MPX .. "CRBASEJUMP", 500)
			stats.set_int(MPX .. "CRDARTS", 500)
			stats.set_int(MPX .. "CRDM", 500)
			stats.set_int(MPX .. "CRGANGHIDE", 500)
			stats.set_int(MPX .. "CRGOLF", 500)
			stats.set_int(MPX .. "CRHORDE", 500)
			stats.set_int(MPX .. "CRMISSION", 500)
			stats.set_int(MPX .. "CRSHOOTRNG", 500)
			stats.set_int(MPX .. "CRTENNIS", 500)
			stats.set_int(MPX .. "NO_TIMES_CINEMA", 500) end)
	
	AMMenu:add_action("Weapons", function()
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_2_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_3_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_ADDON_4_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_FREE4", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED", -1)
			stats.set_int(MPX .. "CHAR_WEAP_PURCHASED2", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET", -1)
			stats.set_int(MPX .. "WEAPON_PICKUP_BITSET2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", -1)
			stats.set_int(MPX .. "NO_WEAPONS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_MODS_UNLOCK", -1)
			stats.set_int(MPX .. "NO_WEAPON_CLR_MOD_UNLOCK", -1) 
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED3", -1)
			stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED4", -1)
			stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_4_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_10_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE3", -1)
			stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE4", -1)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_WHITE", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_RED", 1000)
			stats.set_int(MPX .. "FIREWORK_TYPE_4_BLUE", 1000)
			stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", -1)
		        for i = 2, 19 do stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH"..i, -1) end
		        for j = 1, 19 do stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_"..j.."_UNLCK", -1) end
		        for m = 1, 41 do stats.set_int(MPX .. "CHAR_KIT_"..m.."_FM_UNLCK", -1) end
		        for l = 2, 41 do stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE"..l, -1) end end)
	
	AMMenu:add_action("Crimes", function()
			stats.set_int(MPX .. "AWD_FMTIME5STARWANTED", 120)
			stats.set_int(MPX .. "AWD_5STAR_WANTED_AVOIDANCE", 50)
			stats.set_int(MPX .. "AWD_FMSHOOTDOWNCOPHELI", 25)
			stats.set_int(MPX .. "AWD_VEHICLES_JACKEDR", 500)
			stats.set_int(MPX .. "AWD_SECURITY_CARS_ROBBED", 25)
			stats.set_int(MPX .. "AWD_HOLD_UP_SHOPS", 20)
			stats.set_int(MPX .. "AWD_ODISTRACTCOPSNOEATH", 25)
			stats.set_int(MPX .. "AWD_ENEMYDRIVEBYKILLS", 100)
			stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME5STAR", 18000000)
			stats.set_int(MPX .. "CARS_COPS_EXPLODED", 300)
			stats.set_int(MPX .. "BIKES_EXPLODED", 100)
			stats.set_int(MPX .. "BOATS_EXPLODED", 168)
			stats.set_int(MPX .. "HELIS_EXPLODED", 98)
			stats.set_int(MPX .. "PLANES_EXPLODED", 138)
			stats.set_int(MPX .. "QUADBIKE_EXPLODED", 50)
			stats.set_int(MPX .. "BICYCLE_EXPLODED", 48)
			stats.set_int(MPX .. "SUBMARINE_EXPLODED", 28)
			stats.set_int(MPX .. "TIRES_POPPED_BY_GUNSHOT", 500)
			stats.set_int(MPX .. "NUMBER_CRASHES_CARS", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_BIKES", 300)
			stats.set_int(MPX .. "BAILED_FROM_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_CRASHES_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 300)
			stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 300)
			stats.set_int(MPX .. "MC_CONTRIBUTION_POINTS", 1000)
			stats.set_int(MPX .. "MEMBERSMARKEDFORDEATH", 700)
			stats.set_int(MPX .. "MCKILLS", 500)
			stats.set_int(MPX .. "MCDEATHS", 700)
			stats.set_int(MPX .. "RIVALPRESIDENTKILLS", 700)
			stats.set_int(MPX .. "RIVALCEOANDVIPKILLS", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTSCOMPLETE", 700)
			stats.set_int(MPX .. "CLUBHOUSECONTRACTEARNINGS", 32698547)
			stats.set_int(MPX .. "CLUBCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "MEMBERCHALLENGESCOMPLETED", 700)
			stats.set_int(MPX .. "GHKILLS", 500)
			stats.set_int(MPX .. "HORDELVL", 10)
			stats.set_int(MPX .. "HORDKILLS", 500)
			stats.set_int(MPX .. "UNIQUECRATES", 500)
			stats.set_int(MPX .. "BJWINS", 500)
			stats.set_int(MPX .. "HORDEWINS", 500)
			stats.set_int(MPX .. "MCMWINS", 500)
			stats.set_int(MPX .. "GANGHIDWINS", 500)
			stats.set_int(MPX .. "KILLS", 800)
			stats.set_int(MPX .. "HITS_PEDS_VEHICLES", 100)
			stats.set_int(MPX .. "SHOTS", 1000)
			stats.set_int(MPX .. "HEADSHOTS", 100)
			stats.set_int(MPX .. "KILLS_ARMED", 650)
			stats.set_int(MPX .. "SUCCESSFUL_COUNTERS", 100)
			stats.set_int(MPX .. "KILLS_PLAYERS", 3593)
			stats.set_int(MPX .. "DEATHS_PLAYER", 1002)
			stats.set_int(MPX .. "KILLS_STEALTH", 100)
			stats.set_int(MPX .. "KILLS_INNOCENTS", 500)
			stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 500)
			stats.set_int(MPX .. "KILLS_BY_OTHERS", 100)
			stats.set_int(MPX .. "BIGGEST_VICTIM_KILLS", 500)
			stats.set_int(MPX .. "ARCHENEMY_KILLS", 500)
			stats.set_int(MPX .. "KILLS_COP", 4500)
			stats.set_int(MPX .. "KILLS_SWAT", 500)
			stats.set_int(MPX .. "STARS_ATTAINED", 5000)
			stats.set_int(MPX .. "STARS_EVADED", 4000)
			stats.set_int(MPX .. "VEHEXPORTED", 500)
			stats.set_int(MPX .. "TOTAL_NO_SHOPS_HELD_UP", 100)
			stats.set_int(MPX .. "CR_GANGATTACK_CITY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_COUNTRY", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_LOST", 1000)
			stats.set_int(MPX .. "CR_GANGATTACK_VAGOS", 1000)
			stats.set_int(MPX .. "NO_NON_CONTRACT_RACE_WIN", 500)
			stats.set_int(MPX .. "DIED_IN_DROWNING", 833)
			stats.set_int(MPX .. "DIED_IN_DROWNINGINVEHICLE", 833)
			stats.set_int(MPX .. "DIED_IN_EXPLOSION", 833)
			stats.set_int(MPX .. "DIED_IN_FALL", 833)
			stats.set_int(MPX .. "DIED_IN_FIRE", 833)
			stats.set_int(MPX .. "DIED_IN_ROAD", 833)
			stats.set_int(MPX .. "GRENADE_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "MICROSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "SMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTSMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CRBNRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ADVRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "CMBTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "ASLTMG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "RPG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PISTOL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "PLAYER_HEADSHOTS", 500)
			stats.set_int(MPX .. "SAWNOFF_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "STKYBMB_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "UNARMED_ENEMY_KILLS", 50)
			stats.set_int(MPX .. "SNIPERRFL_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 500) end)
	
	AMMenu:add_action("Vehicles", function()
			stats.set_int(MPX .. "AWD_50_VEHICLES_BLOWNUP", 500)
			stats.set_int(MPX .. "CARS_EXPLODED", 500)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_FMDRIVEWITHOUTCRASH", 30)
			stats.set_int(MPX .. "AWD_PASSENGERTIME", 4)
			stats.set_int(MPX .. "AWD_TIME_IN_HELICOPTER", 4)
			stats.set_int(MPX .. "AWD_VEHICLE_JUMP_OVER_40M", 25)
			stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_VEHICLE_2_UNLCK", -1)
			stats.set_int(MPX .. "NO_CARS_REPAIR", 1000)
			stats.set_int(MPX .. "VEHICLES_SPRAYED", 500)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS_NOCRASH", 500)
			stats.set_int(MPX .. "USJS_FOUND", 50)
			stats.set_int(MPX .. "USJS_COMPLETED", 50)
			stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 50)
			stats.set_int(MPX .. "CRDEADLINE", 5)
			stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 2069146067)
			stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 2069146067)
			stats.set_int(MPX .. "LONGEST_WHEELIE_DIST", 1000)
			stats.set_int(MPX .. "RACES_WON", 50)
			stats.set_int(MPX .. "COUNT_HOTRING_RACE", 20)
			stats.set_bool(MPX .. "AWD_FMFURTHESTWHEELIE", true)
			stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", true) end)

	AMMenu:add_action("Combat", function()
			stats.set_int(MPX .. "AWD_100_HEADSHOTS", 500)
			stats.set_int(MPX .. "AWD_FMOVERALLKILLS", 1000)
			stats.set_int(MPX .. "AWD_FMKILLBOUNTY", 25)
			stats.set_int(MPX .. "AWD_FM_DM_3KILLSAMEGUY", 50)
			stats.set_int(MPX .. "AWD_FM_DM_KILLSTREAK", 100)
			stats.set_int(MPX .. "AWD_FM_DM_STOLENKILL", 50)
			stats.set_int(MPX .. "AWD_FM_DM_TOTALKILLS", 500)
			stats.set_bool(MPX .. "AWD_FMKILLSTREAKSDM", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSGANGHIDE", true)
			stats.set_bool(MPX .. "AWD_FMMOSTKILLSSURVIVE", true)
			stats.set_int(MPX .. "AWD_FMREVENGEKILLSDM", 50)
			stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
			stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
			stats.set_int(MPX .. "AWD_KILL_PSYCHOPATHS", 100)
			stats.set_int(MPX .. "AWD_TAKEDOWNSMUGPLANE", 50)
			stats.set_int(MPX .. "AWD_100_KILLS_PISTOL", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SMG", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SHOTGUN", 500)
			stats.set_int(MPX .. "ASLTRIFLE_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_100_KILLS_SNIPER", 500)
			stats.set_int(MPX .. "MG_ENEMY_KILLS", 500)
			stats.set_int(MPX .. "AWD_25_KILLS_STICKYBOMBS", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_GRENADES", 50)
			stats.set_int(MPX .. "AWD_50_KILLS_ROCKETLAUNCH", 50)
			stats.set_int(MPX .. "AWD_20_KILLS_MELEE", 50)
			stats.set_int(MPX .. "AWD_CAR_BOMBS_ENEMY_KILLS", 25)
			stats.set_int(MPX .. "MELEEKILLS", 700)
			stats.set_int(MPX .. "HITS", 10000)
			stats.set_int(MPX .. "DEATHS", 499)
			stats.set_int(MPX .. "HIGHEST_SKITTLES", 900)
			stats.set_int(MPX .. "NUMBER_NEAR_MISS", 1000) end)

	AMMenu:add_action("Heists", function()
			stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
			stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
			stats.set_int(MPX .. "AWD_COMPLETE_HEIST_NOT_DIE", -1)
			stats.set_bool(MPX .. "AWD_FINISH_HEIST_NO_DAMAGE", true)
			stats.set_int(MPX .. "AWD_WIN_GOLD_MEDAL_HEISTS", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_MEMBER", 25)
			stats.set_int(MPX .. "AWD_DO_HEIST_AS_THE_LEADER", 25)
			stats.set_bool(MPX .. "AWD_SPLIT_HEIST_TAKE_EVENLY", true)
			stats.set_bool(MPX .. "AWD_ACTIVATE_2_PERSON_KEY", true)
			stats.set_int(MPX .. "AWD_CONTROL_CROWDS", 25)
			stats.set_bool(MPX .. "AWD_ALL_ROLES_HEIST", true)
			stats.set_int(MPX .. "HEIST_COMPLETION", 25)
			stats.set_int(MPX .. "HEISTS_ORGANISED", -1)
			stats.set_int(MPX .. "HEIST_START", -1)
			stats.set_int(MPX .. "HEIST_END", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_PRISON", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_HUMANE", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_NARC", -1)
			stats.set_int(MPX .. "CUTSCENE_MID_ORNATE", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_1", -1)
			stats.set_int(MPX .. "CR_FLEECA_PREP_2", -1)
			stats.set_int(MPX .. "CR_FLEECA_FINALE", -1)
			stats.set_int(MPX .. "CR_PRISON_PLANE", -1)
			stats.set_int(MPX .. "CR_PRISON_BUS", -1)
			stats.set_int(MPX .. "CR_PRISON_STATION", -1)
			stats.set_int(MPX .. "CR_PRISON_UNFINISHED_BIZ", -1)
			stats.set_int(MPX .. "CR_PRISON_FINALE", -1)
			stats.set_int(MPX .. "CR_HUMANE_KEY_CODES", -1)
			stats.set_int(MPX .. "CR_HUMANE_ARMORDILLOS", -1)
			stats.set_int(MPX .. "CR_HUMANE_EMP", -1)
			stats.set_int(MPX .. "CR_HUMANE_VALKYRIE", -1)
			stats.set_int(MPX .. "CR_HUMANE_FINALE", -1)
			stats.set_int(MPX .. "CR_NARC_COKE", -1)
			stats.set_int(MPX .. "CR_NARC_TRASH_TRUCK", -1)
			stats.set_int(MPX .. "CR_NARC_BIKERS", -1)
			stats.set_int(MPX .. "CR_NARC_WEED", -1)
			stats.set_int(MPX .. "CR_NARC_STEAL_METH", -1)
			stats.set_int(MPX .. "CR_NARC_FINALE", -1)
			stats.set_int(MPX .. "CR_PACIFIC_TRUCKS", -1)
			stats.set_int(MPX .. "CR_PACIFIC_WITSEC", -1)
			stats.set_int(MPX .. "CR_PACIFIC_HACK", -1)
			stats.set_int(MPX .. "CR_PACIFIC_BIKES", -1)
			stats.set_int(MPX .. "CR_PACIFIC_CONVOY", -1)
			stats.set_int(MPX .. "CR_PACIFIC_FINALE", -1)
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
			stats.set_bool(MPX .. "AWD_MATCHING_OUTFIT_HEIST", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_PRINT", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_1", true)
			stats.set_bool(MPX .. "HEIST_PRE_PLAN_DONE_HELP_0", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_FINALE", true)
			stats.set_bool(MPX .. "HEIST_IS_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_STRAND_INTRO_DONE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_ORNATE", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_PRISON", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_BIOLAB", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_NARCOTIC", true)
			stats.set_bool(MPX .. "HEIST_CUTS_DONE_TUTORIAL", true)
			stats.set_bool(MPX .. "HEIST_AWARD_DONE_PREP", true)
			stats.set_bool(MPX .. "HEIST_AWARD_BOUGHT_IN", true)
			stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1) end)

	AMMenu:add_action("Doomsday", function()
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -1)
			stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", -229384)
			stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1)
			stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", -1)
			stats.set_int("MPPLY_GANGOPS_ALLINORDER", 100)
			stats.set_int("MPPLY_GANGOPS_LOYALTY", 100)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD", 100)
			stats.set_int("MPPLY_GANGOPS_LOYALTY2", 100)
			stats.set_int("MPPLY_GANGOPS_LOYALTY3", 100)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", 100)
			stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", 100)
			stats.set_int("MPPLY_GANGOPS_SUPPORT", 100)
			stats.set_int(MPX .. "CR_GANGOP_MORGUE", 10)
			stats.set_int(MPX .. "CR_GANGOP_DELUXO", 10)
			stats.set_int(MPX .. "CR_GANGOP_SERVERFARM", 10)
			stats.set_int(MPX .. "CR_GANGOP_IAABASE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALOSPREY", 10)
			stats.set_int(MPX .. "CR_GANGOP_FOUNDRY", 10)
			stats.set_int(MPX .. "CR_GANGOP_RIOTVAN", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINECAR", 10)
			stats.set_int(MPX .. "CR_GANGOP_SUBMARINE_FIN", 10)
			stats.set_int(MPX .. "CR_GANGOP_PREDATOR", 10)
			stats.set_int(MPX .. "CR_GANGOP_BMLAUNCHER", 10)
			stats.set_int(MPX .. "CR_GANGOP_BCCUSTOM", 10)
			stats.set_int(MPX .. "CR_GANGOP_STEALTHTANKS", 10)
			stats.set_int(MPX .. "CR_GANGOP_SPYPLANE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P2", 10)
			stats.set_int(MPX .. "CR_GANGOP_FINALE_P3", 10)
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
	        	for j = 0, 63 do stats.set_bool_masked(MPX .. "GANGOPSPSTAT_BOOL0", true, j, MPX) end
			stats.set_masked_int(MPX .. "DLCSMUGCHARPSTAT_INT260", 3, 16, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 24, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 32, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 40, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 48, 8) end)

	AMMenu:add_action("After Hours", function()
			stats.set_int(MPX .. "AWD_DANCE_TO_SOLOMUN", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_TALEOFUS", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_DIXON", 120)
			stats.set_int(MPX .. "AWD_DANCE_TO_BLKMAD", 120)
			stats.set_int(MPX .. "AWD_CLUB_DRUNK", 200)
			stats.set_int(MPX .. "NIGHTCLUB_VIP_APPEAR", 700)
			stats.set_int(MPX .. "NIGHTCLUB_JOBS_DONE", 700)
			stats.set_int(MPX .. "NIGHTCLUB_EARNINGS", 5721002)
			stats.set_int(MPX .. "HUB_SALES_COMPLETED", 1001)
			stats.set_int(MPX .. "HUB_EARNINGS", 20721002)
			stats.set_int(MPX .. "DANCE_COMBO_DURATION_MINS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_PLAYER_APPEAR", 100)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_SOLD", 784672)
			stats.set_int(MPX .. "LIFETIME_HUB_GOODS_MADE", 507822)
			stats.set_int(MPX .. "DANCEPERFECTOWNCLUB", 120)
			stats.set_int(MPX .. "NUMUNIQUEPLYSINCLUB", 120)
			stats.set_int(MPX .. "DANCETODIFFDJS", 4)
			stats.set_int(MPX .. "NIGHTCLUB_HOTSPOT_TIME_MS", 3600000)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_TOTAL", 20)
			stats.set_int(MPX .. "NIGHTCLUB_CONT_MISSION", -1)
			stats.set_int(MPX .. "CLUB_CONTRABAND_MISSION", 1000)
			stats.set_int(MPX .. "HUB_CONTRABAND_MISSION", 1000)
			stats.set_bool(MPX .. "AWD_CLUB_HOTSPOT", true)
			stats.set_bool(MPX .. "AWD_CLUB_CLUBBER", true)
			stats.set_bool(MPX .. "AWD_CLUB_COORD", true)
		        for j = 0, 63 do stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL0", true, j, MPX) 
		        stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL1", true, j, MPX) end
		        if (stats.get_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 0, 8) <20) then 
		        stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 20, 0, 8) end
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 100, 16, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 20, 24, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 80, 32, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 60, 40, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 40, 48, 8) 
			stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 10, 56, 8) end)

	AMMenu:add_action("Arena War", function()
			stats.set_int(MPX .. "ARN_BS_TRINKET_TICKERS", -1)
			stats.set_int(MPX .. "ARN_BS_TRINKET_SAVED", -1)
			stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 50)
			stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 50)
			stats.set_int(MPX .. "AWD_READY_FOR_WAR", 50)
			stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 50)
			stats.set_int(MPX .. "AWD_SPINNER", 50)
			stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 50)
			stats.set_int(MPX .. "AWD_MASTER_BANDITO", 50)
			stats.set_int(MPX .. "AWD_SITTING_DUCK", 50)
			stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 50)
			stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 50)
			stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 50)
			stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 200)
			stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 50)
			stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 1000000)
			stats.set_int(MPX .. "AWD_TIME_SERVED", 1000)
			stats.set_int(MPX .. "AWD_TOP_SCORE", 55000)
			stats.set_int(MPX .. "AWD_CAREER_WINNER", 1000)
			stats.set_int(MPX .. "ARENAWARS_SP", 0)
			stats.set_int(MPX .. "ARENAWARS_SKILL_LEVEL", 20)
			stats.set_int(MPX .. "ARENAWARS_SP_LIFETIME", 100)
			stats.set_int(MPX .. "ARENAWARS_AP", 0)
			stats.set_int(MPX .. "ARENAWARS_AP_TIER", 1000)
			stats.set_int(MPX .. "ARENAWARS_AP_LIFETIME", 5055000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_UNLK", -1)
			stats.set_int(MPX .. "ARN_W_THEME_SCIFI", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_APOC", 1000)
			stats.set_int(MPX .. "ARN_W_THEME_CONS", 1000)
			stats.set_int(MPX .. "ARN_W_PASS_THE_BOMB", 1000)
			stats.set_int(MPX .. "ARN_W_DETONATION", 1000)
			stats.set_int(MPX .. "ARN_W_ARCADE_RACE", 1000)
			stats.set_int(MPX .. "ARN_W_CTF", 1000)
			stats.set_int(MPX .. "ARN_W_TAG_TEAM", 1000)
			stats.set_int(MPX .. "ARN_W_DESTR_DERBY", 1000)
			stats.set_int(MPX .. "ARN_W_CARNAGE", 1000)
			stats.set_int(MPX .. "ARN_W_MONSTER_JAM", 1000)
			stats.set_int(MPX .. "ARN_W_GAMES_MASTERS", 1000)
			stats.set_int(MPX .. "ARN_L_PASS_THE_BOMB", 500)
			stats.set_int(MPX .. "ARN_L_DETONATION", 500)
			stats.set_int(MPX .. "ARN_L_ARCADE_RACE", 500)
			stats.set_int(MPX .. "ARN_L_CTF", 500)
			stats.set_int(MPX .. "ARN_L_TAG_TEAM", 500)
			stats.set_int(MPX .. "ARN_L_DESTR_DERBY", 500)
			stats.set_int(MPX .. "ARN_L_CARNAGE", 500)
			stats.set_int(MPX .. "ARN_L_MONSTER_JAM", 500)
			stats.set_int(MPX .. "ARN_L_GAMES_MASTERS", 500)
			stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 1000)
			stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 500)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINS", 1000)
			stats.set_int(MPX .. "ARENAWARS_CARRER_WINT", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYD", 1000)
			stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYDT", 1000)
			stats.set_int(MPX .. "ARN_SPEC_BOX_TIME_MS", 86400000)
			stats.set_int(MPX .. "ARN_SPECTATOR_DRONE", 1000)
			stats.set_int(MPX .. "ARN_SPECTATOR_CAMS", 1000)
			stats.set_int(MPX .. "ARN_SMOKE", 1000)
			stats.set_int(MPX .. "ARN_DRINK", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_MONSTER", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_CERBERUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUISER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN4", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN5", 1000)
			stats.set_int(MPX .. "ARN_VEH_SLAMVAN6", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS2", 1000)
			stats.set_int(MPX .. "ARN_VEH_BRUTUS3", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB2", 1000)
			stats.set_int(MPX .. "ARN_VEH_SCARAB3", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR4", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR5", 1000)
			stats.set_int(MPX .. "ARN_VEH_DOMINATOR6", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER3", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPALER4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI4", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI5", 1000)
			stats.set_int(MPX .. "ARN_VEH_ISSI", 61000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR2", 1000)
			stats.set_int(MPX .. "ARN_VEH_IMPERATOR3", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR380", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3802", 1000)
			stats.set_int(MPX .. "ARN_VEH_ZR3803", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE2", 1000)
			stats.set_int(MPX .. "ARN_VEH_DEATHBIKE3", 1000)
			stats.set_bool(MPX .. "AWD_BEGINNER", true)
			stats.set_bool(MPX .. "AWD_FIELD_FILLER", true)
			stats.set_bool(MPX .. "AWD_ARMCHAIR_RACER", true)
			stats.set_bool(MPX .. "AWD_LEARNER", true)
			stats.set_bool(MPX .. "AWD_SUNDAY_DRIVER", true)
			stats.set_bool(MPX .. "AWD_THE_ROOKIE", true)
			stats.set_bool(MPX .. "AWD_BUMP_AND_RUN", true)
			stats.set_bool(MPX .. "AWD_GEAR_HEAD", true)
			stats.set_bool(MPX .. "AWD_DOOR_SLAMMER", true)
			stats.set_bool(MPX .. "AWD_HOT_LAP", true)
			stats.set_bool(MPX .. "AWD_ARENA_AMATEUR", true)
			stats.set_bool(MPX .. "AWD_PAINT_TRADER", true)
			stats.set_bool(MPX .. "AWD_SHUNTER", true)
			stats.set_bool(MPX .. "AWD_JOCK", true)
			stats.set_bool(MPX .. "AWD_WARRIOR", true)
			stats.set_bool(MPX .. "AWD_T_BONE", true)
			stats.set_bool(MPX .. "AWD_MAYHEM", true)
			stats.set_bool(MPX .. "AWD_WRECKER", true)
			stats.set_bool(MPX .. "AWD_CRASH_COURSE", true)
			stats.set_bool(MPX .. "AWD_ARENA_LEGEND", true)
			stats.set_bool(MPX .. "AWD_PEGASUS", true)
			stats.set_bool(MPX .. "AWD_UNSTOPPABLE", true)
			stats.set_bool(MPX .. "AWD_CONTACT_SPORT", true)
			stats.set_masked_int(MPX .. "ARENAWARSPSTAT_INT", 1, 35, 8)
		        for i = 0, 8 do for j = 0, 63 do stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL"..i, true, j, MPX) end end end)

	AMMenu:add_action("Diamond Casino n Resort", function()
			stats.set_int(MPX .. "AWD_ODD_JOBS", 50)
			stats.set_int(MPX .. "VCM_FLOW_PROGRESS", -1)
			stats.set_int(MPX .. "VCM_STORY_PROGRESS", 5)
			stats.set_bool(MPX .. "AWD_FIRST_TIME1", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME2", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME3", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME4", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME5", true)
			stats.set_bool(MPX .. "AWD_FIRST_TIME6", true)
			stats.set_bool(MPX .. "AWD_ALL_IN_ORDER", true)
			stats.set_bool(MPX .. "AWD_SUPPORTING_ROLE", true)
			stats.set_bool(MPX .. "AWD_LEADER", true)
			stats.set_bool(MPX .. "AWD_SURVIVALIST", true)
			Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD") if Paragon == true then 
		        stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", true) else 
		        stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false) end
		        for i = 0, 6 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL"..i, true, j, MPX) end end end)

	AMMenu:add_action("Diamond Casino Heist", function()
			stats.set_int(MPX .. "CAS_HEIST_NOTS", -1)
			stats.set_int(MPX .. "CAS_HEIST_FLOW", -1)
			stats.set_int(MPX .. "SIGNAL_JAMMERS_COLLECTED", 50)
			stats.set_int(MPX .. "AWD_PREPARATION", 40)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE0", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE1", -1)
			stats.set_int(MPX .. "H3_BOARD_DIALOGUE2", -1)
			stats.set_int(MPX .. "H3_VEHICLESUSED", -1)
			stats.set_int(MPX .. "H3_CR_STEALTH_1A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2B_RAPP", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_2C_SIDE", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_3A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_4A", 100)
			stats.set_int(MPX .. "H3_CR_STEALTH_5A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_1A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3B", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_4A", 100)
			stats.set_int(MPX .. "H3_CR_SUBTERFUGE_5A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_1A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A1", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2A2", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2BP", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_2C", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_3A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_4A", 100)
			stats.set_int(MPX .. "H3_CR_DIRECT_5A", 100)
			stats.set_int(MPX .. "CR_ORDER", 100)
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAPE", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_RSC_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_BWL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_MTG_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_OIL_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_DEF_SEEN", true)
			stats.set_bool(MPX .. "VCM_FLOW_CS_FIN_SEEN", true)
			stats.set_bool(MPX .. "HELP_FURIA", true)
			stats.set_bool(MPX .. "HELP_MINITAN", true)
			stats.set_bool(MPX .. "HELP_YOSEMITE2", true)
			stats.set_bool(MPX .. "HELP_ZHABA", true)
			stats.set_bool(MPX .. "HELP_IMORGEN", true)
			stats.set_bool(MPX .. "HELP_SULTAN2", true)
			stats.set_bool(MPX .. "HELP_VAGRANT", true)
			stats.set_bool(MPX .. "HELP_VSTR", true)
			stats.set_bool(MPX .. "HELP_STRYDER", true)
			stats.set_bool(MPX .. "HELP_SUGOI", true)
			stats.set_bool(MPX .. "HELP_KANJO", true)
			stats.set_bool(MPX .. "HELP_FORMULA", true)
			stats.set_bool(MPX .. "HELP_FORMULA2", true)
			stats.set_bool(MPX .. "HELP_JB7002", true)
		        for i = 0, 4 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL"..i, true, j, MPX) end end end)

	AMMenu:add_action("Arcade", function()
			stats.set_int(MPX .. "AWD_PREPARATION", 50)
			stats.set_int(MPX .. "AWD_ASLEEPONJOB", 20)
			stats.set_int(MPX .. "AWD_DAICASHCRAB", 100000)
			stats.set_int(MPX .. "AWD_BIGBRO", 40)
			stats.set_int(MPX .. "AWD_SHARPSHOOTER", 40)
			stats.set_int(MPX .. "AWD_RACECHAMP", 40)
			stats.set_int(MPX .. "AWD_BATSWORD", 1000000)
			stats.set_int(MPX .. "AWD_COINPURSE", 950000)
			stats.set_int(MPX .. "AWD_ASTROCHIMP", 3000000)
			stats.set_int(MPX .. "AWD_MASTERFUL", 40000)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 50)
			stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 50)
			stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", -1)
			stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", -1)
			stats.set_int(MPX .. "IAP_MAX_MOON_DIST", 2147483647)
			stats.set_int(MPX .. "SCGW_INITIALS_0", 69644)
			stats.set_int(MPX .. "SCGW_INITIALS_1", 50333)
			stats.set_int(MPX .. "SCGW_INITIALS_2", 63512)
			stats.set_int(MPX .. "SCGW_INITIALS_3", 46136)
			stats.set_int(MPX .. "SCGW_INITIALS_4", 21638)
			stats.set_int(MPX .. "SCGW_INITIALS_5", 2133)
			stats.set_int(MPX .. "SCGW_INITIALS_6", 1215)
			stats.set_int(MPX .. "SCGW_INITIALS_7", 2444)
			stats.set_int(MPX .. "SCGW_INITIALS_8", 38023)
			stats.set_int(MPX .. "SCGW_INITIALS_9", 2233)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_0",0)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_1", 64)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_2", 8457)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_3", 91275)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_4", 53260)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_5", 78663)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_6", 25103)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_7", 102401)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_8", 12672)
			stats.set_int(MPX .. "FOOTAGE_INITIALS_9", 74380)
			stats.set_int(MPX .. "FOOTAGE_SCORE_0", 284544)
			stats.set_int(MPX .. "FOOTAGE_SCORE_1", 275758)
			stats.set_int(MPX .. "FOOTAGE_SCORE_2", 100000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_3", 90000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_4", 80000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_5", 70000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_6", 60000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_7", 50000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_8", 40000)
			stats.set_int(MPX .. "FOOTAGE_SCORE_9", 30000)
                        for i = 0, 9 do stats.set_int(MPX .. "IAP_INITIALS_"..i, 50) 
			stats.set_int(MPX .. "IAP_SCORE_"..i, 50) 
			stats.set_int(MPX .. "IAP_SCORE_"..i, 50) 
			stats.set_int(MPX .. "SCGW_SCORE_"..i, 50) 
			stats.set_int(MPX .. "DG_DEFENDER_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "DG_DEFENDER_SCORE_"..i, 50) 
			stats.set_int(MPX .. "DG_MONKEY_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "DG_MONKEY_SCORE_"..i, 50) 
			stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "DG_PENETRATOR_SCORE_"..i, 50) 
			stats.set_int(MPX .. "GGSM_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "GGSM_SCORE_"..i, 50) 
			stats.set_int(MPX .. "TWR_INITIALS_"..i, 69644) 
			stats.set_int(MPX .. "TWR_SCORE_"..i, 50) end 
			stats.set_bool(MPX .. "AWD_SCOPEOUT", true)
			stats.set_bool(MPX .. "AWD_CREWEDUP", true)
			stats.set_bool(MPX .. "AWD_MOVINGON", true)
			stats.set_bool(MPX .. "AWD_PROMOCAMP", true)
			stats.set_bool(MPX .. "AWD_GUNMAN", true)
			stats.set_bool(MPX .. "AWD_SMASHNGRAB", true)
			stats.set_bool(MPX .. "AWD_INPLAINSI", true)
			stats.set_bool(MPX .. "AWD_UNDETECTED", true)
			stats.set_bool(MPX .. "AWD_ALLROUND", true)
			stats.set_bool(MPX .. "AWD_ELITETHEIF", true)
			stats.set_bool(MPX .. "AWD_PRO", true)
			stats.set_bool(MPX .. "AWD_SUPPORTACT", true)
			stats.set_bool(MPX .. "AWD_SHAFTED", true)
			stats.set_bool(MPX .. "AWD_COLLECTOR", true)
			stats.set_bool(MPX .. "AWD_DEADEYE", true)
			stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", true)
			stats.set_bool(MPX .. "AWD_TRAFFICAVOI", true)
			stats.set_bool(MPX .. "AWD_CANTCATCHBRA", true)
			stats.set_bool(MPX .. "AWD_WIZHARD", true)
			stats.set_bool(MPX .. "AWD_APEESCAP", true)
			stats.set_bool(MPX .. "AWD_MONKEYKIND", true)
			stats.set_bool(MPX .. "AWD_AQUAAPE", true)
			stats.set_bool(MPX .. "AWD_KEEPFAITH", true)
			stats.set_bool(MPX .. "AWD_TRUELOVE", true)
			stats.set_bool(MPX .. "AWD_NEMESIS", true)
			stats.set_bool(MPX .. "AWD_FRIENDZONED", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_0", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_1", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_2", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_3", true)
			stats.set_bool(MPX .. "IAP_CHALLENGE_4", true)
			stats.set_bool(MPX .. "IAP_GOLD_TANK", true)
			stats.set_bool(MPX .. "SCGW_WON_NO_DEATHS", true)
		        for j = 290449, 290468 do globals.set_int(j, 1) end 
		        for i = 0, 4 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL"..i, true, j, MPX) end end 
		        for i = 0, 6 do for j = 0, 63 do stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL"..i, true, j, MPX) end end end)

	AMMenu:add_action("LS Summer Special", function()
			stats.set_bool(MPX .. "AWD_KINGOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_QUBISM", true)
			stats.set_bool(MPX .. "AWD_QUIBITS", true)
			stats.set_bool(MPX .. "AWD_GODOFQUB3D", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "AWD_GOFOR11TH", true)
			stats.set_masked_int(MPX .. "SU20PSTAT_INT", 1, 35, 8)
		        for i = 0, 1 do for j = 0, 63 do stats.set_bool_masked(MPX .. "SU20PSTAT_BOOL"..i, true, j, MPX) 
		        stats.set_bool_masked(MPX .. "SU20TATTOOSTAT_BOOL"..i, true, j, MPX) end end end)

	AMMenu:add_action("Cayo Perico", function()
			stats.set_bool(MPX .. "AWD_INTELGATHER", true)
			stats.set_bool(MPX .. "AWD_COMPOUNDINFILT", true)
			stats.set_bool(MPX .. "AWD_LOOT_FINDER", true)
			stats.set_bool(MPX .. "AWD_MAX_DISRUPT", true)
			stats.set_bool(MPX .. "AWD_THE_ISLAND_HEIST", true)
			stats.set_bool(MPX .. "AWD_GOING_ALONE", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_TEAM_WORK", true)
			stats.set_bool(MPX .. "AWD_MIXING_UP", true)
			stats.set_bool(MPX .. "AWD_PRO_THIEF", true)
			stats.set_bool(MPX .. "AWD_CAT_BURGLAR", true)
			stats.set_bool(MPX .. "AWD_ONE_OF_THEM", true)
			stats.set_bool(MPX .. "AWD_GOLDEN_GUN", true)
			stats.set_bool(MPX .. "AWD_ELITE_THIEF", true)
			stats.set_bool(MPX .. "AWD_PROFESSIONAL", true)
			stats.set_bool(MPX .. "AWD_HELPING_OUT", true)
			stats.set_bool(MPX .. "AWD_COURIER", true)
			stats.set_bool(MPX .. "AWD_PARTY_VIBES", true)
			stats.set_bool(MPX .. "AWD_HELPING_HAND", true)
			stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_VETIR", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_LONGFIN", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ANNIH", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_ALKONOS", true)
			stats.set_bool(MPX .. "COMPLETE_H4_F_USING_PATROLB", true)
			stats.set_int(MPX .. "AWD_LOSTANDFOUND", 500000)
			stats.set_int(MPX .. "AWD_SUNSET", 1800000)
			stats.set_int(MPX .. "AWD_TREASURE_HUNTER", 1000000)
			stats.set_int(MPX .. "AWD_WRECK_DIVING", 1000000)
			stats.set_int(MPX .. "AWD_KEINEMUSIK", 1800000)
			stats.set_int(MPX .. "AWD_PALMS_TRAX", 1800000)
			stats.set_int(MPX .. "AWD_MOODYMANN", 1800000)
			stats.set_int(MPX .. "AWD_FILL_YOUR_BAGS", 1000000000)
			stats.set_int(MPX .. "AWD_WELL_PREPARED", 80)
			stats.set_int(MPX .. "H4_H4_DJ_MISSIONS", -1)
			stats.set_int(MPX .. "H4CNF_APPROACH", -1)
			stats.set_int(MPX .. "H4_MISSIONS", -1)
			stats.set_int(MPX .. "H4_PLAYTHROUGH_STATUS", 100)
		        for i = 0, 2 do for j = 0, 63 do stats.set_bool_masked(MPX .. "HISLANDPSTAT_BOOL"..i, true, j, MPX) end end end)

	AMMenu:add_action("LS Tuners", function()
			stats.set_int(MPX .. "AWD_CAR_CLUB_MEM", 100)
			stats.set_int(MPX .. "AWD_SPRINTRACER", 50)
			stats.set_int(MPX .. "AWD_STREETRACER", 50)
			stats.set_int(MPX .. "AWD_PURSUITRACER", 50)
			stats.set_int(MPX .. "AWD_TEST_CAR", 240)
			stats.set_int(MPX .. "AWD_AUTO_SHOP", 50)	
			stats.set_int(MPX .. "AWD_GROUNDWORK", 40)
			stats.set_int(MPX .. "AWD_CAR_EXPORT", 100)
			stats.set_int(MPX .. "AWD_ROBBERY_CONTRACT", 100)
			stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 100)
			stats.set_bool(MPX .. "AWD_CAR_CLUB", true)
			stats.set_bool(MPX .. "AWD_PRO_CAR_EXPORT", true)
			stats.set_bool(MPX .. "AWD_UNION_DEPOSITORY", true)
			stats.set_bool(MPX .. "AWD_MILITARY_CONVOY", true)
			stats.set_bool(MPX .. "AWD_FLEECA_BANK", true)
			stats.set_bool(MPX .. "AWD_FREIGHT_TRAIN", true)
			stats.set_bool(MPX .. "AWD_BOLINGBROKE_ASS", true)
			stats.set_bool(MPX .. "AWD_IAA_RAID", true)
			stats.set_bool(MPX .. "AWD_METH_JOB", true)
			stats.set_bool(MPX .. "AWD_BUNKER_RAID", true)
			stats.set_bool(MPX .. "AWD_STRAIGHT_TO_VIDEO", true)
			stats.set_bool(MPX .. "AWD_MONKEY_C_MONKEY_DO", true)
			stats.set_bool(MPX .. "AWD_TRAINED_TO_KILL", true)
			stats.set_bool(MPX .. "AWD_DIRECTOR", true)
		        for i = 0, 8 do for j = 0, 63 do stats.set_bool_masked(MPX .. "TUNERPSTAT_BOOL"..i, true, j, MPX) end end end)

	AMMenu:add_action("Contract", function()
			stats.set_int(MPX .. "AWD_CONTRACTOR", 50)
			stats.set_int(MPX .. "AWD_COLD_CALLER", 50)
			stats.set_int(MPX .. "AWD_PRODUCER", 60)
			stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 10)
			stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", -1)
			stats.set_int(MPX .. "FIXER_GENERAL_BS", -1)
			stats.set_int(MPX .. "FIXER_COMPLETED_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_BS", -1)
			stats.set_int(MPX .. "FIXER_STORY_STRAND", -1)
			stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", -1)
			stats.set_int(MPX .. "FIXER_COUNT", 510)
			stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", 85)
			stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", 85)
			stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", 85)
			stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", 85)
			stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", 85)
			stats.set_int(MPX .. "FIXER_EARNINGS", 19734860)
			stats.set_bool(MPX .. "AWD_TEEING_OFF", true)
			stats.set_bool(MPX .. "AWD_PARTY_NIGHT", true)
			stats.set_bool(MPX .. "AWD_BILLIONAIRE_GAMES", true)
			stats.set_bool(MPX .. "AWD_HOOD_PASS", true)
			stats.set_bool(MPX .. "AWD_STUDIO_TOUR", true)
			stats.set_bool(MPX .. "AWD_DONT_MESS_DRE", true)
			stats.set_bool(MPX .. "AWD_BACKUP", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_1", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_2", true)
			stats.set_bool(MPX .. "AWD_SHORTFRANK_3", true)
			stats.set_bool(MPX .. "AWD_CONTR_KILLER", true)
			stats.set_bool(MPX .. "AWD_DOGS_BEST_FRIEND", true)
			stats.set_bool(MPX .. "AWD_MUSIC_STUDIO", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_1", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_2", true)
			stats.set_bool(MPX .. "AWD_SHORTLAMAR_3", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_0", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_1", true)
			stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_SETUP", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_STRAND", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_F", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_2", true)
			stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_F", true)
		        for j = 0, 63 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL0", true, j, MPX) 
		        stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, j, MPX) 
		        stats.set_bool_masked(MPX .. "FIXERTATTOOSTAT_BOOL0", true, j, MPX) end end)
	
	AMenu:add_action("Reset All", function()
		stats.set_int(MPX .. "AWD_FM_DM_WINS", 0)
		stats.set_int(MPX .. "AWD_FM_TDM_WINS", 0)
		stats.set_int(MPX .. "AWD_FM_TDM_MVP", 0)
		stats.set_int(MPX .. "AWD_RACES_WON", 0)
		stats.set_int(MPX .. "AWD_FMWINAIRRACE", 0)
		stats.set_int(MPX .. "AWD_FMWINSEARACE", 0)
		stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 0)
		stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 0)
		stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 0)
		stats.set_int(MPX .. "AWD_FMWINRACETOPOINTS", 0)
		stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 0)
		stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 0)
		stats.set_int(MPX .. "AWD_FMHORDWAVESSURVIVE", 0)
		stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 0)
		stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 0)
		stats.set_int(MPX .. "AWD_NO_ARMWRESTLING_WINS", 0)
		stats.set_int(MPX .. "MOST_ARM_WRESTLING_WINS", 0)
		stats.set_int(MPX .. "AWD_WIN_AT_DARTS", 0)
		stats.set_int(MPX .. "AWD_FM_GOLF_WON", 0)
		stats.set_int(MPX .. "AWD_FM_TENNIS_WON", 0)
		stats.set_int(MPX .. "AWD_FM_SHOOTRANG_CT_WON", 0)
		stats.set_int(MPX .. "AWD_FM_SHOOTRANG_RT_WON", 0)
		stats.set_int(MPX .. "AWD_FM_SHOOTRANG_TG_WON", 0)
		stats.set_int(MPX .. "AWD_WIN_CAPTURES", 0)
		stats.set_int(MPX .. "AWD_WIN_CAPTURE_DONT_DYING", 0)
		stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 0)
		stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 0)
		stats.set_int(MPX .. "AWD_KILL_TEAM_YOURSELF_LTS", 0)
		stats.set_int(MPX .. "AIR_LAUNCHES_OVER_0M", 0)
		stats.set_int(MPX .. "AWD_CARS_EXPORTED", 0)
		stats.set_int(MPX .. "AWD_LESTERDELIVERVEHICLES", 0)
		stats.set_int(MPX .. "CR_DIFFERENT_DM", 0)
		stats.set_int(MPX .. "CR_DIFFERENT_RACES", 0)
		stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_0M", 0)
		stats.set_int(MPX .. "AWD_PARACHUTE_JUMPS_0M", 0)
		stats.set_int(MPX .. "AWD_FMBASEJMP", 0)
		stats.set_int(MPX .. "AWD_FM_GOLF_BIRDIES", 0)
		stats.set_int(MPX .. "AWD_FM_TENNIS_ACE", 0)
		stats.set_int(MPX .. "AWD_FMBBETWIN", 0)
		stats.set_int(MPX .. "AWD_LAPDANCES", 0)
		stats.set_int(MPX .. "AWD_FMCRATEDROPS", 0)
		stats.set_int(MPX .. "AWD_NO_HAIRCUTS", 0)
		stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 0)
		stats.set_int(MPX .. "AWD_PICKUP_CAP_PACKAGES", 0)
		stats.set_int(MPX .. "AWD_MENTALSTATE_TO_NORMAL", 0)
		stats.set_int(MPX .. "AWD_TRADE_IN_YOUR_PROPERTY", 0)
		stats.set_int(MPX .. "NO_PHOTOS_TAKEN", 0)
		stats.set_int(MPX .. "BOUNTSONU", 0)
		stats.set_int(MPX .. "BOUNTPLACED", 0)
		stats.set_int(MPX .. "BETAMOUNT", 0)
		stats.set_int(MPX .. "CRARMWREST", 0)
		stats.set_int(MPX .. "CRBASEJUMP", 0)
		stats.set_int(MPX .. "CRDARTS", 0)
		stats.set_int(MPX .. "CRDM", 0)
		stats.set_int(MPX .. "CRGANGHIDE", 0)
		stats.set_int(MPX .. "CRGOLF", 0)
		stats.set_int(MPX .. "CRHORDE", 0)
		stats.set_int(MPX .. "CRMISSION", 0)
		stats.set_int(MPX .. "CRSHOOTRNG", 0)
		stats.set_int(MPX .. "CRTENNIS", 0)
		stats.set_int(MPX .. "NO_TIMES_CINEMA", 0)
		stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED", 0)
		stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED2", 0)
		stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED3", 0)
		stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED0", 0)
		stats.set_int(MPX .. "CHAR_WEAP_ADDON_1_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_WEAP_ADDON_2_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_WEAP_ADDON_3_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_WEAP_ADDON_0_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_WEAP_FREE", 0)
		stats.set_int(MPX .. "CHAR_WEAP_FREE2", 0)
		stats.set_int(MPX .. "CHAR_FM_WEAP_FREE", 0)
		stats.set_int(MPX .. "CHAR_FM_WEAP_FREE2", 0)
		stats.set_int(MPX .. "CHAR_FM_WEAP_FREE3", 0)
		stats.set_int(MPX .. "CHAR_FM_WEAP_FREE0", 0)
		stats.set_int(MPX .. "CHAR_WEAP_PURCHASED", 0)
		stats.set_int(MPX .. "CHAR_WEAP_PURCHASED2", 0)
		stats.set_int(MPX .. "WEAPON_PICKUP_BITSET", 0)
		stats.set_int(MPX .. "WEAPON_PICKUP_BITSET2", 0)
		stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", 0)
		stats.set_int(MPX .. "NO_WEAPONS_UNLOCK", 0)
		stats.set_int(MPX .. "NO_WEAPON_MODS_UNLOCK", 0)
		stats.set_int(MPX .. "NO_WEAPON_CLR_MOD_UNLOCK", 0) 
		stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", 0)
		stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED3", 0)
		stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED0", 0)
		stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_0_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_0_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", 0)
		stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", 0)
		stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", 0)
		stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE3", 0)
		stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE0", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_0_WHITE", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_0_RED", 0)
		stats.set_int(MPX .. "FIREWORK_TYPE_0_BLUE", 0)
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", 0)
		stats.set_int(MPX .. "AWD_FMTIME5STARWANTED", 0)
		stats.set_int(MPX .. "AWD_5STAR_WANTED_AVOIDANCE", 0)
		stats.set_int(MPX .. "AWD_FMSHOOTDOWNCOPHELI", 0)
		stats.set_int(MPX .. "AWD_VEHICLES_JACKEDR", 0)
		stats.set_int(MPX .. "AWD_SECURITY_CARS_ROBBED", 0)
		stats.set_int(MPX .. "AWD_HOLD_UP_SHOPS", 0)
		stats.set_int(MPX .. "AWD_ODISTRACTCOPSNOEATH", 0)
		stats.set_int(MPX .. "AWD_ENEMYDRIVEBYKILLS", 0)
		stats.set_int(MPX .. "CHAR_WANTED_LEVEL_TIME5STAR", 0)
		stats.set_int(MPX .. "CARS_COPS_EXPLODED", 0)
		stats.set_int(MPX .. "BIKES_EXPLODED", 0)
		stats.set_int(MPX .. "BOATS_EXPLODED", 0)
		stats.set_int(MPX .. "HELIS_EXPLODED", 0)
		stats.set_int(MPX .. "PLANES_EXPLODED", 0)
		stats.set_int(MPX .. "QUADBIKE_EXPLODED", 0)
		stats.set_int(MPX .. "BICYCLE_EXPLODED", 0)
		stats.set_int(MPX .. "SUBMARINE_EXPLODED", 0)
		stats.set_int(MPX .. "TIRES_POPPED_BY_GUNSHOT", 0)
		stats.set_int(MPX .. "NUMBER_CRASHES_CARS", 0)
		stats.set_int(MPX .. "NUMBER_CRASHES_BIKES", 0)
		stats.set_int(MPX .. "BAILED_FROM_VEHICLE", 0)
		stats.set_int(MPX .. "NUMBER_CRASHES_QUADBIKES", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_COP_VEHICLE", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_CARS", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_BIKES", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_BOATS", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_HELIS", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_PLANES", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_QUADBIKES", 0)
		stats.set_int(MPX .. "NUMBER_STOLEN_BICYCLES", 0)
		stats.set_int(MPX .. "MC_CONTRIBUTION_POINTS", 0)
		stats.set_int(MPX .. "MEMBERSMARKEDFORDEATH", 0)
		stats.set_int(MPX .. "MCKILLS", 0)
		stats.set_int(MPX .. "MCDEATHS", 0)
		stats.set_int(MPX .. "RIVALPRESIDENTKILLS", 0)
		stats.set_int(MPX .. "RIVALCEOANDVIPKILLS", 0)
		stats.set_int(MPX .. "CLUBHOUSECONTRACTSCOMPLETE", 0)
		stats.set_int(MPX .. "CLUBHOUSECONTRACTEARNINGS", 0)
		stats.set_int(MPX .. "CLUBCHALLENGESCOMPLETED", 0)
		stats.set_int(MPX .. "MEMBERCHALLENGESCOMPLETED", 0)
		stats.set_int(MPX .. "GHKILLS", 0)
		stats.set_int(MPX .. "HORDELVL", 0)
		stats.set_int(MPX .. "HORDKILLS", 0)
		stats.set_int(MPX .. "UNIQUECRATES", 0)
		stats.set_int(MPX .. "BJWINS", 0)
		stats.set_int(MPX .. "HORDEWINS", 0)
		stats.set_int(MPX .. "MCMWINS", 0)
		stats.set_int(MPX .. "GANGHIDWINS", 0)
		stats.set_int(MPX .. "KILLS", 0)
		stats.set_int(MPX .. "HITS_PEDS_VEHICLES", 0)
		stats.set_int(MPX .. "SHOTS", 0)
		stats.set_int(MPX .. "HEADSHOTS", 0)
		stats.set_int(MPX .. "KILLS_ARMED", 0)
		stats.set_int(MPX .. "SUCCESSFUL_COUNTERS", 0)
		stats.set_int(MPX .. "KILLS_PLAYERS", 0)
		stats.set_int(MPX .. "DEATHS_PLAYER", 0)
		stats.set_int(MPX .. "KILLS_STEALTH", 0)
		stats.set_int(MPX .. "KILLS_INNOCENTS", 0)
		stats.set_int(MPX .. "KILLS_ENEMY_GANG_MEMBERS", 0)
		stats.set_int(MPX .. "KILLS_FRIENDLY_GANG_MEMBERS", 0)
		stats.set_int(MPX .. "KILLS_BY_OTHERS", 0)
		stats.set_int(MPX .. "BIGGEST_VICTIM_KILLS", 0)
		stats.set_int(MPX .. "ARCHENEMY_KILLS", 0)
		stats.set_int(MPX .. "KILLS_COP", 0)
		stats.set_int(MPX .. "KILLS_SWAT", 0)
		stats.set_int(MPX .. "STARS_ATTAINED", 0)
		stats.set_int(MPX .. "STARS_EVADED", 0)
		stats.set_int(MPX .. "VEHEXPORTED", 0)
		stats.set_int(MPX .. "TOTAL_NO_SHOPS_HELD_UP", 0)
		stats.set_int(MPX .. "CR_GANGATTACK_CITY", 0)
		stats.set_int(MPX .. "CR_GANGATTACK_COUNTRY", 0)
		stats.set_int(MPX .. "CR_GANGATTACK_LOST", 0)
		stats.set_int(MPX .. "CR_GANGATTACK_VAGOS", 0)
		stats.set_int(MPX .. "NO_NON_CONTRACT_RACE_WIN", 0)
		stats.set_int(MPX .. "DIED_IN_DROWNING", 0)
		stats.set_int(MPX .. "DIED_IN_DROWNINGINVEHICLE", 0)
		stats.set_int(MPX .. "DIED_IN_EXPLOSION", 0)
		stats.set_int(MPX .. "DIED_IN_FALL", 0)
		stats.set_int(MPX .. "DIED_IN_FIRE", 0)
		stats.set_int(MPX .. "DIED_IN_ROAD", 0)
		stats.set_int(MPX .. "GRENADE_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "MICROSMG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "SMG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "ASLTSMG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "CRBNRIFLE_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "ADVRIFLE_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "MG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "CMBTMG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "ASLTMG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "RPG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "PISTOL_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "PLAYER_HEADSHOTS", 0)
		stats.set_int(MPX .. "SAWNOFF_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "STKYBMB_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "UNARMED_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "SNIPERRFL_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "AWD_0_VEHICLES_BLOWNUP", 0)
		stats.set_int(MPX .. "CARS_EXPLODED", 0)
		stats.set_int(MPX .. "AWD_CAR_EXPORT", 0)
		stats.set_int(MPX .. "AWD_FMDRIVEWITHOUTCRASH", 0)
		stats.set_int(MPX .. "AWD_PASSENGERTIME", 0)
		stats.set_int(MPX .. "AWD_TIME_IN_HELICOPTER", 0)
		stats.set_int(MPX .. "AWD_VEHICLE_JUMP_OVER_0M", 0)
		stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
		stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
		stats.set_int(MPX .. "CHAR_FM_VEHICLE_1_UNLCK", 0)
		stats.set_int(MPX .. "CHAR_FM_VEHICLE_2_UNLCK", 0)
		stats.set_int(MPX .. "NO_CARS_REPAIR", 0)
		stats.set_int(MPX .. "VEHICLES_SPRAYED", 0)
		stats.set_int(MPX .. "NUMBER_NEAR_MISS_NOCRASH", 0)
		stats.set_int(MPX .. "USJS_FOUND", 0)
		stats.set_int(MPX .. "USJS_COMPLETED", 0)
		stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 0)
		stats.set_int(MPX .. "CRDEADLINE", 0)
		stats.set_int(MPX .. "FAVOUTFITBIKETIMECURRENT", 0)
		stats.set_int(MPX .. "FAVOUTFITBIKETIME1ALLTIME", 0)
		stats.set_int(MPX .. "FAVOUTFITBIKETYPECURRENT", 0)
		stats.set_int(MPX .. "FAVOUTFITBIKETYPEALLTIME", 0)
		stats.set_int(MPX .. "LONGEST_WHEELIE_DIST", 0)
		stats.set_int(MPX .. "RACES_WON", 0)
		stats.set_int(MPX .. "COUNT_HOTRING_RACE", 0)
		stats.set_int(MPX .. "AWD_0_HEADSHOTS", 0)
		stats.set_int(MPX .. "AWD_FMOVERALLKILLS", 0)
		stats.set_int(MPX .. "AWD_FMKILLBOUNTY", 0)
		stats.set_int(MPX .. "AWD_FM_DM_3KILLSAMEGUY", 0)
		stats.set_int(MPX .. "AWD_FM_DM_KILLSTREAK", 0)
		stats.set_int(MPX .. "AWD_FM_DM_STOLENKILL", 0)
		stats.set_int(MPX .. "AWD_FM_DM_TOTALKILLS", 0)
		stats.set_int(MPX .. "AWD_FMREVENGEKILLSDM", 0)
		stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 0)
		stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 0)
		stats.set_int(MPX .. "AWD_KILL_PSYCHOPATHS", 0)
		stats.set_int(MPX .. "AWD_TAKEDOWNSMUGPLANE", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_PISTOL", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_SMG", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_SHOTGUN", 0)
		stats.set_int(MPX .. "ASLTRIFLE_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_SNIPER", 0)
		stats.set_int(MPX .. "MG_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_STICKYBOMBS", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_GRENADES", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_ROCKETLAUNCH", 0)
		stats.set_int(MPX .. "AWD_0_KILLS_MELEE", 0)
		stats.set_int(MPX .. "AWD_CAR_BOMBS_ENEMY_KILLS", 0)
		stats.set_int(MPX .. "MELEEKILLS", 0)
		stats.set_int(MPX .. "HITS", 0)
		stats.set_int(MPX .. "DEATHS", 0)
		stats.set_int(MPX .. "HIGHEST_SKITTLES", 0)
		stats.set_int(MPX .. "NUMBER_NEAR_MISS", 0)
		stats.set_int(MPX .. "AWD_FINISH_HEISTS", 0)
		stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 0)
		stats.set_int(MPX .. "AWD_COMPLETE_HEIST_NOT_DIE", 0)
		stats.set_int(MPX .. "AWD_WIN_GOLD_MEDAL_HEISTS", 0)
		stats.set_int(MPX .. "AWD_DO_HEIST_AS_MEMBER", 0)
		stats.set_int(MPX .. "AWD_DO_HEIST_AS_THE_LEADER", 0)
		stats.set_int(MPX .. "AWD_CONTROL_CROWDS", 0)
		stats.set_int(MPX .. "HEIST_COMPLETION", 0)
		stats.set_int(MPX .. "HEISTS_ORGANISED", 0)
		stats.set_int(MPX .. "HEIST_START", 0)
		stats.set_int(MPX .. "HEIST_END", 0)
		stats.set_int(MPX .. "CUTSCENE_MID_PRISON", 0)
		stats.set_int(MPX .. "CUTSCENE_MID_HUMANE", 0)
		stats.set_int(MPX .. "CUTSCENE_MID_NARC", 0)
		stats.set_int(MPX .. "CUTSCENE_MID_ORNATE", 0)
		stats.set_int(MPX .. "CR_FLEECA_PREP_1", 0)
		stats.set_int(MPX .. "CR_FLEECA_PREP_2", 0)
		stats.set_int(MPX .. "CR_FLEECA_FINALE", 0)
		stats.set_int(MPX .. "CR_PRISON_PLANE", 0)
		stats.set_int(MPX .. "CR_PRISON_BUS", 0)
		stats.set_int(MPX .. "CR_PRISON_STATION", 0)
		stats.set_int(MPX .. "CR_PRISON_UNFINISHED_BIZ", 0)
		stats.set_int(MPX .. "CR_PRISON_FINALE", 0)
		stats.set_int(MPX .. "CR_HUMANE_KEY_CODES", 0)
		stats.set_int(MPX .. "CR_HUMANE_ARMORDILLOS", 0)
		stats.set_int(MPX .. "CR_HUMANE_EMP", 0)
		stats.set_int(MPX .. "CR_HUMANE_VALKYRIE", 0)
		stats.set_int(MPX .. "CR_HUMANE_FINALE", 0)
		stats.set_int(MPX .. "CR_NARC_COKE", 0)
		stats.set_int(MPX .. "CR_NARC_TRASH_TRUCK", 0)
		stats.set_int(MPX .. "CR_NARC_BIKERS", 0)
		stats.set_int(MPX .. "CR_NARC_WEED", 0)
		stats.set_int(MPX .. "CR_NARC_STEAL_METH", 0)
		stats.set_int(MPX .. "CR_NARC_FINALE", 0)
		stats.set_int(MPX .. "CR_PACIFIC_TRUCKS", 0)
		stats.set_int(MPX .. "CR_PACIFIC_WITSEC", 0)
		stats.set_int(MPX .. "CR_PACIFIC_HACK", 0)
		stats.set_int(MPX .. "CR_PACIFIC_BIKES", 0)
		stats.set_int(MPX .. "CR_PACIFIC_CONVOY", 0)
		stats.set_int(MPX .. "CR_PACIFIC_FINALE", 0)
		stats.set_int(MPX .. "HEIST_PLANNING_STAGE", 0)
		stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0)
		stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0)
		stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", 0)
		stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 0)
		stats.set_int(MPX .. "CR_GANGOP_MORGUE", 0)
		stats.set_int(MPX .. "CR_GANGOP_DELUXO", 0)
		stats.set_int(MPX .. "CR_GANGOP_SERVERFARM", 0)
		stats.set_int(MPX .. "CR_GANGOP_IAABASE_FIN", 0)
		stats.set_int(MPX .. "CR_GANGOP_STEALOSPREY", 0)
		stats.set_int(MPX .. "CR_GANGOP_FOUNDRY", 0)
		stats.set_int(MPX .. "CR_GANGOP_RIOTVAN", 0)
		stats.set_int(MPX .. "CR_GANGOP_SUBMARINECAR", 0)
		stats.set_int(MPX .. "CR_GANGOP_SUBMARINE_FIN", 0)
		stats.set_int(MPX .. "CR_GANGOP_PREDATOR", 0)
		stats.set_int(MPX .. "CR_GANGOP_BMLAUNCHER", 0)
		stats.set_int(MPX .. "CR_GANGOP_BCCUSTOM", 0)
		stats.set_int(MPX .. "CR_GANGOP_STEALTHTANKS", 0)
		stats.set_int(MPX .. "CR_GANGOP_SPYPLANE", 0)
		stats.set_int(MPX .. "CR_GANGOP_FINALE", 0)
		stats.set_int(MPX .. "CR_GANGOP_FINALE_P2", 0)
		stats.set_int(MPX .. "CR_GANGOP_FINALE_P3", 0)
		stats.set_int(MPX .. "AWD_DANCE_TO_SOLOMUN", 0)
		stats.set_int(MPX .. "AWD_DANCE_TO_TALEOFUS", 0)
		stats.set_int(MPX .. "AWD_DANCE_TO_DIXON", 0)
		stats.set_int(MPX .. "AWD_DANCE_TO_BLKMAD", 0)
		stats.set_int(MPX .. "AWD_CLUB_DRUNK", 0)
		stats.set_int(MPX .. "NIGHTCLUB_VIP_APPEAR", 0)
		stats.set_int(MPX .. "NIGHTCLUB_JOBS_DONE", 0)
		stats.set_int(MPX .. "NIGHTCLUB_EARNINGS", 0)
		stats.set_int(MPX .. "HUB_SALES_COMPLETED", 0)
		stats.set_int(MPX .. "HUB_EARNINGS", 0)
		stats.set_int(MPX .. "DANCE_COMBO_DURATION_MINS", 0)
		stats.set_int(MPX .. "NIGHTCLUB_PLAYER_APPEAR", 0)
		stats.set_int(MPX .. "LIFETIME_HUB_GOODS_SOLD", 0)
		stats.set_int(MPX .. "LIFETIME_HUB_GOODS_MADE", 0)
		stats.set_int(MPX .. "DANCEPERFECTOWNCLUB", 0)
		stats.set_int(MPX .. "NUMUNIQUEPLYSINCLUB", 0)
		stats.set_int(MPX .. "DANCETODIFFDJS", 0)
		stats.set_int(MPX .. "NIGHTCLUB_HOTSPOT_TIME_MS", 0)
		stats.set_int(MPX .. "NIGHTCLUB_CONT_TOTAL", 0)
		stats.set_int(MPX .. "NIGHTCLUB_CONT_MISSION", 0)
		stats.set_int(MPX .. "CLUB_CONTRABAND_MISSION", 0)
		stats.set_int(MPX .. "HUB_CONTRABAND_MISSION", 0)
		stats.set_int(MPX .. "ARN_BS_TRINKET_TICKERS", 0)
		stats.set_int(MPX .. "ARN_BS_TRINKET_SAVED", 0)
		stats.set_int(MPX .. "AWD_WATCH_YOUR_STEP", 0)
		stats.set_int(MPX .. "AWD_TOWER_OFFENSE", 0)
		stats.set_int(MPX .. "AWD_READY_FOR_WAR", 0)
		stats.set_int(MPX .. "AWD_THROUGH_A_LENS", 0)
		stats.set_int(MPX .. "AWD_SPINNER", 0)
		stats.set_int(MPX .. "AWD_YOUMEANBOOBYTRAPS", 0)
		stats.set_int(MPX .. "AWD_MASTER_BANDITO", 0)
		stats.set_int(MPX .. "AWD_SITTING_DUCK", 0)
		stats.set_int(MPX .. "AWD_CROWDPARTICIPATION", 0)
		stats.set_int(MPX .. "AWD_KILL_OR_BE_KILLED", 0)
		stats.set_int(MPX .. "AWD_MASSIVE_SHUNT", 0)
		stats.set_int(MPX .. "AWD_YOURE_OUTTA_HERE", 0)
		stats.set_int(MPX .. "AWD_WEVE_GOT_ONE", 0)
		stats.set_int(MPX .. "AWD_ARENA_WAGEWORKER", 0)
		stats.set_int(MPX .. "AWD_TIME_SERVED", 0)
		stats.set_int(MPX .. "AWD_TOP_SCORE", 0)
		stats.set_int(MPX .. "AWD_CAREER_WINNER", 0)
		stats.set_int(MPX .. "ARENAWARS_SP", 0)
		stats.set_int(MPX .. "ARENAWARS_SKILL_LEVEL", 0)
		stats.set_int(MPX .. "ARENAWARS_SP_LIFETIME", 0)
		stats.set_int(MPX .. "ARENAWARS_AP", 0)
		stats.set_int(MPX .. "ARENAWARS_AP_TIER", 0)
		stats.set_int(MPX .. "ARENAWARS_AP_LIFETIME", 0)
		stats.set_int(MPX .. "ARENAWARS_CARRER_UNLK", 0)
		stats.set_int(MPX .. "ARN_W_THEME_SCIFI", 0)
		stats.set_int(MPX .. "ARN_W_THEME_APOC", 0)
		stats.set_int(MPX .. "ARN_W_THEME_CONS", 0)
		stats.set_int(MPX .. "ARN_W_PASS_THE_BOMB", 0)
		stats.set_int(MPX .. "ARN_W_DETONATION", 0)
		stats.set_int(MPX .. "ARN_W_ARCADE_RACE", 0)
		stats.set_int(MPX .. "ARN_W_CTF", 0)
		stats.set_int(MPX .. "ARN_W_TAG_TEAM", 0)
		stats.set_int(MPX .. "ARN_W_DESTR_DERBY", 0)
		stats.set_int(MPX .. "ARN_W_CARNAGE", 0)
		stats.set_int(MPX .. "ARN_W_MONSTER_JAM", 0)
		stats.set_int(MPX .. "ARN_W_GAMES_MASTERS", 0)
		stats.set_int(MPX .. "ARN_L_PASS_THE_BOMB", 0)
		stats.set_int(MPX .. "ARN_L_DETONATION", 0)
		stats.set_int(MPX .. "ARN_L_ARCADE_RACE", 0)
		stats.set_int(MPX .. "ARN_L_CTF", 0)
		stats.set_int(MPX .. "ARN_L_TAG_TEAM", 0)
		stats.set_int(MPX .. "ARN_L_DESTR_DERBY", 0)
		stats.set_int(MPX .. "ARN_L_CARNAGE", 0)
		stats.set_int(MPX .. "ARN_L_MONSTER_JAM", 0)
		stats.set_int(MPX .. "ARN_L_GAMES_MASTERS", 0)
		stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 0)
		stats.set_int(MPX .. "ARN_SPECTATOR_KILLS", 0)
		stats.set_int(MPX .. "ARN_LIFETIME_KILLS", 0)
		stats.set_int(MPX .. "ARN_LIFETIME_DEATHS", 0)
		stats.set_int(MPX .. "ARENAWARS_CARRER_WINS", 0)
		stats.set_int(MPX .. "ARENAWARS_CARRER_WINT", 0)
		stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYD", 0)
		stats.set_int(MPX .. "ARENAWARS_MATCHES_PLYDT", 0)
		stats.set_int(MPX .. "ARN_SPEC_BOX_TIME_MS", 0)
		stats.set_int(MPX .. "ARN_SPECTATOR_DRONE", 0)
		stats.set_int(MPX .. "ARN_SPECTATOR_CAMS", 0)
		stats.set_int(MPX .. "ARN_SMOKE", 0)
		stats.set_int(MPX .. "ARN_DRINK", 0)
		stats.set_int(MPX .. "ARN_VEH_MONSTER", 0)
		stats.set_int(MPX .. "ARN_VEH_MONSTER", 0)
		stats.set_int(MPX .. "ARN_VEH_MONSTER", 0)
		stats.set_int(MPX .. "ARN_VEH_CERBERUS", 0)
		stats.set_int(MPX .. "ARN_VEH_CERBERUS2", 0)
		stats.set_int(MPX .. "ARN_VEH_CERBERUS3", 0)
		stats.set_int(MPX .. "ARN_VEH_BRUISER", 0)
		stats.set_int(MPX .. "ARN_VEH_BRUISER2", 0)
		stats.set_int(MPX .. "ARN_VEH_BRUISER3", 0)
		stats.set_int(MPX .. "ARN_VEH_SLAMVAN0", 0)
		stats.set_int(MPX .. "ARN_VEH_SLAMVAN5", 0)
		stats.set_int(MPX .. "ARN_VEH_SLAMVAN6", 0)
		stats.set_int(MPX .. "ARN_VEH_BRUTUS", 0)
		stats.set_int(MPX .. "ARN_VEH_BRUTUS2", 0)
		stats.set_int(MPX .. "ARN_VEH_BRUTUS3", 0)
		stats.set_int(MPX .. "ARN_VEH_SCARAB", 0)
		stats.set_int(MPX .. "ARN_VEH_SCARAB2", 0)
		stats.set_int(MPX .. "ARN_VEH_SCARAB3", 0)
		stats.set_int(MPX .. "ARN_VEH_DOMINATOR0", 0)
		stats.set_int(MPX .. "ARN_VEH_DOMINATOR5", 0)
		stats.set_int(MPX .. "ARN_VEH_DOMINATOR6", 0)
		stats.set_int(MPX .. "ARN_VEH_IMPALER2", 0)
		stats.set_int(MPX .. "ARN_VEH_IMPALER3", 0)
		stats.set_int(MPX .. "ARN_VEH_IMPALER0", 0)
		stats.set_int(MPX .. "ARN_VEH_ISSI0", 0)
		stats.set_int(MPX .. "ARN_VEH_ISSI5", 0)
		stats.set_int(MPX .. "ARN_VEH_ISSI", 0)
		stats.set_int(MPX .. "ARN_VEH_IMPERATOR", 0)
		stats.set_int(MPX .. "ARN_VEH_IMPERATOR2", 0)
		stats.set_int(MPX .. "ARN_VEH_IMPERATOR3", 0)
		stats.set_int(MPX .. "ARN_VEH_ZR30", 0)
		stats.set_int(MPX .. "ARN_VEH_ZR30", 0)
		stats.set_int(MPX .. "ARN_VEH_ZR0", 0)
		stats.set_int(MPX .. "ARN_VEH_DEATHBIKE", 0)
		stats.set_int(MPX .. "ARN_VEH_DEATHBIKE2", 0)
		stats.set_int(MPX .. "ARN_VEH_DEATHBIKE3", 0)
		stats.set_int(MPX .. "AWD_ODD_JOBS", 0)
		stats.set_int(MPX .. "VCM_FLOW_PROGRESS", 0)
		stats.set_int(MPX .. "VCM_STORY_PROGRESS", 5)
		stats.set_int(MPX .. "CAS_HEIST_NOTS", 0)
		stats.set_int(MPX .. "CAS_HEIST_FLOW", 0)
		stats.set_int(MPX .. "SIGNAL_JAMMERS_COLLECTED", 0)
		stats.set_int(MPX .. "AWD_PREPARATION", 0)
		stats.set_int(MPX .. "AWD_ASLEEPONJOB", 0)
		stats.set_int(MPX .. "AWD_DAICASHCRAB", 0)
		stats.set_int(MPX .. "AWD_BIGBRO", 0)
		stats.set_int(MPX .. "AWD_SHARPSHOOTER", 0)
		stats.set_int(MPX .. "AWD_RACECHAMP", 0)
		stats.set_int(MPX .. "AWD_BATSWORD", 0)
		stats.set_int(MPX .. "AWD_COINPURSE", 0)
		stats.set_int(MPX .. "AWD_ASTROCHIMP", 0)
		stats.set_int(MPX .. "AWD_MASTERFUL", 0)
		stats.set_int(MPX .. "H3_BOARD_DIALOGUE0", 0)
		stats.set_int(MPX .. "H3_BOARD_DIALOGUE1", 0)
		stats.set_int(MPX .. "H3_BOARD_DIALOGUE2", 0)
		stats.set_int(MPX .. "H3_VEHICLESUSED", 0)
		stats.set_int(MPX .. "H3_CR_STEALTH_1A", 0)
		stats.set_int(MPX .. "H3_CR_STEALTH_2B_RAPP", 0)
		stats.set_int(MPX .. "H3_CR_STEALTH_2C_SIDE", 0)
		stats.set_int(MPX .. "H3_CR_STEALTH_3A", 0)
		stats.set_int(MPX .. "H3_CR_STEALTH_0A", 0)
		stats.set_int(MPX .. "H3_CR_STEALTH_5A", 0)
		stats.set_int(MPX .. "H3_CR_SUBTERFUGE_1A", 0)
		stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2A", 0)
		stats.set_int(MPX .. "H3_CR_SUBTERFUGE_2B", 0)
		stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3A", 0)
		stats.set_int(MPX .. "H3_CR_SUBTERFUGE_3B", 0)
		stats.set_int(MPX .. "H3_CR_SUBTERFUGE_0A", 0)
		stats.set_int(MPX .. "H3_CR_SUBTERFUGE_5A", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_1A", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_2A1", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_2A2", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_2BP", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_2C", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_3A", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_0A", 0)
		stats.set_int(MPX .. "H3_CR_DIRECT_5A", 0)
		stats.set_int(MPX .. "CR_ORDER", 0)
		stats.set_int(MPX .. "AWD_PREPARATION", 0)
		stats.set_int(MPX .. "AWD_ASLEEPONJOB", 0)
		stats.set_int(MPX .. "AWD_DAICASHCRAB", 0)
		stats.set_int(MPX .. "AWD_BIGBRO", 0)
		stats.set_int(MPX .. "AWD_SHARPSHOOTER", 0)
		stats.set_int(MPX .. "AWD_RACECHAMP", 0)
		stats.set_int(MPX .. "AWD_BATSWORD", 0)
		stats.set_int(MPX .. "AWD_COINPURSE", 0)
		stats.set_int(MPX .. "AWD_ASTROCHIMP", 0)
		stats.set_int(MPX .. "AWD_MASTERFUL", 0)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_0", 0)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_1", 0)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_2", 0)
		stats.set_int(MPX .. "SCGW_NUM_WINS_GANG_3", 0)
		stats.set_int(MPX .. "CH_ARC_CAB_CLAW_TROPHY", 0)
		stats.set_int(MPX .. "CH_ARC_CAB_LOVE_TROPHY", 0)
		stats.set_int(MPX .. "IAP_MAX_MOON_DIST", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_0", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_1", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_2", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_3", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_0", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_5", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_6", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_7", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_8", 0)
		stats.set_int(MPX .. "SCGW_INITIALS_9", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_0",0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_1", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_2", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_3", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_4", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_5", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_6", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_7", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_8", 0)
		stats.set_int(MPX .. "FOOTAGE_INITIALS_9", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_0", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_1", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_2", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_3", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_0", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_5", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_6", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_7", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_8", 0)
		stats.set_int(MPX .. "FOOTAGE_SCORE_9", 0)
		stats.set_int(MPX .. "AWD_CAR_CLUB_MEM", 0)
		stats.set_int(MPX .. "AWD_SPRINTRACER", 0)
		stats.set_int(MPX .. "AWD_STREETRACER", 0)
		stats.set_int(MPX .. "AWD_PURSUITRACER", 0)
		stats.set_int(MPX .. "AWD_TEST_CAR", 0)
		stats.set_int(MPX .. "AWD_AUTO_SHOP", 0)	
		stats.set_int(MPX .. "AWD_GROUNDWORK", 0)
		stats.set_int(MPX .. "AWD_CAR_EXPORT", 0)
		stats.set_int(MPX .. "AWD_ROBBERY_CONTRACT", 0)
		stats.set_int(MPX .. "AWD_FACES_OF_DEATH", 0)
		stats.set_int(MPX .. "AWD_CONTRACTOR", 0)
		stats.set_int(MPX .. "AWD_COLD_CALLER", 0)
		stats.set_int(MPX .. "AWD_PRODUCER", 0)
		stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", 0)
		stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 0)
		stats.set_int(MPX .. "PAYPHONE_BONUS_KILL_METHOD", 0)
		stats.set_int(MPX .. "FIXER_GENERAL_BS", 0)
		stats.set_int(MPX .. "FIXER_COMPLETED_BS", 0)
		stats.set_int(MPX .. "FIXER_STORY_BS", 0)
		stats.set_int(MPX .. "FIXER_STORY_STRAND", 0)
		stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", 0)
		stats.set_int(MPX .. "FIXER_COUNT", 0)
		stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", 0)
		stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", 0)
		stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", 0)
		stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", 0)
		stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", 0)
		stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", 0)
		stats.set_int(MPX .. "FIXER_EARNINGS", 0)
		stats.set_int(MPX .. "AWD_LOSTANDFOUND", 0)
		stats.set_int(MPX .. "AWD_SUNSET", 0)
		stats.set_int(MPX .. "AWD_TREASURE_HUNTER", 0)
		stats.set_int(MPX .. "AWD_WRECK_DIVING", 0)
		stats.set_int(MPX .. "AWD_KEINEMUSIK", 0)
		stats.set_int(MPX .. "AWD_PALMS_TRAX", 0)
		stats.set_int(MPX .. "AWD_MOODYMANN", 0)
		stats.set_int(MPX .. "AWD_FILL_YOUR_BAGS", 0)
		stats.set_int(MPX .. "AWD_WELL_PREPARED", 0)
		stats.set_int(MPX .. "H0_H0_DJ_MISSIONS", 0)
		stats.set_int(MPX .. "H0CNF_APPROACH", 0)
		stats.set_int(MPX .. "H0_MISSIONS", 0)
		stats.set_int(MPX .. "H0_PLAYTHROUGH_STATUS", 0)
		stats.set_int("MPPLY_TOTAL_RACES_WON", 0)
		stats.set_int("MPPLY_TOTAL_RACES_LOST", 0)
		stats.set_int("MPPLY_TOTAL_CUSTOM_RACES_WON", 0)
		stats.set_int("MPPLY_TOTAL_DEATHMATCH_LOST", 0)
		stats.set_int("MPPLY_TOTAL_DEATHMATCH_WON", 0)
		stats.set_int("MPPLY_TOTAL_TDEATHMATCH_LOST", 0)
		stats.set_int("MPPLY_TOTAL_TDEATHMATCH_WON", 0)
		stats.set_int("MPPLY_SHOOTINGRANGE_WINS", 0)
		stats.set_int("MPPLY_SHOOTINGRANGE_LOSSES", 0)
		stats.set_int("MPPLY_TENNIS_MATCHES_WON", 0)
		stats.set_int("MPPLY_TENNIS_MATCHES_LOST", 0)
		stats.set_int("MPPLY_GOLF_WINS", 0)
		stats.set_int("MPPLY_GOLF_LOSSES", 0)
		stats.set_int("MPPLY_DARTS_TOTAL_WINS", 0)
		stats.set_int("MPPLY_DARTS_TOTAL_MATCHES", 0)
		stats.set_int("MPPLY_SHOOTINGRANGE_TOTAL_MATCH", 0)
		stats.set_int("MPPLY_BJ_WINS", 0)
		stats.set_int("MPPLY_BJ_LOST", 0)
		stats.set_int("MPPLY_RACE_2_POINT_WINS", 0)
		stats.set_int("MPPLY_RACE_2_POINT_LOST", 0)
		stats.set_int("MPPLY_KILLS_PLAYERS", 0)
		stats.set_int("MPPLY_DEATHS_PLAYER", 0)
		stats.set_int("MPPLY_MISSIONS_CREATED", 0)
		stats.set_int("MPPLY_LTS_CREATED", 0)
		stats.set_int("MPPLY_FM_MISSION_LIKES", 0)
		stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", 0)
		stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", 0)
		stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", 0)
		stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", 0)
		stats.set_int("MPPLY_HEIST_ACH_TRACKER", 0)
		stats.set_int("MPPLY_WIN_GOLD_MEDAL_HEISTS", 0)
		stats.set_int("MPPLY_GANGOPS_ALLINORDER", 0)
		stats.set_int("MPPLY_GANGOPS_LOYALTY", 0)
		stats.set_int("MPPLY_GANGOPS_CRIMMASMD", 0)
		stats.set_int("MPPLY_GANGOPS_LOYALTY2", 0)
		stats.set_int("MPPLY_GANGOPS_LOYALTY3", 0)
		stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", 0)
		stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", 0)
		stats.set_int("MPPLY_GANGOPS_SUPPORT", 0)
		for i = 2, 19 do stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH"..i, 0) end
		for j = 1, 19 do stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_"..j.."_UNLCK", 0) end
		for m = 1, 01 do stats.set_int(MPX .. "CHAR_KIT_"..m.."_FM_UNLCK", 0) end
		for l = 2, 01 do stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE"..l, 0) end
		for i = 0, 9 do stats.set_int(MPX .. "IAP_INITIALS_"..i, 0) 
	        stats.set_int(MPX .. "IAP_SCORE_"..i, 0) 
		stats.set_int(MPX .. "IAP_SCORE_"..i, 0) 
		stats.set_int(MPX .. "SCGW_SCORE_"..i, 0) 
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_"..i, 0) 
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_"..i, 0) 
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_"..i, 0) 
		stats.set_int(MPX .. "DG_MONKEY_SCORE_"..i, 0) 
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_"..i, 0) 
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_"..i, 0) 
		stats.set_int(MPX .. "GGSM_INITIALS_"..i, 0) 
		stats.set_int(MPX .. "GGSM_SCORE_"..i, 0) 
		stats.set_int(MPX .. "TWR_INITIALS_"..i, 0) 
		stats.set_int(MPX .. "TWR_SCORE_"..i, 0) end 
		stats.set_bool(MPX .. "AWD_FMKILL3ANDWINGTARACE", false)
		stats.set_bool(MPX .. "AWD_FMWINCUSTOMRACE", false)
		stats.set_bool(MPX .. "CL_RACE_MODDED_CAR", false)
		stats.set_bool(MPX .. "AWD_FMRACEWORLDRECHOLDER", false)
		stats.set_bool(MPX .. "AWD_FMWINALLRACEMODES", false)
		stats.set_bool(MPX .. "AWD_FM_TENNIS_5_SET_WINS", false)
		stats.set_bool(MPX .. "AWD_FM_TENNIS_STASETWIN", false)
		stats.set_bool(MPX .. "AWD_FM_SHOOTRANG_GRAN_WON", false)
		stats.set_bool(MPX .. "AWD_FMWINEVERYGAMEMODE", false)
		stats.set_bool(MPX .. "AWD_FM0DIFFERENTDM", false)
		stats.set_bool(MPX .. "AWD_FM0DIFFERENTRACES", false)
		stats.set_bool(MPX .. "AWD_FMATTGANGHQ", false)
		stats.set_bool(MPX .. "AWD_FM6DARTCHKOUT", false)
		stats.set_bool(MPX .. "AWD_FM_GOLF_HOLE_IN_1", false)
		stats.set_bool(MPX .. "AWD_FMPICKUPDLCCRATE1ST", false)
		stats.set_bool(MPX .. "AWD_FM0DIFITEMSCLOTHES", false)
		stats.set_bool(MPX .. "AWD_BUY_EVERY_GUN", false)
		stats.set_bool(MPX .. "AWD_DRIVELESTERCAR5MINS", false)
		stats.set_bool(MPX .. "AWD_FMTATTOOALLBODYPARTS", false)
		stats.set_bool(MPX .. "AWD_STORE_0_CAR_IN_GARAGES", false)
		stats.set_bool(MPX .. "AWD_DAILYOBJWEEKBONUS", false)
		stats.set_bool(MPX .. "AWD_DAILYOBJMONTHBONUS", false)
		stats.set_bool(MPX .. "CL_DRIVE_RALLY", false)
		stats.set_bool(MPX .. "CL_PLAY_GTA_RACE", false)
		stats.set_bool(MPX .. "CL_PLAY_BOAT_RACE", false)
		stats.set_bool(MPX .. "CL_PLAY_FOOT_RACE", false)
		stats.set_bool(MPX .. "CL_PLAY_TEAM_DM", false)
		stats.set_bool(MPX .. "CL_PLAY_VEHICLE_DM", false)
		stats.set_bool(MPX .. "CL_PLAY_MISSION_CONTACT", false)
		stats.set_bool(MPX .. "CL_PLAY_A_PLAYLIST", false)
		stats.set_bool(MPX .. "CL_PLAY_POINT_TO_POINT", false)
		stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_DM", false)
		stats.set_bool(MPX .. "CL_PLAY_ONE_ON_ONE_RACE", false)
		stats.set_bool(MPX .. "CL_SURV_A_BOUNTY", false)
		stats.set_bool(MPX .. "CL_SET_WANTED_LVL_ON_PLAY", false)
		stats.set_bool(MPX .. "CL_GANG_BACKUP_GANGS", false)
		stats.set_bool(MPX .. "CL_GANG_BACKUP_LOST", false)
		stats.set_bool(MPX .. "CL_GANG_BACKUP_VAGOS", false)
		stats.set_bool(MPX .. "CL_CALL_MERCENARIES", false)
		stats.set_bool(MPX .. "CL_PHONE_MECH_DROP_CAR", false)
		stats.set_bool(MPX .. "CL_GONE_OFF_RADAR", false)
		stats.set_bool(MPX .. "CL_FILL_TITAN", false)
		stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", false)
		stats.set_bool(MPX .. "CL_MOD_CAR_USING_APP", false)
		stats.set_bool(MPX .. "CL_BUY_INSURANCE", false)
		stats.set_bool(MPX .. "CL_BUY_GARAGE", false)
		stats.set_bool(MPX .. "CL_ENTER_FRIENDS_HOUSE", false)
		stats.set_bool(MPX .. "CL_CALL_STRIPPER_HOUSE", false)
		stats.set_bool(MPX .. "CL_CALL_FRIEND", false)
		stats.set_bool(MPX .. "CL_SEND_FRIEND_REQUEST", false)
		stats.set_bool(MPX .. "CL_W_WANTED_PLAYER_TV", false)
		stats.set_bool(MPX .. "FM_INTRO_CUT_DONE", false)
		stats.set_bool(MPX .. "FM_INTRO_MISS_DONE", false)
		stats.set_bool(MPX .. "SHOOTINGRANGE_SEEN_TUT", false)
		stats.set_bool(MPX .. "TENNIS_SEEN_TUTORIAL", false)
		stats.set_bool(MPX .. "DARTS_SEEN_TUTORIAL", false)
		stats.set_bool(MPX .. "ARMWRESTLING_SEEN_TUTORIAL", false)
		stats.set_bool(MPX .. "HAS_WATCHED_BENNY_CUTSCE", false)
		stats.set_bool(MPX .. "AWD_FMFURTHESTWHEELIE", false)
		stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", false)
		stats.set_bool(MPX .. "AWD_FMKILLSTREAKSDM", false)
		stats.set_bool(MPX .. "AWD_FMMOSTKILLSGANGHIDE", false)
		stats.set_bool(MPX .. "AWD_FMMOSTKILLSSURVIVE", false)
		stats.set_bool(MPX .. "AWD_FINISH_HEIST_NO_DAMAGE", false)
		stats.set_bool(MPX .. "AWD_SPLIT_HEIST_TAKE_EVENLY", false)
		stats.set_bool(MPX .. "AWD_ACTIVATE_2_PERSON_KEY", false)
		stats.set_bool(MPX .. "AWD_ALL_ROLES_HEIST", false)
		stats.set_bool(MPX .. "HEIST_PLANNING_DONE_PRINT", false)
		stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_0", false)
		stats.set_bool(MPX .. "HEIST_PLANNING_DONE_HELP_1", false)
		stats.set_bool(MPX .. "HEIST_PRE_PLAN_DONE_HELP_0", false)
		stats.set_bool(MPX .. "HEIST_CUTS_DONE_FINALE", false)
		stats.set_bool(MPX .. "HEIST_IS_TUTORIAL", false)
		stats.set_bool(MPX .. "HEIST_STRAND_INTRO_DONE", false)
		stats.set_bool(MPX .. "HEIST_CUTS_DONE_ORNATE", false)
		stats.set_bool(MPX .. "HEIST_CUTS_DONE_PRISON", false)
		stats.set_bool(MPX .. "HEIST_CUTS_DONE_BIOLAB", false)
		stats.set_bool(MPX .. "HEIST_CUTS_DONE_NARCOTIC", false)
		stats.set_bool(MPX .. "HEIST_CUTS_DONE_TUTORIAL", false)
		stats.set_bool(MPX .. "HEIST_AWARD_DONE_PREP", false)
		stats.set_bool(MPX .. "HEIST_AWARD_BOUGHT_IN", false)
		stats.set_bool(MPX .. "AWD_MATCHING_OUTFIT_HEIST", false)
		stats.set_bool(MPX .. "AWD_CLUB_HOTSPOT", false)
		stats.set_bool(MPX .. "AWD_CLUB_CLUBBER", false)
		stats.set_bool(MPX .. "AWD_CLUB_COORD", false)
		stats.set_bool(MPX .. "AWD_BEGINNER", false)
		stats.set_bool(MPX .. "AWD_FIELD_FILLER", false)
		stats.set_bool(MPX .. "AWD_ARMCHAIR_RACER", false)
		stats.set_bool(MPX .. "AWD_LEARNER", false)
		stats.set_bool(MPX .. "AWD_SUNDAY_DRIVER", false)
		stats.set_bool(MPX .. "AWD_THE_ROOKIE", false)
		stats.set_bool(MPX .. "AWD_BUMP_AND_RUN", false)
		stats.set_bool(MPX .. "AWD_GEAR_HEAD", false)
		stats.set_bool(MPX .. "AWD_DOOR_SLAMMER", false)
		stats.set_bool(MPX .. "AWD_HOT_LAP", false)
		stats.set_bool(MPX .. "AWD_ARENA_AMATEUR", false)
		stats.set_bool(MPX .. "AWD_PAINT_TRADER", false)
		stats.set_bool(MPX .. "AWD_SHUNTER", false)
		stats.set_bool(MPX .. "AWD_JOCK", false)
		stats.set_bool(MPX .. "AWD_WARRIOR", false)
		stats.set_bool(MPX .. "AWD_T_BONE", false)
		stats.set_bool(MPX .. "AWD_MAYHEM", false)
		stats.set_bool(MPX .. "AWD_WRECKER", false)
		stats.set_bool(MPX .. "AWD_CRASH_COURSE", false)
		stats.set_bool(MPX .. "AWD_ARENA_LEGEND", false)
		stats.set_bool(MPX .. "AWD_PEGASUS", false)
		stats.set_bool(MPX .. "AWD_UNSTOPPABLE", false)
		stats.set_bool(MPX .. "AWD_CONTACT_SPORT", false)
		stats.set_bool(MPX .. "AWD_FIRST_TIME1", false)
		stats.set_bool(MPX .. "AWD_FIRST_TIME2", false)
		stats.set_bool(MPX .. "AWD_FIRST_TIME3", false)
		stats.set_bool(MPX .. "AWD_FIRST_TIME0", false)
		stats.set_bool(MPX .. "AWD_FIRST_TIME5", false)
		stats.set_bool(MPX .. "AWD_FIRST_TIME6", false)
		stats.set_bool(MPX .. "AWD_ALL_IN_ORDER", false)
		stats.set_bool(MPX .. "AWD_SUPPORTING_ROLE", false)
		stats.set_bool(MPX .. "AWD_LEADER", false)
		stats.set_bool(MPX .. "AWD_SURVIVALIST", false)
                Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD")
                if Paragon == false 
                then stats.set_bool(MPX .. "CAS_VEHICLE_REWARD",false)
                else stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false) end
	 	stats.set_bool(MPX .. "AWD_SCOPEOUT", false)
		stats.set_bool(MPX .. "AWD_CREWEDUP", false)
		stats.set_bool(MPX .. "AWD_MOVINGON", false)
		stats.set_bool(MPX .. "AWD_PROMOCAMP", false)
		stats.set_bool(MPX .. "AWD_GUNMAN", false)
		stats.set_bool(MPX .. "AWD_SMASHNGRAB", false)
		stats.set_bool(MPX .. "AWD_INPLAINSI", false)
		stats.set_bool(MPX .. "AWD_UNDETECTED", false)
		stats.set_bool(MPX .. "AWD_ALLROUND", false)
		stats.set_bool(MPX .. "AWD_ELITETHEIF", false)
		stats.set_bool(MPX .. "AWD_PRO", false)
		stats.set_bool(MPX .. "AWD_SUPPORTACT", false)
		stats.set_bool(MPX .. "AWD_SHAFTED", false)
		stats.set_bool(MPX .. "AWD_COLLECTOR", false)
		stats.set_bool(MPX .. "AWD_DEADEYE", false)
		stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", false)
		stats.set_bool(MPX .. "AWD_TRAFFICAVOI", false)
		stats.set_bool(MPX .. "AWD_CANTCATCHBRA", false)
		stats.set_bool(MPX .. "AWD_WIZHARD", false)
		stats.set_bool(MPX .. "AWD_APEESCAPE", false)
		stats.set_bool(MPX .. "AWD_MONKEYKIND", false)
		stats.set_bool(MPX .. "AWD_AQUAAPE", false)
		stats.set_bool(MPX .. "AWD_KEEPFAITH", false)
		stats.set_bool(MPX .. "AWD_falseLOVE", false)
		stats.set_bool(MPX .. "AWD_NEMESIS", false)
		stats.set_bool(MPX .. "AWD_FRIENDZONED", false)
		stats.set_bool(MPX .. "VCM_FLOW_CS_RSC_SEEN", false)
		stats.set_bool(MPX .. "VCM_FLOW_CS_BWL_SEEN", false)
		stats.set_bool(MPX .. "VCM_FLOW_CS_MTG_SEEN", false)
		stats.set_bool(MPX .. "VCM_FLOW_CS_OIL_SEEN", false)
		stats.set_bool(MPX .. "VCM_FLOW_CS_DEF_SEEN", false)
		stats.set_bool(MPX .. "VCM_FLOW_CS_FIN_SEEN", false)
		stats.set_bool(MPX .. "HELP_FURIA", false)
		stats.set_bool(MPX .. "HELP_MINITAN", false)
		stats.set_bool(MPX .. "HELP_YOSEMITE2", false)
		stats.set_bool(MPX .. "HELP_ZHABA", false)
		stats.set_bool(MPX .. "HELP_IMORGEN", false)
		stats.set_bool(MPX .. "HELP_SULTAN2", false)
		stats.set_bool(MPX .. "HELP_VAGRANT", false)
		stats.set_bool(MPX .. "HELP_VSTR", false)
		stats.set_bool(MPX .. "HELP_STRYDER", false)
		stats.set_bool(MPX .. "HELP_SUGOI", false)
		stats.set_bool(MPX .. "HELP_KANJO", false)
		stats.set_bool(MPX .. "HELP_FORMULA", false)
		stats.set_bool(MPX .. "HELP_FORMULA2", false)
		stats.set_bool(MPX .. "HELP_JB0", false)
		stats.set_bool(MPX .. "AWD_SCOPEOUT", false)
		stats.set_bool(MPX .. "AWD_CREWEDUP", false)
		stats.set_bool(MPX .. "AWD_MOVINGON", false)
		stats.set_bool(MPX .. "AWD_PROMOCAMP", false)
		stats.set_bool(MPX .. "AWD_GUNMAN", false)
		stats.set_bool(MPX .. "AWD_SMASHNGRAB", false)
		stats.set_bool(MPX .. "AWD_INPLAINSI", false)
		stats.set_bool(MPX .. "AWD_UNDETECTED", false)
		stats.set_bool(MPX .. "AWD_ALLROUND", false)
		stats.set_bool(MPX .. "AWD_ELITETHEIF", false)
		stats.set_bool(MPX .. "AWD_PRO", false)
		stats.set_bool(MPX .. "AWD_SUPPORTACT", false)
		stats.set_bool(MPX .. "AWD_SHAFTED", false)
		stats.set_bool(MPX .. "AWD_COLLECTOR", false)
		stats.set_bool(MPX .. "AWD_DEADEYE", false)
		stats.set_bool(MPX .. "AWD_PISTOLSATDAWN", false)
		stats.set_bool(MPX .. "AWD_TRAFFICAVOI", false)
		stats.set_bool(MPX .. "AWD_CANTCATCHBRA", false)
		stats.set_bool(MPX .. "AWD_WIZHARD", false)
		stats.set_bool(MPX .. "AWD_APEESCAP", false)
		stats.set_bool(MPX .. "AWD_MONKEYKIND", false)
		stats.set_bool(MPX .. "AWD_AQUAAPE", false)
		stats.set_bool(MPX .. "AWD_KEEPFAITH", false)
		stats.set_bool(MPX .. "AWD_falseLOVE", false)
		stats.set_bool(MPX .. "AWD_NEMESIS", false)
		stats.set_bool(MPX .. "AWD_FRIENDZONED", false)
		stats.set_bool(MPX .. "IAP_CHALLENGE_0", false)
		stats.set_bool(MPX .. "IAP_CHALLENGE_1", false)
		stats.set_bool(MPX .. "IAP_CHALLENGE_2", false)
		stats.set_bool(MPX .. "IAP_CHALLENGE_3", false)
		stats.set_bool(MPX .. "IAP_CHALLENGE_0", false)
		stats.set_bool(MPX .. "IAP_GOLD_TANK", false)
		stats.set_bool(MPX .. "SCGW_WON_NO_DEATHS", false)
		stats.set_bool(MPX .. "AWD_KINGOFQUB3D", false)
		stats.set_bool(MPX .. "AWD_QUBISM", false)
		stats.set_bool(MPX .. "AWD_QUIBITS", false)
		stats.set_bool(MPX .. "AWD_GODOFQUB3D", false)
		stats.set_bool(MPX .. "AWD_ELEVENELEVEN", false)
		stats.set_bool(MPX .. "AWD_GOFOR11TH", false)
		stats.set_bool(MPX .. "AWD_INTELGATHER", false)
		stats.set_bool(MPX .. "AWD_COMPOUNDINFILT", false)
		stats.set_bool(MPX .. "AWD_LOOT_FINDER", false)
		stats.set_bool(MPX .. "AWD_MAX_DISRUPT", false)
		stats.set_bool(MPX .. "AWD_THE_ISLAND_HEIST", false)
		stats.set_bool(MPX .. "AWD_GOING_ALONE", false)
		stats.set_bool(MPX .. "AWD_TEAM_WORK", false)
		stats.set_bool(MPX .. "AWD_MIXING_UP", false)
		stats.set_bool(MPX .. "AWD_TEAM_WORK", false)
		stats.set_bool(MPX .. "AWD_MIXING_UP", false)
		stats.set_bool(MPX .. "AWD_PRO_THIEF", false)
		stats.set_bool(MPX .. "AWD_CAT_BURGLAR", false)
		stats.set_bool(MPX .. "AWD_ONE_OF_THEM", false)
		stats.set_bool(MPX .. "AWD_GOLDEN_GUN", false)
		stats.set_bool(MPX .. "AWD_ELITE_THIEF", false)
		stats.set_bool(MPX .. "AWD_PROFESSIONAL", false)
		stats.set_bool(MPX .. "AWD_HELPING_OUT", false)
		stats.set_bool(MPX .. "AWD_COURIER", false)
		stats.set_bool(MPX .. "AWD_PARTY_VIBES", false)
		stats.set_bool(MPX .. "AWD_HELPING_HAND", false)
		stats.set_bool(MPX .. "AWD_ELEVENELEVEN", false)
		stats.set_bool(MPX .. "COMPLETE_H0_F_USING_VETIR", false)
		stats.set_bool(MPX .. "COMPLETE_H0_F_USING_LONGFIN", false)
		stats.set_bool(MPX .. "COMPLETE_H0_F_USING_ANNIH", false)
		stats.set_bool(MPX .. "COMPLETE_H0_F_USING_ALKONOS", false)
		stats.set_bool(MPX .. "COMPLETE_H0_F_USING_PATROLB", false)
		stats.set_bool(MPX .. "AWD_CAR_CLUB", false)
		stats.set_bool(MPX .. "AWD_PRO_CAR_EXPORT", false)
		stats.set_bool(MPX .. "AWD_UNION_DEPOSITORY", false)
		stats.set_bool(MPX .. "AWD_MILITARY_CONVOY", false)
		stats.set_bool(MPX .. "AWD_FLEECA_BANK", false)
		stats.set_bool(MPX .. "AWD_FREIGHT_TRAIN", false)
		stats.set_bool(MPX .. "AWD_BOLINGBROKE_ASS", false)
		stats.set_bool(MPX .. "AWD_IAA_RAID", false)
		stats.set_bool(MPX .. "AWD_METH_JOB", false)
		stats.set_bool(MPX .. "AWD_BUNKER_RAID", false)
		stats.set_bool(MPX .. "AWD_STRAIGHT_TO_VIDEO", false)
		stats.set_bool(MPX .. "AWD_MONKEY_C_MONKEY_DO", false)
		stats.set_bool(MPX .. "AWD_TRAINED_TO_KILL", false)
		stats.set_bool(MPX .. "AWD_DIRECTOR", false)
		stats.set_bool(MPX .. "AWD_TEEING_OFF", false)
		stats.set_bool(MPX .. "AWD_PARTY_NIGHT", false)
		stats.set_bool(MPX .. "AWD_BILLIONAIRE_GAMES", false)
		stats.set_bool(MPX .. "AWD_HOOD_PASS", false)
		stats.set_bool(MPX .. "AWD_STUDIO_TOUR", false)
		stats.set_bool(MPX .. "AWD_DONT_MESS_DRE", false)
		stats.set_bool(MPX .. "AWD_BACKUP", false)
		stats.set_bool(MPX .. "AWD_SHORTFRANK_1", false)
		stats.set_bool(MPX .. "AWD_SHORTFRANK_2", false)
		stats.set_bool(MPX .. "AWD_SHORTFRANK_3", false)
		stats.set_bool(MPX .. "AWD_CONTR_KILLER", false)
		stats.set_bool(MPX .. "AWD_DOGS_BEST_FRIEND", false)
		stats.set_bool(MPX .. "AWD_MUSIC_STUDIO", false)
		stats.set_bool(MPX .. "AWD_SHORTLAMAR_1", false)
		stats.set_bool(MPX .. "AWD_SHORTLAMAR_2", false)
		stats.set_bool(MPX .. "AWD_SHORTLAMAR_3", false)
		stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_0", false)
		stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_1", false)
		stats.set_bool(MPX .. "BS_FRANKLIN_DIALOGUE_2", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_SETUP", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_STRAND", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_2", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_PARTY_F", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_2", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_BILL_F", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_2", false)
		stats.set_bool(MPX .. "BS_IMANI_D_APP_HOOD_F", false)
		stats.set_bool("MPPLY_AWD_FLEECA_FIN", false)
		stats.set_bool("MPPLY_AWD_PRISON_FIN", false)
		stats.set_bool("MPPLY_AWD_HUMANE_FIN", false)
		stats.set_bool("MPPLY_AWD_SERIESA_FIN", false)
		stats.set_bool("MPPLY_AWD_PACIFIC_FIN", false)
		stats.set_bool("MPPLY_AWD_HST_ORDER", false)
		stats.set_bool("MPPLY_AWD_COMPLET_HEIST_MEM", false)
		stats.set_bool("MPPLY_AWD_COMPLET_HEIST_1STPER", false)
		stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", false)
		stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_IAA", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_SUBMARINE", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_MISSILE", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_ALLINORDER", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY2", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY3", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD2", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD3", false)
		stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", false) end)
	
	AMenu:add_action("", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

tempMenu = CSU:add_submenu("Temporary Unlocks")

tempMenu:add_toggle("Unlock Hats", function() return globals.get_boolean(HA1) end, function(value) 
for i = HA1, HA2 
do 
globals.set_boolean(i,value) end 
globals.set_boolean(HA3,value) 
globals.set_boolean(HA4,value) 
globals.set_boolean(HA5,value) 
globals.set_boolean(HA6,value) 
globals.set_boolean(HA7,value) 
globals.set_boolean(HA8,value) 
globals.set_boolean(HA9,value) 
globals.set_boolean(HA10,value) 
globals.set_boolean(HA11,value) 
globals.set_boolean(HA12,value) 
end)

tempMenu:add_toggle("Unlock Brand Shirts", function() return globals.get_boolean(BS1) end, function(value) 
for i = BS1, BS2 
do 
globals.set_boolean(i,value) end 
for j = BS3, BS4 
do 
globals.set_boolean(j,value) end 
for k = BS5, BS6 
do 
globals.set_boolean(k,value) end 
for l = BS7, BS8 
do 
globals.set_boolean(l,value) end 
globals.set_boolean(BS9,value) 
globals.set_boolean(BS10,value) 
globals.set_boolean(BS11,value) 
globals.set_boolean(BS12,value) 
globals.set_boolean(BS13,value) 
end)

tempMenu:add_toggle("Unlock Knock Offs T-shirts", function() return globals.get_boolean(KT1) end, function(value) 
for i = KT1, KT2 
do 
globals.set_boolean(i,value) end end)

tempMenu:add_toggle("Unlock Manufactures Clothing", function() return globals.get_boolean(MC1) end, function(value) 
globals.set_boolean(MC1,value) 
for i = MC2, MC3 
do 
globals.set_boolean(i,value) end 
for j = MC4, MC5 
do 
globals.set_boolean(j,value) end end)

tempMenu:add_toggle("Unlock Movie Shirts", function() return globals.get_boolean(MS1) end, function(value) 
globals.set_boolean(MS3,value) 
for i = MS1, MS2 
do 
globals.set_boolean(i,value) end 
for j = MS4, MS5 
do 
globals.set_boolean(j,value) end end)

tempMenu:add_toggle("Unlock Radio Station T-shirts", function() return globals.get_boolean(RS1) end, function(value) 
globals.set_boolean(RS1,value) 
globals.set_boolean(RS2,value) 
globals.set_boolean(RS3,value) 
globals.set_boolean(RS4,value) 
globals.set_boolean(RS5,value) 
globals.set_boolean(RS6,value) 
globals.set_boolean(RS7,value) 
for i = RS8, RS9 
do 
globals.set_boolean(i,value) end end)

tempMenu:add_toggle("Unlock Clubs T-shirts", function() return globals.get_boolean(CT1) end, function(value) 
for i = CT1, CT2 
do 
globals.set_boolean(i,value) end end)

tempMenu:add_toggle("Unlock Shirts", function() return globals.get_boolean(SH1) end, function(value) 
globals.set_boolean(SH1,value) 
globals.set_boolean(SH2,value) 
globals.set_boolean(SH3,value) 
globals.set_boolean(SH4,value) 
globals.set_boolean(SH5,value) 
globals.set_boolean(SH6,value) 
globals.set_boolean(SH7,value) 
globals.set_boolean(SH8,value) 
globals.set_boolean(SH9,value) 
globals.set_boolean(SH10,value) 
globals.set_boolean(SH11,value) 
globals.set_boolean(SH12,value) 
for i = HO8, SH13 
do 
globals.set_boolean(i,value) end end)

tempMenu:add_toggle("Arcade and Casino Clothing", function() return globals.get_boolean(AR1) end, function(value) 
for i = AR1, AR2 
do 
globals.set_boolean(i,value) end end)

tempMenu:add_int_range("Get All Clothing", 1, 1, 4, function() return 1 end, function(CltH)
	if CltH == 1 then
 stats.set_int(MPX .. "DCTL_WINS", 500)
 stats.set_int(MPX .. "DCTL_PLAY_COUNT", 750)
 stats.set_bool(MPX .. "FILM4SHIRTUNLOCK", true)
 stats.set_bool(MPX .. "FILM5SHIRTUNLOCK", true)
 stats.set_bool(MPX .. "FILM6SHIRTUNLOCK", true)
 stats.set_bool(MPX .. "FILM7SHIRTUNLOCK", true)
 stats.set_bool(MPX .. "FILM8SHIRTUNLOCK", true)
 stats.set_bool(MPX .. "FILM9SHIRTUNLOCK", true)
 stats.set_bool(MPX .. "ACCOUNTANTSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "UNLOCK_RACE_HIPSTER_TSHIRT", true)
 stats.set_bool(MPX .. "UNLOCK_DM_HIPSTER_TSHIRT", true)
 stats.set_bool(MPX .. "UNLOCK_HIPSTER_TSHIRT_DOG", true)
 stats.set_bool(MPX .. "UNLOCK_HIPSTER_TSHIRT_VINYL", true)
 stats.set_bool(MPX .. "UNLOCK_HIPSTER_TSHIRT_MESS", true)
 stats.set_bool(MPX .. "BAHAMAMAMASHIRTUNLOCK", true)
 stats.set_bool(MPX .. "DRONESHIRTUNLOCK", true)
 stats.set_bool(MPX .. "GROTTISHIRTUNLOCK", true)
 stats.set_bool(MPX .. "GOLFSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "MAISONETTESHIRTUNLOCK", true)
 stats.set_bool(MPX .. "MANOPAUSESHIRTUNLOCK", true)
 stats.set_bool(MPX .. "MELTDOWNSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "PACIFICBLUFFSSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "PROLAPSSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "TENNISSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "TOESHOESSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "VANILLAUNICORNSHIRTUNLOCK", true)
 stats.set_bool(MPX .. "MARLOWESHIRTUNLOCK", true)
 stats.set_bool(MPX .. "CRESTSHIRTUNLOCK", true)
	for i = 0, 250 do
 stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_"..i, -1)
	end
	elseif CltH == 2 then
	for i = 1, 6 do
 for k = 1, 10 do
 for j = 1, 7 do
 stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_DECL", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_OUTFIT", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL2", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL2_1", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_TORSO", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_TEETH", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_TEETH_1", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_TEETH_2", -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_"..i, -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_"..j, -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_"..j, -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_"..j, -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_"..j, -1)
 stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_"..k, -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_DECL", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_OUTFIT", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL2", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL2_1", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_TEETH", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_TEETH_1", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_TEETH_2", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_TORSO", -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_"..j, -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_"..j, -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_"..j, -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_"..j, -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_"..j, -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_"..j, -1)
 stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_"..k, -1)
 stats.set_int(MPX .. "CLTHS_USED_HAIR", -1)
 stats.set_int(MPX .. "CLTHS_USED_HAIR_"..j, -1)
 stats.set_int(MPX .. "CLTHS_USED_JBIB", -1)
 stats.set_int(MPX .. "CLTHS_USED_JBIB_"..j, -1)
 stats.set_int(MPX .. "CLTHS_USED_LEGS", -1)
 stats.set_int(MPX .. "CLTHS_USED_LEGS_"..j, -1)
 stats.set_int(MPX .. "CLTHS_USED_FEET", -1)
 stats.set_int(MPX .. "CLTHS_USED_FEET_"..j, -1)
 stats.set_int(MPX .. "CLTHS_USED_BERD", -1)
 stats.set_int(MPX .. "CLTHS_USED_BERD_"..j, -1)
 stats.set_int(MPX .. "CLTHS_USED_PROPS", -1)
 stats.set_int(MPX .. "CLTHS_USED_PROPS_"..k, -1)
 stats.set_int(MPX .. "CLTHS_USED_OUTFIT", -1)
 stats.set_int(MPX .. "CLTHS_USED_TORSO", -1)
 stats.set_int(MPX .. "CLTHS_USED_SPECIAL", -1)
 stats.set_int(MPX .. "CLTHS_USED_SPECIAL_"..j, -1)
 stats.set_int(MPX .. "CLTHS_USED_SPECIAL2", -1)
 stats.set_int(MPX .. "CLTHS_USED_SPECIAL2_1", -1)
 stats.set_int(MPX .. "CLTHS_USED_DECL", -1)
 stats.set_int(MPX .. "CLTHS_USED_TEETH", -1)
 stats.set_int(MPX .. "CLTHS_USED_TEETH_1", -1)
 stats.set_int(MPX .. "CLTHS_USED_TEETH_2", -1)
end
end
end
	elseif CltH == 3 then
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_1_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_2_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_3_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_4_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_5_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_6_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_7_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_8_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_9_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_10_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_11_UNLCK", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_1_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_2_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_3_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_4_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_5_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_6_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_7_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_8_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_9_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_10_OWNED", -1)
 stats.set_int(MPX .. "CHAR_FM_CLOTHES_11_OWNED", -1)
	for i = 0, 250 do
 stats.set_int(MPX .. "DLC_APPAREL_USED_"..i, -1)
	end
elseif CltH == 4 then
	for i = 1, 40 do
 stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_"..i, -1)
 stats.set_int(MPX .. "ADMIN_CLOTHES_RM_BS_"..i, -1)
	end
end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	ANote = AMenu:add_submenu("Read Me")
	
	ANote:add_action("    	 Unlocking «After Hours» awards will ", function() end)
	ANote:add_action("  cause a transaction error multiple times;", function() end)
	ANote:add_action("       Some awards can be temporarily", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CharMenu = Self:add_submenu("Character Stats Editor Menu")

	CharMenu:add_action("Max Skills One Click", function() 
			stats.set_int(MPX .. "SCRIPT_INCREASE_DRIV", 100) 
			stats.set_int(MPX .. "SCRIPT_INCREASE_FLY", 100) 
			stats.set_int(MPX .. "SCRIPT_INCREASE_LUNG", 100) 
			stats.set_int(MPX .. "SCRIPT_INCREASE_SHO", 100) 
			stats.set_int(MPX .. "SCRIPT_INCREASE_STAM", 100) 
			stats.set_int(MPX .. "SCRIPT_INCREASE_STL", 100) 
			stats.set_int(MPX .. "SCRIPT_INCREASE_STRN", 100)
			stats.set_int(MPX .. "WHEELIE_ABILITY", 100) 
			stats.set_int(MPX .. "FLYING_ABILITY", 100) 
			stats.set_int(MPX .. "LUNG_CAPACITY", 100) 
			stats.set_int(MPX .. "SHOOTING_ABILITY", 100) 
			stats.set_int(MPX .. "STAMINA", 100) 
			stats.set_int(MPX .. "STEALTH_ABILITY", 100) 
			stats.set_int(MPX .. "STRENGTH", 100) end)
	
	CharMenu:add_int_range("Stamina", 1, 0, 100, function() return stats.get_int(MPX .. "STAMINA") end, function(Stam) stats.set_int(MPX .. "SCRIPT_INCREASE_STAM", 0) sleep(5) stats.set_int(MPX .. "SCRIPT_INCREASE_STAM", Stam - stats.get_int(MPX .. "STAMINA")) end)
	CharMenu:add_int_range("Shooting", 1, 0, 100, function() return stats.get_int(MPX .. "SHOOTING_ABILITY") end, function(Sho) stats.set_int(MPX .. "SCRIPT_INCREASE_SHO", 0) sleep(5) stats.set_int(MPX .. "SCRIPT_INCREASE_SHO", Sho - stats.get_int(MPX .. "SHOOTING_ABILITY")) end)
	CharMenu:add_int_range("Strength", 1, 0, 100, function() return stats.get_int(MPX .. "STRENGTH") end, function(Strn) stats.set_int(MPX .. "SCRIPT_INCREASE_STRN", 0) sleep(5) stats.set_int(MPX .. "SCRIPT_INCREASE_STRN", Strn - stats.get_int(MPX .. "STRENGTH")) end)
	CharMenu:add_int_range("Stealth", 1, 0, 100, function() return stats.get_int(MPX .. "STEALTH_ABILITY") end, function(Stl) stats.set_int(MPX .. "SCRIPT_INCREASE_STL", 0) sleep(5) stats.set_int(MPX .. "SCRIPT_INCREASE_STL", Stl - stats.get_int(MPX .. "STEALTH_ABILITY")) end)
	CharMenu:add_int_range("Flying", 1, 0, 100, function() return stats.get_int(MPX .. "FLYING_ABILITY") end, function(Fly) stats.set_int(MPX .. "SCRIPT_INCREASE_FLY", 0) sleep(5) stats.set_int(MPX .. "SCRIPT_INCREASE_FLY", Fly - stats.get_int(MPX .. "FLYING_ABILITY")) end)
	CharMenu:add_int_range("Driving", 1, 0, 100, function() return stats.get_int(MPX .. "WHEELIE_ABILITY") end, function(Driv) stats.set_int(MPX .. "SCRIPT_INCREASE_DRIV", 0) sleep(5) stats.set_int(MPX .. "SCRIPT_INCREASE_DRIV", Driv - stats.get_int(MPX .. "WHEELIE_ABILITY")) end)
	CharMenu:add_int_range("Swimming", 1, 0, 100, function() return stats.get_int(MPX .. "LUNG_CAPACITY") end, function(Lung) stats.set_int(MPX .. "SCRIPT_INCREASE_LUNG", 0) sleep(5) stats.set_int(MPX .. "SCRIPT_INCREASE_LUNG", stats.get_int(MPX .. "LUNG_CAPACITY")) end)
	CharMenu:add_float_range("Mental State", 1, 0, 100, function() return stats.get_float(MPX .. "PLAYER_MENTAL_STATE") end, function(Ment) stats.set_float(MPX .. "PLAYER_MENTAL_STATE", Ment) end)
	
	CharMenu:add_action("", function() end)
	
---Facilities Unlocks Section---

	FUMenu = FAUT:add_submenu("Facilities Unlocks")
					
	
	LSCMenu = FUMenu:add_submenu("LS Customs")

         L7negWepMenu = FUMenu:add_submenu("Unlock Guns Menu")
	
	LSCMenu:add_action("Unlock All", function()
			stats.set_int(MPX .. "CHAR_FM_CARMOD_1_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_CARMOD_2_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_CARMOD_3_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_CARMOD_4_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_CARMOD_5_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_CARMOD_6_UNLCK", -1)
			stats.set_int(MPX .. "CHAR_FM_CARMOD_7_UNLCK", -1)
			stats.set_int(MPX .. "AWD_WIN_CAPTURES", 50)
			stats.set_int(MPX .. "AWD_DROPOFF_CAP_PACKAGES", 100)
			stats.set_int(MPX .. "AWD_KILL_CARRIER_CAPTURE", 100)
			stats.set_int(MPX .. "AWD_FINISH_HEISTS", 50)
			stats.set_int(MPX .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
			stats.set_int(MPX .. "AWD_NIGHTVISION_KILLS", 100)
			stats.set_int(MPX .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
			stats.set_int(MPX .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
			stats.set_int(MPX .. "AWD_FMRALLYWONDRIVE", 25)
			stats.set_int(MPX .. "AWD_FMRALLYWONNAV", 25)
			stats.set_int(MPX .. "AWD_FMWINSEARACE", 25)
			stats.set_int(MPX .. "AWD_RACES_WON", 50)
			stats.set_int(MPX .. "MOST_FLIPS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "MOST_SPINS_IN_ONE_JUMP", 5)
			stats.set_int(MPX .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
			stats.set_int(MPX .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
			stats.set_int(MPX .. "RACES_WON", 50)
			stats.set_int(MPX .. "USJS_COMPLETED", 50)
			stats.set_int(MPX .. "USJS_FOUND", 50)
			stats.set_int(MPX .. "USJS_TOTAL_COMPLETED", 50)
			stats.set_int(MPX .. "AWD_FM_GTA_RACES_WON", 50)
			stats.set_int(MPX .. "AWD_FM_RACE_LAST_FIRST", 25)
			stats.set_int(MPX .. "AWD_FM_RACES_FASTEST_LAP", 50)
			stats.set_int(MPX .. "AWD_FMBASEJMP", 25)
			stats.set_int(MPX .. "AWD_FMWINAIRRACE", 25)
			stats.set_int(MPX .. "TOTAL_RACES_WON", 50) end)
	
	LSCMenu:add_action("", function() end)
	
	LSCNote = LSCMenu:add_submenu("Read Me")
	
	LSCNote:add_action("      Some colors may not be saved", function() end)
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	CSU:add_action("", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

     L7NEG6 = Self:add_submenu("LSCM Unlocker Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 local enable = false
 local speed = 2
 local function up()
 if not enable
 then return end
 local newpos = localplayer:get_position() + vector3(0,0,speed)
 if not localplayer:is_in_vehicle()
 then localplayer:set_position(newpos)
 else vehicle=localplayer:get_current_vehicle()
 vehicle:set_position(newpos) end end
 local function down()
 if not enable then
 return end
 local newpos = localplayer:get_position() + vector3(0,0,speed * -1)
 if not localplayer:is_in_vehicle() then
 localplayer:set_position(newpos)
 else vehicle=localplayer:get_current_vehicle()
 vehicle:set_position(newpos) end end
 local function forward()
 if not enable then
 return end
 local dir = localplayer:get_heading()
 local newpos = localplayer:get_position() + (dir * speed)
 if not localplayer:is_in_vehicle() then
 localplayer:set_position(newpos)
 else vehicle=localplayer:get_current_vehicle()
 vehicle:set_position(newpos) end end
 local function backward()
 if not enable then
 return end
 local dir = localplayer:get_heading()
 local newpos = localplayer:get_position() + (dir * speed * -1)
 if not localplayer:is_in_vehicle() then
 localplayer:set_position(newpos)
 else vehicle=localplayer:get_current_vehicle()
 vehicle:set_position(newpos) end end
 local function turnleft()
 if not enable then
 return end
 local dir = localplayer:get_rotation()
 if not localplayer:is_in_vehicle()
 then localplayer:set_rotation(dir + vector3(0.25,0,0))
 else vehicle=localplayer:get_current_vehicle()
 vehicle:set_rotation(dir + vector3(0.25,0,0)) end end
 local function turnright()
 if not enable then return end
 local dir = localplayer:get_rotation()
 if not localplayer:is_in_vehicle()
 then localplayer:set_rotation(dir + vector3(0.25 * -1,0,0))
 else vehicle=localplayer:get_current_vehicle()
 vehicle:set_rotation(dir + vector3(0.25 * -1,0,0)) end end
 local function increasespeed() speed = speed + 1 end
 local function decreasespeed() speed = speed - 1 end
 local up_hotkey
 local down_hotkey
 local forward_hotkey
 local backward_hotkey
 local turnleft_hotkey
 local turnright_hotkey
 local increasespeed_hotkey
 local decreasespeed_hotkey
 local function NoClip(e)
 if not localplayer then
 return end
 if e then
 localplayer:set_freeze_momentum(true)
 localplayer:set_no_ragdoll(true)
 localplayer:set_config_flag(292,true)
 up_hotkey = menu.register_hotkey(go_up, up)
 down_hotkey = menu.register_hotkey(go_down, down)
 forward_hotkey = menu.register_hotkey(go_forward, forward)
 backward_hotkey = menu.register_hotkey(go_back, backward)
 turnleft_hotkey = menu.register_hotkey(turn_left, turnleft)
 turnright_hotkey = menu.register_hotkey(turn_right, turnright)
 increasespeed_hotkey = menu.register_hotkey(inc_speed, increasespeed)
 decreasespeed_hotkey = menu.register_hotkey(dec_speed, decreasespeed)
 else
 localplayer:set_freeze_momentum(false)
 localplayer:set_no_ragdoll(false)
 localplayer:set_config_flag(292,false)
 menu.remove_hotkey(up_hotkey)
 menu.remove_hotkey(down_hotkey)
 menu.remove_hotkey(forward_hotkey)
 menu.remove_hotkey(backward_hotkey)
 menu.remove_hotkey(turnleft_hotkey)
 menu.remove_hotkey(turnright_hotkey)
 menu.remove_hotkey(increasespeed_hotkey)
 menu.remove_hotkey(decreasespeed_hotkey) end
 end 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

pedMenu = Self:add_submenu("Change Player Model Menu")
local PedModelAnimal = {}
PedModelAnimal[joaat("a_c_cat_01")] = "Cat" 
PedModelAnimal[joaat("a_c_chimp")] = "Chimp Black"
PedModelAnimal[joaat("a_c_chop")] = "Chop"
PedModelAnimal[joaat("a_c_cow")] = "Cow"
PedModelAnimal[joaat("a_c_coyote")] = "Coyote"
PedModelAnimal[joaat("a_c_deer")] = "Deer"
PedModelAnimal[joaat("a_c_husky")] = "Husky"
PedModelAnimal[joaat("a_c_mtlion")] = "Mountian Lion"
PedModelAnimal[joaat("a_c_panther")] = "Panther"
PedModelAnimal[joaat("a_c_pig")] = "Pig"
PedModelAnimal[joaat("a_c_poodle")] = "Poodle"
PedModelAnimal[joaat("a_c_pug")] = "Pug"
PedModelAnimal[joaat("a_c_rabbit_01")] = "Rabbit"
PedModelAnimal[joaat("a_c_rat")] = "Rat"
PedModelAnimal[joaat("a_c_retriever")] = "Retriever"
PedModelAnimal[joaat("a_c_rhesus")] = "Rhesus Monkey"
PedModelAnimal[joaat("a_c_rottweiler")] = "Rottweiler"
PedModelAnimal[joaat("a_c_shepherd")] = "Shepherd"
PedModelAnimal[joaat("a_c_westy")] = "Westy"
local PedModelSeaAnimal = {}
PedModelSeaAnimal[joaat("a_c_dolphin")] = "Dolphin"
PedModelSeaAnimal[joaat("a_c_fish")] = "Fish"
PedModelSeaAnimal[joaat("a_c_stingray")] = "Sting Ray"
PedModelSeaAnimal[joaat("a_c_sharktiger")] = "Tiger Shark"
PedModelSeaAnimal[joaat("a_c_humpback")] = "Humpback"
PedModelSeaAnimal[joaat("a_c_sharkhammer")] = "Hammer Shark"
PedModelSeaAnimal[joaat("a_c_killerwhale")] = "Killer Whale"
local PedModelBird = {}
PedModelBird[joaat("a_c_seagull")] = "Seagull"
PedModelBird[joaat("a_c_pigeon")] = "Pigeon"
PedModelBird[joaat("a_c_crow")] = "Crow"
PedModelBird[joaat("a_c_hen")] = "Hen"
PedModelBird[joaat("a_c_cormorant")] = "Cormorant"
PedModelBird[joaat("a_c_chickenhawk")] = "Hawk Eagle"
local PedModel1 = {}
PedModel1[joaat("player_one")] = "Franklin"
PedModel1[joaat("player_two")] = "Trevor"
PedModel1[joaat("player_zero")] = "Michael"
PedModel1[joaat("a_f_m_beach_01")] = "a_f_m_beach_01"
PedModel1[joaat("a_f_m_bevhill")] = "a_f_m_bevhill"
PedModel1[joaat("a_f_m_bevhills_02")] = "Ponsonbys Cashier"
PedModel1[joaat("a_f_m_bodybuild_01")] =  "a_f_m_bodybuild_01"
PedModel1[joaat("a_f_m_business_02")] = "a_f_m_business_02"
PedModel1[joaat("a_f_m_downtown_01")] = "a_f_m_downtown_01"
PedModel1[joaat("a_f_m_eastsa_01")] = "a_f_m_eastsa_01"
PedModel1[joaat("a_f_m_eastsa_02")] = "a_f_m_eastsa_02"
PedModel1[joaat("a_f_m_fatbla_01")] = "a_f_m_fatbla_01"
PedModel1[joaat("a_f_m_fatcult_01")] = "a_f_m_fatcult_01"
PedModel1[joaat("a_f_m_fatwhite_01")] = "a_f_m_fatwhite_01"
PedModel1[joaat("a_f_m_ktown_01")] = "a_f_m_ktown_01"
PedModel1[joaat("a_f_m_ktown_02")] = "a_f_m_ktown_02"
PedModel1[joaat("a_f_m_prolhost_01")] = "a_f_m_prolhost_01"
PedModel1[joaat("a_f_m_salton_01")] = "a_f_m_salton_01"
PedModel1[joaat("a_f_m_skidrow_01")] = "a_f_m_skidrow_01"
PedModel1[joaat("a_f_m_soucent_01")] = "a_f_m_soucent_01"
PedModel1[joaat("a_f_m_soucent_02")] = "a_f_m_soucent_02"
PedModel1[joaat("a_f_m_soucentmc_01")] = "a_f_m_soucentmc_01"
PedModel1[joaat("a_f_m_tourist_01")] = "a_f_m_tourist_01"
PedModel1[joaat("a_f_m_tramp_01")] = "a_f_m_tramp_01"
PedModel1[joaat("a_f_m_trampbeac_01")] = "a_f_m_trampbeac_01"
PedModel1[joaat("a_f_o_genstreet_01")] = "a_f_o_genstreet_01"
PedModel1[joaat("a_f_o_indian_01")] = "a_f_o_indian_01"
PedModel1[joaat("a_f_o_ktown_01")] = "a_f_o_ktown_01"
PedModel1[joaat("a_f_o_salton_01")] = "a_f_o_salton_01"
PedModel1[joaat("a_f_o_soucent_01")] = "a_f_o_soucent_01"
PedModel1[joaat("a_f_o_soucent_02")] = "a_f_o_soucent_02"
PedModel1[joaat("a_f_y_beach_01")] = "a_f_y_beach_01"
PedModel1[joaat("a_f_y_beach_02")] = "a_f_y_beach_02"
PedModel1[joaat("a_f_y_bevhills_01")] = "a_f_y_bevhills_01"
PedModel1[joaat("a_f_y_bevhills_02")] = "a_f_y_bevhills_02"
PedModel1[joaat("a_f_y_bevhills_03")] = "a_f_y_bevhills_03"
PedModel1[joaat("a_f_y_bevhills_04")] = "a_f_y_bevhills_04"
PedModel1[joaat("a_f_y_bevhills_05")] = "a_f_y_bevhills_05"
PedModel1[joaat("a_f_y_business_01")] = "a_f_y_business_01"
PedModel1[joaat("a_f_y_business_02")] = "a_f_y_business_02"
PedModel1[joaat("a_f_y_business_03")] = "a_f_y_business_03"
PedModel1[joaat("a_f_y_business_04")] = "a_f_y_business_04"
PedModel1[joaat("a_f_y_clubcust_01")] = "a_f_y_clubcust_01"
PedModel1[joaat("a_f_y_clubcust_02")] = "a_f_y_clubcust_02"
PedModel1[joaat("a_f_y_clubcust_03")] = "a_f_y_clubcust_03"
PedModel1[joaat("a_f_y_clubcust_04")] = "a_f_y_clubcust_04"
PedModel1[joaat("a_f_y_eastsa_01")] = "a_f_y_eastsa_01"
PedModel1[joaat("a_f_y_eastsa_02")] = "a_f_y_eastsa_02"
PedModel1[joaat("a_f_y_eastsa_03")] = "a_f_y_eastsa_03"
PedModel1[joaat("a_f_y_epsilon_01")] = "a_f_y_epsilon_01"
PedModel1[joaat("a_f_y_femaleagent")] = "a_f_y_femaleagent"
PedModel1[joaat("a_f_y_fitness_01")] = "a_f_y_fitness_01"
PedModel1[joaat("a_f_y_fitness_02")] = "a_f_y_fitness_02"
PedModel1[joaat("a_f_y_gencaspat_01")] = "a_f_y_gencaspat_01"
PedModel1[joaat("a_f_y_genhot_01")] = "a_f_y_genhot_01"
PedModel1[joaat("a_f_y_golfer_01")] = "a_f_y_golfer_01"
PedModel1[joaat("a_f_y_hiker_01")] = "a_f_y_hiker_01"
PedModel1[joaat("a_f_y_hippie_01")] = "a_f_y_hippie_01"
PedModel1[joaat("a_f_y_hipster_01")] = "a_f_y_hipster_01"
PedModel1[joaat("a_f_y_hipster_02")] = "Binco Cashier"
PedModel1[joaat("a_f_y_hipster_03")] = "a_f_y_hipster_03"
PedModel1[joaat("a_f_y_hipster_04")] = "a_f_y_hipster_04"
PedModel1[joaat("a_f_y_indian_01")] = "a_f_y_indian_01"
PedModel1[joaat("a_f_y_juggalo_01")] = "a_f_y_juggalo_01"
PedModel1[joaat("a_f_y_runner_01")] = "a_f_y_runner_01"
PedModel1[joaat("a_f_y_rurmeth_01")] = "a_f_y_rurmeth_01"
PedModel1[joaat("a_f_y_scdressy_01")] = "a_f_y_scdressy_01"
PedModel1[joaat("a_f_y_skater_01")] = "a_f_y_skater_01"
PedModel1[joaat("a_f_y_smartcaspat_01")] = "a_f_y_smartcaspat_01"
PedModel1[joaat("a_f_y_soucent_01")] = "a_f_y_soucent_01"
PedModel1[joaat("a_f_y_soucent_02")] = "a_f_y_soucent_02"
PedModel1[joaat("a_f_y_soucent_03")] = "a_f_y_soucent_03"
PedModel1[joaat("a_f_y_tennis_01")] = "a_f_y_tennis_01"
PedModel1[joaat("a_f_y_topless_01")] = "a_f_y_topless_01"
PedModel1[joaat("a_f_y_tourist_01")] = "a_f_y_tourist_01"
PedModel1[joaat("a_f_y_tourist_02")] = "a_f_y_tourist_02"
PedModel1[joaat("a_f_y_vinewood_01")] = "a_f_y_vinewood_01"
PedModel1[joaat("a_f_y_vinewood_02")] = "a_f_y_vinewood_02"
PedModel1[joaat("a_f_y_vinewood_03")] = "a_f_y_vinewood_03"
PedModel1[joaat("a_f_y_vinewood_04")] = "a_f_y_vinewood_04"
PedModel1[joaat("a_f_y_yoga_01")] = "a_f_y_yoga_01"
PedModel1[joaat("a_m_m_acult_01")] = "a_m_m_acult_01"
PedModel1[joaat("a_m_m_afriamer_01")] = "a_m_m_afriamer_01"
PedModel1[joaat("a_m_m_beach_01")] = "a_m_m_beach_01"
PedModel1[joaat("a_m_m_beach_02")] = "a_m_m_beach_02"
PedModel1[joaat("a_m_m_bevhills_01")] = "a_m_m_bevhills_01"
PedModel1[joaat("a_m_m_bevhills_02")] = "a_m_m_bevhills_02"
PedModel1[joaat("a_m_m_business_01")] = "a_m_m_business_01"
PedModel1[joaat("a_m_m_eastsa_01")] = "a_m_m_eastsa_01"
PedModel1[joaat("a_m_m_eastsa_02")] = "a_m_m_eastsa_02"
PedModel1[joaat("a_m_m_farmer_01")] = "a_m_m_farmer_01"
PedModel1[joaat("a_m_m_fatlatin_01")] = "a_m_m_fatlatin_01"
PedModel1[joaat("a_m_m_genfat_01")] = "a_m_m_genfat_01"
PedModel1[joaat("a_m_m_genfat_02")] = "a_m_m_genfat_02"
PedModel1[joaat("a_m_m_golfer_01")] = "a_m_m_golfer_01"
PedModel1[joaat("a_m_m_hasjew_01")] = "a_m_m_hasjew_01"
PedModel1[joaat("a_m_m_hillbilly_01")] = "a_m_m_hillbilly_01"
PedModel1[joaat("a_m_m_hillbilly_02")] = "a_m_m_hillbilly_02"
PedModel1[joaat("a_m_m_indian_01")] = "a_m_m_indian_01"
PedModel1[joaat("a_m_m_ktown_01")] = "a_m_m_ktown_01"
PedModel1[joaat("a_m_m_malibu_01")] = "a_m_m_malibu_01"
PedModel1[joaat("a_m_m_mexcntry_01")] = "a_m_m_mexcntry_01"
PedModel1[joaat("a_m_m_mexlabor_01")] = "a_m_m_mexlabor_01"
PedModel1[joaat("a_m_m_mlcrisis_01")] = "a_m_m_mlcrisis_01"
PedModel1[joaat("a_m_m_og_boss_01")] = "a_m_m_og_boss_01"
PedModel1[joaat("a_m_m_paparazzi_01")] = "a_m_m_paparazzi_01"
PedModel1[joaat("a_m_m_polynesian_01")] = "a_m_m_polynesian_01"
PedModel1[joaat("a_m_m_prolhost_01")] = "a_m_m_prolhost_01"
PedModel1[joaat("a_m_m_rurmeth_01")] = "a_m_m_rurmeth_01"
PedModel1[joaat("a_m_m_salton_01")] = "a_m_m_salton_01"
PedModel1[joaat("a_m_m_salton_02")] = "a_m_m_salton_02"
PedModel1[joaat("a_m_m_salton_03")] = "a_m_m_salton_03"
PedModel1[joaat("a_m_m_salton_04")] = "a_m_m_salton_04"
PedModel1[joaat("a_m_m_skater_01")] = "a_m_m_skater_01"
PedModel1[joaat("a_m_m_skidrow_01")] = "a_m_m_skidrow_01"
PedModel1[joaat("a_m_m_socenlat_01")] = "a_m_m_socenlat_01"
PedModel1[joaat("a_m_m_soucent_01")] = "a_m_m_soucent_01"
PedModel1[joaat("a_m_m_soucent_02")] = "a_m_m_soucent_02"
PedModel1[joaat("a_m_m_soucent_03")] = "a_m_m_soucent_03"
PedModel1[joaat("a_m_m_soucent_04")] = "a_m_m_soucent_04"
PedModel1[joaat("a_m_m_stlat_02")] = "a_m_m_stlat_02"
PedModel1[joaat("a_m_m_tennis_01")] = "a_m_m_tennis_01"
PedModel1[joaat("a_m_m_tourist_01")] = "a_m_m_tourist_01"
PedModel1[joaat("a_m_m_tramp_01")] = "a_m_m_tramp_01"
PedModel1[joaat("a_m_m_trampbeac_01")] = "a_m_m_trampbeac_01"
PedModel1[joaat("a_m_m_tranvest_01")] = "a_m_m_tranvest_01"
PedModel1[joaat("a_m_m_tranvest_02")] = "a_m_m_tranvest_02"
PedModel1[joaat("a_m_o_acult_01")] = "a_m_o_acult_01"
PedModel1[joaat("a_m_o_acult_02")] = "a_m_o_acult_02"
PedModel1[joaat("a_m_o_beach_01")] = "a_m_o_beach_01"
PedModel1[joaat("a_m_o_beach_02")] = "a_m_o_beach_02"
PedModel1[joaat("a_m_o_genstreet_01")] = "a_m_o_genstreet_01"
PedModel1[joaat("a_m_o_ktown_01")] = "a_m_o_ktown_01"
PedModel1[joaat("a_m_o_salton_01")] = "a_m_o_salton_01"
PedModel1[joaat("a_m_o_soucent_01")] = "a_m_o_soucent_01"
PedModel1[joaat("a_m_o_soucent_02")] = "a_m_o_soucent_02"
PedModel1[joaat("a_m_o_soucent_03")] = "a_m_o_soucent_03"
PedModel1[joaat("a_m_o_tramp_01")] = "a_m_o_tramp_01"
PedModel1[joaat("a_m_y_acult_01")] = "a_m_y_acult_01"
PedModel1[joaat("a_m_y_acult_02")] = "a_m_y_acult_02"
PedModel1[joaat("a_m_y_beach_01")] = "a_m_y_beach_01"
PedModel1[joaat("a_m_y_beach_02")] = "a_m_y_beach_02"
PedModel1[joaat("a_m_y_beach_03")] = "a_m_y_beach_03"
PedModel1[joaat("a_m_y_beach_04")] = "a_m_y_beach_04"
PedModel1[joaat("a_m_y_beachvesp_01")] = "a_m_y_beachvesp_01"
PedModel1[joaat("a_m_y_beachvesp_02")] = "a_m_y_beachvesp_02"
PedModel1[joaat("a_m_y_bevhills_01")] = "a_m_y_bevhills_01"
PedModel1[joaat("a_m_y_bevhills_02")] = "a_m_y_bevhills_02"
PedModel1[joaat("a_m_y_breakdance_01")] = "a_m_y_breakdance_01"
PedModel1[joaat("a_m_y_busicas_01")] = "a_m_y_busicas_01"
PedModel1[joaat("a_m_y_business_01")] = "a_m_y_business_01"
PedModel1[joaat("a_m_y_business_02")] = "a_m_y_business_02"
PedModel1[joaat("a_m_y_business_03")] = "a_m_y_business_03"
PedModel1[joaat("a_m_y_clubcust_01")] = "a_m_y_clubcust_01"
PedModel1[joaat("a_m_y_clubcust_02")] = "a_m_y_clubcust_02"
PedModel1[joaat("a_m_y_clubcust_03")] = "a_m_y_clubcust_03"
PedModel1[joaat("a_m_y_clubcust_04")] = "a_m_y_clubcust_04"
PedModel1[joaat("a_m_y_cyclist_01")] = "a_m_y_cyclist_01"
PedModel1[joaat("a_m_y_dhill_01")] = "a_m_y_dhill_01"
PedModel1[joaat("a_m_y_downtown_01")] = "a_m_y_downtown_01"
PedModel1[joaat("a_m_y_eastsa_01")] = "a_m_y_eastsa_01"
PedModel1[joaat("a_m_y_eastsa_02")] = "a_m_y_eastsa_02"
PedModel1[joaat("a_m_y_epsilon_01")] = "a_m_y_epsilon_01"
PedModel1[joaat("a_m_y_epsilon_02")] = "a_m_y_epsilon_02"
PedModel1[joaat("a_m_y_gay_01")] = "a_m_y_gay_01"
PedModel1[joaat("a_m_y_gay_02")] = "a_m_y_gay_02"
PedModel1[joaat("a_m_y_gencaspat_01")] = "a_m_y_gencaspat_01"
PedModel1[joaat("a_m_y_genstreet_01")] = "a_m_y_genstreet_01"
PedModel1[joaat("a_m_y_genstreet_02")] = "a_m_y_genstreet_02"
PedModel1[joaat("a_m_y_golfer_01")] = "a_m_y_golfer_01"
PedModel1[joaat("a_m_y_hasjew_01")] = "a_m_y_hasjew_01"
PedModel1[joaat("a_m_y_hiker_01")] = "a_m_y_hiker_01"
PedModel1[joaat("a_m_y_hippy_01")] = "a_m_y_hippy_01"
PedModel1[joaat("a_m_y_hipster_01")] = "a_m_y_hipster_01"
PedModel1[joaat("a_m_y_hipster_02")] = "a_m_y_hipster_02"
PedModel1[joaat("a_m_y_hipster_03")] = "a_m_y_hipster_03"
PedModel1[joaat("a_m_y_indian_01")] = "a_m_y_indian_01"
PedModel1[joaat("a_m_y_jetski_01")] = "a_m_y_jetski_01"
PedModel1[joaat("a_m_y_juggalo_01")] = "a_m_y_juggalo_01"
PedModel1[joaat("a_m_y_ktown_01")] = "a_m_y_ktown_01"
PedModel1[joaat("a_m_y_ktown_02")] = "a_m_y_ktown_02"
PedModel1[joaat("a_m_y_latino_01")] = "a_m_y_latino_01"
PedModel1[joaat("a_m_y_methhead_01")] = "a_m_y_methhead_01"
PedModel1[joaat("a_m_y_mexthug_01")] = "a_m_y_mexthug_01"
PedModel1[joaat("a_m_y_motox_01")] = "a_m_y_motox_01"
PedModel1[joaat("a_m_y_motox_02")] = "a_m_y_motox_02"
PedModel1[joaat("a_m_y_musclbeac_01")] = "a_m_y_musclbeac_01"
PedModel1[joaat("a_m_y_musclbeac_02")] = "a_m_y_musclbeac_02"
PedModel1[joaat("a_m_y_polynesian_01")] = "a_m_y_polynesian_01"
PedModel1[joaat("a_m_y_roadcyc_01")] = "a_m_y_roadcyc_01"
PedModel1[joaat("a_m_y_runner_01")] = "a_m_y_runner_01"
PedModel1[joaat("a_m_y_runner_02")] = "a_m_y_runner_02"
PedModel1[joaat("a_m_y_salton_01")] = "a_m_y_salton_01"
PedModel1[joaat("a_m_y_skater_01")] = "a_m_y_skater_01"
PedModel1[joaat("a_m_y_skater_02")] = "a_m_y_skater_02"
PedModel1[joaat("a_m_y_smartcaspat_01")] = "a_m_y_smartcaspat_01"
PedModel1[joaat("a_m_y_soucent_01")] = "a_m_y_soucent_01"
PedModel1[joaat("a_m_y_soucent_02")] = "a_m_y_soucent_02"
PedModel1[joaat("a_m_y_soucent_03")] = "a_m_y_soucent_03"
PedModel1[joaat("a_m_y_soucent_04")] = "a_m_y_soucent_04"
PedModel1[joaat("a_m_y_stbla_01")] = "a_m_y_stbla_01"
PedModel1[joaat("a_m_y_stbla_02")] = "a_m_y_stbla_02"
PedModel1[joaat("a_m_y_stlat_01")] = "a_m_y_stlat_01"
PedModel1[joaat("a_m_y_stwhi_01")] = "a_m_y_stwhi_01"
PedModel1[joaat("a_m_y_stwhi_02")] = "a_m_y_stwhi_02"
PedModel1[joaat("a_m_y_sunbathe_01")] = "a_m_y_sunbathe_01"
PedModel1[joaat("a_m_y_surfer_01")] = "a_m_y_surfer_01"
PedModel1[joaat("a_m_y_vindouche_01")] = "a_m_y_vindouche_01"
PedModel1[joaat("a_m_y_vinewood_01")] = "a_m_y_vinewood_01"
PedModel1[joaat("a_m_y_vinewood_02")] = "a_m_y_vinewood_02"
PedModel1[joaat("a_m_y_vinewood_03")] = "a_m_y_vinewood_03"
PedModel1[joaat("a_m_y_vinewood_04")] = "a_m_y_vinewood_04"
PedModel1[joaat("a_m_y_yoga_01")] = "a_m_y_yoga_01"
PedModel1[joaat("cs_amandatownley")] = "Amanda"
PedModel1[joaat("cs_andreas")] = "cs_andreas"
PedModel1[joaat("cs_ashley")] = "cs_ashley"
PedModel1[joaat("cs_bankman")] = "cs_bankman"
PedModel1[joaat("cs_barry")] = "cs_barry"
PedModel1[joaat("cs_beverly")] = "cs_beverly"
PedModel1[joaat("cs_brad")] = "cs_brad"
PedModel1[joaat("cs_bradcadaver")] = "cs_bradcadaver"
PedModel1[joaat("cs_carbuyer")] = "cs_carbuyer"
PedModel1[joaat("cs_casey")] = "cs_casey"
PedModel1[joaat("cs_chengsr")] = "cs_chengsr"
PedModel1[joaat("cs_chrisformage")] = "cs_chrisformage"
PedModel1[joaat("cs_clay")] = "cs_clay"
PedModel1[joaat("cs_dale")] = "cs_dale"
PedModel1[joaat("Dave Norton")] = "cs_davenorton"
PedModel1[joaat("cs_debra")] = "cs_debra"
PedModel1[joaat("cs_denise")] = "cs_denise"
PedModel1[joaat("cs_devin")] = "cs_devin"
PedModel1[joaat("cs_dom")] = "cs_dom"
PedModel1[joaat("cs_dreyfuss")] = "cs_dreyfuss"
PedModel1[joaat("cs_drfriedlander")] = "Isiah Friedlander"
PedModel1[joaat("cs_fabien")] = "cs_fabien"
PedModel1[joaat("cs_fbisuit_01")] = "cs_fbisuit_01"
PedModel1[joaat("cs_floyd")] = "cs_floyd"
PedModel1[joaat("cs_guadalope")] = "cs_guadalope"
PedModel1[joaat("cs_gurk")] = "cs_gurk"
PedModel1[joaat("cs_hunter")] = "cs_hunter"
PedModel1[joaat("cs_janet")] = "cs_janet"
PedModel1[joaat("cs_jewelass")] = "cs_jewelass"
PedModel1[joaat("cs_jimmyboston")] = "cs_jimmyboston"
PedModel1[joaat("cs_jimmydisanto")] = "cs_jimmydisanto"
PedModel1[joaat("cs_jimmydisanto2")] = "cs_jimmydisanto2"
PedModel1[joaat("cs_joeminuteman")] = "cs_joeminuteman"
PedModel1[joaat("cs_johnnyklebitz")] = "cs_johnnyklebitz"
PedModel1[joaat("cs_josef")] = "cs_josef"
PedModel1[joaat("cs_josh")] = "cs_josh"
PedModel1[joaat("cs_karen_daniels")] = "cs_karen_daniels"
PedModel1[joaat("cs_lamardavis")] = "cs_lamardavis"
PedModel1[joaat("cs_lazlow")] = "Lazlow 1"
PedModel1[joaat("cs_lazlow_2")] = "cs_lazlow_2"
PedModel1[joaat("cs_lestercrest")] = "cs_lestercrest"
PedModel1[joaat("cs_lestercrest_2")] = "cs_lestercrest_2"
PedModel1[joaat("cs_lestercrest_3")] = "cs_lestercrest_3"
PedModel1[joaat("cs_lifeinvad_01")] = "cs_lifeinvad_01"
PedModel1[joaat("cs_magenta")] = "cs_magenta"
PedModel1[joaat("cs_manuel")] = "cs_manuel"
PedModel1[joaat("cs_marnie")] = "cs_marnie"
PedModel1[joaat("cs_martinmadrazo")] = "cs_martinmadrazo"
PedModel1[joaat("cs_maryann")] = "cs_maryann"
PedModel1[joaat("cs_michelle")] = "cs_michelle"
PedModel1[joaat("cs_milton")] = "cs_milton"
PedModel1[joaat("cs_molly")] = "cs_molly"
PedModel1[joaat("cs_movpremf_01")] = "cs_movpremf_01"
PedModel1[joaat("cs_movpremmale")] = "cs_movpremmale"
PedModel1[joaat("cs_mrk")] = "cs_mrk"
PedModel1[joaat("cs_mrs_thornhill")] = "cs_mrs_thornhill"
PedModel1[joaat("cs_mrsphillips")] = "cs_mrsphillips"
PedModel1[joaat("cs_natalia")] = "cs_natalia"
PedModel1[joaat("cs_nervousron")] = "cs_nervousron"
PedModel1[joaat("cs_nigel")] = "cs_nigel"
PedModel1[joaat("cs_old_man1a")] = "cs_old_man1a"
PedModel1[joaat("cs_old_man2")] = "cs_old_man2"
PedModel1[joaat("cs_omega")] = "cs_omega"
PedModel1[joaat("cs_orleans")] = "cs_orleans"
PedModel1[joaat("cs_paper")] = "cs_paper"
PedModel1[joaat("cs_patricia")] = "cs_patricia"
PedModel1[joaat("cs_patricia_02")] = "cs_patricia_02"
PedModel1[joaat("cs_priest")] = "cs_priest"
PedModel1[joaat("cs_prolsec_02")] = "cs_prolsec_02"
PedModel1[joaat("cs_russiandrunk")] = "cs_russiandrunk"
PedModel1[joaat("cs_siemonyetarian")] = "cs_siemonyetarian"
PedModel1[joaat("cs_solomon")] = "cs_solomon"
PedModel1[joaat("cs_stevehains")] = "Steven Haines"
PedModel1[joaat("cs_stretch")] = "Stretch"
PedModel1[joaat("cs_tanisha")] = "cs_tanisha"
PedModel1[joaat("cs_taocheng")] = "Tao Cheng"
PedModel1[joaat("cs_taocheng2")] = "cs_taocheng2"
PedModel1[joaat("cs_taostranslator")] = "cs_taostranslator"
PedModel1[joaat("cs_taostranslator2")] = "cs_taostranslator2"
PedModel1[joaat("cs_tenniscoach")] = "cs_tenniscoach"
PedModel1[joaat("cs_terry")] = "cs_terry"
PedModel1[joaat("cs_tom")] = "cs_tom"
PedModel1[joaat("cs_tomepsilon")] = "cs_tomepsilon"
PedModel1[joaat("cs_tracydisanto")] = "cs_tracydisanto"
PedModel1[joaat("cs_wade")] = "cs_wade"
PedModel1[joaat("cs_zimbor")] = "cs_zimbor"
PedModel1[joaat("csb_abigail")] = "Abigail"
PedModel1[joaat("csb_agatha")] = "csb_agatha"
PedModel1[joaat("csb_agent")] = "csb_agent"
PedModel1[joaat("csb_alan")] = "csb_alan"
PedModel1[joaat("csb_anita")] = "csb_anita"
PedModel1[joaat("csb_anton")] = "csb_anton"
PedModel1[joaat("csb_ary")] = "csb_ary"
PedModel1[joaat("csb_avery")] = "csb_avery"
PedModel1[joaat("csb_avon")] = "csb_avon"
PedModel1[joaat("csb_ballasog")] = "csb_ballasog"
PedModel1[joaat("csb_bogdan")] = "csb_bogdan"
PedModel1[joaat("csb_bride")] = "csb_bride"
PedModel1[joaat("csb_brucie2")] = "csb_brucie2"
PedModel1[joaat("csb_bryony")] = "csb_bryony"
PedModel1[joaat("csb_burgerdrug")] = "csb_burgerdrug"
PedModel1[joaat("csb_car3guy1")] = "csb_car3guy1"
PedModel1[joaat("csb_car3guy2")] = "csb_car3guy2"
PedModel1[joaat("csb_celeb_01")] = "csb_celeb_01"
PedModel1[joaat("csb_chef")] = "csb_chef"
PedModel1[joaat("csb_chef2")] = "csb_chef2"
PedModel1[joaat("csb_chin_goon")] = "csb_chin_goon"
PedModel1[joaat("csb_cletus")] = "csb_cletus"
PedModel1[joaat("csb_cop")] = "csb_cop"
PedModel1[joaat("csb_customer")] = "csb_customer"
PedModel1[joaat("csb_denise_friend")] = "csb_denise_friend"
PedModel1[joaat("csb_dix")] = "csb_dix"
PedModel1[joaat("csb_djblamadon")] = "csb_djblamadon"
PedModel1[joaat("csb_englishdave")] = "English Dave"
PedModel1[joaat("csb_englishdave_02")] = "csb_englishdave_02"
PedModel1[joaat("csb_fos_rep")] = "csb_fos_rep"
PedModel1[joaat("csb_g")] = "Gerald 2"
PedModel1[joaat("csb_georginacheng")] = "csb_georginacheng"
PedModel1[joaat("csb_groom")] = "csb_groom"
PedModel1[joaat("csb_grove_str_dlr")] = "csb_grove_str_dlr"
PedModel1[joaat("csb_gustavo")] = "Gustavo"
PedModel1[joaat("csb_hao")] = "Hao"
PedModel1[joaat("csb_helmsmanpavel")] = "Pavel"
PedModel1[joaat("csb_huang")] = "csb_huang"
PedModel1[joaat("csb_hugh")] = "csb_hugh"
PedModel1[joaat("csb_imran")] = "csb_imran"
PedModel1[joaat("csb_isldj_00")] = "csb_isldj_00"
PedModel1[joaat("csb_isldj_01")] = "csb_isldj_01"
PedModel1[joaat("csb_isldj_02")] = "csb_isldj_02"
PedModel1[joaat("csb_isldj_03")] = "csb_isldj_03"
PedModel1[joaat("csb_isldj_04")] = "csb_isldj_04"
PedModel1[joaat("csb_jackhowitzer")] = "csb_jackhowitzer"
PedModel1[joaat("csb_janitor")] = "csb_janitor"
PedModel1[joaat("csb_jio")] = "Jimmy Iovine"
PedModel1[joaat("csb_juanstrickler")] = "csb_juanstrickler"
PedModel1[joaat("csb_maude")] = "csb_maude"
PedModel1[joaat("csb_miguelmadrazo")] = "csb_miguelmadrazo"
PedModel1[joaat("csb_mjo")] = "DJ Pooh"
PedModel1[joaat("csb_money")] = "Avi Schwartzman"
PedModel1[joaat("csb_mp_agent14")] = "csb_mp_agent14"
PedModel1[joaat("csb_mrs_r")] = "Mrs Rackman"
PedModel1[joaat("csb_mweather")] = "csb_mweather"
PedModel1[joaat("csb_ortega")] = "csb_ortega"
PedModel1[joaat("csb_oscar")] = "csb_oscar"
PedModel1[joaat("csb_paige")] = "csb_paige"
PedModel1[joaat("csb_popov")] = "csb_popov"
PedModel1[joaat("csb_porndudes")] = "csb_porndudes"
PedModel1[joaat("csb_prologuedriver")] = "csb_prologuedriver"
PedModel1[joaat("csb_prolsec")] = "csb_prolsec"
PedModel1[joaat("csb_ramp_gang")] = "csb_ramp_gang"
PedModel1[joaat("csb_ramp_hic")] = "csb_ramp_hic"
PedModel1[joaat("csb_ramp_hipster")] = "csb_ramp_hipster"
PedModel1[joaat("csb_ramp_marine")] = "csb_ramp_marine"
PedModel1[joaat("csb_ramp_mex")] = "csb_ramp_mex"
PedModel1[joaat("csb_rashcosvki")] = "csb_rashcosvki"
PedModel1[joaat("csb_reporter")] = "csb_reporter"
PedModel1[joaat("csb_roccopelosi")] = "csb_roccopelosi"
PedModel1[joaat("csb_screen_writer")] = "csb_screen_writer"
PedModel1[joaat("csb_sol")] = "csb_sol"
PedModel1[joaat("csb_sss")] = "csb_sss"
PedModel1[joaat("csb_stripper_01")] = "csb_stripper_01"
PedModel1[joaat("csb_stripper_02")] = "csb_stripper_02"
PedModel1[joaat("csb_talcc")] = "csb_talcc"
PedModel1[joaat("csb_talmm")] = "csb_talmm"
PedModel1[joaat("csb_thornton")] = "csb_thornton"
PedModel1[joaat("csb_tomcasino")] = "csb_tomcasino"
PedModel1[joaat("csb_tonya")] = "csb_tonya"
PedModel1[joaat("csb_tonyprince")] = "csb_tonyprince"
PedModel1[joaat("csb_trafficwarden")] = "csb_trafficwarden"
PedModel1[joaat("csb_undercover")] = "csb_undercover"
PedModel1[joaat("csb_vagspeak")] = "csb_vagspeak"
PedModel1[joaat("csb_vincent")] = "csb_vincent"
PedModel1[joaat("csb_vincent_2")] = "Vincent 2"
PedModel1[joaat("csb_wendy")] = "csb_wendy"
PedModel1[joaat("g_f_importexport_01")] = "g_f_importexport_01"
PedModel1[joaat("g_f_y_ballas_01")] = "g_f_y_ballas_01"
PedModel1[joaat("g_f_y_families_01")] = "g_f_y_families_01"
PedModel1[joaat("g_f_y_lost_01")] = "g_f_y_lost_01"
PedModel1[joaat("g_f_y_vagos_01")] = "g_f_y_vagos_01"
PedModel1[joaat("g_m_importexport_01")] = "g_m_importexport_01"
PedModel1[joaat("g_m_m_armboss_01")] = "g_m_m_armboss_01"
PedModel1[joaat("g_m_m_armgoon_01")] = "g_m_m_armgoon_01"
PedModel1[joaat("g_m_m_armlieut_01")] = "g_m_m_armlieut_01"
PedModel1[joaat("g_m_m_cartelguards_01")] = "g_m_m_cartelguards_01"
PedModel1[joaat("g_m_m_cartelguards_02")] = "g_m_m_cartelguards_02"
PedModel1[joaat("g_m_m_casrn_01")] = "g_m_m_casrn_01"
PedModel1[joaat("g_m_m_chemwork_01")] = "g_m_m_chemwork_01"
PedModel1[joaat("g_m_m_chiboss_01")] = "g_m_m_chiboss_01"
PedModel1[joaat("g_m_m_chicold_01")] = "g_m_m_chicold_01"
PedModel1[joaat("g_m_m_chigoon_01")] = "g_m_m_chigoon_01"
PedModel1[joaat("g_m_m_chigoon_02")] = "g_m_m_chigoon_02"
PedModel1[joaat("g_m_m_korboss_01")] = "g_m_m_korboss_01"
PedModel1[joaat("g_m_m_mexboss_01")] = "g_m_m_mexboss_01"
PedModel1[joaat("g_m_m_mexboss_02")] = "g_m_m_mexboss_02"
PedModel1[joaat("g_m_y_armgoon_02")] = "g_m_y_armgoon_02"
PedModel1[joaat("g_m_y_azteca_01")] = "g_m_y_azteca_01"
PedModel1[joaat("g_m_y_ballaeast_01")] = "g_m_y_ballaeast_01"
PedModel1[joaat("g_m_y_ballaorig_01")] = "g_m_y_ballaorig_01"
PedModel1[joaat("g_m_y_ballasout_01")] = "g_m_y_ballasout_01"
PedModel1[joaat("g_m_y_famca_01")] = "g_m_y_famca_01"
PedModel1[joaat("g_m_y_famdnf_01")] = "g_m_y_famdnf_01"
PedModel1[joaat("g_m_y_famfor_01")] = "g_m_y_famfor_01"
PedModel1[joaat("g_m_y_korean_01")] = "g_m_y_korean_01"
PedModel1[joaat("g_m_y_korean_02")] = "g_m_y_korean_02"
PedModel1[joaat("g_m_y_korlieut_01")] = "g_m_y_korlieut_01"
PedModel1[joaat("g_m_y_lost_01")] = "g_m_y_lost_01"
PedModel1[joaat("g_m_y_lost_02")] = "g_m_y_lost_02"
PedModel1[joaat("g_m_y_lost_03")] = "g_m_y_lost_03"
PedModel1[joaat("g_m_y_mexgang_01")] = "g_m_y_mexgang_01"
PedModel1[joaat("g_m_y_mexgoon_01")] = "g_m_y_mexgoon_01"
PedModel1[joaat("g_m_y_mexgoon_02")] = "g_m_y_mexgoon_02"
PedModel1[joaat("g_m_y_mexgoon_03")] = "g_m_y_mexgoon_03"
PedModel1[joaat("g_m_y_pologoon_01")] = "g_m_y_pologoon_01"
PedModel1[joaat("g_m_y_pologoon_02")] = "g_m_y_pologoon_02"
PedModel1[joaat("g_m_y_salvaboss_01")] = "g_m_y_salvaboss_01"
PedModel1[joaat("g_m_y_salvagoon_01")] = "g_m_y_salvagoon_01"
PedModel1[joaat("g_m_y_salvagoon_02")] = "g_m_y_salvagoon_02"
PedModel1[joaat("g_m_y_salvagoon_03")] = "g_m_y_salvagoon_03"
PedModel1[joaat("g_m_y_strpunk_01")] = "g_m_y_strpunk_01"
PedModel1[joaat("g_m_y_strpunk_02")] = "g_m_y_strpunk_02"
PedModel1[joaat("hc_driver")] = "hc_driver"
PedModel1[joaat("hc_gunman")] = "hc_gunman"
PedModel1[joaat("hc_hacker")] = "hc_hacker"
PedModel1[joaat("ig_abigail")] = "Abigail"
PedModel1[joaat("ig_agatha")] = "Agatha"
PedModel1[joaat("ig_agent")] = "Agent"
PedModel1[joaat("ig_amandatownley")] = "Amanda 1"
PedModel1[joaat("ig_andreas")] = "Andreas"
PedModel1[joaat("ig_ary")] = "Ary"
PedModel1[joaat("ig_ashley")] = "Ashley"
PedModel1[joaat("ig_avery")] = "Avery"
PedModel1[joaat("ig_avon")] = "Avon Hertz"
PedModel1[joaat("ig_ballasog")] = "Ballas Chilli D"
PedModel1[joaat("ig_bankman")] = "Bankman"
PedModel1[joaat("ig_barry")] = "Barry"
PedModel1[joaat("ig_benny")] = "Benny"
PedModel1[joaat("ig_bestmen")] = "Bestmen"
PedModel1[joaat("ig_beverly")] = "Beverly"
PedModel1[joaat("ig_brad")] = "Brad"
PedModel1[joaat("ig_bride")] = "ig_bride"
PedModel1[joaat("ig_brucie2")] = "Brucie 2"
PedModel1[joaat("ig_car3guy1")] = "ig_car3guy1"
PedModel1[joaat("ig_car3guy2")] = "ig_car3guy2"
PedModel1[joaat("ig_casey")] = "Casey"
PedModel1[joaat("ig_celeb_01")] = "ig_celeb_01"
PedModel1[joaat("ig_chef")] = "ig_chef"
PedModel1[joaat("ig_chef2")] = "ig_chef2"
PedModel1[joaat("ig_chengsr")] = "Cheng Sr"
PedModel1[joaat("ig_chrisformage")] = "Cris Formage"
PedModel1[joaat("ig_clay")] = "Clay Simons"
PedModel1[joaat("ig_claypain")] = "Claypain"
PedModel1[joaat("ig_cletus")] = "Cletus"
PedModel1[joaat("ig_dale")] = "Dale"
PedModel1[joaat("ig_davenorton")] = "Dave Norton"
PedModel1[joaat("ig_denise")] = "Denise"
PedModel1[joaat("ig_devin")] = "Devin"
PedModel1[joaat("ig_dix")] = "dix"
PedModel1[joaat("ig_djblamadon")] = "djblamadon"
PedModel1[joaat("ig_djblamrupert")] = "Rupert Murray"
PedModel1[joaat("ig_djblamryanh")] = "djblamryanh"
PedModel1[joaat("ig_djblamryans")] = "djblamryans"
PedModel1[joaat("ig_djdixmanager")] = "djdixmanager"
PedModel1[joaat("ig_djgeneric_01")] = "djgeneric_01"
PedModel1[joaat("ig_djsolfotios")] = "djsolfotios"
PedModel1[joaat("ig_djsoljakob")] = "Jakob Grunert"
PedModel1[joaat("ig_djsolmanager")] = "djsolmanager"
PedModel1[joaat("ig_djsolmike")] = "djsolmike"
PedModel1[joaat("ig_djsolrobt")] = "djsolrobt"
PedModel1[joaat("ig_djtalaurelia")] = "djtalaurelia"
PedModel1[joaat("ig_djtalignazio")] = "djtalignazio"
PedModel1[joaat("ig_dom")] = "Dom"
PedModel1[joaat("ig_dreyfuss")] = "dreyfuss"
PedModel1[joaat("ig_drfriedlander")] = "drfriedlander"
PedModel1[joaat("ig_englishdave")] = "englishdave"
PedModel1[joaat("ig_englishdave_02")] = "englishdave_02"
PedModel1[joaat("ig_fabien")] = "fabien"
PedModel1[joaat("ig_fbisuit_01")] = "fbisuit_01"
PedModel1[joaat("ig_floyd")] = "floyd"
PedModel1[joaat("ig_g")] = "Gerald"
PedModel1[joaat("ig_georginacheng")] = "georginacheng"
PedModel1[joaat("ig_groom")] = "groom"
PedModel1[joaat("ig_gustavo")] = "gustavo"
PedModel1[joaat("ig_hao")] = "hao"
PedModel1[joaat("ig_helmsmanpavel")] = "helmsmanpavel"
PedModel1[joaat("ig_huang")] = "huang"
PedModel1[joaat("ig_hunter")] = "hunter"
PedModel1[joaat("ig_isldj_00")] = "isldj_00"
PedModel1[joaat("ig_isldj_01")] = "isldj_01"
PedModel1[joaat("ig_isldj_02")] = "isldj_02"
PedModel1[joaat("ig_isldj_03")] = "isldj_03"
PedModel1[joaat("ig_isldj_04")] = "Moodyman"
PedModel1[joaat("ig_isldj_04_d_01")] = "isldj_04_d_01"
PedModel1[joaat("ig_isldj_04_d_02")] = "isldj_04_d_02"
PedModel1[joaat("ig_isldj_04_e_01")] = "isldj_04_e_01"
PedModel1[joaat("ig_jackie")] = "jackie"
PedModel1[joaat("ig_janet")] = "janet"
PedModel1[joaat("ig_jay_norris")] = "jay_norris"
PedModel1[joaat("ig_jewelass")] = "jewelass"
PedModel1[joaat("ig_jimmyboston")] = "jimmyboston"
PedModel1[joaat("ig_jimmyboston_02")] = "jimmyboston_02"
PedModel1[joaat("ig_jimmydisanto")] = "jimmydisanto"
PedModel1[joaat("ig_jimmydisanto2")] = "Jimmy 2"
PedModel1[joaat("ig_jio")] = "jio"
PedModel1[joaat("ig_joeminuteman")] = "joeminuteman"
PedModel1[joaat("ig_johnnyklebitz")] = "johnnyklebitz"
PedModel1[joaat("ig_josef")] = "josef"
PedModel1[joaat("ig_josh")] = "josh"
PedModel1[joaat("ig_juanstrickler")] = "juanstrickler"
PedModel1[joaat("ig_karen_daniels")] = "karen_daniels"
PedModel1[joaat("ig_kaylee")] = "kaylee"
PedModel1[joaat("ig_kerrymcintosh")] = "kerrymcintosh"
PedModel1[joaat("ig_kerrymcintosh_02")] = "kerrymcintosh_02"
PedModel1[joaat("ig_lacey_jones_02")] = "lacey_jones_02"
PedModel1[joaat("ig_lamardavis")] = "lamardavis"
PedModel1[joaat("ig_lazlow")] = "lazlow"
PedModel1[joaat("ig_lazlow_2")] = "Lazlow 2"
PedModel1[joaat("ig_lestercrest")] = "lestercrest"
PedModel1[joaat("ig_lestercrest_2")] = "lestercrest_2"
PedModel1[joaat("ig_lestercrest_3")] = "lestercrest_3"
PedModel1[joaat("ig_lifeinvad_01")] = "lifeinvad_01"
PedModel1[joaat("ig_lifeinvad_02")] = "lifeinvad_02"
PedModel1[joaat("ig_magenta")] = "magenta"
PedModel1[joaat("ig_malc")] = "malc"
PedModel1[joaat("ig_manuel")] = "manuel"
PedModel1[joaat("ig_marnie")] = "marnie"
PedModel1[joaat("ig_maryann")] = "Mary Ann"
PedModel1[joaat("ig_maude")] = "Maude"
PedModel1[joaat("ig_michelle")] = "Michelle"
PedModel1[joaat("ig_miguelmadrazo")] = "Miguel Madrazo"
PedModel1[joaat("ig_milton")] = "Milton"
PedModel1[joaat("ig_mjo")] = "DJ Pooh"
PedModel1[joaat("ig_molly")] = "molly"
PedModel1[joaat("ig_money")] = "Avi Schwartzman 1"
PedModel1[joaat("ig_mp_agent14")] = "mp_agent14"
PedModel1[joaat("ig_mrk")] = "mrk"
PedModel1[joaat("ig_mrs_thornhill")] = "mrs_thornhill"
PedModel1[joaat("ig_mrsphillips")] = "Mrs Phillips"
PedModel1[joaat("ig_natalia")] = "natalia"
PedModel1[joaat("ig_nervousron")] = "nervousron"
PedModel1[joaat("ig_nigel")] = "nigel"
PedModel1[joaat("ig_old_man1a")] = "old_man1a"
PedModel1[joaat("ig_old_man2")] = "old_man2"
PedModel1[joaat("ig_oldrichguy")] = "oldrichguy"
PedModel1[joaat("ig_omega")] = "omega"
PedModel1[joaat("ig_oneil")] = "oneil"
PedModel1[joaat("ig_orleans")] = "orleans"
PedModel1[joaat("ig_ortega")] = "ortega"
PedModel1[joaat("ig_paige")] = "paige"
PedModel1[joaat("ig_paper")] = "paper"
PedModel1[joaat("ig_patricia")] = "patricia"
PedModel1[joaat("ig_patricia_02")] = "patricia_02"
PedModel1[joaat("ig_pilot")] = "pilot"
PedModel1[joaat("ig_popov")] = "popov"
PedModel1[joaat("ig_priest")] = "priest"
PedModel1[joaat("ig_prolsec_02")] = "prolsec_02"
PedModel1[joaat("ig_ramp_gang")] = "ramp_gang"
PedModel1[joaat("ig_ramp_hic")] = "ramp_hic"
PedModel1[joaat("ig_ramp_hipster")] = "ramp_hipster"
PedModel1[joaat("ig_ramp_mex")] = "ramp_mex"
PedModel1[joaat("ig_rashcosvki")] = "Rashcosvki"
PedModel1[joaat("ig_roccopelosi")] = "roccopelosi"
PedModel1[joaat("ig_russiandrunk")] = "russiandrunk"
PedModel1[joaat("ig_sacha")] = "sacha"
PedModel1[joaat("ig_screen_writer")] = "screen_writer"
PedModel1[joaat("ig_siemonyetarian")] = "siemonyetarian"
PedModel1[joaat("ig_sol")] =	 "sol"
PedModel1[joaat("ig_solomon")] = "Solomon"
PedModel1[joaat("ig_sss")] =	 "Scott Storch"
PedModel1[joaat("ig_stevehains")] = "Steven Haines"
PedModel1[joaat("ig_stretch")] = "Harold 'Stretch' Joseph"
PedModel1[joaat("ig_talcc")] = "talcc"
PedModel1[joaat("ig_talina")] = "talina"
PedModel1[joaat("ig_talmm")] = "talmm"
PedModel1[joaat("ig_tanisha")] = "tanisha"
PedModel1[joaat("ig_taocheng")] = "taocheng"
PedModel1[joaat("ig_taocheng2")] = "taocheng2"
PedModel1[joaat("ig_taostranslator")] = "taostranslator"
PedModel1[joaat("ig_taostranslator2")] = "taostranslator2"
PedModel1[joaat("ig_tenniscoach")] = "tenniscoach"
PedModel1[joaat("ig_terry")] = "Terry Thorpe"
PedModel1[joaat("ig_thornton")] = "Thornton Duggan"
PedModel1[joaat("ig_tomcasino")] = "tomcasino"
PedModel1[joaat("ig_tomepsilon")] = "tomepsilon"
PedModel1[joaat("ig_tonya")] = "tonya"
PedModel1[joaat("ig_tonyprince")] = "tonyprince"
PedModel1[joaat("ig_tracydisanto")] = "tracydisanto"
PedModel1[joaat("ig_trafficwarden")] = "trafficwarden"
PedModel1[joaat("ig_tylerdix")] = "tylerdix"
PedModel1[joaat("ig_tylerdix_02")] = "tylerdix_02"
PedModel1[joaat("ig_vagspeak")] = "Vagspeak"
PedModel1[joaat("ig_vincent")] = "Vincent"
PedModel1[joaat("ig_vincent_2")] = "Vincent 2"
PedModel1[joaat("ig_wade")] = "Wade"
PedModel1[joaat("ig_wendy")] = "Wendy"
PedModel1[joaat("ig_zimbor")] = "Zimbor"
PedModel1[joaat("mp_f_bennymech_01")] = "mp_f_bennymech_01"
PedModel1[joaat("mp_f_boatstaff_01")] = "mp_f_boatstaff_01"
PedModel1[joaat("mp_f_cardesign_01")] = "mp_f_cardesign_01"
PedModel1[joaat("mp_f_chbar_01")] = "mp_f_chbar_01"
PedModel1[joaat("mp_f_cocaine_01")] = "mp_f_cocaine_01"
PedModel1[joaat("mp_f_counterfeit_01")] = "mp_f_counterfeit_01"
PedModel1[joaat("mp_f_deadhooker")] = "mp_f_deadhooker"
PedModel1[joaat("mp_f_execpa_01")] = "mp_f_execpa_01"
PedModel1[joaat("mp_f_execpa_02")] = "mp_f_execpa_02"
PedModel1[joaat("mp_f_forgery_01")] = "mp_f_forgery_01"
PedModel1[joaat("mp_f_helistaff_01")] = "mp_f_helistaff_01"
PedModel1[joaat("mp_f_meth_01")] = "mp_f_meth_01"
PedModel1[joaat("mp_f_misty_01")] = "mp_f_misty_01"
PedModel1[joaat("mp_f_stripperlite")] = "Nikki"
PedModel1[joaat("mp_f_weed_01")] = "mp_f_weed_01"
PedModel1[joaat("mp_g_m_pros_01")] = "mp_g_m_pros_01"
PedModel1[joaat("mp_headtargets")] = "mp_headtargets"
PedModel1[joaat("mp_m_avongoon")] = "mp_m_avongoon"
PedModel1[joaat("mp_m_boatstaff_01")] = "mp_m_boatstaff_01"
PedModel1[joaat("mp_m_bogdangoon")] = "mp_m_bogdangoon"
PedModel1[joaat("mp_m_claude_01")] = "mp_m_claude_01"
PedModel1[joaat("mp_m_cocaine_01")] = "mp_m_cocaine_01"
PedModel1[joaat("mp_m_counterfeit_01")] = "mp_m_counterfeit_01"
PedModel1[joaat("mp_m_exarmy_01")] = "mp_m_exarmy_01"
PedModel1[joaat("mp_m_execpa_01")] = "mp_m_execpa_01"
PedModel1[joaat("mp_m_famdd_01")] = "mp_m_famdd_01"
PedModel1[joaat("mp_m_fibsec_01")] = "mp_m_fibsec_01"
PedModel1[joaat("mp_m_forgery_01")] = "mp_m_forgery_01"
PedModel1[joaat("mp_m_g_vagfun_01")] = "mp_m_g_vagfun_01"
PedModel1[joaat("mp_m_marston_01")] = "mp_m_marston_01"
PedModel1[joaat("mp_m_meth_01")] = "mp_m_meth_01"
PedModel1[joaat("mp_m_niko_01")] = "mp_m_niko_01"
PedModel1[joaat("mp_m_securoguard_01")] = "mp_m_securoguard_01"
PedModel1[joaat("mp_m_shopkeep_01")] = "mp_m_shopkeep_01"
PedModel1[joaat("mp_m_waremech_01")] = "mp_m_waremech_01"
PedModel1[joaat("mp_m_weapexp_01")] = "mp_m_weapexp_01"
PedModel1[joaat("mp_m_weapwork_01")] = "mp_m_weapwork_01"
PedModel1[joaat("mp_m_weed_01")] = "mp_m_weed_01"
PedModel1[joaat("mp_s_m_armoured_01")] = "mp_s_m_armoured_01"
PedModel1[joaat("s_f_m_fembarber")] = "s_f_m_fembarber"
PedModel1[joaat("s_f_m_maid_01")] = "s_f_m_maid_01"
PedModel1[joaat("s_f_m_shop_high")] = "s_f_m_shop_high"
PedModel1[joaat("s_f_m_sweatshop_01")] = "s_f_m_sweatshop_01"
PedModel1[joaat("s_f_y_airhostess_01")] = "s_f_y_airhostess_01"
PedModel1[joaat("s_f_y_bartender_01")] = "s_f_y_bartender_01"
PedModel1[joaat("s_f_y_baywatch_01")] = "s_f_y_baywatch_01"
PedModel1[joaat("s_f_y_beachbarstaff_01")] = "s_f_y_beachbarstaff_01"
PedModel1[joaat("s_f_y_casino_01")] = "s_f_y_casino_01"
PedModel1[joaat("s_f_y_clubbar_01")] = "s_f_y_clubbar_01"
PedModel1[joaat("s_f_y_clubbar_02")] = "s_f_y_clubbar_02"
PedModel1[joaat("s_f_y_cop_01")] = "s_f_y_cop_01"
PedModel1[joaat("s_f_y_factory_01")] = "s_f_y_factory_01"
PedModel1[joaat("s_f_y_hooker_01")] = "s_f_y_hooker_01"
PedModel1[joaat("s_f_y_hooker_02")] = "s_f_y_hooker_02"
PedModel1[joaat("s_f_y_hooker_03")] = "s_f_y_hooker_03"
PedModel1[joaat("s_f_y_migrant_01")] = "s_f_y_migrant_01"
PedModel1[joaat("s_f_y_movprem_01")] = "s_f_y_movprem_01"
PedModel1[joaat("s_f_y_ranger_01")] = "s_f_y_ranger_01"
PedModel1[joaat("s_f_y_scrubs_01")] = "s_f_y_scrubs_01"
PedModel1[joaat("s_f_y_sheriff_01")] = "s_f_y_sheriff_01"
PedModel1[joaat("s_f_y_shop_low")] = "s_f_y_shop_low"
PedModel1[joaat("s_f_y_shop_mid")] = "s_f_y_shop_mid"
PedModel1[joaat("s_f_y_stripper_01")] = "s_f_y_stripper_01"
PedModel1[joaat("s_f_y_stripper_02")] = "s_f_y_stripper_02"
PedModel1[joaat("s_f_y_stripperlite")] = "s_f_y_stripperlite"
PedModel1[joaat("s_f_y_sweatshop_01")] = "s_f_y_sweatshop_01"
PedModel1[joaat("s_m_m_ammucountry")] = "s_m_m_ammucountry"
PedModel1[joaat("s_m_m_armoured_01")] = "s_m_m_armoured_01"
PedModel1[joaat("s_m_m_armoured_02")] = "s_m_m_armoured_02"
PedModel1[joaat("s_m_m_autoshop_01")] = "s_m_m_autoshop_01"
PedModel1[joaat("s_m_m_autoshop_02")] = "s_m_m_autoshop_02"
PedModel1[joaat("s_m_m_bouncer_01")] = "s_m_m_bouncer_01"
PedModel1[joaat("s_m_m_bouncer_02")] = "s_m_m_bouncer_02"
PedModel1[joaat("s_m_m_ccrew_01")] = "s_m_m_ccrew_01"
PedModel1[joaat("s_m_m_chemsec_01")] = "s_m_m_chemsec_01"
PedModel1[joaat("s_m_m_ciasec_01")] = "s_m_m_ciasec_01"
PedModel1[joaat("s_m_m_cntrybar_01")] = "s_m_m_cntrybar_01"
PedModel1[joaat("s_m_m_dockwork_01")] = "s_m_m_dockwork_01"
PedModel1[joaat("s_m_m_doctor_01")] = "s_m_m_doctor_01"
PedModel1[joaat("s_m_m_drugprocess_01")] = "s_m_m_drugprocess_01"
PedModel1[joaat("s_m_m_fiboffice_01")] = "s_m_m_fiboffice_01"
PedModel1[joaat("s_m_m_fiboffice_02")] = "s_m_m_fiboffice_02"
PedModel1[joaat("s_m_m_fibsec_01")] = "s_m_m_fibsec_01"
PedModel1[joaat("s_m_m_fieldworker_01")] = "s_m_m_fieldworker_01"
PedModel1[joaat("s_m_m_gaffer_01")] = "s_m_m_gaffer_01"
PedModel1[joaat("s_m_m_gardener_01")] = "s_m_m_gardener_01"
PedModel1[joaat("s_m_m_gentransport")] = "s_m_m_gentransport"
PedModel1[joaat("s_m_m_hairdress_01")] = "s_m_m_hairdress_01"
PedModel1[joaat("s_m_m_highsec_01")] = "s_m_m_highsec_01"
PedModel1[joaat("s_m_m_highsec_02")] = "s_m_m_highsec_02"
PedModel1[joaat("s_m_m_highsec_03")] = "s_m_m_highsec_03"
PedModel1[joaat("s_m_m_highsec_04")] = "s_m_m_highsec_04"
PedModel1[joaat("s_m_m_janitor")] = "s_m_m_janitor"
PedModel1[joaat("s_m_m_lathandy_01")] = "s_m_m_lathandy_01"
PedModel1[joaat("s_m_m_lifeinvad_01")] = "s_m_m_lifeinvad_01"
PedModel1[joaat("s_m_m_linecook")] = "s_m_m_linecook"
PedModel1[joaat("s_m_m_lsmetro_01")] = "s_m_m_lsmetro_01"
PedModel1[joaat("s_m_m_mariachi_01")] = "s_m_m_mariachi_01"
PedModel1[joaat("s_m_m_marine_01")] = "s_m_m_marine_01"
PedModel1[joaat("s_m_m_marine_02")] = "s_m_m_marine_02"
PedModel1[joaat("s_m_m_migrant_01")] = "s_m_m_migrant_01"
PedModel1[joaat("s_m_m_movalien_01")] = "s_m_m_movalien_01"
PedModel1[joaat("s_m_m_movprem_01")] = "s_m_m_movprem_01"
PedModel1[joaat("s_m_m_movspace_01")] = "s_m_m_movspace_01"
PedModel1[joaat("s_m_m_paramedic_01")] = "s_m_m_paramedic_01"
PedModel1[joaat("s_m_m_pilot_01")] = "s_m_m_pilot_01"
PedModel1[joaat("s_m_m_pilot_02")] = "s_m_m_pilot_02"
PedModel1[joaat("s_m_m_postal_01")] = "s_m_m_postal_01"
PedModel1[joaat("s_m_m_postal_02")] = "s_m_m_postal_02"
PedModel1[joaat("s_m_m_prisguard_01")] = "s_m_m_prisguard_01"
PedModel1[joaat("s_m_m_scientist_01")] = "s_m_m_scientist_01"
PedModel1[joaat("s_m_m_security_01")] = "s_m_m_security_01"
PedModel1[joaat("s_m_m_snowcop_01")] = "s_m_m_snowcop_01"
PedModel1[joaat("s_m_m_strperf_01")] = "s_m_m_strperf_01"
PedModel1[joaat("s_m_m_strpreach_01")] = "s_m_m_strpreach_01"
PedModel1[joaat("s_m_m_strvend_01")] = "s_m_m_strvend_01"
PedModel1[joaat("s_m_m_trucker_01")] = "s_m_m_trucker_01"
PedModel1[joaat("s_m_m_ups_01")] = "s_m_m_ups_01"
PedModel1[joaat("s_m_m_ups_02")] = "s_m_m_ups_02"
PedModel1[joaat("s_m_o_busker_01")] = "s_m_o_busker_01"
PedModel1[joaat("s_m_y_airworker")] = "s_m_y_airworker"
PedModel1[joaat("s_m_y_ammucity_01")] = "s_m_y_ammucity_01"
PedModel1[joaat("s_m_y_armymech_01")] = "s_m_y_armymech_01"
PedModel1[joaat("s_m_y_autopsy_01")] = "s_m_y_autopsy_01"
PedModel1[joaat("s_m_y_barman_01")] = "s_m_y_barman_01"
PedModel1[joaat("s_m_y_baywatch_01")] = "s_m_y_baywatch_01"
PedModel1[joaat("s_m_y_blackops_01")] = "s_m_y_blackops_01"
PedModel1[joaat("s_m_y_blackops_02")] = "s_m_y_blackops_02"
PedModel1[joaat("s_m_y_blackops_03")] = "s_m_y_blackops_03"
PedModel1[joaat("s_m_y_busboy_01")] = "s_m_y_busboy_01"
PedModel1[joaat("s_m_y_casino_01")] = "s_m_y_casino_01"
PedModel1[joaat("s_m_y_chef_01")] = "s_m_y_chef_01"
PedModel1[joaat("s_m_y_clown_01")] = "s_m_y_clown_01"
PedModel1[joaat("s_m_y_clubbar_01")] = "s_m_y_clubbar_01"
PedModel1[joaat("s_m_y_construct_01")] = "s_m_y_construct_01"
PedModel1[joaat("s_m_y_construct_02")] = "s_m_y_construct_02"
PedModel1[joaat("s_m_y_cop_01")] = "s_m_y_cop_01"
PedModel1[joaat("s_m_y_dealer_01")] = "s_m_y_dealer_01"
PedModel1[joaat("s_m_y_devinsec_01")] = "s_m_y_devinsec_01"
PedModel1[joaat("s_m_y_dockwork_01")] = "s_m_y_dockwork_01"
PedModel1[joaat("s_m_y_doorman_01")] = "s_m_y_doorman_01"
PedModel1[joaat("s_m_y_dwservice_01")] = "s_m_y_dwservice_01"
PedModel1[joaat("s_m_y_dwservice_02")] = "s_m_y_dwservice_02"
PedModel1[joaat("s_m_y_factory_01")] = "s_m_y_factory_01"
PedModel1[joaat("s_m_y_fireman_01")] = "s_m_y_fireman_01"
PedModel1[joaat("s_m_y_garbage")] = "s_m_y_garbage"
PedModel1[joaat("s_m_y_grip_01")] = "s_m_y_grip_01"
PedModel1[joaat("s_m_y_hwaycop_01")] = "s_m_y_hwaycop_01"
PedModel1[joaat("s_m_y_marine_01")] = "s_m_y_marine_01"
PedModel1[joaat("s_m_y_marine_02")] = "s_m_y_marine_02"
PedModel1[joaat("s_m_y_marine_03")] = "s_m_y_marine_03"
PedModel1[joaat("s_m_y_mime")] = "s_m_y_mime"
PedModel1[joaat("s_m_y_pestcont_01")] = "s_m_y_pestcont_01"
PedModel1[joaat("s_m_y_pilot_01")] = "s_m_y_pilot_01"
PedModel1[joaat("s_m_y_prismuscl_01")] = "s_m_y_prismuscl_01"
PedModel1[joaat("s_m_y_prisoner_01")] = "s_m_y_prisoner_01"
PedModel1[joaat("s_m_y_ranger_01")] = "s_m_y_ranger_01"
PedModel1[joaat("s_m_y_robber_01")] = "s_m_y_robber_01"
PedModel1[joaat("s_m_y_sheriff_01")] = "s_m_y_sheriff_01"
PedModel1[joaat("s_m_y_shop_mask")] = "s_m_y_shop_mask"
PedModel1[joaat("s_m_y_strvend_01")] = "s_m_y_strvend_01"
PedModel1[joaat("s_m_y_swat_01")] = "s_m_y_swat_01"
PedModel1[joaat("s_m_y_uscg_01")] = "s_m_y_uscg_01"
PedModel1[joaat("s_m_y_valet_01")] = "s_m_y_valet_01"
PedModel1[joaat("s_m_y_waiter_01")] = "s_m_y_waiter_01"
PedModel1[joaat("s_m_y_waretech_01")] = "s_m_y_waretech_01"
PedModel1[joaat("s_m_y_westsec_01")] = "s_m_y_westsec_01"
PedModel1[joaat("s_m_y_westsec_02")] = "s_m_y_westsec_02"
PedModel1[joaat("s_m_y_winclean_01")] = "s_m_y_winclean_01"
PedModel1[joaat("s_m_y_xmech_01")] = "s_m_y_xmech_01"
PedModel1[joaat("s_m_y_xmech_02")] = "s_m_y_xmech_02"
PedModel1[joaat("s_m_y_xmech_02_mp")] = "s_m_y_xmech_02_mp"
PedModel1[joaat("u_f_m_casinocash_01")] = "u_f_m_casinocash_01"
PedModel1[joaat("u_f_m_casinoshop_01")] = "u_f_m_casinoshop_01"
PedModel1[joaat("u_f_m_corpse_01")] = "u_f_m_corpse_01"
PedModel1[joaat("u_f_m_debbie_01")] = "u_f_m_debbie_01"
PedModel1[joaat("u_f_m_drowned_01")] = "u_f_m_drowned_01"
PedModel1[joaat("u_f_m_miranda")] = "u_f_m_miranda"
PedModel1[joaat("u_f_m_miranda_02")] = "u_f_m_miranda_02"
PedModel1[joaat("u_f_m_promourn_01")] = "u_f_m_promourn_01"
PedModel1[joaat("u_f_o_carol")] = "u_f_o_carol"
PedModel1[joaat("u_f_o_eileen")] = "u_f_o_eileen"
PedModel1[joaat("u_f_o_moviestar")] = "u_f_o_moviestar"
PedModel1[joaat("u_f_o_prolhost_01")] = "u_f_o_prolhost_01"
PedModel1[joaat("u_f_y_beth")] = "u_f_y_beth"
PedModel1[joaat("u_f_y_bikerchic")] = "u_f_y_bikerchic"
PedModel1[joaat("u_f_y_comjane")] = "u_f_y_comjane"
PedModel1[joaat("u_f_y_corpse_01")] = "u_f_y_corpse_01"
PedModel1[joaat("u_f_y_corpse_02")] = "u_f_y_corpse_02"
PedModel1[joaat("u_f_y_danceburl_01")] = "u_f_y_danceburl_01"
PedModel1[joaat("u_f_y_dancelthr_01")] = "u_f_y_dancelthr_01"
PedModel1[joaat("u_f_y_dancerave_01")] = "u_f_y_dancerave_01"
PedModel1[joaat("u_f_y_hotposh_01")] = "u_f_y_hotposh_01"
PedModel1[joaat("u_f_y_jewelass_01")] = "u_f_y_jewelass_01"
PedModel1[joaat("u_f_y_lauren")] = "u_f_y_lauren"
PedModel1[joaat("u_f_y_mistress")] = "u_f_y_mistress"
PedModel1[joaat("u_f_y_poppymich")] = "u_f_y_poppymich"
PedModel1[joaat("u_f_y_poppymich_02")] = "u_f_y_poppymich_02"
PedModel1[joaat("u_f_y_princess")] = "u_f_y_princess"
PedModel1[joaat("u_f_y_spyactress")] = "u_f_y_spyactress"
PedModel1[joaat("u_f_y_taylor")] = "u_f_y_taylor"
PedModel1[joaat("u_m_m_aldinapoli")] = "u_m_m_aldinapoli"
PedModel1[joaat("u_m_m_bankman")] = "u_m_m_bankman"
PedModel1[joaat("u_m_m_bikehire_01")] = "u_m_m_bikehire_01"
PedModel1[joaat("u_m_m_blane")] = "u_m_m_blane"
PedModel1[joaat("u_m_m_curtis")] = "u_m_m_curtis"
PedModel1[joaat("u_m_m_doa_01")] = "u_m_m_doa_01"
PedModel1[joaat("u_m_m_edtoh")] = "u_m_m_edtoh"
PedModel1[joaat("u_m_m_fibarchitect")] = "u_m_m_fibarchitect"
PedModel1[joaat("u_m_m_filmdirector")] = "u_m_m_filmdirector"
PedModel1[joaat("u_m_m_glenstank_01")] = "u_m_m_glenstank_01"
PedModel1[joaat("u_m_m_griff_01")] = "u_m_m_griff_01"
PedModel1[joaat("u_m_m_jesus_01")] = "u_m_m_jesus_01"
PedModel1[joaat("u_m_m_jewelsec_01")] = "u_m_m_jewelsec_01"
PedModel1[joaat("u_m_m_jewelthief")] = "u_m_m_jewelthief"
PedModel1[joaat("u_m_m_markfost")] = "u_m_m_markfost"
PedModel1[joaat("u_m_m_prolsec_01")] = "u_m_m_prolsec_01"
PedModel1[joaat("u_m_m_promourn_01")] = "u_m_m_promourn_01"
PedModel1[joaat("u_m_m_rivalpap")] = "u_m_m_rivalpap"
PedModel1[joaat("u_m_m_spyactor")] = "u_m_m_spyactor"
PedModel1[joaat("u_m_m_streetart_01")] = "u_m_m_streetart_01"
PedModel1[joaat("u_m_m_vince")] = "u_m_m_vince"
PedModel1[joaat("u_m_m_willyfist")] = "u_m_m_willyfist"
PedModel1[joaat("u_m_o_dean")] = "u_m_o_dean"
PedModel1[joaat("u_m_o_filmnoir")] = "u_m_o_filmnoir"
PedModel1[joaat("u_m_o_finguru_01")] = "u_m_o_finguru_01"
PedModel1[joaat("u_m_o_taphillbilly")] = "u_m_o_taphillbilly"
PedModel1[joaat("u_m_o_tramp_01")] = "u_m_o_tramp_01"
PedModel1[joaat("u_m_y_abner")] = "u_m_y_abner"
PedModel1[joaat("u_m_y_antonb")] = "u_m_y_antonb"
PedModel1[joaat("u_m_y_babyd")] = "u_m_y_babyd"
PedModel1[joaat("u_m_y_baygor")] = "u_m_y_baygor"
PedModel1[joaat("u_m_y_burgerdrug_01")] = "u_m_y_burgerdrug_01"
PedModel1[joaat("u_m_y_caleb")] = "u_m_y_caleb"
PedModel1[joaat("u_m_y_cyclist_01")] = "u_m_y_cyclist_01"
PedModel1[joaat("u_m_y_dancerave_01")] = "u_m_y_dancerave_01"
PedModel1[joaat("u_m_y_fibmugger_01")] = "u_m_y_fibmugger_01"
PedModel1[joaat("u_m_y_gabriel")] = "u_m_y_gabriel"
PedModel1[joaat("u_m_y_guido_01")] = "u_m_y_guido_01"
PedModel1[joaat("u_m_y_gunvend_01")] = "u_m_y_gunvend_01"
PedModel1[joaat("u_m_y_hippie_01")] = "u_m_y_hippie_01"
PedModel1[joaat("u_m_y_imporage")] = "u_m_y_imporage"
PedModel1[joaat("u_m_y_juggernaut_01")] = "u_m_y_juggernaut_01"
PedModel1[joaat("u_m_y_justin")] = "u_m_y_justin"
PedModel1[joaat("u_m_y_mani")] = "u_m_y_mani"
PedModel1[joaat("u_m_y_militarybum")] = "u_m_y_militarybum"
PedModel1[joaat("u_m_y_paparazzi")] = "u_m_y_paparazzi"
PedModel1[joaat("u_m_y_party_01")] = "u_m_y_party_01"
PedModel1[joaat("u_m_y_pogo_01")] = "u_m_y_pogo_01"
PedModel1[joaat("u_m_y_prisoner_01")] = "u_m_y_prisoner_01"
PedModel1[joaat("u_m_y_proldriver_01")] = "u_m_y_proldriver_01"
PedModel1[joaat("u_m_y_rsranger_01")] = "Space Ranger"
PedModel1[joaat("u_m_y_sbike")] = "u_m_y_sbike"
PedModel1[joaat("u_m_y_smugmech_01")] = "u_m_y_smugmech_01"
PedModel1[joaat("u_m_y_staggrm_01")] = "u_m_y_staggrm_01"
PedModel1[joaat("u_m_y_tattoo_01")] = "u_m_y_tattoo_01"
PedModel1[joaat("u_m_y_ushi")] = "u_m_y_ushi"
PedModel1[joaat("u_m_y_zombie_01")] = "u_m_y_zombie_01"
local PedSelf = {}
PedSelf[joaat("mp_m_freemode_01")] = "Male"
PedSelf[joaat("mp_f_freemode_01")] = "Female"
local animal_hash = joaat("a_c_cat_01")
local ped_hash = joaat("player_one")
local bird_hash = joaat("a_c_seagull")
local sea_hash = joaat("a_c_dolphin")
local self_hash = joaat("mp_m_freemode_01")
pedMenu:add_array_item("Set Delay First", {"1", "2", "3", "4", "5", "6", "7", "8"}, function() return xox_31 end, function(value) xox_31 = value if value == 1 then duFF = 0.01 elseif value == 2 then duFF = 0.05 elseif value == 3 then duFF = 0.08 elseif value == 4 then duFF = 0.1 elseif value == 5 then duFF = 0.15 elseif value == 6 then duFF = 0.2 elseif value == 7 then duFF = 0.25 else duFF = 0.3 end end) pedMenu:add_action("---", function() end)
pedMenu:add_array_item("Normal Skin", PedSelf, function() return self_hash end, function(value) self_hash = value globals.set_int(NORS1, 1) globals.set_int(NORS2, value) sleep(duFF) globals.set_int(NORS1, 0) end)
pedMenu:add_array_item("Animals", PedModelAnimal, function() return animal_hash end, function(value) animal_hash = value globals.set_int(NORS1, 1) globals.set_int(NORS2, value) sleep(duFF) globals.set_int(NORS1, 0) end)
pedMenu:add_array_item("Peds", PedModel1, function() return ped_hash end, function(value) ped_hash = value globals.set_int(NORS1, 1) globals.set_int(NORS2, value) sleep(duFF) globals.set_int(NORS1, 0) end) 
pedMenu:add_array_item("Birds", PedModelBird, function() return bird_hash end, function(value) bird_hash = value globals.set_int(NORS1, 1) globals.set_int(NORS2, value) sleep(duFF) globals.set_int(NORS1, 0) end)
pedMenu:add_array_item("Sea Animals", PedModelSeaAnimal, function() return sea_hash end, function(value) sea_hash = value globals.set_int(NORS1, 1) globals.set_int(NORS2, value) sleep(duFF) globals.set_int(NORS1, 0) end)
pedMenu:add_action("Become Bigfoot", function()	globals.set_int(NORS1, 1) globals.set_int(NORS2, -1389097126) sleep(duFF) globals.set_int(NORS1, 0) end)
pedMenu:add_action("      ---[Change delay if not working]---", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGNOCLP = Self:add_submenu("NoClip Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGNOCLP:add_toggle("NoClip", function()
 return enable end, function()
 enable = not enable NoClip(enable) end)
 L7NEGNOCLP:add_int_range("NoClip Speed", 1, 1, 10, function()
 return speed end, function(i) speed = i end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
--© 2023 L7NEG's Official Discord Server. All Rights Reserved--

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG5 = L7NEG:add_submenu("Missions Selector And cooldown Menu")

function mpx()return stats.get_int("MPPLY_LAST_MP_CHAR")end

local function mpx()
	return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG5:add_array_item("Auto Shop Heist Select>", { "Unselected", "Union Depository", "Superdollar Deal", "Bank Contract", "ECU Job", "Prison Contract", "Agency Deal", "LOST Contract", "Data Contract" },
function() return stats.get_int(mpx() .. "TUNER_CURRENT")+2 end, function(v) stats.set_int(mpx() .. "TUNER_CURRENT", v-2)
stats.set_int(mpx() .. "TUNER_GEN_BS", 12543) end)

L7NEG5:add_array_item("ULP Contract Select>", { "Intelligece", "Counterintelligence", "Extraction", "Asset Seizure", "Operation Paper Trail", "CleanUp" }, function()
return stats.get_int(mpx() .. "ULP_MISSION_CURRENT")+1 end, function(v)
	if stats.get_int(mpx() .. "ULP_MISSION_CURRENT")==v-1 then return end C=stats.get_int(mpx() .. "ULP_MISSION_CURRENT") V=0
	if stats.get_int(mpx() .. "ULP_MISSION_CURRENT")<v-1 then for i=C,5 do V=V+2^i-1 end for i=0,v-1 do V=V+2^i-1 end else for i=0,v-1 do V=V+2^i-1 end end
	stats.set_int(mpx() .. "ULP_MISSION_CURRENT", v-1) stats.set_int(mpx() .. "ULP_MISSION_PROGRESS", stats.get_int(mpx() .. "ULP_MISSION_PROGRESS")+V)
end)

local L7NEGDRGWR={"Designated Driver[2]","FatalIncursion[3]","Uncontrolled Substance[4]","Make War not Love[5]","Off the Rails[6]","This is an Intervention[7]","Unusual Suspects[8]","FriedMind[9]","Checking In[10]","BDKD[11]"}
L7NEGDRGWR[0]="Welcome to the Troupe[1]"
L7NEG5:add_array_item("Dose Missions>", L7NEGDRGWR, function() return stats.get_int(mpx() .. "XM22_CURRENT") end, function(v)
	stats.set_int(mpx() .. "XM22_CURRENT",v)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
          globals.set_int(278108, 6000000)
          globals.set_int(277873, 0)
          globals.set_int(277874, 0)
        end
          globals.set_int(4536677,  0)
          globals.set_int(4536678,  0)
          globals.set_int(4536679,  0)


        if scrSecuroServ:is_active() then
          scrSecuroServ:set_int(737, 1)
          sleep(1)
          scrSecuroServ:set_int(738, 1)
          sleep(1)
          scrSecuroServ:set_int(556, 3012)
        end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        if scrSellContraband:is_active() then
          scrSellContraband:set_int(1136, 1)
          scrSellContraband:set_int(596, 0)
          scrSellContraband:set_int(1125, 0)

          scrSellContraband:set_int(548, 7)
          sleep(1)
          scrSellContraband:set_int(542,  99999)
        end
      end
    end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    if scrBuyContraband:is_active() then
        sleep(1)
        scrBuyContraband:set_int(604, 1)
        scrBuyContraband:set_int(600, 111)  
        scrBuyContraband:set_int(790, 6)
        scrBuyContraband:set_int(791, 4)
      end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7:add_toggle("Start Ceo Manager",
  function()
    return boolCeoBanager
  end,
  function()
    boolCeoBanager = not boolCeoBanager;
    funcCeoBanger(boolCeoBanager)
  end
)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG9 = L7NEG7:add_submenu("Ultimate Money Manager Settings")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGML = L7NEG7:add_submenu("Nighclub Money Loop 250k/10s")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local isRunning = false
local function safeLoop()
    while isRunning do
        stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
        stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
        sleep(1.5)
        stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
        stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
        sleep(1.5)
        stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
        stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
        sleep(1.5)
        stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
        stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
        sleep(1.5)
        stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
        stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
        sleep(4)
    end
end
 
L7NEGML:add_toggle(
    "Nightclub Safe Loop $250k/10s (AFK)",
    function()
        return isRunning
    end,
    function()
        isRunning = not isRunning
        safeLoop()
    end
)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7negWepMenu:add_action("Unlock Double Action Revolver",function()
if (stats.get_masked_int(MPX .. "GANGOPSPSTAT_INT102", 24, 8)<3) then
	stats.set_masked_int(MPX .. "GANGOPSPSTAT_INT102", 3, 24, 8)
end
if (stats.get_masked_int(MPX .. "GANGOPSPSTAT_INT102", 24, 8) > 3) then
	stats.set_masked_int(MPX .. "GANGOPSPSTAT_INT102", 0, 24, 8)
end
end)
	
L7negWepMenu:add_action("Unlock Stone Hatchet",function()
if (stats.get_masked_int("MP_NGDLCPSTAT_INT0", 16, 8)<5)then
	stats.set_masked_int("MP_NGDLCPSTAT_INT0", 5, 16, 8)
end
if (stats.get_masked_int("MP_NGDLCPSTAT_INT0", 16, 8)>5)then
	stats.set_masked_int("MP_NGDLCPSTAT_INT0", 0, 16, 8)
end	
end)

L7negWepMenu:add_action("Unlock Guns And Skins", function()
	stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED", -1)
	stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED2", -1)
	stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED3", -1)
	stats.set_int(MPX .. "CHAR_WEAP_UNLOCKED4", -1)
	stats.set_int(MPX .. "CHAR_WEAP_ADDON_1_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_WEAP_ADDON_2_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_WEAP_ADDON_3_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_WEAP_ADDON_4_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_WEAP_FREE", -1)
	stats.set_int(MPX .. "CHAR_WEAP_FREE2", -1)
	stats.set_int(MPX .. "CHAR_FM_WEAP_FREE", -1)
	stats.set_int(MPX .. "CHAR_FM_WEAP_FREE2", -1)
	stats.set_int(MPX .. "CHAR_FM_WEAP_FREE3", -1)
	stats.set_int(MPX .. "CHAR_FM_WEAP_FREE4", -1)
	stats.set_int(MPX .. "CHAR_WEAP_PURCHASED", -1)
	stats.set_int(MPX .. "CHAR_WEAP_PURCHASED2", -1)
	stats.set_int(MPX .. "WEAPON_PICKUP_BITSET", -1)
	stats.set_int(MPX .. "WEAPON_PICKUP_BITSET2", -1)
	stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED", -1)
	stats.set_int(MPX .. "NO_WEAPONS_UNLOCK", -1)
	stats.set_int(MPX .. "NO_WEAPON_MODS_UNLOCK", -1)
	stats.set_int(MPX .. "NO_WEAPON_CLR_MOD_UNLOCK", -1) 
	stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED2", -1)
	stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED3", -1)
	stats.set_int(MPX .. "CHAR_FM_WEAP_UNLOCKED4", -1)
	stats.set_int(MPX .. "CHAR_KIT_1_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_2_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_3_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_4_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_5_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_6_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_7_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_8_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_9_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_10_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_11_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_12_FM_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE", -1)
	stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE", -1)
	stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE2", -1)
	stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE3", -1)
	stats.set_int(MPX .. "CHAR_WEAP_FM_PURCHASE4", -1)
	stats.set_int(MPX .. "FIREWORK_TYPE_1_WHITE", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_1_RED", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_1_BLUE", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_2_WHITE", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_2_RED", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_2_BLUE", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_3_WHITE", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_3_RED", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_3_BLUE", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_4_WHITE", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_4_RED", 1000)
	stats.set_int(MPX .. "FIREWORK_TYPE_4_BLUE", 1000)
	stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH", -1)
   for i = 2, 19 do
      stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH"..i, -1) end
   for j = 1, 19 do
      stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_"..j.."_UNLCK", -1) end
   for m = 1, 41 do
      stats.set_int(MPX .. "CHAR_KIT_"..m.."_FM_UNLCK", -1) end
   for l = 2, 41 do
      stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE"..l, -1) end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGSNOW = L7NEGEVENTS:add_submenu("Snow Toggle Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local snowAddress = 262145 + 4752
local isEnabled = false
 
function toggleSnow()
    isEnabled = not isEnabled
    globals.set_boolean(snowAddress, isEnabled)
end
 
L7NEGSNOW:add_toggle("Toggle Snow", function()
    return globals.get_boolean(snowAddress)
end, toggleSnow)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG6:add_action("LSCM Prize Ride Unlock", function() 
stats.set_bool(MPX .. "CARMEET_PV_CHLLGE_CMPLT", true) end)

L7NEG5:add_action("Remove Dax Missions CoolDown ", function()
	function MPX()return stats.get_int("MPPLY_LAST_MP_CHAR")end 
	   stats.set_int("MP"..MPX().."_XM22JUGGALOWORKCDTIMER", -1) 
end)

L7NEG5:add_action("Remove VIP/MC Cool Down", function() 
stats.set_int("MPPLY_VIPGAMEPLAYDISABLEDTIMER", 0) end)

L7NEG5:add_action("Skip Lamar Mision", function() 
stats.set_bool(MPX .. "LOW_FLOW_CS_DRV_SEEN", true) 
stats.set_bool(MPX .. "LOW_FLOW_CS_TRA_SEEN", true) 
stats.set_bool(MPX .. "LOW_FLOW_CS_FUN_SEEN", true) 
stats.set_bool(MPX .. "LOW_FLOW_CS_PHO_SEEN", true) 
stats.set_bool(MPX .. "LOW_FLOW_CS_FIN_SEEN", true) 
stats.set_bool(MPX .. "LOW_BEN_INTRO_CS_SEEN", true) 
stats.set_int(MPX .. "LOWRIDER_FLOW_COMPLETE", 4) 
stats.set_int(MPX .. "LOW_FLOW_CURRENT_PROG", 9) 
stats.set_int(MPX .. "LOW_FLOW_CURRENT_CALL", 9) 
stats.set_int(MPX .. "LOW_FLOW_CS_HELPTEXT", 66) end) 

L7NEG5:add_action("Skip Yatch Misions", function() 
stats.set_int(MPX .. "YACHT_MISSION_PROG", 0) 
stats.set_int(MPX .. "YACHT_MISSION_FLOW", 21845) 
stats.set_int(MPX .. "CASINO_DECORATION_GIFT_1", -1) end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG1 = L7NEG:add_submenu("Credits")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
L7NEG1:add_action("---Kiddion---", function() end)

L7NEG1:add_action("---Ryze---", function() end)

L7NEG1:add_action("---github.com/@dr-NHA---", function() end)

L7NEG1:add_action("---Discord:@eaztea/TeaTimeTea aka slon---", function() end)

L7NEG1:add_action("---Discord:@mxgta---", function() end)

L7NEG1:add_action("---Apple Vegas---", function() end)

L7NEG1:add_action("---B1GBOOM---", function() end)

L7NEG1:add_action("---github.com/@ezeholz---", function() end)

L7NEG1:add_action("Discord Server For Any Help", function() end)

L7NEG1:add_action("https://sub.l7neg.tk/discord", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
														

	L7NEG10 = L7NEG9:add_submenu("Get Crates")

	L7NEG10:add_action("1-10 per Press", function() for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end end)
	
			GCv0 = false
		local function GCv1()
		while GCv0 == true do for i = 12, 16 do stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX) end end end
	L7NEG10:add_toggle("Crates Loop", function() return GCv0 end, function() GCv0 = not GCv0 GCv1(GCv0) end)
	
			GCv2 = 1
	L7NEG10:add_int_range("Instant Buy", 1, 1, 111, function() return GCv2 end, 
		function(CV) if GCB:is_active() then
					    GCB:set_int(598 + 6, 1)
					    GCB:set_int(598 + 2, CV)
					    GCB:set_int(598 + 192, 6)
					    GCB:set_int(598 + 193, 4)
					    GCv2 = CV end end)
	
	L7NEG10:add_action("", function() end)
	
	L7NEG10N = L7NEG10:add_submenu("Read Me")
	
	L7NEG10N:add_action("                       Crates Loop:", function() end) 
	L7NEG10N:add_action("                	 To turn off the loop,", function() end) 
	L7NEG10N:add_action("     close the menu via «Menu Settings»", function() end) 
	L7NEG10N:add_action("", function() end) 
	L7NEG10N:add_action("                       Instant Buy:", function() end) 
	L7NEG10N:add_action("       Start the buy mission first, select", function() end) 
	L7NEG10N:add_action("      the number of crates and activate", function() end) 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

L7NEG8 = L7NEG7:add_submenu("WareHouse Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG8:add_action("--------------Warehouse Profile Editor--------------", function() end)
L7NEG8:add_int_range("Change Lifetime Sales", 1, 0, 10000, function()
PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
                                       return 
                           stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE") end,   function(value)
                           stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", value) 
                           stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", value) 
                           stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", value) 
                           stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", value)

 end)

L7NEG8:add_int_range("Change Lifetime Earnings Made", 200000.0, 0, 10000000, function()
PlayerIndex = globals.get_int(1574918)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
                                       return 
   stats.get_int(MPX .. "LIFETIME_CONTRA_EARNINGS") end,           
	   function(value) 
stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", value * 1)
 end)

L7NEG8:add_action(
    "Auto-Reset stats-0/0Sales",
    function()
        stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE",  0)
        stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", 0)
        stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE",  0)
        stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN",  0)
        stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS",  0)
        globals.set_int(1575017, 1)         ----PlayerSessionBlank--------
        globals.set_int(1574589, 1)         ----PlayerSessionNew----------
        sleep(0.2)
        globals.set_int(1574589, 0)         ----PlayerSessionNew------
    end
)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1=262145+29939

--DV= Enable Deleted Vehicles---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DV1=262145+14914
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

--HA=Unlock Hats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HA1=262145+12764
HA2=262145+12773
HA3=262145+8468
HA4=262145+8473
HA5=262145+21301
HA6=262145+21302
HA7=262145+21309
HA8=262145+21312
HA9=262145+21314
HA10=262145+21289
HA11=262145+21292
HA12=262145+21298

--BS=Unlock Brand Shirts--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
BS11=262145+24214
BS12=262145+24215
BS13=262145+18255

--KT=Unlock Knock Offs T-shirts-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

KT1=262145+24403
KT2=262145+24412

--MC=Unlock Manufactures Clothing-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MC1=262145+15400
MC2=262145+17712
MC3=262145+17733
MC4=262145+26030
MC5=262145+26097

--MS=Unlock Movie Shirts--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MS1=262145+12127
MS2=262145+12136
MS3=262145+11964
MS4=262145+12774
MS5=262145+12786

--RS=Unlock Radio Station T-shirts----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RS1=262145+24386
RS2=262145+24391
RS3=262145+24393
RS4=262145+24394
RS5=262145+24396
RS6=262145+24398
RS7=262145+24399
RS8=262145+24926
RS9=262145+24945

--CT=Unlock Clubs T-shirts------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CT1=262145+24886
CT2=262145+24894

--SH=Unlock Shirts--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

--AR=Arcade and Casino Clothing-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AR1=262145+28523
AR2=262145+28542			 

--NORS=Skin Changer-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

NORS1=2639889+61

NORS2=2639889+48

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7N = L7NEG7:add_submenu("Tutorial ReadMe")

L7NEG7N:add_action("     Ceo Crates Method       ", function() end)
L7NEG7N:add_action("   First Enter Your Warehouse   ", function() end)
L7NEG7N:add_action("Next Start Ultimate Money Manager       ", function() end)
L7NEG7N:add_action("     Finally Active The Auto Sell Afk       ", function() end)
L7NEG7N:add_action("", function() end)
L7NEG7N:add_action("https://sub.l7neg.tk/discord", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
                         -> Ultimate controller  
                         -> Simple Manager by SLON                                                                                                       
                         -> RyzeKiddions.lua by Pichocles#0427  
                         -> API - Thank you kiddion <3 
                         -> https://github.com/dr-NHA/
                         -> Complied & Editied By L7NEG 
--]]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
