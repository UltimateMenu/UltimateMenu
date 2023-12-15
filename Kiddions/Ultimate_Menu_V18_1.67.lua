--[[SET NO CLIP CONTROLS BELOW
USE LINK BELOW TO FIND THE KEYCODE VALUES YOU NEED
https://keycodes.l7neg.tk/ ]]

--[[No-Clip Controls
Arrow Keys			= Forward/backward/turn left/turn right
Left Ctrl, Shift	= Go Down/Up
Numpad / (divide )	= Enable/Disable Noclip
Numpad + - keys		= Increase/Decrease Noclip Speed
--]]

go_up = 16
go_down = 17
go_forward = 38
go_back = 40
turn_left = 37
turn_right = 39
dec_speed = 109
inc_speed = 107

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG = menu.add_submenu("\u{1F53B}" .. " Ultimate Menu 1.68 By L7NEG " .. "\u{1F53B}")

local function Text(text)
	L7NEG:add_action(text, function() end)
end

Text("-----------------------------------------------------")
Text("       ✅ Ultimate Menu 1.67 [V18] ✅ ")
Text("-----------------------------------------------------")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Text("------------------User Info-----------------------")

L7NEG:add_int_range("Your level", 0, 1, 8000, function()
	return stats.get_int(MPX .. "CHAR_RANK_FM")
end, function(value) end)

L7NEG:add_int_range("Your RP Value", 0, 1, 1787576850, function()
	return stats.get_int(MPX .. "CHAR_XP_FM")
end, function(value) end)

L7NEG:add_int_range("Current Crew Level", 0, 1, 8000, function()
	return stats.get_int("MPPLY_CURRENT_CREW_RANK")
end, function(value) end)

Text("----------------------------------------------------")

Self = L7NEG:add_submenu("Self")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Uv0 = false
local function SexChanger(On)
	if On then
		stats.set_int(MPX .. "ALLOW_GENDER_CHANGE", 52)
	else
		stats.set_int(MPX .. "ALLOW_GENDER_CHANGE", 0)
	end
end
Self:add_toggle("Unlock «Change Gender»", function()
	return Uv0
end, function()
	Uv0 = not Uv0
	SexChanger(Uv0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_array_item("Online Session", {
	"Join Public",
	"Start New Public",
	"Invite Only",
	"Closed Crew Session",
	"Crew Session",
	"Closed Friend Session",
	"Find Friend Session",
	"Solo Session",
	"Leave Online",
}, function()
	return xox_0
end, function(value)
	xox_0 = value
	if value == 1 then
		globals.set_int(1575032, 0)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 2 then
		globals.set_int(1575032, 1)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 3 then
		globals.set_int(1575032, 11)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 4 then
		globals.set_int(1575032, 2)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 5 then
		globals.set_int(1575032, 3)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 6 then
		globals.set_int(1575032, 6)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 7 then
		globals.set_int(1575032, 9)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 8 then
		globals.set_int(1575032, 8)
		globals.set_int(1574589, 1)
		sleep(0.2)
		globals.set_int(1574589, 0)
	elseif value == 9 then
		menu.disconnect_session()
	end
end)

a74 = 1
Self:add_array_item("Bad Sport", { "Add", "Remove" }, function()
	return a74
end, function(BadSport)
	if BadSport == 1 then
		stats.set_int("MPPLY_BADSPORT_MESSAGE", -1)
		stats.set_int("MPPLY_BECAME_BADSPORT_NUM", -1)
		stats.set_float("MPPLY_OVERALL_BADSPORT", 60000)
		stats.set_bool("MPPLY_CHAR_IS_BADSPORT", true)
		globals.set_int(1575032, 8)
		globals.set_int(1574589, 1)
		sleep(3)
		globals.set_int(1574589, 0)
	elseif BadSport == 2 then
		stats.set_int("MPPLY_BADSPORT_MESSAGE", 0)
		stats.set_int("MPPLY_BECAME_BADSPORT_NUM", 0)
		stats.set_float("MPPLY_OVERALL_BADSPORT", 0)
		stats.set_bool("MPPLY_CHAR_IS_BADSPORT", false)
		globals.set_int(1575032, 8)
		globals.set_int(1574589, 1)
		sleep(3)
		globals.set_int(1574589, 0)
	end
	a74 = BadSport
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Self:add_action("Empty Session", function()
	menu.empty_session()
end)

GodModeState = false
Self:add_toggle("God Mode", function()
	return GodModeState
end, function()
	GodModeState = not GodModeState
	localplayer:set_godmode(GodModeState)
end)

SemiGod = false
SemiGodL = false

function SemiGodF()
	while true do
		if localplayer:get_health() ~= localplayer:get_max_health() then
			if SemiGod == true then
				menu.heal_all()
			end
		end
		sleep(0.2)
	end
end

Self:add_toggle("Semi-Godmode", function()
	return SemiGod
end, function(God)
	SemiGod = not SemiGod
	if SemiGodL == false then
		SemiGodF()
	else
		SemiGodL = true
	end
end)

Self:add_action("Heal Player", function()
	menu.heal_all()
end)

Self:add_action("Suicide", function()
	menu.suicide_player()
end)

Self:add_action("Equip Ballastic Equipment Directly", function()
	globals.set_int(REQS1 + 902, 1)
end)

PassiveMode = false

Self:add_toggle("Passive Mode", function()
	return PassiveMode
end, function()
	PassiveMode = not PassiveMode
	menu.set_passive(PassiveMode)
end)

Offradar = false

Self:add_toggle("Off Radar", function()
	return Offradar
end, function()
	Offradar = not Offradar
	menu.set_offradar(Offradar)
end)

OutOfSight = false

Self:add_toggle("Out Of Sight Area", function()
	return OutOfSight
end, function()
	OutOfSight = not OutOfSight
	menu.set_out_of_sight(OutOfSight)
end)

RevealPlayers = false

Self:add_toggle("Reveal All Players", function()
	return RevealPlayers
end, function()
	RevealPlayers = not RevealPlayers
	menu.set_reveal_player(RevealPlayers)
end)

BigMap = false

Self:add_toggle("Big Map", function()
	return BigMap
end, function()
	BigMap = not BigMap
	menu.set_big_map(BigMap)
end)

MobileRadio = false

Self:add_toggle("Mobile Radio", function()
	return MobileRadio
end, function()
	MobileRadio = not MobileRadio
	menu.set_mobile_radio(MobileRadio)
end)

Self:add_action("Remove Orbital Cannon Cooldown", function()
	stats.set_int(MPX .. "ORBITAL_CANNON_COOLDOWN", 0)
end)

Self:add_action("Remove Transaction Error", function()
	for i = 4537356, 4537358 do
		globals.set_int(i, 0)
	end
end)

Self:add_action("Refil Nightclub Popularity", function()
	stats.set_int(MPX .. "CLUB_POPULARITY", 1000)
end)

Self:add_array_item("Wanted Level", { "0", "1", "2", "3", "4", "5" }, function()
	return wantedlevel
end, function(value)
	if value == 1 then
		localplayer:set_wanted_level(0)
	elseif value == 2 then
		localplayer:set_wanted_level(1)
	elseif value == 3 then
		localplayer:set_wanted_level(2)
	elseif value == 4 then
		localplayer:set_wanted_level(3)
	elseif value == 5 then
		localplayer:set_wanted_level(4)
	elseif value == 6 then
		localplayer:set_wanted_level(5)
	end
	wantedlevel = value
end)

wantedlevel = 1

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
Config.SlamTypes = { "Rhino", "Khanjali", "Halftrack" }
Config.VehicleSpawnGlobal = 2640095
Config.TrickOrTreatBase = 2640095
Config.TrickOrTreatType = Config.TrickOrTreatBase + 579
Config.TrickOrTreatTimer = Config.TrickOrTreatBase + 581
Config.TrickOrTreatTrigger = Config.TrickOrTreatBase + 581 + 1
Config.ExplodeTpBack = true
Config.VehicleTypes = {}
Config.VehicleTypes["Criminal Enterprises"] = {
	"Vigero2",
	"Sm722",
	"Omnisegt",
	"Conada",
	"Ruiner4",
	"Brioso3",
	"Corsita",
	"Kanjosj",
	"Postlude",
	"Torero2",
	"Lm87",
	"Tenf",
	"Rhinehart",
	"Weevil2",
	"Greenwood",
}
Config.VehicleTypes["Super"] = { "Krieger", "Prototipo", "T20" }
Config.VehicleTypes["Sports"] = { "Kuruma", "Kuruma2" }
Config.VehicleTypes["Sports Classic"] = { "Toreador", "Artdent", "Deluxo" }
Config.VehicleTypes["Millitary"] = { "Rhino", "Khanjali", "Halftrack" }
Config.VehicleTypes["Bikes"] = { "Oppressor", "Oppressor2", "Akuma" }
Config.VehicleTypes["Planes"] = { "Hydra", "Lazer", "Titan", "Cargoplane" }

local function null() end

local function Text(submenu, text)
	if submenu ~= nil then
		submenu:add_action(text, null)
	else
		menu.add_action(text, null)
	end
end

local function sqrt(i)
	return math.sqrt(i)
end

local function DistanceToSqr(vec1, vec2)
	return ((vec2.x - vec1.x) ^ 2) + ((vec2.y - vec1.y) ^ 2) + ((vec2.z - vec1.z) ^ 2)
end

local function Distance(vec1, vec2)
	return sqrt(DistanceToSqr(vec1, vec2))
end

local function floor(num)
	return math.floor(num)
end

local function clamp(num, min, max)
	if num > max then
		return max
	elseif num < min then
		return min
	else
		return num
	end
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
	if not IsPlayer(ply) then
		return false
	end

	if ply:get_max_health() < 100 then
		return true
	end
	if ply:is_in_vehicle() and ply:get_godmode() then
		return true
	end
	if ply:get_run_speed() > 1.0 or ply:get_swim_speed() > 1.0 then
		return true
	end

	return false
end

local function GetPlayerCount()
	return player.get_number_of_players()
end

local function createVehicle(modelhash, pos)
	globals.set_int(Config.VehicleSpawnGlobal + 46, modelhash)
	globals.set_float(Config.VehicleSpawnGlobal + 42, pos.x)
	globals.set_float(Config.VehicleSpawnGlobal + 43, pos.y)
	globals.set_float(Config.VehicleSpawnGlobal + 44, pos.z)
	globals.set_boolean(Config.VehicleSpawnGlobal + 41, true)
end

local function GiveVehicle(ply, model)
	if not ply or ply == nil then
		return
	end
	local pos = ply:get_position()
	local heading = ply:get_heading()
	createVehicle(joaat(model), pos + heading * 10)
end

local function TeleportToPlayer(ply, seconds)
	if not ply or ply == nil then
		return
	end
	local pos = ply:get_position()
	if seconds then
		if localplayer:is_in_vehicle() then
			return
		end

		local oldpos = localplayer:get_position()
		local oldgod = localplayer:get_godmode()
		local oldoffradar = menu.get_offradar()
		localplayer:set_godmode(true)
		menu.set_offradar(true)
		localplayer:set_freeze_momentum(true)
		localplayer:set_config_flag(292, true)
		localplayer:set_position(pos)

		sleep(seconds)

		localplayer:set_position(oldpos)
		localplayer:set_freeze_momentum(false)
		localplayer:set_config_flag(292, false)
		if not oldgod then
			localplayer:set_godmode(false)
		end
		if not oldoffradar then
			menu.set_offradar(false)
		end
		return
	end

	if not localplayer:is_in_vehicle() then
		localplayer:set_position(pos)
	else
		localplayer:get_current_vehicle():set_position(pos)
	end
end

local function TeleportVehiclesToPlayer(ply)
	if not ply or ply == nil then
		return
	end

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
	if not ply or ply == nil then
		return
	end

	local pos = ply:get_position()
	local veh = localplayer:get_nearest_vehicle()
	if not veh then
		return
	end

	veh:set_position(pos)
end

local function TeleportPedsToPlayer(ply, dead)
	if not ply or ply == nil then
		return
	end

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
	if not ply or ply == nil then
		return
	end

	local pos = ply:get_position()
	local currentvehicle = nil

	if localplayer:is_in_vehicle() then
		currentvehicle = localplayer:get_current_vehicle()
	end

	for veh in replayinterface.get_vehicles() do
		if not currentvehicle or currentvehicle ~= veh then
			veh:set_rotation(vector3(0, 0, 180))
			veh:set_health(-1)
			veh:set_position(pos)
		end
	end
end

local function TeleportToAndExplode(ply, mode, bool)
	if not ply or ply == nil then
		return
	end

	local currentvehicle = nil

	local oldpos = localplayer:get_position()
	local oldgod = localplayer:get_godmode()
	local oldoffradar = menu.get_offradar()

	localplayer:set_godmode(true)
	menu.set_offradar(true)

	if mode == 0 then
		localplayer:set_freeze_momentum(true)
		localplayer:set_config_flag(292, true)
		local pos = ply:get_position()
		localplayer:set_position(pos)
		sleep(0.05)
		globals.set_int(Config.TrickOrTreatType, 0)
		globals.set_int(Config.TrickOrTreatTimer, 1000000)
		globals.set_int(Config.TrickOrTreatTrigger, 1)
	else
		globals.set_int(Config.TrickOrTreatType, 1)
		globals.set_int(Config.TrickOrTreatTimer, 1000000)
		globals.set_int(Config.TrickOrTreatTrigger, 1)
		localplayer:set_freeze_momentum(true)
		localplayer:set_config_flag(292, true)
		sleep(2)
		local pos = ply:get_position()
		localplayer:set_position(pos)
	end
	sleep(1)

	if bool then
		localplayer:set_position(oldpos)
	end
	localplayer:set_freeze_momentum(false)
	localplayer:set_config_flag(292, false)
	if not oldgod then
		localplayer:set_godmode(false)
	end
	if not oldoffradar then
		menu.set_offradar(false)
	end
end

local function LaunchPlayer(ply)
	if not ply or ply == nil then
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
			veh:set_rotation(vector3(0, 0, 0))
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
	if not ply or ply == nil then
		return
	end

	if model then
		createVehicle(joaat(model), ply:get_position() + vector3(0, 0, 10 * Config.SlamHeight))
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
			veh:set_rotation(vector3(0, 0, 0))
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

local selectedplayer = -1

local function f_p_o(ply_id, ply, ply_name)
	local text = ""

	if player.get_player_ped(ply_id) == nil then
		return "**Invalid**"
	end

	-- Player Name
	if ply == localplayer then
		text = text .. "YOU"
	else
		text = text .. ply_name
	end

	if IsModder(ply) then
		text = text .. "*"
	end

	if ply:get_godmode() then
		text = text .. " | God"
	else
		local max_hp = ply:get_max_health()
		text = text .. " | " .. floor(clamp((ply:get_health() - 100), 0, max_hp) / (max_hp - 100) * 100) .. "\u{2665}"
		local armour = ply:get_armour()
		if armour > 0 then
			text = text .. " | " .. floor(ply:get_armour()) .. "\u{1f455}"
		end
	end

	-- Is In Vehicle
	if ply:is_in_vehicle() then
		text = text .. " | \u{1F697}"
	end

	-- Player Wanted Level
	local wanted = ply:get_wanted_level()

	if wanted > 0 then
		text = text .. " | " .. wanted .. "\u{2730}"
	end

	text = text .. " | " .. floor(Distance(ply:get_position(), localplayer:get_position())) .. " m"

	return text
end

local function add_player_option(submenu, ply_id, ply, ply_name)
	local text = f_p_o(ply_id, ply, ply_name)

	local d = ply_id

	if submenu ~= nil then
		submenu:add_bare_item(text, function()
			return f_p_o(ply_id, ply, ply_name) .. "|" .. (selectedplayer == ply_id and "\u{2713}" or "\u{25A1}")
		end, function()
			selectedplayer = d
		end, null, null)
	else
		menu.add_bare_item(text, function()
			return f_p_o(ply_id, ply, ply_name) .. "|" .. (selectedplayer == ply_id and "\u{2713}" or "\u{25A1}")
		end, function()
			selectedplayer = d
		end, null, null)
	end
end

local function add_info_option(submenu, text, funcget, forceplayer)
	local func = function()
		local ply = player.get_player_ped(forceplayer and forceplayer or selectedplayer)
		if not ply then
			return text .. ": **Invalid**"
		end

		return text .. ": " .. funcget(ply)
	end

	if submenu ~= nil then
		submenu:add_bare_item(text .. ": ", func, null, null, null)
	else
		menu.add_bare_item(text .. ": ", func, null, null, null)
	end
end

local L7NEGPL = nil
local was_opened = true

local function BuildListSub()
	L7NEGPL:add_bare_item("---Player List " .. GetPlayerCount() .. " Players---", function()
		was_opened = true
		return "---Player List, " .. GetPlayerCount() .. " Players---"
	end, null, null, null)

	add_info_option(subtp, "Player", function()
		return player.get_player_name(selectedplayer)
	end)
	subtp:add_action("Teleport To Player", function()
		TeleportToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_int_range("Teleport To Player Then Back", 1, 1, 5, function()
		return 2
	end, function(n)
		TeleportToPlayer(player.get_player_ped(selectedplayer), n)
	end)
	subtp:add_action("Teleport Closest Vehicle To Player", function()
		TeleportClosestVehicleToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_action("Teleport Vehicles To Player", function()
		TeleportVehiclesToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_action("Teleport Peds To Player", function()
		TeleportPedsToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_action("Teleport Dead Peds To Player", function()
		TeleportPedsToPlayer(player.get_player_ped(selectedplayer), true)
	end)

	add_info_option(subtroll, "Player", function()
		return player.get_player_name(selectedplayer)
	end)
	subtroll:add_action("Cash Drop Player", function()
		PedDrop(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_action("Crash Player ", function()
		Crash_Player(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_action("Launch Player", function()
		LaunchPlayer(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_action("Slam Player", function()
		SlamPlayer(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_toggle("Teleport Myself Back", function()
		return Config.ExplodeTpBack
	end, function(v)
		Config.ExplodeTpBack = v
	end)
	subtroll:add_action("Explode Player (Cars Rush)", function()
		ExplodePlayer(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_action("Explode Player", function()
		ExplodePlayer(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_array_item("Slam Player Using", Config.SlamTypes, function()
		return Config.SlamType
	end, function(value)
		Config.SlamType = value
		SlamPlayer(player.get_player_ped(selectedplayer), Config.SlamTypes[value])
	end)
	subtroll:add_int_range("Slam Height", 1, 0, 10, function()
		return Config.SlamHeight
	end, function(v)
		Config.SlamHeight = v
	end)

	add_info_option(subgiveveh, "Player", function()
		return player.get_player_name(selectedplayer)
	end, nil, enterfunc)
	for name, array in pairs(Config.VehicleTypes) do
		local sub = subgiveveh:add_submenu(name)
		for k, model in pairs(array) do
			sub:add_action(model, function()
				GiveVehicle(player.get_player_ped(selectedplayer), model)
			end)
		end
	end

	add_info_option(subinfo, "Player", function()
		return player.get_player_name(selectedplayer)
	end)
	add_info_option(subinfo, "Distance from you", function(p)
		return floor(Distance(p:get_position(), localplayer:get_position())) .. " m"
	end)
	add_info_option(subinfo, "Health", function(p)
		return floor(clamp((p:get_health() - 100), 0, p:get_max_health()) / (p:get_max_health() - 100) * 100)
	end)
	add_info_option(subinfo, "Armour", function(p)
		return floor(p:get_armour())
	end)
	add_info_option(subinfo, "Is In Vehicle", function(p)
		return (p:is_in_vehicle() and "Yes" or "No")
	end)
	add_info_option(subinfo, "Vehicle Health", function(p)
		return (
			(p:is_in_vehicle() and p:get_current_vehicle() ~= nil)
				and floor(p:get_current_vehicle():get_health() / (p:get_current_vehicle():get_max_health()) * 100)
			or 0
		)
	end)
	add_info_option(subinfo, "Is In GodMode", function(p)
		return (p:get_godmode() and "Yes" or "No")
	end)
	add_info_option(subinfo, "Is Modder", function(p)
		return (IsModder(p) and "Yes" or "No")
	end)
	add_info_option(subinfo, "X", function(p)
		return p:get_position().x
	end)
	add_info_option(subinfo, "Y", function(p)
		return p:get_position().y
	end)
	add_info_option(subinfo, "Z", function(p)
		return p:get_position().z
	end)
end

local function BuildList()
	L7NEGPL:add_bare_item("---Player List " .. GetPlayerCount() .. " Players---", function()
		was_opened = true
		return "---Player List, " .. GetPlayerCount() .. " Players---"
	end, null, null, null)

	for i = 0, 31 do
		local ply = player.get_player_ped(i)
		if ply then
			add_player_option(L7NEGPL, i, ply, player.get_player_name(i))
		end
	end

	Text(L7NEGPL, "---End---")

	local subtp = L7NEGPL:add_submenu("Teleport Options")
	local subtroll = L7NEGPL:add_submenu("Trolling Options")
	local subgiveveh = L7NEGPL:add_submenu("Spawn Vehicle")
	local subinfo = L7NEGPL:add_submenu("Player Info")

	add_info_option(subtp, "Player", function()
		return player.get_player_name(selectedplayer)
	end)

	subtp:add_action("Teleport To Player", function()
		TeleportToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_int_range("Teleport To Player Then Back", 1, 1, 5, function()
		return 2
	end, function(n)
		TeleportToPlayer(player.get_player_ped(selectedplayer), n)
	end)
	subtp:add_action("Teleport Closest Vehicle To Player", function()
		TeleportClosestVehicleToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_action("Teleport Vehicles To Player", function()
		TeleportVehiclesToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_action("Teleport Peds To Player", function()
		TeleportPedsToPlayer(player.get_player_ped(selectedplayer))
	end)
	subtp:add_action("Teleport Dead Peds To Player", function()
		TeleportPedsToPlayer(player.get_player_ped(selectedplayer), true)
	end)

	add_info_option(subtroll, "Player", function()
		return player.get_player_name(selectedplayer)
	end)

	subtroll:add_action("Launch Player", function()
		LaunchPlayer(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_action("Slam Player", function()
		SlamPlayer(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_action("Explode Player", function()
		ExplodePlayer(player.get_player_ped(selectedplayer))
	end)
	subtroll:add_array_item("Slam Player Using", Config.SlamTypes, function()
		return Config.SlamType
	end, function(value)
		Config.SlamType = value
		SlamPlayer(player.get_player_ped(selectedplayer), Config.SlamTypes[value])
	end)
	subtroll:add_int_range("Slam Height", 1, 0, 10, function()
		return Config.SlamHeight
	end, function(v)
		Config.SlamHeight = v
	end)
	subtroll:add_toggle("Teleport Myself Back", function()
		return Config.ExplodeTpBack
	end, function(v)
		Config.ExplodeTpBack = v
	end)
	subtroll:add_action("Explode Player (Cars Rush)", function()
		ExplodePlayer(player.get_player_ped(selectedplayer))
	end)

	add_info_option(subgiveveh, "Player", function()
		return player.get_player_name(selectedplayer)
	end, nil, enterfunc)
	for name, array in pairs(Config.VehicleTypes) do
		local sub = subgiveveh:add_submenu(name)
		for k, model in pairs(array) do
			sub:add_action(model, function()
				GiveVehicle(player.get_player_ped(selectedplayer), model)
			end)
		end
	end

	add_info_option(subinfo, "Player", function()
		return player.get_player_name(selectedplayer)
	end)
	add_info_option(subinfo, "Distance from you", function(p)
		return floor(Distance(p:get_position(), localplayer:get_position())) .. " m"
	end)
	add_info_option(subinfo, "Health", function(p)
		return floor(clamp((p:get_health() - 100), 0, p:get_max_health()) / (p:get_max_health() - 100) * 100)
	end)
	add_info_option(subinfo, "Armour", function(p)
		return floor(p:get_armour())
	end)
	add_info_option(subinfo, "Is In Vehicle", function(p)
		return (p:is_in_vehicle() and "Yes" or "No")
	end)
	add_info_option(subinfo, "Vehicle Health", function(p)
		return (
			(p:is_in_vehicle() and p:get_current_vehicle() ~= nil)
				and floor(p:get_current_vehicle():get_health() / (p:get_current_vehicle():get_max_health()) * 100)
			or 0
		)
	end)
	add_info_option(subinfo, "Is In GodMode", function(p)
		return (p:get_godmode() and "Yes" or "No")
	end)
	add_info_option(subinfo, "Is Modder", function(p)
		return (IsModder(p) and "Yes" or "No")
	end)
	add_info_option(subinfo, "X", function(p)
		return p:get_position().x
	end)
	add_info_option(subinfo, "Y", function(p)
		return p:get_position().y
	end)
	add_info_option(subinfo, "Z", function(p)
		return p:get_position().z
	end)
end

function Update()
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

VehiclesM = L7NEG:add_submenu("Vehicle")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RMenu = L7NEG:add_submenu("Recovery")

--Rank--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Rank = RMenu:add_submenu("Set Player Rank Menu")

RPtoRank = {
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
	1555800,
	1584350,
	1612950,
	1641600,
	1670300,
	1699050,
	1727850,
	1756700,
	1785600,
	1814550,
	1843550,
	1872600,
	1901700,
	1930850,
	1960050,
	1989300,
	2018600,
	2047950,
	2077350,
	2106800,
	2136300,
	2165850,
	2195450,
	2225100,
	2254800,
	2284550,
	2314350,
	2344200,
	2374100,
	2404050,
	2434050,
	2464100,
	2494200,
	2524350,
	2554550,
	2584800,
	2615100,
	2648513,
	2675850,
	2706300,
	2736800,
	2767350,
	2797950,
	2828600,
	2859300,
	2890050,
	2920850,
	2951700,
	2982600,
	3013550,
	3044550,
	3075600,
	3106700,
	3137850,
	3169050,
	3200300,
	3231600,
	3262950,
	3294350,
	3325800,
	3357300,
	3388850,
	3420450,
	3452100,
	3483800,
	3515550,
	3547350,
	3579200,
	3611100,
	3643050,
	3675050,
	3707100,
	3739200,
	3771350,
	3803550,
	3835800,
	3868100,
	3900450,
	3932850,
	3965300,
	3997800,
	4030350,
	4062950,
	4095600,
	4128300,
	4161050,
	4193850,
	4226700,
	4259600,
	4292550,
	4325550,
	4358600,
	4391700,
	4424850,
	4458050,
	4491300,
	4524600,
	4557950,
	4591350,
	4624800,
	4658300,
	4691850,
	4725450,
	4759100,
	4792800,
	4826550,
	4860350,
	4894200,
	4928100,
	4962050,
	4996050,
	5030100,
	5064200,
	5098350,
	5132550,
	5166800,
	5201100,
	5235450,
	5269850,
	5304300,
	5338800,
	5373350,
	5407950,
	5442600,
	5477300,
	5512050,
	5546850,
	5581700,
	5616600,
	5651550,
	5686550,
	5721600,
	5756700,
	5791850,
	5827050,
	5862300,
	5897600,
	5932950,
	5968350,
	6003800,
	6039300,
	6074850,
	6110450,
	6146100,
	6181800,
	6217550,
	6253350,
	6289200,
	6325100,
	6361050,
	6397050,
	6433100,
	6469200,
	6505350,
	6541550,
	6577800,
	6614100,
	6650450,
	6686850,
	6723300,
	6759800,
	6796350,
	6832950,
	6869600,
	6906300,
	6943050,
	6979850,
	7016700,
	7053600,
	7090550,
	7127550,
	7164600,
	7201700,
	7238850,
	7276050,
	7313300,
	7350600,
	7387950,
	7425350,
	7462800,
	7500300,
	7537850,
	7575450,
	7613100,
	7650800,
	7688550,
	7726350,
	7764200,
	7802100,
	7840050,
	7878050,
	7916100,
	7954200,
	7992350,
	8030550,
	8068800,
	8107100,
	8148513,
	8183850,
	8222300,
	8260800,
	8299350,
	8337950,
	8376600,
	8415300,
	8454050,
	8492850,
	8531700,
	8570600,
	8609550,
	8648550,
	8687600,
	8726700,
	8765850,
	8805050,
	8844300,
	8883600,
	8922950,
	8962350,
	9001800,
	9041300,
	9080850,
	9120450,
	9160100,
	9199800,
	9239550,
	9279350,
	9319200,
	9359100,
	9399050,
	9439050,
	9479100,
	9519200,
	9559350,
	9599550,
	9639800,
	9680100,
	9720450,
	9760850,
	9801300,
	9841800,
	9882350,
	9922950,
	9963600,
	10004300,
	10045050,
	10085850,
	10126700,
	10167600,
	10208550,
	10249550,
	10290600,
	10331700,
	10372850,
	10414050,
	10455300,
	10496600,
	10537950,
	10579350,
	10620800,
	10662300,
	10703850,
	10748513,
	10787100,
	10828800,
	10870550,
	10912350,
	10954200,
	10996100,
	11038050,
	11080050,
	11122100,
	11164200,
	11206350,
	11248550,
	11290800,
	11333100,
	11375450,
	11417850,
	11460300,
	11502800,
	11545350,
	11587950,
	11630600,
	11673300,
	11716050,
	11758850,
	11801700,
	11844600,
	11887550,
	11930550,
	11973600,
	12016700,
	12059850,
	12103050,
	12146300,
	12189600,
	12232950,
	12276350,
	12319800,
	12363300,
	12406850,
	12450450,
	12494100,
	12537800,
	12581550,
	12625350,
	12669200,
	12713100,
	12757050,
	12801050,
	12845100,
	12889200,
	12933350,
	12977550,
	13021800,
	13066100,
	13110450,
	13154850,
	13199300,
	13243800,
	13288350,
	13332950,
	13377600,
	13422300,
	13467050,
	13511850,
	13556700,
	13601600,
	13646550,
	13691550,
	13736600,
	13781700,
	13826850,
	13872050,
	13917300,
	13962600,
	14007950,
	14053350,
	14098800,
	14144300,
	14189850,
	14235450,
	14281100,
	14326800,
	14372550,
	14418350,
	14464200,
	14510100,
	14556050,
	14602050,
	14648100,
	14694200,
	14740350,
	14786550,
	14832800,
	14879100,
	14925450,
	14971850,
	15018300,
	15064800,
	15111350,
	15157950,
	15204600,
	15251300,
	15298050,
	15344850,
	15391700,
	15438600,
	15485550,
	15532550,
	15579600,
	15626700,
	15673850,
	15721050,
	15768300,
	15815600,
	15862950,
	15910350,
	15957800,
	16005300,
	16052850,
	16100450,
	16148100,
	16195800,
	16243550,
	16291350,
	16339200,
	16387100,
	16435050,
	16483050,
	16531100,
	16579200,
	16627350,
	16675550,
	16723800,
	16772100,
	16820450,
	16868850,
	16917300,
	16965800,
	17014350,
	17062950,
	17111600,
	17160300,
	17209050,
	17257850,
	17306700,
	17355600,
	17404550,
	17453550,
	17502600,
	17551700,
	17600850,
	17650050,
	17699300,
	17748600,
	17797950,
	17847350,
	17896800,
	17946300,
	17995850,
	18048513,
	18095100,
	18144800,
	18194550,
	18244350,
	18294200,
	18344100,
	18394050,
	18444050,
	18494100,
	18544200,
	18594350,
	18644550,
	18694800,
	18745100,
	18795450,
	18845850,
	18896300,
	18946800,
	18997350,
	19047950,
	19098600,
	19149300,
	19200050,
	19250850,
	19301700,
	19352600,
	19403550,
	19454550,
	19505600,
	19556700,
	19607850,
	19659050,
	19710300,
	19761600,
	19812950,
	19864350,
	19915800,
	19967300,
	20018850,
	20070450,
	20122100,
	20173800,
	20225550,
	20277350,
	20329200,
	20381100,
	20433050,
	20485050,
	20537100,
	20589200,
	20641350,
	20693550,
	20745800,
	20798100,
	20850450,
	20902850,
	20955300,
	21007800,
	21060350,
	21112950,
	21165600,
	21218300,
	21271050,
	21323850,
	21376700,
	21429600,
	21482550,
	21535550,
	21588600,
	21641700,
	21694850,
	21748050,
	21801300,
	21854600,
	21907950,
	21961350,
	22014800,
	22068300,
	22121850,
	22175450,
	22229100,
	22282800,
	22336550,
	22390350,
	22444200,
	22498100,
	22552050,
	22606050,
	22660100,
	22714200,
	22768350,
	22822550,
	22876800,
	22931100,
	22985450,
	23039850,
	23094300,
	23148800,
	23203350,
	23257950,
	23312600,
	23367300,
	23422050,
	23476850,
	23531700,
	23586600,
	23641550,
	23696550,
	23751600,
	23806700,
	23861850,
	23917050,
	23972300,
	24027600,
	24082950,
	24138350,
	24193800,
	24249300,
	24304850,
	24360450,
	24416100,
	24471800,
	24527550,
	24583350,
	24639200,
	24695100,
	24751050,
	24807050,
	24863100,
	24919200,
	24975350,
	25031550,
	25087800,
	25144100,
	25200450,
	25256850,
	25313300,
	25369800,
	25426350,
	25482950,
	25539600,
	25596300,
	25653050,
	25709850,
	25766700,
	25823600,
	25880550,
	25937550,
	25994600,
	26051700,
	26108850,
	26166050,
	26223300,
	26280600,
	26337950,
	26395350,
	26452800,
	26510300,
	26567850,
	26625450,
	26683100,
	26740800,
	26798550,
	26856350,
	26914200,
	26972100,
	27030050,
	27088050,
	27146100,
	27204200,
	27262350,
	27320550,
	27378800,
	27437100,
	27495450,
	27553850,
	27612300,
	27670800,
	27729350,
	27787950,
	27846600,
	27905300,
	27964050,
	28022850,
	28081700,
	28140600,
	28199550,
	28258550,
	28317600,
	28376700,
	28435850,
	28495050,
	28554300,
	28613600,
	28672950,
	28732350,
	28791800,
	28851300,
	28910850,
	28970450,
	29030100,
	29089800,
	29149550,
	29209350,
	29269200,
	29329100,
	29389050,
	29449050,
	29509100,
	29569200,
	29629350,
	29689550,
	29749800,
	29810100,
	29870450,
	29930850,
	29991300,
	30051800,
	30112350,
	30172950,
	30233600,
	30294300,
	30355050,
	30415850,
	30476700,
	30537600,
	30598550,
	30659550,
	30720600,
	30781700,
	30842850,
	30904050,
	30965300,
	31026600,
	31087950,
	31149350,
	31210800,
	31272300,
	31333850,
	31395450,
	31457100,
	31518800,
	31580550,
	31642350,
	31704200,
	31766100,
	31828050,
	31890050,
	31952100,
	32014200,
	32076350,
	32138550,
	32200800,
	32263100,
	32325450,
	32387850,
	32450300,
	32512800,
	32575350,
	32637950,
	32700600,
	32763300,
	32826050,
	32888850,
	32951700,
	33014600,
	33077550,
	33140550,
	33203600,
	33266700,
	33329850,
	33393050,
	33456300,
	33519600,
	33582950,
	33646350,
	33709800,
	33773300,
	33836850,
	33900450,
	33964100,
	34027800,
	34091550,
	34155350,
	34219200,
	34283100,
	34347050,
	34411050,
	34475100,
	34539200,
	34603350,
	34667550,
	34731800,
	34796100,
	34860450,
	34924850,
	34989300,
	35053800,
	35118350,
	35182950,
	35247600,
	35312300,
	35377050,
	35441850,
	35506700,
	35571600,
	35636550,
	35701550,
	35766600,
	35831700,
	35896850,
	35962050,
	36027300,
	36092600,
	36157950,
	36223350,
	36288800,
	36354300,
	36419850,
	36485450,
	36551100,
	36616800,
	36682550,
	36748350,
	36814200,
	36880100,
	36946050,
	37012050,
	37078100,
	37144200,
	37210350,
	37276550,
	37342800,
	37409100,
	37475450,
	37541850,
	37608300,
	37674800,
	37741350,
	37807950,
	37874600,
	37941300,
	38008050,
	38074850,
	38141700,
	38208600,
	38275550,
	38342550,
	38409600,
	38476700,
	38543850,
	38611050,
	38678300,
	38745600,
	38812950,
	38880350,
	38947800,
	39015300,
	39082850,
	39150450,
	39218100,
	39285800,
	39353550,
	39421350,
	39489200,
	39557100,
	39625050,
	39693050,
	39761100,
	39829200,
	39897350,
	39965550,
	40033800,
	40102100,
	40170450,
	40238850,
	40307300,
	40375800,
	40444350,
	40512950,
	40581600,
	40650300,
	40719050,
	40787850,
	40856700,
	40925600,
	40994550,
	41063550,
	41132600,
	41201700,
	41270850,
	41340050,
	41409300,
	41478600,
	41547950,
	41617350,
	41686800,
	41756300,
	41825850,
	41895450,
	41965100,
	42034800,
	42104550,
	42174350,
	42244200,
	42314100,
	42384050,
	42454050,
	42524100,
	42594200,
	42664350,
	42734550,
	42804800,
	42875100,
	42948513,
	43015850,
	43086300,
	43156800,
	43227350,
	43297950,
	43368600,
	43439300,
	43510050,
	43580850,
	43651700,
	43722600,
	43793550,
	43864550,
	43935600,
	44006700,
	44077850,
	44149050,
	44220300,
	44291600,
	44362950,
	44434350,
	44505800,
	44577300,
	44648850,
	44720450,
	44792100,
	44863800,
	44935550,
	45007350,
	45079200,
	45151100,
	45223050,
	45295050,
	45367100,
	45439200,
	45511350,
	45583550,
	45655800,
	45728100,
	45800450,
	45872850,
	45945300,
	46017800,
	46090350,
	46162950,
	46235600,
	46308300,
	46381050,
	46453850,
	46526700,
	46599600,
	46672550,
	46745550,
	46818600,
	46891700,
	46964850,
	47038050,
	47111300,
	47184600,
	47257950,
	47331350,
	47404800,
	47478300,
	47551850,
	47625450,
	47699100,
	47772800,
	47846550,
	47920350,
	47994200,
	48068100,
	48142050,
	48216050,
	48290100,
	48364200,
	48438350,
	48512550,
	48586800,
	48661100,
	48735450,
	48809850,
	48884300,
	48958800,
	49033350,
	49107950,
	49182600,
	49257300,
	49332050,
	49406850,
	49481700,
	49556600,
	49631550,
	49706550,
	49781600,
	49856700,
	49931850,
	50007050,
	50082300,
	50157600,
	50232950,
	50308350,
	50383800,
	50459300,
	50534850,
	50610450,
	50686100,
	50761800,
	50837550,
	50913350,
	50989200,
	51065100,
	51141050,
	51217050,
	51293100,
	51369200,
	51445350,
	51521550,
	51597800,
	51674100,
	51750450,
	51826850,
	51903300,
	51979800,
	52056350,
	52132950,
	52209600,
	52286300,
	52363050,
	52439850,
	52516700,
	52593600,
	52670550,
	52747550,
	52824600,
	52901700,
	52978850,
	53056050,
	53133300,
	53210600,
	53287950,
	53365350,
	53442800,
	53520300,
	53597850,
	53675450,
	53753100,
	53830800,
	53908550,
	53986350,
	54064200,
	54142100,
	54220050,
	54298050,
	54376100,
	54454200,
	54532350,
	54610550,
	54688800,
	54767100,
	54848513,
	54923850,
	55002300,
	55080800,
	55159350,
	55237950,
	55316600,
	55395300,
	55474050,
	55552850,
	55631700,
	55710600,
	55789550,
	55868550,
	55947600,
	56026700,
	56105850,
	56185050,
	56264300,
	56343600,
	56422950,
	56502350,
	56581800,
	56661300,
	56740850,
	56820450,
	56900100,
	56979800,
	57059550,
	57139350,
	57219200,
	57299100,
	57379050,
	57459050,
	57539100,
	57619200,
	57699350,
	57779550,
	57859800,
	57940100,
	58020450,
	58100850,
	58181300,
	58261800,
	58342350,
	58422950,
	58503600,
	58584300,
	58665050,
	58745850,
	58826700,
	58907600,
	58988550,
	59069550,
	59150600,
	59231700,
	59312850,
	59394050,
	59475300,
	59556600,
	59637950,
	59719350,
	59800800,
	59882300,
	59963850,
	60048513,
	60127100,
	60208800,
	60290550,
	60372350,
	60454200,
	60536100,
	60618050,
	60700050,
	60782100,
	60864200,
	60946350,
	61028550,
	61110800,
	61193100,
	61275450,
	61357850,
	61440300,
	61522800,
	61605350,
	61687950,
	61770600,
	61853300,
	61936050,
	62018850,
	62101700,
	62184600,
	62267550,
	62350550,
	62433600,
	62516700,
	62599850,
	62683050,
	62766300,
	62849600,
	62932950,
	63016350,
	63099800,
	63183300,
	63266850,
	63350450,
	63434100,
	63517800,
	63601550,
	63685350,
	63769200,
	63853100,
	63937050,
	64021050,
	64105100,
	64189200,
	64273350,
	64357550,
	64441800,
	64526100,
	64610450,
	64694850,
	64779300,
	64863800,
	64948350,
	65032950,
	65117600,
	65202300,
	65287050,
	65371850,
	65456700,
	65541600,
	65626550,
	65711550,
	65796600,
	65881700,
	65966850,
	66052050,
	66137300,
	66222600,
	66307950,
	66393350,
	66478800,
	66564300,
	66649850,
	66735450,
	66821100,
	66906800,
	66992550,
	67078350,
	67164200,
	67250100,
	67336050,
	67422050,
	67508100,
	67594200,
	67680350,
	67766550,
	67852800,
	67939100,
	68025450,
	68111850,
	68198300,
	68284800,
	68371350,
	68457950,
	68544600,
	68631300,
	68718050,
	68804850,
	68891700,
	68978600,
	69065550,
	69152550,
	69239600,
	69326700,
	69413850,
	69501050,
	69588300,
	69675600,
	69762950,
	69850350,
	69937800,
	70025300,
	70112850,
	70200450,
	70288100,
	70375800,
	70463550,
	70551350,
	70639200,
	70727100,
	70815050,
	70903050,
	70991100,
	71079200,
	71167350,
	71255550,
	71343800,
	71432100,
	71520450,
	71608850,
	71697300,
	71785800,
	71874350,
	71962950,
	72051600,
	72140300,
	72229050,
	72317850,
	72406700,
	72495600,
	72584550,
	72673550,
	72762600,
	72851700,
	72940850,
	73030050,
	73119300,
	73208600,
	73297950,
	73387350,
	73476800,
	73566300,
	73655850,
	73748513,
	73835100,
	73924800,
	74014550,
	74104350,
	74194200,
	74284100,
	74374050,
	74464050,
	74554100,
	74644200,
	74734350,
	74824550,
	74914800,
	75005100,
	75095450,
	75185850,
	75276300,
	75366800,
	75457350,
	75547950,
	75638600,
	75729300,
	75820050,
	75910850,
	76001700,
	76092600,
	76183550,
	76274550,
	76365600,
	76456700,
	76547850,
	76639050,
	76730300,
	76821600,
	76912950,
	77004350,
	77095800,
	77187300,
	77278850,
	77370450,
	77462100,
	77553800,
	77645550,
	77737350,
	77829200,
	77921100,
	78013050,
	78105050,
	78197100,
	78289200,
	78381350,
	78473550,
	78565800,
	78658100,
	78750450,
	78842850,
	78935300,
	79027800,
	79120350,
	79212950,
	79305600,
	79398300,
	79491050,
	79583850,
	79676700,
	79769600,
	79862550,
	79955550,
	80048600,
	80141700,
	80234850,
	80328050,
	80421300,
	80514600,
	80607950,
	80701350,
	80794800,
	80888300,
	80981850,
	81075450,
	81169100,
	81262800,
	81356550,
	81450350,
	81544200,
	81638100,
	81732050,
	81826050,
	81920100,
	82014200,
	82108350,
	82202550,
	82296800,
	82391100,
	82485450,
	82579850,
	82674300,
	82768800,
	82863350,
	82957950,
	83052600,
	83147300,
	83242050,
	83336850,
	83431700,
	83526600,
	83621550,
	83716550,
	83811600,
	83906700,
	84001850,
	84097050,
	84192300,
	84287600,
	84382950,
	84478350,
	84573800,
	84669300,
	84764850,
	84860450,
	84956100,
	85051800,
	85147550,
	85243350,
	85339200,
	85435100,
	85531050,
	85627050,
	85723100,
	85819200,
	85915350,
	86011550,
	86107800,
	86204100,
	86300450,
	86396850,
	86493300,
	86589800,
	86686350,
	86782950,
	86879600,
	86976300,
	87073050,
	87169850,
	87266700,
	87363600,
	87460550,
	87557550,
	87654600,
	87751700,
	87848850,
	87946050,
	88043300,
	88140600,
	88237950,
	88335350,
	88432800,
	88530300,
	88627850,
	88725450,
	88823100,
	88920800,
	89018550,
	89116350,
	89214200,
	89312100,
	89410050,
	89508050,
	89606100,
	89704200,
	89802350,
	89900550,
	89998800,
	90097100,
	90195450,
	90293850,
	90392300,
	90490800,
	90589350,
	90687950,
	90786600,
	90885300,
	90984050,
	91082850,
	91181700,
	91280600,
	91379550,
	91478550,
	91577600,
	91676700,
	91775850,
	91875050,
	91974300,
	92073600,
	92172950,
	92272350,
	92371800,
	92471300,
	92570850,
	92670450,
	92770100,
	92869800,
	92969550,
	93069350,
	93169200,
	93269100,
	93369050,
	93469050,
	93569100,
	93669200,
	93769350,
	93869550,
	93969800,
	94070100,
	94170450,
	94270850,
	94371300,
	94471800,
	94572350,
	94672950,
	94773600,
	94874300,
	94975050,
	95075850,
	95176700,
	95277600,
	95378550,
	95479550,
	95580600,
	95681700,
	95782850,
	95884050,
	95985300,
	96086600,
	96187950,
	96289350,
	96390800,
	96492300,
	96593850,
	96695450,
	96797100,
	96898800,
	97000550,
	97102350,
	97204200,
	97306100,
	97408050,
	97510050,
	97612100,
	97714200,
	97816350,
	97918550,
	98020800,
	98123100,
	98225450,
	98327850,
	98430300,
	98532800,
	98635350,
	98737950,
	98840600,
	98943300,
	99046050,
	99148850,
	99251700,
	99354600,
	99457550,
	99560550,
	99663600,
	99766700,
	99869850,
	99973050,
	100076300,
	100179600,
	100282950,
	100386350,
	100489800,
	100593300,
	100696850,
	100800450,
	100904100,
	101007800,
	101111550,
	101215350,
	101319200,
	101423100,
	101527050,
	101631050,
	101735100,
	101839200,
	101943350,
	102047550,
	102151800,
	102256100,
	102360450,
	102464850,
	102569300,
	102673800,
	102778350,
	102882950,
	102987600,
	103092300,
	103197050,
	103301850,
	103406700,
	103511600,
	103616550,
	103721550,
	103826600,
	103931700,
	104036850,
	104142050,
	104247300,
	104352600,
	104457950,
	104563350,
	104668800,
	104774300,
	104879850,
	104985450,
	105091100,
	105196800,
	105302550,
	105408350,
	105514200,
	105620100,
	105726050,
	105832050,
	105938100,
	106044200,
	106150350,
	106256550,
	106362800,
	106469100,
	106575450,
	106681850,
	106788300,
	106894800,
	107001350,
	107107950,
	107214600,
	107321300,
	107428050,
	107534850,
	107641700,
	107748600,
	107855550,
	107962550,
	108069600,
	108176700,
	108283850,
	108391050,
	108498300,
	108605600,
	108712950,
	108820350,
	108927800,
	109035300,
	109142850,
	109250450,
	109358100,
	109465800,
	109573550,
	109681350,
	109789200,
	109897100,
	110005050,
	110113050,
	110221100,
	110329200,
	110437350,
	110545550,
	110653800,
	110762100,
	110870450,
	110978850,
	111087300,
	111195800,
	111304350,
	111412950,
	111521600,
	111630300,
	111739050,
	111847850,
	111956700,
	112065600,
	112174550,
	112283550,
	112392600,
	112501700,
	112610850,
	112720050,
	112829300,
	112938600,
	113047950,
	113157350,
	113266800,
	113376300,
	113485850,
	113595450,
	113705100,
	113814800,
	113924550,
	114034350,
	114144200,
	114254100,
	114364050,
	114474050,
	114584100,
	114694200,
	114804350,
	114914550,
	115024800,
	115135100,
	115248513,
	115355850,
	115466300,
	115576800,
	115687350,
	115797950,
	115908600,
	116019300,
	116130050,
	116240850,
	116351700,
	116462600,
	116573550,
	116684550,
	116795600,
	116906700,
	117017850,
	117129050,
	117240300,
	117351600,
	117462950,
	117574350,
	117685800,
	117797300,
	117908850,
	118020450,
	118132100,
	118243800,
	118355550,
	118467350,
	118579200,
	118691100,
	118803050,
	118915050,
	119027100,
	119139200,
	119251350,
	119363550,
	119475800,
	119588100,
	119700450,
	119812850,
	119925300,
	120037800,
	120150350,
	120262950,
	120375600,
	120488300,
	120601050,
	120713850,
	120826700,
	120939600,
	121052550,
	121165550,
	121278600,
	121391700,
	121504850,
	121618050,
	121731300,
	121844600,
	121957950,
	122071350,
	122184800,
	122298300,
	122411850,
	122525450,
	122639100,
	122752800,
	122866550,
	122980350,
	123094200,
	123208100,
	123322050,
	123436050,
	123550100,
	123664200,
	123778350,
	123892550,
	124006800,
	124121100,
	124235450,
	124349850,
	124464300,
	124578800,
	124693350,
	124807950,
	124922600,
	125037300,
	125152050,
	125266850,
	125381700,
	125496600,
	125611550,
	125726550,
	125841600,
	125956700,
	126071850,
	126187050,
	126302300,
	126417600,
	126532950,
	126648350,
	126763800,
	126879300,
	126994850,
	127110450,
	127226100,
	127341800,
	127457550,
	127573350,
	127689200,
	127805100,
	127921050,
	128037050,
	128153100,
	128269200,
	128385350,
	128501550,
	128617800,
	128734100,
	128850450,
	128966850,
	129083300,
	129199800,
	129316350,
	129432950,
	129549600,
	129666300,
	129783050,
	129899850,
	130016700,
	130133600,
	130250550,
	130367550,
	130484600,
	130601700,
	130718850,
	130836050,
	130953300,
	131070600,
	131187950,
	131305350,
	131422800,
	131540300,
	131657850,
	131775450,
	131893100,
	132010800,
	132128550,
	132246350,
	132364200,
	132482100,
	132600050,
	132718050,
	132836100,
	132954200,
	133072350,
	133190550,
	133308800,
	133427100,
	133548513,
	133663850,
	133782300,
	133900800,
	134019350,
	134137950,
	134256600,
	134375300,
	134494050,
	134612850,
	134731700,
	134850600,
	134969550,
	135088550,
	135207600,
	135326700,
	135445850,
	135565050,
	135684300,
	135803600,
	135922950,
	136042350,
	136161800,
	136281300,
	136400850,
	136520450,
	136640100,
	136759800,
	136879550,
	136999350,
	137119200,
	137239100,
	137359050,
	137479050,
	137599100,
	137719200,
	137839350,
	137959550,
	138079800,
	138200100,
	138320450,
	138440850,
	138561300,
	138681800,
	138802350,
	138922950,
	139043600,
	139164300,
	139285050,
	139405850,
	139526700,
	139647600,
	139768550,
	139889550,
	140010600,
	140131700,
	140252850,
	140374050,
	140495300,
	140616600,
	140737950,
	140859350,
	140980800,
	141102300,
	141223850,
	141348513,
	141467100,
	141588800,
	141710550,
	141832350,
	141954200,
	142076100,
	142198050,
	142320050,
	142442100,
	142564200,
	142686350,
	142808550,
	142930800,
	143053100,
	143175450,
	143297850,
	143420300,
	143542800,
	143665350,
	143787950,
	143910600,
	144033300,
	144156050,
	144278850,
	144401700,
	144524600,
	144647550,
	144770550,
	144893600,
	145016700,
	145139850,
	145263050,
	145386300,
	145509600,
	145632950,
	145756350,
	145879800,
	146003300,
	146126850,
	146250450,
	146374100,
	146497800,
	146621550,
	146745350,
	146869200,
	146993100,
	147117050,
	147241050,
	147365100,
	147489200,
	147613350,
	147737550,
	147861800,
	147986100,
	148110450,
	148234850,
	148359300,
	148483800,
	148608350,
	148732950,
	148857600,
	148982300,
	149107050,
	149231850,
	149356700,
	149481600,
	149606550,
	149731550,
	149856600,
	149981700,
	150106850,
	150232050,
	150357300,
	150482600,
	150607950,
	150733350,
	150858800,
	150984300,
	151109850,
	151235450,
	151361100,
	151486800,
	151612550,
	151738350,
	151864200,
	151990100,
	152116050,
	152242050,
	152368100,
	152494200,
	152620350,
	152746550,
	152872800,
	152999100,
	153125450,
	153251850,
	153378300,
	153504800,
	153631350,
	153757950,
	153884600,
	154011300,
	154138050,
	154264850,
	154391700,
	154518600,
	154645550,
	154772550,
	154899600,
	155026700,
	155153850,
	155281050,
	155408300,
	155535600,
	155662950,
	155790350,
	155917800,
	156045300,
	156172850,
	156300450,
	156428100,
	156555800,
	156683550,
	156811350,
	156939200,
	157067100,
	157195050,
	157323050,
	157451100,
	157579200,
	157707350,
	157835550,
	157963800,
	158092100,
	158220450,
	158348850,
	158477300,
	158605800,
	158734350,
	158862950,
	158991600,
	159120300,
	159249050,
	159377850,
	159506700,
	159635600,
	159764550,
	159893550,
	160022600,
	160151700,
	160280850,
	160410050,
	160539300,
	160668600,
	160797950,
	160927350,
	161056800,
	161186300,
	161315850,
	161448513,
	161575100,
	161704800,
	161834550,
	161964350,
	162094200,
	162224100,
	162354050,
	162484050,
	162614100,
	162744200,
	162874350,
	163004550,
	163134800,
	163265100,
	163395450,
	163525850,
	163656300,
	163786800,
	163917350,
	164047950,
	164178600,
	164309300,
	164440050,
	164570850,
	164701700,
	164832600,
	164963550,
	165094550,
	165225600,
	165356700,
	165487850,
	165619050,
	165750300,
	165881600,
	166012950,
	166144350,
	166275800,
	166407300,
	166538850,
	166670450,
	166802100,
	166933800,
	167065550,
	167197350,
	167329200,
	167461100,
	167593050,
	167725050,
	167857100,
	167989200,
	168121350,
	168253550,
	168385800,
	168518100,
	168650450,
	168782850,
	168915300,
	169047800,
	169180350,
	169312950,
	169445600,
	169578300,
	169711050,
	169843850,
	169976700,
	170109600,
	170242550,
	170375550,
	170508600,
	170641700,
	170774850,
	170908050,
	171041300,
	171174600,
	171307950,
	171441350,
	171574800,
	171708300,
	171841850,
	171975450,
	172109100,
	172242800,
	172376550,
	172510350,
	172644200,
	172778100,
	172912050,
	173046050,
	173180100,
	173314200,
	173448350,
	173582550,
	173716800,
	173851100,
	173985450,
	174119850,
	174254300,
	174388800,
	174523350,
	174657950,
	174792600,
	174927300,
	175062050,
	175196850,
	175331700,
	175466600,
	175601550,
	175736550,
	175871600,
	176006700,
	176141850,
	176277050,
	176412300,
	176547600,
	176682950,
	176818350,
	176953800,
	177089300,
	177224850,
	177360450,
	177496100,
	177631800,
	177767550,
	177903350,
	178039200,
	178175100,
	178311050,
	178447050,
	178583100,
	178719200,
	178855350,
	178991550,
	179127800,
	179264100,
	179400450,
	179536850,
	179673300,
	179809800,
	179946350,
	180082950,
	180219600,
	180356300,
	180493050,
	180629850,
	180766700,
	180903600,
	181040550,
	181177550,
	181314600,
	181451700,
	181588850,
	181726050,
	181863300,
	182000600,
	182137950,
	182275350,
	182412800,
	182550300,
	182687850,
	182825450,
	182963100,
	183100800,
	183238550,
	183376350,
	183514200,
	183652100,
	183790050,
	183928050,
	184066100,
	184204200,
	184342350,
	184480550,
	184618800,
	184757100,
	184895450,
	185033850,
	185172300,
	185310800,
	185449350,
	185587950,
	185726600,
	185865300,
	186004050,
	186142850,
	186281700,
	186420600,
	186559550,
	186698550,
	186837600,
	186976700,
	187115850,
	187255050,
	187394300,
	187533600,
	187672950,
	187812350,
	187951800,
	188091300,
	188230850,
	188370450,
	188510100,
	188649800,
	188789550,
	188929350,
	189069200,
	189209100,
	189349050,
	189489050,
	189629100,
	189769200,
	189909350,
	190049550,
	190189800,
	190330100,
	190470450,
	190610850,
	190751300,
	190891800,
	191032350,
	191172950,
	191313600,
	191454300,
	191595050,
	191735850,
	191876700,
	192017600,
	192158550,
	192299550,
	192440600,
	192581700,
	192722850,
	192864050,
	193005300,
	193146600,
	193287950,
	193429350,
	193570800,
	193712300,
	193853850,
	193995450,
	194137100,
	194278800,
	194420550,
	194562350,
	194704200,
	194846100,
	194988050,
	195130050,
	195272100,
	195414200,
	195556350,
	195698550,
	195840800,
	195983100,
	196125450,
	196267850,
	196410300,
	196552800,
	196695350,
	196837950,
	196980600,
	197123300,
	197266050,
	197408850,
	197551700,
	197694600,
	197837550,
	197980550,
	198123600,
	198266700,
	198409850,
	198553050,
	198696300,
	198839600,
	198982950,
	199126350,
	199269800,
	199413300,
	199556850,
	199700450,
	199844100,
	199987800,
	200131550,
	200275350,
	200419200,
	200563100,
	200707050,
	200851050,
	200995100,
	201139200,
	201283350,
	201427550,
	201571800,
	201716100,
	201860450,
	202004850,
	202149300,
	202293800,
	202438350,
	202582950,
	202727600,
	202872300,
	203017050,
	203161850,
	203306700,
	203451600,
	203596550,
	203741550,
	203886600,
	204031700,
	204176850,
	204322050,
	204467300,
	204612600,
	204757950,
	204903350,
	205048800,
	205194300,
	205339850,
	205485450,
	205631100,
	205776800,
	205922550,
	206068350,
	206214200,
	206360100,
	206506050,
	206652050,
	206798100,
	206944200,
	207090350,
	207236550,
	207382800,
	207529100,
	207675450,
	207821850,
	207968300,
	208114800,
	208261350,
	208407950,
	208554600,
	208701300,
	208848050,
	208994850,
	209141700,
	209288600,
	209435550,
	209582550,
	209729600,
	209876700,
	210023850,
	210171050,
	210318300,
	210465600,
	210612950,
	210760350,
	210907800,
	211055300,
	211202850,
	211350450,
	211498100,
	211645800,
	211793550,
	211941350,
	212089200,
	212237100,
	212385050,
	212533050,
	212681100,
	212829200,
	212977350,
	213125550,
	213273800,
	213422100,
	213570450,
	213718850,
	213867300,
	214015800,
	214164350,
	214312950,
	214461600,
	214610300,
	214759050,
	214907850,
	215056700,
	215205600,
	215354550,
	215503550,
	215652600,
	215801700,
	215950850,
	216100050,
	216249300,
	216398600,
	216547950,
	216697350,
	216846800,
	216996300,
	217145850,
	217295450,
	217445100,
	217594800,
	217744550,
	217894350,
	218044200,
	218194100,
	218344050,
	218494050,
	218644100,
	218794200,
	218944350,
	219094550,
	219244800,
	219395100,
	219548513,
	219695850,
	219846300,
	219996800,
	220147350,
	220297950,
	220448600,
	220599300,
	220750050,
	220900850,
	221051700,
	221202600,
	221353550,
	221504550,
	221655600,
	221806700,
	221957850,
	222109050,
	222260300,
	222411600,
	222562950,
	222714350,
	222865800,
	223017300,
	223168850,
	223320450,
	223472100,
	223623800,
	223775550,
	223927350,
	224079200,
	224231100,
	224383050,
	224535050,
	224687100,
	224839200,
	224991350,
	225143550,
	225295800,
	225448100,
	225600450,
	225752850,
	225905300,
	226057800,
	226210350,
	226362950,
	226515600,
	226668300,
	226821050,
	226973850,
	227126700,
	227279600,
	227432550,
	227585550,
	227738600,
	227891700,
	228044850,
	228198050,
	228351300,
	228504600,
	228657950,
	228811350,
	228964800,
	229118300,
	229271850,
	229425450,
	229579100,
	229732800,
	229886550,
	230040350,
	230194200,
	230348100,
	230502050,
	230656050,
	230810100,
	230964200,
	231118350,
	231272550,
	231426800,
	231581100,
	231735450,
	231889850,
	232044300,
	232198800,
	232353350,
	232507950,
	232662600,
	232817300,
	232972050,
	233126850,
	233281700,
	233436600,
	233591550,
	233746550,
	233901600,
	234056700,
	234211850,
	234367050,
	234522300,
	234677600,
	234832950,
	234988350,
	235143800,
	235299300,
	235454850,
	235610450,
	235766100,
	235921800,
	236077550,
	236233350,
	236389200,
	236545100,
	236701050,
	236857050,
	237013100,
	237169200,
	237325350,
	237481550,
	237637800,
	237794100,
	237950450,
	238106850,
	238263300,
	238419800,
	238576350,
	238732950,
	238889600,
	239046300,
	239203050,
	239359850,
	239516700,
	239673600,
	239830550,
	239987550,
	240144600,
	240301700,
	240458850,
	240616050,
	240773300,
	240930600,
	241087950,
	241245350,
	241402800,
	241560300,
	241717850,
	241875450,
	242033100,
	242190800,
	242348550,
	242506350,
	242664200,
	242822100,
	242980050,
	243138050,
	243296100,
	243454200,
	243612350,
	243770550,
	243928800,
	244087100,
	244248513,
	244403850,
	244562300,
	244720800,
	244879350,
	245037950,
	245196600,
	245355300,
	245514050,
	245672850,
	245831700,
	245990600,
	246149550,
	246308550,
	246467600,
	246626700,
	246785850,
	246945050,
	247104300,
	247263600,
	247422950,
	247582350,
	247741800,
	247901300,
	248060850,
	248220450,
	248380100,
	248539800,
	248699550,
	248859350,
	249019200,
	249179100,
	249339050,
	249499050,
	249659100,
	249819200,
	249979350,
	250139550,
	250299800,
	250460100,
	250620450,
	250780850,
	250941300,
	251101800,
	251262350,
	251422950,
	251583600,
	251744300,
	251905050,
	252065850,
	252226700,
	252387600,
	252548550,
	252709550,
	252870600,
	253031700,
	253192850,
	253354050,
	253515300,
	253676600,
	253837950,
	253999350,
	254160800,
	254322300,
	254483850,
	254648513,
	254807100,
	254968800,
	255130550,
	255292350,
	255454200,
	255616100,
	255778050,
	255940050,
	256102100,
	256264200,
	256426350,
	256588550,
	256750800,
	256913100,
	257075450,
	257237850,
	257400300,
	257562800,
	257725350,
	257887950,
	258050600,
	258213300,
	258376050,
	258538850,
	258701700,
	258864600,
	259027550,
	259190550,
	259353600,
	259516700,
	259679850,
	259843050,
	260006300,
	260169600,
	260332950,
	260496350,
	260659800,
	260823300,
	260986850,
	261150450,
	261314100,
	261477800,
	261641550,
	261805350,
	261969200,
	262133100,
	262297050,
	262461050,
	262625100,
	262789200,
	262953350,
	263117550,
	263281800,
	263446100,
	263610450,
	263774850,
	263939300,
	264103800,
	264268350,
	264432950,
	264597600,
	264762300,
	264927050,
	265091850,
	265256700,
	265421600,
	265586550,
	265751550,
	265916600,
	266081700,
	266246850,
	266412050,
	266577300,
	266742600,
	266907950,
	267073350,
	267238800,
	267404300,
	267569850,
	267735450,
	267901100,
	268066800,
	268232550,
	268398350,
	268564200,
	268730100,
	268896050,
	269062050,
	269228100,
	269394200,
	269560350,
	269726550,
	269892800,
	270059100,
	270225450,
	270391850,
	270558300,
	270724800,
	270891350,
	271057950,
	271224600,
	271391300,
	271558050,
	271724850,
	271891700,
	272058600,
	272225550,
	272392550,
	272559600,
	272726700,
	272893850,
	273061050,
	273228300,
	273395600,
	273562950,
	273730350,
	273897800,
	274065300,
	274232850,
	274400450,
	274568100,
	274735800,
	274903550,
	275071350,
	275239200,
	275407100,
	275575050,
	275743050,
	275911100,
	276079200,
	276247350,
	276415550,
	276583800,
	276752100,
	276920450,
	277088850,
	277257300,
	277425800,
	277594350,
	277762950,
	277931600,
	278100300,
	278269050,
	278437850,
	278606700,
	278775600,
	278944550,
	279113550,
	279282600,
	279451700,
	279620850,
	279790050,
	279959300,
	280128600,
	280297950,
	280467350,
	280636800,
	280806300,
	280975850,
	281148513,
	281315100,
	281484800,
	281654550,
	281824350,
	281994200,
	282164100,
	282334050,
	282504050,
	282674100,
	282844200,
	283014350,
	283184550,
	283354800,
	283525100,
	283695450,
	283865850,
	284036300,
	284206800,
	284377350,
	284547950,
	284718600,
	284889300,
	285060050,
	285230850,
	285401700,
	285572600,
	285743550,
	285914550,
	286085600,
	286256700,
	286427850,
	286599050,
	286770300,
	286941600,
	287112950,
	287284350,
	287455800,
	287627300,
	287798850,
	287970450,
	288142100,
	288313800,
	288485550,
	288657350,
	288829200,
	289001100,
	289173050,
	289345050,
	289517100,
	289689200,
	289861350,
	290033550,
	290205800,
	290378100,
	290550450,
	290722850,
	290895300,
	291067800,
	291240350,
	291412950,
	291585600,
	291758300,
	291931050,
	292103850,
	292276700,
	292449600,
	292622550,
	292795550,
	292968600,
	293141700,
	293314850,
	293488050,
	293661300,
	293834600,
	294007950,
	294181350,
	294354800,
	294528300,
	294701850,
	294875450,
	295049100,
	295222800,
	295396550,
	295570350,
	295744200,
	295918100,
	296092050,
	296266050,
	296440100,
	296614200,
	296788350,
	296962550,
	297136800,
	297311100,
	297485450,
	297659850,
	297834300,
	298008800,
	298183350,
	298357950,
	298532600,
	298707300,
	298882050,
	299056850,
	299231700,
	299406600,
	299581550,
	299756550,
	299931600,
	300106700,
	300281850,
	300457050,
	300632300,
	300807600,
	300982950,
	301158350,
	301333800,
	301509300,
	301684850,
	301860450,
	302036100,
	302211800,
	302387550,
	302563350,
	302739200,
	302915100,
	303091050,
	303267050,
	303443100,
	303619200,
	303795350,
	303971550,
	304147800,
	304324100,
	304500450,
	304676850,
	304853300,
	305029800,
	305206350,
	305382950,
	305559600,
	305736300,
	305913050,
	306089850,
	306266700,
	306443600,
	306620550,
	306797550,
	306974600,
	307151700,
	307328850,
	307506050,
	307683300,
	307860600,
	308037950,
	308215350,
	308392800,
	308570300,
	308747850,
	308925450,
	309103100,
	309280800,
	309458550,
	309636350,
	309814200,
	309992100,
	310170050,
	310348050,
	310526100,
	310704200,
	310882350,
	311060550,
	311238800,
	311417100,
	311595450,
	311773850,
	311952300,
	312130800,
	312309350,
	312487950,
	312666600,
	312845300,
	313024050,
	313202850,
	313381700,
	313560600,
	313739550,
	313918550,
	314097600,
	314276700,
	314455850,
	314635050,
	314814300,
	314993600,
	315172950,
	315352350,
	315531800,
	315711300,
	315890850,
	316070450,
	316250100,
	316429800,
	316609550,
	316789350,
	316969200,
	317149100,
	317329050,
	317509050,
	317689100,
	317869200,
	318049350,
	318229550,
	318409800,
	318590100,
	318770450,
	318950850,
	319131300,
	319311800,
	319492350,
	319672950,
	319853600,
	320034300,
	320215050,
	320395850,
	320576700,
	320757600,
	320938550,
	321119550,
	321300600,
	321481700,
	321662850,
	321844050,
	322025300,
	322206600,
	322387950,
	322569350,
	322750800,
	322932300,
	323113850,
	323295450,
	323477100,
	323658800,
	323840550,
	324022350,
	324204200,
	324386100,
	324568050,
	324750050,
	324932100,
	325114200,
	325296350,
	325478550,
	325660800,
	325843100,
	326025450,
	326207850,
	326390300,
	326572800,
	326755350,
	326937950,
	327120600,
	327303300,
	327486050,
	327668850,
	327851700,
	328034600,
	328217550,
	328400550,
	328583600,
	328766700,
	328949850,
	329133050,
	329316300,
	329499600,
	329682950,
	329866350,
	330049800,
	330233300,
	330416850,
	330600450,
	330784100,
	330967800,
	331151550,
	331335350,
	331519200,
	331703100,
	331887050,
	332071050,
	332255100,
	332439200,
	332623350,
	332807550,
	332991800,
	333176100,
	333360450,
	333544850,
	333729300,
	333913800,
	334098350,
	334282950,
	334467600,
	334652300,
	334837050,
	335021850,
	335206700,
	335391600,
	335576550,
	335761550,
	335946600,
	336131700,
	336316850,
	336502050,
	336687300,
	336872600,
	337057950,
	337243350,
	337428800,
	337614300,
	337799850,
	337985450,
	338171100,
	338356800,
	338542550,
	338728350,
	338914200,
	339100100,
	339286050,
	339472050,
	339658100,
	339844200,
	340030350,
	340216550,
	340402800,
	340589100,
	340775450,
	340961850,
	341148300,
	341334800,
	341521350,
	341707950,
	341894600,
	342081300,
	342268050,
	342454850,
	342641700,
	342828600,
	343015550,
	343202550,
	343389600,
	343576700,
	343763850,
	343951050,
	344138300,
	344325600,
	344512950,
	344700350,
	344887800,
	345075300,
	345262850,
	348513450,
	345638100,
	345825800,
	346013550,
	346201350,
	346389200,
	346577100,
	346765050,
	346953050,
	347141100,
	347329200,
	347517350,
	347705550,
	347893800,
	348082100,
	348270450,
	348458850,
	348647300,
	348835800,
	349024350,
	349212950,
	349401600,
	349590300,
	349779050,
	349967850,
	350156700,
	350345600,
	350534550,
	350723550,
	350912600,
	351101700,
	351290850,
	351480050,
	351669300,
	351858600,
	352047950,
	352237350,
	352426800,
	352616300,
	352805850,
	352995450,
	353185100,
	353374800,
	353564550,
	353754350,
	353944200,
	354134100,
	354324050,
	354514050,
	354704100,
	354894200,
	355084350,
	355274550,
	355464800,
	355655100,
	355848513,
	356035850,
	356226300,
	356416800,
	356607350,
	356797950,
	356988600,
	357179300,
	357370050,
	357560850,
	357751700,
	357942600,
	358133550,
	358324550,
	358515600,
	358706700,
	358897850,
	359089050,
	359280300,
	359471600,
	359662950,
	359854350,
	360045800,
	360237300,
	360428850,
	360620450,
	360812100,
	361003800,
	361195550,
	361387350,
	361579200,
	361771100,
	361963050,
	362155050,
	362347100,
	362539200,
	362731350,
	362923550,
	363115800,
	363308100,
	363500450,
	363692850,
	363885300,
	364077800,
	364270350,
	364462950,
	364655600,
	364848300,
	365041050,
	365233850,
	365426700,
	365619600,
	365812550,
	366005550,
	366198600,
	366391700,
	366584850,
	366778050,
	366971300,
	367164600,
	367357950,
	367551350,
	367744800,
	367938300,
	368131850,
	368325450,
	368519100,
	368712800,
	368906550,
	369100350,
	369294200,
	369488100,
	369682050,
	369876050,
	370070100,
	370264200,
	370458350,
	370652550,
	370846800,
	371041100,
	371235450,
	371429850,
	371624300,
	371818800,
	372013350,
	372207950,
	372402600,
	372597300,
	372792050,
	372986850,
	373181700,
	373376600,
	373571550,
	373766550,
	373961600,
	374156700,
	374351850,
	374547050,
	374742300,
	374937600,
	375132950,
	375328350,
	375523800,
	375719300,
	375914850,
	376110450,
	376306100,
	376501800,
	376697550,
	376893350,
	377089200,
	377285100,
	377481050,
	377677050,
	377873100,
	378069200,
	378265350,
	378461550,
	378657800,
	378854100,
	379050450,
	379246850,
	379443300,
	379639800,
	379836350,
	380032950,
	380229600,
	380426300,
	380623050,
	380819850,
	381016700,
	381213600,
	381410550,
	381607550,
	381804600,
	382001700,
	382198850,
	382396050,
	382593300,
	382790600,
	382987950,
	383185350,
	383382800,
	383580300,
	383777850,
	383975450,
	384173100,
	384370800,
	384568550,
	384766350,
	384964200,
	385162100,
	385360050,
	385558050,
	385756100,
	385954200,
	386152350,
	386350550,
	386548800,
	386747100,
	386948513,
	387143850,
	387342300,
	387540800,
	387739350,
	387937950,
	388136600,
	388335300,
	388534050,
	388732850,
	388931700,
	389130600,
	389329550,
	389528550,
	389727600,
	389926700,
	390125850,
	390325050,
	390524300,
	390723600,
	390922950,
	391122350,
	391321800,
	391521300,
	391720850,
	391920450,
	392120100,
	392319800,
	392519550,
	392719350,
	392919200,
	393119100,
	393319050,
	393519050,
	393719100,
	393919200,
	394119350,
	394319550,
	394519800,
	394720100,
	394920450,
	395120850,
	395321300,
	395521800,
	395722350,
	395922950,
	396123600,
	396324300,
	396525050,
	396725850,
	396926700,
	397127600,
	397328550,
	397529550,
	397730600,
	397931700,
	398132850,
	398334050,
	398535300,
	398736600,
	398937950,
	399139350,
	399340800,
	399542300,
	399743850,
	399948513,
	400147100,
	400348800,
	400550550,
	400752350,
	400954200,
	401156100,
	401358050,
	401560050,
	401762100,
	401964200,
	402166350,
	402368550,
	402570800,
	402773100,
	402975450,
	403177850,
	403380300,
	403582800,
	403785350,
	403987950,
	404190600,
	404393300,
	404596050,
	404798850,
	405001700,
	405204600,
	405407550,
	405610550,
	405813600,
	406016700,
	406219850,
	406423050,
	406626300,
	406829600,
	407032950,
	407236350,
	407439800,
	407643300,
	407846850,
	408050450,
	408254100,
	408457800,
	408661550,
	408865350,
	409069200,
	409273100,
	409477050,
	409681050,
	409885100,
	410089200,
	410293350,
	410497550,
	410701800,
	410906100,
	411110450,
	411314850,
	411519300,
	411723800,
	411928350,
	412132950,
	412337600,
	412542300,
	412747050,
	412951850,
	413156700,
	413361600,
	413566550,
	413771550,
	413976600,
	414181700,
	414386850,
	414592050,
	414797300,
	415002600,
	415207950,
	415413350,
	415618800,
	415824300,
	416029850,
	416235450,
	416441100,
	416646800,
	416852550,
	417058350,
	417264200,
	417470100,
	417676050,
	417882050,
	418088100,
	418294200,
	418500350,
	418706550,
	418912800,
	419119100,
	419325450,
	419531850,
	419738300,
	419944800,
	420151350,
	420357950,
	420564600,
	420771300,
	420978050,
	421184850,
	421391700,
	421598600,
	421805550,
	422012550,
	422219600,
	422426700,
	422633850,
	422841050,
	423048300,
	423255600,
	423462950,
	423670350,
	423877800,
	424085300,
	424292850,
	424500450,
	424708100,
	424915800,
	425123550,
	425331350,
	425539200,
	425747100,
	425955050,
	426163050,
	426371100,
	426579200,
	426787350,
	426995550,
	427203800,
	427412100,
	427620450,
	427828850,
	428037300,
	428245800,
	428454350,
	428662950,
	428871600,
	429080300,
	429289050,
	429497850,
	429706700,
	429915600,
	430124550,
	430333550,
	430542600,
	430751700,
	430960850,
	431170050,
	431379300,
	431588600,
	431797950,
	432007350,
	432216800,
	432426300,
	432635850,
	432848513,
	433055100,
	433264800,
	433474550,
	433684350,
	433894200,
	434104100,
	434314050,
	434524050,
	434734100,
	434944200,
	435154350,
	435364550,
	435574800,
	435785100,
	435995450,
	436205850,
	436416300,
	436626800,
	436837350,
	437047950,
	437258600,
	437469300,
	437680050,
	437890850,
	438101700,
	438312600,
	438523550,
	438734550,
	438945600,
	439156700,
	439367850,
	439579050,
	439790300,
	440001600,
	440212950,
	440424350,
	440635800,
	440847300,
	441058850,
	441270450,
	441482100,
	441693800,
	441905550,
	442117350,
	442329200,
	442541100,
	442753050,
	442965050,
	443177100,
	443389200,
	443601350,
	443813550,
	444025800,
	444238100,
	444450450,
	444662850,
	444875300,
	445087800,
	445300350,
	445512950,
	445725600,
	445938300,
	446151050,
	446363850,
	446576700,
	446789600,
	447002550,
	447215550,
	447428600,
	447641700,
	447854850,
	448068050,
	448281300,
	448494600,
	448707950,
	448921350,
	449134800,
	449348300,
	449561850,
	449775450,
	449989100,
	450202800,
	450416550,
	450630350,
	450844200,
	451058100,
	451272050,
	451486050,
	451700100,
	451914200,
	452128350,
	452342550,
	452556800,
	452771100,
	452985450,
	453199850,
	453414300,
	453628800,
	453843350,
	454057950,
	454272600,
	454487300,
	454702050,
	454916850,
	455131700,
	455346600,
	455561550,
	455776550,
	455991600,
	456206700,
	456421850,
	456637050,
	456852300,
	457067600,
	457282950,
	457498350,
	457713800,
	457929300,
	458144850,
	458360450,
	458576100,
	458791800,
	459007550,
	459223350,
	459439200,
	459655100,
	459871050,
	460087050,
	460303100,
	460519200,
	460735350,
	460951550,
	461167800,
	461384100,
	461600450,
	461816850,
	462033300,
	462249800,
	462466350,
	462682950,
	462899600,
	463116300,
	463333050,
	463549850,
	463766700,
	463983600,
	464200550,
	464417550,
	464634600,
	464851700,
	465068850,
	465286050,
	465503300,
	465720600,
	465937950,
	466155350,
	466372800,
	466590300,
	466807850,
	467025450,
	467243100,
	467460800,
	467678550,
	467896350,
	468114200,
	468332100,
	468550050,
	468768050,
	468986100,
	469204200,
	469422350,
	469640550,
	469858800,
	470077100,
	470295450,
	470513850,
	470732300,
	470950800,
	471169350,
	471387950,
	471606600,
	471825300,
	472044050,
	472262850,
	472481700,
	472700600,
	472919550,
	473138550,
	473357600,
	473576700,
	473795850,
	474015050,
	474234300,
	474453600,
	474672950,
	474892350,
	475111800,
	475331300,
	475550850,
	475770450,
	475990100,
	476209800,
	476429550,
	476649350,
	476869200,
	477089100,
	477309050,
	477529050,
	477749100,
	477969200,
	478189350,
	478409550,
	478629800,
	478850100,
	479070450,
	479290850,
	479511300,
	479731800,
	479952350,
	480172950,
	480393600,
	480614300,
	480835050,
	481055850,
	481276700,
	481497600,
	481718550,
	481939550,
	482160600,
	482381700,
	482602850,
	482824050,
	483045300,
	483266600,
	483487950,
	483709350,
	483930800,
	484152300,
	484373850,
	484595450,
	484817100,
	485038800,
	485260550,
	485482350,
	485704200,
	485926100,
	486148050,
	486370050,
	486592100,
	486814200,
	487036350,
	487258550,
	487480800,
	487703100,
	487925450,
	488147850,
	488370300,
	488592800,
	488815350,
	489037950,
	489260600,
	489483300,
	489706050,
	489928850,
	490151700,
	490374600,
	490597550,
	490820550,
	491043600,
	491266700,
	491489850,
	491713050,
	491936300,
	492159600,
	492382950,
	492606350,
	492829800,
	493053300,
	493276850,
	493500450,
	493724100,
	493947800,
	494171550,
	494395350,
	494619200,
	494843100,
	495067050,
	495291050,
	495515100,
	495739200,
	495963350,
	496187550,
	496411800,
	496636100,
	496860450,
	497084850,
	497309300,
	497533800,
	497758350,
	497982950,
	498207600,
	498432300,
	498657050,
	498881850,
	499106700,
	499331600,
	499556550,
	499781550,
	500006600,
	500231700,
	500456850,
	500682050,
	500907300,
	501132600,
	501357950,
	501583350,
	501808800,
	502034300,
	502259850,
	502485450,
	502711100,
	502936800,
	503162550,
	503388350,
	503614200,
	503840100,
	504066050,
	504292050,
	504518100,
	504744200,
	504970350,
	505196550,
	505422800,
	505649100,
	505875450,
	506101850,
	506328300,
	506554800,
	506781350,
	507007950,
	507234600,
	507461300,
	507688050,
	507914850,
	508141700,
	508368600,
	508595550,
	508822550,
	509049600,
	509276700,
	509503850,
	509731050,
	509958300,
	510185600,
	510412950,
	510640350,
	510867800,
	511095300,
	511322850,
	511550450,
	511778100,
	512005800,
	512233550,
	512461350,
	512689200,
	512917100,
	513145050,
	513373050,
	513601100,
	513829200,
	514057350,
	514285550,
	514513800,
	514742100,
	514970450,
	515198850,
	515427300,
	515655800,
	515884350,
	516112950,
	516341600,
	516570300,
	516799050,
	517027850,
	517256700,
	517485600,
	517714550,
	517943550,
	518172600,
	518401700,
	518630850,
	518860050,
	519089300,
	519318600,
	519547950,
	519777350,
	520006800,
	520236300,
	520465850,
	520695450,
	520925100,
	521154800,
	521384550,
	521614350,
	521844200,
	522074100,
	522304050,
	522534050,
	522764100,
	522994200,
	523224350,
	523454550,
	523684800,
	523915100,
	524148513,
	524375850,
	524606300,
	524836800,
	525067350,
	525297950,
	525528600,
	525759300,
	525990050,
	526220850,
	526451700,
	526682600,
	526913550,
	527144550,
	527375600,
	527606700,
	527837850,
	528069050,
	528300300,
	528531600,
	528762950,
	528994350,
	529225800,
	529457300,
	529688850,
	529920450,
	530152100,
	530383800,
	530615550,
	530847350,
	531079200,
	531311100,
	531543050,
	531775050,
	532007100,
	532239200,
	532471350,
	532703550,
	532935800,
	533168100,
	533400450,
	533632850,
	533865300,
	534097800,
	534330350,
	534562950,
	534795600,
	535028300,
	535261050,
	535493850,
	535726700,
	535959600,
	536192550,
	536425550,
	536658600,
	536891700,
	537124850,
	537358050,
	537591300,
	537824600,
	538057950,
	538291350,
	538524800,
	538758300,
	538991850,
	539225450,
	539459100,
	539692800,
	539926550,
	540160350,
	540394200,
	540628100,
	540862050,
	541096050,
	541330100,
	541564200,
	541798350,
	542032550,
	542266800,
	542501100,
	542735450,
	542969850,
	543204300,
	543438800,
	543673350,
	543907950,
	544142600,
	544377300,
	544612050,
	544846850,
	545081700,
	545316600,
	545551550,
	545786550,
	546021600,
	546256700,
	546491850,
	546727050,
	546962300,
	547197600,
	547432950,
	547668350,
	547903800,
	548139300,
	548374850,
	548610450,
	548846100,
	549081800,
	549317550,
	549553350,
	549789200,
	550025100,
	550261050,
	550497050,
	550733100,
	550969200,
	551205350,
	551441550,
	551677800,
	551914100,
	552150450,
	552386850,
	552623300,
	552859800,
	553096350,
	553332950,
	553569600,
	553806300,
	554043050,
	554279850,
	554516700,
	554753600,
	554990550,
	555227550,
	555464600,
	555701700,
	555938850,
	556176050,
	556413300,
	556650600,
	556887950,
	557125350,
	557362800,
	557600300,
	557837850,
	558075450,
	558313100,
	558550800,
	558788550,
	559026350,
	559264200,
	559502100,
	559740050,
	559978050,
	560216100,
	560454200,
	560692350,
	560930550,
	561168800,
	561407100,
	561648513,
	561883850,
	562122300,
	562360800,
	562599350,
	562837950,
	563076600,
	563315300,
	563554050,
	563792850,
	564031700,
	564270600,
	564509550,
	564748550,
	564987600,
	565226700,
	565465850,
	565705050,
	565944300,
	566183600,
	566422950,
	566662350,
	566901800,
	567141300,
	567380850,
	567620450,
	567860100,
	568099800,
	568339550,
	568579350,
	568819200,
	569059100,
	569299050,
	569539050,
	569779100,
	570019200,
	570259350,
	570499550,
	570739800,
	570980100,
	571220450,
	571460850,
	571701300,
	571941800,
	572182350,
	572422950,
	572663600,
	572904300,
	573145050,
	573385850,
	573626700,
	573867600,
	574108550,
	574349550,
	574590600,
	574831700,
	575072850,
	575314050,
	575555300,
	575796600,
	576037950,
	576279350,
	576520800,
	576762300,
	577003850,
	577248513,
	577487100,
	577728800,
	577970550,
	578212350,
	578454200,
	578696100,
	578938050,
	579180050,
	579422100,
	579664200,
	579906350,
	580148550,
	580390800,
	580633100,
	580875450,
	581117850,
	581360300,
	581602800,
	581845350,
	582087950,
	582330600,
	582573300,
	582816050,
	583058850,
	583301700,
	583544600,
	583787550,
	584030550,
	584273600,
	584516700,
	584759850,
	585003050,
	585246300,
	585489600,
	585732950,
	585976350,
	586219800,
	586463300,
	586706850,
	586950450,
	587194100,
	587437800,
	587681550,
	587925350,
	588169200,
	588413100,
	588657050,
	588901050,
	589145100,
	589389200,
	589633350,
	589877550,
	590121800,
	590366100,
	590610450,
	590854850,
	591099300,
	591343800,
	591588350,
	591832950,
	592077600,
	592322300,
	592567050,
	592811850,
	593056700,
	593301600,
	593546550,
	593791550,
	594036600,
	594281700,
	594526850,
	594772050,
	595017300,
	595262600,
	595507950,
	595753350,
	595998800,
	596244300,
	596489850,
	596735450,
	596981100,
	597226800,
	597472550,
	597718350,
	597964200,
	598210100,
	598456050,
	598702050,
	598948100,
	599194200,
	599440350,
	599686550,
	599932800,
	600179100,
	600425450,
	600671850,
	600918300,
	601164800,
	601411350,
	601657950,
	601904600,
	602151300,
	602398050,
	602644850,
	602891700,
	603138600,
	603385550,
	603632550,
	603879600,
	604126700,
	604373850,
	604621050,
	604868300,
	605115600,
	605362950,
	605610350,
	605857800,
	606105300,
	606352850,
	606600450,
	606848100,
	607095800,
	607343550,
	607591350,
	607839200,
	608087100,
	608335050,
	608583050,
	608831100,
	609079200,
	609327350,
	609575550,
	609823800,
	610072100,
	610320450,
	610568850,
	610817300,
	611065800,
	611314350,
	611562950,
	611811600,
	612060300,
	612309050,
	612557850,
	612806700,
	613055600,
	613304550,
	613553550,
	613802600,
	614051700,
	614300850,
	614550050,
	614799300,
	615048600,
	615297950,
	615547350,
	615796800,
	616046300,
	616295850,
	616548513,
	616795100,
	617044800,
	617294550,
	617544350,
	617794200,
	618044100,
	618294050,
	618544050,
	618794100,
	619044200,
	619294350,
	619544550,
	619794800,
	620045100,
	620295450,
	620545850,
	620796300,
	621046800,
	621297350,
	621547950,
	621798600,
	622049300,
	622300050,
	622550850,
	622801700,
	623052600,
	623303550,
	623554550,
	623805600,
	624056700,
	624307850,
	624559050,
	624810300,
	625061600,
	625312950,
	625564350,
	625815800,
	626067300,
	626318850,
	626570450,
	626822100,
	627073800,
	627325550,
	627577350,
	627829200,
	628081100,
	628333050,
	628585050,
	628837100,
	629089200,
	629341350,
	629593550,
	629845800,
	630098100,
	630350450,
	630602850,
	630855300,
	631107800,
	631360350,
	631612950,
	631865600,
	632118300,
	632371050,
	632623850,
	632876700,
	633129600,
	633382550,
	633635550,
	633888600,
	634141700,
	634394850,
	634648050,
	634901300,
	635154600,
	635407950,
	635661350,
	635914800,
	636168300,
	636421850,
	636675450,
	636929100,
	637182800,
	637436550,
	637690350,
	637944200,
	638198100,
	638452050,
	638706050,
	638960100,
	639214200,
	639468350,
	639722550,
	639976800,
	640231100,
	640485450,
	640739850,
	640994300,
	641248800,
	641503350,
	641757950,
	642012600,
	642267300,
	642522050,
	642776850,
	643031700,
	643286600,
	643541550,
	643796550,
	644051600,
	644306700,
	644561850,
	644817050,
	645072300,
	645327600,
	645582950,
	645838350,
	646093800,
	646349300,
	646604850,
	646860450,
	647116100,
	647371800,
	647627550,
	647883350,
	648139200,
	648395100,
	648651050,
	648907050,
	649163100,
	649419200,
	649675350,
	649931550,
	650187800,
	650444100,
	650700450,
	650956850,
	651213300,
	651469800,
	651726350,
	651982950,
	652239600,
	652496300,
	652753050,
	653009850,
	653266700,
	653523600,
	653780550,
	654037550,
	654294600,
	654551700,
	654808850,
	655066050,
	655323300,
	655580600,
	655837950,
	656095350,
	656352800,
	656610300,
	656867850,
	657125450,
	657383100,
	657640800,
	657898550,
	658156350,
	658414200,
	658672100,
	658930050,
	659188050,
	659446100,
	659704200,
	659962350,
	660220550,
	660478800,
	660737100,
	660995450,
	661253850,
	661512300,
	661770800,
	662029350,
	662287950,
	662546600,
	662805300,
	663064050,
	663322850,
	663581700,
	663840600,
	664099550,
	664358550,
	664617600,
	664876700,
	665135850,
	665395050,
	665654300,
	665913600,
	666172950,
	666432350,
	666691800,
	666951300,
	667210850,
	667470450,
	667730100,
	667989800,
	668249550,
	668509350,
	668769200,
	669029100,
	669289050,
	669549050,
	669809100,
	670069200,
	670329350,
	670589550,
	670849800,
	671110100,
	671370450,
	671630850,
	671891300,
	672151800,
	672412350,
	672672950,
	672933600,
	673194300,
	673455050,
	673715850,
	673976700,
	674237600,
	674498550,
	674759550,
	675020600,
	675281700,
	675542850,
	675804050,
	676065300,
	676326600,
	676587950,
	676849350,
	677110800,
	677372300,
	677633850,
	677895450,
	678157100,
	678418800,
	678680550,
	678942350,
	679204200,
	679466100,
	679728050,
	679990050,
	680252100,
	680514200,
	680776350,
	681038550,
	681300800,
	681563100,
	681825450,
	682087850,
	682350300,
	682612800,
	682875350,
	683137950,
	683400600,
	683663300,
	683926050,
	684188850,
	684451700,
	684714600,
	684977550,
	685240550,
	685503600,
	685766700,
	686029850,
	686293050,
	686556300,
	686819600,
	687082950,
	687346350,
	687609800,
	687873300,
	688136850,
	688400450,
	688664100,
	688927800,
	689191550,
	689455350,
	689719200,
	689983100,
	690247050,
	690511050,
	690775100,
	691039200,
	691303350,
	691567550,
	691831800,
	692096100,
	692360450,
	692624850,
	692889300,
	693153800,
	693418350,
	693682950,
	693947600,
	694212300,
	694477050,
	694741850,
	695006700,
	695271600,
	695536550,
	695801550,
	696066600,
	696331700,
	696596850,
	696862050,
	697127300,
	697392600,
	697657950,
	697923350,
	698188800,
	698454300,
	698719850,
	698985450,
	699251100,
	699516800,
	699782550,
	700048350,
	700314200,
	700580100,
	700846050,
	701112050,
	701378100,
	701644200,
	701910350,
	702176550,
	702442800,
	702709100,
	702975450,
	703241850,
	703508300,
	703774800,
	704041350,
	704307950,
	704574600,
	704841300,
	705108050,
	705374850,
	705641700,
	705908600,
	706175550,
	706442550,
	706709600,
	706976700,
	707243850,
	707511050,
	707778300,
	708045600,
	708312950,
	708580350,
	708847800,
	709115300,
	709382850,
	709650450,
	709918100,
	710185800,
	710453550,
	710721350,
	710989200,
	711257100,
	711525050,
	711793050,
	712061100,
	712329200,
	712597350,
	712865550,
	713133800,
	713402100,
	713670450,
	713938850,
	714207300,
	714475800,
	714744350,
	715012950,
	715281600,
	715550300,
	715819050,
	716087850,
	716356700,
	716625600,
	716894550,
	717163550,
	717432600,
	717701700,
	717970850,
	718240050,
	718509300,
	718778600,
	719047950,
	719317350,
	719586800,
	719856300,
	720125850,
	720395450,
	720665100,
	720934800,
	721204550,
	721474350,
	721744200,
	722014100,
	722284050,
	722554050,
	722824100,
	723094200,
	723364350,
	723634550,
	723904800,
	724175100,
	724448513,
	724715850,
	724986300,
	725256800,
	725527350,
	725797950,
	726068600,
	726339300,
	726610050,
	726880850,
	727151700,
	727422600,
	727693550,
	727964550,
	728235600,
	728506700,
	728777850,
	729049050,
	729320300,
	729591600,
	729862950,
	730134350,
	730405800,
	730677300,
	730948850,
	731220450,
	731492100,
	731763800,
	732035550,
	732307350,
	732579200,
	732851100,
	733123050,
	733395050,
	733667100,
	733939200,
	734211350,
	734483550,
	734755800,
	735028100,
	735300450,
	735572850,
	735845300,
	736117800,
	736390350,
	736662950,
	736935600,
	737208300,
	737481050,
	737753850,
	738026700,
	738299600,
	738572550,
	738845550,
	739118600,
	739391700,
	739664850,
	739938050,
	740211300,
	740484600,
	740757950,
	741031350,
	741304800,
	741578300,
	741851850,
	742125450,
	742399100,
	742672800,
	742946550,
	743220350,
	743494200,
	743768100,
	744042050,
	744316050,
	744590100,
	744864200,
	745138350,
	745412550,
	745686800,
	745961100,
	746235450,
	746509850,
	746784300,
	747058800,
	747333350,
	747607950,
	747882600,
	748157300,
	748432050,
	748706850,
	748981700,
	749256600,
	749531550,
	749806550,
	750081600,
	750356700,
	750631850,
	750907050,
	751182300,
	751457600,
	751732950,
	752008350,
	752283800,
	752559300,
	752834850,
	753110450,
	753386100,
	753661800,
	753937550,
	754213350,
	754489200,
	754765100,
	755041050,
	755317050,
	755593100,
	755869200,
	756145350,
	756421550,
	756697800,
	756974100,
	757250450,
	757526850,
	757803300,
	758079800,
	758356350,
	758632950,
	758909600,
	759186300,
	759463050,
	759739850,
	760016700,
	760293600,
	760570550,
	760847550,
	761124600,
	761401700,
	761678850,
	761956050,
	762233300,
	762510600,
	762787950,
	763065350,
	763342800,
	763620300,
	763897850,
	764175450,
	764453100,
	764730800,
	765008550,
	765286350,
	765564200,
	765842100,
	766120050,
	766398050,
	766676100,
	766954200,
	767232350,
	767510550,
	767788800,
	768067100,
	768348513,
	768623850,
	768902300,
	769180800,
	769459350,
	769737950,
	770016600,
	770295300,
	770574050,
	770852850,
	771131700,
	771410600,
	771689550,
	771968550,
	772247600,
	772526700,
	772805850,
	773085050,
	773364300,
	773643600,
	773922950,
	774202350,
	774481800,
	774761300,
	775040850,
	775320450,
	775600100,
	775879800,
	776159550,
	776439350,
	776719200,
	776999100,
	777279050,
	777559050,
	777839100,
	778119200,
	778399350,
	778679550,
	778959800,
	779240100,
	779520450,
	779800850,
	780081300,
	780361800,
	780642350,
	780922950,
	781203600,
	781484300,
	781765050,
	782045850,
	782326700,
	782607600,
	782888550,
	783169550,
	783450600,
	783731700,
	784012850,
	784294050,
	784575300,
	784856600,
	785137950,
	785419350,
	785700800,
	785982300,
	786263850,
	786548513,
	786827100,
	787108800,
	787390550,
	787672350,
	787954200,
	788236100,
	788518050,
	788800050,
	789082100,
	789364200,
	789646350,
	789928550,
	790210800,
	790493100,
	790775450,
	791057850,
	791340300,
	791622800,
	791905350,
	792187950,
	792470600,
	792753300,
	793036050,
	793318850,
	793601700,
	793884600,
	794167550,
	794450550,
	794733600,
	795016700,
	795299850,
	795583050,
	795866300,
	796149600,
	796432950,
	796716350,
	796999800,
	797283300,
	797566850,
	797850450,
	798134100,
	798417800,
	798701550,
	798985350,
	799269200,
	799553100,
	799837050,
	800121050,
	800405100,
	800689200,
	800973350,
	801257550,
	801541800,
	801826100,
	802110450,
	802394850,
	802679300,
	802963800,
	803248350,
	803532950,
	803817600,
	804102300,
	804387050,
	804671850,
	804956700,
	805241600,
	805526550,
	805811550,
	806096600,
	806381700,
	806666850,
	806952050,
	807237300,
	807522600,
	807807950,
	808093350,
	808378800,
	808664300,
	808949850,
	809235450,
	809521100,
	809806800,
	810092550,
	810378350,
	810664200,
	810950100,
	811236050,
	811522050,
	811808100,
	812094200,
	812380350,
	812666550,
	812952800,
	813239100,
	813525450,
	813811850,
	814098300,
	814384800,
	814671350,
	814957950,
	815244600,
	815531300,
	815818050,
	816104850,
	816391700,
	816678600,
	816965550,
	817252550,
	817539600,
	817826700,
	818113850,
	818401050,
	818688300,
	818975600,
	819262950,
	819550350,
	819837800,
	820125300,
	820412850,
	820700450,
	820988100,
	821275800,
	821563550,
	821851350,
	822139200,
	822427100,
	822715050,
	823003050,
	823291100,
	823579200,
	823867350,
	824155550,
	824443800,
	824732100,
	825020450,
	825308850,
	825597300,
	825885800,
	826174350,
	826462950,
	826751600,
	827040300,
	827329050,
	827617850,
	827906700,
	828195600,
	828484550,
	828773550,
	829062600,
	829351700,
	829640850,
	829930050,
	830219300,
	830508600,
	830797950,
	831087350,
	831376800,
	831666300,
	831955850,
	832248513,
	832535100,
	832824800,
	833114550,
	833404350,
	833694200,
	833984100,
	834274050,
	834564050,
	834854100,
	835144200,
	835434350,
	835724550,
	836014800,
	836305100,
	836595450,
	836885850,
	837176300,
	837466800,
	837757350,
	838047950,
	838338600,
	838629300,
	838920050,
	839210850,
	839501700,
	839792600,
	840083550,
	840374550,
	840665600,
	840956700,
	841247850,
	841539050,
	841830300,
	842121600,
	842412950,
	842704350,
	842995800,
	843287300,
	843578850,
	843870450,
	844162100,
	844453800,
	844745550,
	845037350,
	845329200,
	845621100,
	845913050,
	846205050,
	846497100,
	846789200,
	847081350,
	847373550,
	847665800,
	847958100,
	848250450,
	848542850,
	848835300,
	849127800,
	849420350,
	849712950,
	850005600,
	850298300,
	850591050,
	850883850,
	851176700,
	851469600,
	851762550,
	852055550,
	852348600,
	852641700,
	852934850,
	853228050,
	853521300,
	853814600,
	854107950,
	854401350,
	854694800,
	854988300,
	855281850,
	855575450,
	855869100,
	856162800,
	856456550,
	856750350,
	857044200,
	857338100,
	857632050,
	857926050,
	858220100,
	858514200,
	858808350,
	859102550,
	859396800,
	859691100,
	859985450,
	860279850,
	860574300,
	860868800,
	861163350,
	861457950,
	861752600,
	862047300,
	862342050,
	862636850,
	862931700,
	863226600,
	863521550,
	863816550,
	864111600,
	864406700,
	864701850,
	864997050,
	865292300,
	865587600,
	865882950,
	866178350,
	866473800,
	866769300,
	867064850,
	867360450,
	867656100,
	867951800,
	868247550,
	868543350,
	868839200,
	869135100,
	869431050,
	869727050,
	870023100,
	870319200,
	870615350,
	870911550,
	871207800,
	871504100,
	871800450,
	872096850,
	872393300,
	872689800,
	872986350,
	873282950,
	873579600,
	873876300,
	874173050,
	874469850,
	874766700,
	875063600,
	875360550,
	875657550,
	875954600,
	876251700,
	876548850,
	876846050,
	877143300,
	877440600,
	877737950,
	878035350,
	878332800,
	878630300,
	878927850,
	879225450,
	879523100,
	879820800,
	880118550,
	880416350,
	880714200,
	881012100,
	881310050,
	881608050,
	881906100,
	882204200,
	882502350,
	882800550,
	883098800,
	883397100,
	883695450,
	883993850,
	884292300,
	884590800,
	884889350,
	885187950,
	885486600,
	885785300,
	886084050,
	886382850,
	886681700,
	886980600,
	887279550,
	887578550,
	887877600,
	888176700,
	888475850,
	888775050,
	889074300,
	889373600,
	889672950,
	889972350,
	890271800,
	890571300,
	890870850,
	891170450,
	891470100,
	891769800,
	892069550,
	892369350,
	892669200,
	892969100,
	893269050,
	893569050,
	893869100,
	894169200,
	894469350,
	894769550,
	895069800,
	895370100,
	895670450,
	895970850,
	896271300,
	896571800,
	896872350,
	897172950,
	897473600,
	897774300,
	898075050,
	898375850,
	898676700,
	898977600,
	899278550,
	899579550,
	899880600,
	900181700,
	900482850,
	900784050,
	901085300,
	901386600,
	901687950,
	901989350,
	902290800,
	902592300,
	902893850,
	903195450,
	903497100,
	903798800,
	904100550,
	904402350,
	904704200,
	905006100,
	905308050,
	905610050,
	905912100,
	906214200,
	906516350,
	906818550,
	907120800,
	907423100,
	907725450,
	908027850,
	908330300,
	908632800,
	908935350,
	909237950,
	909540600,
	909843300,
	910146050,
	910448850,
	910751700,
	911054600,
	911357550,
	911660550,
	911963600,
	912266700,
	912569850,
	912873050,
	913176300,
	913479600,
	913782950,
	914086350,
	914389800,
	914693300,
	914996850,
	915300450,
	915604100,
	915907800,
	916211550,
	916515350,
	916819200,
	917123100,
	917427050,
	917731050,
	918035100,
	918339200,
	918643350,
	918947550,
	919251800,
	919556100,
	919860450,
	920164850,
	920469300,
	920773800,
	921078350,
	921382950,
	921687600,
	921992300,
	922297050,
	922601850,
	922906700,
	923211600,
	923516550,
	923821550,
	924126600,
	924431700,
	924736850,
	925042050,
	925347300,
	925652600,
	925957950,
	926263350,
	926568800,
	926874300,
	927179850,
	927485450,
	927791100,
	928096800,
	928402550,
	928708350,
	929014200,
	929320100,
	929626050,
	929932050,
	930238100,
	930544200,
	930850350,
	931156550,
	931462800,
	931769100,
	932075450,
	932381850,
	932688300,
	932994800,
	933301350,
	933607950,
	933914600,
	934221300,
	934528050,
	934834850,
	935141700,
	935448600,
	935755550,
	936062550,
	936369600,
	936676700,
	936983850,
	937291050,
	937598300,
	937905600,
	938212950,
	938520350,
	938827800,
	939135300,
	939442850,
	939750450,
	940058100,
	940365800,
	940673550,
	940981350,
	941289200,
	941597100,
	941905050,
	942213050,
	942521100,
	942829200,
	943137350,
	943445550,
	943753800,
	944062100,
	944370450,
	944678850,
	944987300,
	945295800,
	945604350,
	945912950,
	946221600,
	946530300,
	946839050,
	947147850,
	947456700,
	947765600,
	948074550,
	948383550,
	948692600,
	949001700,
	949310850,
	949620050,
	949929300,
	950238600,
	950547950,
	950857350,
	951166800,
	951476300,
	951785850,
	952095450,
	952405100,
	952714800,
	953024550,
	953334350,
	953644200,
	953954100,
	954264050,
	954574050,
	954884100,
	955194200,
	955504350,
	955814550,
	956124800,
	956435100,
	956748513,
	957055850,
	957366300,
	957676800,
	957987350,
	958297950,
	958608600,
	958919300,
	959230050,
	959540850,
	959851700,
	960162600,
	960473550,
	960784550,
	961095600,
	961406700,
	961717850,
	962029050,
	962340300,
	962651600,
	962962950,
	963274350,
	963585800,
	963897300,
	964208850,
	964520450,
	964832100,
	965143800,
	965455550,
	965767350,
	966079200,
	966391100,
	966703050,
	967015050,
	967327100,
	967639200,
	967951350,
	968263550,
	968575800,
	968888100,
	969200450,
	969512850,
	969825300,
	970137800,
	970450350,
	970762950,
	971075600,
	971388300,
	971701050,
	972013850,
	972326700,
	972639600,
	972952550,
	973265550,
	973578600,
	973891700,
	974204850,
	974518050,
	974831300,
	975144600,
	975457950,
	975771350,
	976084800,
	976398300,
	976711850,
	977025450,
	977339100,
	977652800,
	977966550,
	978280350,
	978594200,
	978908100,
	979222050,
	979536050,
	979850100,
	980164200,
	980478350,
	980792550,
	981106800,
	981421100,
	981735450,
	982049850,
	982364300,
	982678800,
	982993350,
	983307950,
	983622600,
	983937300,
	984252050,
	984566850,
	984881700,
	985196600,
	985511550,
	985826550,
	986141600,
	986456700,
	986771850,
	987087050,
	987402300,
	987717600,
	988032950,
	988348350,
	988663800,
	988979300,
	989294850,
	989610450,
	989926100,
	990241800,
	990557550,
	990873350,
	991189200,
	991505100,
	991821050,
	992137050,
	992453100,
	992769200,
	993085350,
	993401550,
	993717800,
	994034100,
	994350450,
	994666850,
	994983300,
	995299800,
	995616350,
	995932950,
	996249600,
	996566300,
	996883050,
	997199850,
	997516700,
	997833600,
	998150550,
	998467550,
	998784600,
	999101700,
	999418850,
	999736050,
	1000053300,
	1000370600,
	1000687950,
	1001005350,
	1001322800,
	1001640300,
	1001957850,
	1002275450,
	1002593100,
	1002910800,
	1003228550,
	1003546350,
	1003864200,
	1004182100,
	1004500050,
	1004818050,
	1005136100,
	1005454200,
	1005772350,
	1006090550,
	1006408800,
	1006727100,
	1007048513,
	1007363850,
	1007682300,
	1008000800,
	1008319350,
	1008637950,
	1008956600,
	1009275300,
	1009594050,
	1009912850,
	1010231700,
	1010550600,
	1010869550,
	1011188550,
	1011507600,
	1011826700,
	1012145850,
	1012465050,
	1012784300,
	1013103600,
	1013422950,
	1013742350,
	1014061800,
	1014381300,
	1014700850,
	1015020450,
	1015340100,
	1015659800,
	1015979550,
	1016299350,
	1016619200,
	1016939100,
	1017259050,
	1017579050,
	1017899100,
	1018219200,
	1018539350,
	1018859550,
	1019179800,
	1019500100,
	1019820450,
	1020140850,
	1020461300,
	1020781800,
	1021102350,
	1021422950,
	1021743600,
	1022064300,
	1022385050,
	1022705850,
	1023026700,
	1023347600,
	1023668550,
	1023989550,
	1024310600,
	1024631700,
	1024952850,
	1025274050,
	1025595300,
	1025916600,
	1026237950,
	1026559350,
	1026880800,
	1027202300,
	1027523850,
	1027848513,
	1028167100,
	1028488800,
	1028810550,
	1029132350,
	1029454200,
	1029776100,
	1030098050,
	1030420050,
	1030742100,
	1031064200,
	1031386350,
	1031708550,
	1032030800,
	1032353100,
	1032675450,
	1032997850,
	1033320300,
	1033642800,
	1033965350,
	1034287950,
	1034610600,
	1034933300,
	1035256050,
	1035578850,
	1035901700,
	1036224600,
	1036547550,
	1036870550,
	1037193600,
	1037516700,
	1037839850,
	1038163050,
	1038486300,
	1038809600,
	1039132950,
	1039456350,
	1039779800,
	1040103300,
	1040426850,
	1040750450,
	1041074100,
	1041397800,
	1041721550,
	1042045350,
	1042369200,
	1042693100,
	1043017050,
	1043341050,
	1043665100,
	1043989200,
	1044313350,
	1044637550,
	1044961800,
	1045286100,
	1045610450,
	1045934850,
	1046259300,
	1046583800,
	1046908350,
	1047232950,
	1047557600,
	1047882300,
	1048207050,
	1048531850,
	1048856700,
	1049181600,
	1049506550,
	1049831550,
	1050156600,
	1050481700,
	1050806850,
	1051132050,
	1051457300,
	1051782600,
	1052107950,
	1052433350,
	1052758800,
	1053084300,
	1053409850,
	1053735450,
	1054061100,
	1054386800,
	1054712550,
	1055038350,
	1055364200,
	1055690100,
	1056016050,
	1056342050,
	1056668100,
	1056994200,
	1057320350,
	1057646550,
	1057972800,
	1058299100,
	1058625450,
	1058951850,
	1059278300,
	1059604800,
	1059931350,
	1060257950,
	1060584600,
	1060911300,
	1061238050,
	1061564850,
	1061891700,
	1062218600,
	1062545550,
	1062872550,
	1063199600,
	1063526700,
	1063853850,
	1064181050,
	1064508300,
	1064835600,
	1065162950,
	1065490350,
	1065817800,
	1066145300,
	1066472850,
	1066800450,
	1067128100,
	1067455800,
	1067783550,
	1068111350,
	1068439200,
	1068767100,
	1069095050,
	1069423050,
	1069751100,
	1070079200,
	1070407350,
	1070735550,
	1071063800,
	1071392100,
	1071720450,
	1072048850,
	1072377300,
	1072705800,
	1073034350,
	1073362950,
	1073691600,
	1074020300,
	1074349050,
	1074677850,
	1075006700,
	1075335600,
	1075664550,
	1075993550,
	1076322600,
	1076651700,
	1076980850,
	1077310050,
	1077639300,
	1077968600,
	1078297950,
	1078627350,
	1078956800,
	1079286300,
	1079615850,
	1079948513,
	1080275100,
	1080604800,
	1080934550,
	1081264350,
	1081594200,
	1081924100,
	1082254050,
	1082584050,
	1082914100,
	1083244200,
	1083574350,
	1083904550,
	1084234800,
	1084565100,
	1084895450,
	1085225850,
	1085556300,
	1085886800,
	1086217350,
	1086547950,
	1086878600,
	1087209300,
	1087540050,
	1087870850,
	1088201700,
	1088532600,
	1088863550,
	1089194550,
	1089525600,
	1089856700,
	1090187850,
	1090519050,
	1090850300,
	1091181600,
	1091512950,
	1091844350,
	1092175800,
	1092507300,
	1092838850,
	1093170450,
	1093502100,
	1093833800,
	1094165550,
	1094497350,
	1094829200,
	1095161100,
	1095493050,
	1095825050,
	1096157100,
	1096489200,
	1096821350,
	1097153550,
	1097485800,
	1097818100,
	1098150450,
	1098482850,
	1098815300,
	1099147800,
	1099480350,
	1099812950,
	1100145600,
	1100478300,
	1100811050,
	1101143850,
	1101476700,
	1101809600,
	1102142550,
	1102475550,
	1102808600,
	1103141700,
	1103474850,
	1103808050,
	1104141300,
	1104474600,
	1104807950,
	1105141350,
	1105474800,
	1105808300,
	1106141850,
	1106475450,
	1106809100,
	1107142800,
	1107476550,
	1107810350,
	1108144200,
	1108478100,
	1108812050,
	1109146050,
	1109480100,
	1109814200,
	1110148350,
	1110482550,
	1110816800,
	1111151100,
	1111485450,
	1111819850,
	1112154300,
	1112488800,
	1112823350,
	1113157950,
	1113492600,
	1113827300,
	1114162050,
	1114496850,
	1114831700,
	1115166600,
	1115501550,
	1115836550,
	1116171600,
	1116506700,
	1116841850,
	1117177050,
	1117512300,
	1117847600,
	1118182950,
	1118518350,
	1118853800,
	1119189300,
	1119524850,
	1119860450,
	1120196100,
	1120531800,
	1120867550,
	1121203350,
	1121539200,
	1121875100,
	1122211050,
	1122547050,
	1122883100,
	1123219200,
	1123555350,
	1123891550,
	1124227800,
	1124564100,
	1124900450,
	1125236850,
	1125573300,
	1125909800,
	1126246350,
	1126582950,
	1126919600,
	1127256300,
	1127593050,
	1127929850,
	1128266700,
	1128603600,
	1128940550,
	1129277550,
	1129614600,
	1129951700,
	1130288850,
	1130626050,
	1130963300,
	1131300600,
	1131637950,
	1131975350,
	1132312800,
	1132650300,
	1132987850,
	1133325450,
	1133663100,
	1134000800,
	1134338550,
	1134676350,
	1135014200,
	1135352100,
	1135690050,
	1136028050,
	1136366100,
	1136704200,
	1137042350,
	1137380550,
	1137718800,
	1138057100,
	1138395450,
	1138733850,
	1139072300,
	1139410800,
	1139749350,
	1140087950,
	1140426600,
	1140765300,
	1141104050,
	1141442850,
	1141781700,
	1142120600,
	1142459550,
	1142798550,
	1143137600,
	1143476700,
	1143815850,
	1144155050,
	1144494300,
	1144833600,
	1145172950,
	1145512350,
	1145851800,
	1146191300,
	1146530850,
	1146870450,
	1147210100,
	1147549800,
	1147889550,
	1148229350,
	1148569200,
	1148909100,
	1149249050,
	1149589050,
	1149929100,
	1150269200,
	1150609350,
	1150949550,
	1151289800,
	1151630100,
	1151970450,
	1152310850,
	1152651300,
	1152991800,
	1153332350,
	1153672950,
	1154013600,
	1154354300,
	1154695050,
	1155035850,
	1155376700,
	1155717600,
	1156058550,
	1156399550,
	1156740600,
	1157081700,
	1157422850,
	1157764050,
	1158105300,
	1158446600,
	1158787950,
	1159129350,
	1159470800,
	1159812300,
	1160153850,
	1160495450,
	1160837100,
	1161178800,
	1161520550,
	1161862350,
	1162204200,
	1162546100,
	1162888050,
	1163230050,
	1163572100,
	1163914200,
	1164256350,
	1164598550,
	1164940800,
	1165283100,
	1165625450,
	1165967850,
	1166310300,
	1166652800,
	1166995350,
	1167337950,
	1167680600,
	1168023300,
	1168366050,
	1168708850,
	1169051700,
	1169394600,
	1169737550,
	1170080550,
	1170423600,
	1170766700,
	1171109850,
	1171453050,
	1171796300,
	1172139600,
	1172482950,
	1172826350,
	1173169800,
	1173513300,
	1173856850,
	1174200450,
	1174544100,
	1174887800,
	1175231550,
	1175575350,
	1175919200,
	1176263100,
	1176607050,
	1176951050,
	1177295100,
	1177639200,
	1177983350,
	1178327550,
	1178671800,
	1179016100,
	1179360450,
	1179704850,
	1180049300,
	1180393800,
	1180738350,
	1181082950,
	1181427600,
	1181772300,
	1182117050,
	1182461850,
	1182806700,
	1183151600,
	1183496550,
	1183841550,
	1184186600,
	1184531700,
	1184876850,
	1185222050,
	1185567300,
	1185912600,
	1186257950,
	1186603350,
	1186948800,
	1187294300,
	1187639850,
	1187985450,
	1188331100,
	1188676800,
	1189022550,
	1189368350,
	1189714200,
	1190060100,
	1190406050,
	1190752050,
	1191098100,
	1191444200,
	1191790350,
	1192136550,
	1192482800,
	1192829100,
	1193175450,
	1193521850,
	1193868300,
	1194214800,
	1194561350,
	1194907950,
	1195254600,
	1195601300,
	1195948050,
	1196294850,
	1196641700,
	1196988600,
	1197335550,
	1197682550,
	1198029600,
	1198376700,
	1198723850,
	1199071050,
	1199418300,
	1199765600,
	1200112950,
	1200460350,
	1200807800,
	1201155300,
	1201502850,
	1201850450,
	1202198100,
	1202545800,
	1202893550,
	1203241350,
	1203589200,
	1203937100,
	1204285050,
	1204633050,
	1204981100,
	1205329200,
	1205677350,
	1206025550,
	1206373800,
	1206722100,
	1207070450,
	1207418850,
	1207767300,
	1208115800,
	1208464350,
	1208812950,
	1209161600,
	1209510300,
	1209859050,
	1210207850,
	1210556700,
	1210905600,
	1211254550,
	1211603550,
	1211952600,
	1212301700,
	1212650850,
	1213000050,
	1213349300,
	1213698600,
	1214047950,
	1214397350,
	1214746800,
	1215096300,
	1215445850,
	1215795450,
	1216145100,
	1216494800,
	1216844550,
	1217194350,
	1217544200,
	1217894100,
	1218244050,
	1218594050,
	1218944100,
	1219294200,
	1219644350,
	1219994550,
	1220344800,
	1220695100,
	1221048513,
	1221395850,
	1221746300,
	1222096800,
	1222447350,
	1222797950,
	1223148600,
	1223499300,
	1223850050,
	1224200850,
	1224551700,
	1224902600,
	1225253550,
	1225604550,
	1225955600,
	1226306700,
	1226657850,
	1227009050,
	1227360300,
	1227711600,
	1228062950,
	1228414350,
	1228765800,
	1229117300,
	1229468850,
	1229820450,
	1230172100,
	1230523800,
	1230875550,
	1231227350,
	1231579200,
	1231931100,
	1232283050,
	1232635050,
	1232987100,
	1233339200,
	1233691350,
	1234043550,
	1234395800,
	1234748100,
	1235100450,
	1235452850,
	1235805300,
	1236157800,
	1236510350,
	1236862950,
	1237215600,
	1237568300,
	1237921050,
	1238273850,
	1238626700,
	1238979600,
	1239332550,
	1239685550,
	1240038600,
	1240391700,
	1240744850,
	1241098050,
	1241451300,
	1241804600,
	1242157950,
	1242511350,
	1242864800,
	1243218300,
	1243571850,
	1243925450,
	1244279100,
	1244632800,
	1244986550,
	1245340350,
	1245694200,
	1246048100,
	1246402050,
	1246756050,
	1247110100,
	1247464200,
	1247818350,
	1248172550,
	1248526800,
	1248881100,
	1249235450,
	1249589850,
	1249944300,
	1250298800,
	1250653350,
	1251007950,
	1251362600,
	1251717300,
	1252072050,
	1252426850,
	1252781700,
	1253136600,
	1253491550,
	1253846550,
	1254201600,
	1254556700,
	1254911850,
	1255267050,
	1255622300,
	1255977600,
	1256332950,
	1256688350,
	1257043800,
	1257399300,
	1257754850,
	1258110450,
	1258466100,
	1258821800,
	1259177550,
	1259533350,
	1259889200,
	1260245100,
	1260601050,
	1260957050,
	1261313100,
	1261669200,
	1262025350,
	1262381550,
	1262737800,
	1263094100,
	1263450450,
	1263806850,
	1264163300,
	1264519800,
	1264876350,
	1265232950,
	1265589600,
	1265946300,
	1266303050,
	1266659850,
	1267016700,
	1267373600,
	1267730550,
	1268087550,
	1268444600,
	1268801700,
	1269158850,
	1269516050,
	1269873300,
	1270230600,
	1270587950,
	1270945350,
	1271302800,
	1271660300,
	1272017850,
	1272375450,
	1272733100,
	1273090800,
	1273448550,
	1273806350,
	1274164200,
	1274522100,
	1274880050,
	1275238050,
	1275596100,
	1275954200,
	1276312350,
	1276670550,
	1277028800,
	1277387100,
	1277748513,
	1278103850,
	1278462300,
	1278820800,
	1279179350,
	1279537950,
	1279896600,
	1280255300,
	1280614050,
	1280972850,
	1281331700,
	1281690600,
	1282049550,
	1282408550,
	1282767600,
	1283126700,
	1283485850,
	1283845050,
	1284204300,
	1284563600,
	1284922950,
	1285282350,
	1285641800,
	1286001300,
	1286360850,
	1286720450,
	1287080100,
	1287439800,
	1287799550,
	1288159350,
	1288519200,
	1288879100,
	1289239050,
	1289599050,
	1289959100,
	1290319200,
	1290679350,
	1291039550,
	1291399800,
	1291760100,
	1292120450,
	1292480850,
	1292841300,
	1293201800,
	1293562350,
	1293922950,
	1294283600,
	1294644300,
	1295005050,
	1295365850,
	1295726700,
	1296087600,
	1296448550,
	1296809550,
	1297170600,
	1297531700,
	1297892850,
	1298254050,
	1298615300,
	1298976600,
	1299337950,
	1299699350,
	1300060800,
	1300422300,
	1300783850,
	1301148513,
	1301507100,
	1301868800,
	1302230550,
	1302592350,
	1302954200,
	1303316100,
	1303678050,
	1304040050,
	1304402100,
	1304764200,
	1305126350,
	1305488550,
	1305850800,
	1306213100,
	1306575450,
	1306937850,
	1307300300,
	1307662800,
	1308025350,
	1308387950,
	1308750600,
	1309113300,
	1309476050,
	1309838850,
	1310201700,
	1310564600,
	1310927550,
	1311290550,
	1311653600,
	1312016700,
	1312379850,
	1312743050,
	1313106300,
	1313469600,
	1313832950,
	1314196350,
	1314559800,
	1314923300,
	1315286850,
	1315650450,
	1316014100,
	1316377800,
	1316741550,
	1317105350,
	1317469200,
	1317833100,
	1318197050,
	1318561050,
	1318925100,
	1319289200,
	1319653350,
	1320017550,
	1320381800,
	1320746100,
	1321110450,
	1321474850,
	1321839300,
	1322203800,
	1322568350,
	1322932950,
	1323297600,
	1323662300,
	1324027050,
	1324391850,
	1324756700,
	1325121600,
	1325486550,
	1325851550,
	1326216600,
	1326581700,
	1326946850,
	1327312050,
	1327677300,
	1328042600,
	1328407950,
	1328773350,
	1329138800,
	1329504300,
	1329869850,
	1330235450,
	1330601100,
	1330966800,
	1331332550,
	1331698350,
	1332064200,
	1332430100,
	1332796050,
	1333162050,
	1333528100,
	1333894200,
	1334260350,
	1334626550,
	1334992800,
	1335359100,
	1335725450,
	1336091850,
	1336458300,
	1336824800,
	1337191350,
	1337557950,
	1337924600,
	1338291300,
	1338658050,
	1339024850,
	1339391700,
	1339758600,
	1340125550,
	1340492550,
	1340859600,
	1341226700,
	1341593850,
	1341961050,
	1342328300,
	1342695600,
	1343062950,
	1343430350,
	1343797800,
	1344165300,
	1344532850,
	1344900450,
	1345268100,
	1345635800,
	1346003550,
	1346371350,
	1346739200,
	1347107100,
	1347475050,
	1347843050,
	1348211100,
	1348579200,
	1348947350,
	1349315550,
	1349683800,
	1350052100,
	1350420450,
	1350788850,
	1351157300,
	1351525800,
	1351894350,
	1352262950,
	1352631600,
	1353000300,
	1353369050,
	1353737850,
	1354106700,
	1354475600,
	1354844550,
	1355213550,
	1355582600,
	1355951700,
	1356320850,
	1356690050,
	1357059300,
	1357428600,
	1357797950,
	1358167350,
	1358536800,
	1358906300,
	1359275850,
	1359648513,
	1360015100,
	1360384800,
	1360754550,
	1361124350,
	1361494200,
	1361864100,
	1362234050,
	1362604050,
	1362974100,
	1363344200,
	1363714350,
	1364084550,
	1364454800,
	1364825100,
	1365195450,
	1365565850,
	1365936300,
	1366306800,
	1366677350,
	1367047950,
	1367418600,
	1367789300,
	1368160050,
	1368530850,
	1368901700,
	1369272600,
	1369643550,
	1370014550,
	1370385600,
	1370756700,
	1371127850,
	1371499050,
	1371870300,
	1372241600,
	1372612950,
	1372984350,
	1373355800,
	1373727300,
	1374098850,
	1374470450,
	1374842100,
	1375213800,
	1375585550,
	1375957350,
	1376329200,
	1376701100,
	1377073050,
	1377445050,
	1377817100,
	1378189200,
	1378561350,
	1378933550,
	1379305800,
	1379678100,
	1380050450,
	1380422850,
	1380795300,
	1381167800,
	1381540350,
	1381912950,
	1382285600,
	1382658300,
	1383031050,
	1383403850,
	1383776700,
	1384149600,
	1384522550,
	1384895550,
	1385268600,
	1385641700,
	1386014850,
	1386388050,
	1386761300,
	1387134600,
	1387507950,
	1387881350,
	1388254800,
	1388628300,
	1389001850,
	1389375450,
	1389749100,
	1390122800,
	1390496550,
	1390870350,
	1391244200,
	1391618100,
	1391992050,
	1392366050,
	1392740100,
	1393114200,
	1393488350,
	1393862550,
	1394236800,
	1394611100,
	1394985450,
	1395359850,
	1395734300,
	1396108800,
	1396483350,
	1396857950,
	1397232600,
	1397607300,
	1397982050,
	1398356850,
	1398731700,
	1399106600,
	1399481550,
	1399856550,
	1400231600,
	1400606700,
	1400981850,
	1401357050,
	1401732300,
	1402107600,
	1402482950,
	1402858350,
	1403233800,
	1403609300,
	1403984850,
	1404360450,
	1404736100,
	1405111800,
	1405487550,
	1405863350,
	1406239200,
	1406615100,
	1406991050,
	1407367050,
	1407743100,
	1408119200,
	1408495350,
	1408871550,
	1409247800,
	1409624100,
	1410000450,
	1410376850,
	1410753300,
	1411129800,
	1411506350,
	1411882950,
	1412259600,
	1412636300,
	1413013050,
	1413389850,
	1413766700,
	1414143600,
	1414520550,
	1414897550,
	1415274600,
	1415651700,
	1416028850,
	1416406050,
	1416783300,
	1417160600,
	1417537950,
	1417915350,
	1418292800,
	1418670300,
	1419047850,
	1419425450,
	1419803100,
	1420180800,
	1420558550,
	1420936350,
	1421314200,
	1421692100,
	1422070050,
	1422448050,
	1422826100,
	1423204200,
	1423582350,
	1423960550,
	1424338800,
	1424717100,
	1425095450,
	1425473850,
	1425852300,
	1426230800,
	1426609350,
	1426987950,
	1427366600,
	1427745300,
	1428124050,
	1428502850,
	1428881700,
	1429260600,
	1429639550,
	1430018550,
	1430397600,
	1430776700,
	1431155850,
	1431535050,
	1431914300,
	1432293600,
	1432672950,
	1433052350,
	1433431800,
	1433811300,
	1434190850,
	1434570450,
	1434950100,
	1435329800,
	1435709550,
	1436089350,
	1436469200,
	1436849100,
	1437229050,
	1437609050,
	1437989100,
	1438369200,
	1438749350,
	1439129550,
	1439509800,
	1439890100,
	1440270450,
	1440650850,
	1441031300,
	1441411800,
	1441792350,
	1442172950,
	1442553600,
	1442934300,
	1443315050,
	1443695850,
	1444076700,
	1444457600,
	1444838550,
	1445219550,
	1445600600,
	1445981700,
	1446362850,
	1446744050,
	1447125300,
	1447506600,
	1447887950,
	1448269350,
	1448650800,
	1449032300,
	1449413850,
	1449795450,
	1450177100,
	1450558800,
	1450940550,
	1451322350,
	1451704200,
	1452086100,
	1452468050,
	1452850050,
	1453232100,
	1453614200,
	1453996350,
	1454378550,
	1454760800,
	1455143100,
	1455525450,
	1455907850,
	1456290300,
	1456672800,
	1457055350,
	1457437950,
	1457820600,
	1458203300,
	1458586050,
	1458968850,
	1459351700,
	1459734600,
	1460117550,
	1460500550,
	1460883600,
	1461266700,
	1461649850,
	1462033050,
	1462416300,
	1462799600,
	1463182950,
	1463566350,
	1463949800,
	1464333300,
	1464716850,
	1465100450,
	1465484100,
	1465867800,
	1466251550,
	1466635350,
	1467019200,
	1467403100,
	1467787050,
	1468171050,
	1468555100,
	1468939200,
	1469323350,
	1469707550,
	1470091800,
	1470476100,
	1470860450,
	1471244850,
	1471629300,
	1472013800,
	1472398350,
	1472782950,
	1473167600,
	1473552300,
	1473937050,
	1474321850,
	1474706700,
	1475091600,
	1475476550,
	1475861550,
	1476246600,
	1476631700,
	1477016850,
	1477402050,
	1477787300,
	1478172600,
	1478557950,
	1478943350,
	1479328800,
	1479714300,
	1480099850,
	1480485450,
	1480871100,
	1481256800,
	1481642550,
	1482028350,
	1482414200,
	1482800100,
	1483186050,
	1483572050,
	1483958100,
	1484344200,
	1484730350,
	1485116550,
	1485502800,
	1485889100,
	1486275450,
	1486661850,
	1487048300,
	1487434800,
	1487821350,
	1488207950,
	1488594600,
	1488981300,
	1489368050,
	1489754850,
	1490141700,
	1490528600,
	1490915550,
	1491302550,
	1491689600,
	1492076700,
	1492463850,
	1492851050,
	1493238300,
	1493625600,
	1494012950,
	1494400350,
	1494787800,
	1495175300,
	1495562850,
	1495950450,
	1496338100,
	1496725800,
	1497113550,
	1497501350,
	1497889200,
	1498277100,
	1498665050,
	1499053050,
	1499441100,
	1499829200,
	1500217350,
	1500605550,
	1500993800,
	1501382100,
	1501770450,
	1502158850,
	1502547300,
	1502935800,
	1503324350,
	1503712950,
	1504101600,
	1504490300,
	1504879050,
	1505267850,
	1505656700,
	1506045600,
	1506434550,
	1506823550,
	1507212600,
	1507601700,
	1507990850,
	1508380050,
	1508769300,
	1509158600,
	1509547950,
	1509937350,
	1510326800,
	1510716300,
	1511105850,
	1511495450,
	1511885100,
	1512274800,
	1512664550,
	1513054350,
	1513444200,
	1513834100,
	1514224050,
	1514614050,
	1515004100,
	1515394200,
	1515784350,
	1516174550,
	1516564800,
	1516955100,
	1517348513,
	1517735850,
	1518126300,
	1518516800,
	1518907350,
	1519297950,
	1519688600,
	1520079300,
	1520470050,
	1520860850,
	1521251700,
	1521642600,
	1522033550,
	1522424550,
	1522815600,
	1523206700,
	1523597850,
	1523989050,
	1524380300,
	1524771600,
	1525162950,
	1525554350,
	1525945800,
	1526337300,
	1526728850,
	1527120450,
	1527512100,
	1527903800,
	1528295550,
	1528687350,
	1529079200,
	1529471100,
	1529863050,
	1530255050,
	1530647100,
	1531039200,
	1531431350,
	1531823550,
	1532215800,
	1532608100,
	1533000450,
	1533392850,
	1533785300,
	1534177800,
	1534570350,
	1534962950,
	1535355600,
	1535748300,
	1536141050,
	1536533850,
	1536926700,
	1537319600,
	1537712550,
	1538105550,
	1538498600,
	1538891700,
	1539284850,
	1539678050,
	1540071300,
	1540464600,
	1540857950,
	1541251350,
	1541644800,
	1542038300,
	1542431850,
	1542825450,
	1543219100,
	1543612800,
	1544006550,
	1544400350,
	1544794200,
	1545188100,
	1545582050,
	1545976050,
	1546370100,
	1546764200,
	1547158350,
	1547552550,
	1547946800,
	1548341100,
	1548735450,
	1549129850,
	1549524300,
	1549918800,
	1550313350,
	1550707950,
	1551102600,
	1551497300,
	1551892050,
	1552286850,
	1552681700,
	1553076600,
	1553471550,
	1553866550,
	1554261600,
	1554656700,
	1555051850,
	1555447050,
	1555842300,
	1556237600,
	1556632950,
	1557028350,
	1557423800,
	1557819300,
	1558214850,
	1558610450,
	1559006100,
	1559401800,
	1559797550,
	1560193350,
	1560589200,
	1560985100,
	1561381050,
	1561777050,
	1562173100,
	1562569200,
	1562965350,
	1563361550,
	1563757800,
	1564154100,
	1564550450,
	1564946850,
	1565343300,
	1565739800,
	1566136350,
	1566532950,
	1566929600,
	1567326300,
	1567723050,
	1568119850,
	1568516700,
	1568913600,
	1569310550,
	1569707550,
	1570104600,
	1570501700,
	1570898850,
	1571296050,
	1571693300,
	1572090600,
	1572487950,
	1572885350,
	1573282800,
	1573680300,
	1574077850,
	1574475450,
	1574873100,
	1575270800,
	1575668550,
	1576066350,
	1576464200,
	1576862100,
	1577260050,
	1577658050,
	1578056100,
	1578454200,
	1578852350,
	1579250550,
	1579648800,
	1580047100,
	1580448513,
	1580843850,
	1581242300,
	1581640800,
	1582039350,
	1582437950,
	1582836600,
	1583235300,
	1583634050,
	1584032850,
	1584431700,
	1584830600,
	1585229550,
	1585628550,
	1586027600,
	1586426700,
	1586825850,
	1587225050,
	1587624300,
	1588023600,
	1588422950,
	1588822350,
	1589221800,
	1589621300,
	1590020850,
	1590420450,
	1590820100,
	1591219800,
	1591619550,
	1592019350,
	1592419200,
	1592819100,
	1593219050,
	1593619050,
	1594019100,
	1594419200,
	1594819350,
	1595219550,
	1595619800,
	1596020100,
	1596420450,
	1596820850,
	1597221300,
	1597621800,
	1598022350,
	1598422950,
	1598823600,
	1599224300,
	1599625050,
	1600025850,
	1600426700,
	1600827600,
	1601228550,
	1601629550,
	1602030600,
	1602431700,
	1602832850,
	1603234050,
	1603635300,
	1604036600,
	1604437950,
	1604839350,
	1605240800,
	1605642300,
	1606043850,
	1606448513,
	1606847100,
	1607248800,
	1607650550,
	1608052350,
	1608454200,
	1608856100,
	1609258050,
	1609660050,
	1610062100,
	1610464200,
	1610866350,
	1611268550,
	1611670800,
	1612073100,
	1612475450,
	1612877850,
	1613280300,
	1613682800,
	1614085350,
	1614487950,
	1614890600,
	1615293300,
	1615696050,
	1616098850,
	1616501700,
	1616904600,
	1617307550,
	1617710550,
	1618113600,
	1618516700,
	1618919850,
	1619323050,
	1619726300,
	1620129600,
	1620532950,
	1620936350,
	1621339800,
	1621743300,
	1622146850,
	1622550450,
	1622954100,
	1623357800,
	1623761550,
	1624165350,
	1624569200,
	1624973100,
	1625377050,
	1625781050,
	1626185100,
	1626589200,
	1626993350,
	1627397550,
	1627801800,
	1628206100,
	1628610450,
	1629014850,
	1629419300,
	1629823800,
	1630228350,
	1630632950,
	1631037600,
	1631442300,
	1631847050,
	1632251850,
	1632656700,
	1633061600,
	1633466550,
	1633871550,
	1634276600,
	1634681700,
	1635086850,
	1635492050,
	1635897300,
	1636302600,
	1636707950,
	1637113350,
	1637518800,
	1637924300,
	1638329850,
	1638735450,
	1639141100,
	1639546800,
	1639952550,
	1640358350,
	1640764200,
	1641170100,
	1641576050,
	1641982050,
	1642388100,
	1642794200,
	1643200350,
	1643606550,
	1644012800,
	1644419100,
	1644825450,
	1645231850,
	1645638300,
	1646044800,
	1646451350,
	1646857950,
	1647264600,
	1647671300,
	1648078050,
	1648484850,
	1648891700,
	1649298600,
	1649705550,
	1650112550,
	1650519600,
	1650926700,
	1651333850,
	1651741050,
	1652148300,
	1652555600,
	1652962950,
	1653370350,
	1653777800,
	1654185300,
	1654592850,
	1655000450,
	1655408100,
	1655815800,
	1656223550,
	1656631350,
	1657039200,
	1657447100,
	1657855050,
	1658263050,
	1658671100,
	1659079200,
	1659487350,
	1659895550,
	1660303800,
	1660712100,
	1661120450,
	1661528850,
	1661937300,
	1662345800,
	1662754350,
	1663162950,
	1663571600,
	1663980300,
	1664389050,
	1664797850,
	1665206700,
	1665615600,
	1666024550,
	1666433550,
	1666842600,
	1667251700,
	1667660850,
	1668070050,
	1668479300,
	1668888600,
	1669297950,
	1669707350,
	1670116800,
	1670526300,
	1670935850,
	1671348513,
	1671755100,
	1672164800,
	1672574550,
	1672984350,
	1673394200,
	1673804100,
	1674214050,
	1674624050,
	1675034100,
	1675444200,
	1675854350,
	1676264550,
	1676674800,
	1677085100,
	1677495450,
	1677905850,
	1678316300,
	1678726800,
	1679137350,
	1679547950,
	1679958600,
	1680369300,
	1680780050,
	1681190850,
	1681601700,
	1682012600,
	1682423550,
	1682834550,
	1683245600,
	1683656700,
	1684067850,
	1684479050,
	1684890300,
	1685301600,
	1685712950,
	1686124350,
	1686535800,
	1686947300,
	1687358850,
	1687770450,
	1688182100,
	1688593800,
	1689005550,
	1689417350,
	1689829200,
	1690241100,
	1690653050,
	1691065050,
	1691477100,
	1691889200,
	1692301350,
	1692713550,
	1693125800,
	1693538100,
	1693950450,
	1694362850,
	1694775300,
	1695187800,
	1695600350,
	1696012950,
	1696425600,
	1696838300,
	1697251050,
	1697663850,
	1698076700,
	1698489600,
	1698902550,
	1699315550,
	1699728600,
	1700141700,
	1700554850,
	1700968050,
	1701381300,
	1701794600,
	1702207950,
	1702621350,
	1703034800,
	1703448300,
	1703861850,
	1704275450,
	1704689100,
	1705102800,
	1705516550,
	1705930350,
	1706344200,
	1706758100,
	1707172050,
	1707586050,
	1708000100,
	1708414200,
	1708828350,
	1709242550,
	1709656800,
	1710071100,
	1710485450,
	1710899850,
	1711314300,
	1711728800,
	1712143350,
	1712557950,
	1712972600,
	1713387300,
	1713802050,
	1714216850,
	1714631700,
	1715046600,
	1715461550,
	1715876550,
	1716291600,
	1716706700,
	1717121850,
	1717537050,
	1717952300,
	1718367600,
	1718782950,
	1719198350,
	1719613800,
	1720029300,
	1720444850,
	1720860450,
	1721276100,
	1721691800,
	1722107550,
	1722523350,
	1722939200,
	1723355100,
	1723771050,
	1724187050,
	1724603100,
	1725019200,
	1725435350,
	1725851550,
	1726267800,
	1726684100,
	1727100450,
	1727516850,
	1727933300,
	1728349800,
	1728766350,
	1729182950,
	1729599600,
	1730016300,
	1730433050,
	1730849850,
	1731266700,
	1731683600,
	1732100550,
	1732517550,
	1732934600,
	1733351700,
	1733768850,
	1734186050,
	1734603300,
	1735020600,
	1735437950,
	1735855350,
	1736272800,
	1736690300,
	1737107850,
	1737525450,
	1737943100,
	1738360800,
	1738778550,
	1739196350,
	1739614200,
	1740032100,
	1740450050,
	1740868050,
	1741286100,
	1741704200,
	1742122350,
	1742540550,
	1742958800,
	1743377100,
	1743795450,
	1744213850,
	1744632300,
	1745050800,
	1745469350,
	1745887950,
	1746306600,
	1746725300,
	1747144050,
	1747562850,
	1747981700,
	1748400600,
	1748819550,
	1749238550,
	1749657600,
	1750076700,
	1750495850,
	1750915050,
	1751334300,
	1751753600,
	1752172950,
	1752592350,
	1753011800,
	1753431300,
	1753850850,
	1754270450,
	1754690100,
	1755109800,
	1755529550,
	1755949350,
	1756369200,
	1756789100,
	1757209050,
	1757629050,
	1758049100,
	1758469200,
	1758889350,
	1759309550,
	1759729800,
	1760150100,
	1760570450,
	1760990850,
	1761411300,
	1761831800,
	1762252350,
	1762672950,
	1763093600,
	1763514300,
	1763935050,
	1764355850,
	1764776700,
	1765197600,
	1765618550,
	1766039550,
	1766460600,
	1766881700,
	1767302850,
	1767724050,
	1768145300,
	1768566600,
	1768987950,
	1769409350,
	1769830800,
	1770252300,
	1770673850,
	1771095450,
	1771517100,
	1771938800,
	1772360550,
	1772782350,
	1773204200,
	1773626100,
	1774048050,
	1774470050,
	1774892100,
	1775314200,
	1775736350,
	1776158550,
	1776580800,
	1777003100,
	1777425450,
	1777847850,
	1778270300,
	1778692800,
	1779115350,
	1779537950,
	1779960600,
	1780383300,
	1780806050,
	1781228850,
	1781651700,
	1782074600,
	1782497550,
	1782920550,
	1783343600,
	1783766700,
	1784189850,
	1784613050,
	1785036300,
	1785459600,
	1785882950,
	1786306350,
	1786729800,
	1787153300,
	1787576850,
}
--I just couldn't find the right global, so that's why you see "RPtoRank" list here

Rank:add_bare_item("", function()
	CurrentRP = stats.get_int(MPX .. "CHAR_XP_FM")
	CurrentRank = 0
	for i = 1, 8000 do
		if CurrentRP < RPtoRank[i] then
			break
		else
			CurrentRank = i
		end
	end
	if CurrentRank == 1 then
		CurrentRank = " "
	end
	return "Current Rank: " .. CurrentRank
end, function() end, function() end, function() end)

NumberList1 = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }
NumberList2 = { 0, 1, 2, 3, 4, 5, 6, 7, 8 }

DefNum29 = NumberList2[1]
DefNum29Cur = 1
Rank:add_array_item("Char #1", NumberList2, function()
	return DefNum29Cur
end, function(NewNum29)
	DefNum29 = NumberList2[NewNum29]
	DefNum29Cur = NewNum29
end)

DefNum30 = NumberList1[1]
DefNum30Cur = 1
Rank:add_array_item("Char #2", NumberList1, function()
	return DefNum30Cur
end, function(NewNum30)
	DefNum30 = NumberList1[NewNum30]
	DefNum30Cur = NewNum30
end)

DefNum31 = NumberList1[1]
DefNum31Cur = 1
Rank:add_array_item("Char #3", NumberList1, function()
	return DefNum31Cur
end, function(NewNum31)
	DefNum31 = NumberList1[NewNum31]
	DefNum31Cur = NewNum31
end)

DefNum32 = NumberList1[1]
DefNum32Cur = 1
Rank:add_array_item("Char #4", NumberList1, function()
	return DefNum32Cur
end, function(NewNum32)
	DefNum32 = NumberList1[NewNum32]
	DefNum32Cur = NewNum32
end)

Rank:add_bare_item("", function()
	if DefNum29 == 0 then
		NewRank = tonumber(DefNum30 .. DefNum31 .. DefNum32)
	else
		NewRank = tonumber(DefNum29 .. DefNum30 .. DefNum31 .. DefNum32)
	end
	if NewRank == 0 then
		NewRank = " "
	end
	return "Set Rank: " .. NewRank
end, function()
	stats.set_int(MPX .. "CHAR_SET_RP_GIFT_ADMIN", RPtoRank[NewRank] + 100)
	sleep(2)
	globals.set_int(1575032, 8)
	globals.set_int(1574589, 1)
	sleep(1)
	globals.set_int(1574589, 0)
	sleep(1)
	DefNum29Cur = 1
	DefNum30Cur = 1
	DefNum31Cur = 1
	DefNum32Cur = 1
	DefNum29 = NumberList2[1]
	DefNum30 = NumberList1[1]
	DefNum31 = NumberList1[1]
	DefNum32 = NumberList1[1]
end, function() end, function() end)

Rank:add_action("", function() end)

RankNote = Rank:add_submenu("Read Me")

RankNote:add_action("             High level = More reports", function() end)

RankNote:add_action("             Credits: SilentSalo", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Crew Rank---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	CrewRank = RMenu:add_submenu("Set Crew Rank Menu")

			a77 = 0
	CrewRank:add_int_range("Crew", 1, 0, 4,
		function()
			return a77
		end,
		function(Cre)
			a77 = Cre
		end)

			RPtoRank = {0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000, 28500, 33400, 38700, 44200, 50200, 56400, 63000, 69900, 77100, 84700, 92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100, 188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000, 312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800, 465200, 482000, 499000, 516300, 533800, 551600, 569600, 588000, 606500, 625400, 644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900, 849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700, 1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100, 1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300, 1555800, 1584350, 1612950, 1641600, 1670300, 1699050, 1727850, 1756700, 1785600, 1814550, 1843550, 1872600, 1901700, 1930850, 1960050, 1989300, 2018600, 2047950, 2077350, 2106800, 2136300, 2165850, 2195450, 2225100, 2254800, 2284550, 2314350, 2344200, 2374100, 2404050, 2434050, 2464100, 2494200, 2524350, 2554550, 2584800, 2615100, 2648513, 2675850, 2706300, 2736800, 2767350, 2797950, 2828600, 2859300, 2890050, 2920850, 2951700, 2982600, 3013550, 3044550, 3075600, 3106700, 3137850, 3169050, 3200300, 3231600, 3262950, 3294350, 3325800, 3357300, 3388850, 3420450, 3452100, 3483800, 3515550, 3547350, 3579200, 3611100, 3643050, 3675050, 3707100, 3739200, 3771350, 3803550, 3835800, 3868100, 3900450, 3932850, 3965300, 3997800, 4030350, 4062950, 4095600, 4128300, 4161050, 4193850, 4226700, 4259600, 4292550, 4325550, 4358600, 4391700, 4424850, 4458050, 4491300, 4524600, 4557950, 4591350, 4624800, 4658300, 4691850, 4725450, 4759100, 4792800, 4826550, 4860350, 4894200, 4928100, 4962050, 4996050, 5030100, 5064200, 5098350, 5132550, 5166800, 5201100, 5235450, 5269850, 5304300, 5338800, 5373350, 5407950, 5442600, 5477300, 5512050, 5546850, 5581700, 5616600, 5651550, 5686550, 5721600, 5756700, 5791850, 5827050, 5862300, 5897600, 5932950, 5968350, 6003800, 6039300, 6074850, 6110450, 6146100, 6181800, 6217550, 6253350, 6289200, 6325100, 6361050, 6397050, 6433100, 6469200, 6505350, 6541550, 6577800, 6614100, 6650450, 6686850, 6723300, 6759800, 6796350, 6832950, 6869600, 6906300, 6943050, 6979850, 7016700, 7053600, 7090550, 7127550, 7164600, 7201700, 7238850, 7276050, 7313300, 7350600, 7387950, 7425350, 7462800, 7500300, 7537850, 7575450, 7613100, 7650800, 7688550, 7726350, 7764200, 7802100, 7840050, 7878050, 7916100, 7954200, 7992350, 8030550, 8068800, 8107100, 8148513, 8183850, 8222300, 8260800, 8299350, 8337950, 8376600, 8415300, 8454050, 8492850, 8531700, 8570600, 8609550, 8648550, 8687600, 8726700, 8765850, 8805050, 8844300, 8883600, 8922950, 8962350, 9001800, 9041300, 9080850, 9120450, 9160100, 9199800, 9239550, 9279350, 9319200, 9359100, 9399050, 9439050, 9479100, 9519200, 9559350, 9599550, 9639800, 9680100, 9720450, 9760850, 9801300, 9841800, 9882350, 9922950, 9963600, 10004300, 10045050, 10085850, 10126700, 10167600, 10208550, 10249550, 10290600, 10331700, 10372850, 10414050, 10455300, 10496600, 10537950, 10579350, 10620800, 10662300, 10703850, 10748513, 10787100, 10828800, 10870550, 10912350, 10954200, 10996100, 11038050, 11080050, 11122100, 11164200, 11206350, 11248550, 11290800, 11333100, 11375450, 11417850, 11460300, 11502800, 11545350, 11587950, 11630600, 11673300, 11716050, 11758850, 11801700, 11844600, 11887550, 11930550, 11973600, 12016700, 12059850, 12103050, 12146300, 12189600, 12232950, 12276350, 12319800, 12363300, 12406850, 12450450, 12494100, 12537800, 12581550, 12625350, 12669200, 12713100, 12757050, 12801050, 12845100, 12889200, 12933350, 12977550, 13021800, 13066100, 13110450, 13154850, 13199300, 13243800, 13288350, 13332950, 13377600, 13422300, 13467050, 13511850, 13556700, 13601600, 13646550, 13691550, 13736600, 13781700, 13826850, 13872050, 13917300, 13962600, 14007950, 14053350, 14098800, 14144300, 14189850, 14235450, 14281100, 14326800, 14372550, 14418350, 14464200, 14510100, 14556050, 14602050, 14648100, 14694200, 14740350, 14786550, 14832800, 14879100, 14925450, 14971850, 15018300, 15064800, 15111350, 15157950, 15204600, 15251300, 15298050, 15344850, 15391700, 15438600, 15485550, 15532550, 15579600, 15626700, 15673850, 15721050, 15768300, 15815600, 15862950, 15910350, 15957800, 16005300, 16052850, 16100450, 16148100, 16195800, 16243550, 16291350, 16339200, 16387100, 16435050, 16483050, 16531100, 16579200, 16627350, 16675550, 16723800, 16772100, 16820450, 16868850, 16917300, 16965800, 17014350, 17062950, 17111600, 17160300, 17209050, 17257850, 17306700, 17355600, 17404550, 17453550, 17502600, 17551700, 17600850, 17650050, 17699300, 17748600, 17797950, 17847350, 17896800, 17946300, 17995850, 18048513, 18095100, 18144800, 18194550, 18244350, 18294200, 18344100, 18394050, 18444050, 18494100, 18544200, 18594350, 18644550, 18694800, 18745100, 18795450, 18845850, 18896300, 18946800, 18997350, 19047950, 19098600, 19149300, 19200050, 19250850, 19301700, 19352600, 19403550, 19454550, 19505600, 19556700, 19607850, 19659050, 19710300, 19761600, 19812950, 19864350, 19915800, 19967300, 20018850, 20070450, 20122100, 20173800, 20225550, 20277350, 20329200, 20381100, 20433050, 20485050, 20537100, 20589200, 20641350, 20693550, 20745800, 20798100, 20850450, 20902850, 20955300, 21007800, 21060350, 21112950, 21165600, 21218300, 21271050, 21323850, 21376700, 21429600, 21482550, 21535550, 21588600, 21641700, 21694850, 21748050, 21801300, 21854600, 21907950, 21961350, 22014800, 22068300, 22121850, 22175450, 22229100, 22282800, 22336550, 22390350, 22444200, 22498100, 22552050, 22606050, 22660100, 22714200, 22768350, 22822550, 22876800, 22931100, 22985450, 23039850, 23094300, 23148800, 23203350, 23257950, 23312600, 23367300, 23422050, 23476850, 23531700, 23586600, 23641550, 23696550, 23751600, 23806700, 23861850, 23917050, 23972300, 24027600, 24082950, 24138350, 24193800, 24249300, 24304850, 24360450, 24416100, 24471800, 24527550, 24583350, 24639200, 24695100, 24751050, 24807050, 24863100, 24919200, 24975350, 25031550, 25087800, 25144100, 25200450, 25256850, 25313300, 25369800, 25426350, 25482950, 25539600, 25596300, 25653050, 25709850, 25766700, 25823600, 25880550, 25937550, 25994600, 26051700, 26108850, 26166050, 26223300, 26280600, 26337950, 26395350, 26452800, 26510300, 26567850, 26625450, 26683100, 26740800, 26798550, 26856350, 26914200, 26972100, 27030050, 27088050, 27146100, 27204200, 27262350, 27320550, 27378800, 27437100, 27495450, 27553850, 27612300, 27670800, 27729350, 27787950, 27846600, 27905300, 27964050, 28022850, 28081700, 28140600, 28199550, 28258550, 28317600, 28376700, 28435850, 28495050, 28554300, 28613600, 28672950, 28732350, 28791800, 28851300, 28910850, 28970450, 29030100, 29089800, 29149550, 29209350, 29269200, 29329100, 29389050, 29449050, 29509100, 29569200, 29629350, 29689550, 29749800, 29810100, 29870450, 29930850, 29991300, 30051800, 30112350, 30172950, 30233600, 30294300, 30355050, 30415850, 30476700, 30537600, 30598550, 30659550, 30720600, 30781700, 30842850, 30904050, 30965300, 31026600, 31087950, 31149350, 31210800, 31272300, 31333850, 31395450, 31457100, 31518800, 31580550, 31642350, 31704200, 31766100, 31828050, 31890050, 31952100, 32014200, 32076350, 32138550, 32200800, 32263100, 32325450, 32387850, 32450300, 32512800, 32575350, 32637950, 32700600, 32763300, 32826050, 32888850, 32951700, 33014600, 33077550, 33140550, 33203600, 33266700, 33329850, 33393050, 33456300, 33519600, 33582950, 33646350, 33709800, 33773300, 33836850, 33900450, 33964100, 34027800, 34091550, 34155350, 34219200, 34283100, 34347050, 34411050, 34475100, 34539200, 34603350, 34667550, 34731800, 34796100, 34860450, 34924850, 34989300, 35053800, 35118350, 35182950, 35247600, 35312300, 35377050, 35441850, 35506700, 35571600, 35636550, 35701550, 35766600, 35831700, 35896850, 35962050, 36027300, 36092600, 36157950, 36223350, 36288800, 36354300, 36419850, 36485450, 36551100, 36616800, 36682550, 36748350, 36814200, 36880100, 36946050, 37012050, 37078100, 37144200, 37210350, 37276550, 37342800, 37409100, 37475450, 37541850, 37608300, 37674800, 37741350, 37807950, 37874600, 37941300, 38008050, 38074850, 38141700, 38208600, 38275550, 38342550, 38409600, 38476700, 38543850, 38611050, 38678300, 38745600, 38812950, 38880350, 38947800, 39015300, 39082850, 39150450, 39218100, 39285800, 39353550, 39421350, 39489200, 39557100, 39625050, 39693050, 39761100, 39829200, 39897350, 39965550, 40033800, 40102100, 40170450, 40238850, 40307300, 40375800, 40444350, 40512950, 40581600, 40650300, 40719050, 40787850, 40856700, 40925600, 40994550, 41063550, 41132600, 41201700, 41270850, 41340050, 41409300, 41478600, 41547950, 41617350, 41686800, 41756300, 41825850, 41895450, 41965100, 42034800, 42104550, 42174350, 42244200, 42314100, 42384050, 42454050, 42524100, 42594200, 42664350, 42734550, 42804800, 42875100, 42948513, 43015850, 43086300, 43156800, 43227350, 43297950, 43368600, 43439300, 43510050, 43580850, 43651700, 43722600, 43793550, 43864550, 43935600, 44006700, 44077850, 44149050, 44220300, 44291600, 44362950, 44434350, 44505800, 44577300, 44648850, 44720450, 44792100, 44863800, 44935550, 45007350, 45079200, 45151100, 45223050, 45295050, 45367100, 45439200, 45511350, 45583550, 45655800, 45728100, 45800450, 45872850, 45945300, 46017800, 46090350, 46162950, 46235600, 46308300, 46381050, 46453850, 46526700, 46599600, 46672550, 46745550, 46818600, 46891700, 46964850, 47038050, 47111300, 47184600, 47257950, 47331350, 47404800, 47478300, 47551850, 47625450, 47699100, 47772800, 47846550, 47920350, 47994200, 48068100, 48142050, 48216050, 48290100, 48364200, 48438350, 48512550, 48586800, 48661100, 48735450, 48809850, 48884300, 48958800, 49033350, 49107950, 49182600, 49257300, 49332050, 49406850, 49481700, 49556600, 49631550, 49706550, 49781600, 49856700, 49931850, 50007050, 50082300, 50157600, 50232950, 50308350, 50383800, 50459300, 50534850, 50610450, 50686100, 50761800, 50837550, 50913350, 50989200, 51065100, 51141050, 51217050, 51293100, 51369200, 51445350, 51521550, 51597800, 51674100, 51750450, 51826850, 51903300, 51979800, 52056350, 52132950, 52209600, 52286300, 52363050, 52439850, 52516700, 52593600, 52670550, 52747550, 52824600, 52901700, 52978850, 53056050, 53133300, 53210600, 53287950, 53365350, 53442800, 53520300, 53597850, 53675450, 53753100, 53830800, 53908550, 53986350, 54064200, 54142100, 54220050, 54298050, 54376100, 54454200, 54532350, 54610550, 54688800, 54767100, 54848513, 54923850, 55002300, 55080800, 55159350, 55237950, 55316600, 55395300, 55474050, 55552850, 55631700, 55710600, 55789550, 55868550, 55947600, 56026700, 56105850, 56185050, 56264300, 56343600, 56422950, 56502350, 56581800, 56661300, 56740850, 56820450, 56900100, 56979800, 57059550, 57139350, 57219200, 57299100, 57379050, 57459050, 57539100, 57619200, 57699350, 57779550, 57859800, 57940100, 58020450, 58100850, 58181300, 58261800, 58342350, 58422950, 58503600, 58584300, 58665050, 58745850, 58826700, 58907600, 58988550, 59069550, 59150600, 59231700, 59312850, 59394050, 59475300, 59556600, 59637950, 59719350, 59800800, 59882300, 59963850, 60048513, 60127100, 60208800, 60290550, 60372350, 60454200, 60536100, 60618050, 60700050, 60782100, 60864200, 60946350, 61028550, 61110800, 61193100, 61275450, 61357850, 61440300, 61522800, 61605350, 61687950, 61770600, 61853300, 61936050, 62018850, 62101700, 62184600, 62267550, 62350550, 62433600, 62516700, 62599850, 62683050, 62766300, 62849600, 62932950, 63016350, 63099800, 63183300, 63266850, 63350450, 63434100, 63517800, 63601550, 63685350, 63769200, 63853100, 63937050, 64021050, 64105100, 64189200, 64273350, 64357550, 64441800, 64526100, 64610450, 64694850, 64779300, 64863800, 64948350, 65032950, 65117600, 65202300, 65287050, 65371850, 65456700, 65541600, 65626550, 65711550, 65796600, 65881700, 65966850, 66052050, 66137300, 66222600, 66307950, 66393350, 66478800, 66564300, 66649850, 66735450, 66821100, 66906800, 66992550, 67078350, 67164200, 67250100, 67336050, 67422050, 67508100, 67594200, 67680350, 67766550, 67852800, 67939100, 68025450, 68111850, 68198300, 68284800, 68371350, 68457950, 68544600, 68631300, 68718050, 68804850, 68891700, 68978600, 69065550, 69152550, 69239600, 69326700, 69413850, 69501050, 69588300, 69675600, 69762950, 69850350, 69937800, 70025300, 70112850, 70200450, 70288100, 70375800, 70463550, 70551350, 70639200, 70727100, 70815050, 70903050, 70991100, 71079200, 71167350, 71255550, 71343800, 71432100, 71520450, 71608850, 71697300, 71785800, 71874350, 71962950, 72051600, 72140300, 72229050, 72317850, 72406700, 72495600, 72584550, 72673550, 72762600, 72851700, 72940850, 73030050, 73119300, 73208600, 73297950, 73387350, 73476800, 73566300, 73655850, 73748513, 73835100, 73924800, 74014550, 74104350, 74194200, 74284100, 74374050, 74464050, 74554100, 74644200, 74734350, 74824550, 74914800, 75005100, 75095450, 75185850, 75276300, 75366800, 75457350, 75547950, 75638600, 75729300, 75820050, 75910850, 76001700, 76092600, 76183550, 76274550, 76365600, 76456700, 76547850, 76639050, 76730300, 76821600, 76912950, 77004350, 77095800, 77187300, 77278850, 77370450, 77462100, 77553800, 77645550, 77737350, 77829200, 77921100, 78013050, 78105050, 78197100, 78289200, 78381350, 78473550, 78565800, 78658100, 78750450, 78842850, 78935300, 79027800, 79120350, 79212950, 79305600, 79398300, 79491050, 79583850, 79676700, 79769600, 79862550, 79955550, 80048600, 80141700, 80234850, 80328050, 80421300, 80514600, 80607950, 80701350, 80794800, 80888300, 80981850, 81075450, 81169100, 81262800, 81356550, 81450350, 81544200, 81638100, 81732050, 81826050, 81920100, 82014200, 82108350, 82202550, 82296800, 82391100, 82485450, 82579850, 82674300, 82768800, 82863350, 82957950, 83052600, 83147300, 83242050, 83336850, 83431700, 83526600, 83621550, 83716550, 83811600, 83906700, 84001850, 84097050, 84192300, 84287600, 84382950, 84478350, 84573800, 84669300, 84764850, 84860450, 84956100, 85051800, 85147550, 85243350, 85339200, 85435100, 85531050, 85627050, 85723100, 85819200, 85915350, 86011550, 86107800, 86204100, 86300450, 86396850, 86493300, 86589800, 86686350, 86782950, 86879600, 86976300, 87073050, 87169850, 87266700, 87363600, 87460550, 87557550, 87654600, 87751700, 87848850, 87946050, 88043300, 88140600, 88237950, 88335350, 88432800, 88530300, 88627850, 88725450, 88823100, 88920800, 89018550, 89116350, 89214200, 89312100, 89410050, 89508050, 89606100, 89704200, 89802350, 89900550, 89998800, 90097100, 90195450, 90293850, 90392300, 90490800, 90589350, 90687950, 90786600, 90885300, 90984050, 91082850, 91181700, 91280600, 91379550, 91478550, 91577600, 91676700, 91775850, 91875050, 91974300, 92073600, 92172950, 92272350, 92371800, 92471300, 92570850, 92670450, 92770100, 92869800, 92969550, 93069350, 93169200, 93269100, 93369050, 93469050, 93569100, 93669200, 93769350, 93869550, 93969800, 94070100, 94170450, 94270850, 94371300, 94471800, 94572350, 94672950, 94773600, 94874300, 94975050, 95075850, 95176700, 95277600, 95378550, 95479550, 95580600, 95681700, 95782850, 95884050, 95985300, 96086600, 96187950, 96289350, 96390800, 96492300, 96593850, 96695450, 96797100, 96898800, 97000550, 97102350, 97204200, 97306100, 97408050, 97510050, 97612100, 97714200, 97816350, 97918550, 98020800, 98123100, 98225450, 98327850, 98430300, 98532800, 98635350, 98737950, 98840600, 98943300, 99046050, 99148850, 99251700, 99354600, 99457550, 99560550, 99663600, 99766700, 99869850, 99973050, 100076300, 100179600, 100282950, 100386350, 100489800, 100593300, 100696850, 100800450, 100904100, 101007800, 101111550, 101215350, 101319200, 101423100, 101527050, 101631050, 101735100, 101839200, 101943350, 102047550, 102151800, 102256100, 102360450, 102464850, 102569300, 102673800, 102778350, 102882950, 102987600, 103092300, 103197050, 103301850, 103406700, 103511600, 103616550, 103721550, 103826600, 103931700, 104036850, 104142050, 104247300, 104352600, 104457950, 104563350, 104668800, 104774300, 104879850, 104985450, 105091100, 105196800, 105302550, 105408350, 105514200, 105620100, 105726050, 105832050, 105938100, 106044200, 106150350, 106256550, 106362800, 106469100, 106575450, 106681850, 106788300, 106894800, 107001350, 107107950, 107214600, 107321300, 107428050, 107534850, 107641700, 107748600, 107855550, 107962550, 108069600, 108176700, 108283850, 108391050, 108498300, 108605600, 108712950, 108820350, 108927800, 109035300, 109142850, 109250450, 109358100, 109465800, 109573550, 109681350, 109789200, 109897100, 110005050, 110113050, 110221100, 110329200, 110437350, 110545550, 110653800, 110762100, 110870450, 110978850, 111087300, 111195800, 111304350, 111412950, 111521600, 111630300, 111739050, 111847850, 111956700, 112065600, 112174550, 112283550, 112392600, 112501700, 112610850, 112720050, 112829300, 112938600, 113047950, 113157350, 113266800, 113376300, 113485850, 113595450, 113705100, 113814800, 113924550, 114034350, 114144200, 114254100, 114364050, 114474050, 114584100, 114694200, 114804350, 114914550, 115024800, 115135100, 115248513, 115355850, 115466300, 115576800, 115687350, 115797950, 115908600, 116019300, 116130050, 116240850, 116351700, 116462600, 116573550, 116684550, 116795600, 116906700, 117017850, 117129050, 117240300, 117351600, 117462950, 117574350, 117685800, 117797300, 117908850, 118020450, 118132100, 118243800, 118355550, 118467350, 118579200, 118691100, 118803050, 118915050, 119027100, 119139200, 119251350, 119363550, 119475800, 119588100, 119700450, 119812850, 119925300, 120037800, 120150350, 120262950, 120375600, 120488300, 120601050, 120713850, 120826700, 120939600, 121052550, 121165550, 121278600, 121391700, 121504850, 121618050, 121731300, 121844600, 121957950, 122071350, 122184800, 122298300, 122411850, 122525450, 122639100, 122752800, 122866550, 122980350, 123094200, 123208100, 123322050, 123436050, 123550100, 123664200, 123778350, 123892550, 124006800, 124121100, 124235450, 124349850, 124464300, 124578800, 124693350, 124807950, 124922600, 125037300, 125152050, 125266850, 125381700, 125496600, 125611550, 125726550, 125841600, 125956700, 126071850, 126187050, 126302300, 126417600, 126532950, 126648350, 126763800, 126879300, 126994850, 127110450, 127226100, 127341800, 127457550, 127573350, 127689200, 127805100, 127921050, 128037050, 128153100, 128269200, 128385350, 128501550, 128617800, 128734100, 128850450, 128966850, 129083300, 129199800, 129316350, 129432950, 129549600, 129666300, 129783050, 129899850, 130016700, 130133600, 130250550, 130367550, 130484600, 130601700, 130718850, 130836050, 130953300, 131070600, 131187950, 131305350, 131422800, 131540300, 131657850, 131775450, 131893100, 132010800, 132128550, 132246350, 132364200, 132482100, 132600050, 132718050, 132836100, 132954200, 133072350, 133190550, 133308800, 133427100, 133548513, 133663850, 133782300, 133900800, 134019350, 134137950, 134256600, 134375300, 134494050, 134612850, 134731700, 134850600, 134969550, 135088550, 135207600, 135326700, 135445850, 135565050, 135684300, 135803600, 135922950, 136042350, 136161800, 136281300, 136400850, 136520450, 136640100, 136759800, 136879550, 136999350, 137119200, 137239100, 137359050, 137479050, 137599100, 137719200, 137839350, 137959550, 138079800, 138200100, 138320450, 138440850, 138561300, 138681800, 138802350, 138922950, 139043600, 139164300, 139285050, 139405850, 139526700, 139647600, 139768550, 139889550, 140010600, 140131700, 140252850, 140374050, 140495300, 140616600, 140737950, 140859350, 140980800, 141102300, 141223850, 141348513, 141467100, 141588800, 141710550, 141832350, 141954200, 142076100, 142198050, 142320050, 142442100, 142564200, 142686350, 142808550, 142930800, 143053100, 143175450, 143297850, 143420300, 143542800, 143665350, 143787950, 143910600, 144033300, 144156050, 144278850, 144401700, 144524600, 144647550, 144770550, 144893600, 145016700, 145139850, 145263050, 145386300, 145509600, 145632950, 145756350, 145879800, 146003300, 146126850, 146250450, 146374100, 146497800, 146621550, 146745350, 146869200, 146993100, 147117050, 147241050, 147365100, 147489200, 147613350, 147737550, 147861800, 147986100, 148110450, 148234850, 148359300, 148483800, 148608350, 148732950, 148857600, 148982300, 149107050, 149231850, 149356700, 149481600, 149606550, 149731550, 149856600, 149981700, 150106850, 150232050, 150357300, 150482600, 150607950, 150733350, 150858800, 150984300, 151109850, 151235450, 151361100, 151486800, 151612550, 151738350, 151864200, 151990100, 152116050, 152242050, 152368100, 152494200, 152620350, 152746550, 152872800, 152999100, 153125450, 153251850, 153378300, 153504800, 153631350, 153757950, 153884600, 154011300, 154138050, 154264850, 154391700, 154518600, 154645550, 154772550, 154899600, 155026700, 155153850, 155281050, 155408300, 155535600, 155662950, 155790350, 155917800, 156045300, 156172850, 156300450, 156428100, 156555800, 156683550, 156811350, 156939200, 157067100, 157195050, 157323050, 157451100, 157579200, 157707350, 157835550, 157963800, 158092100, 158220450, 158348850, 158477300, 158605800, 158734350, 158862950, 158991600, 159120300, 159249050, 159377850, 159506700, 159635600, 159764550, 159893550, 160022600, 160151700, 160280850, 160410050, 160539300, 160668600, 160797950, 160927350, 161056800, 161186300, 161315850, 161448513, 161575100, 161704800, 161834550, 161964350, 162094200, 162224100, 162354050, 162484050, 162614100, 162744200, 162874350, 163004550, 163134800, 163265100, 163395450, 163525850, 163656300, 163786800, 163917350, 164047950, 164178600, 164309300, 164440050, 164570850, 164701700, 164832600, 164963550, 165094550, 165225600, 165356700, 165487850, 165619050, 165750300, 165881600, 166012950, 166144350, 166275800, 166407300, 166538850, 166670450, 166802100, 166933800, 167065550, 167197350, 167329200, 167461100, 167593050, 167725050, 167857100, 167989200, 168121350, 168253550, 168385800, 168518100, 168650450, 168782850, 168915300, 169047800, 169180350, 169312950, 169445600, 169578300, 169711050, 169843850, 169976700, 170109600, 170242550, 170375550, 170508600, 170641700, 170774850, 170908050, 171041300, 171174600, 171307950, 171441350, 171574800, 171708300, 171841850, 171975450, 172109100, 172242800, 172376550, 172510350, 172644200, 172778100, 172912050, 173046050, 173180100, 173314200, 173448350, 173582550, 173716800, 173851100, 173985450, 174119850, 174254300, 174388800, 174523350, 174657950, 174792600, 174927300, 175062050, 175196850, 175331700, 175466600, 175601550, 175736550, 175871600, 176006700, 176141850, 176277050, 176412300, 176547600, 176682950, 176818350, 176953800, 177089300, 177224850, 177360450, 177496100, 177631800, 177767550, 177903350, 178039200, 178175100, 178311050, 178447050, 178583100, 178719200, 178855350, 178991550, 179127800, 179264100, 179400450, 179536850, 179673300, 179809800, 179946350, 180082950, 180219600, 180356300, 180493050, 180629850, 180766700, 180903600, 181040550, 181177550, 181314600, 181451700, 181588850, 181726050, 181863300, 182000600, 182137950, 182275350, 182412800, 182550300, 182687850, 182825450, 182963100, 183100800, 183238550, 183376350, 183514200, 183652100, 183790050, 183928050, 184066100, 184204200, 184342350, 184480550, 184618800, 184757100, 184895450, 185033850, 185172300, 185310800, 185449350, 185587950, 185726600, 185865300, 186004050, 186142850, 186281700, 186420600, 186559550, 186698550, 186837600, 186976700, 187115850, 187255050, 187394300, 187533600, 187672950, 187812350, 187951800, 188091300, 188230850, 188370450, 188510100, 188649800, 188789550, 188929350, 189069200, 189209100, 189349050, 189489050, 189629100, 189769200, 189909350, 190049550, 190189800, 190330100, 190470450, 190610850, 190751300, 190891800, 191032350, 191172950, 191313600, 191454300, 191595050, 191735850, 191876700, 192017600, 192158550, 192299550, 192440600, 192581700, 192722850, 192864050, 193005300, 193146600, 193287950, 193429350, 193570800, 193712300, 193853850, 193995450, 194137100, 194278800, 194420550, 194562350, 194704200, 194846100, 194988050, 195130050, 195272100, 195414200, 195556350, 195698550, 195840800, 195983100, 196125450, 196267850, 196410300, 196552800, 196695350, 196837950, 196980600, 197123300, 197266050, 197408850, 197551700, 197694600, 197837550, 197980550, 198123600, 198266700, 198409850, 198553050, 198696300, 198839600, 198982950, 199126350, 199269800, 199413300, 199556850, 199700450, 199844100, 199987800, 200131550, 200275350, 200419200, 200563100, 200707050, 200851050, 200995100, 201139200, 201283350, 201427550, 201571800, 201716100, 201860450, 202004850, 202149300, 202293800, 202438350, 202582950, 202727600, 202872300, 203017050, 203161850, 203306700, 203451600, 203596550, 203741550, 203886600, 204031700, 204176850, 204322050, 204467300, 204612600, 204757950, 204903350, 205048800, 205194300, 205339850, 205485450, 205631100, 205776800, 205922550, 206068350, 206214200, 206360100, 206506050, 206652050, 206798100, 206944200, 207090350, 207236550, 207382800, 207529100, 207675450, 207821850, 207968300, 208114800, 208261350, 208407950, 208554600, 208701300, 208848050, 208994850, 209141700, 209288600, 209435550, 209582550, 209729600, 209876700, 210023850, 210171050, 210318300, 210465600, 210612950, 210760350, 210907800, 211055300, 211202850, 211350450, 211498100, 211645800, 211793550, 211941350, 212089200, 212237100, 212385050, 212533050, 212681100, 212829200, 212977350, 213125550, 213273800, 213422100, 213570450, 213718850, 213867300, 214015800, 214164350, 214312950, 214461600, 214610300, 214759050, 214907850, 215056700, 215205600, 215354550, 215503550, 215652600, 215801700, 215950850, 216100050, 216249300, 216398600, 216547950, 216697350, 216846800, 216996300, 217145850, 217295450, 217445100, 217594800, 217744550, 217894350, 218044200, 218194100, 218344050, 218494050, 218644100, 218794200, 218944350, 219094550, 219244800, 219395100, 219548513, 219695850, 219846300, 219996800, 220147350, 220297950, 220448600, 220599300, 220750050, 220900850, 221051700, 221202600, 221353550, 221504550, 221655600, 221806700, 221957850, 222109050, 222260300, 222411600, 222562950, 222714350, 222865800, 223017300, 223168850, 223320450, 223472100, 223623800, 223775550, 223927350, 224079200, 224231100, 224383050, 224535050, 224687100, 224839200, 224991350, 225143550, 225295800, 225448100, 225600450, 225752850, 225905300, 226057800, 226210350, 226362950, 226515600, 226668300, 226821050, 226973850, 227126700, 227279600, 227432550, 227585550, 227738600, 227891700, 228044850, 228198050, 228351300, 228504600, 228657950, 228811350, 228964800, 229118300, 229271850, 229425450, 229579100, 229732800, 229886550, 230040350, 230194200, 230348100, 230502050, 230656050, 230810100, 230964200, 231118350, 231272550, 231426800, 231581100, 231735450, 231889850, 232044300, 232198800, 232353350, 232507950, 232662600, 232817300, 232972050, 233126850, 233281700, 233436600, 233591550, 233746550, 233901600, 234056700, 234211850, 234367050, 234522300, 234677600, 234832950, 234988350, 235143800, 235299300, 235454850, 235610450, 235766100, 235921800, 236077550, 236233350, 236389200, 236545100, 236701050, 236857050, 237013100, 237169200, 237325350, 237481550, 237637800, 237794100, 237950450, 238106850, 238263300, 238419800, 238576350, 238732950, 238889600, 239046300, 239203050, 239359850, 239516700, 239673600, 239830550, 239987550, 240144600, 240301700, 240458850, 240616050, 240773300, 240930600, 241087950, 241245350, 241402800, 241560300, 241717850, 241875450, 242033100, 242190800, 242348550, 242506350, 242664200, 242822100, 242980050, 243138050, 243296100, 243454200, 243612350, 243770550, 243928800, 244087100, 244248513, 244403850, 244562300, 244720800, 244879350, 245037950, 245196600, 245355300, 245514050, 245672850, 245831700, 245990600, 246149550, 246308550, 246467600, 246626700, 246785850, 246945050, 247104300, 247263600, 247422950, 247582350, 247741800, 247901300, 248060850, 248220450, 248380100, 248539800, 248699550, 248859350, 249019200, 249179100, 249339050, 249499050, 249659100, 249819200, 249979350, 250139550, 250299800, 250460100, 250620450, 250780850, 250941300, 251101800, 251262350, 251422950, 251583600, 251744300, 251905050, 252065850, 252226700, 252387600, 252548550, 252709550, 252870600, 253031700, 253192850, 253354050, 253515300, 253676600, 253837950, 253999350, 254160800, 254322300, 254483850, 254648513, 254807100, 254968800, 255130550, 255292350, 255454200, 255616100, 255778050, 255940050, 256102100, 256264200, 256426350, 256588550, 256750800, 256913100, 257075450, 257237850, 257400300, 257562800, 257725350, 257887950, 258050600, 258213300, 258376050, 258538850, 258701700, 258864600, 259027550, 259190550, 259353600, 259516700, 259679850, 259843050, 260006300, 260169600, 260332950, 260496350, 260659800, 260823300, 260986850, 261150450, 261314100, 261477800, 261641550, 261805350, 261969200, 262133100, 262297050, 262461050, 262625100, 262789200, 262953350, 263117550, 263281800, 263446100, 263610450, 263774850, 263939300, 264103800, 264268350, 264432950, 264597600, 264762300, 264927050, 265091850, 265256700, 265421600, 265586550, 265751550, 265916600, 266081700, 266246850, 266412050, 266577300, 266742600, 266907950, 267073350, 267238800, 267404300, 267569850, 267735450, 267901100, 268066800, 268232550, 268398350, 268564200, 268730100, 268896050, 269062050, 269228100, 269394200, 269560350, 269726550, 269892800, 270059100, 270225450, 270391850, 270558300, 270724800, 270891350, 271057950, 271224600, 271391300, 271558050, 271724850, 271891700, 272058600, 272225550, 272392550, 272559600, 272726700, 272893850, 273061050, 273228300, 273395600, 273562950, 273730350, 273897800, 274065300, 274232850, 274400450, 274568100, 274735800, 274903550, 275071350, 275239200, 275407100, 275575050, 275743050, 275911100, 276079200, 276247350, 276415550, 276583800, 276752100, 276920450, 277088850, 277257300, 277425800, 277594350, 277762950, 277931600, 278100300, 278269050, 278437850, 278606700, 278775600, 278944550, 279113550, 279282600, 279451700, 279620850, 279790050, 279959300, 280128600, 280297950, 280467350, 280636800, 280806300, 280975850, 281148513, 281315100, 281484800, 281654550, 281824350, 281994200, 282164100, 282334050, 282504050, 282674100, 282844200, 283014350, 283184550, 283354800, 283525100, 283695450, 283865850, 284036300, 284206800, 284377350, 284547950, 284718600, 284889300, 285060050, 285230850, 285401700, 285572600, 285743550, 285914550, 286085600, 286256700, 286427850, 286599050, 286770300, 286941600, 287112950, 287284350, 287455800, 287627300, 287798850, 287970450, 288142100, 288313800, 288485550, 288657350, 288829200, 289001100, 289173050, 289345050, 289517100, 289689200, 289861350, 290033550, 290205800, 290378100, 290550450, 290722850, 290895300, 291067800, 291240350, 291412950, 291585600, 291758300, 291931050, 292103850, 292276700, 292449600, 292622550, 292795550, 292968600, 293141700, 293314850, 293488050, 293661300, 293834600, 294007950, 294181350, 294354800, 294528300, 294701850, 294875450, 295049100, 295222800, 295396550, 295570350, 295744200, 295918100, 296092050, 296266050, 296440100, 296614200, 296788350, 296962550, 297136800, 297311100, 297485450, 297659850, 297834300, 298008800, 298183350, 298357950, 298532600, 298707300, 298882050, 299056850, 299231700, 299406600, 299581550, 299756550, 299931600, 300106700, 300281850, 300457050, 300632300, 300807600, 300982950, 301158350, 301333800, 301509300, 301684850, 301860450, 302036100, 302211800, 302387550, 302563350, 302739200, 302915100, 303091050, 303267050, 303443100, 303619200, 303795350, 303971550, 304147800, 304324100, 304500450, 304676850, 304853300, 305029800, 305206350, 305382950, 305559600, 305736300, 305913050, 306089850, 306266700, 306443600, 306620550, 306797550, 306974600, 307151700, 307328850, 307506050, 307683300, 307860600, 308037950, 308215350, 308392800, 308570300, 308747850, 308925450, 309103100, 309280800, 309458550, 309636350, 309814200, 309992100, 310170050, 310348050, 310526100, 310704200, 310882350, 311060550, 311238800, 311417100, 311595450, 311773850, 311952300, 312130800, 312309350, 312487950, 312666600, 312845300, 313024050, 313202850, 313381700, 313560600, 313739550, 313918550, 314097600, 314276700, 314455850, 314635050, 314814300, 314993600, 315172950, 315352350, 315531800, 315711300, 315890850, 316070450, 316250100, 316429800, 316609550, 316789350, 316969200, 317149100, 317329050, 317509050, 317689100, 317869200, 318049350, 318229550, 318409800, 318590100, 318770450, 318950850, 319131300, 319311800, 319492350, 319672950, 319853600, 320034300, 320215050, 320395850, 320576700, 320757600, 320938550, 321119550, 321300600, 321481700, 321662850, 321844050, 322025300, 322206600, 322387950, 322569350, 322750800, 322932300, 323113850, 323295450, 323477100, 323658800, 323840550, 324022350, 324204200, 324386100, 324568050, 324750050, 324932100, 325114200, 325296350, 325478550, 325660800, 325843100, 326025450, 326207850, 326390300, 326572800, 326755350, 326937950, 327120600, 327303300, 327486050, 327668850, 327851700, 328034600, 328217550, 328400550, 328583600, 328766700, 328949850, 329133050, 329316300, 329499600, 329682950, 329866350, 330049800, 330233300, 330416850, 330600450, 330784100, 330967800, 331151550, 331335350, 331519200, 331703100, 331887050, 332071050, 332255100, 332439200, 332623350, 332807550, 332991800, 333176100, 333360450, 333544850, 333729300, 333913800, 334098350, 334282950, 334467600, 334652300, 334837050, 335021850, 335206700, 335391600, 335576550, 335761550, 335946600, 336131700, 336316850, 336502050, 336687300, 336872600, 337057950, 337243350, 337428800, 337614300, 337799850, 337985450, 338171100, 338356800, 338542550, 338728350, 338914200,339100100, 339286050, 339472050, 339658100, 339844200, 340030350, 340216550, 340402800, 340589100, 340775450, 340961850, 341148300, 341334800, 341521350, 341707950, 341894600, 342081300, 342268050, 342454850, 342641700, 342828600, 343015550, 343202550, 343389600, 343576700, 343763850, 343951050, 344138300, 344325600, 344512950, 344700350, 344887800, 345075300, 345262850, 348513450, 345638100, 345825800, 346013550, 346201350, 346389200, 346577100, 346765050, 346953050, 347141100, 347329200, 347517350, 347705550, 347893800, 348082100, 348270450, 348458850, 348647300, 348835800, 349024350, 349212950, 349401600, 349590300, 349779050, 349967850, 350156700, 350345600, 350534550, 350723550, 350912600, 351101700, 351290850, 351480050, 351669300, 351858600, 352047950, 352237350, 352426800, 352616300, 352805850, 352995450, 353185100, 353374800, 353564550, 353754350, 353944200, 354134100, 354324050, 354514050, 354704100, 354894200, 355084350, 355274550, 355464800, 355655100, 355848513, 356035850, 356226300, 356416800, 356607350, 356797950, 356988600, 357179300, 357370050, 357560850, 357751700, 357942600, 358133550, 358324550, 358515600, 358706700, 358897850, 359089050, 359280300, 359471600, 359662950, 359854350, 360045800, 360237300, 360428850, 360620450, 360812100, 361003800, 361195550, 361387350, 361579200, 361771100, 361963050, 362155050, 362347100, 362539200, 362731350, 362923550, 363115800, 363308100, 363500450, 363692850, 363885300, 364077800, 364270350, 364462950, 364655600, 364848300, 365041050, 365233850, 365426700, 365619600, 365812550, 366005550, 366198600, 366391700, 366584850, 366778050, 366971300, 367164600, 367357950, 367551350, 367744800, 367938300, 368131850, 368325450, 368519100, 368712800, 368906550, 369100350, 369294200, 369488100, 369682050, 369876050, 370070100, 370264200, 370458350, 370652550, 370846800, 371041100, 371235450, 371429850, 371624300, 371818800, 372013350, 372207950, 372402600, 372597300, 372792050, 372986850, 373181700, 373376600, 373571550, 373766550, 373961600, 374156700, 374351850, 374547050, 374742300, 374937600, 375132950, 375328350, 375523800, 375719300, 375914850, 376110450, 376306100, 376501800, 376697550, 376893350, 377089200, 377285100, 377481050, 377677050, 377873100, 378069200, 378265350, 378461550, 378657800, 378854100, 379050450, 379246850, 379443300, 379639800, 379836350, 380032950, 380229600, 380426300, 380623050, 380819850, 381016700, 381213600, 381410550, 381607550, 381804600, 382001700, 382198850, 382396050, 382593300, 382790600, 382987950, 383185350, 383382800, 383580300, 383777850, 383975450, 384173100, 384370800, 384568550, 384766350, 384964200, 385162100, 385360050, 385558050, 385756100, 385954200, 386152350, 386350550, 386548800, 386747100, 386948513, 387143850, 387342300, 387540800, 387739350, 387937950, 388136600, 388335300, 388534050, 388732850, 388931700, 389130600, 389329550, 389528550, 389727600, 389926700, 390125850, 390325050, 390524300, 390723600, 390922950, 391122350, 391321800, 391521300, 391720850, 391920450, 392120100, 392319800, 392519550, 392719350, 392919200, 393119100, 393319050, 393519050, 393719100, 393919200, 394119350, 394319550, 394519800, 394720100, 394920450, 395120850, 395321300, 395521800, 395722350, 395922950, 396123600, 396324300, 396525050, 396725850, 396926700, 397127600, 397328550, 397529550, 397730600, 397931700, 398132850, 398334050, 398535300, 398736600, 398937950, 399139350, 399340800, 399542300, 399743850, 399948513, 400147100, 400348800, 400550550, 400752350, 400954200, 401156100, 401358050, 401560050, 401762100, 401964200, 402166350, 402368550, 402570800, 402773100, 402975450, 403177850, 403380300, 403582800, 403785350, 403987950, 404190600, 404393300, 404596050, 404798850, 405001700, 405204600, 405407550, 405610550, 405813600, 406016700, 406219850, 406423050, 406626300, 406829600, 407032950, 407236350, 407439800, 407643300, 407846850, 408050450, 408254100, 408457800, 408661550, 408865350, 409069200, 409273100, 409477050, 409681050, 409885100, 410089200, 410293350, 410497550, 410701800, 410906100, 411110450, 411314850, 411519300, 411723800, 411928350, 412132950, 412337600, 412542300, 412747050, 412951850, 413156700, 413361600, 413566550, 413771550, 413976600, 414181700, 414386850, 414592050, 414797300, 415002600, 415207950, 415413350, 415618800, 415824300, 416029850, 416235450, 416441100, 416646800, 416852550, 417058350, 417264200, 417470100, 417676050, 417882050, 418088100, 418294200, 418500350, 418706550, 418912800, 419119100, 419325450, 419531850, 419738300, 419944800, 420151350, 420357950, 420564600, 420771300, 420978050, 421184850, 421391700, 421598600, 421805550, 422012550, 422219600, 422426700, 422633850, 422841050, 423048300, 423255600, 423462950, 423670350, 423877800, 424085300, 424292850, 424500450, 424708100, 424915800, 425123550, 425331350, 425539200, 425747100, 425955050, 426163050, 426371100, 426579200, 426787350, 426995550, 427203800, 427412100, 427620450, 427828850, 428037300, 428245800, 428454350, 428662950, 428871600, 429080300, 429289050, 429497850, 429706700, 429915600, 430124550, 430333550, 430542600, 430751700, 430960850, 431170050, 431379300, 431588600, 431797950, 432007350, 432216800, 432426300, 432635850, 432848513, 433055100, 433264800, 433474550, 433684350, 433894200, 434104100, 434314050, 434524050, 434734100, 434944200, 435154350, 435364550, 435574800, 435785100, 435995450, 436205850, 436416300, 436626800, 436837350, 437047950, 437258600, 437469300, 437680050, 437890850, 438101700, 438312600, 438523550, 438734550, 438945600, 439156700, 439367850, 439579050, 439790300, 440001600, 440212950, 440424350, 440635800, 440847300, 441058850, 441270450, 441482100, 441693800, 441905550, 442117350, 442329200, 442541100, 442753050, 442965050, 443177100, 443389200, 443601350, 443813550, 444025800, 444238100, 444450450, 444662850, 444875300, 445087800, 445300350, 445512950, 445725600, 445938300, 446151050, 446363850, 446576700, 446789600, 447002550, 447215550, 447428600, 447641700, 447854850, 448068050, 448281300, 448494600, 448707950, 448921350, 449134800, 449348300, 449561850, 449775450, 449989100, 450202800, 450416550, 450630350, 450844200, 451058100, 451272050, 451486050, 451700100, 451914200, 452128350, 452342550, 452556800, 452771100, 452985450, 453199850, 453414300, 453628800, 453843350, 454057950, 454272600, 454487300, 454702050, 454916850, 455131700, 455346600, 455561550, 455776550, 455991600, 456206700, 456421850, 456637050, 456852300, 457067600, 457282950, 457498350, 457713800, 457929300, 458144850, 458360450, 458576100, 458791800, 459007550, 459223350, 459439200, 459655100, 459871050, 460087050, 460303100, 460519200, 460735350, 460951550, 461167800, 461384100, 461600450, 461816850, 462033300, 462249800, 462466350, 462682950, 462899600, 463116300, 463333050, 463549850, 463766700, 463983600, 464200550, 464417550, 464634600, 464851700, 465068850, 465286050, 465503300, 465720600, 465937950, 466155350, 466372800, 466590300, 466807850, 467025450, 467243100, 467460800, 467678550, 467896350, 468114200, 468332100, 468550050, 468768050, 468986100, 469204200, 469422350, 469640550, 469858800, 470077100, 470295450, 470513850, 470732300, 470950800, 471169350, 471387950, 471606600, 471825300, 472044050, 472262850, 472481700, 472700600, 472919550, 473138550, 473357600, 473576700, 473795850, 474015050, 474234300, 474453600, 474672950, 474892350, 475111800, 475331300, 475550850, 475770450, 475990100, 476209800, 476429550, 476649350, 476869200, 477089100, 477309050, 477529050, 477749100, 477969200, 478189350, 478409550, 478629800, 478850100, 479070450, 479290850, 479511300, 479731800, 479952350, 480172950, 480393600, 480614300, 480835050, 481055850, 481276700, 481497600, 481718550, 481939550, 482160600, 482381700, 482602850, 482824050, 483045300, 483266600, 483487950, 483709350, 483930800, 484152300, 484373850, 484595450, 484817100, 485038800, 485260550, 485482350, 485704200, 485926100, 486148050, 486370050, 486592100, 486814200, 487036350, 487258550, 487480800, 487703100, 487925450, 488147850, 488370300, 488592800, 488815350, 489037950, 489260600, 489483300, 489706050, 489928850, 490151700, 490374600, 490597550, 490820550, 491043600, 491266700, 491489850, 491713050, 491936300, 492159600, 492382950, 492606350, 492829800, 493053300, 493276850, 493500450, 493724100, 493947800, 494171550, 494395350, 494619200, 494843100, 495067050, 495291050, 495515100, 495739200, 495963350, 496187550, 496411800, 496636100, 496860450, 497084850, 497309300, 497533800, 497758350, 497982950, 498207600, 498432300, 498657050, 498881850, 499106700, 499331600, 499556550, 499781550, 500006600, 500231700, 500456850, 500682050, 500907300, 501132600, 501357950, 501583350, 501808800, 502034300, 502259850, 502485450, 502711100, 502936800, 503162550, 503388350, 503614200, 503840100, 504066050, 504292050, 504518100, 504744200, 504970350, 505196550, 505422800, 505649100, 505875450, 506101850, 506328300, 506554800, 506781350, 507007950, 507234600, 507461300, 507688050, 507914850, 508141700, 508368600, 508595550, 508822550, 509049600, 509276700, 509503850, 509731050, 509958300, 510185600, 510412950, 510640350, 510867800, 511095300, 511322850, 511550450, 511778100, 512005800, 512233550, 512461350, 512689200, 512917100, 513145050, 513373050, 513601100, 513829200, 514057350, 514285550, 514513800, 514742100, 514970450, 515198850, 515427300, 515655800, 515884350, 516112950, 516341600, 516570300, 516799050, 517027850, 517256700, 517485600, 517714550, 517943550, 518172600, 518401700, 518630850, 518860050, 519089300, 519318600, 519547950, 519777350, 520006800, 520236300, 520465850, 520695450, 520925100, 521154800, 521384550, 521614350, 521844200, 522074100, 522304050, 522534050, 522764100, 522994200, 523224350, 523454550, 523684800, 523915100, 524148513, 524375850, 524606300, 524836800, 525067350, 525297950, 525528600, 525759300, 525990050, 526220850, 526451700, 526682600, 526913550, 527144550, 527375600, 527606700, 527837850, 528069050, 528300300, 528531600, 528762950, 528994350, 529225800, 529457300, 529688850, 529920450, 530152100, 530383800, 530615550, 530847350, 531079200, 531311100, 531543050, 531775050, 532007100, 532239200, 532471350, 532703550, 532935800, 533168100, 533400450, 533632850, 533865300, 534097800, 534330350, 534562950, 534795600, 535028300, 535261050, 535493850, 535726700, 535959600, 536192550, 536425550, 536658600, 536891700, 537124850, 537358050, 537591300, 537824600, 538057950, 538291350, 538524800, 538758300, 538991850, 539225450, 539459100, 539692800, 539926550, 540160350, 540394200, 540628100, 540862050, 541096050, 541330100, 541564200, 541798350, 542032550, 542266800, 542501100, 542735450, 542969850, 543204300, 543438800, 543673350, 543907950, 544142600, 544377300, 544612050, 544846850, 545081700, 545316600, 545551550, 545786550, 546021600, 546256700, 546491850, 546727050, 546962300, 547197600, 547432950, 547668350, 547903800, 548139300, 548374850, 548610450, 548846100, 549081800, 549317550, 549553350, 549789200, 550025100, 550261050, 550497050, 550733100, 550969200, 551205350, 551441550, 551677800, 551914100, 552150450, 552386850, 552623300, 552859800, 553096350, 553332950, 553569600, 553806300, 554043050, 554279850, 554516700, 554753600, 554990550, 555227550, 555464600, 555701700, 555938850, 556176050, 556413300, 556650600, 556887950, 557125350, 557362800, 557600300, 557837850, 558075450, 558313100, 558550800, 558788550, 559026350, 559264200, 559502100, 559740050, 559978050, 560216100, 560454200, 560692350, 560930550, 561168800, 561407100, 561648513, 561883850, 562122300, 562360800, 562599350, 562837950, 563076600, 563315300, 563554050, 563792850, 564031700, 564270600, 564509550, 564748550, 564987600, 565226700, 565465850, 565705050, 565944300, 566183600, 566422950, 566662350, 566901800, 567141300, 567380850, 567620450, 567860100, 568099800, 568339550, 568579350, 568819200, 569059100, 569299050, 569539050, 569779100, 570019200, 570259350, 570499550, 570739800, 570980100, 571220450, 571460850, 571701300, 571941800, 572182350, 572422950, 572663600, 572904300, 573145050, 573385850, 573626700, 573867600, 574108550, 574349550, 574590600, 574831700, 575072850, 575314050, 575555300, 575796600, 576037950, 576279350, 576520800, 576762300, 577003850, 577248513, 577487100, 577728800, 577970550, 578212350, 578454200, 578696100, 578938050, 579180050, 579422100, 579664200, 579906350, 580148550, 580390800, 580633100, 580875450, 581117850, 581360300, 581602800, 581845350, 582087950, 582330600, 582573300, 582816050, 583058850, 583301700, 583544600, 583787550, 584030550, 584273600, 584516700, 584759850, 585003050, 585246300, 585489600, 585732950, 585976350, 586219800, 586463300, 586706850, 586950450, 587194100, 587437800, 587681550, 587925350, 588169200, 588413100, 588657050, 588901050, 589145100, 589389200, 589633350, 589877550, 590121800, 590366100, 590610450, 590854850, 591099300, 591343800, 591588350, 591832950, 592077600, 592322300, 592567050, 592811850, 593056700, 593301600, 593546550, 593791550, 594036600, 594281700, 594526850, 594772050, 595017300, 595262600, 595507950, 595753350, 595998800, 596244300, 596489850, 596735450, 596981100, 597226800, 597472550, 597718350, 597964200, 598210100, 598456050, 598702050, 598948100, 599194200, 599440350, 599686550, 599932800, 600179100, 600425450, 600671850, 600918300, 601164800, 601411350, 601657950, 601904600, 602151300, 602398050, 602644850, 602891700, 603138600, 603385550, 603632550, 603879600, 604126700, 604373850, 604621050, 604868300, 605115600, 605362950, 605610350, 605857800, 606105300, 606352850, 606600450, 606848100, 607095800, 607343550, 607591350, 607839200, 608087100, 608335050, 608583050, 608831100, 609079200, 609327350, 609575550, 609823800, 610072100, 610320450, 610568850, 610817300, 611065800, 611314350, 611562950, 611811600, 612060300, 612309050, 612557850, 612806700, 613055600, 613304550, 613553550, 613802600, 614051700, 614300850, 614550050, 614799300, 615048600, 615297950, 615547350, 615796800, 616046300, 616295850, 616548513, 616795100, 617044800, 617294550, 617544350, 617794200, 618044100, 618294050, 618544050, 618794100, 619044200, 619294350, 619544550, 619794800, 620045100, 620295450, 620545850, 620796300, 621046800, 621297350, 621547950, 621798600, 622049300, 622300050, 622550850, 622801700, 623052600, 623303550, 623554550, 623805600, 624056700, 624307850, 624559050, 624810300, 625061600, 625312950, 625564350, 625815800, 626067300, 626318850, 626570450, 626822100, 627073800, 627325550, 627577350, 627829200, 628081100, 628333050, 628585050, 628837100, 629089200, 629341350, 629593550, 629845800, 630098100, 630350450, 630602850, 630855300, 631107800, 631360350, 631612950, 631865600, 632118300, 632371050, 632623850, 632876700, 633129600, 633382550, 633635550, 633888600, 634141700, 634394850, 634648050, 634901300, 635154600, 635407950, 635661350, 635914800, 636168300, 636421850, 636675450, 636929100, 637182800, 637436550, 637690350, 637944200, 638198100, 638452050, 638706050, 638960100, 639214200, 639468350, 639722550, 639976800, 640231100, 640485450, 640739850, 640994300, 641248800, 641503350, 641757950, 642012600, 642267300, 642522050, 642776850, 643031700, 643286600, 643541550, 643796550, 644051600, 644306700, 644561850, 644817050, 645072300, 645327600, 645582950, 645838350, 646093800, 646349300, 646604850, 646860450, 647116100, 647371800, 647627550, 647883350, 648139200, 648395100, 648651050, 648907050, 649163100, 649419200, 649675350, 649931550, 650187800, 650444100, 650700450, 650956850, 651213300, 651469800, 651726350, 651982950, 652239600, 652496300, 652753050, 653009850, 653266700, 653523600, 653780550, 654037550, 654294600, 654551700, 654808850, 655066050, 655323300, 655580600, 655837950, 656095350, 656352800, 656610300, 656867850, 657125450, 657383100, 657640800, 657898550, 658156350, 658414200, 658672100, 658930050, 659188050, 659446100, 659704200, 659962350, 660220550, 660478800, 660737100, 660995450, 661253850, 661512300, 661770800, 662029350, 662287950, 662546600, 662805300, 663064050, 663322850, 663581700, 663840600, 664099550, 664358550, 664617600, 664876700, 665135850, 665395050, 665654300, 665913600, 666172950, 666432350, 666691800, 666951300, 667210850, 667470450, 667730100, 667989800, 668249550, 668509350, 668769200, 669029100, 669289050, 669549050, 669809100, 670069200, 670329350, 670589550, 670849800, 671110100, 671370450, 671630850, 671891300, 672151800, 672412350, 672672950, 672933600, 673194300, 673455050, 673715850, 673976700, 674237600, 674498550, 674759550, 675020600, 675281700, 675542850, 675804050, 676065300, 676326600, 676587950, 676849350, 677110800, 677372300, 677633850, 677895450, 678157100, 678418800, 678680550, 678942350, 679204200, 679466100, 679728050, 679990050, 680252100, 680514200, 680776350, 681038550, 681300800, 681563100, 681825450, 682087850, 682350300, 682612800, 682875350, 683137950, 683400600, 683663300, 683926050, 684188850, 684451700, 684714600, 684977550, 685240550, 685503600, 685766700, 686029850, 686293050, 686556300, 686819600, 687082950, 687346350, 687609800, 687873300, 688136850, 688400450, 688664100, 688927800, 689191550, 689455350, 689719200, 689983100, 690247050, 690511050, 690775100, 691039200, 691303350, 691567550, 691831800, 692096100, 692360450, 692624850, 692889300, 693153800, 693418350, 693682950, 693947600, 694212300, 694477050, 694741850, 695006700, 695271600, 695536550, 695801550, 696066600, 696331700, 696596850, 696862050, 697127300, 697392600, 697657950, 697923350, 698188800, 698454300, 698719850, 698985450, 699251100, 699516800, 699782550, 700048350, 700314200, 700580100, 700846050, 701112050, 701378100, 701644200, 701910350, 702176550, 702442800, 702709100, 702975450, 703241850, 703508300, 703774800, 704041350, 704307950, 704574600, 704841300, 705108050, 705374850, 705641700, 705908600, 706175550, 706442550, 706709600, 706976700, 707243850, 707511050, 707778300, 708045600, 708312950, 708580350, 708847800, 709115300, 709382850, 709650450, 709918100, 710185800, 710453550, 710721350, 710989200, 711257100, 711525050, 711793050, 712061100, 712329200, 712597350, 712865550, 713133800, 713402100, 713670450, 713938850, 714207300, 714475800, 714744350, 715012950, 715281600, 715550300, 715819050, 716087850, 716356700, 716625600, 716894550, 717163550, 717432600, 717701700, 717970850, 718240050, 718509300, 718778600, 719047950, 719317350, 719586800, 719856300, 720125850, 720395450, 720665100, 720934800, 721204550, 721474350, 721744200, 722014100, 722284050, 722554050, 722824100, 723094200, 723364350, 723634550, 723904800, 724175100, 724448513, 724715850, 724986300, 725256800, 725527350, 725797950, 726068600, 726339300, 726610050, 726880850, 727151700, 727422600, 727693550, 727964550, 728235600, 728506700, 728777850, 729049050, 729320300, 729591600, 729862950, 730134350, 730405800, 730677300, 730948850, 731220450, 731492100, 731763800, 732035550, 732307350, 732579200, 732851100, 733123050, 733395050, 733667100, 733939200, 734211350, 734483550, 734755800, 735028100, 735300450, 735572850, 735845300, 736117800, 736390350, 736662950, 736935600, 737208300, 737481050, 737753850, 738026700, 738299600, 738572550, 738845550, 739118600, 739391700, 739664850, 739938050, 740211300, 740484600, 740757950, 741031350, 741304800, 741578300, 741851850, 742125450, 742399100, 742672800, 742946550, 743220350, 743494200, 743768100, 744042050, 744316050, 744590100, 744864200, 745138350, 745412550, 745686800, 745961100, 746235450, 746509850, 746784300, 747058800, 747333350, 747607950, 747882600, 748157300, 748432050, 748706850, 748981700, 749256600, 749531550, 749806550, 750081600, 750356700, 750631850, 750907050, 751182300, 751457600, 751732950, 752008350, 752283800, 752559300, 752834850, 753110450, 753386100, 753661800, 753937550, 754213350, 754489200, 754765100, 755041050, 755317050, 755593100, 755869200, 756145350, 756421550, 756697800, 756974100, 757250450, 757526850, 757803300, 758079800, 758356350, 758632950, 758909600, 759186300, 759463050, 759739850, 760016700, 760293600, 760570550, 760847550, 761124600, 761401700, 761678850, 761956050, 762233300, 762510600, 762787950, 763065350, 763342800, 763620300, 763897850, 764175450, 764453100, 764730800, 765008550, 765286350, 765564200, 765842100, 766120050, 766398050, 766676100, 766954200, 767232350, 767510550, 767788800, 768067100, 768348513, 768623850, 768902300, 769180800, 769459350, 769737950, 770016600, 770295300, 770574050, 770852850, 771131700, 771410600, 771689550, 771968550, 772247600, 772526700, 772805850, 773085050, 773364300, 773643600, 773922950, 774202350, 774481800, 774761300, 775040850, 775320450, 775600100, 775879800, 776159550, 776439350, 776719200, 776999100, 777279050, 777559050, 777839100, 778119200, 778399350, 778679550, 778959800, 779240100, 779520450, 779800850, 780081300, 780361800, 780642350, 780922950, 781203600, 781484300, 781765050, 782045850, 782326700, 782607600, 782888550, 783169550, 783450600, 783731700, 784012850, 784294050, 784575300, 784856600, 785137950, 785419350, 785700800, 785982300, 786263850, 786548513, 786827100, 787108800, 787390550, 787672350, 787954200, 788236100, 788518050, 788800050, 789082100, 789364200, 789646350, 789928550, 790210800, 790493100, 790775450, 791057850, 791340300, 791622800, 791905350, 792187950, 792470600, 792753300, 793036050, 793318850, 793601700, 793884600, 794167550, 794450550, 794733600, 795016700, 795299850, 795583050, 795866300, 796149600, 796432950, 796716350, 796999800, 797283300, 797566850, 797850450, 798134100, 798417800, 798701550, 798985350, 799269200, 799553100, 799837050, 800121050, 800405100, 800689200, 800973350, 801257550, 801541800, 801826100, 802110450, 802394850, 802679300, 802963800, 803248350, 803532950, 803817600, 804102300, 804387050, 804671850, 804956700, 805241600, 805526550, 805811550, 806096600, 806381700, 806666850, 806952050, 807237300, 807522600, 807807950, 808093350, 808378800, 808664300, 808949850, 809235450, 809521100, 809806800, 810092550, 810378350, 810664200, 810950100, 811236050, 811522050, 811808100, 812094200, 812380350, 812666550, 812952800, 813239100, 813525450, 813811850, 814098300, 814384800, 814671350, 814957950, 815244600, 815531300, 815818050, 816104850, 816391700, 816678600, 816965550, 817252550, 817539600, 817826700, 818113850, 818401050, 818688300, 818975600, 819262950, 819550350, 819837800, 820125300, 820412850, 820700450, 820988100, 821275800, 821563550, 821851350, 822139200, 822427100, 822715050, 823003050, 823291100, 823579200, 823867350, 824155550, 824443800, 824732100, 825020450, 825308850, 825597300, 825885800, 826174350, 826462950, 826751600, 827040300, 827329050, 827617850, 827906700, 828195600, 828484550, 828773550, 829062600, 829351700, 829640850, 829930050, 830219300, 830508600, 830797950, 831087350, 831376800, 831666300, 831955850, 832248513, 832535100, 832824800, 833114550, 833404350, 833694200, 833984100, 834274050, 834564050, 834854100, 835144200, 835434350, 835724550, 836014800, 836305100, 836595450, 836885850, 837176300, 837466800, 837757350, 838047950, 838338600, 838629300, 838920050, 839210850, 839501700, 839792600, 840083550, 840374550, 840665600, 840956700, 841247850, 841539050, 841830300, 842121600, 842412950, 842704350, 842995800, 843287300, 843578850, 843870450, 844162100, 844453800, 844745550, 845037350, 845329200, 845621100, 845913050, 846205050, 846497100, 846789200, 847081350, 847373550, 847665800, 847958100, 848250450, 848542850, 848835300, 849127800, 849420350, 849712950, 850005600, 850298300, 850591050, 850883850, 851176700, 851469600, 851762550, 852055550, 852348600, 852641700, 852934850, 853228050, 853521300, 853814600, 854107950, 854401350, 854694800, 854988300, 855281850, 855575450, 855869100, 856162800, 856456550, 856750350, 857044200, 857338100, 857632050, 857926050, 858220100, 858514200, 858808350, 859102550, 859396800, 859691100, 859985450, 860279850, 860574300, 860868800, 861163350, 861457950, 861752600, 862047300, 862342050, 862636850, 862931700, 863226600, 863521550, 863816550, 864111600, 864406700, 864701850, 864997050, 865292300, 865587600, 865882950, 866178350, 866473800, 866769300, 867064850, 867360450, 867656100, 867951800, 868247550, 868543350, 868839200, 869135100, 869431050, 869727050, 870023100, 870319200, 870615350, 870911550, 871207800, 871504100, 871800450, 872096850, 872393300, 872689800, 872986350, 873282950, 873579600, 873876300, 874173050, 874469850, 874766700, 875063600, 875360550, 875657550, 875954600, 876251700, 876548850, 876846050, 877143300, 877440600, 877737950, 878035350, 878332800, 878630300, 878927850, 879225450, 879523100, 879820800, 880118550, 880416350, 880714200, 881012100, 881310050, 881608050, 881906100, 882204200, 882502350, 882800550, 883098800, 883397100, 883695450, 883993850, 884292300, 884590800, 884889350, 885187950, 885486600, 885785300, 886084050, 886382850, 886681700, 886980600, 887279550, 887578550, 887877600, 888176700, 888475850, 888775050, 889074300, 889373600, 889672950, 889972350, 890271800, 890571300, 890870850, 891170450, 891470100, 891769800, 892069550, 892369350, 892669200, 892969100, 893269050, 893569050, 893869100, 894169200, 894469350, 894769550, 895069800, 895370100, 895670450, 895970850, 896271300, 896571800, 896872350, 897172950, 897473600, 897774300, 898075050, 898375850, 898676700, 898977600, 899278550, 899579550, 899880600, 900181700, 900482850, 900784050, 901085300, 901386600, 901687950, 901989350, 902290800, 902592300, 902893850, 903195450, 903497100, 903798800, 904100550, 904402350, 904704200, 905006100, 905308050, 905610050, 905912100, 906214200, 906516350, 906818550, 907120800, 907423100, 907725450, 908027850, 908330300, 908632800, 908935350, 909237950, 909540600, 909843300, 910146050, 910448850, 910751700, 911054600, 911357550, 911660550, 911963600, 912266700, 912569850, 912873050, 913176300, 913479600, 913782950, 914086350, 914389800, 914693300, 914996850, 915300450, 915604100, 915907800, 916211550, 916515350, 916819200, 917123100, 917427050, 917731050, 918035100, 918339200, 918643350, 918947550, 919251800, 919556100, 919860450, 920164850, 920469300, 920773800, 921078350, 921382950, 921687600, 921992300, 922297050, 922601850, 922906700, 923211600, 923516550, 923821550, 924126600, 924431700, 924736850, 925042050, 925347300, 925652600, 925957950, 926263350, 926568800, 926874300, 927179850, 927485450, 927791100, 928096800, 928402550, 928708350, 929014200, 929320100, 929626050, 929932050, 930238100, 930544200, 930850350, 931156550, 931462800, 931769100, 932075450, 932381850, 932688300, 932994800, 933301350, 933607950, 933914600, 934221300, 934528050, 934834850, 935141700, 935448600, 935755550, 936062550, 936369600, 936676700, 936983850, 937291050, 937598300, 937905600, 938212950, 938520350, 938827800, 939135300, 939442850, 939750450, 940058100, 940365800, 940673550, 940981350, 941289200, 941597100, 941905050, 942213050, 942521100, 942829200, 943137350, 943445550, 943753800, 944062100, 944370450, 944678850, 944987300, 945295800, 945604350, 945912950, 946221600, 946530300, 946839050, 947147850, 947456700, 947765600, 948074550, 948383550, 948692600, 949001700, 949310850, 949620050, 949929300, 950238600, 950547950, 950857350, 951166800, 951476300, 951785850, 952095450, 952405100, 952714800, 953024550, 953334350, 953644200, 953954100, 954264050, 954574050, 954884100, 955194200, 955504350, 955814550, 956124800, 956435100, 956748513, 957055850, 957366300, 957676800, 957987350, 958297950, 958608600, 958919300, 959230050, 959540850, 959851700, 960162600, 960473550, 960784550, 961095600, 961406700, 961717850, 962029050, 962340300, 962651600, 962962950, 963274350, 963585800, 963897300, 964208850, 964520450, 964832100, 965143800, 965455550, 965767350, 966079200, 966391100, 966703050, 967015050, 967327100, 967639200, 967951350, 968263550, 968575800, 968888100, 969200450, 969512850, 969825300, 970137800, 970450350, 970762950, 971075600, 971388300, 971701050, 972013850, 972326700, 972639600, 972952550, 973265550, 973578600, 973891700, 974204850, 974518050, 974831300, 975144600, 975457950, 975771350, 976084800, 976398300, 976711850, 977025450, 977339100, 977652800, 977966550, 978280350, 978594200, 978908100, 979222050, 979536050, 979850100, 980164200, 980478350, 980792550, 981106800, 981421100, 981735450, 982049850, 982364300, 982678800, 982993350, 983307950, 983622600, 983937300, 984252050, 984566850, 984881700, 985196600, 985511550, 985826550, 986141600, 986456700, 986771850, 987087050, 987402300, 987717600, 988032950, 988348350, 988663800, 988979300, 989294850, 989610450, 989926100, 990241800, 990557550, 990873350, 991189200, 991505100, 991821050, 992137050, 992453100, 992769200, 993085350, 993401550, 993717800, 994034100, 994350450, 994666850, 994983300, 995299800, 995616350, 995932950, 996249600, 996566300, 996883050, 997199850, 997516700, 997833600, 998150550, 998467550, 998784600, 999101700, 999418850, 999736050, 1000053300, 1000370600, 1000687950, 1001005350, 1001322800, 1001640300, 1001957850, 1002275450, 1002593100, 1002910800, 1003228550, 1003546350, 1003864200, 1004182100, 1004500050, 1004818050, 1005136100, 1005454200, 1005772350, 1006090550, 1006408800, 1006727100, 1007048513, 1007363850, 1007682300, 1008000800, 1008319350, 1008637950, 1008956600, 1009275300, 1009594050, 1009912850, 1010231700, 1010550600, 1010869550, 1011188550, 1011507600, 1011826700, 1012145850, 1012465050, 1012784300, 1013103600, 1013422950, 1013742350, 1014061800, 1014381300, 1014700850, 1015020450, 1015340100, 1015659800, 1015979550, 1016299350, 1016619200, 1016939100, 1017259050, 1017579050, 1017899100, 1018219200, 1018539350, 1018859550, 1019179800, 1019500100, 1019820450, 1020140850, 1020461300, 1020781800, 1021102350, 1021422950, 1021743600, 1022064300, 1022385050, 1022705850, 1023026700, 1023347600, 1023668550, 1023989550, 1024310600, 1024631700, 1024952850, 1025274050, 1025595300, 1025916600, 1026237950, 1026559350, 1026880800, 1027202300, 1027523850, 1027848513, 1028167100, 1028488800, 1028810550, 1029132350, 1029454200, 1029776100, 1030098050, 1030420050, 1030742100, 1031064200, 1031386350, 1031708550, 1032030800, 1032353100, 1032675450, 1032997850, 1033320300, 1033642800, 1033965350, 1034287950, 1034610600, 1034933300, 1035256050, 1035578850, 1035901700, 1036224600, 1036547550, 1036870550, 1037193600, 1037516700, 1037839850, 1038163050, 1038486300, 1038809600, 1039132950, 1039456350, 1039779800, 1040103300, 1040426850, 1040750450, 1041074100, 1041397800, 1041721550, 1042045350, 1042369200, 1042693100, 1043017050, 1043341050, 1043665100, 1043989200, 1044313350, 1044637550, 1044961800, 1045286100, 1045610450, 1045934850, 1046259300, 1046583800, 1046908350, 1047232950, 1047557600, 1047882300, 1048207050, 1048531850, 1048856700, 1049181600, 1049506550, 1049831550, 1050156600, 1050481700, 1050806850, 1051132050, 1051457300, 1051782600, 1052107950, 1052433350, 1052758800, 1053084300, 1053409850, 1053735450, 1054061100, 1054386800, 1054712550, 1055038350, 1055364200, 1055690100, 1056016050, 1056342050, 1056668100, 1056994200, 1057320350, 1057646550, 1057972800, 1058299100, 1058625450, 1058951850, 1059278300, 1059604800, 1059931350, 1060257950, 1060584600, 1060911300, 1061238050, 1061564850, 1061891700, 1062218600, 1062545550, 1062872550, 1063199600, 1063526700, 1063853850, 1064181050, 1064508300, 1064835600, 1065162950, 1065490350, 1065817800, 1066145300, 1066472850, 1066800450, 1067128100, 1067455800, 1067783550, 1068111350, 1068439200, 1068767100, 1069095050, 1069423050, 1069751100, 1070079200, 1070407350, 1070735550, 1071063800, 1071392100, 1071720450, 1072048850, 1072377300, 1072705800, 1073034350, 1073362950, 1073691600, 1074020300, 1074349050, 1074677850, 1075006700, 1075335600, 1075664550, 1075993550, 1076322600, 1076651700, 1076980850, 1077310050, 1077639300, 1077968600, 1078297950, 1078627350, 1078956800, 1079286300, 1079615850, 1079948513, 1080275100, 1080604800, 1080934550, 1081264350, 1081594200, 1081924100, 1082254050, 1082584050, 1082914100, 1083244200, 1083574350, 1083904550, 1084234800, 1084565100, 1084895450, 1085225850, 1085556300, 1085886800, 1086217350, 1086547950, 1086878600, 1087209300, 1087540050, 1087870850, 1088201700, 1088532600, 1088863550, 1089194550, 1089525600, 1089856700, 1090187850, 1090519050, 1090850300, 1091181600, 1091512950, 1091844350, 1092175800, 1092507300, 1092838850, 1093170450, 1093502100, 1093833800, 1094165550, 1094497350, 1094829200, 1095161100, 1095493050, 1095825050, 1096157100, 1096489200, 1096821350, 1097153550, 1097485800, 1097818100, 1098150450, 1098482850, 1098815300, 1099147800, 1099480350, 1099812950, 1100145600, 1100478300, 1100811050, 1101143850, 1101476700, 1101809600, 1102142550, 1102475550, 1102808600, 1103141700, 1103474850, 1103808050, 1104141300, 1104474600, 1104807950, 1105141350, 1105474800, 1105808300, 1106141850, 1106475450, 1106809100, 1107142800, 1107476550, 1107810350, 1108144200, 1108478100, 1108812050, 1109146050, 1109480100, 1109814200, 1110148350, 1110482550, 1110816800, 1111151100, 1111485450, 1111819850, 1112154300, 1112488800, 1112823350, 1113157950, 1113492600, 1113827300, 1114162050, 1114496850, 1114831700, 1115166600, 1115501550, 1115836550, 1116171600, 1116506700, 1116841850, 1117177050, 1117512300, 1117847600, 1118182950, 1118518350, 1118853800, 1119189300, 1119524850, 1119860450, 1120196100, 1120531800, 1120867550, 1121203350, 1121539200, 1121875100, 1122211050, 1122547050, 1122883100, 1123219200, 1123555350, 1123891550, 1124227800, 1124564100, 1124900450, 1125236850, 1125573300, 1125909800, 1126246350, 1126582950, 1126919600, 1127256300, 1127593050, 1127929850, 1128266700, 1128603600, 1128940550, 1129277550, 1129614600, 1129951700, 1130288850, 1130626050, 1130963300, 1131300600, 1131637950, 1131975350, 1132312800, 1132650300, 1132987850, 1133325450, 1133663100, 1134000800, 1134338550, 1134676350, 1135014200, 1135352100, 1135690050, 1136028050, 1136366100, 1136704200, 1137042350, 1137380550, 1137718800, 1138057100, 1138395450, 1138733850, 1139072300, 1139410800, 1139749350, 1140087950, 1140426600, 1140765300, 1141104050, 1141442850, 1141781700, 1142120600, 1142459550, 1142798550, 1143137600, 1143476700, 1143815850, 1144155050, 1144494300, 1144833600, 1145172950, 1145512350, 1145851800, 1146191300, 1146530850, 1146870450, 1147210100, 1147549800, 1147889550, 1148229350, 1148569200, 1148909100, 1149249050, 1149589050, 1149929100, 1150269200, 1150609350, 1150949550, 1151289800, 1151630100, 1151970450, 1152310850, 1152651300, 1152991800, 1153332350, 1153672950, 1154013600, 1154354300, 1154695050, 1155035850, 1155376700, 1155717600, 1156058550, 1156399550, 1156740600, 1157081700, 1157422850, 1157764050, 1158105300, 1158446600, 1158787950, 1159129350, 1159470800, 1159812300, 1160153850, 1160495450, 1160837100, 1161178800, 1161520550, 1161862350, 1162204200, 1162546100, 1162888050, 1163230050, 1163572100, 1163914200, 1164256350, 1164598550, 1164940800, 1165283100, 1165625450, 1165967850, 1166310300, 1166652800, 1166995350, 1167337950, 1167680600, 1168023300, 1168366050, 1168708850, 1169051700, 1169394600, 1169737550, 1170080550, 1170423600, 1170766700, 1171109850, 1171453050, 1171796300, 1172139600, 1172482950, 1172826350, 1173169800, 1173513300, 1173856850, 1174200450, 1174544100, 1174887800, 1175231550, 1175575350, 1175919200, 1176263100, 1176607050, 1176951050, 1177295100, 1177639200, 1177983350, 1178327550, 1178671800, 1179016100, 1179360450, 1179704850, 1180049300, 1180393800, 1180738350, 1181082950, 1181427600, 1181772300, 1182117050, 1182461850, 1182806700, 1183151600, 1183496550, 1183841550, 1184186600, 1184531700, 1184876850, 1185222050, 1185567300, 1185912600, 1186257950, 1186603350, 1186948800, 1187294300, 1187639850, 1187985450, 1188331100, 1188676800, 1189022550, 1189368350, 1189714200, 1190060100, 1190406050, 1190752050, 1191098100, 1191444200, 1191790350, 1192136550, 1192482800, 1192829100, 1193175450, 1193521850, 1193868300, 1194214800, 1194561350, 1194907950, 1195254600, 1195601300, 1195948050, 1196294850, 1196641700, 1196988600, 1197335550, 1197682550, 1198029600, 1198376700, 1198723850, 1199071050, 1199418300, 1199765600, 1200112950, 1200460350, 1200807800, 1201155300, 1201502850, 1201850450, 1202198100, 1202545800, 1202893550, 1203241350, 1203589200, 1203937100, 1204285050, 1204633050, 1204981100, 1205329200, 1205677350, 1206025550, 1206373800, 1206722100, 1207070450, 1207418850, 1207767300, 1208115800, 1208464350, 1208812950, 1209161600, 1209510300, 1209859050, 1210207850, 1210556700, 1210905600, 1211254550, 1211603550, 1211952600, 1212301700, 1212650850, 1213000050, 1213349300, 1213698600, 1214047950, 1214397350, 1214746800, 1215096300, 1215445850, 1215795450, 1216145100, 1216494800, 1216844550, 1217194350, 1217544200, 1217894100, 1218244050, 1218594050, 1218944100, 1219294200, 1219644350, 1219994550, 1220344800, 1220695100, 1221048513, 1221395850, 1221746300, 1222096800, 1222447350, 1222797950, 1223148600, 1223499300, 1223850050, 1224200850, 1224551700, 1224902600, 1225253550, 1225604550, 1225955600, 1226306700, 1226657850, 1227009050, 1227360300, 1227711600, 1228062950, 1228414350, 1228765800, 1229117300, 1229468850, 1229820450, 1230172100, 1230523800, 1230875550, 1231227350, 1231579200, 1231931100, 1232283050, 1232635050, 1232987100, 1233339200, 1233691350, 1234043550, 1234395800, 1234748100, 1235100450, 1235452850, 1235805300, 1236157800, 1236510350, 1236862950, 1237215600, 1237568300, 1237921050, 1238273850, 1238626700, 1238979600, 1239332550, 1239685550, 1240038600, 1240391700, 1240744850, 1241098050, 1241451300, 1241804600, 1242157950, 1242511350, 1242864800, 1243218300, 1243571850, 1243925450, 1244279100, 1244632800, 1244986550, 1245340350, 1245694200, 1246048100, 1246402050, 1246756050, 1247110100, 1247464200, 1247818350, 1248172550, 1248526800, 1248881100, 1249235450, 1249589850, 1249944300, 1250298800, 1250653350, 1251007950, 1251362600, 1251717300, 1252072050, 1252426850, 1252781700, 1253136600, 1253491550, 1253846550, 1254201600, 1254556700, 1254911850, 1255267050, 1255622300, 1255977600, 1256332950, 1256688350, 1257043800, 1257399300, 1257754850, 1258110450, 1258466100, 1258821800, 1259177550, 1259533350, 1259889200, 1260245100, 1260601050, 1260957050, 1261313100, 1261669200, 1262025350, 1262381550, 1262737800, 1263094100, 1263450450, 1263806850, 1264163300, 1264519800, 1264876350, 1265232950, 1265589600, 1265946300, 1266303050, 1266659850, 1267016700, 1267373600, 1267730550, 1268087550, 1268444600, 1268801700, 1269158850, 1269516050, 1269873300, 1270230600, 1270587950, 1270945350, 1271302800, 1271660300, 1272017850, 1272375450, 1272733100, 1273090800, 1273448550, 1273806350, 1274164200, 1274522100, 1274880050, 1275238050, 1275596100, 1275954200, 1276312350, 1276670550, 1277028800, 1277387100, 1277748513, 1278103850, 1278462300, 1278820800, 1279179350, 1279537950, 1279896600, 1280255300, 1280614050, 1280972850, 1281331700, 1281690600, 1282049550, 1282408550, 1282767600, 1283126700, 1283485850, 1283845050, 1284204300, 1284563600, 1284922950, 1285282350, 1285641800, 1286001300, 1286360850, 1286720450, 1287080100, 1287439800, 1287799550, 1288159350, 1288519200, 1288879100, 1289239050, 1289599050, 1289959100, 1290319200, 1290679350, 1291039550, 1291399800, 1291760100, 1292120450, 1292480850, 1292841300, 1293201800, 1293562350, 1293922950, 1294283600, 1294644300, 1295005050, 1295365850, 1295726700, 1296087600, 1296448550, 1296809550, 1297170600, 1297531700, 1297892850, 1298254050, 1298615300, 1298976600, 1299337950, 1299699350, 1300060800, 1300422300, 1300783850, 1301148513, 1301507100, 1301868800, 1302230550, 1302592350, 1302954200, 1303316100, 1303678050, 1304040050, 1304402100, 1304764200, 1305126350, 1305488550, 1305850800, 1306213100, 1306575450, 1306937850, 1307300300, 1307662800, 1308025350, 1308387950, 1308750600, 1309113300, 1309476050, 1309838850, 1310201700, 1310564600, 1310927550, 1311290550, 1311653600, 1312016700, 1312379850, 1312743050, 1313106300, 1313469600, 1313832950, 1314196350, 1314559800, 1314923300, 1315286850, 1315650450, 1316014100, 1316377800, 1316741550, 1317105350, 1317469200, 1317833100, 1318197050, 1318561050, 1318925100, 1319289200, 1319653350, 1320017550, 1320381800, 1320746100, 1321110450, 1321474850, 1321839300, 1322203800, 1322568350, 1322932950, 1323297600, 1323662300, 1324027050, 1324391850, 1324756700, 1325121600, 1325486550, 1325851550, 1326216600, 1326581700, 1326946850, 1327312050, 1327677300, 1328042600, 1328407950, 1328773350, 1329138800, 1329504300, 1329869850, 1330235450, 1330601100, 1330966800, 1331332550, 1331698350, 1332064200, 1332430100, 1332796050, 1333162050, 1333528100, 1333894200, 1334260350, 1334626550, 1334992800, 1335359100, 1335725450, 1336091850, 1336458300, 1336824800, 1337191350, 1337557950, 1337924600, 1338291300, 1338658050, 1339024850, 1339391700, 1339758600, 1340125550, 1340492550, 1340859600, 1341226700, 1341593850, 1341961050, 1342328300, 1342695600, 1343062950, 1343430350, 1343797800, 1344165300, 1344532850, 1344900450, 1345268100, 1345635800, 1346003550, 1346371350, 1346739200, 1347107100, 1347475050, 1347843050, 1348211100, 1348579200, 1348947350, 1349315550, 1349683800, 1350052100, 1350420450, 1350788850, 1351157300, 1351525800, 1351894350, 1352262950, 1352631600, 1353000300, 1353369050, 1353737850, 1354106700, 1354475600, 1354844550, 1355213550, 1355582600, 1355951700, 1356320850, 1356690050, 1357059300, 1357428600, 1357797950, 1358167350, 1358536800, 1358906300, 1359275850, 1359648513, 1360015100, 1360384800, 1360754550, 1361124350, 1361494200, 1361864100, 1362234050, 1362604050, 1362974100, 1363344200, 1363714350, 1364084550, 1364454800, 1364825100, 1365195450, 1365565850, 1365936300, 1366306800, 1366677350, 1367047950, 1367418600, 1367789300, 1368160050, 1368530850, 1368901700, 1369272600, 1369643550, 1370014550, 1370385600, 1370756700, 1371127850, 1371499050, 1371870300, 1372241600, 1372612950, 1372984350, 1373355800, 1373727300, 1374098850, 1374470450, 1374842100, 1375213800, 1375585550, 1375957350, 1376329200, 1376701100, 1377073050, 1377445050, 1377817100, 1378189200, 1378561350, 1378933550, 1379305800, 1379678100, 1380050450, 1380422850, 1380795300, 1381167800, 1381540350, 1381912950, 1382285600, 1382658300, 1383031050, 1383403850, 1383776700, 1384149600, 1384522550, 1384895550, 1385268600, 1385641700, 1386014850, 1386388050, 1386761300, 1387134600, 1387507950, 1387881350, 1388254800, 1388628300, 1389001850, 1389375450, 1389749100, 1390122800, 1390496550, 1390870350, 1391244200, 1391618100, 1391992050, 1392366050, 1392740100, 1393114200, 1393488350, 1393862550, 1394236800, 1394611100, 1394985450, 1395359850, 1395734300, 1396108800, 1396483350, 1396857950, 1397232600, 1397607300, 1397982050, 1398356850, 1398731700, 1399106600, 1399481550, 1399856550, 1400231600, 1400606700, 1400981850, 1401357050, 1401732300, 1402107600, 1402482950, 1402858350, 1403233800, 1403609300, 1403984850, 1404360450, 1404736100, 1405111800, 1405487550, 1405863350, 1406239200, 1406615100, 1406991050, 1407367050, 1407743100, 1408119200, 1408495350, 1408871550, 1409247800, 1409624100, 1410000450, 1410376850, 1410753300, 1411129800, 1411506350, 1411882950, 1412259600, 1412636300, 1413013050, 1413389850, 1413766700, 1414143600, 1414520550, 1414897550, 1415274600, 1415651700, 1416028850, 1416406050, 1416783300, 1417160600, 1417537950, 1417915350, 1418292800, 1418670300, 1419047850, 1419425450, 1419803100, 1420180800, 1420558550, 1420936350, 1421314200, 1421692100, 1422070050, 1422448050, 1422826100, 1423204200, 1423582350, 1423960550, 1424338800, 1424717100, 1425095450, 1425473850, 1425852300, 1426230800, 1426609350, 1426987950, 1427366600, 1427745300, 1428124050, 1428502850, 1428881700, 1429260600, 1429639550, 1430018550, 1430397600, 1430776700, 1431155850, 1431535050, 1431914300, 1432293600, 1432672950, 1433052350, 1433431800, 1433811300, 1434190850, 1434570450, 1434950100, 1435329800, 1435709550, 1436089350, 1436469200, 1436849100, 1437229050, 1437609050, 1437989100, 1438369200, 1438749350, 1439129550, 1439509800, 1439890100, 1440270450, 1440650850, 1441031300, 1441411800, 1441792350, 1442172950, 1442553600, 1442934300, 1443315050, 1443695850, 1444076700, 1444457600, 1444838550, 1445219550, 1445600600, 1445981700, 1446362850, 1446744050, 1447125300, 1447506600, 1447887950, 1448269350, 1448650800, 1449032300, 1449413850, 1449795450, 1450177100, 1450558800, 1450940550, 1451322350, 1451704200, 1452086100, 1452468050, 1452850050, 1453232100, 1453614200, 1453996350, 1454378550, 1454760800, 1455143100, 1455525450, 1455907850, 1456290300, 1456672800, 1457055350, 1457437950, 1457820600, 1458203300, 1458586050, 1458968850, 1459351700, 1459734600, 1460117550, 1460500550, 1460883600, 1461266700, 1461649850, 1462033050, 1462416300, 1462799600, 1463182950, 1463566350, 1463949800, 1464333300, 1464716850, 1465100450, 1465484100, 1465867800, 1466251550, 1466635350, 1467019200, 1467403100, 1467787050, 1468171050, 1468555100, 1468939200, 1469323350, 1469707550, 1470091800, 1470476100, 1470860450, 1471244850, 1471629300, 1472013800, 1472398350, 1472782950, 1473167600, 1473552300, 1473937050, 1474321850, 1474706700, 1475091600, 1475476550, 1475861550, 1476246600, 1476631700, 1477016850, 1477402050, 1477787300, 1478172600, 1478557950, 1478943350, 1479328800, 1479714300, 1480099850, 1480485450, 1480871100, 1481256800, 1481642550, 1482028350, 1482414200, 1482800100, 1483186050, 1483572050, 1483958100, 1484344200, 1484730350, 1485116550, 1485502800, 1485889100, 1486275450, 1486661850, 1487048300, 1487434800, 1487821350, 1488207950, 1488594600, 1488981300, 1489368050, 1489754850, 1490141700, 1490528600, 1490915550, 1491302550, 1491689600, 1492076700, 1492463850, 1492851050, 1493238300, 1493625600, 1494012950, 1494400350, 1494787800, 1495175300, 1495562850, 1495950450, 1496338100, 1496725800, 1497113550, 1497501350, 1497889200, 1498277100, 1498665050, 1499053050, 1499441100, 1499829200, 1500217350, 1500605550, 1500993800, 1501382100, 1501770450, 1502158850, 1502547300, 1502935800, 1503324350, 1503712950, 1504101600, 1504490300, 1504879050, 1505267850, 1505656700, 1506045600, 1506434550, 1506823550, 1507212600, 1507601700, 1507990850, 1508380050, 1508769300, 1509158600, 1509547950, 1509937350, 1510326800, 1510716300, 1511105850, 1511495450, 1511885100, 1512274800, 1512664550, 1513054350, 1513444200, 1513834100, 1514224050, 1514614050, 1515004100, 1515394200, 1515784350, 1516174550, 1516564800, 1516955100, 1517348513, 1517735850, 1518126300, 1518516800, 1518907350, 1519297950, 1519688600, 1520079300, 1520470050, 1520860850, 1521251700, 1521642600, 1522033550, 1522424550, 1522815600, 1523206700, 1523597850, 1523989050, 1524380300, 1524771600, 1525162950, 1525554350, 1525945800, 1526337300, 1526728850, 1527120450, 1527512100, 1527903800, 1528295550, 1528687350, 1529079200, 1529471100, 1529863050, 1530255050, 1530647100, 1531039200, 1531431350, 1531823550, 1532215800, 1532608100, 1533000450, 1533392850, 1533785300, 1534177800, 1534570350, 1534962950, 1535355600, 1535748300, 1536141050, 1536533850, 1536926700, 1537319600, 1537712550, 1538105550, 1538498600, 1538891700, 1539284850, 1539678050, 1540071300, 1540464600, 1540857950, 1541251350, 1541644800, 1542038300, 1542431850, 1542825450, 1543219100, 1543612800, 1544006550, 1544400350, 1544794200, 1545188100, 1545582050, 1545976050, 1546370100, 1546764200, 1547158350, 1547552550, 1547946800, 1548341100, 1548735450, 1549129850, 1549524300, 1549918800, 1550313350, 1550707950, 1551102600, 1551497300, 1551892050, 1552286850, 1552681700, 1553076600, 1553471550, 1553866550, 1554261600, 1554656700, 1555051850, 1555447050, 1555842300, 1556237600, 1556632950, 1557028350, 1557423800, 1557819300, 1558214850, 1558610450, 1559006100, 1559401800, 1559797550, 1560193350, 1560589200, 1560985100, 1561381050, 1561777050, 1562173100, 1562569200, 1562965350, 1563361550, 1563757800, 1564154100, 1564550450, 1564946850, 1565343300, 1565739800, 1566136350, 1566532950, 1566929600, 1567326300, 1567723050, 1568119850, 1568516700, 1568913600, 1569310550, 1569707550, 1570104600, 1570501700, 1570898850, 1571296050, 1571693300, 1572090600, 1572487950, 1572885350, 1573282800, 1573680300, 1574077850, 1574475450, 1574873100, 1575270800, 1575668550, 1576066350, 1576464200, 1576862100, 1577260050, 1577658050, 1578056100, 1578454200, 1578852350, 1579250550, 1579648800, 1580047100, 1580448513, 1580843850, 1581242300, 1581640800, 1582039350, 1582437950, 1582836600, 1583235300, 1583634050, 1584032850, 1584431700, 1584830600, 1585229550, 1585628550, 1586027600, 1586426700, 1586825850, 1587225050, 1587624300, 1588023600, 1588422950, 1588822350, 1589221800, 1589621300, 1590020850, 1590420450, 1590820100, 1591219800, 1591619550, 1592019350, 1592419200, 1592819100, 1593219050, 1593619050, 1594019100, 1594419200, 1594819350, 1595219550, 1595619800, 1596020100, 1596420450, 1596820850, 1597221300, 1597621800, 1598022350, 1598422950, 1598823600, 1599224300, 1599625050, 1600025850, 1600426700, 1600827600, 1601228550, 1601629550, 1602030600, 1602431700, 1602832850, 1603234050, 1603635300, 1604036600, 1604437950, 1604839350, 1605240800, 1605642300, 1606043850, 1606448513, 1606847100, 1607248800, 1607650550, 1608052350, 1608454200, 1608856100, 1609258050, 1609660050, 1610062100, 1610464200, 1610866350, 1611268550, 1611670800, 1612073100, 1612475450, 1612877850, 1613280300, 1613682800, 1614085350, 1614487950, 1614890600, 1615293300, 1615696050, 1616098850, 1616501700, 1616904600, 1617307550, 1617710550, 1618113600, 1618516700, 1618919850, 1619323050, 1619726300, 1620129600, 1620532950, 1620936350, 1621339800, 1621743300, 1622146850, 1622550450, 1622954100, 1623357800, 1623761550, 1624165350, 1624569200, 1624973100, 1625377050, 1625781050, 1626185100, 1626589200, 1626993350, 1627397550, 1627801800, 1628206100, 1628610450, 1629014850, 1629419300, 1629823800, 1630228350, 1630632950, 1631037600, 1631442300, 1631847050, 1632251850, 1632656700, 1633061600, 1633466550, 1633871550, 1634276600, 1634681700, 1635086850, 1635492050, 1635897300, 1636302600, 1636707950, 1637113350, 1637518800, 1637924300, 1638329850, 1638735450, 1639141100, 1639546800, 1639952550, 1640358350, 1640764200, 1641170100, 1641576050, 1641982050, 1642388100, 1642794200, 1643200350, 1643606550, 1644012800, 1644419100, 1644825450, 1645231850, 1645638300, 1646044800, 1646451350, 1646857950, 1647264600, 1647671300, 1648078050, 1648484850, 1648891700, 1649298600, 1649705550, 1650112550, 1650519600, 1650926700, 1651333850, 1651741050, 1652148300, 1652555600, 1652962950, 1653370350, 1653777800, 1654185300, 1654592850, 1655000450, 1655408100, 1655815800, 1656223550, 1656631350, 1657039200, 1657447100, 1657855050, 1658263050, 1658671100, 1659079200, 1659487350, 1659895550, 1660303800, 1660712100, 1661120450, 1661528850, 1661937300, 1662345800, 1662754350, 1663162950, 1663571600, 1663980300, 1664389050, 1664797850, 1665206700, 1665615600, 1666024550, 1666433550, 1666842600, 1667251700, 1667660850, 1668070050, 1668479300, 1668888600, 1669297950, 1669707350, 1670116800, 1670526300, 1670935850, 1671348513, 1671755100, 1672164800, 1672574550, 1672984350, 1673394200, 1673804100, 1674214050, 1674624050, 1675034100, 1675444200, 1675854350, 1676264550, 1676674800, 1677085100, 1677495450, 1677905850, 1678316300, 1678726800, 1679137350, 1679547950, 1679958600, 1680369300, 1680780050, 1681190850, 1681601700, 1682012600, 1682423550, 1682834550, 1683245600, 1683656700, 1684067850, 1684479050, 1684890300, 1685301600, 1685712950, 1686124350, 1686535800, 1686947300, 1687358850, 1687770450, 1688182100, 1688593800, 1689005550, 1689417350, 1689829200, 1690241100, 1690653050, 1691065050, 1691477100, 1691889200, 1692301350, 1692713550, 1693125800, 1693538100, 1693950450, 1694362850, 1694775300, 1695187800, 1695600350, 1696012950, 1696425600, 1696838300, 1697251050, 1697663850, 1698076700, 1698489600, 1698902550, 1699315550, 1699728600, 1700141700, 1700554850, 1700968050, 1701381300, 1701794600, 1702207950, 1702621350, 1703034800, 1703448300, 1703861850, 1704275450, 1704689100, 1705102800, 1705516550, 1705930350, 1706344200, 1706758100, 1707172050, 1707586050, 1708000100, 1708414200, 1708828350, 1709242550, 1709656800, 1710071100, 1710485450, 1710899850, 1711314300, 1711728800, 1712143350, 1712557950, 1712972600, 1713387300, 1713802050, 1714216850, 1714631700, 1715046600, 1715461550, 1715876550, 1716291600, 1716706700, 1717121850, 1717537050, 1717952300, 1718367600, 1718782950, 1719198350, 1719613800, 1720029300, 1720444850, 1720860450, 1721276100, 1721691800, 1722107550, 1722523350, 1722939200, 1723355100, 1723771050, 1724187050, 1724603100, 1725019200, 1725435350, 1725851550, 1726267800, 1726684100, 1727100450, 1727516850, 1727933300, 1728349800, 1728766350, 1729182950, 1729599600, 1730016300, 1730433050, 1730849850, 1731266700, 1731683600, 1732100550, 1732517550, 1732934600, 1733351700, 1733768850, 1734186050, 1734603300, 1735020600, 1735437950, 1735855350, 1736272800, 1736690300, 1737107850, 1737525450, 1737943100, 1738360800, 1738778550, 1739196350, 1739614200, 1740032100, 1740450050, 1740868050, 1741286100, 1741704200, 1742122350, 1742540550, 1742958800, 1743377100, 1743795450, 1744213850, 1744632300, 1745050800, 1745469350, 1745887950, 1746306600, 1746725300, 1747144050, 1747562850, 1747981700, 1748400600, 1748819550, 1749238550, 1749657600, 1750076700, 1750495850, 1750915050, 1751334300, 1751753600, 1752172950, 1752592350, 1753011800, 1753431300, 1753850850, 1754270450, 1754690100, 1755109800, 1755529550, 1755949350, 1756369200, 1756789100, 1757209050, 1757629050, 1758049100, 1758469200, 1758889350, 1759309550, 1759729800, 1760150100, 1760570450, 1760990850, 1761411300, 1761831800, 1762252350, 1762672950, 1763093600, 1763514300, 1763935050, 1764355850, 1764776700, 1765197600, 1765618550, 1766039550, 1766460600, 1766881700, 1767302850, 1767724050, 1768145300, 1768566600, 1768987950, 1769409350, 1769830800, 1770252300, 1770673850, 1771095450, 1771517100, 1771938800, 1772360550, 1772782350, 1773204200, 1773626100, 1774048050, 1774470050, 1774892100, 1775314200, 1775736350, 1776158550, 1776580800, 1777003100, 1777425450, 1777847850, 1778270300, 1778692800, 1779115350, 1779537950, 1779960600, 1780383300, 1780806050, 1781228850, 1781651700, 1782074600, 1782497550, 1782920550, 1783343600, 1783766700, 1784189850, 1784613050, 1785036300, 1785459600, 1785882950, 1786306350, 1786729800, 1787153300, 1787576850}
			--I just couldn't find the right global, so that's why you see "RPtoRank" list here

	CrewRank:add_bare_item("",
		function()
				CurrentCrewRP = stats.get_int("MPPLY_CREW_LOCAL_XP_" .. a77)
				CurrentCrewRank = 0
			for i = 1, 8000 do
				if CurrentCrewRP < RPtoRank[i] then
					break
				else
					CurrentCrewRank = i
				end
			end
			return "Selected Crew Rank: " .. CurrentCrewRank
		end, null, null, null)

			NumberList1 = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
			NumberList2 = {0, 1, 2, 3, 4, 5, 6, 7, 8}

			DefNum33 = NumberList2[1]
			DefNum33Cur = 1
	CrewRank:add_array_item("Number #1", NumberList2,
		function()
			return DefNum33Cur
		end,
		function(NewNum33)
			DefNum33 = NumberList2[NewNum33]
			DefNum33Cur = NewNum33
		end)

			DefNum34 = NumberList1[1]
			DefNum34Cur = 1
	CrewRank:add_array_item("Number #2", NumberList1,
		function()
			return DefNum34Cur
		end,
		function(NewNum34)
			DefNum34 = NumberList1[NewNum34]
			DefNum34Cur = NewNum34
		end)

			DefNum35 = NumberList1[1]
			DefNum35Cur = 1
	CrewRank:add_array_item("Number #3", NumberList1,
		function()
			return DefNum35Cur
		end,
		function(NewNum35)
			DefNum35 = NumberList1[NewNum35]
			DefNum35Cur = NewNum35
		end)

			DefNum36 = NumberList1[1]
			DefNum36Cur = 1
	CrewRank:add_array_item("Number #4", NumberList1,
		function()
			return DefNum36Cur
		end,
		function(NewNum36)
			DefNum36 = NumberList1[NewNum36]
			DefNum36Cur = NewNum36
		end)

	CrewRank:add_bare_item("",
		function()
			if DefNum33 == 0 then
				NewCrewRank = tonumber(DefNum34 .. DefNum35 .. DefNum36)
			else
				NewCrewRank = tonumber(DefNum33 .. DefNum34 .. DefNum35 .. DefNum36)
			end
			if NewCrewRank == 0 then
				NewCrewRank = "Not Selected"
			end
			return "Set Crew Rank: " .. NewCrewRank
		end,
		function()
			stats.set_int("MPPLY_CREW_LOCAL_XP_" .. a77, RPtoRank[NewCrewRank])
			if a78 == true then
				sleep(1)
				DefNum33Cur = 1
				DefNum34Cur = 1
				DefNum35Cur = 1
				DefNum36Cur = 1
				DefNum33 = NumberList2[1]
				DefNum34 = NumberList1[1]
				DefNum35 = NumberList1[1]
				DefNum36 = NumberList1[1]
			end
		end, null, null)

			a78 = true
	CrewRank:add_toggle("Reset Value", function() return a78 end, function() a78 = not a78 end)

	CrewRank:add_action("", null)

	CrewRankNote = CrewRank:add_submenu("Read Me")

	CrewRankNote:add_action("     Select one of five crews and set rank;", null)
	CrewRankNote:add_action(" you may need to change session to apply", null)
	CrewRankNote:add_action("", null)
	CrewRankNote:add_action("                        Reset Value:", null)
	CrewRankNote:add_action("  Resets «Set Crew Rank» value after using", null)
	CrewRankNote:add_action("  Credits: SilentSalo", null)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SelfRX = RMenu:add_submenu("Fast Run Ability Unlock Menu")

SelfRX:add_action("Fast Run and Reload", function()
	stats.set_int(MPX .. "CHAR_ABILITY_1_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_ABILITY_2_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_ABILITY_3_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_FM_ABILITY_1_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_FM_ABILITY_2_UNLCK", -1)
	stats.set_int(MPX .. "CHAR_FM_ABILITY_3_UNLCK", -1)
	globals.set_int(1575032, 1)
	globals.set_int(1574589, 1)
	sleep(0.2)
	globals.set_int(1574589, 0)
end)

SelfRX:add_action("Reset Fast Run And Reload", function()
	stats.set_int(MPX .. "CHAR_ABILITY_1_UNLCK", 0)
	stats.set_int(MPX .. "CHAR_ABILITY_2_UNLCK", 0)
	stats.set_int(MPX .. "CHAR_ABILITY_3_UNLCK", 0)
	stats.set_int(MPX .. "CHAR_FM_ABILITY_1_UNLCK", 0)
	stats.set_int(MPX .. "CHAR_FM_ABILITY_2_UNLCK", 0)
	stats.set_int(MPX .. "CHAR_FM_ABILITY_3_UNLCK", 0)
	globals.set_int(1575032, 1)
	globals.set_int(1574589, 1)
	sleep(0.2)
	globals.set_int(1574589, 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

statMenu = RMenu:add_submenu("Online Stats Editor Menu")
normalstat = statMenu:add_submenu("Character Data Editor Menu")
distancestat = statMenu:add_submenu("Distance Data Editor Menu")
timestat = statMenu:add_submenu("Time Data Editor Menu")


normalstat:add_int_range("Earned Money", 500000, 0, 2147483647, function()
	return stats.get_int("MPPLY_TOTAL_EVC")
end, function(value)
	stats.set_int("MPPLY_TOTAL_EVC", value)
end)
normalstat:add_int_range("Spent Money", 500000, 0, 2147483647, function()
	return stats.get_int("MPPLY_TOTAL_SVC")
end, function(value)
	stats.set_int("MPPLY_TOTAL_SVC", value)
end)
normalstat:add_int_range("Players Killed", 10, 0, 999999, function()
	return stats.get_int("MPPLY_KILLS_PLAYERS")
end, function(value)
	stats.set_int("MPPLY_KILLS_PLAYERS", value)
end)
normalstat:add_int_range("Deatsh per player", 10, 0, 999999, function()
	return stats.get_int("MPPLY_DEATHS_PLAYER")
end, function(value)
	stats.set_int("MPPLY_DEATHS_PLAYER", value)
end)
normalstat:add_float_range("PvP K/D Ratio", 0.01, 0, 9999, function()
	return stats.get_float("MPPLY_KILL_DEATH_RATIO")
end, function(value)
	stats.set_float("MPPLY_KILL_DEATH_RATIO", value)
end)
normalstat:add_int_range("Deathmatches Published", 10, 0, 999999, function()
	return stats.get_int("MPPLY_AWD_FM_CR_DM_MADE")
end, function(value)
	stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", value)
end)
normalstat:add_int_range("Races Published", 10, 0, 999999, function()
	return stats.get_int("MPPLY_AWD_FM_CR_RACES_MADE")
end, function(value)
	stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", value)
end)
normalstat:add_int_range("Screenshots Published", 10, 0, 999999, function()
	return stats.get_int("MPPLY_NUM_CAPTURES_CREATED")
end, function(value)
	stats.set_int("MPPLY_NUM_CAPTURES_CREATED", value)
end)
normalstat:add_int_range("LTS Published", 10, 0, 999999, function()
	return stats.get_int("MPPLY_LTS_CREATED")
end, function(value)
	stats.set_int("MPPLY_LTS_CREATED", value)
end)
normalstat:add_int_range("Persons who have played your misions", 10, 0, 999999, function()
	return stats.get_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP")
end, function(value)
	stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", value)
end)
normalstat:add_int_range("Likes to missions", 10, 0, 999999, function()
	return stats.get_int("MPPLY_AWD_FM_CR_MISSION_SCORE")
end, function(value)
	stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", value)
end)
normalstat:add_action("-{Change Session to apply}", function() end)

distancestat:add_float_range("Traveled (metters)", 10.00, 0.00, 99999.00, function()
	return stats.get_float("MPPLY_CHAR_DIST_TRAVELLED") / 1000
end, function(value)
	stats.set_float("MPPLY_CHAR_DIST_TRAVELLED", value * 1000)
end)
distancestat:add_float_range("Swiming", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_SWIMMING") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_SWIMMING", value * 1000)
end)
distancestat:add_float_range("Walking", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_WALKING") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_WALKING", value * 1000)
end)
distancestat:add_float_range("Running", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_RUNNING") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_RUNNING", value * 1000)
end)
distancestat:add_float_range("Highest fall without dying", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "LONGEST_SURVIVED_FREEFALL")
end, function(value)
	stats.set_float(MPX .. "LONGEST_SURVIVED_FREEFALL", value)
end)
distancestat:add_float_range("Driving Cars", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_CAR") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_CAR", value * 1000)
end)
distancestat:add_float_range("Driving motorbikes", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_BIKE") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_BIKE", value * 1000)
end)
distancestat:add_float_range("Flying Helicopters", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_HELI") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_HELI", value * 1000)
end)
distancestat:add_float_range("Flying Planes", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_PLANE") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_PLANE", value * 1000)
end)
distancestat:add_float_range("Driving Botes", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_BOAT") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_BOAT", value * 1000)
end)
distancestat:add_float_range("Driving ATVs", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_QUADBIKE") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_QUADBIKE", value * 1000)
end)
distancestat:add_float_range("Driving Bicycles", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "DIST_BICYCLE") / 1000
end, function(value)
	stats.set_float(MPX .. "DIST_BICYCLE", value * 1000)
end)
distancestat:add_float_range("Longest Front Willie", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "LONGEST_STOPPIE_DIST") / 1000
end, function(value)
	stats.set_float(MPX .. "LONGEST_STOPPIE_DIST", value * 1000)
end)
distancestat:add_float_range("Longest Willie", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "LONGEST_WHEELIE_DIST") / 1000
end, function(value)
	stats.set_float(MPX .. "LONGEST_WHEELIE_DIST", value * 1000)
end)
distancestat:add_float_range("Largest driving without crashing", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "LONGEST_DRIVE_NOCRASH") / 1000
end, function(value)
	stats.set_float(MPX .. "LONGEST_DRIVE_NOCRASH", value * 1000)
end)
distancestat:add_float_range("Longest Jump", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "FARTHEST_JUMP_DIST")
end, function(value)
	stats.set_float(MPX .. "FARTHEST_JUMP_DIST", value)
end)
distancestat:add_float_range("Longest Jump in Vehicle", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "HIGHEST_JUMP_REACHED")
end, function(value)
	stats.set_float(MPX .. "HIGHEST_JUMP_REACHED", value)
end)
distancestat:add_float_range("Highest Hidraulic Jump", 10.00, 0.00, 99999.00, function()
	return stats.get_float(MPX .. "LOW_HYDRAULIC_JUMP")
end, function(value)
	stats.set_float(MPX .. "LOW_HYDRAULIC_JUMP", value)
end)

timestat:add_int_range("Time in FP", 1, 0, 24, function()
	return math.floor(stats.get_int("MP_FIRST_PERSON_CAM_TIME") / 86400000)
end, function(value)
	stats.set_int("MP_FIRST_PERSON_CAM_TIME", value * 86400000)
end)
timestat:add_int_range("Time In Gta V Online", 1, 0, 24, function()
	return math.floor(stats.get_int("MP_PLAYING_TIME") / 86400000)
end, function(value)
	stats.set_int("MP_PLAYING_TIME", value * 86400000)
end)
timestat:add_int_range("Time in DeathMatches", 1, 0, 24, function()
	return math.floor(stats.get_int("MPPLY_TOTAL_TIME_SPENT_DEATHMAT") / 86400000)
end, function(value)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_DEATHMAT", value * 86400000)
end)
timestat:add_int_range("Time in races", 1, 0, 24, function()
	return math.floor(stats.get_int("MPPLY_TOTAL_TIME_SPENT_RACES") / 86400000)
end, function(value)
	stats.set_int("MPPLY_TOTAL_TIME_SPENT_RACES", value * 86400000)
end)
timestat:add_int_range("Time in creator mode", 1, 0, 24, function()
	return math.floor(stats.get_int("MPPLY_TOTAL_TIME_MISSION_CREATO") / 86400000)
end, function(value)
	stats.set_int("MPPLY_TOTAL_TIME_MISSION_CREATO", value * 86400000)
end)
timestat:add_int_range("Longest alone sesion", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "LONGEST_PLAYING_TIME") / 86400000)
end, function(value)
	stats.set_int(MPX .. "LONGEST_PLAYING_TIME", value * 86400000)
end)
timestat:add_int_range("Time with character", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TOTAL_PLAYING_TIME") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TOTAL_PLAYING_TIME", value * 86400000)
end)
timestat:add_int_range("Average Time in sesion", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "AVERAGE_TIME_PER_SESSON") / 86400000)
end, function(value)
	stats.set_int(MPX .. "AVERAGE_TIME_PER_SESSON", value * 86400000)
end)
timestat:add_int_range("Time swiming", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_SWIMMING") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_SWIMMING", value * 86400000)
end)
timestat:add_int_range("Time under water", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_UNDERWATER") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_UNDERWATER", value * 86400000)
end)
timestat:add_int_range("Time walking", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_WALKING") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_WALKING", value * 86400000)
end)
timestat:add_int_range("Time in coverage", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_IN_COVER") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_IN_COVER", value * 86400000)
end)
timestat:add_int_range("Time with stars", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TOTAL_CHASE_TIME") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TOTAL_CHASE_TIME", value * 86400000)
end)
timestat:add_float_range("Last wanted duration", 1.0, 0.0, 24.0, function()
	return math.floor(stats.get_float(MPX .. "LAST_CHASE_TIME") / 86400000)
end, function(value)
	stats.set_float(MPX .. "LAST_CHASE_TIME", value * 86400000)
end)
timestat:add_float_range("Longest wanted duration", 1.0, 0.0, 24.0, function()
	return math.floor(stats.get_float(MPX .. "LONGEST_CHASE_TIME") / 86400000)
end, function(value)
	stats.set_float(MPX .. "LONGEST_CHASE_TIME", value * 86400000)
end)
timestat:add_float_range("5 Stars", 1.0, 0.0, 24.0, function()
	return math.floor(stats.get_float(MPX .. "TOTAL_TIME_MAX_STARS") / 86400000)
end, function(value)
	stats.set_float(MPX .. "TOTAL_TIME_MAX_STARS", value * 86400000)
end)
timestat:add_action("Time Bassicly", function() end)
timestat:add_int_range("Driving Cars", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_DRIVING_CAR") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_DRIVING_CAR", value * 86400000)
end)
timestat:add_int_range("Driving Motorbike", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_DRIVING_BIKE") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_DRIVING_BIKE", value * 86400000)
end)
timestat:add_int_range("Driving Helicopters", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_DRIVING_HELI") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_DRIVING_HELI", value * 86400000)
end)
timestat:add_int_range("Driving Planes", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_DRIVING_PLANE") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_DRIVING_PLANE", value * 86400000)
end)
timestat:add_int_range("Driving Botes", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_DRIVING_BOAT") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_DRIVING_BOAT", value * 86400000)
end)
timestat:add_int_range("Conduciendo ATVs", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_DRIVING_QUADBIKE") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_DRIVING_QUADBIKE", value * 86400000)
end)
timestat:add_int_range("Driving MotorBikes", 1, 0, 24, function()
	return math.floor(stats.get_int(MPX .. "TIME_DRIVING_BICYCLE") / 86400000)
end, function(value)
	stats.set_int(MPX .. "TIME_DRIVING_BICYCLE", value * 86400000)
end)

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
	RONECLICKMenu:add_action(text, function() end)
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
	PlayerIndex = globals.get_int(1574932)
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
RONECLICKMenu:add_action("Stats Part 2", function()
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
RONECLICKMenu:add_action("Stats Part 3", function()
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
RONECLICKMenu:add_action("Stats Part 4", function()
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
	PlayerIndex = globals.get_int(1574932)
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
	PlayerIndex = globals.get_int(1574932)
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
MPX = PI
PI = stats.get_int("MPPLY_LAST_MP_CHAR")
if PI == 0 then
	MPX = "MP0_"
else
	MPX = "MP1_"
end

RONECLICKMenu:add_action("Unlock Diamond Casino Heist Outfits", function()
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL1", true, 63) -- Refuse Collectors
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 0) -- Undertakers
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 1) -- Valet Outfits
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 3) -- Prison Guards
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 4) -- FIB Suits
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 6) -- Gruppe Sechs Gear
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 7) -- Bugstars Uniforms
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 8) -- Maintenance
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 9) -- Yung Ancestors
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 10) -- Firefighter Gear
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 11) -- Orderly Armor
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 12) -- Upscale Armor
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 13) -- Evening Armor
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 14) -- Reinforced: Padded Combat
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 15) -- Reinforced: Bulk Combat
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 16) -- Reinforced: Compact Combat
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 17) -- Balaclava Crook
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 18) -- Classic Crook
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 19) -- High-end Crook
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 20) -- Infiltration: Upgraded Tech
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 21) -- Infiltration: Advanced Tech
	stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL2", true, 22) -- Infiltration: Modernized Tech
end)

RONECLICKMenu:add_action("Unlock Taxi Livery for Eudora", function()
	stats.set_masked_int(MPX .. "DLC22022PSTAT_INT536", 10, 16, 8)
end)

RONECLICKMenu:add_action("Unlock Taxi Livery for Broadway", function()
	stats.set_int(MPX .. "AWD_TAXIDRIVER", 50)
end)

Text("Join New Session Once And")
Text("Notifications Will Stop")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Full Account Unlocker Tool---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FAUT = RMenu:add_submenu("Full Account Unlock Menu")

--Character's Stats-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CSU = FAUT:add_submenu("Character's Stats")

AcMenu = CSU:add_submenu("Achievements")

Acv0 = false
AG = 4543283 + 1
local function AchUnlock()
	while Acv0 == true do
		for i = 1, 78 do
			globals.set_int(4543283 + 1, i)
		end
	end
end
AcMenu:add_toggle("Unlock All", function()
	return Acv0
end, function()
	Acv0 = not Acv0
	AchUnlock(Acv0)
end)

AcMMenu = AcMenu:add_submenu("Unlock One By One")

AcMMenu:add_action("Welcome to Los Santos", function()
	globals.set_int(AG, 1)
end)
AcMMenu:add_action("A Friendship Resurrected", function()
	globals.set_int(AG, 2)
end)
AcMMenu:add_action("A Fair Day's Pay", function()
	globals.set_int(AG, 3)
end)
AcMMenu:add_action("The Moment of Truth", function()
	globals.set_int(AG, 4)
end)
AcMMenu:add_action("To Live or Die in Los Santos", function()
	globals.set_int(AG, 5)
end)
AcMMenu:add_action("Diamond Hard", function()
	globals.set_int(AG, 6)
end)
AcMMenu:add_action("Subversive", function()
	globals.set_int(AG, 7)
end)
AcMMenu:add_action("Blitzed", function()
	globals.set_int(AG, 8)
end)
AcMMenu:add_action("Small Town, Big Job", function()
	globals.set_int(AG, 9)
end)
AcMMenu:add_action("The Government Gimps", function()
	globals.set_int(AG, 10)
end)
AcMMenu:add_action("The Big One!", function()
	globals.set_int(AG, 11)
end)
AcMMenu:add_action("Solid Gold, Baby!", function()
	globals.set_int(AG, 12)
end)
AcMMenu:add_action("Career Criminal", function()
	globals.set_int(AG, 13)
end)
AcMMenu:add_action("San Andreas Sightseer", function()
	globals.set_int(AG, 14)
end)
AcMMenu:add_action("All's Fare in Love and War", function()
	globals.set_int(AG, 15)
end)
AcMMenu:add_action("TP Industries Arms Race", function()
	globals.set_int(AG, 16)
end)
AcMMenu:add_action("Multi-Disciplined", function()
	globals.set_int(AG, 17)
end)
AcMMenu:add_action("From Beyond the Stars", function()
	globals.set_int(AG, 18)
end)
AcMMenu:add_action("A Mystery, Solved", function()
	globals.set_int(AG, 19)
end)
AcMMenu:add_action("Waste Management", function()
	globals.set_int(AG, 20)
end)
AcMMenu:add_action("Red Mist", function()
	globals.set_int(AG, 21)
end)
AcMMenu:add_action("Show Off", function()
	globals.set_int(AG, 22)
end)
AcMMenu:add_action("Kifflom!", function()
	globals.set_int(AG, 23)
end)
AcMMenu:add_action("Three Man Army", function()
	globals.set_int(AG, 24)
end)
AcMMenu:add_action("Out of Your Depth", function()
	globals.set_int(AG, 25)
end)
AcMMenu:add_action("Altruist Acolyte", function()
	globals.set_int(AG, 26)
end)
AcMMenu:add_action("A Lot of Cheddar", function()
	globals.set_int(AG, 27)
end)
AcMMenu:add_action("Trading Pure Alpha", function()
	globals.set_int(AG, 28)
end)
AcMMenu:add_action("Pimp My Sidearm", function()
	globals.set_int(AG, 29)
end)
AcMMenu:add_action("Wanted: Alive Or Alive", function()
	globals.set_int(AG, 30)
end)
AcMMenu:add_action("Los Santos Customs", function()
	globals.set_int(AG, 31)
end)
AcMMenu:add_action("Close Shave", function()
	globals.set_int(AG, 32)
end)
AcMMenu:add_action("Off the Plane", function()
	globals.set_int(AG, 33)
end)
AcMMenu:add_action("Three-Bit Gangster", function()
	globals.set_int(AG, 34)
end)
AcMMenu:add_action("Making Moves", function()
	globals.set_int(AG, 35)
end)
AcMMenu:add_action("Above the Law", function()
	globals.set_int(AG, 36)
end)
AcMMenu:add_action("Numero Uno", function()
	globals.set_int(AG, 37)
end)
AcMMenu:add_action("The Midnight Club", function()
	globals.set_int(AG, 38)
end)
AcMMenu:add_action("Unnatural Selection", function()
	globals.set_int(AG, 39)
end)
AcMMenu:add_action("Backseat Driver", function()
	globals.set_int(AG, 40)
end)
AcMMenu:add_action("Run Like The Wind", function()
	globals.set_int(AG, 41)
end)
AcMMenu:add_action("Clean Sweep", function()
	globals.set_int(AG, 42)
end)
AcMMenu:add_action("Decorated", function()
	globals.set_int(AG, 43)
end)
AcMMenu:add_action("Stick Up Kid", function()
	globals.set_int(AG, 44)
end)
AcMMenu:add_action("Enjoy Your Stay", function()
	globals.set_int(AG, 45)
end)
AcMMenu:add_action("Crew Cut", function()
	globals.set_int(AG, 46)
end)
AcMMenu:add_action("Full Refund", function()
	globals.set_int(AG, 47)
end)
AcMMenu:add_action("Dialling Digits", function()
	globals.set_int(AG, 48)
end)
AcMMenu:add_action("American Dream", function()
	globals.set_int(AG, 49)
end)
AcMMenu:add_action("A New Perspective", function()
	globals.set_int(AG, 50)
end)
AcMMenu:add_action("Be Prepared", function()
	globals.set_int(AG, 51)
end)
AcMMenu:add_action("In the Name of Science", function()
	globals.set_int(AG, 52)
end)
AcMMenu:add_action("Dead Presidents", function()
	globals.set_int(AG, 53)
end)
AcMMenu:add_action("Parole Day", function()
	globals.set_int(AG, 54)
end)
AcMMenu:add_action("Shot Caller", function()
	globals.set_int(AG, 55)
end)
AcMMenu:add_action("Four Way", function()
	globals.set_int(AG, 56)
end)
AcMMenu:add_action("Live a Little", function()
	globals.set_int(AG, 57)
end)
AcMMenu:add_action("Can't Touch This", function()
	globals.set_int(AG, 58)
end)
AcMMenu:add_action("Mastermind", function()
	globals.set_int(AG, 59)
end)
AcMMenu:add_action("Vinewood Visionary", function()
	globals.set_int(AG, 60)
end)
AcMMenu:add_action("Majestic", function()
	globals.set_int(AG, 61)
end)
AcMMenu:add_action("Humans of Los Santos", function()
	globals.set_int(AG, 62)
end)
AcMMenu:add_action("First Time Director", function()
	globals.set_int(AG, 63)
end)
AcMMenu:add_action("Animal Lover", function()
	globals.set_int(AG, 64)
end)
AcMMenu:add_action("Ensemble Piece", function()
	globals.set_int(AG, 65)
end)
AcMMenu:add_action("Cult Movie", function()
	globals.set_int(AG, 66)
end)
AcMMenu:add_action("Location Scout", function()
	globals.set_int(AG, 67)
end)
AcMMenu:add_action("Method Actor", function()
	globals.set_int(AG, 68)
end)
AcMMenu:add_action("Cryptozoologist", function()
	globals.set_int(AG, 69)
end)
AcMMenu:add_action("Getting Started", function()
	globals.set_int(AG, 70)
end)
AcMMenu:add_action("The Data Breaches", function()
	globals.set_int(AG, 71)
end)
AcMMenu:add_action("The Bogdan Problem", function()
	globals.set_int(AG, 72)
end)
AcMMenu:add_action("The Doomsday Scenario", function()
	globals.set_int(AG, 73)
end)
AcMMenu:add_action("A World Worth Saving", function()
	globals.set_int(AG, 74)
end)
AcMMenu:add_action("Orbital Obliteration", function()
	globals.set_int(AG, 75)
end)
AcMMenu:add_action("Elitist", function()
	globals.set_int(AG, 76)
end)
AcMMenu:add_action("Masterminds", function()
	globals.set_int(AG, 77)
end)

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
	for i = 2, 19 do
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH" .. i, -1)
	end
	for j = 1, 19 do
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", -1)
	end
	for m = 1, 41 do
		stats.set_int(MPX .. "CHAR_KIT_" .. m .. "_FM_UNLCK", -1)
	end
	for l = 2, 41 do
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE" .. l, -1)
	end
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
	for j = 0, 63 do
		stats.set_bool_masked(MPX .. "GANGOPSPSTAT_BOOL0", true, j, MPX)
	end
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
	for j = 0, 63 do
		stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL0", true, j, MPX)
		stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL1", true, j, MPX)
	end
	if stats.get_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 0, 8) < 20 then
		stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
	end
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
	for i = 0, 8 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
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
	Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD")
	if Paragon == true then
		stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", true)
	else
		stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
	end
	for i = 0, 6 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
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
	for i = 0, 4 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
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
	stats.set_int(MPX .. "FOOTAGE_INITIALS_0", 0)
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
	for i = 0, 9 do
		stats.set_int(MPX .. "IAP_INITIALS_" .. i, 50)
		stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
		stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
		stats.set_int(MPX .. "SCGW_SCORE_" .. i, 50)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_" .. i, 50)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_" .. i, 50)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_" .. i, 50)
		stats.set_int(MPX .. "GGSM_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "GGSM_SCORE_" .. i, 50)
		stats.set_int(MPX .. "TWR_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "TWR_SCORE_" .. i, 50)
	end
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
	for j = 290449, 290468 do
		globals.set_int(j, 1)
	end
	for i = 0, 4 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
	for i = 0, 6 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
	stats.set_bool(MPX .. "AWD_KINGOFQUB3D", true)
	stats.set_bool(MPX .. "AWD_QUBISM", true)
	stats.set_bool(MPX .. "AWD_QUIBITS", true)
	stats.set_bool(MPX .. "AWD_GODOFQUB3D", true)
	stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
	stats.set_bool(MPX .. "AWD_GOFOR11TH", true)
	stats.set_masked_int(MPX .. "SU20PSTAT_INT", 1, 35, 8)
	for i = 0, 1 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "SU20PSTAT_BOOL" .. i, true, j, MPX)
			stats.set_bool_masked(MPX .. "SU20TATTOOSTAT_BOOL" .. i, true, j, MPX)
		end
	end
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
	for i = 0, 2 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "HISLANDPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
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
	for i = 0, 8 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "TUNERPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
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
	for j = 0, 63 do
		stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL0", true, j, MPX)
		stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, j, MPX)
		stats.set_bool_masked(MPX .. "FIXERTATTOOSTAT_BOOL0", true, j, MPX)
	end
end)

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
	stats.set_int(MPX .. "FM_MISSION_LIKES", 1500)
end)

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
	stats.set_int(MPX .. "NO_TIMES_CINEMA", 500)
end)

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
	for i = 2, 19 do
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH" .. i, -1)
	end
	for j = 1, 19 do
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", -1)
	end
	for m = 1, 41 do
		stats.set_int(MPX .. "CHAR_KIT_" .. m .. "_FM_UNLCK", -1)
	end
	for l = 2, 41 do
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE" .. l, -1)
	end
end)

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
	stats.set_int(MPX .. "HVYSNIPER_ENEMY_KILLS", 500)
end)

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
	stats.set_bool(MPX .. "AWD_FMFULLYMODDEDCAR", true)
end)

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
	stats.set_int(MPX .. "NUMBER_NEAR_MISS", 1000)
end)

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
	stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1)
end)

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
	for j = 0, 63 do
		stats.set_bool_masked(MPX .. "GANGOPSPSTAT_BOOL0", true, j, MPX)
	end
	stats.set_masked_int(MPX .. "DLCSMUGCHARPSTAT_INT260", 3, 16, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 24, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 32, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 40, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT260", 3, 48, 8)
end)

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
	for j = 0, 63 do
		stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL0", true, j, MPX)
		stats.set_bool_masked(MPX .. "BUSINESSBATPSTAT_BOOL1", true, j, MPX)
	end
	if stats.get_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 0, 8) < 20 then
		stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
	end
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 100, 16, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 20, 24, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 80, 32, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 60, 40, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 40, 48, 8)
	stats.set_masked_int(MPX .. "BUSINESSBATPSTAT_INT379", 10, 56, 8)
end)

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
	for i = 0, 8 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "ARENAWARSPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
end)

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
	Paragon = stats.get_bool(MPX .. "CAS_VEHICLE_REWARD")
	if Paragon == true then
		stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", true)
	else
		stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
	end
	for i = 0, 6 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
end)

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
	for i = 0, 4 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
end)

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
	stats.set_int(MPX .. "FOOTAGE_INITIALS_0", 0)
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
	for i = 0, 9 do
		stats.set_int(MPX .. "IAP_INITIALS_" .. i, 50)
		stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
		stats.set_int(MPX .. "IAP_SCORE_" .. i, 50)
		stats.set_int(MPX .. "SCGW_SCORE_" .. i, 50)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_" .. i, 50)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_" .. i, 50)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_" .. i, 50)
		stats.set_int(MPX .. "GGSM_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "GGSM_SCORE_" .. i, 50)
		stats.set_int(MPX .. "TWR_INITIALS_" .. i, 69644)
		stats.set_int(MPX .. "TWR_SCORE_" .. i, 50)
	end
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
	for j = 290449, 290468 do
		globals.set_int(j, 1)
	end
	for i = 0, 4 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOHSTPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
	for i = 0, 6 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "CASINOPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
end)

AMMenu:add_action("LS Summer Special", function()
	stats.set_bool(MPX .. "AWD_KINGOFQUB3D", true)
	stats.set_bool(MPX .. "AWD_QUBISM", true)
	stats.set_bool(MPX .. "AWD_QUIBITS", true)
	stats.set_bool(MPX .. "AWD_GODOFQUB3D", true)
	stats.set_bool(MPX .. "AWD_ELEVENELEVEN", true)
	stats.set_bool(MPX .. "AWD_GOFOR11TH", true)
	stats.set_masked_int(MPX .. "SU20PSTAT_INT", 1, 35, 8)
	for i = 0, 1 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "SU20PSTAT_BOOL" .. i, true, j, MPX)
			stats.set_bool_masked(MPX .. "SU20TATTOOSTAT_BOOL" .. i, true, j, MPX)
		end
	end
end)

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
	for i = 0, 2 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "HISLANDPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
end)

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
	for i = 0, 8 do
		for j = 0, 63 do
			stats.set_bool_masked(MPX .. "TUNERPSTAT_BOOL" .. i, true, j, MPX)
		end
	end
end)

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
	for j = 0, 63 do
		stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL0", true, j, MPX)
		stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, j, MPX)
		stats.set_bool_masked(MPX .. "FIXERTATTOOSTAT_BOOL0", true, j, MPX)
	end
end)

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
	stats.set_int(MPX .. "FOOTAGE_INITIALS_0", 0)
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
	for i = 2, 19 do
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH" .. i, 0)
	end
	for j = 1, 19 do
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", 0)
	end
	for m = 1, 01 do
		stats.set_int(MPX .. "CHAR_KIT_" .. m .. "_FM_UNLCK", 0)
	end
	for l = 2, 01 do
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE" .. l, 0)
	end
	for i = 0, 9 do
		stats.set_int(MPX .. "IAP_INITIALS_" .. i, 0)
		stats.set_int(MPX .. "IAP_SCORE_" .. i, 0)
		stats.set_int(MPX .. "IAP_SCORE_" .. i, 0)
		stats.set_int(MPX .. "SCGW_SCORE_" .. i, 0)
		stats.set_int(MPX .. "DG_DEFENDER_INITIALS_" .. i, 0)
		stats.set_int(MPX .. "DG_DEFENDER_SCORE_" .. i, 0)
		stats.set_int(MPX .. "DG_MONKEY_INITIALS_" .. i, 0)
		stats.set_int(MPX .. "DG_MONKEY_SCORE_" .. i, 0)
		stats.set_int(MPX .. "DG_PENETRATOR_INITIALS_" .. i, 0)
		stats.set_int(MPX .. "DG_PENETRATOR_SCORE_" .. i, 0)
		stats.set_int(MPX .. "GGSM_INITIALS_" .. i, 0)
		stats.set_int(MPX .. "GGSM_SCORE_" .. i, 0)
		stats.set_int(MPX .. "TWR_INITIALS_" .. i, 0)
		stats.set_int(MPX .. "TWR_SCORE_" .. i, 0)
	end
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
	if Paragon == false then
		stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
	else
		stats.set_bool(MPX .. "CAS_VEHICLE_REWARD", false)
	end
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
	stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", false)
end)

AMenu:add_action("", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGMONEYREMOVER = L7NEG:add_submenu("Money Remover Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGMONEYREMOVER:add_int_range("Set Ballastic Value", 1000000, 1000000, 2147483647, function()
	return globals.get_int(262145 + 20498) ---156036296
end, function(value)
	globals.set_int(262145 + 20498, value)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGMONEYREMOVER:add_int_range("Set Casino Chips Buy Limit", 1000000, 0, 2147483647, function()
	return globals.get_int(262145 + 27238) --VC_CASINO_CHIP_MAX_BUY_PENTHOUSE
end, function(value)
	globals.set_int(262145 + 27238, value)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Cash Remover------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CashRemover = L7NEGMONEYREMOVER:add_submenu("Instant Cash Remover Menu")

NumberList = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }

DefNum1 = NumberList[1]
DefNum1Cur = 1
CashRemover:add_array_item("Char #1", NumberList, function()
	return DefNum1Cur
end, function(NewNum1)
	DefNum1 = NumberList[NewNum1]
	DefNum1Cur = NewNum1
end)

DefNum2 = NumberList[1]
DefNum2Cur = 1
CashRemover:add_array_item("Char #2", NumberList, function()
	return DefNum2Cur
end, function(NewNum2)
	DefNum2 = NumberList[NewNum2]
	DefNum2Cur = NewNum2
end)

DefNum3 = NumberList[1]
DefNum3Cur = 1
CashRemover:add_array_item("Char #3", NumberList, function()
	return DefNum3Cur
end, function(NewNum3)
	DefNum3 = NumberList[NewNum3]
	DefNum3Cur = NewNum3
end)

DefNum4 = NumberList[1]
DefNum4Cur = 1
CashRemover:add_array_item("Char #4", NumberList, function()
	return DefNum4Cur
end, function(NewNum4)
	DefNum4 = NumberList[NewNum4]
	DefNum4Cur = NewNum4
end)

DefNum5 = NumberList[1]
DefNum5Cur = 1
CashRemover:add_array_item("Char #5", NumberList, function()
	return DefNum5Cur
end, function(NewNum5)
	DefNum5 = NumberList[NewNum5]
	DefNum5Cur = NewNum5
end)

DefNum6 = NumberList[1]
DefNum6Cur = 1
CashRemover:add_array_item("Char #6", NumberList, function()
	return DefNum6Cur
end, function(NewNum6)
	DefNum6 = NumberList[NewNum6]
	DefNum6Cur = NewNum6
end)

DefNum7 = NumberList[1]
DefNum7Cur = 1
CashRemover:add_array_item("Char #7", NumberList, function()
	return DefNum7Cur
end, function(NewNum7)
	DefNum7 = NumberList[NewNum7]
	DefNum7Cur = NewNum7
end)

DefNum8 = NumberList[1]
DefNum8Cur = 1
CashRemover:add_array_item("Char #8", NumberList, function()
	return DefNum8Cur
end, function(NewNum8)
	DefNum8 = NumberList[NewNum8]
	DefNum8Cur = NewNum8
end)

DefNum9 = NumberList[1]
DefNum9Cur = 1
CashRemover:add_array_item("Char #9", NumberList, function()
	return DefNum9Cur
end, function(NewNum9)
	DefNum9 = NumberList[NewNum9]
	DefNum9Cur = NewNum9
end)

DefNum10 = NumberList[1]
DefNum10Cur = 1
CashRemover:add_array_item("Char #10", NumberList, function()
	return DefNum10Cur
end, function(NewNum10)
	DefNum10 = NumberList[NewNum10]
	DefNum10Cur = NewNum10
end)

CashRemover:add_bare_item("", function()
	CashToRemove = tonumber(
		DefNum1 .. DefNum2 .. DefNum3 .. DefNum4 .. DefNum5 .. DefNum6 .. DefNum7 .. DefNum8 .. DefNum9 .. DefNum10
	)
	if CashToRemove == 0 then
		CashToRemove = "0"
	end
	return "Remove Cash: $" .. FormatMoney(CashToRemove)
end, function()
	globals.set_int(2707036 + 36, CashToRemove)
	sleep(1)
	DefNum1Cur = 1
	DefNum2Cur = 1
	DefNum3Cur = 1
	DefNum4Cur = 1
	DefNum5Cur = 1
	DefNum6Cur = 1
	DefNum7Cur = 1
	DefNum8Cur = 1
	DefNum9Cur = 1
	DefNum10Cur = 1
	DefNum1 = NumberList[1]
	DefNum2 = NumberList[1]
	DefNum3 = NumberList[1]
	DefNum4 = NumberList[1]
	DefNum5 = NumberList[1]
	DefNum6 = NumberList[1]
	DefNum7 = NumberList[1]
	DefNum8 = NumberList[1]
	DefNum9 = NumberList[1]
	DefNum10 = NumberList[1]
end, function() end, function() end)

CashRemover:add_action("----------------------------------------------------", function() end)

CashRemover:add_action("---Special Thx To Silent For This W---", function() end)

CashRemover:add_action("---Feature---", function() end)

CashRemover:add_action("---Click On Remove Cash After You---", function() end)

CashRemover:add_action("---Have Set All Starting From Char#10---", function() end)

CashRemover:add_action("---To Char#1---", function() end)

CashRemover:add_action("----------------------------------------------------", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7 = L7NEG:add_submenu("Ultimate Money Methods Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

VehiclesM:add_array_item("Request Services", {
	"M.O.C",
	"Avenger",
	"TerrorByte",
	"Kosatka",
	"Dinghy",
	"Acid Lab",
	"Acid Lab Bike",
	"Ballastic Equipment",
	"Ammo Drop",
}, function()
	return xox_1
end, function(v)
	if v == 1 then
		globals.set_int(REQS1 + 930, 1)
	elseif v == 2 then
		globals.set_int(REQS1 + 938, 1)
	elseif v == 3 then
		globals.set_int(REQS1 + 943, 1)
	elseif v == 4 then
		globals.set_int(REQS1 + 960, 1)
	elseif v == 5 then
		globals.set_int(REQS1 + 972, 1)
	elseif v == 6 then
		globals.set_int(REQS1 + 944, 1)
	elseif v == 7 then
		globals.set_int(REQS1 + 994, 1)
	elseif v == 8 then
		globals.set_int(REQS1 + 901, 1)
	else
		globals.set_int(REQS1 + 891, 1)
	end
	xox_1 = v
end)

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

VehiclesM:add_action("Repair Vehicle", function()
	menu.repair_online_vehicle()
end)
VehiclesM:add_action("Remove Insurance Claims", function()
	menu.remove_insurance_claims()
end)
VehiclesM:add_action("Deliver Your Personal Vehicle", function()
	menu.deliver_personal_vehicle()
end)
VehiclesM:add_action("Enter Your Personal Vehicle", function()
	menu.enter_personal_vehicle()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

carmod = VehiclesM:add_submenu("Wheels Mod Section")

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

PlateChar = {
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
	"",
}
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
end, function() end, function() end)

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

L7NEGWEAPON:add_action("Full Ammo ", function()
	menu.max_all_ammo()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGWEAPON1 = L7NEGWEAPON:add_submenu("Weapone Data Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local weapon_data = {}
local enabled = false
local function increaseBulletDamageWhenShooting()
	if not enabled then
		return
	end
	local weapon = localplayer:get_current_weapon()
	local bullet = weapon:get_bullet_damage()
	if bullet < 100000 then
		weapon_data[weapon:get_name_hash()] = force
		weapon:set_bullet_damage(999900000)
	end
end

local hotkey
local function supraABullet()
	if not localplayer or localplayer == nil then
		return
	end
	enabled = not enabled
	if enabled then
		menu.register_hotkey(1, increaseBulletDamageWhenShooting)
	else
	end
end

L7NEGWEAPON1:add_toggle("Enable Super Bullet Shoot", function()
	return enabled
end, supraABullet)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local enable_thermal = false
local hotkey = nil
local version = 2
-- https://wiki.rage.mp/index.php?title=Player_Config_Flags
local PED_FLAG_IS_SNIPER_SCOPE_ACTIVE = 72
local PED_FLAG_IS_AIMING = 78

function handle_thermal_v1()
	if
		not localplayer:is_in_vehicle()
		and not menu.get_thermalvision()
		and localplayer:get_config_flag(PED_FLAG_IS_AIMING)
	then
		menu.set_thermalvision(true)
	end
	sleep(0.2)
	if menu.get_thermalvision() and not localplayer:get_config_flag(PED_FLAG_IS_AIMING) then
		menu.set_thermalvision(false)
	end
end

function handle_thermal_v2()
	if not menu.get_thermalvision() and localplayer:get_config_flag(PED_FLAG_IS_AIMING) then
		menu.set_thermalvision(true)
		return
	end
	sleep(0.2)
	if menu.get_thermalvision() then
		menu.set_thermalvision(false)
		return
	end
end

function handle_hotkey()
	if enable_thermal then
		if version == 1 then
			hotkey = menu.register_hotkey(2, handle_thermal_v1)
		else
			hotkey = menu.register_hotkey(69, handle_thermal_v2)
		end
	elseif hotkey ~= nil then
		menu.set_thermalvision(false)
		menu.remove_hotkey(hotkey)
	end
end

handle_hotkey()
L7NEGWEAPON1:add_toggle("Enable Thermal Aim", function()
	return enable_thermal
end, function()
	enable_thermal = not enable_thermal
	handle_hotkey()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local enable_SG = false
local enable_on_select = true
local exclude_map = {
	[joaat("WEAPON_RAILGUN")] = 1,
}
local SG_map = {}
-- SG_map[3] = "Molotov"
SG_map[12] = "Flame"
SG_map[20] = "Teargas"
SG_map[22] = "Flare"
-- SG_map[36] = "Railgun"
-- SG_map[64] = "Kinetic"
SG_map[65] = "EMP"

-- Trollings
-- SG_map[11] = "Steam"
-- SG_map[13] = "Water"
-- SG_map[38] = "Firework"
SG_map[45] = "ExpAmmo" -- weaker than railgun
-- SG_map[67] = "Slick"
-- SG_map[68] = "Tar"
SG_map[70] = "Atomizer" -- dmg: kine>atmoizer for veh, vice versa for ped
-- More at https://altv.stuyk.com/docs/articles/tables/explosions.html

local active_type = 45
local gun_map = {}

function ResetWeaponStats(oldWeapon, og_exp, og_dmg_t, og_dmg_v)
	oldWeapon:set_explosion_type(og_exp)
	oldWeapon:set_damage_type(og_dmg_t)
	oldWeapon:set_bullet_damage(og_dmg_v)
end

function ResetAllWeaponStats()
	sleep(0.2)
	for w, p in pairs(gun_map) do
		ResetWeaponStats(w, p[1], p[2], p[3])
	end
end

local function OnWeaponChanged(oldWeapon, newWeapon)
	if oldWeapon ~= nil and gun_map[oldWeapon] ~= nil then
		p = gun_map[oldWeapon]
		ResetWeaponStats(oldWeapon, p[1], p[2])
	end
	if newWeapon ~= nil and exclude_map[newWeapon:get_name_hash()] == nil then
		local original_explosion_type = newWeapon:get_explosion_type()
		local original_damage_type = newWeapon:get_damage_type()
		local original_damage_val = newWeapon:get_bullet_damage()
		if original_damage_type == 3 then
			newWeapon:set_explosion_type(active_type)
			newWeapon:set_damage_type(5)
			if active_type == 22 then
				newWeapon:set_bullet_damage(0)
			end
			gun_map[newWeapon] = { original_explosion_type, original_damage_type, original_damage_val }
		end
	end
end

------
if SGcallback then
	menu.remove_callback(SGcallback)
end
local SGcallback = nil
if enable_SG then
	local SGcallback = menu.register_callback("OnWeaponChanged", OnWeaponChanged)
end
local function Handle_SG(e)
	if e then
		SGcallback = menu.register_callback("OnWeaponChanged", OnWeaponChanged)
		OnWeaponChanged(nil, localplayer:get_current_weapon())
	else
		menu.remove_callback(SGcallback)
		ResetAllWeaponStats()
	end
end

L7NEGWEAPON1:add_toggle("Enable Special Gun", function()
	return enable_SG
end, function()
	enable_SG = not enable_SG
	Handle_SG(enable_SG)
end)
L7NEGWEAPON1:add_array_item("Select Special Gun Type", SG_map, function()
	return active_type
end, function(value)
	active_type = value
	if enable_SG then
		ResetAllWeaponStats()
		OnWeaponChanged(nil, localplayer:get_current_weapon())
	elseif enable_on_select then
		enable_SG = true
		Handle_SG(enable_SG)
	end
end)
-- uncomment the below to reset all guns used during SG=true. For debug
-- menu.add_action("Reset All Guns", function()
-- 	enable_SG = false
-- 	ResetAllWeaponStats()
-- end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGT = L7NEG:add_submenu("Teleports")

L7NEGT:add_action("Teleport To WayPoint", function()
	menu.teleport_to_waypoint()
end)
L7NEGT:add_action("Teleport To Objective", function()
	menu.teleport_to_objective()
end)
L7NEGT:add_action("Teleport  Forward", function()
	menu.teleport_forward()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TunMenu = L7NEG:add_submenu("Tunables")

TunMenu:add_float_range("RP", 1, 0, 100000, function()
	return globals.get_float(262145 + 1)
end, function(v)
	globals.set_float(262145 + 1, v)
end)

TunMenu:add_float_range("AP", 1, 0, 100000, function()
	return globals.get_float(262145 + 26184)
end, function(v)
	globals.set_float(262145 + 26184, v)
end)

TunMenu:add_float_range("Street Races", 1, 0, 100000, function()
	return globals.get_float(262145 + 31966)
end, function(v)
	globals.set_float(262145 + 31966, v)
end)

TunMenu:add_float_range("Pursuits", 1, 0, 100000, function()
	return globals.get_float(262145 + 31967)
end, function(v)
	globals.set_float(262145 + 31967, v)
end)

TunMenu:add_float_range("Face2Face", 1, 0, 100000, function()
	return globals.get_float(262145 + 31968)
end, function(v)
	globals.set_float(262145 + 31968, v)
end)

TunMenu:add_float_range("LS Car Meet", 1, 0, 100000, function()
	return globals.get_float(262145 + 31969)
end, function(v)
	globals.set_float(262145 + 31969, v)
end)

TunMenu:add_float_range("LS Car Meet on track", 1, 0, 100000, function()
	return globals.get_float(262145 + 31970)
end, function(v)
	globals.set_float(262145 + 31970, v)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGWORLD = L7NEG:add_submenu("World")

L7NEGNPC = L7NEGWORLD:add_submenu("Npcs Menu")

L7NEGNPC:add_action("Kill All Npcs", function()
	menu.kill_all_npcs()
end)
L7NEGNPC:add_action("Kill Mission Npcs", function()
	menu.kill_all_mission_peds()
end)

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

L7NEGWORLD:add_action("End Cutscene", function()
	menu.end_cutscene()
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGREPORTSVIEWMENU = L7NEG:add_submenu("Reports Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Griefing:" .. (string.format("%03d", stats.get_int("MPPLY_GRIEFING")))
end, function() end, function() end, function()
	return
end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Exploits:" .. (string.format("%03d", stats.get_int("MPPLY_EXPLOITS")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Bug Exploits:" .. (string.format("%03d", stats.get_int("MPPLY_GAME_EXPLOITS")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Text Chat:Annoying Me:" .. (string.format("%03d", stats.get_int("MPPLY_TC_ANNOYINGME")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Text Chat:Using Hate Speech:" .. (string.format("%03d", stats.get_int("MPPLY_TC_HATE")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Voice Chat:Annoying Me:" .. (string.format("%03d", stats.get_int("MPPLY_VC_ANNOYINGME")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Voice Chat:Using Hate Speech:" .. (string.format("%03d", stats.get_int("MPPLY_VC_HATE")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Offensive Language:" .. (string.format("%03d", stats.get_int("MPPLY_OFFENSIVE_LANGUAGE")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Offensive Tagplate:" .. (string.format("%03d", stats.get_int("MPPLY_OFFENSIVE_TAGPLATE")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Offensive Content:" .. (string.format("%03d", stats.get_int("MPPLY_OFFENSIVE_UGC")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Bad Crew Name:" .. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_NAME")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Bad Crew Motto:" .. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_MOTTO")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Bad Crew Status:" .. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_STATUS")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Bad Crew Emblem:" .. (string.format("%03d", stats.get_int("MPPLY_BAD_CREW_EMBLEM")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Friendly:" .. (string.format("%03d", stats.get_int("MPPLY_FRIENDLY")))
end, function() end, function() end, function() end)
L7NEGREPORTSVIEWMENU:add_bare_item("", function()
	return "Helpful:" .. (string.format("%03d", stats.get_int("MPPLY_HELPFUL")))
end, function() end, function() end, function() end)

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
	stats.set_int("MPPLY_GAME_EXPLOITS", 0)
	stats.set_int("MPPLY_EXPLOITS", 0)
	stats.set_int("MPPLY_BECAME_BADSPORT_NUM", 0)
	stats.set_int("MPPLY_DESTROYED_PVEHICLES", 0)
	stats.set_int("MPPLY_BECAME_CHEATER_NUM", 0)
	stats.set_int("MPPLY_BADSPORT_MESSAGE", 0)
	stats.set_int("MPPLY_GAME_EXPLOITS", 0)
	stats.set_int("MPPLY_PLAYER_MENTAL_STATE", 0)
	stats.set_int("MPPLY_PLAYERMADE_TITLE", 0)
	stats.set_int("MPPLY_PLAYERMADE_DESC", 0)
	stats.set_int("MPPLY_KILLS_PLAYERS_CHEATER", 0)
	stats.set_int("MPPLY_DEATHS_PLAYERS_CHEATER", 0)
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

a1 = 1
AgencyContracts = {
	"Select",
	"The Nightclub",
	"The Marina",
	"Nightlife Leak",
	"The Country Club",
	"Guest List",
	"High Society Leak",
	"Davis",
	"The Ballas",
	"The South Central Leak",
	"Studio Time",
	"Don't Fuck With Dre",
}
L7NEGCONTRACTS:add_array_item("VIP Contract", AgencyContracts, function()
	return a1
end, function(VIPCon)
	if VIPCon == 1 then
		a1 = 1
	elseif VIPCon == 2 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 3)
	elseif VIPCon == 3 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 4)
	elseif VIPCon == 4 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 12)
	elseif VIPCon == 5 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 28)
	elseif VIPCon == 6 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 60)
	elseif VIPCon == 7 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 124)
	elseif VIPCon == 8 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 252)
	elseif VIPCon == 9 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 508)
	elseif VIPCon == 10 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 2044)
	elseif VIPCon == 11 then
		stats.set_int(MPX .. "FIXER_STORY_BS", 4095)
	elseif VIPCon == 12 then
		stats.set_int(MPX .. "FIXER_STORY_BS", -1)
		stats.set_int(MPX .. "FIXER_STORY_STRAND", -1)
	end
	a1 = VIPCon
end)

L7NEGCONTRACTS:add_action("Complete Preps", function()
	stats.set_int(MPX .. "FIXER_GENERAL_BS", -1)
	stats.set_int(MPX .. "FIXER_COMPLETED_BS", -1)
	stats.set_int(MPX .. "FIXER_STORY_COOLDOWN", -1)
end)

a2 = false
local function AgencyMaxPayout(Enabled)
	if not localplayer then
		return
	end
	if Enabled then
		globals.set_int(262145 + 32466, 2500000)
	else
		globals.set_int(262145 + 32466, 1000000)
	end
end
L7NEGCONTRACTS:add_toggle("Max Payout (after start)", function()
	return a2
end, function()
	a2 = not a2
	AgencyMaxPayout(a2)
end)

L7NEGCONTRACTS:add_action("Cooldown Killer", function()
	globals.set_int(262145 + 32500, 0)
end)

L7NEGCONTRACTS:add_action("", function() end)

local function teleport_myself(x, y, z)
	localplayer:set_position((vector3(x, y, z)))
end

L7NEGCONTRACTS:add_action("-------------- Teleport Dre --------------------", function() end)
L7NEGCONTRACTS:add_action("Dre 1", function()
	teleport_myself(507.766602, -605.932678, 23.451139)
end)

L7NEGCONTRACTS:add_action("Dre 2", function()
	teleport_myself(-927.370483, -2923.859131, 12.644426)
end)

L7NEGCONTRACTS:add_action("Dre 3", function()
	teleport_myself(-933.519897, -3010.231201, 18.540413)
end)

L7NEGCONTRACTS:add_action("Dre 4", function()
	teleport_myself(-3036.250488, 111.499924, 10.599296)
end)

L7NEGCONTRACTS:add_action("-------No. of security contracts done------", function() end)
L7NEGCONTRACTS:add_int_range("Asset Protection", 1, 0, 500, function()
	return stats.get_int(MPX .. "FIXER_SC_ASSETS_PROTECTED")
end, function(v)
	stats.set_int(MPX .. "FIXER_SC_ASSETS_PROTECTED", v)
end)
L7NEGCONTRACTS:add_int_range("Gang Termination", 1, 0, 500, function()
	return stats.get_int(MPX .. "FIXER_SC_GANG_TERMINATED")
end, function(v)
	stats.set_int(MPX .. "FIXER_SC_GANG_TERMINATED", v)
end)
L7NEGCONTRACTS:add_int_range("Liquidize Assets", 1, 0, 500, function()
	return stats.get_int(MPX .. "FIXER_SC_EQ_DESTROYED")
end, function(v)
	stats.set_int(MPX .. "FIXER_SC_EQ_DESTROYED", v)
end)
L7NEGCONTRACTS:add_int_range("Recover Valuables", 1, 0, 500, function()
	return stats.get_int(MPX .. "FIXER_SC_VAL_RECOVERED")
end, function(v)
	stats.set_int(MPX .. "FIXER_SC_VAL_RECOVERED", v)
end)
L7NEGCONTRACTS:add_int_range("Rescue Operation", 1, 0, 500, function()
	return stats.get_int(MPX .. "FIXER_SC_VIP_RESCUED")
end, function(v)
	stats.set_int(MPX .. "FIXER_SC_VIP_RESCUED", v)
end)
L7NEGCONTRACTS:add_int_range("Vehicle Recovery", 1, 0, 500, function()
	return stats.get_int(MPX .. "FIXER_SC_VEH_RECOVERED")
end, function(v)
	stats.set_int(MPX .. "FIXER_SC_VEH_RECOVERED", v)
end)
L7NEGCONTRACTS:add_int_range("Contract Earnings", 250000, 0, 20000000, function()
	return stats.get_int(MPX .. "FIXER_EARNINGS")
end, function(v)
	stats.set_int(MPX .. "FIXER_EARNINGS", v)
end)
L7NEGCONTRACTS:add_action("------------Payphone Hits Stats-------------", function() end)
L7NEGCONTRACTS:add_int_range("Payphone hits Completed", 1, 0, 999, function()
	return stats.get_int(MPX .. "FIXERTELEPHONEHITSCOMPL")
end, function(v)
	stats.set_int(MPX .. "FIXERTELEPHONEHITSCOMPL", v)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG0 = L7NEGCONTRACTS:add_submenu("Auto Shop Preps Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG2 = L7NEG0:add_submenu("Skip Auto Shop Preps Menu")
L7NEG2:add_array_item("Prep Skip", {
	"The Union Depository Contract",
	"The Superdollar Deal",
	"The Bank Contract",
	"The ECU Job",
	"The Prison Contract",
	"The Agency Deal",
	"The Lost Contract",
	"The Data Contract",
}, function()
	return xox_4
end, function(value)
	if value == 1 then
		stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
		stats.set_int(MPX .. "TUNER_CURRENT", 0)
	elseif value == 2 then
		stats.set_int(MPX .. "TUNER_GEN_BS", 4351)
		stats.set_int(MPX .. "TUNER_CURRENT", 1)
	elseif value == 3 then
		stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
		stats.set_int(MPX .. "TUNER_CURRENT", 2)
	elseif value == 4 then
		stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
		stats.set_int(MPX .. "TUNER_CURRENT", 3)
	elseif value == 5 then
		stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
		stats.set_int(MPX .. "TUNER_CURRENT", 4)
	elseif value == 6 then
		stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
		stats.set_int(MPX .. "TUNER_CURRENT", 5)
	elseif value == 7 then
		stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
		stats.set_int(MPX .. "TUNER_CURRENT", 6)
	else
		stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
		stats.set_int(MPX .. "TUNER_CURRENT", 7)
	end
	xox_4 = value
end)

L7NEG388 = L7NEG0:add_submenu("Missions Tools")

L7NEG388:add_action("-----------Contracts Stats Editor-----------", function() end)
L7NEG388:add_int_range("Contracts Done", 1, 0, 9999, function()
	return stats.get_int(MPX .. "TUNER_COUNT")
end, function(v)
	stats.set_int(MPX .. "TUNER_COUNT", v)
end)
L7NEG388:add_int_range("Contracts Earnings", 500000, 0, 1000000000, function()
	return stats.get_int(MPX .. "TUNER_EARNINGS")
end, function(v)
	stats.set_int(MPX .. "TUNER_EARNINGS", v)
end)

L7NEG388:add_action("----------------------------------------------------", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGCONTRACTSNote = L7NEGCONTRACTS:add_submenu("Read Me")

L7NEGCONTRACTSNote:add_action("                 After all choices and", function() end)
L7NEGCONTRACTSNote:add_action("            pressing «Complete Preps»", function() end)
L7NEGCONTRACTSNote:add_action("                  just wait some time", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGAPARTMENT = L7NEGH:add_submenu("Apartment Data Editor")

L7NEGAPARTMENT:add_action("Skip Current Apartment Heist Preps", function()
	stats.set_int(MPX .. "HEIST_PLANNING_STAGE", -1)
end)

L7NEGAPCUT = L7NEGAPARTMENT:add_submenu("Apartment Normal Cuts Editor Menu")

L7NEGAPCUT:add_int_range("Apt Player 1", 1.0, 15, 100, function()
	return globals.get_int(1930201 + 3008 + 1)
end, function(value)
	globals.set_int(1930201 + 3008 + 1, value)
end)
L7NEGAPCUT:add_int_range("Apt Player 2", 1.0, 15, 100, function()
	return globals.get_int(1930201 + 3008 + 1 + 1)
end, function(value)
	globals.set_int(1930201 + 3008 + 1 + 1, value)
end)
L7NEGAPCUT:add_int_range("Apt Player 3", 1.0, 15, 100, function()
	return globals.get_int(1930201 + 3008 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1930201 + 3008 + 1 + 1 + 1, value)
end)
L7NEGAPCUT:add_int_range("Apt Player 4", 1.0, 15, 100, function()
	return globals.get_int(1930201 + 3008 + 1 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1930201 + 3008 + 1 + 1 + 1 + 1, value)
end)

L7NEGAPCUT:add_action("All 100", function()
	for i = 1930201 + 3008 + 1, 1930201 + 3008 + 1 + 1 + 1 + 1 do
		globals.set_int(i, 100)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local L7NEGCASINO = L7NEGH:add_submenu("Casino Heist")
PlayerIndex = globals.get_int(1574932)

if PlayerIndex == 0 then
	MPX = "MP0_"
else
	MPX = "MP1_"
end

local function Text(text)
	L7NEGCASINO:add_action(text, function() end)
end
Text(" ___________Casino Setup________")

L7NEGCASINO:add_int_range("Target - Cash1/Gold2/Art3/Diam4", 1, 1, 4, function()
	return stats.get_int(MPX .. "H3OPT_TARGET")
end, function(TGT)
	PlayerIndex = globals.get_int(1574932)
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

L7NEGCASINO:add_int_range("Random Approach - Normal/Hard", 1, 1, 2, function()
	return 1
end, function(H3lvl)
	LstAp = stats.get_int(MPX .. "H3_LAST_APPROACH")
	HrdAp = stats.get_int(MPX .. "H3_HARD_APPROACH")
	PlayerIndex = globals.get_int(1574932)
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

L7NEGCASINO:add_int_range("EasyApproach - Snk/BgCon/Aggr", 1, 1, 3, function()
	return 1
end, function(Approach)
	PlayerIndex = globals.get_int(1574932)
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

L7NEGCASINO:add_int_range("HardApproach - Snk/BgCon/Aggr", 1, 1, 3, function()
	return stats.get_int(MPX .. "H3_HARD_APPROACH")
end, function(Approach)
	PlayerIndex = globals.get_int(1574932)
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
	PlayerIndex = globals.get_int(1574932)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	stats.set_int(MPX .. "H3OPT_BITSET1", -1)
end)

L7NEGCASINO:add_int_range("Hacker - Rickie 3%/Avi 10%/Paige 9%", 1, 1, 3, function()
	return stats.get_int(MPX .. "H3OPT_CREWHACKER")
end, function(Hkr)
	PlayerIndex = globals.get_int(1574932)
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

L7NEGCASINO:add_int_range("Grlla/Clwn/Anml9/Riot/OniF/Hockey", 1, 1, 12, function()
	return stats.get_int(MPX .. "H3OPT_MASKS")
end, function(H3Msk)
	PlayerIndex = globals.get_int(1574932)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	--	hMsk = H3Msk
	stats.set_int(MPX .. "H3OPT_MASKS", H3Msk)
end)

L7NEGCASINO:add_int_range("Weap-Karl/Gus/Char/Ches/Pat", 1, 1, 5, function()
	return stats.get_int(MPX .. "H3OPT_CREWWEAP")
end, function(H3Weap)
	PlayerIndex = globals.get_int(1574932)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	--	hWeap = H3Weap
	stats.set_int(MPX .. "H3OPT_CREWWEAP", H3Weap)
end)

L7NEGCASINO:add_action("       ---[[Complete Board2 - Finale]]---", function()
	PlayerIndex = globals.get_int(1574932)
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
	return globals.get_int(1963945 + 1497 + 736 + 92 + 1)
end, function(value)
	globals.set_int(1963945 + 1497 + 736 + 92 + 1, value)
	H3C1 = p1
end)

L7NEGCASINO:add_int_range("Casino Player2 Cut", 5.0, 15, 100, function()
	return globals.get_int(1963945 + 1497 + 736 + 92 + 1 + 1)
end, function(value)
	globals.set_int(1963945 + 1497 + 736 + 92 + 1 + 1, value)
	H3C2 = p2
end)

L7NEGCASINO:add_int_range("Casino Player3 Cut", 5.0, 15, 100, function()
	return globals.get_int(1963945 + 1497 + 736 + 92 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1963945 + 1497 + 736 + 92 + 1 + 1 + 1, value)
	H3C3 = p3
end)

L7NEGCASINO:add_int_range("Casino Player4 Cut", 5.0, 15, 100, function()
	return globals.get_int(1963945 + 1497 + 736 + 92 + 1 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1963945 + 1497 + 736 + 92 + 1 + 1 + 1 + 1, value)
	H3C4 = p4
end)

L7NEGCASINO:add_int_range("Casino Lifes - Self", 1, 1, 999999999, function()
	return FMC:get_int(26154 + 1325 + 1)
end, function(life)
	if FMC and FMC:is_active() then
		FMC:set_int(26154 + 1325 + 1, life)
	end
end)

local function Cctv(e)
	if not localplayer then
		return
	end
	if e then
		menu.remove_cctvs()
	else
		menu.remove_cctvs(nil)
	end
end
L7NEGCASINO:add_toggle("Remove CCTV", function()
	return e6
end, function()
	e6 = not e6
	Cctv(e6)
end)

local STRKM52 = 52985
L7NEGCASINO:add_action("Crack Casino Fingerprint", function()
	local heist_script = script("fm_mission_controller")
	if heist_script and heist_script:is_active() then
		if heist_script:get_int(STRKM52) == 3 or heist_script:get_int(STRKM52) == 4 then
			heist_script:set_int(STRKM52, 5)
		end
	end
end)

local STRKM51 = 54047
L7NEGCASINO:add_action("Crack Casino Keypads", function()
	local heist_script = script("fm_mission_controller")
	if heist_script and heist_script:is_active() then
		if heist_script:get_int(STRKM51) >= 3 or heist_script:get_int(STRKM51) < 100 then
			heist_script:set_int(STRKM51, 5)
		end
	end
end)

L7NEGCASINO:add_action("Cooldown Killer", function()
	stats.set_int(MPX .. "H3_COMPLETEDPOSIX", -1)
	stats.set_int("MPPLY_H3_COOLDOWN", -1)
end)

L7NEGCASINO:add_action("Reset Preps", function()
	stats.set_int(MPX .. "H3OPT_BITSET1", 0)
	stats.set_int(MPX .. "H3OPT_BITSET0", 0)
end)

L7NEGCASINO:add_action("", null)

L7NEGCASINONote = L7NEGCASINO:add_submenu("Read Me")

L7NEGCASINONote:add_action("                 After all choices and", null)
L7NEGCASINONote:add_action("            pressing «Complete Preps»", null)
L7NEGCASINONote:add_action("                  just wait some time", null)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGCAYO = L7NEGH:add_submenu("Cayo Perlco Heist")

L7NEGCAYO:add_array_item(
	"Presets (Easy Mode)",
	{ "N.Panther Only", "N.PinkD Only", "N.B.Bonds Only", "N.R.Necklace Only", "N.Tequila Only" },
	function()
		return 1
	end,
	function(v)
		if v == 1 then
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
		elseif v == 2 then
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
		elseif v == 3 then
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
		elseif v == 4 then
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
		elseif v == 5 then
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
	end
)

L7NEGCAYO:add_array_item(
	"Presets (Hard Mode)",
	{ "H.Panther Only", "H.PinkD Only", "H.Bonds Only", "H.Necklace Only", "H.Tequila Only" },
	function()
		return 1
	end,
	function(Value)
		if Value == 1 then
			-- PANTHER
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
		elseif Value == 2 then
			-- pink diamond
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
		elseif Value == 3 then
			-- bonds
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
		elseif Value == 4 then
			-- necklace
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
		end
	end
)

-- setup
local setupcayo = L7NEGCAYO:add_submenu("Custom Setup Menu")

setupcayo:add_array_item(
	"Primary Target",
	{ "Tequila", "Ruby Necklace", "Bearer Bonds", "Pink Diamond", "Panther Statue" },
	function()
		return 1
	end,
	function(value)
		if value == 1 then
			stats.set_int(MPX .. "H4CNF_TARGET", 0)
		elseif value == 2 then
			stats.set_int(MPX .. "H4CNF_TARGET", 1)
		elseif value == 3 then
			stats.set_int(MPX .. "H4CNF_TARGET", 2)
		elseif value == 4 then
			stats.set_int(MPX .. "H4CNF_TARGET", 3)
		elseif value == 5 then
			stats.set_int(MPX .. "H4CNF_TARGET", 5)
		end
	end
)

setupcayo:add_array_item("Sec Loot (All Compound)", { "Gold", "Paintings", "Cocaine", "Weed", "Cash" }, function()
	return 1
end, function(value)
	if value == 1 then
		stats.set_int(MPX .. "H4LOOT_GOLD_C", 255)
		stats.set_int(MPX .. "H4LOOT_GOLD_C_SCOPED", 255)
		stats.set_int(MPX .. "H4LOOT_GOLD_V", 1191817)
	elseif value == 2 then
		stats.set_int(MPX .. "H4LOOT_PAINT", -1)
		stats.set_int(MPX .. "H4LOOT_PAINT_SCOPED", -1)
		stats.set_int(MPX .. "H4LOOT_PAINT_V", 403500)
	elseif value == 3 then
		stats.set_int(MPX .. "H4LOOT_COKE_C", -1)
		stats.set_int(MPX .. "H4LOOT_COKE_C_SCOPED", -1)
	elseif value == 4 then
		stats.set_int(MPX .. "H4LOOT_WEED_C", -1)
		stats.set_int(MPX .. "H4LOOT_WEED_C_SCOPED", -1)
	elseif value == 5 then
		stats.set_int(MPX .. "H4LOOT_CASH_C", -1)
		stats.set_int(MPX .. "H4LOOT_CASH_C_SCOPED", -1)
	end
end)

setupcayo:add_array_item("All Island Storages Loot", { "Gold", "Cocaine", "Weed", "Cash" }, function()
	return 1
end, function(value)
	if value == 1 then
		stats.set_int(MPX .. "H4LOOT_GOLD_I", -1)
		stats.set_int(MPX .. "H4LOOT_GOLD_V", 1191817)
		stats.set_int(MPX .. "H4LOOT_GOLD_I_SCOPED", -1)
	elseif value == 2 then
		stats.set_int(MPX .. "H4LOOT_COKE_I", -1)
		stats.set_int(MPX .. "H4LOOT_COKE_I_SCOPED", -1)
	elseif value == 3 then
		stats.set_int(MPX .. "H4LOOT_WEED_I", -1)
		stats.set_int(MPX .. "H4LOOT_WEED_I_SCOPED", -1)
	elseif value == 4 then
		stats.set_int(MPX .. "H4LOOT_CASH_I", -1)
		stats.set_int(MPX .. "H4LOOT_CASH_I_SCOPED", -1)
	end
end)

setupcayo:add_array_item("Set Weapons", { "Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman" }, function()
	return 1
end, function(value)
	if value == 1 then
		stats.set_int(MPX .. "H4CNF_WEAPONS", 1)
	elseif value == 2 then
		stats.set_int(MPX .. "H4CNF_WEAPONS", 2)
	elseif value == 3 then
		stats.set_int(MPX .. "H4CNF_WEAPONS", 3)
	elseif value == 4 then
		stats.set_int(MPX .. "H4CNF_WEAPONS", 4)
	elseif value == 5 then
		stats.set_int(MPX .. "H4CNF_WEAPONS", 5)
	end
end)

setupcayo:add_array_item("Difficulty", { "Normal", "Hard" }, function()
	return 1
end, function(value)
	print("Setting Difficulty")
	if value == 1 then
		stats.set_int(MPX .. "H4_PROGRESS", 126823)
	elseif value == 2 then
		stats.set_int(MPX .. "H4_PROGRESS", 131055)
	end
end)

setupcayo:add_action("Complete Preps", function()
	stats.set_int(MPX .. "H4CNF_UNIFORM", -1)
	stats.set_int(MPX .. "H4CNF_GRAPPEL", -1)
	stats.set_int(MPX .. "H4CNF_TROJAN", 5)
	stats.set_int(MPX .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX .. "H4CNF_HEL_DISRP", 3)
end)

L7NEGCAYO:add_action("Reset Preps", function()
	if HIP:is_active() then
		HIP:set_int(1544, 2)
	end
end)

L7NEGCAYO:add_action("Instant Finish $$", function()
	FMC2020:set_int(48513, 9)
	FMC2020:set_int(49892, 50)
end)

L7NEGCAYO:add_action("---", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGCAYO1911 = L7NEGCAYO:add_submenu("Skip Cayo Perico Cooldown Menu")

L7NEGCAYO1911:add_action("Skip Cayo Cooldown (Solo Mode)", function()
	stats.set_int(MPX .. "H4_TARGET_POSIX", 1659643454)
	stats.set_int(MPX .. "H4_COOLDOWN", 0)
	stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0)
end)

L7NEGCAYO1911:add_action("Skip Cayo Cooldown (Friends Mode)", function()
	stats.set_int(MPX .. "H4_TARGET_POSIX", 1659429119)
	stats.set_int(MPX .. "H4_COOLDOWN", 0)
	stats.set_int(MPX .. "H4_COOLDOWN_HARD", 0)
end)

a13 = 1
L7NEGCAYO1911:add_array_item("Session", { "Go Offline", "Go Online" }, function()
	return a13
end, function(Ses)
	if Ses == 1 then
		menu.disconnect_session()
		sleep(0.01)
		menu.send_key_press(13)
	elseif Ses == 2 then
		globals.set_int(1575032, 8)
		globals.set_int(1574589, 1)
		sleep(3)
		globals.set_int(1574589, 0)
	end
	a13 = Ses
end)

L7NEGCAYO1911:add_action("", null)

L7NEGCAYO1911Note = L7NEGCAYO1911:add_submenu("Read Me")

L7NEGCAYO1911Note:add_action("         Choose a cooldown, Then go offline", null)
L7NEGCAYO1911Note:add_action("                and Then come back online", null)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function Cctv(e)
	if not localplayer then
		return
	end
	if e then
		menu.remove_cctvs()
	else
		menu.remove_cctvs(nil)
	end
end
L7NEGCAYO:add_toggle("Remove CCTV", function()
	return e6
end, function()
	e6 = not e6
	Cctv(e6)
end)

L7NEGCAYO:add_action("Skip Drainage cut", function()
	if FMC2020:is_active() then
		if FMC2020:get_int(29118) >= 4 or FMC2020:get_int(28446) <= 6 then
			FMC2020:set_int(29118, 6)
		end
	end
end)

L7NEGCAYO:add_action("Bypass Fingerprint Scanner", function()
	if FMC2020 and FMC2020:is_active() then
		if FMC2020:get_int(24333) == 4 then
			FMC2020:set_int(24333, 5)
		end
	end
end)

L7NEGCAYO:add_action("Skip Plasma Cutter", function()
	FMC2020:set_float(30357 + 3, 100.0)
end)

L7NEGCAYO:add_action("Kill mission npcs", function()
	menu.kill_all_mission_peds()
end)

L7NEGCAYO:add_action("Kill all npcs", function()
	menu.kill_all_npcs()
end)
RestartKosatkaBoard = 1544

L7NEGCAYO:add_action("Reset Kosatka Board", function()
	if script("heist_island_planning"):is_active() then
		script("heist_island_planning"):set_int(RestartKosatkaBoard, 2)
	end
end)
L7NEGCAYO:add_action("---", function() end)

L7NEGCAYO:add_array_item("TP's Scope Out", {
	"Communications Tower",
	"Control Tower",
	"Power Station",
	"Bolt Cutters #1",
	"Bolt Cutters #2",
	"Bolt Cutters #3",
	"Bolt Cutters #4",
	"Bolt Cutters #5",
	"Bolt Cutters #6",
	"Bolt Cutters #7",
	"Bolt Cutters #8",
	"Bolt Cutters #9",
	"Bolt Cutters #10",
	"Bolt Cutters #11",
	"Bolt Cutters #12",
	"Bolt Cutters #13",
	"Bolt Cutters #14",
	"Bolt Cutters #15",
	"Cutting Powder #1",
	"Cutting Powder #2",
	"Cutting Powder #3",
	"Grappling Hook #1",
	"Grappling Hook #2",
	"Grappling Hook #3",
	"Grappling Hook #4",
	"Grappling Hook #5",
	"Grappling Hook #6",
	"Grappling Hook #7",
	"Grappling Hook #8",
	"Grappling Hook #9",
	"Grappling Hook #10",
	"Guard Clothes #1",
	"Guard Clothes #2",
	"Guard Clothes #3",
	"Guard Clothes #4",
	"Guard Clothes #5",
	"Guard Clothes #6",
	"Guard Clothes #7",
	"Signal Box #1",
	"Signal Box #2",
	"Signal Box #3",
	"Supply Truck #1",
	"Supply Truck #2",
	"Supply Truck #3",
	"Supply Truck #4",
	"Water Tower #1 (North Dock)",
	"Water Tower #2 (Main Dock)",
}, function()
	return xox_2
end, function(value)
	if value == 1 then
		TP(5266.797363, -5427.772461, 139.746445, -0.943473, 0.000000, -0.000000)
	elseif value == 2 then
		TP(4350.219238, -4577.410645, 2.899095, -1.119934, -0.000000, 0.000000)
	elseif value == 3 then
		TP(4478.291992, -4580.129883, 4.258523, -2.885009, -0.000000, 0.000000)
	elseif value == 4 then
		TP(5097.452637, -4620.177734, 1.193875, -2.592525, -0.000000, 0.000000)
	elseif value == 5 then
		TP(4880.295898, -5112.941406, 1.053022, 1.313561, -0.000346, 0.000020)
	elseif value == 6 then
		TP(4537.624512, -4542.424805, 3.546365, 1.941974, 0.000004, -0.000007)
	elseif value == 7 then
		TP(5466.320801, -5230.169922, 25.993027, 2.763307, -0.000000, 0.000000)
	elseif value == 8 then
		TP(4075.548828, -4663.984863, 2.994547, -2.552265, -0.000000, 0.000000)
	elseif value == 9 then
		TP(4522.588867, -4509.868652, 3.188455, -2.631163, -0.000000, 0.000000)
	elseif value == 10 then
		TP(4506.013672, -4656.211914, 10.579565, -0.049160, -0.000000, 0.000000)
	elseif value == 11 then
		TP(4803.885742, -4317.895020, 6.201560, -0.422076, -0.000000, 0.000000)
	elseif value == 12 then
		TP(5071.072266, -4639.869629, 2.112077, 0.523910, 0.000000, -0.000000)
	elseif value == 13 then
		TP(5179.191895, -4669.967285, 5.832691, -2.465155, -0.000000, 0.000000)
	elseif value == 14 then
		TP(5214.377441, -5126.496582, 4.925748, -1.519287, -0.000000, 0.000000)
	elseif value == 15 then
		TP(4954.719727, -5180.171875, 2.966018, -2.558609, -0.000000, 0.000000)
	elseif value == 16 then
		TP(4903.507812, -5345.524414, 8.850177, 2.197429, -0.000000, 0.000000)
	elseif value == 17 then
		TP(4756.349609, -5539.995605, 17.625168, 2.077786, -0.000000, 0.000000)
	elseif value == 18 then
		TP(5365.069336, -5438.819824, 47.831707, 0.996262, -0.000000, 0.000000)
	elseif value == 19 then
		TP(5404.111328, -5171.486328, 30.132875, -0.749873, -0.000000, 0.000000)
	elseif value == 20 then
		TP(5214.664551, -5131.837402, 4.938407, -1.654735, -0.000000, 0.000000)
	elseif value == 21 then
		TP(4924.137695, -5271.690918, 4.351841, -2.826915, -0.000000, 0.000000)
	elseif value == 22 then
		TP(4901.115723, -5332.090820, 27.841076, -0.469437, -0.000000, 0.000000)
	elseif value == 23 then
		TP(4882.464355, -4487.831543, 8.713233, 1.552495, -0.000000, 0.000000)
	elseif value == 24 then
		TP(5609.771484, -5653.084473, 8.651618, -2.502223, -0.000000, 0.000000)
	elseif value == 25 then
		TP(5125.838379, -5095.626953, 0.893209, 2.800476, -0.000000, 0.000000)
	elseif value == 26 then
		TP(4529.709961, -4700.855957, 3.120182, 2.906318, -0.000000, 0.000000)
	elseif value == 27 then
		TP(3901.137451, -4690.617676, 2.826484, 2.661214, -0.000000, 0.000000)
	elseif value == 28 then
		TP(5404.485840, -5170.345215, 30.130934, -1.991591, -0.000000, 0.000000)
	elseif value == 29 then
		TP(5333.016602, -5264.369629, 31.446018, 1.854885, -0.000000, 0.000000)
	elseif value == 30 then
		TP(5110.171387, -4579.133301, 28.417776, 0.901852, -0.000000, 0.000000)
	elseif value == 31 then
		TP(5267.243164, -5429.493164, 139.747177, 2.378908, -0.000000, 0.000000)
	elseif value == 32 then
		TP(5059.213867, -4592.870605, 1.595251, -0.291761, -0.000000, 0.000000)
	elseif value == 33 then
		TP(4949.736328, -5320.138672, 6.776219, 3.108989, -0.000000, 0.000000)
	elseif value == 34 then
		TP(4884.802734, -5452.898926, 29.437197, -2.087807, -0.000000, 0.000000)
	elseif value == 35 then
		TP(4764.295898, -4781.471680, 2.501517, -0.586741, -0.000000, 0.000000)
	elseif value == 36 then
		TP(5170.228516, -4677.545898, 1.122545, -0.371411, -0.000000, 0.000000)
	elseif value == 37 then
		TP(5161.595215, -4993.595215, 11.394773, -2.397844, -0.000000, 0.000000)
	elseif value == 38 then
		TP(5128.021484, -5530.752930, 52.743076, 1.605217, -0.000000, 0.000000)
	elseif value == 39 then
		TP(5262.136719, -5432.140625, 64.297203, 2.467814, -0.000000, 0.000000)
	elseif value == 40 then
		TP(5265.863281, -5421.060059, 64.297638, 0.805274, -0.000000, 0.000000)
	elseif value == 41 then
		TP(5266.750977, -5426.982910, 139.746857, -0.631726, -0.000000, 0.000000)
	elseif value == 42 then
		TP(4517.433105, -4531.979492, 2.820656, -1.275829, -0.000000, 0.000000)
	elseif value == 43 then
		TP(5148.460938, -4620.099121, 1.108461, -1.422905, -0.000000, 0.000000)
	elseif value == 44 then
		TP(4901.324219, -5216.216797, 2.768269, -2.631163, -0.000000, 0.000000)
	elseif value == 45 then
		TP(5152.886719, -5143.897949, 0.997772, -0.205993, -0.000000, 0.000000)
	elseif value == 46 then
		TP(5108.437012, -4580.132812, 28.417776, 1.720010, -0.000000, 0.000000)
	elseif value == 47 then
		TP(4903.939453, -5337.220703, 34.306366, 0.821753, -0.000000, 0.000000)
	end
	xox_2 = value
end)

L7NEGCAYO:add_array_item("TP's Heist", {
	"Drainage Pipe",
	"Entry Drain",
	"Cayo Office",
	"Cayo Primary",
	"Basement Storage",
	"North Storage",
	"West Storage",
	"South Storage",
	"Cayo Gate",
	"Escaped",
}, function()
	return xox_3
end, function(value)
	if value == 1 then
		menu.end_cutscene()
		TP(5045.980957, -5816.833984, -11.489866, 0.884011, -0.000000, 0.000121)
	elseif value == 2 then
		TP(5052.879395, -5771.335938, -6.004176, 1.169803, -0.000000, 0.001638)
	elseif value == 3 then
		menu.end_cutscene()
		TP(5005.557617, -5754.321289, 27.545269, 2.586560, -0.000000, 0.000000)
	elseif value == 4 then
		menu.end_cutscene()
		TP(5007.763184, -5756.029785, 14.184443, 2.467127, -0.000000, 0.000000)
	elseif value == 5 then
		menu.end_cutscene()
		TP(4999.613281, -5749.913086, 13.540487, 2.613005, -0.000000, 0.000000)
	elseif value == 6 then
		TP(5080.862305, -5756.300781, 14.529651, -0.575850, -0.000000, 0.000000)
	elseif value == 7 then
		TP(5030.722168, -5736.470703, 16.565588, 2.439484, -0.000000, 0.000000)
	elseif value == 8 then
		TP(5007.434570, -5787.255859, 16.531698, 0.680315, -0.000000, 0.000000)
	elseif value == 9 then
		menu.end_cutscene()
		TP(4990.194824, -5716.448730, 18.580215, 0.946360, -0.000000, 0.000000)
	elseif value == 10 then
		menu.end_cutscene()
		TP(4639.124023, -6010.004883, -7.475036, 1.930023, -0.000000, -0.000000)
	end
	xox_3 = value
end)

cutsMenu = L7NEGCAYO:add_submenu("Cuts")
cutsMenu:add_array_item(
	"Preset cuts",
	{ "65 all", "80 all", "90 all", "100 all", "138 all-Panther only", "202 all-PinkD only" },
	function()
		return xox_13
	end,
	function(G)
		if G == 1 then
			for i = 1970744 + 831 + 56 + 1, 1970744 + 831 + 56 + 1 + 1 + 1 + 1 do
				globals.set_int(i, 65)
			end
		elseif G == 2 then
			for i = 1970744 + 831 + 56 + 1, 1970744 + 831 + 56 + 1 + 1 + 1 + 1 do
				globals.set_int(i, 80)
			end
		elseif G == 3 then
			for i = 1970744 + 831 + 56 + 1, 1970744 + 831 + 56 + 1 + 1 + 1 + 1 do
				globals.set_int(i, 90)
			end
		elseif G == 4 then
			for i = 1970744 + 831 + 56 + 1, 1970744 + 831 + 56 + 1 + 1 + 1 + 1 do
				globals.set_int(i, 100)
			end
		elseif G == 5 then
			for i = 1970744 + 831 + 56 + 1, 1970744 + 831 + 56 + 1 + 1 + 1 + 1 do
				globals.set_int(i, 138)
			end
		elseif G == 6 then
			for i = 1970744 + 831 + 56 + 1, 1970744 + 831 + 56 + 1 + 1 + 1 + 1 do
				globals.set_int(i, 202)
			end
		end
		xox_13 = value
	end
)

cutsMenu:add_int_range("Player 1", 1, 15, 300, function()
	return globals.get_int(1970744 + 831 + 56 + 1)
end, function(value)
	globals.set_int(1970744 + 831 + 56 + 1, value)
end)
cutsMenu:add_int_range("Player 2", 1, 15, 300, function()
	return globals.get_int(1970744 + 831 + 56 + 1 + 1)
end, function(value)
	globals.set_int(1970744 + 831 + 56 + 1 + 1, value)
end)
cutsMenu:add_int_range("Player 3", 1, 15, 300, function()
	return globals.get_int(1970744 + 831 + 56 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1970744 + 831 + 56 + 1 + 1 + 1, value)
end)
cutsMenu:add_int_range("Player 4", 1, 15, 300, function()
	return globals.get_int(1970744 + 831 + 56 + 1 + 1 + 1 + 1)
end, function(value)
	globals.set_int(1970744 + 831 + 56 + 1 + 1 + 1 + 1, value)
end)

CPVMenu = L7NEGCAYO:add_submenu("Size/Value Editor")

CPVMenu:add_int_range("Bag Size", 900.0, 1800, 999999999, function()
	return globals.get_int(BAS1)
end, function(value)
	globals.set_int(BAS1, value)
end)

CPVMenu:add_int_range("Panther Statue", 50000, 1900000, 25500000, function()
	return globals.get_int(PSV)
end, function(value)
	globals.set_int(PSV, value)
end)

CPVMenu:add_int_range("Pink Diamond", 50000, 1300000, 25500000, function()
	return globals.get_int(PDIAMOND)
end, function(value)
	globals.set_int(PDIAMOND, value)
end)

CPVMenu:add_int_range("Bearer Bonds", 50000, 1100000, 25500000, function()
	return globals.get_int(BB)
end, function(value)
	globals.set_int(BB, value)
end)

CPVMenu:add_int_range("Ruby Necklace", 50000, 1000000, 25500000, function()
	return globals.get_int(RN)
end, function(value)
	globals.set_int(RN, value)
end)

CPVMenu:add_int_range("Tequila", 50000, 900000, 25500000, function()
	return globals.get_int(TEQUILA)
end, function(value)
	globals.set_int(TEQUILA, value)
end)

CPVMenu:add_int_range("Gold", 82587, 330350, 5000000, function()
	return stats.get_int(MPX .. "H4LOOT_GOLD_V")
end, function(value)
	stats.set_int(MPX .. "H4LOOT_GOLD_V", value)
end)

CPVMenu:add_int_range("Paintings", 50000, 189500, 5000000, function()
	return stats.get_int(MPX .. "H4LOOT_PAINT_V")
end, function(value)
	stats.set_int(MPX .. "H4LOOT_PAINT_V", value)
end)

CPVMenu:add_int_range("Cocaine", 50000, 200095, 5000000, function()
	return stats.get_int(MPX .. "H4LOOT_COKE_V")
end, function(value)
	stats.set_int(MPX .. "H4LOOT_COKE_V", value)
end)

CPVMenu:add_int_range("Weed", 50000, 147870, 5000000, function()
	return stats.get_int(MPX .. "H4LOOT_WEED_V")
end, function(value)
	stats.set_int(MPX .. "H4LOOT_WEED_V", value)
end)

CPVMenu:add_int_range("Cash", 50000, 90000, 5000000, function()
	return stats.get_int(MPX .. "H4LOOT_CASH_V")
end, function(value)
	stats.set_int(MPX .. "H4LOOT_CASH_V", value)
end)

CPVMenu:add_action("--For default values, Dont Change", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGDOOMSDAY = L7NEGH:add_submenu("Doomsday Heist Editor")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGDOOMSDAY:add_array_item(
	"Doomsday Act",
	{ "I:Data Breaches", "II:Bogdan Problem", "III:Doomsday Senario" },
	function()
		return xox_5
	end,
	function(value)
		xox_5 = value
		if value == 1 then
			GGP = 503
			GGS = 229383
		elseif value == 2 then
			GGP = 240
			GGS = 229378
		elseif value == 3 then
			GGP = 16368
			GGS = 229380
		end
		stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", GGP)
		stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", GGS)
		stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
	end
)

L7NEGDOOMSDAY:add_action("Complete All", function()
	stats.set_int(MPX .. "GANGOPS_FM_MISSION_PROG", -1)
end)

L7NEGDOOMSDAY:add_action("Reset Preps", function()
	stats.set_int(MPX .. "GANGOPS_FLOW_MISSION_PROG", 240)
	stats.set_int(MPX .. "GANGOPS_HEIST_STATUS", 0)
	stats.set_int(MPX .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
end)

L7NEGDOOMSDAY:add_action("-----", function() end)

L7NEGDOOMSDAY:add_action("Instant Finish $$", function()
	FMC:set_int(19728, 12)
	FMC:set_int(19728 + 2686, 10000000)
	FMC:set_int(28347 + 1, 99999)
	FMC:set_int(31603 + 69, 99999)
end)

L7NEGDOOMSDAY:add_action("(Wait 5 secs  to use after loading, press", function() end)

L7NEGDOOMSDAY:add_action("again 5 secs after loading inside building)", function() end)

L7NEGDOOMSDAY:add_action("-----", function() end)

L7NEGDOOMSDAY:add_action("Bypass Act III Hack", function()
	FMC:set_int(1269 + 135, 3)
end)

L7NEGDOOMSDAY:add_action("Kill mission npcs", function()
	menu.kill_all_mission_peds()
end)

L7NEGDOOMSDAY:add_action("Kill all npcs", function()
	menu.kill_all_npcs()
end)

ddCMenu = L7NEGDOOMSDAY:add_submenu("Cuts")
ddCMenu:add_array_item(
	"Max Cuts All Players",
	{ "I:Data Breaches", "II:Bogdan Problem", "III:Doomsday Senario" },
	function()
		return xox_6
	end,
	function(value)
		if value == 1 then
			globals.set_int(1959865 + 812 + 50 + 1, 209)
			globals.set_int(1959865 + 812 + 50 + 2, 209)
			globals.set_int(1959865 + 812 + 50 + 3, 209)
			globals.set_int(1959865 + 812 + 50 + 4, 209)
		elseif value == 2 then
			globals.set_int(1959865 + 812 + 50 + 1, 143)
			globals.set_int(1959865 + 812 + 50 + 2, 143)
			globals.set_int(1959865 + 812 + 50 + 3, 143)
			globals.set_int(1959865 + 812 + 50 + 4, 143)
		elseif value == 3 then
			globals.set_int(1959865 + 812 + 50 + 1, 113)
			globals.set_int(1959865 + 812 + 50 + 2, 113)
			globals.set_int(1959865 + 812 + 50 + 3, 113)
			globals.set_int(1959865 + 812 + 50 + 4, 113)
		end
		xox_6 = value
	end
)

ddCMenu:add_action("                      ~Manual Cuts ", function() end)

ddCMenu:add_int_range("Doomsday Player 1", 1.0, 15, 313, function()
	return globals.get_int(1959865 + 812 + 50 + 1)
end, function(value)
	globals.set_int(1959865 + 812 + 50 + 1, value)
end)

ddCMenu:add_int_range("Doomsday Player 2", 1.0, 15, 313, function()
	return globals.get_int(1959865 + 812 + 50 + 2)
end, function(value)
	globals.set_int(1959865 + 812 + 50 + 2, value)
end)

ddCMenu:add_int_range("Doomsday Player 3", 1.0, 15, 313, function()
	return globals.get_int(1959865 + 812 + 50 + 3)
end, function(value)
	globals.set_int(1959865 + 812 + 50 + 3, value)
end)

ddCMenu:add_int_range("Doomsday Player 4", 1.0, 15, 313, function()
	return globals.get_int(1959865 + 812 + 50 + 4)
end, function(value)
	globals.set_int(1959865 + 812 + 50 + 4, value)
end)

ddCMenu:add_int_range("Self (non-host)", 1, 0, 1000, function()
	return globals.get_int(2685249 + 6615)
end, function(Cut)
	globals.set_int(2685249 + 6615, Cut)
end)

L7NEGDOOMSDAY:add_action("-----", function() end)

L7NEGDOOMSDAYNote = L7NEGDOOMSDAY:add_submenu("Read Me")

L7NEGDOOMSDAYNote:add_action("                 After all choices and", null)
L7NEGDOOMSDAYNote:add_action("            pressing «Complete Preps»", null)
L7NEGDOOMSDAYNote:add_action("      leave your base and come back in", null)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CasinoT = L7NEGT:add_submenu("Casino Locations Menu ")

local function teleport_myself(x, y, z)
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

CayoT = L7NEGT:add_submenu("Cayo Perlco Locations Menu ")

local function teleport_myself(x, y, z)
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
	teleport_myself(5080.922852, -5756.109375, 14.529856)
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

Teleports1 = L7NEGT:add_submenu("Criminal Enterprises Locations Menu")

local function teleport_myself(x, y, z)
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
	teleport_myself(210.218964, 6136.259766, -155.720383)
end)

Teleports1:add_action("Exit Cleanup", function()
	teleport_myself(369.282410, 6318.566895, -161.227356)
end)

Teleports2 = L7NEGT:add_submenu("M14 Locations Menu")

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

DLC164 = L7NEGT:add_submenu("Gun Van Locations Menu")

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
		localplayer:set_position(894.94, 3603.911, 32.56)
	end
end)

DLC164:add_action("#27 - Hookies", function()
	if localplayer ~= nil then
		localplayer:set_position(-2166.511, 4289.503, 48.733)
	end
end)

DLC164:add_action("#28 - Mt. Chilliad Truck terminal", function()
	if localplayer ~= nil then
		localplayer:set_position(1465.633, 6553.67, 13.771)
	end
end)

DLC164:add_action("#29 - Mirror Park", function()
	if localplayer ~= nil then
		localplayer:set_position(1101.032, -335.172, 66.944)
	end
end)

DLC164:add_action("#30 - Davis", function()
	if localplayer ~= nil then
		localplayer:set_position(149.683, -1655.674, 29.028)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local location_0 = 1

Peyote = L7NEGT:add_submenu("Peyote Plants Menu")
Peyote:add_action("Enable Event", function()
	globals.set_int(262145 + 28150, 1)
end)
Peyote:add_array_item(
	"Location No.",
	{
		"01",
		"02",
		"03",
		"04",
		"05",
		"06",
		"07",
		"08",
		"09",
		"10",
		"11",
		"12",
		"13",
		"14",
		"15",
		"16",
		"17",
		"18",
		"19",
		"20",
		"21",
		"22",
		"23",
		"24",
		"25",
		"26",
		"27",
		"28",
		"29",
		"30",
		"31",
		"32",
		"33",
		"34",
		"35",
		"36",
		"37",
		"38",
		"39",
		"40",
		"41",
		"42",
		"43",
		"44",
		"45",
		"46",
		"47",
		"48",
		"49",
		"50",
		"51",
		"52",
		"53",
		"54",
		"55",
		"56",
		"57",
		"58",
		"59",
		"60",
		"61",
		"62",
		"63",
		"64",
		"65",
		"66",
		"67",
		"68",
		"69",
		"70",
		"71",
		"72",
		"73",
		"74",
		"75",
		"76",
	},
	function()
		return location_0
	end,
	function(location_1)
		if location_1 == 1 then
			localplayer:set_position(vector3(171.36, -1925.84, 20.00))
		elseif location_1 == 2 then
			localplayer:set_position(vector3(-234.66, -1516.68, 31.00))
		elseif location_1 == 3 then
			localplayer:set_position(vector3(-213.58, 6455.25, 31.00))
		elseif location_1 == 4 then
			localplayer:set_position(vector3(327.07, 6430.81, 31.00))
		elseif location_1 == 5 then
			localplayer:set_position(vector3(2267.81, 4597.43, 34.00))
		elseif location_1 == 6 then
			localplayer:set_position(vector3(3102.38, 6034.42, 122.00))
		elseif location_1 == 7 then
			localplayer:set_position(vector3(-35.24, 2868.39, 58.20))
		elseif location_1 == 8 then
			localplayer:set_position(vector3(1733.02, 3850.13, 34.00))
		elseif location_1 == 9 then
			localplayer:set_position(vector3(340.03, 3565.61, 32.40))
		elseif location_1 == 10 then
			localplayer:set_position(vector3(-1858.72, 4806.63, 3.00))
		elseif location_1 == 11 then
			localplayer:set_position(vector3(490.59, 5529.93, 778.00))
		elseif location_1 == 12 then
			localplayer:set_position(vector3(-2792.46, 1432.48, 100.12))
		elseif location_1 == 13 then
			localplayer:set_position(vector3(-2999.09, 769.18, 26.32))
		elseif location_1 == 14 then
			localplayer:set_position(vector3(-855.47, 572.06, 96.00))
		elseif location_1 == 15 then
			localplayer:set_position(vector3(1021.67, 2910.83, 40.67))
		elseif location_1 == 16 then
			localplayer:set_position(vector3(-3078.12, 3202.83, 2.00))
		elseif location_1 == 17 then
			localplayer:set_position(vector3(-1557.40, 2581.65, 0.95))
		elseif location_1 == 18 then
			localplayer:set_position(vector3(2578.65, 5548.08, 60.46))
		elseif location_1 == 19 then
			localplayer:set_position(vector3(2573.03, 1250.68, 43.57))
		elseif location_1 == 20 then
			localplayer:set_position(vector3(-922.25, 4583.20, 230.00))
		elseif location_1 == 21 then
			localplayer:set_position(vector3(2820.14, -759.33, 2.50))
		elseif location_1 == 22 then
			localplayer:set_position(vector3(2385.43, 3335.04, 47.38))
		elseif location_1 == 23 then
			localplayer:set_position(vector3(-1275.06, 1895.22, 102.39))
		elseif location_1 == 24 then
			localplayer:set_position(vector3(1545.86, 1685.54, 109.90))
		elseif location_1 == 25 then
			localplayer:set_position(vector3(727.61, -235.30, 66.31))
		elseif location_1 == 26 then
			localplayer:set_position(vector3(-111.26, -413.31, 35.68))
		elseif location_1 == 27 then
			localplayer:set_position(vector3(-1881.59, -607.46, 15.74))
		elseif location_1 == 28 then
			localplayer:set_position(vector3(1071.73, -686.22, 57.72))
		elseif location_1 == 29 then
			localplayer:set_position(vector3(2066.76, 1940.26, 82.82))
		elseif location_1 == 30 then
			localplayer:set_position(vector3(1614.38, 6611.25, 15.62))
		elseif location_1 == 31 then
			localplayer:set_position(vector3(-1179.61, 3854.49, 489.52))
		elseif location_1 == 32 then
			localplayer:set_position(vector3(2940.20, 2745.01, 43.26))
		elseif location_1 == 33 then
			localplayer:set_position(vector3(1288.92, -1059.64, 39.27))
		elseif location_1 == 34 then
			localplayer:set_position(vector3(-1678.24, 357.73, 84.74))
		elseif location_1 == 35 then
			localplayer:set_position(vector3(-778.95, 117.04, 56.31))
		elseif location_1 == 36 then
			localplayer:set_position(vector3(-794.23, -727.48, 27.57))
		elseif location_1 == 37 then
			localplayer:set_position(vector3(330.13, 440.72, 145.52))
		elseif location_1 == 38 then
			localplayer:set_position(vector3(-1314.87, -424.85, 35.49))
		elseif location_1 == 39 then
			localplayer:set_position(vector3(224.59, 49.05, 84.32))
		elseif location_1 == 40 then
			localplayer:set_position(vector3(1276.21, -1720.49, 54.94))
		elseif location_1 == 41 then
			localplayer:set_position(vector3(-960.93, -2034.24, 9.55))
		elseif location_1 == 42 then
			localplayer:set_position(vector3(-838.78, -1217.12, 6.90))
		elseif location_1 == 43 then
			localplayer:set_position(vector3(2029.60, 498.10, 164.20))
		elseif location_1 == 44 then
			localplayer:set_position(vector3(2764.29, -1600.15, 1.71))
		elseif location_1 == 45 then
			localplayer:set_position(vector3(1498.74, -2722.50, 2.96))
		elseif location_1 == 46 then
			localplayer:set_position(vector3(217.21, -980.86, 29.82))
		elseif location_1 == 47 then
			localplayer:set_position(vector3(686.64, -1109.49, 22.51))
		elseif location_1 == 48 then
			localplayer:set_position(vector3(-220.79, 1006.58, 232.63))
		elseif location_1 == 49 then
			localplayer:set_position(vector3(493.73, 1439.80, 351.79))
		elseif location_1 == 50 then
			localplayer:set_position(vector3(-995.65, 6258.87, 2.46))
		elseif location_1 == 51 then
			localplayer:set_position(vector3(-2871.96, 2605.60, -8.69))
		elseif location_1 == 52 then
			localplayer:set_position(vector3(56.27, 7365.27, -4.06))
		elseif location_1 == 53 then
			localplayer:set_position(vector3(-2861.12, 3900.56, -32.52))
		elseif location_1 == 54 then
			localplayer:set_position(vector3(-1588.69, 5312.98, -3.88))
		elseif location_1 == 55 then
			localplayer:set_position(vector3(475.39, 6946.06, -6.03))
		elseif location_1 == 56 then
			localplayer:set_position(vector3(2453.26, 6692.05, -12.92))
		elseif location_1 == 57 then
			localplayer:set_position(vector3(4235.62, 4105.97, -30.12))
		elseif location_1 == 58 then
			localplayer:set_position(vector3(-138.20, 4060.70, 27.47))
		elseif location_1 == 59 then
			localplayer:set_position(vector3(3395.23, 2252.51, -13.35))
		elseif location_1 == 60 then
			localplayer:set_position(vector3(2946.11, 812.03, -9.74))
		elseif location_1 == 61 then
			localplayer:set_position(vector3(3194.64, -356.94, -31.81))
		elseif location_1 == 62 then
			localplayer:set_position(vector3(-1745.94, -1277.37, -18.53))
		elseif location_1 == 63 then
			localplayer:set_position(vector3(-3320.88, 1335.26, -15.97))
		elseif location_1 == 64 then
			localplayer:set_position(vector3(2183.96, -2714.10, -27.94))
		elseif location_1 == 65 then
			localplayer:set_position(vector3(-169.74, -2890.41, -23.59))
		elseif location_1 == 66 then
			localplayer:set_position(vector3(-164.66, -2309.28, -27.76))
		elseif location_1 == 67 then
			localplayer:set_position(vector3(618.84, -2192.55, -7.27))
		elseif location_1 == 68 then
			localplayer:set_position(vector3(649.53, -3232.57, -15.51))
		elseif location_1 == 69 then
			localplayer:set_position(vector3(-3078.02, -104.28, -17.02))
		elseif location_1 == 70 then
			localplayer:set_position(vector3(-2205.30, -682.45, -9.19))
		elseif location_1 == 71 then
			localplayer:set_position(vector3(825.27, -2790.57, -20.90))
		elseif location_1 == 72 then
			localplayer:set_position(vector3(3415.27, 5253.47, -10.81))
		elseif location_1 == 73 then
			localplayer:set_position(vector3(1219.19, 4119.48, 15.09))
		elseif location_1 == 74 then
			localplayer:set_position(vector3(-1014.59, -1707.17, -7.97))
		elseif location_1 == 75 then
			localplayer:set_position(vector3(1674.98, 5141.88, 150.59))
		elseif location_1 == 76 then
			localplayer:set_position(vector3(-21.09, -1424.03, 30.73))
		end
		location_0 = location_1
	end
)
Snowman = L7NEGT:add_submenu("Snowman Menu")
Snowman:add_array_item(
	"⌨ Location",
	{
		"01",
		"02",
		"03",
		"04",
		"05",
		"06",
		"07",
		"08",
		"09",
		"10",
		"11",
		"12",
		"13",
		"14",
		"15",
		"16",
		"17",
		"18",
		"19",
		"20",
		"21",
		"22",
		"23",
		"24",
		"25",
	},
	function()
		return location_0
	end,
	function(location_1)
		if location_1 == 1 then
			localplayer:set_position(vector3(-955.5352, -782.4186, 15.925326))
		elseif location_1 == 2 then
			localplayer:set_position(vector3(-819.9067, 165.35524, 71.26295))
		elseif location_1 == 3 then
			localplayer:set_position(vector3(-247.92003, -1561.2175, 32.22973))
		elseif location_1 == 4 then
			localplayer:set_position(vector3(901.3996, -288.05026, 65.643715))
		elseif location_1 == 5 then
			localplayer:set_position(vector3(1275.6772, -642.3789, 68.208786))
		elseif location_1 == 6 then
			localplayer:set_position(vector3(1993.1008, 3829.6396, 32.167336))
		elseif location_1 == 7 then
			localplayer:set_position(vector3(-375.47916, 6230.158, 31.490055))
		elseif location_1 == 8 then
			localplayer:set_position(vector3(-1414.4647, 5094.9272, 60.674263))
		elseif location_1 == 9 then
			localplayer:set_position(vector3(-1946.0231, 594.93756, 119.79223))
		elseif location_1 == 10 then
			localplayer:set_position(vector3(-1100.889, -1401.0138, 5.215467))
		elseif location_1 == 11 then
			localplayer:set_position(vector3(-780.418, 877.2859, 203.18001))
		elseif location_1 == 12 then
			localplayer:set_position(vector3(-455.12027, 1130.5625, 325.89175))
		elseif location_1 == 13 then
			localplayer:set_position(vector3(221.46722, -107.01075, 69.763985))
		elseif location_1 == 14 then
			localplayer:set_position(vector3(1560.3787, 6447.053, 23.9866))
		elseif location_1 == 15 then
			localplayer:set_position(vector3(3301.7886, 5149.8853, 18.34274))
		elseif location_1 == 16 then
			localplayer:set_position(vector3(1703.0568, 4671.928, 43.15301))
		elseif location_1 == 17 then
			localplayer:set_position(vector3(224.9161, 3107.3345, 42.18394))
		elseif location_1 == 18 then
			localplayer:set_position(vector3(2360.0037, 2522.7166, 46.66731))
		elseif location_1 == 19 then
			localplayer:set_position(vector3(1510.8555, 1725.0353, 109.89355))
		elseif location_1 == 20 then
			localplayer:set_position(vector3(-48.96374, 1964.4028, 189.87181))
		elseif location_1 == 21 then
			localplayer:set_position(vector3(-1516.2083, 2140.2168, 56.11924))
		elseif location_1 == 22 then
			localplayer:set_position(vector3(-2826.2356, 1424.6211, 100.706116))
		elseif location_1 == 23 then
			localplayer:set_position(vector3(-2957.531, 723.6389, 28.792404))
		elseif location_1 == 24 then
			localplayer:set_position(vector3(1341.4302, -1583.5093, 54.135414))
		elseif location_1 == 25 then
			localplayer:set_position(vector3(178.00232, -895.9712, 30.69326))
		end
		location_0 = location_1
	end
)
Lantern = L7NEGT:add_submenu("Jack o'Lantern Menu")
Lantern:add_action("Enable Event", function()
	globals.set_int(262145 + 33099, 1)
end)
Lantern:add_array_item(
	"Location No.",
	{
		"01",
		"02",
		"03",
		"04",
		"05",
		"06",
		"07",
		"08",
		"09",
		"10",
		"11",
		"12",
		"13",
		"14",
		"15",
		"16",
		"17",
		"18",
		"19",
		"20",
		"21",
		"22",
		"23",
		"24",
		"25",
		"26",
		"27",
		"28",
		"29",
		"30",
		"31",
		"32",
		"33",
		"34",
		"35",
		"36",
		"37",
		"38",
		"39",
		"40",
		"41",
		"42",
		"43",
		"44",
		"45",
		"46",
		"47",
		"48",
		"49",
		"50",
		"51",
		"52",
		"53",
		"54",
		"55",
		"56",
		"57",
		"58",
		"59",
		"60",
		"61",
		"62",
		"63",
		"64",
		"65",
		"66",
		"67",
		"68",
		"69",
		"70",
		"71",
		"72",
		"73",
		"74",
		"75",
		"76",
		"77",
		"78",
		"79",
		"80",
		"81",
		"82",
		"83",
		"84",
		"85",
		"86",
		"87",
		"88",
		"89",
		"90",
		"91",
		"92",
		"93",
		"94",
		"95",
		"96",
		"97",
		"98",
		"99",
		"100",
		"101",
		"102",
		"103",
		"104",
		"105",
		"106",
		"107",
		"108",
		"109",
		"110",
		"111",
		"112",
		"113",
		"114",
		"115",
		"116",
		"117",
		"118",
		"119",
		"120",
		"121",
		"122",
		"123",
		"124",
		"125",
		"126",
		"127",
		"128",
		"129",
		"130",
		"131",
		"132",
		"133",
		"134",
		"135",
		"136",
		"137",
		"138",
		"139",
		"140",
		"141",
		"142",
		"143",
		"144",
		"145",
		"146",
		"147",
		"148",
		"149",
		"150",
		"151",
		"152",
		"153",
		"154",
		"155",
		"156",
		"157",
		"158",
		"159",
		"160",
		"161",
		"162",
		"163",
		"164",
		"165",
		"166",
		"167",
		"168",
		"169",
		"170",
		"171",
		"172",
		"173",
		"174",
		"175",
		"176",
		"177",
		"178",
		"179",
		"180",
		"181",
		"182",
		"183",
		"184",
		"185",
		"186",
		"187",
		"188",
		"189",
		"190",
		"191",
		"192",
		"193",
		"194",
		"195",
		"196",
		"197",
		"198",
		"199",
		"200",
	},
	function()
		return location_0
	end,
	function(location_1)
		if location_1 == 1 then
			localplayer:set_position(vector3(1434.581177, -1494.808960, 61.924484))
		elseif location_1 == 2 then
			localplayer:set_position(vector3(1318.091797, -1557.906860, 49.406536))
		elseif location_1 == 3 then
			localplayer:set_position(vector3(1297.748535, -1621.982666, 52.924953))
		elseif location_1 == 4 then
			localplayer:set_position(vector3(1312.340576, -1701.004272, 56.537983))
		elseif location_1 == 5 then
			localplayer:set_position(vector3(1256.791260, -1760.271851, 47.959789))
		elseif location_1 == 6 then
			localplayer:set_position(vector3(1204.294312, -1672.812622, 41.058277))
		elseif location_1 == 7 then
			localplayer:set_position(vector3(1232.604492, -1593.003418, 52.067909))
		elseif location_1 == 8 then
			localplayer:set_position(vector3(1152.968140, -1529.164673, 33.691978))
		elseif location_1 == 9 then
			localplayer:set_position(vector3(1183.517090, -1461.732788, 33.594597))
		elseif location_1 == 10 then
			localplayer:set_position(vector3(1210.140625, -1390.762085, 34.076641))
		elseif location_1 == 11 then
			localplayer:set_position(vector3(411.362427, -1485.312622, 28.570503))
		elseif location_1 == 12 then
			localplayer:set_position(vector3(323.141052, -1759.944092, 28.016262))
		elseif location_1 == 13 then
			localplayer:set_position(vector3(428.983459, -1723.205811, 27.929178))
		elseif location_1 == 14 then
			localplayer:set_position(vector3(495.846832, -1817.259521, 27.187927))
		elseif location_1 == 15 then
			localplayer:set_position(vector3(387.837158, -1883.815430, 24.304468))
		elseif location_1 == 16 then
			localplayer:set_position(vector3(326.185211, -1947.658691, 23.467230))
		elseif location_1 == 17 then
			localplayer:set_position(vector3(379.337311, -2069.736328, 19.941431))
		elseif location_1 == 18 then
			localplayer:set_position(vector3(294.090973, -2098.108154, 15.802926))
		elseif location_1 == 19 then
			localplayer:set_position(vector3(221.574402, -2036.115112, 16.712660))
		elseif location_1 == 20 then
			localplayer:set_position(vector3(180.028915, -1930.020508, 19.712641))
		elseif location_1 == 21 then
			localplayer:set_position(vector3(150.242844, -1868.382568, 22.930975))
		elseif location_1 == 22 then
			localplayer:set_position(vector3(25.318865, -1894.664185, 21.286211))
		elseif location_1 == 23 then
			localplayer:set_position(vector3(-18.668180, -1855.332764, 23.662672))
		elseif location_1 == 24 then
			localplayer:set_position(vector3(-79.454300, -1641.520874, 28.009012))
		elseif location_1 == 25 then
			localplayer:set_position(vector3(-158.293228, -1680.115479, 35.666103))
		elseif location_1 == 26 then
			localplayer:set_position(vector3(-193.209412, -1609.052246, 32.701607))
		elseif location_1 == 27 then
			localplayer:set_position(vector3(-63.751331, -1452.771973, 30.823833))
		elseif location_1 == 28 then
			localplayer:set_position(vector3(-123.541191, -1490.525513, 32.473259))
		elseif location_1 == 29 then
			localplayer:set_position(vector3(-223.600693, -1500.161133, 30.692902))
		elseif location_1 == 30 then
			localplayer:set_position(vector3(-294.518921, -1332.482910, 29.970270))
		elseif location_1 == 31 then
			localplayer:set_position(vector3(1014.117920, -423.848389, 63.675259))
		elseif location_1 == 32 then
			localplayer:set_position(vector3(1266.007446, -428.332397, 68.079376))
		elseif location_1 == 33 then
			localplayer:set_position(vector3(1370.628906, -558.052185, 73.039597))
		elseif location_1 == 34 then
			localplayer:set_position(vector3(1324.806519, -580.172913, 71.912575))
		elseif location_1 == 35 then
			localplayer:set_position(vector3(1204.557251, -620.731323, 64.821854))
		elseif location_1 == 36 then
			localplayer:set_position(vector3(967.759155, -547.430298, 58.004089))
		elseif location_1 == 37 then
			localplayer:set_position(vector3(961.077148, -594.268860, 58.192711))
		elseif location_1 == 38 then
			localplayer:set_position(vector3(999.061157, -727.578979, 56.227200))
		elseif location_1 == 39 then
			localplayer:set_position(vector3(1143.774292, -981.787659, 44.845215))
		elseif location_1 == 40 then
			localplayer:set_position(vector3(845.798950, -1019.603210, 26.234652))
		elseif location_1 == 41 then
			localplayer:set_position(vector3(805.100342, -1075.361694, 27.369886))
		elseif location_1 == 42 then
			localplayer:set_position(vector3(480.726227, -975.737000, 26.683889))
		elseif location_1 == 43 then
			localplayer:set_position(vector3(389.172333, -972.175659, 28.140848))
		elseif location_1 == 44 then
			localplayer:set_position(vector3(360.894836, -1070.573853, 28.238062))
		elseif location_1 == 45 then
			localplayer:set_position(vector3(244.050507, -1071.695679, 27.986931))
		elseif location_1 == 46 then
			localplayer:set_position(vector3(264.044403, -1028.192871, 27.911451))
		elseif location_1 == 47 then
			localplayer:set_position(vector3(75.252281, -1026.460449, 28.174519))
		elseif location_1 == 48 then
			localplayer:set_position(vector3(-16.975662, -977.996521, 28.062405))
		elseif location_1 == 49 then
			localplayer:set_position(vector3(66.998047, -961.704041, 28.057564))
		elseif location_1 == 50 then
			localplayer:set_position(vector3(130.983887, -567.115417, 42.440754))
		elseif location_1 == 51 then
			localplayer:set_position(vector3(-191.763809, -764.868286, 29.154016))
		elseif location_1 == 52 then
			localplayer:set_position(vector3(-232.445236, -911.110535, 31.010803))
		elseif location_1 == 53 then
			localplayer:set_position(vector3(-552.145813, -815.285950, 29.390755))
		elseif location_1 == 54 then
			localplayer:set_position(vector3(-731.544312, -676.678467, 28.973450))
		elseif location_1 == 55 then
			localplayer:set_position(vector3(-1025.704224, -921.141296, 3.741233))
		elseif location_1 == 56 then
			localplayer:set_position(vector3(-962.515381, -942.297180, 0.845313))
		elseif location_1 == 57 then
			localplayer:set_position(vector3(-841.248718, -1206.873657, 5.163064))
		elseif location_1 == 58 then
			localplayer:set_position(vector3(-969.639954, -1094.212158, 0.8505334))
		elseif location_1 == 59 then
			localplayer:set_position(vector3(-1075.960327, -1026.114990, 3.245211))
		elseif location_1 == 60 then
			localplayer:set_position(vector3(-1150.731567, -992.529785, 0.850194))
		elseif location_1 == 61 then
			localplayer:set_position(vector3(-1125.693848, -1090.169067, 0.850338))
		elseif location_1 == 62 then
			localplayer:set_position(vector3(-1207.256836, -1136.133057, 6.418141))
		elseif location_1 == 63 then
			localplayer:set_position(vector3(-1185.031738, -1560.465698, 3.061427))
		elseif location_1 == 64 then
			localplayer:set_position(vector3(-1337.111938, -1282.580566, 3.536002))
		elseif location_1 == 65 then
			localplayer:set_position(vector3(-1291.436401, -1115.384399, 5.380210))
		elseif location_1 == 66 then
			localplayer:set_position(vector3(-1505.406006, -938.584167, 8.059047))
		elseif location_1 == 67 then
			localplayer:set_position(vector3(-1581.442627, -951.199219, 11.717396))
		elseif location_1 == 68 then
			localplayer:set_position(vector3(-1187.069458, -564.099121, 26.317165))
		elseif location_1 == 69 then
			localplayer:set_position(vector3(-1340.669434, -408.527100, 35.059433))
		elseif location_1 == 70 then
			localplayer:set_position(vector3(-1534.179565, -425.168396, 34.291149))
		elseif location_1 == 71 then
			localplayer:set_position(vector3(-1977.575928, -534.048889, 10.412008))
		elseif location_1 == 72 then
			localplayer:set_position(vector3(-1886.251953, -367.071625, 47.764736))
		elseif location_1 == 73 then
			localplayer:set_position(vector3(-1686.079102, -292.055634, 50.593338))
		elseif location_1 == 74 then
			localplayer:set_position(vector3(-1729.297974, -191.002090, 57.047939))
		elseif location_1 == 75 then
			localplayer:set_position(vector3(-1549.251831, -89.285751, 53.629169))
		elseif location_1 == 76 then
			localplayer:set_position(vector3(-1465.009766, -30.447273, 53.408463))
		elseif location_1 == 77 then
			localplayer:set_position(vector3(-1473.790649, 62.652233, 51.955498))
		elseif location_1 == 78 then
			localplayer:set_position(vector3(-1565.397949, 41.662537, 57.540710))
		elseif location_1 == 79 then
			localplayer:set_position(vector3(-1539.457520, 128.534393, 55.480267))
		elseif location_1 == 80 then
			localplayer:set_position(vector3(-1649.843994, 148.785080, 60.872307))
		elseif location_1 == 81 then
			localplayer:set_position(vector3(749.970276, 220.890854, 85.730003))
		elseif location_1 == 82 then
			localplayer:set_position(vector3(348.487152, 442.021454, 146.400879))
		elseif location_1 == 83 then
			localplayer:set_position(vector3(327.944977, 536.017639, 152.462311))
		elseif location_1 == 84 then
			localplayer:set_position(vector3(215.329636, 621.132812, 186.248245))
		elseif location_1 == 85 then
			localplayer:set_position(vector3(7.990458, 544.689697, 174.240616))
		elseif location_1 == 86 then
			localplayer:set_position(vector3(56.627422, 454.376404, 145.430801))
		elseif location_1 == 87 then
			localplayer:set_position(vector3(169.621765, 488.189667, 141.616394))
		elseif location_1 == 88 then
			localplayer:set_position(vector3(125.038742, 64.603813, 78.442604))
		elseif location_1 == 89 then
			localplayer:set_position(vector3(85.067253, -93.484367, 59.143009))
		elseif location_1 == 90 then
			localplayer:set_position(vector3(14.717505, -5.760206, 68.813988))
		elseif location_1 == 91 then
			localplayer:set_position(vector3(-436.087738, -67.952057, 41.706535))
		elseif location_1 == 92 then
			localplayer:set_position(vector3(-373.813538, 44.969456, 53.129925))
		elseif location_1 == 93 then
			localplayer:set_position(vector3(-175.594559, 89.340088, 68.998276))
		elseif location_1 == 94 then
			localplayer:set_position(vector3(-565.616150, 168.983398, 65.538330))
		elseif location_1 == 95 then
			localplayer:set_position(vector3(-598.232544, 275.290619, 80.810440))
		elseif location_1 == 96 then
			localplayer:set_position(vector3(-146.931183, 288.287903, 95.503975))
		elseif location_1 == 97 then
			localplayer:set_position(vector3(-87.271278, 425.587616, 111.912392))
		elseif location_1 == 98 then
			localplayer:set_position(vector3(-252.625534, 397.004730, 109.946564))
		elseif location_1 == 99 then
			localplayer:set_position(vector3(-369.354126, 347.407196, 108.114899))
		elseif location_1 == 100 then
			localplayer:set_position(vector3(-573.230042, 402.716095, 99.368492))
		elseif location_1 == 101 then
			localplayer:set_position(vector3(-584.765686, 496.261749, 105.802574))
		elseif location_1 == 102 then
			localplayer:set_position(vector3(-352.459045, 469.861053, 111.272270))
		elseif location_1 == 103 then
			localplayer:set_position(vector3(-178.125549, 503.593872, 135.551987))
		elseif location_1 == 104 then
			localplayer:set_position(vector3(-136.874252, 595.974915, 203.303223))
		elseif location_1 == 105 then
			localplayer:set_position(vector3(-247.243790, 619.652405, 186.510178))
		elseif location_1 == 106 then
			localplayer:set_position(vector3(-346.281616, 625.225159, 170.056915))
		elseif location_1 == 107 then
			localplayer:set_position(vector3(-445.562164, 684.065796, 151.650650))
		elseif location_1 == 108 then
			localplayer:set_position(vector3(-491.010986, 740.993591, 161.535828))
		elseif location_1 == 109 then
			localplayer:set_position(vector3(-579.493774, 736.161072, 182.526932))
		elseif location_1 == 110 then
			localplayer:set_position(vector3(-549.261047, 827.965210, 196.220291))
		elseif location_1 == 111 then
			localplayer:set_position(vector3(-149.519211, 995.026306, 235.537567))
		elseif location_1 == 112 then
			localplayer:set_position(vector3(-821.168213, 814.200195, 199.545700))
		elseif location_1 == 113 then
			localplayer:set_position(vector3(-703.407898, 591.646423, 140.869995))
		elseif location_1 == 114 then
			localplayer:set_position(vector3(-716.630310, 490.652618, 107.965691))
		elseif location_1 == 115 then
			localplayer:set_position(vector3(-821.048706, 268.837524, 84.892586))
		elseif location_1 == 116 then
			localplayer:set_position(vector3(-863.629517, 387.783356, 86.129707))
		elseif location_1 == 117 then
			localplayer:set_position(vector3(-882.328552, 518.721924, 91.141586))
		elseif location_1 == 118 then
			localplayer:set_position(vector3(-937.415100, 589.408447, 100.195312))
		elseif location_1 == 119 then
			localplayer:set_position(vector3(-887.551086, 701.678711, 149.417191))
		elseif location_1 == 120 then
			localplayer:set_position(vector3(-1020.178894, 716.203674, 162.686401))
		elseif location_1 == 121 then
			localplayer:set_position(vector3(-1166.027588, 729.194946, 154.211594))
		elseif location_1 == 122 then
			localplayer:set_position(vector3(-1291.383911, 648.885010, 140.199905))
		elseif location_1 == 123 then
			localplayer:set_position(vector3(-1124.626709, 575.734802, 103.055000))
		elseif location_1 == 124 then
			localplayer:set_position(vector3(-1024.506104, 502.218384, 79.255287))
		elseif location_1 == 125 then
			localplayer:set_position(vector3(-966.512451, 434.859009, 78.671555))
		elseif location_1 == 126 then
			localplayer:set_position(vector3(-1023.245361, 359.682251, 70.056602))
		elseif location_1 == 127 then
			localplayer:set_position(vector3(-1130.484985, 391.969757, 69.441147))
		elseif location_1 == 128 then
			localplayer:set_position(vector3(-1178.350708, 290.212646, 68.198738))
		elseif location_1 == 129 then
			localplayer:set_position(vector3(-1215.850708, 460.558350, 90.553658))
		elseif location_1 == 130 then
			localplayer:set_position(vector3(-1312.920288, 452.977936, 97.879066))
		elseif location_1 == 131 then
			localplayer:set_position(vector3(-1499.075195, 520.862732, 116.972198))
		elseif location_1 == 132 then
			localplayer:set_position(vector3(-1813.917847, 344.151672, 87.253471))
		elseif location_1 == 133 then
			localplayer:set_position(vector3(-1961.207275, 249.182205, 83.922012))
		elseif location_1 == 134 then
			localplayer:set_position(vector3(-2005.261841, 447.706787, 100.982285))
		elseif location_1 == 135 then
			localplayer:set_position(vector3(-1974.006348, 627.074402, 121.236298))
		elseif location_1 == 136 then
			localplayer:set_position(vector3(-1523.962524, 854.170227, 180.294525))
		elseif location_1 == 137 then
			localplayer:set_position(vector3(-3084.227539, 222.587875, 12.690159))
		elseif location_1 == 138 then
			localplayer:set_position(vector3(-3034.164795, 492.005524, 5.467818))
		elseif location_1 == 139 then
			localplayer:set_position(vector3(-2999.262695, 694.002991, 24.150764))
		elseif location_1 == 140 then
			localplayer:set_position(vector3(-3234.858887, 934.295593, 15.850909))
		elseif location_1 == 141 then
			localplayer:set_position(vector3(-3202.787109, 1151.574829, 8.355104))
		elseif location_1 == 142 then
			localplayer:set_position(vector3(-3180.688232, 1291.906372, 13.120326))
		elseif location_1 == 143 then
			localplayer:set_position(vector3(-2551.712402, 1912.145386, 167.768417))
		elseif location_1 == 144 then
			localplayer:set_position(vector3(-1872.429932, 2029.911011, 138.037140))
		elseif location_1 == 145 then
			localplayer:set_position(vector3(-1112.209106, 2686.990479, 17.318859))
		elseif location_1 == 146 then
			localplayer:set_position(vector3(-262.114075, 2194.963135, 129.098648))
		elseif location_1 == 147 then
			localplayer:set_position(vector3(-267.503265, 2626.278564, 60.810768))
		elseif location_1 == 148 then
			localplayer:set_position(vector3(-462.839874, 2856.521973, 33.321205))
		elseif location_1 == 149 then
			localplayer:set_position(vector3(-327.331085, 2820.612305, 57.069534))
		elseif location_1 == 150 then
			localplayer:set_position(vector3(-289.165649, 2837.083496, 54.012520))
		elseif location_1 == 151 then
			localplayer:set_position(vector3(-38.089405, 2866.223145, 57.879650))
		elseif location_1 == 152 then
			localplayer:set_position(vector3(200.134537, 3031.658691, 42.007084))
		elseif location_1 == 153 then
			localplayer:set_position(vector3(245.562866, 3167.225342, 41.543571))
		elseif location_1 == 154 then
			localplayer:set_position(vector3(36.286015, 3668.123779, 38.331520))
		elseif location_1 == 155 then
			localplayer:set_position(vector3(92.681717, 3741.556885, 38.248653))
		elseif location_1 == 156 then
			localplayer:set_position(vector3(439.687134, 3574.860352, 31.938606))
		elseif location_1 == 157 then
			localplayer:set_position(vector3(470.906616, 2611.910889, 41.949657))
		elseif location_1 == 158 then
			localplayer:set_position(vector3(561.570679, 2599.967529, 41.738277))
		elseif location_1 == 159 then
			localplayer:set_position(vector3(734.955811, 2523.633057, 71.924843))
		elseif location_1 == 160 then
			localplayer:set_position(vector3(721.653381, 2332.206543, 50.450310))
		elseif location_1 == 161 then
			localplayer:set_position(vector3(790.147888, 2182.331055, 50.818352))
		elseif location_1 == 162 then
			localplayer:set_position(vector3(841.859131, 2114.335449, 51.001461))
		elseif location_1 == 163 then
			localplayer:set_position(vector3(1352.933716, 1147.012451, 112.459045))
		elseif location_1 == 164 then
			localplayer:set_position(vector3(1529.204956, 1728.803955, 108.681503))
		elseif location_1 == 165 then
			localplayer:set_position(vector3(1531.197266, 2219.515381, 75.833237))
		elseif location_1 == 166 then
			localplayer:set_position(vector3(1421.380981, 3666.921387, 38.428417))
		elseif location_1 == 167 then
			localplayer:set_position(vector3(1664.273926, 3824.378662, 33.593254))
		elseif location_1 == 168 then
			localplayer:set_position(vector3(1762.277954, 3872.228516, 33.132488))
		elseif location_1 == 169 then
			localplayer:set_position(vector3(1925.091553, 3917.555664, 31.198433))
		elseif location_1 == 170 then
			localplayer:set_position(vector3(1914.172241, 3825.941162, 31.136677))
		elseif location_1 == 171 then
			localplayer:set_position(vector3(1773.624268, 3740.501953, 33.356308))
		elseif location_1 == 172 then
			localplayer:set_position(vector3(1856.470215, 3681.635254, 32.958481))
		elseif location_1 == 173 then
			localplayer:set_position(vector3(1999.776611, 3776.771484, 30.880787))
		elseif location_1 == 174 then
			localplayer:set_position(vector3(1991.811035, 3057.610840, 45.760735))
		elseif location_1 == 175 then
			localplayer:set_position(vector3(2168.261475, 3380.211670, 45.134487))
		elseif location_1 == 176 then
			localplayer:set_position(vector3(2178.444824, 3499.422119, 44.197418))
		elseif location_1 == 177 then
			localplayer:set_position(vector3(2590.153320, 3169.243896, 49.646759))
		elseif location_1 == 178 then
			localplayer:set_position(vector3(2620.696533, 3282.523926, 53.951210))
		elseif location_1 == 179 then
			localplayer:set_position(vector3(2985.502930, 3484.042236, 70.081779))
		elseif location_1 == 180 then
			localplayer:set_position(vector3(2420.516602, 4020.245605, 35.535358))
		elseif location_1 == 181 then
			localplayer:set_position(vector3(2638.094482, 4247.965332, 43.502384))
		elseif location_1 == 182 then
			localplayer:set_position(vector3(3689.367188, 4563.361328, 23.881674))
		elseif location_1 == 183 then
			localplayer:set_position(vector3(3315.741455, 5172.885254, 17.129362))
		elseif location_1 == 184 then
			localplayer:set_position(vector3(2234.621094, 5609.286133, 53.348442))
		elseif location_1 == 185 then
			localplayer:set_position(vector3(2451.511963, 4961.811035, 44.201416))
		elseif location_1 == 186 then
			localplayer:set_position(vector3(1967.214966, 4621.931641, 39.482288))
		elseif location_1 == 187 then
			localplayer:set_position(vector3(1664.723511, 4773.646973, 40.687389))
		elseif location_1 == 188 then
			localplayer:set_position(vector3(1723.661011, 4642.196777, 42.564026))
		elseif location_1 == 189 then
			localplayer:set_position(vector3(1311.947632, 4361.838867, 39.552631))
		elseif location_1 == 190 then
			localplayer:set_position(vector3(724.281311, 4185.006348, 39.409229))
		elseif location_1 == 191 then
			localplayer:set_position(vector3(-771.858582, 5511.423340, 33.605061))
		elseif location_1 == 192 then
			localplayer:set_position(vector3(-342.642487, 6163.851074, 30.190174))
		elseif location_1 == 193 then
			localplayer:set_position(vector3(-402.742828, 6314.299805, 27.649906))
		elseif location_1 == 194 then
			localplayer:set_position(vector3(-306.322205, 6331.539551, 31.189320))
		elseif location_1 == 195 then
			localplayer:set_position(vector3(-245.945114, 6410.604492, 29.897928))
		elseif location_1 == 196 then
			localplayer:set_position(vector3(-105.598267, 6313.783691, 30.190372))
		elseif location_1 == 197 then
			localplayer:set_position(vector3(-112.187599, 6460.697266, 30.168459))
		elseif location_1 == 198 then
			localplayer:set_position(vector3(-50.652882, 6582.884766, 29.876881))
		elseif location_1 == 199 then
			localplayer:set_position(vector3(54.402122, 6642.595215, 30.223076))
		elseif location_1 == 200 then
			localplayer:set_position(vector3(1706.896240, 6422.760254, 31.335125))
		end
		location_0 = location_1
	end
)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG3 = L7NEG:add_submenu("1.68 Unlocker Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG3:add_action("Unlock 1.68 New Vehicles", function()
	globals.set_int(262145 + 36301, 1)
	globals.set_int(262145 + 36286, 1)
	globals.set_int(262145 + 36291, 1)
	globals.set_int(262145 + 36302, 1)
	globals.set_int(262145 + 36296, 1)
	globals.set_int(262145 + 36295, 1)
	globals.set_int(262145 + 36300, 1)
	globals.set_int(262145 + 36293, 1)
	globals.set_int(262145 + 36296, 1)
	globals.set_int(262145 + 36298, 1)
	globals.set_int(262145 + 36292, 1)
	globals.set_int(262145 + 36287, 1)
	globals.set_int(262145 + 36285, 1)
	globals.set_int(262145 + 36297, 1)
	globals.set_int(262145 + 36304, 1)
	globals.set_int(262145 + 36303, 1)
	globals.set_int(262145 + 36289, 1)
	globals.set_int(262145 + 36288, 1)
	globals.set_int(262145 + 36290, 1)
end)

L7NEG3:add_action("Enable Vincent Contact Missions", function()
	globals.set_int(262145 + 36058, 1)
end)

L7NEG3:add_action("Enable Xmass 2023 Gifts", function()
	globals.set_int(262145 + 36250, 1) --XMASGIFTS2023
	globals.set_int(262145 + 36251, 1) --NEWYEARSGIFTS2023
end)

L7NEG3:add_action("Unlock Missed Guns In The GunVan", function()
	globals.set_int(262145 + 34328 + 5, -22923932) ----- RailGun
	globals.set_int(262145 + 34328 + 6, -1238556825) ----- WidoMaker
	globals.set_int(262145 + 34328 + 7, -1355376991) ----- RayPistol
	globals.set_int(262145 + 34328 + 8, 1198256469) ----- HellBringer
	globals.set_int(262145 + 34328 + 9, 350597077) ----- TecPistol
	globals.set_int(262145 + 34328 + 10, 2138347493) ----- FireWork Launcher
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGEVENTS = L7NEG:add_submenu("Events Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

tempMenu = CSU:add_submenu("Temporary Unlocks")

tempMenu:add_toggle("Unlock Hats", function()
	return globals.get_boolean(HA1)
end, function(value)
	for i = HA1, HA2 do
		globals.set_boolean(i, value)
	end
	globals.set_boolean(HA3, value)
	globals.set_boolean(HA4, value)
	globals.set_boolean(HA5, value)
	globals.set_boolean(HA6, value)
	globals.set_boolean(HA7, value)
	globals.set_boolean(HA8, value)
	globals.set_boolean(HA9, value)
	globals.set_boolean(HA10, value)
	globals.set_boolean(HA11, value)
	globals.set_boolean(HA12, value)
end)

tempMenu:add_toggle("Unlock Brand Shirts", function()
	return globals.get_boolean(BS1)
end, function(value)
	for i = BS1, BS2 do
		globals.set_boolean(i, value)
	end
	for j = BS3, BS4 do
		globals.set_boolean(j, value)
	end
	for k = BS5, BS6 do
		globals.set_boolean(k, value)
	end
	for l = BS7, BS8 do
		globals.set_boolean(l, value)
	end
	globals.set_boolean(BS9, value)
	globals.set_boolean(BS10, value)
	globals.set_boolean(BS11, value)
	globals.set_boolean(BS12, value)
	globals.set_boolean(BS13, value)
end)

tempMenu:add_toggle("Unlock Knock Offs T-shirts", function()
	return globals.get_boolean(KT1)
end, function(value)
	for i = KT1, KT2 do
		globals.set_boolean(i, value)
	end
end)

tempMenu:add_toggle("Unlock Manufactures Clothing", function()
	return globals.get_boolean(MC1)
end, function(value)
	globals.set_boolean(MC1, value)
	for i = MC2, MC3 do
		globals.set_boolean(i, value)
	end
end)

tempMenu:add_toggle("Unlock Movie Shirts", function()
	return globals.get_boolean(MS1)
end, function(value)
	globals.set_boolean(MS3, value)
	for i = MS1, MS2 do
		globals.set_boolean(i, value)
	end
	for j = MS4, MS5 do
		globals.set_boolean(j, value)
	end
end)

tempMenu:add_toggle("Unlock Radio Station T-shirts", function()
	return globals.get_boolean(RS1)
end, function(value)
	globals.set_boolean(RS1, value)
	globals.set_boolean(RS2, value)
	globals.set_boolean(RS3, value)
	globals.set_boolean(RS4, value)
	globals.set_boolean(RS5, value)
	globals.set_boolean(RS6, value)
	globals.set_boolean(RS7, value)
	for i = RS8, RS9 do
		globals.set_boolean(i, value)
	end
end)

tempMenu:add_toggle("Unlock Clubs T-shirts", function()
	return globals.get_boolean(CT1)
end, function(value)
	for i = CT1, CT2 do
		globals.set_boolean(i, value)
	end
end)

tempMenu:add_toggle("Unlock Shirts", function()
	return globals.get_boolean(SH1)
end, function(value)
	globals.set_boolean(SH1, value)
	globals.set_boolean(SH2, value)
	globals.set_boolean(SH3, value)
	globals.set_boolean(SH4, value)
	globals.set_boolean(SH5, value)
	globals.set_boolean(SH6, value)
	globals.set_boolean(SH7, value)
	globals.set_boolean(SH8, value)
	globals.set_boolean(SH9, value)
	globals.set_boolean(SH10, value)
	globals.set_boolean(SH11, value)
	globals.set_boolean(SH12, value)
	for i = HO8, SH13 do
		globals.set_boolean(i, value)
	end
end)

tempMenu:add_toggle("Arcade and Casino Clothing", function()
	return globals.get_boolean(AR1)
end, function(value)
	for i = AR1, AR2 do
		globals.set_boolean(i, value)
	end
end)

local function INDU(e)
	if not localplayer then
		return
	end
	if e then
		globals.set_int(IND1, 1)
		for i = IND2, IND3 do
			globals.set_int(i, 1)
		end
		for j = IND4, IND5 do
			globals.set_int(j, 1)
		end
	else
		globals.set_int(IND1, 0)
		for i = IND2, IND3 do
			globals.set_int(i, 0)
		end
		for j = IND4, IND5 do
			globals.set_int(j, 0)
		end
	end
end
tempMenu:add_toggle("Independence Day Unlocks", function()
	return e38
end, function()
	e38 = not e38
	INDU(e38)
end)

tempMenu:add_int_range("Get All Clothing", 1, 1, 4, function()
	return 1
end, function(CltH)
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
			stats.set_int(MPX .. "DLC_APPAREL_ACQUIRED_" .. i, -1)
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
					stats.set_int(MPX .. "CLTHS_ACQUIRED_BERD_" .. i, -1)
					stats.set_int(MPX .. "CLTHS_ACQUIRED_FEET_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_ACQUIRED_JBIB_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_ACQUIRED_LEGS_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_ACQUIRED_SPECIAL_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_ACQUIRED_PROPS_" .. k, -1)
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
					stats.set_int(MPX .. "CLTHS_AVAILABLE_BERD_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_AVAILABLE_FEET_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_AVAILABLE_HAIR_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_AVAILABLE_JBIB_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_AVAILABLE_LEGS_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_AVAILABLE_SPECIAL_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_AVAILABLE_PROPS_" .. k, -1)
					stats.set_int(MPX .. "CLTHS_USED_HAIR", -1)
					stats.set_int(MPX .. "CLTHS_USED_HAIR_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_USED_JBIB", -1)
					stats.set_int(MPX .. "CLTHS_USED_JBIB_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_USED_LEGS", -1)
					stats.set_int(MPX .. "CLTHS_USED_LEGS_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_USED_FEET", -1)
					stats.set_int(MPX .. "CLTHS_USED_FEET_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_USED_BERD", -1)
					stats.set_int(MPX .. "CLTHS_USED_BERD_" .. j, -1)
					stats.set_int(MPX .. "CLTHS_USED_PROPS", -1)
					stats.set_int(MPX .. "CLTHS_USED_PROPS_" .. k, -1)
					stats.set_int(MPX .. "CLTHS_USED_OUTFIT", -1)
					stats.set_int(MPX .. "CLTHS_USED_TORSO", -1)
					stats.set_int(MPX .. "CLTHS_USED_SPECIAL", -1)
					stats.set_int(MPX .. "CLTHS_USED_SPECIAL_" .. j, -1)
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
			stats.set_int(MPX .. "DLC_APPAREL_USED_" .. i, -1)
		end
	elseif CltH == 4 then
		for i = 1, 40 do
			stats.set_int(MPX .. "ADMIN_CLOTHES_GV_BS_" .. i, -1)
			stats.set_int(MPX .. "ADMIN_CLOTHES_RM_BS_" .. i, -1)
		end
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ANote = AMenu:add_submenu("Read Me")

ANote:add_action("    	 Unlocking «After Hours» awards will ", function() end)
ANote:add_action("  cause a transaction error multiple times;", function() end)
ANote:add_action("       Some awards can be temporarily", function() end)

ColMenu = CSU:add_submenu("Collectibles Menu")

ColTMenu = ColMenu:add_submenu("Unlock All (Temporarily)")

ColTMenu:add_bare_item("", function()
	return "Action Figures (" .. globals.get_int(2707706 + 209) .. "/100)"
end, function()
	globals.set_int(2707706 + 209, 100)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "LD Organics (" .. globals.get_int(2707706 + 593) .. "/100)"
end, function()
	globals.set_int(2707706 + 593, 100)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Playing Cards (" .. globals.get_int(2707706 + 210) .. "/54)"
end, function()
	globals.set_int(2707706 + 210, 54)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Signal Jammers (" .. globals.get_int(2707706 + 211) .. "/50)"
end, function()
	globals.set_int(2707706 + 211, 50)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Treasure Chests (" .. globals.get_int(2707706 + 506) .. "/30)"
end, function()
	globals.set_int(2707706 + 506, 30)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Snowmen (" .. globals.get_int(2707706 + 600) .. "/25)"
end, function()
	globals.set_int(2707706 + 600, 25)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Buried Stashes (" .. globals.get_int(2707706 + 553) .. "/10)"
end, function()
	globals.set_int(2707706 + 553, 10)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Hidden Caches (" .. globals.get_int(2707706 + 504) .. "/10)"
end, function()
	globals.set_int(2707706 + 504, 10)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Jack o Lantern (" .. globals.get_int(2707706 + 591) .. "/10)"
end, function()
	globals.set_int(2707706 + 591, 10)
end, function() end, function() end)
ColTMenu:add_bare_item("", function()
	return "Movie Props (" .. globals.get_int(2707706 + 494) .. "/10)"
end, function()
	globals.set_int(2707706 + 494, 10)
end, function() end, function() end)

ColPMenu = ColMenu:add_submenu("Unlock All (Permanently)")

ColPMenu:add_bare_item("", function()
	return "Action Figures (" .. globals.get_int(2707706 + 209) .. "/100)"
end, function()
	globals.set_int(2707706 + 209, 99)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "LD Organics (" .. globals.get_int(2707706 + 593) .. "/100)"
end, function()
	globals.set_int(2707706 + 593, 99)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Playing Cards (" .. globals.get_int(2707706 + 210) .. "/54)"
end, function()
	globals.set_int(2707706 + 210, 53)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Signal Jammers (" .. globals.get_int(2707706 + 211) .. "/50)"
end, function()
	globals.set_int(2707706 + 211, 49)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Treasure Chests (" .. globals.get_int(2707706 + 506) .. "/30)"
end, function()
	globals.set_int(2707706 + 506, 29)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Snowmen (" .. globals.get_int(2707706 + 600) .. "/25)"
end, function()
	globals.set_int(2707706 + 600, 24)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Buried Stashes (" .. globals.get_int(2707706 + 553) .. "/10)"
end, function()
	globals.set_int(2707706 + 553, 9)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Hidden Caches (" .. globals.get_int(2707706 + 504) .. "/10)"
end, function()
	globals.set_int(2707706 + 504, 9)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Jack o Lantern (" .. globals.get_int(2707706 + 591) .. "/10)"
end, function()
	globals.set_int(2707706 + 591, 9)
end, function() end, function() end)
ColPMenu:add_bare_item("", function()
	return "Movie Props (" .. globals.get_int(2707706 + 494) .. "/10)"
end, function()
	globals.set_int(2707706 + 494, 9)
end, function() end, function() end)

ColPMenu:add_action("", function() end)

ColPNote = ColPMenu:add_submenu("Read Me")

ColPNote:add_action("     First, find the item you want, select", function() end)
ColPNote:add_action("    an option, and then pick up the item", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CharMenu = Self:add_submenu("Character Stats Editor Menu")

	CharMenu:add_toggle("Max Stats",
		function()
			Get = stats.get_int
			if Get(MPX .. "STAMINA") == 100 and Get(MPX .. "SHOOTING_ABILITY") == 100 and Get(MPX .. "SHOOTING_ABILITY") and Get(MPX .. "STRENGTH") == 100
				and Get(MPX .. "STEALTH_ABILITY") == 100 and Get(MPX .. "FLYING_ABILITY") == 100 and Get(MPX .. "WHEELIE_ABILITY") == 100 and Get(MPX .. "LUNG_CAPACITY") == 100 then
				return true
			else
				return false
			end
		end,
		function()
			stats.set_int(MPX .. "SCRIPT_INCREASE_DRIV", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_FLY", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_LUNG", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_SHO", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_STAM", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_STL", 100)
			stats.set_int(MPX .. "SCRIPT_INCREASE_STRN", 100)
		end)

	CharMenu:add_bare_item("",
		function()
			stamina = stats.get_int(MPX .. "STAMINA")
			if stamina <= 25 then
				status = "(lung cancer)"
			elseif stamina > 25 and stamina <= 50 then
				status = "(fat ass)"
			elseif stamina > 50 and stamina <= 75 then
				status = "(athlete)"
			elseif stamina > 75 and stamina <= 99
				then status = "(pro)"
			else status = "(Usain Bolt)"
			end
			return "Stamina: " .. stamina .. "/100 " .. status
		end, null, null, null)
	CharMenu:add_bare_item("",
		function()
			shooting = stats.get_int(MPX .. "SHOOTING_ABILITY")
			if shooting <= 25 then
				status = "(cataract)"
			elseif shooting > 25 and shooting <= 50 then
				status = "(american)"
			elseif shooting > 50 and shooting <= 75 then
				status = "(policeman)"
			elseif shooting > 75 and shooting <= 99
				then status = "(pvp kid)"
			else status = "(John Wick)"
			end
			return "Shooting: " .. shooting .. "/100 " .. status
		end, null, null, null)
	CharMenu:add_bare_item("",
		function()
			strength = stats.get_int(MPX .. "STRENGTH")
			if strength <= 25 then
				status = "(anorexia)"
			elseif strength > 25 and strength <= 50 then
				status = "(weak af)"
			elseif strength > 50 and strength <= 75 then
				status = "(boxer)"
			elseif strength > 75 and strength <= 99
				then status = "(builder)"
			else status = "(Gym Rat)"
			end
			return "Strength: " .. strength .. "/100 " .. status
			end, null, null, null)
	CharMenu:add_bare_item("",
		function()
			stealth = stats.get_int(MPX .. "STEALTH_ABILITY")
			if stealth <= 25 then
				status = "(gorlock the destroyer)"
			elseif stealth > 25 and stealth <= 50 then
				status = "(drunk teenager)"
			elseif stealth > 50 and stealth <= 75 then
				status = "(thief)"
			elseif stealth > 75 and stealth <= 99
				then status = "(assassin)"
			else status = "(Agent 47)"
			end
			return "Stealth: " .. stealth .. "/100 " .. status
		end, null, null, null)
	CharMenu:add_bare_item("",
		function()
			flying = stats.get_int(MPX .. "FLYING_ABILITY")
			if flying <= 25 then
				status = "(kamikaze)"
			elseif flying > 25 and flying <= 50 then
				status = "(german)"
			elseif flying > 50 and flying <= 75 then
				status = "(pilot)"
			elseif flying > 75 and flying <= 99
				then status = "(war thunder enjoyer)"
			else status = "(«Maverick» Mitchell)"
			end
			return "Flying: " .. flying .. "/100 " .. status
		end, null, null, null)
	CharMenu:add_bare_item("",
		function()
			driving = stats.get_int(MPX .. "WHEELIE_ABILITY")
			if driving <= 25 then
				status = "(grandma)"
			elseif driving > 25 and driving <= 50 then
				status = "(amateur)"
			elseif driving > 50 and driving <= 75 then
				status = "(taxi driver)"
			elseif driving > 75 and driving <= 99
				then status = "(drifter)"
			else status = "(Ken Block)"
			end
			return "Driving: " .. driving .. "/100 " .. status
		end, null, null, null)
	CharMenu:add_bare_item("",
		function()
			swimming = stats.get_int(MPX .. "LUNG_CAPACITY")
			if swimming <= 25 then
				status = "(rock)"
			elseif swimming > 25 and swimming <= 50 then
				status = "(wood)"
			elseif swimming > 50 and swimming <= 75 then
				status = "(fisherman)"
			elseif swimming > 75 and swimming <= 99
				then status = "(dolphine)"
			else status = "(Poseidon)"
			end
			return "Swimming: " .. swimming .. "/100 " .. status
		end, null, null, null)

	CharMenu:add_float_range("Mental State", 1, 0, 100,
		function()
			return stats.get_float(MPX .. "PLAYER_MENTAL_STATE")
		end,
		function(Men)
			stats.set_float(MPX .. "PLAYER_MENTAL_STATE", Men)
		end)

	CharMenu:add_action("", null)

	CharMenuNote = CharMenu:add_submenu("Read Me")

	CharMenuNote:add_action("                  Fast Run n Reload:", null)
	CharMenuNote:add_action("      Change session to apply the result", null)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---Facilities Unlocks Section---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FUMenu = FAUT:add_submenu("Facilities Unlocks")

LSCMenu = FUMenu:add_submenu("LS Customs")

L7negWepMenu = FUMenu:add_submenu("Unlock Guns Menu")

FUMenu:add_action("Unlock Hidden Cars Skins", function()
	stats.set_int("MPPLY_XMASLIVERIES", -1)
	for i = 1, 20 do
		stats.set_int("MPPLY_XMASLIVERIES" .. i, -1)
	end
end)

FUMenu:add_action("Unlock All Flight School", function()
	stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
	for i = 0, 9 do
		stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_" .. i, -1)
		stats.set_int(MPX .. "PILOT_SCHOOL_MEDAL_" .. i, -1)
		stats.set_bool(MPX .. "PILOT_ASPASSEDLESSON_" .. i, true)
	end
end)

FUMenu:add_action("Unlock All Bunker Shooting Range", function()
	stats.set_int(MPX .. "SR_HIGHSCORE_1", 690)
	stats.set_int(MPX .. "SR_HIGHSCORE_2", 1860)
	stats.set_int(MPX .. "SR_HIGHSCORE_3", 2690)
	stats.set_int(MPX .. "SR_HIGHSCORE_4", 2660)
	stats.set_int(MPX .. "SR_HIGHSCORE_5", 2650)
	stats.set_int(MPX .. "SR_HIGHSCORE_6", 450)
	stats.set_int(MPX .. "SR_TARGETS_HIT", 269)
	stats.set_int(MPX .. "SR_WEAPON_BIT_SET", -1)
	stats.set_bool(MPX .. "SR_TIER_1_REWARD", true)
	stats.set_bool(MPX .. "SR_TIER_3_REWARD", true)
	stats.set_bool(MPX .. "SR_INCREASE_THROW_CAP", true)
end)

FUMenu:add_action("Unlock All Bunker Research", function()
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
	local bitSize = 8
	for j = 0, 64 / bitSize - 1 do
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

FUMenu:add_action("Unlock All Tattos", function()
	stats.set_int(MPX .. "TATTOO_FM_CURRENT_32", -1)
	for i = 0, 47 do
		stats.set_int(MPX .. "TATTOO_FM_UNLOCKS_" .. i, -1)
	end
end)

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
	stats.set_int(MPX .. "TOTAL_RACES_WON", 50)
end)

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
	if not enable then
		return
	end
	local newpos = localplayer:get_position() + vector3(0, 0, speed)
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle = localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function down()
	if not enable then
		return
	end
	local newpos = localplayer:get_position() + vector3(0, 0, speed * -1)
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle = localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function forward()
	if not enable then
		return
	end
	local dir = localplayer:get_heading()
	local newpos = localplayer:get_position() + (dir * speed)
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle = localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function backward()
	if not enable then
		return
	end
	local dir = localplayer:get_heading()
	local newpos = localplayer:get_position() + (dir * speed * -1)
	if not localplayer:is_in_vehicle() then
		localplayer:set_position(newpos)
	else
		vehicle = localplayer:get_current_vehicle()
		vehicle:set_position(newpos)
	end
end
local function turnleft()
	if not enable then
		return
	end
	local dir = localplayer:get_rotation()
	if not localplayer:is_in_vehicle() then
		localplayer:set_rotation(dir + vector3(0.25, 0, 0))
	else
		vehicle = localplayer:get_current_vehicle()
		vehicle:set_rotation(dir + vector3(0.25, 0, 0))
	end
end
local function turnright()
	if not enable then
		return
	end
	local dir = localplayer:get_rotation()
	if not localplayer:is_in_vehicle() then
		localplayer:set_rotation(dir + vector3(0.25 * -1, 0, 0))
	else
		vehicle = localplayer:get_current_vehicle()
		vehicle:set_rotation(dir + vector3(0.25 * -1, 0, 0))
	end
end
local function increasespeed()
	speed = speed + 1
end
local function decreasespeed()
	speed = speed - 1
end
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
		return
	end
	if e then
		localplayer:set_freeze_momentum(true)
		localplayer:set_no_ragdoll(true)
		localplayer:set_config_flag(292, true)
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
		localplayer:set_config_flag(292, false)
		menu.remove_hotkey(up_hotkey)
		menu.remove_hotkey(down_hotkey)
		menu.remove_hotkey(forward_hotkey)
		menu.remove_hotkey(backward_hotkey)
		menu.remove_hotkey(turnleft_hotkey)
		menu.remove_hotkey(turnright_hotkey)
		menu.remove_hotkey(increasespeed_hotkey)
		menu.remove_hotkey(decreasespeed_hotkey)
	end
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
PedModel1[joaat("a_f_m_bodybuild_01")] = "a_f_m_bodybuild_01"
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
PedModel1[joaat("ig_sol")] = "sol"
PedModel1[joaat("ig_solomon")] = "Solomon"
PedModel1[joaat("ig_sss")] = "Scott Storch"
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
pedMenu:add_array_item("Set Delay First", { "1", "2", "3", "4", "5", "6", "7", "8" }, function()
	return xox_12
end, function(value)
	xox_12 = value
	if value == 1 then
		duFF = 0.01
	elseif value == 2 then
		duFF = 0.05
	elseif value == 3 then
		duFF = 0.08
	elseif value == 4 then
		duFF = 0.1
	elseif value == 5 then
		duFF = 0.15
	elseif value == 6 then
		duFF = 0.2
	elseif value == 7 then
		duFF = 0.25
	else
		duFF = 0.3
	end
end)
pedMenu:add_action("---", function() end)
pedMenu:add_array_item("Normal Skin", PedSelf, function()
	return self_hash
end, function(value)
	self_hash = value
	globals.set_int(NORS1, 1)
	globals.set_int(NORS2, value)
	sleep(duFF)
	globals.set_int(NORS1, 0)
end)
pedMenu:add_array_item("Animals", PedModelAnimal, function()
	return animal_hash
end, function(value)
	animal_hash = value
	globals.set_int(NORS1, 1)
	globals.set_int(NORS2, value)
	sleep(duFF)
	globals.set_int(NORS1, 0)
end)
pedMenu:add_array_item("Peds", PedModel1, function()
	return ped_hash
end, function(value)
	ped_hash = value
	globals.set_int(NORS1, 1)
	globals.set_int(NORS2, value)
	sleep(duFF)
	globals.set_int(NORS1, 0)
end)
pedMenu:add_array_item("Birds", PedModelBird, function()
	return bird_hash
end, function(value)
	bird_hash = value
	globals.set_int(NORS1, 1)
	globals.set_int(NORS2, value)
	sleep(duFF)
	globals.set_int(NORS1, 0)
end)
pedMenu:add_array_item("Sea Animals", PedModelSeaAnimal, function()
	return sea_hash
end, function(value)
	sea_hash = value
	globals.set_int(NORS1, 1)
	globals.set_int(NORS2, value)
	sleep(duFF)
	globals.set_int(NORS1, 0)
end)
pedMenu:add_action("Become Bigfoot", function()
	globals.set_int(NORS1, 1)
	globals.set_int(NORS2, -1389097126)
	sleep(duFF)
	globals.set_int(NORS1, 0)
end)
pedMenu:add_action("      ---[Change delay if not working]---", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGNOCLP = Self:add_submenu("NoClip Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGNOCLP:add_toggle("NoClip", function()
	return enable
end, function()
	enable = not enable
	NoClip(enable)
end)
L7NEGNOCLP:add_int_range("NoClip Speed", 1, 1, 10, function()
	return speed
end, function(i)
	speed = i
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--© 2023 L7NEG's Official Discord Server. All Rights Reserved--

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG5 = L7NEG:add_submenu("Missions Selector And cooldown Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG5:add_array_item("Auto Shop Heist Select>", {
	"Unselected",
	"Union Depository",
	"Superdollar Deal",
	"Bank Contract",
	"ECU Job",
	"Prison Contract",
	"Agency Deal",
	"LOST Contract",
	"Data Contract",
}, function()
	return stats.get_int(MPX .. "TUNER_CURRENT") + 2
end, function(v)
	stats.set_int(MPX .. "TUNER_CURRENT", v - 2)
	stats.set_int(MPX .. "TUNER_GEN_BS", 12543)
end)

L7NEG5:add_array_item(
	"ULP Contract Select>",
	{ "Intelligece", "Counterintelligence", "Extraction", "Asset Seizure", "Operation Paper Trail", "CleanUp" },
	function()
		return stats.get_int(MPX .. "ULP_MISSION_CURRENT") + 1
	end,
	function(v)
		if stats.get_int(MPX .. "ULP_MISSION_CURRENT") == v - 1 then
			return
		end
		C = stats.get_int(MPX .. "ULP_MISSION_CURRENT")
		V = 0
		if stats.get_int(MPX .. "ULP_MISSION_CURRENT") < v - 1 then
			for i = C, 5 do
				V = V + 2 ^ i - 1
			end
			for i = 0, v - 1 do
				V = V + 2 ^ i - 1
			end
		else
			for i = 0, v - 1 do
				V = V + 2 ^ i - 1
			end
		end
		stats.set_int(MPX .. "ULP_MISSION_CURRENT", v - 1)
		stats.set_int(MPX .. "ULP_MISSION_PROGRESS", stats.get_int(MPX .. "ULP_MISSION_PROGRESS") + V)
	end
)

local L7NEGDRGWR = {
	"Designated Driver",
	"FatalIncursion",
	"Uncontrolled Substance",
	"Make War not Love",
	"Off the Rails",
	"This is an Intervention",
	"Unusual Suspects",
	"FriedMind",
	"Checking In",
	"BDKD",
}
L7NEGDRGWR[0] = "Welcome to the Troupe"
L7NEG5:add_array_item("Dose Missions>", L7NEGDRGWR, function()
	return stats.get_int(MPX .. "XM22_CURRENT")
end, function(v)
	stats.set_int(MPX .. "XM22_CURRENT", v)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Story Characters Money Editor By Silent---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
StoryCharacters = L7NEG:add_submenu("Story Characters Money Editor Menu")

StoryCharacters:add_int_range("Michael's Cash", 10000000, 0, 2147483646, function()
	return stats.get_int("SP0_TOTAL_CASH")
end, function(MicCas)
	stats.set_int("SP0_TOTAL_CASH", MicCas)
end)

StoryCharacters:add_int_range("Franklin's Cash", 10000000, 0, 2147483646, function()
	return stats.get_int("SP1_TOTAL_CASH")
end, function(MicCas)
	stats.set_int("SP1_TOTAL_CASH", MicCas)
end)

StoryCharacters:add_int_range("Trevor's Cash", 10000000, 0, 2147483646, function()
	return stats.get_int("SP2_TOTAL_CASH")
end, function(MicCas)
	stats.set_int("SP2_TOTAL_CASH", MicCas)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Required Script Handles
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

boolCeoBanager = false
funcCeoBanger = false
local scrWarehouse = script("am_mp_warehouse")
local scrSellContraband = script("gb_contraband_sell")
local scrSecuroServ = script("appsecuroserv")

local function funcCeoBanger(isRunning)
	while isRunning == true do
		local numLifetimeSales = stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE")
		if scrWarehouse:is_active() then
			globals.set_int(262145 + 15991, 6000000) --EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1
			globals.set_int(262145 + 15756, 0) --EXEC_BUY_COOLDOWN
			globals.set_int(262145 + 15757, 0) --EXEC_SELL_COOLDOWN
		end
		globals.set_int(4537356, 0)
		globals.set_int(4537357, 0)
		globals.set_int(4537358, 0)

		if scrSecuroServ:is_active() then
			scrSecuroServ:set_int(739, 1) --MP_WH_SELL
			sleep(1)
			scrSecuroServ:set_int(740, 1) --MP_WH_SELL
			sleep(1)
			scrSecuroServ:set_int(558, 3012)
		end

		if scrSellContraband:is_active() then
			scrSellContraband:set_int(1136, 1)
			scrSellContraband:set_int(596, 0)
			scrSellContraband:set_int(1125, 0)
			scrSellContraband:set_int(543 + 7, 7)
			sleep(1)
			scrSellContraband:set_int(543 + 1, 99999)
		end
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG7:add_toggle("Start Ceo Manager", function()
	return boolCeoBanager
end, function()
	boolCeoBanager = not boolCeoBanager
	funcCeoBanger(boolCeoBanager)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG9 = L7NEG7:add_submenu("Ultimate Money Manager Settings")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

NightLoop = L7NEG7:add_submenu("NightClub Remote Safe Loop Menu")

a64 = 1
DefDelay3 = 0.6
NightLoop:add_array_item("Delay", { "Default", "Fast", "Medium", "Slow" }, function()
	return a64
end, function(DelayType3)
	if DelayType3 == 1 then
		DefDelay3 = 0.6
	elseif DelayType3 == 2 then
		DefDelay3 = 0.9
	elseif DelayType3 == 3 then
		DefDelay3 = 1.2
	elseif DelayType3 == 4 then
		DefDelay3 = 1.5
	end
	a64 = DelayType3
end)

BypassTransError = false
NightLoop:add_toggle("Bypass Transaction Error", function()
	return BypassTransError
end, function()
	BypassTransError = not BypassTransError
end)

SafeAmount = 300000
SafeCollection = 199 + 532 + 1
SafeCapacity = 24257 --NIGHTCLUBMAXSAFEVALUE
IncomeStart = 24234 --NIGHTCLUBINCOMEUPTOPOP5
IncomeEnd = 24253 --NIGHTCLUBINCOMEUPTOPOP100
a44 = false
local function NightLoop1()
	if not localplayer then
		return
	end
	while a44 do
		PlayerID = localplayer:get_player_id()
		SafeValue = 1845263 + (PlayerID * 877) + 267 + 356 + 6
		for i = IncomeStart, IncomeEnd do
			globals.set_int(262145 + i, SafeAmount)
		end
		globals.set_int(262145 + SafeCapacity, SafeAmount)
		stats.set_int(MPX .. "CLUB_PAY_TIME_LEFT", -1)
		sleep(DefDelay3)
		if globals.get_int(SafeValue) ~= 0 then
			if BypassTransError == true then
				globals.set_int(4537356, 0)
				globals.set_int(4537357, 0)
				globals.set_int(4537358, 0)
			end
			AMN:set_int(SafeCollection, 1)
			sleep(DefDelay3)
		end
	end
end
NightLoop:add_toggle("$300k/1s (AFK)", function()
	return a44
end, function()
	a44 = not a44
	NightLoop1()
end)

NightLoop:add_action("", function() end)

NightLoopNote = NightLoop:add_submenu("Read Me")

NightLoopNote:add_action("  Come inside your nightclub and activate", function() end)
NightLoopNote:add_action("", function() end)
NightLoopNote:add_action("                            Delay:", function() end)
NightLoopNote:add_action("  Change this if you aren't getting money", function() end)
NightLoopNote:add_action("              Bypass Transaction Error:", function() end)
NightLoopNote:add_action(" Toggle this if you're still getting an error", function() end)
NightLoopNote:add_action("Credits: Silent", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGMML = L7NEG7:add_submenu("NightClub Manual Safe Loop Menu")

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
 
L7NEGMML:add_toggle(
    "$250k/10s (AFK In Front Of NC Safe)",
    function()
        return isRunning
    end,
    function()
        isRunning = not isRunning
        safeLoop()
    end
)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MoneyDrop = L7NEG7:add_submenu("Money Drop Menu")

local function PedDrop()
	local position = localplayer:get_position()
	position.z = position.z + 30
 
	for p in replayinterface.get_peds() do
		if p == nil or p == localplayer then
			goto continue
		end
		
		if p:get_pedtype() < 4 then
			goto continue
		end
		
		if p:is_in_vehicle() then
			goto continue
		end
 
		p:set_position(position)
 
		if p:get_health() > 99 then
			p:set_position(position)
			p:set_freeze_momentum(true)
			p:set_health(0)
			p:set_wallet(1000)
			break
		end
 
		::continue::
	end
end
 
-- Uncomment the next line to drop a ped when pressing F3
-- menu.register_hotkey(114, PedDrop)
 
MoneyDrop:add_action("Money Drop", PedDrop)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7negWepMenu:add_action("Unlock Double Action Revolver", function()
	if stats.get_masked_int(MPX .. "GANGOPSPSTAT_INT102", 24, 8) < 3 then
		stats.set_masked_int(MPX .. "GANGOPSPSTAT_INT102", 3, 24, 8)
	end
	if stats.get_masked_int(MPX .. "GANGOPSPSTAT_INT102", 24, 8) > 3 then
		stats.set_masked_int(MPX .. "GANGOPSPSTAT_INT102", 0, 24, 8)
	end
end)

L7negWepMenu:add_action("Unlock Stone Hatchet", function()
	if stats.get_masked_int("MP_NGDLCPSTAT_INT0", 16, 8) < 5 then
		stats.set_masked_int("MP_NGDLCPSTAT_INT0", 5, 16, 8)
	end
	if stats.get_masked_int("MP_NGDLCPSTAT_INT0", 16, 8) > 5 then
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
		stats.set_int(MPX .. "WEAP_FM_ADDON_PURCH" .. i, -1)
	end
	for j = 1, 19 do
		stats.set_int(MPX .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", -1)
	end
	for m = 1, 41 do
		stats.set_int(MPX .. "CHAR_KIT_" .. m .. "_FM_UNLCK", -1)
	end
	for l = 2, 41 do
		stats.set_int(MPX .. "CHAR_KIT_FM_PURCHASE" .. l, -1)
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGSNOW = L7NEGEVENTS:add_submenu("Snow Toggle Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local snowAddress = 262145 + 4575
local isEnabled = false

function toggleSnow()
	isEnabled = not isEnabled
	globals.set_boolean(snowAddress, isEnabled)
end

L7NEGSNOW:add_toggle("Toggle Snow", function()
	return globals.get_boolean(snowAddress)
end, toggleSnow)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGHALLOWEEN = L7NEGEVENTS:add_submenu("Halloween Weather Toggle Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local halloweatherAddress = 262145 + 33173
local isEnabled = false

function toggleHalloweather()
	isEnabled = not isEnabled
	globals.set_boolean(halloweatherAddress, isEnabled)
end

L7NEGHALLOWEEN:add_toggle("Toggle Halloween Weather", function()
	return globals.get_boolean(halloweatherAddress)
end, toggleHalloweather)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGYHM = L7NEGEVENTS:add_submenu("Yeti Hunt Menu")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEGYHM:add_action("Enable Yeti Hunt Event", function()
	globals.set_int(262145 + 36054, 1) -- enable the event 1833904680
end)

local function teleport_myself(x, y, z)
	localplayer:set_position((vector3(x, y, z)))
end

L7NEGYHM:add_action("Clue Location 1", function()
	teleport_myself(-1562.69, 4699.04, 50.426)
end)

L7NEGYHM:add_action("Clue Location 2", function()
	teleport_myself(-1359.869, 4733.429, 46.919)
end)

L7NEGYHM:add_action("Clue Location 3", function()
	teleport_myself(-1715.398, 4501.203, 0.096)
end)

L7NEGYHM:add_action("Clue Location 4", function()
	teleport_myself(-1282.18, 4487.826, 12.643)
end)

L7NEGYHM:add_action("Clue Location 5", function()
	teleport_myself(-1569.665, 4478.485, 20.215)
end)

L7NEGYHM:add_action("Clue Location 6", function()
	teleport_myself(-1345.828, 4838.062, 137.522)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG6:add_action("LSCM Prize Ride Unlock", function()
	stats.set_bool(MPX .. "CARMEET_PV_CHLLGE_CMPLT", true)
end)

L7NEG6:add_action("Unlock All Rep Lvl 1000", function()
	for i = 262145 + 31944, 262145 + 31973 do
		globals.set_float(i, 100000)
	end
end)

LSCMNote = L7NEG6:add_submenu("Read Me")

LSCMNote:add_action("      Buy a membership, activate, sit in", function() end)
LSCMNote:add_action("          a test car and go to the track", function() end)
LSCMNote:add_action("", function() end)
LSCMNote:add_action("      If your level is not 1, then activate", function() end)
LSCMNote:add_action("    and buy something in the LSCM store", function() end)
LSCMNote:add_action("", function() end)
LSCMNote:add_action("    If you've used LS Tuner awards unlock", function() end)
LSCMNote:add_action(" before, all unlocks will be temporary only", function() end)

L7NEG5:add_action("Remove Dax Missions CoolDown ", function()
	stats.set_int(MPX .. "XM22JUGGALOWORKCDTIMER", -1)
end)

L7NEG5:add_action("Remove VIP/MC Cool Down", function()
	stats.set_int("MPPLY_VIPGAMEPLAYDISABLEDTIMER", 0)
end)

L7NEG5:add_action("Skip Lamar Missions", function()
	stats.set_bool(MPX .. "LOW_FLOW_CS_DRV_SEEN", true)
	stats.set_bool(MPX .. "LOW_FLOW_CS_TRA_SEEN", true)
	stats.set_bool(MPX .. "LOW_FLOW_CS_FUN_SEEN", true)
	stats.set_bool(MPX .. "LOW_FLOW_CS_PHO_SEEN", true)
	stats.set_bool(MPX .. "LOW_FLOW_CS_FIN_SEEN", true)
	stats.set_bool(MPX .. "LOW_BEN_INTRO_CS_SEEN", true)
	stats.set_int(MPX .. "LOWRIDER_FLOW_COMPLETE", 4)
	stats.set_int(MPX .. "LOW_FLOW_CURRENT_PROG", 9)
	stats.set_int(MPX .. "LOW_FLOW_CURRENT_CALL", 9)
	stats.set_int(MPX .. "LOW_FLOW_CS_HELPTEXT", 66)
end)

L7NEG5:add_action("Skip Yacht Missions", function()
	stats.set_int(MPX .. "YACHT_MISSION_PROG", 0)
	stats.set_int(MPX .. "YACHT_MISSION_FLOW", 21845)
	stats.set_int(MPX .. "CASINO_DECORATION_GIFT_1", -1)
end)

L7NEG5:add_action("Skip ULP Missions", function()
	stats.set_int(MPX .. "ULP_MISSION_PROGRESS", 127)
	stats.set_int(MPX .. "ULP_MISSION_CURRENT", 0)
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG1 = L7NEG:add_submenu("Credits")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
L7NEG1:add_action("---Kiddion---", function() end)

L7NEG1:add_action("---Apple Vegas---", function() end)

L7NEG1:add_action("---Discord:@B1GBOOM---", function() end)

L7NEG1:add_action("---Discord:@silentsalo---", function() end)

L7NEG1:add_action("---Discord:@eaztea---", function() end)

L7NEG1:add_action("---Discord:@mxgta---", function() end)

L7NEG1:add_action("---github.com/@ezeholz---", function() end)

L7NEG1:add_action("https://l7neg.tk", function() end)

L7NEG1:add_action("Discord Server For Any Help", function() end)

L7NEG1:add_action("https://sub.l7neg.tk/discord", function() end)

L7NEG1:add_action("https://discord.gg/wtVd2eNdd5", function() end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

L7NEG10 = L7NEG9:add_submenu("Get Crates")

L7NEG10:add_action("1-10 per Press", function()
	for i = 12, 16 do
		stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
	end
end)

GCv0 = false
local function GCv1()
	while GCv0 == true do
		for i = 12, 16 do
			stats.set_bool_masked(MPX .. "FIXERPSTAT_BOOL1", true, i, MPX)
		end
	end
end
L7NEG10:add_toggle("Crates Loop", function()
	return GCv0
end, function()
	GCv0 = not GCv0
	GCv1(GCv0)
end)

GCv2 = 1
L7NEG10:add_int_range("Instant Buy", 1, 1, 111, function()
	return GCv2
end, function(CV)
	if GCB:is_active() then
		GCB:set_int(601 + 5, 1)
		GCB:set_int(601 + 1, CV)
		GCB:set_int(601 + 191, 6)
		GCB:set_int(601 + 192, 4)
		GCv2 = CV
	end
end)

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
	PlayerIndex = globals.get_int(1574932)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	return stats.get_int(MPX .. "LIFETIME_SELL_COMPLETE")
end, function(value)
	stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", value)
	stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", value)
	stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", value)
	stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", value)
end)

L7NEG8:add_int_range("Change Lifetime Earnings Made", 200000.0, 0, 10000000, function()
	PlayerIndex = globals.get_int(1574932)
	if PlayerIndex == 0 then
		MPX = "MP0_"
	else
		MPX = "MP1_"
	end
	return stats.get_int(MPX .. "LIFETIME_CONTRA_EARNINGS")
end, function(value)
	stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", value * 1)
end)

L7NEG8:add_action("Auto-Reset stats-0/0Sales", function()
	stats.set_int(MPX .. "LIFETIME_BUY_COMPLETE", 0)
	stats.set_int(MPX .. "LIFETIME_BUY_UNDERTAKEN", 0)
	stats.set_int(MPX .. "LIFETIME_SELL_COMPLETE", 0)
	stats.set_int(MPX .. "LIFETIME_SELL_UNDERTAKEN", 0)
	stats.set_int(MPX .. "LIFETIME_CONTRA_EARNINGS", 0)
	globals.set_int(1575032, 11) ----PlayerSessionBlank--------1575052
	globals.set_int(1574589, 1) ----PlayerSessionNew----------
	sleep(0.2)
	globals.set_int(1574589, 0) ----PlayerSessionNew------
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--BAS=Bag Size------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BAS1 = 262145 + 30009

--PSV=Panther Statue-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PSV = 262145 + 30264

--PDIAMOND=Pink Diamond---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

PDIAMOND = 262145 + 30262

--BB=Bearer Bonds---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BB = 262145 + 30261

--RN=Ruby Necklace--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RN = 262145 + 30260

--TEQUILA=Tequila---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

TEQUILA = 262145 + 30259

--HA=Unlock Hats----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

HA1 = 262145 + 12791
HA2 = 262145 + 12800
HA3 = 262145 + 8474
HA4 = 262145 + 8479
HA5 = 262145 + 21331
HA6 = 262145 + 21332
HA7 = 262145 + 21339
HA8 = 262145 + 21342
HA9 = 262145 + 21344
HA10 = 262145 + 21319
HA11 = 262145 + 21322
HA12 = 262145 + 21328

--BS=Unlock Brand Shirts--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

BS1 = 262145 + 15250
BS2 = 262145 + 15252
BS3 = 262145 + 15254
BS4 = 262145 + 15256
BS5 = 262145 + 15258
BS6 = 262145 + 15264
BS7 = 262145 + 24253
BS8 = 262145 + 24238
BS9 = 262145 + 23981
BS10 = 262145 + 24270
BS11 = 262145 + 24244
BS12 = 262145 + 24245
BS13 = 262145 + 18283

--KT=Unlock Knock Offs T-shirts-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

KT1 = 262145 + 24433
KT2 = 262145 + 24442

--MC=Unlock Manufactures Clothing-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MC1 = 262145 + 15428
MC2 = 262145 + 17740
MC3 = 262145 + 17761

--MS=Unlock Movie Shirts--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

MS1 = 262145 + 12154
MS2 = 262145 + 12163
MS3 = 262145 + 11991
MS4 = 262145 + 12801
MS5 = 262145 + 12813

--RS=Unlock Radio Station T-shirts----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RS1 = 262145 + 24416
RS2 = 262145 + 24421
RS3 = 262145 + 24423
RS4 = 262145 + 24424
RS5 = 262145 + 24426
RS6 = 262145 + 24428
RS7 = 262145 + 24429
RS8 = 262145 + 24956
RS9 = 262145 + 24955

--CT=Unlock Clubs T-shirts------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CT1 = 262145 + 24916
CT2 = 262145 + 24924

--SH=Unlock Shirts--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SH1 = 262145 + 25856
SH2 = 262145 + 21141
SH3 = 262145 + 21143
SH4 = 262145 + 21145
SH5 = 262145 + 21146
SH6 = 262145 + 21150
SH7 = 262145 + 21155
SH8 = 262145 + 21161
SH9 = 262145 + 21165
SH10 = 262145 + 21166
SH11 = 262145 + 21177

--AR=Arcade and Casino Clothing-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

AR1 = 262145 + 28593
AR2 = 262145 + 28612

--NORS=Skin Changer-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

NORS1 = 2640095 + 62

NORS2 = 2640095 + 49

---REQS=Request---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

REQS1 = 2738587

--IND=Independence Day----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

IND1 = 262145 + 8436
IND2 = 262145 + 8445
IND3 = 262145 + 8451
IND4 = 262145 + 8474
IND5 = 262145 + 8480

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

e0 = false
e1 = false
e2 = false
e3 = false
e4 = false
e5 = false
e6 = false

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Required Stats--

MPX = PI
PI = stats.get_int("MPPLY_LAST_MP_CHAR")
if PI == 0 then
	MPX = "MP0_"
else
	MPX = "MP1_"
end
GCB = script("gb_contraband_buy")
FMC = script("fm_mission_controller")
FMC2020 = script("fm_mission_controller_2020")
HIP = script("heist_island_planning")
AMN = script("am_mp_nightclub")
FormatMoney = function(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function TP(x, y, z, yaw, roll, pitch)
	if localplayer:is_in_vehicle() then
		localplayer:get_current_vehicle():set_position(x, y, z)
		localplayer:get_current_vehicle():set_rotation(yaw, roll, pitch)
	else
		localplayer:set_position(x, y, z)
		localplayer:set_rotation(yaw, roll, pitch)
	end
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
