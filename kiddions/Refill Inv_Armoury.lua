MPX = PI 
		PI = stats.get_int("MPPLY_LAST_MP_CHAR") 
		if PI == 0 then MPX = "MP0_" else MPX = "MP1_" end

local function RfillinvArmour()
      stats.set_int(MPX .. "NO_BOUGHT_YUM_SNACKS", 1000)
      stats.set_int(MPX .. "NO_BOUGHT_HEALTH_SNACKS", 1000)
      stats.set_int(MPX .. "NO_BOUGHT_EPIC_SNACKS", 1000)
      stats.set_int(MPX .. "NUMBER_OF_CHAMP_BOUGHT", 1000)
      stats.set_int(MPX .. "NUMBER_OF_ORANGE_BOUGHT", 1000)
      stats.set_int(MPX .. "NUMBER_OF_BOURGE_BOUGHT", 1000)
      stats.set_int(MPX .. "CIGARETTES_BOUGHT", 1000)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_1_COUNT", 1000)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_2_COUNT", 1000)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_3_COUNT", 1000)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_4_COUNT", 1000)
      stats.set_int(MPX .. "MP_CHAR_ARMOUR_5_COUNT", 1000)
      stats.set_int(MPX .. "BREATHING_APPAR_BOUGHT", 1000)
      end

menu.register_hotkey(1, RfillinvArmour) -------------------------------For Refil Inv And Armour