-- https://dsc.gg/l7neg-
-- https://l7neg.tk
--©️ 2023 L7NEG#0743
local WH = script("am_mp_warehouse")
local function Cloop(bool)
	while bool do
		if WH:is_active() then
			menu.send_key_up(83)
			menu.send_key_press(69)
			sleep(1)
			if not WH:is_active() then
				menu.send_key_press(13)
				menu.send_key_down(83)
			end
		end
	end
end
menu.add_toggle("Automatic Sell Crate Afk Male", function()
	return boolcl
end, function()
	boolcl = not boolcl
	Cloop(boolcl)
	
end)


