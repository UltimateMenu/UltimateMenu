-- GTA V Legacy build 3889 globals and script locals used by Ultimate Menu.
-- Update addresses here when a game build changes; feature code should not
-- contain raw global or local addresses.

local FREEMODE_TUNABLES = 262145

local globals = {
    FMg = FREEMODE_TUNABLES, -- freemode tunables base
    CSg1 = 1575046, -- session type
    CSg2 = 1574589, -- session switch
    CSg3 = 1574589 + 2, -- session quit

    ACg1 = 1935929 + 1 + 1, -- apartment cut: player 1
    ACg2 = 1935929 + 1 + 2, -- apartment cut: player 2
    ACg3 = 1935929 + 1 + 3, -- apartment cut: player 3
    ACg4 = 1935929 + 1 + 4, -- apartment cut: player 4
    ACg5 = 1937897 + 3008 + 1, -- apartment local-player cut
    AUAJg1 = FREEMODE_TUNABLES + 9184, -- Fleeca job root hash
    AUAJg2 = FREEMODE_TUNABLES + 9189, -- Prison Break root hash
    AUAJg3 = FREEMODE_TUNABLES + 9196, -- Humane Labs root hash
    AUAJg4 = FREEMODE_TUNABLES + 9202, -- Series A root hash
    AUAJg5 = FREEMODE_TUNABLES + 9208, -- Pacific Standard root hash
    ACDg = 2686119, -- apartment cooldown/player-data base
    AHDg = 4718592 + 3771, -- apartment heist difficulty

    DCCg1 = 1972483 + 1497 + 736 + 92 + 1, -- casino cut: player 1
    DCCg2 = 1972483 + 1497 + 736 + 92 + 2, -- casino cut: player 2
    DCCg3 = 1972483 + 1497 + 736 + 92 + 3, -- casino cut: player 3
    DCCg4 = 1972483 + 1497 + 736 + 92 + 4, -- casino cut: player 4
    CPCg1 = 1979291 + 831 + 56 + 1, -- Cayo cut: player 1
    CPCg2 = 1979291 + 831 + 56 + 2, -- Cayo cut: player 2
    CPCg3 = 1979291 + 831 + 56 + 3, -- Cayo cut: player 3
    CPCg4 = 1979291 + 831 + 56 + 4, -- Cayo cut: player 4
    DCg1 = 1968511 + 812 + 50 + 1, -- Doomsday cut: player 1
    DCg2 = 1968511 + 812 + 50 + 2, -- Doomsday cut: player 2
    DCg3 = 1968511 + 812 + 50 + 3, -- Doomsday cut: player 3
    DCg4 = 1968511 + 812 + 50 + 4, -- Doomsday cut: player 4
    GCg = 2686119 + 6791, -- generic heist cut multiplier

    KCBGL = FREEMODE_TUNABLES + 37438, -- Kortz bag size
    KCWMG = FREEMODE_TUNABLES + 38199, -- Kortz weekly multiplier
    KCCDG = FREEMODE_TUNABLES + 38102, -- Kortz normal cooldown
    KCCD2G = FREEMODE_TUNABLES + 38103, -- Kortz hard cooldown
    KCLDG = 1935234, -- Kortz lasers disabled
    KCSECONDARY_BASE = 4980736 + 1 + 29174, -- Kortz secondary-target array
    KCPAYOUT_BASE = FREEMODE_TUNABLES + 37405, -- Kortz primary-target payouts

    HGLs1 = 4718592 + 3769, -- heist launch state 1
    HGLs2 = 4718592 + 3772, -- heist launch state 2
    HGLs3 = 4718592 + 3773, -- heist launch state 3
    HGLs4 = 4718592 + 190163 + 1, -- heist launch state 4

    SNOW = FREEMODE_TUNABLES + 4413,
    halloweatherAddress = FREEMODE_TUNABLES + 32247,
    yetihuntAddress = FREEMODE_TUNABLES + 35041,
    TRICK_OR_TREAT = FREEMODE_TUNABLES + 32173,
    SNOWMEN_COLLECTIBLES = FREEMODE_TUNABLES + 33317,
    GVADg = FREEMODE_TUNABLES + 33392, -- Gun Van armour discount
    GVWDg = FREEMODE_TUNABLES + 33373, -- Gun Van weapon discount
    GVTDg = FREEMODE_TUNABLES + 33384, -- Gun Van throwable discount
    CCBL0 = FREEMODE_TUNABLES + 26623, -- casino chip buy limit 1
    CCBL1 = FREEMODE_TUNABLES + 26624, -- casino chip buy limit 2
    CPBg = FREEMODE_TUNABLES + 29300, -- Cayo bag size
    PSV = FREEMODE_TUNABLES + 29552, -- Panther Statue value
    PDIAMOND = FREEMODE_TUNABLES + 29550, -- Pink Diamond value
    BB = FREEMODE_TUNABLES + 29549, -- Bearer Bonds value
    RN = FREEMODE_TUNABLES + 29548, -- Ruby Necklace value
    TEQUILA = FREEMODE_TUNABLES + 29547, -- Tequila value

    AG = 4525223 + 1, -- achievement unlock selector
    current_objectives_global = 2359296,
    weekly_objectives_global = 2732111,
    objectives_state_global = 1574746,
    CARGO1 = FREEMODE_TUNABLES + 22581,
    CARGO2 = FREEMODE_TUNABLES + 22582,
    CARGO3 = FREEMODE_TUNABLES + 22583,
    CARGO4 = FREEMODE_TUNABLES + 22584,
    CARGO5 = FREEMODE_TUNABLES + 22585,
    CARGO6 = FREEMODE_TUNABLES + 22586,
    CARGO7 = FREEMODE_TUNABLES + 22587,
    CARGO8 = FREEMODE_TUNABLES + 22588,
    CARGO9 = FREEMODE_TUNABLES + 22589,
    CEO1 = FREEMODE_TUNABLES + 15821, -- special cargo sale threshold
    CEO2 = FREEMODE_TUNABLES + 15588, -- special cargo buy cooldown
    CEO3 = FREEMODE_TUNABLES + 15589, -- special cargo sell cooldown
    SafeCapacity = 23769, -- nightclub safe capacity tunable offset
    IncomeStart = 23746, -- nightclub income range start
    IncomeEnd = 23765, -- nightclub income range end
    main_global = 1673807, -- YimResupplier business-state base

    TRANSACTION_ERROR_GLOBAL_1 = 4516981,
    TRANSACTION_ERROR_GLOBAL_2 = 4516982,
    TRANSACTION_ERROR_GLOBAL_3 = 4516983,
    GUN_VAN_LOCATION_GLOBAL = 2652581 + 2706,
    PLAYER_RP_MULTIPLIER_GLOBAL = FREEMODE_TUNABLES + 1,
    AIR_CARGO_RP_MULTIPLIER_GLOBAL = FREEMODE_TUNABLES + 22564,
    NIGHTCLUB_CASH_BONUS_1 = FREEMODE_TUNABLES + 17415,
    NIGHTCLUB_CASH_BONUS_2 = FREEMODE_TUNABLES + 17421,
    NIGHTCLUB_CASH_BASE = FREEMODE_TUNABLES + 17409,
    NIGHTCLUB_COKE_BONUS_1 = FREEMODE_TUNABLES + 17416,
    NIGHTCLUB_COKE_BONUS_2 = FREEMODE_TUNABLES + 17422,
    NIGHTCLUB_COKE_BASE = FREEMODE_TUNABLES + 17410,
    NIGHTCLUB_METH_BONUS_1 = FREEMODE_TUNABLES + 17417,
    NIGHTCLUB_METH_BONUS_2 = FREEMODE_TUNABLES + 17423,
    NIGHTCLUB_METH_BASE = FREEMODE_TUNABLES + 17411,
    NIGHTCLUB_WEED_BONUS_1 = FREEMODE_TUNABLES + 17418,
    NIGHTCLUB_WEED_BONUS_2 = FREEMODE_TUNABLES + 17424,
    NIGHTCLUB_WEED_BASE = FREEMODE_TUNABLES + 17412,
    NIGHTCLUB_DOCUMENTS_BONUS_1 = FREEMODE_TUNABLES + 17414,
    NIGHTCLUB_DOCUMENTS_BONUS_2 = FREEMODE_TUNABLES + 17420,
    NIGHTCLUB_DOCUMENTS_BASE = FREEMODE_TUNABLES + 17408,
    NIGHTCLUB_BUNKER_BONUS_1 = FREEMODE_TUNABLES + 21345,
    NIGHTCLUB_BUNKER_BONUS_2 = FREEMODE_TUNABLES + 21344,
    NIGHTCLUB_BUNKER_BASE = FREEMODE_TUNABLES + 21343,
    NIGHTCLUB_ACID_BONUS = FREEMODE_TUNABLES + 17419,
    NIGHTCLUB_ACID_BASE = FREEMODE_TUNABLES + 17413,
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
    return 1845298 + player_id + 260 + 364 + 5
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
    return 2658291 + 1 + ((player_index - 1) * 468) + 270
end
function globals.LEGACY_HEIST_FORCE_READY(player_index)
    return 1882572 + 1 + ((player_index - 1) * 315) + 43 + 11 + player_index
end
function globals.CAYO_FORCE_READY(player_index)
    return 1979868 + 1 + ((player_index - 1) * 27) + 7 + player_index
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
    AIFl1 = 19808, -- apartment instant finish 1
    AIFl2 = 19808 + 1062,
    AIFl3 = 19808 + 1740 + 1,
    AIFl4 = 19808 + 2686,
    AIFl5 = 28722 + 1,
    AIFl6 = 31981 + 1 + 68,
    AFHl = 11837 + 24, -- Fleeca hack
    AFDl = 10125 + 11, -- Fleeca drill
    AFPl = 9831, -- Pacific hack
    AHSo = 19808 + 2, -- apartment checkpoint bitset
    AHLIVESL = 26234 + 1325 + 1, -- apartment team lives

    DCRBl = 217, -- casino planning reload
    DCAg = 10311, -- casino autograbber state
    DCAs = 10311 + 14, -- casino autograbber speed
    DCFHl = 54118, -- casino fingerprint hack
    DCKHl = 55188, -- casino keypad hack
    DCDVDl1 = 10125 + 7, -- casino vault drill result
    DCDVDl2 = 10125 + 37, -- casino vault drill progress
    DCLIVESL = 26234 + 1325 + 1, -- casino team lives
    DCXf1 = 19808,
    DCXf2 = 19808 + 1062,
    DCXf3 = 19808 + 1740 + 1,
    DCXf4 = 19808 + 2686,
    DCXf5 = 28722 + 1,
    DCXf6 = 31981 + 1 + 68,

    CPRSl = 1578, -- Cayo planning reload
    CPFHl = 26217, -- Cayo fingerprint hack
    CPPCCl = 32349 + 3, -- Cayo plasma cutter
    CPSTCl = 31109, -- Cayo drainage pipe
    CPXf1 = 56070,
    CPXf2 = 56070 + 1776 + 1,
    CPLIVESL = 62851 + 1109 + 1, -- Cayo team lives

    DDSHl = 1312 + 135, -- Doomsday scenario hack
    DDIF1 = 19808,
    DDIF2 = 19808 + 1740 + 1,
    DDIF3 = 28722 + 1,
    DDIF4 = 31981 + 1 + 68,
    DDIF5 = 31981 + 97,
    DDLIVESL = 26234 + 1325 + 1, -- Doomsday team lives

    KCBRL = 597, -- Kortz planning reload
    KCDCL = 1386, -- Kortz data crack base
    KCFHL = 26464, -- Kortz fingerprint hack
    KCAC_BASE = 32416 + 1, -- Kortz access-code base
    KCLGL = 70472, -- Kortz lasers
    KCVLL = 27512, -- Kortz vault door
    KCCGL_BASE = 32453 + 1, -- Kortz cut-glass base
    KCCGL_OFFSET = 3,
    KCPT_STATE = 28953 + 11, -- Kortz primary target state
    KCST_STATE = 28953 + 11, -- Kortz secondary target state
    KCLIVESL = 63515 + 1109 + 1, -- Kortz team lives
    KCIf1 = 56716 + 1,
    KCIf2 = 56716 + 1776 + 1,

    AGFl1 = 56070 + 1, -- Agency instant finish 1
    AGFl2 = 56070 + 1776 + 1,
    ASIFl1 = 56070 + 1, -- Auto Shop instant finish 1
    ASIFl2 = 56070 + 1776 + 1,
    ASRBl = 416, -- Auto Shop planning reload
    SYRl1 = 545, -- Salvage Yard planning reload
    HGGs1 = 20194 + 34, -- fmmc_launcher heist type
    HGGs2 = 20194 + 15, -- fmmc_launcher minimum players
    IHPB = 56070,
    IHPL = 56070 + 1776 + 1,
    NLCl = 213 + 32 + 19 + 1, -- nightclub cutscene state

    slots_random_results_table = 1379,
    prize_wheel_win_state = 309,
    prize_wheel_prize = 14,
    prize_wheel_prize_state = 45,
    SMC1 = 574 + 1,
    SMC2 = 574 + 7,
    SMC3 = 574 + 584,
    SMC4 = 574 + 55,
    SMC5 = 574 + 595,
    SMC6 = 589,
    SMC7 = 770,
    SMC8 = 771,
    SMC9 = 632 + 5,
    SMC10 = 632 + 1,
    SMC11 = 632 + 191,
    SMC12 = 632 + 192,
    SCRIPT_STATE = 2,
    GUNCLUB_LIVERY = 206 + 747,
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

return {edition = "Legacy", build = "3889", globals = globals, locals = locals, scripts = scripts}
