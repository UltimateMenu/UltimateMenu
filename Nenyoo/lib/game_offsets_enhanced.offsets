-- GTA V Enhanced build 1158.13 globals and script locals used by Ultimate Menu.
-- Update addresses here when a game build changes; feature code should not
-- contain raw global or local addresses.

local FREEMODE_TUNABLES = 262145

local globals = {
    FMg = 262145, -- freemode tunables base
    CSg1 = 1575048, -- session type
    CSg2 = 1574589, -- session switch
    CSg3 = 1574591, -- session quit

    ACg1 = 1936408, -- apartment cut: player 1
    ACg2 = 1936409, -- apartment cut: player 2
    ACg3 = 1936410, -- apartment cut: player 3
    ACg4 = 1936411, -- apartment cut: player 4
    ACg5 = 1941383, -- apartment local-player cut
    AUAJg1 = 271333, -- Fleeca job root hash
    AUAJg2 = 271338, -- Prison Break root hash
    AUAJg3 = 271345, -- Humane Labs root hash
    AUAJg4 = 271351, -- Series A root hash
    AUAJg5 = 271357, -- Pacific Standard root hash
    ACDg = 2686124, -- apartment cooldown/player-data base
    AHDg = 4722363, -- apartment heist difficulty

    DCCg1 = 1976088, -- casino cut: player 1
    DCCg2 = 1976089, -- casino cut: player 2
    DCCg3 = 1976090, -- casino cut: player 3
    DCCg4 = 1976091, -- casino cut: player 4
    CPCg1 = 1981458, -- Cayo cut: player 1
    CPCg2 = 1981459, -- Cayo cut: player 2
    CPCg3 = 1981460, -- Cayo cut: player 3
    CPCg4 = 1981461, -- Cayo cut: player 4
    DCg1 = 1969934, -- Doomsday cut: player 1
    DCg2 = 1969935, -- Doomsday cut: player 2
    DCg3 = 1969936, -- Doomsday cut: player 3
    DCg4 = 1969937, -- Doomsday cut: player 4
    GCg = 2692915, -- generic heist cut multiplier

    KCBGL = 300182, -- Kortz bag size
    KCWMG = 300344, -- Kortz weekly multiplier
    KCCDG = 300247, -- Kortz normal cooldown
    KCCD2G = 300248, -- Kortz hard cooldown
    KCLDG = 1935711, -- Kortz lasers disabled
    KCSECONDARY_BASE = 5009911, -- Kortz secondary-target array
    KCPAYOUT_BASE = 300149, -- Kortz primary-target payouts

    HGLs1 = 4722361, -- heist launch state 1
    HGLs2 = 4722364, -- heist launch state 2
    HGLs3 = 4722365, -- heist launch state 3
    HGLs4 = 4915256, -- heist launch state 4

    SNOW = 266558,
    halloweatherAddress = 294894,
    yetihuntAddress = 297763,
    TRICK_OR_TREAT = 294663,
    SNOWMEN_COLLECTIBLES = 295964,
    GVADg = 296039, -- Gun Van armour discount
    GVWDg = 296020, -- Gun Van weapon discount
    GVTDg = 296031, -- Gun Van throwable discount
    CCBL0 = 288788, -- casino chip buy limit 1
    CCBL1 = 288789, -- casino chip buy limit 2
    CPBg = 291483, -- Cayo bag size
    PSV = 291735, -- Panther Statue value
    PDIAMOND = 291733, -- Pink Diamond value
    BB = 291732, -- Bearer Bonds value
    RN = 291731, -- Ruby Necklace value
    TEQUILA = 291730, -- Tequila value

    AG = 4525224, -- achievement unlock selector
    current_objectives_global = 2359296,
    weekly_objectives_global = 2732247,
    objectives_state_global = 1574746,
    CARGO1 = 284730,
    CARGO2 = 284731,
    CARGO3 = 284732,
    CARGO4 = 284733,
    CARGO5 = 284734,
    CARGO6 = 284735,
    CARGO7 = 284736,
    CARGO8 = 284737,
    CARGO9 = 284738,
    CEO1 = 277970, -- special cargo sale threshold
    CEO2 = 277737, -- special cargo buy cooldown
    CEO3 = 277738, -- special cargo sell cooldown
    SafeCapacity = 23773, -- nightclub safe capacity tunable offset
    IncomeStart = 23750, -- nightclub income range start
    IncomeEnd = 23769, -- nightclub income range end
    main_global = 1673814, -- YimResupplier business-state base

    TRANSACTION_ERROR_GLOBAL_1 = 4516981,
    TRANSACTION_ERROR_GLOBAL_2 = 4516982,
    TRANSACTION_ERROR_GLOBAL_3 = 4516983,
    GUN_VAN_LOCATION_GLOBAL = 2655290,
    PLAYER_RP_MULTIPLIER_GLOBAL = 262146,
    AIR_CARGO_RP_MULTIPLIER_GLOBAL = 284713,
    NIGHTCLUB_CASH_BONUS_1 = 279564,
    NIGHTCLUB_CASH_BONUS_2 = 279570,
    NIGHTCLUB_CASH_BASE = 279558,
    NIGHTCLUB_COKE_BONUS_1 = 279565,
    NIGHTCLUB_COKE_BONUS_2 = 279571,
    NIGHTCLUB_COKE_BASE = 279559,
    NIGHTCLUB_METH_BONUS_1 = 279566,
    NIGHTCLUB_METH_BONUS_2 = 279572,
    NIGHTCLUB_METH_BASE = 279560,
    NIGHTCLUB_WEED_BONUS_1 = 279567,
    NIGHTCLUB_WEED_BONUS_2 = 279573,
    NIGHTCLUB_WEED_BASE = 279561,
    NIGHTCLUB_DOCUMENTS_BONUS_1 = 279563,
    NIGHTCLUB_DOCUMENTS_BONUS_2 = 279569,
    NIGHTCLUB_DOCUMENTS_BASE = 279557,
    NIGHTCLUB_BUNKER_BONUS_1 = 283494,
    NIGHTCLUB_BUNKER_BONUS_2 = 283493,
    NIGHTCLUB_BUNKER_BASE = 283492,
    NIGHTCLUB_ACID_BONUS = 279568,
    NIGHTCLUB_ACID_BASE = 279562,
}

function globals.DAILY_OBJECTIVE_CURRENT(index)
    return globals.current_objectives_global + 1 + 681 + 4248 + 1 + (index * 3)
end
function globals.DAILY_OBJECTIVE_STATE(index)
    return globals.objectives_state_global + 1 + 1 + index
end
function globals.WEEKLY_OBJECTIVE_STATE()
    return globals.weekly_objectives_global + 1 + 1
end
function globals.WEEKLY_OBJECTIVE_CURRENT()
    return globals.weekly_objectives_global + 1 + 2
end
function globals.NIGHTCLUB_SAFE_VALUE(player_id)
    return 1845347 + player_id + 260 + 364 + 5
end
function globals.APARTMENT_COOLDOWN(player_id)
    return globals.ACDg + 1 + (player_id * 77) + 76
end
function globals.APARTMENT_HEIST_TYPE(player_id)
    return globals.ACDg + (player_id * 77) + 24 + 2
end
function globals.HEIST_SOLO_LAUNCH(heist_type)
    return 794989 + 4 + 1 + (heist_type * 95) + 75
end
function globals.APARTMENT_FORCE_READY(player_index)
    return 2658294 + 1 + ((player_index - 1) * 468) + 270
end
function globals.LEGACY_HEIST_FORCE_READY(player_index)
    return 1882717 + 1 + ((player_index - 1) * 315) + 43 + 11 + player_index
end
function globals.CAYO_FORCE_READY(player_index)
    return 1981147 + 1 + ((player_index - 1) * 27) + 7 + player_index
end
function globals.KORTZ_SECONDARY_TARGET(player_index, offset)
    return globals.KCSECONDARY_BASE + (player_index * 333) + offset
end
function globals.KORTZ_SECONDARY_PRIMARY(player_index)
    return globals.KORTZ_SECONDARY_TARGET(player_index, 68)
end
function globals.KORTZ_SECONDARY_SECONDARY(player_index)
    return globals.KORTZ_SECONDARY_TARGET(player_index, 143)
end
function globals.KORTZ_PAYOUT(target_index)
    return globals.KCPAYOUT_BASE + target_index + 1
end
function globals.YIM_RESUPPLIER_SLOT(slot_index)
    return globals.main_global + slot_index + 1
end

local locals = {
    AIFl1 = 20412, -- apartment instant finish 1
    AIFl2 = 21474,
    AIFl3 = 22153,
    AIFl4 = 23098,
    AIFl5 = 29327,
    AIFl6 = 32854,
    AFHl = 12263, -- Fleeca hack
    AFDl = 10538, -- Fleeca drill
    AFPl = 10233, -- Pacific hack
    AHSo = 20414, -- apartment checkpoint bitset
    AHLIVESL = 28164, -- apartment team lives

    DCRBl = 219, -- casino planning reload
    DCAg = 10713, -- casino autograbber state
    DCAs = 10727, -- casino autograbber speed
    DCFHl = 55028, -- casino fingerprint hack
    DCKHl = 56098, -- casino keypad hack
    DCDVDl1 = 10534, -- casino vault drill result
    DCDVDl2 = 10564, -- casino vault drill progress
    DCLIVESL = 28164, -- casino team lives
    DCXf1 = 20412,
    DCXf2 = 21474,
    DCXf3 = 22153,
    DCXf4 = 23098,
    DCXf5 = 29327,
    DCXf6 = 32854,

    CPRSl = 1580, -- Cayo planning reload
    CPFHl = 26619, -- Cayo fingerprint hack
    CPPCCl = 32754, -- Cayo plasma cutter
    CPSTCl = 31511, -- Cayo drainage pipe
    CPXf1 = 56504,
    CPXf2 = 58281,
    CPLIVESL = 64395, -- Cayo team lives

    DDSHl = 1449, -- Doomsday scenario hack
    DDIF1 = 20412,
    DDIF2 = 22153,
    DDIF3 = 29327,
    DDIF4 = 32854,
    DDIF5 = 32882,
    DDLIVESL = 28164, -- Doomsday team lives

    KCBRL = 599, -- Kortz planning reload
    KCDCL = 1388, -- Kortz data crack base
    KCFHL = 26866, -- Kortz fingerprint hack
    KCAC_BASE = 32819, -- Kortz access-code base
    KCLGL = 71006, -- Kortz lasers
    KCVLL = 27914, -- Kortz vault door
    KCCGL_BASE = 32856, -- Kortz cut-glass base
    KCCGL_OFFSET = 3,
    KCPT_STATE = 29366, -- Kortz primary target state
    KCST_STATE = 29366, -- Kortz secondary target state
    KCLIVESL = 65159, -- Kortz team lives
    KCIf1 = 57251,
    KCIf2 = 59027,

    AGFl1 = 56505, -- Agency instant finish 1
    AGFl2 = 58281,
    ASIFl1 = 56505, -- Auto Shop instant finish 1
    ASIFl2 = 58281,
    ASRBl = 418, -- Auto Shop planning reload
    SYRl1 = 547, -- Salvage Yard planning reload
    HGGs1 = 20230, -- fmmc_launcher heist type
    HGGs2 = 20211, -- fmmc_launcher minimum players
    IHPB = 56504,
    IHPL = 58281,
    NLCl = 267, -- nightclub cutscene state

    slots_random_results_table = 1381,
    prize_wheel_win_state = 311,
    prize_wheel_prize = 14,
    prize_wheel_prize_state = 45,
    SMC1 = 577,
    SMC2 = 583,
    SMC3 = 1160,
    SMC4 = 631,
    SMC5 = 1171,
    SMC6 = 591,
    SMC7 = 772,
    SMC8 = 773,
    SMC9 = 639,
    SMC10 = 635,
    SMC11 = 825,
    SMC12 = 826,
    SCRIPT_STATE = 2,
    GUNCLUB_LIVERY = 955,
}

function locals.KORTZ_DATA_CRACK(index)
    return locals.KCDCL + 1 + (index * 4)
end
function locals.KORTZ_ACCESS_CODE(index)
    return locals.KCAC_BASE + (index * 2)
end
function locals.KORTZ_CUT_GLASS(index)
    return locals.KCCGL_BASE + (index * 13) + locals.KCCGL_OFFSET
end

local scripts = {
    FMC = "fm_mission_controller",
    FMMCL = "fmmc_launcher",
    FMC2020 = "fm_mission_controller_2020",
    HIP = "heist_island_planning",
    CASINO_SLOTS = "casino_slots",
    CASINO_LUCKY_WHEEL = "casino_lucky_wheel",
    GUNCLUB_SHOP = "gunclub_shop",
}

return {edition = "Enhanced", build = "1158.13", globals = globals, locals = locals, scripts = scripts}
