-- Mock-runtime inventory check for the unmodified YimMenu script.
local next_ref, counters = 0, {list = 0, action = 0, toggle = 0, text = 0}
local actions, toggles, inputs, sliders, native_calls, list_names = {}, {}, {}, {}, {}, {}
local threads_created = 0
local thread_callbacks = {}
local thread_origins = {}
local menu_back_calls = 0
local list_refs, current_page_id, panel_draw, drawn_text, menu_visible = {}, 0, nil, {}, true
local memory_values = {}
local last_pointer
local function ref()
    next_ref = next_ref + 1
    return {id = next_ref}
end
menu = {
    my_root = ref,
    list = function(_, label)
        counters.list = counters.list + 1
        list_names[label] = true
        local result = ref()
        list_refs[label] = result
        return result
    end,
    action = function(_, label, _, _, callback)
        counters.action = counters.action + 1
        actions[#actions + 1] = {label = label, callback = callback}
        return ref()
    end,
    toggle = function(_, label, _, _, callback, default)
        counters.toggle = counters.toggle + 1
        toggles[#toggles + 1] = {label = label, callback = callback, default = default}
        return ref()
    end,
    slider = function(_, label, _, _, _, _, _, _, callback)
        sliders[#sliders + 1] = {label = label, callback = callback}
        return ref()
    end,
    readonly = function() counters.text = counters.text + 1; return ref() end,
    divider = function() return ref() end,
    is_visible = function() return menu_visible end,
    page_id = function() return current_page_id end,
    bounds = function() return 100, 80, 420 end,
    content_rect = function() return 100, 250, 420, 440 end,
    get_value = function() return false end,
    set_value = function() end,
    get_menu_name = function() return "" end,
    set_menu_name = function() end,
    set_help_text = function() end,
    go_back = function() menu_back_calls = menu_back_calls + 1 end,
}
__smenu = {
    text_input = function(_, label, _, _, callback)
        inputs[#inputs + 1] = {label = label, callback = callback}
        return ref().id
    end,
    node_in_viewport = function() return true end,
}
util = {
    joaat = function(name)
        local page = tostring(name):match("^Stand#(%d+)$")
        return page and (100000 + tonumber(page)) or #tostring(name)
    end,
    toast = function() end,
    yield = function()
        local _, is_main = coroutine.running()
        if not is_main then coroutine.yield() end
    end,
    create_thread = function(callback)
        threads_created = threads_created + 1
        thread_callbacks[#thread_callbacks + 1] = callback
        thread_origins[#thread_origins + 1] = debug.traceback("", 2)
        return {}
    end,
}
overlay = {on_draw = function(name, callback)
    assert(name == "ultimate_menu_information", "Unexpected overlay registration")
    panel_draw = callback
end}
font = {small = 1, item = 2}
ctx = {
    screen_w = function() return 1280 end,
    screen_h = function() return 900 end,
    edition = function() return os.getenv("UM_EDITION") or "Legacy" end,
}
input = {mouse_x = function() return 0 end, mouse_y = function() return 0 end,
    mouse_wheel = function() return 0 end}
theme = {accent = function() return 55, 145, 245 end}
text = {
    width = function(_, value) return #tostring(value) * 8 end,
    height = function() return 16 end,
    draw = function(_, _, _, _, _, _, _, value) drawn_text[#drawn_text + 1] = value end,
    draw_ellipsis = function(_, _, _, _, _, _, _, value) drawn_text[#drawn_text + 1] = value end,
}
draw = {rect = function() end, rect_outline = function() end,
    push_clip = function() end, pop_clip = function() end}
__ny_execute_as_script = function(_, callback) callback(); return true end
__ny_request_script_host = function() return true end
memory = {
    alloc_int = function() return 1 end,
    alloc_float = function() return 2 end,
    read_int = function(address) return memory_values[address] or 0 end,
    write_int = function(address, value) memory_values[address] = value end,
    read_float = function() return 0 end,
    read_bool = function() return false end,
    script_global = function() return 0 end,
    script_local = function() return nil end,
    tunable = function() return 0 end,
}
local last_hash
local session_started = os.getenv("UM_START_OFFLINE") == nil
local owned_stats = os.getenv("UM_OWNED_STATS") == "1"
native_invoker = {
    begin_call = function() end,
    push_arg_int = function() end,
    push_arg_float = function() end,
    push_arg_bool = function() end,
    push_arg_pointer = function(address) last_pointer = address end,
    end_call = function(hash)
        last_hash = hash
        native_calls[#native_calls + 1] = hash
        if hash == "3C5FD37B5499582E" then memory_values[last_pointer] = 42 end
        if hash == "767FBC2AC802EF3D" and owned_stats then
            memory_values[last_pointer] = 1
        end
    end,
    get_return_value_bool = function()
        return (last_hash == "9DE624D2FC4B603F" and session_started)
            or last_hash == "3C5FD37B5499582E"
            or (last_hash == "767FBC2AC802EF3D" and owned_stats)
            or last_hash == "7239B21A38F536BA"
    end,
    get_return_value_int = function() return 0 end,
    get_return_value_float = function() return 0 end,
    get_return_value_vector3 = function() return {x = 1, y = 2, z = 3} end,
}
local direct_native_calls = {}
local load_phase = true
for _, group in ipairs({"CLOCK", "CUTSCENE", "ENTITY", "HUD", "INTERIOR", "NETSHOPPING", "PAD", "PED", "PLAYER", "SCRIPT", "STREAMING", "SYSTEM", "TASK"}) do
    _G[group] = setmetatable({}, {__index = function(_, name)
        return function()
            if load_phase then direct_native_calls[group .. "." .. name] = true end
            return 0
        end
    end})
end
ENTITY.DOES_ENTITY_EXIST = function() return true end
__stand_get_all = function() return {} end
__stand_get_weapons = function() return {{n = "WEAPON_PISTOL", d = "Pistol"}} end
vec3 = {new = function(_, x, y, z) return {x = x, y = y, z = z} end}
ImGuiWindowFlags = {Modal = 0, NoCollapse = 0, NoMove = 0, NoResize = 0}
log = {info = function() end, warning = function() end, debug = function() end}

local fake_files = {}
local original_io_open = io.open
io.open = function(name, mode)
    if mode == "r" and not fake_files[name] then return nil end
    return {
        write = function(_, body) fake_files[name] = body end,
        read = function() return fake_files[name] end,
        close = function() end,
    }
end

local before_load = #native_calls
local legacy_offsets = dofile("Nenyoo/lib/game_offsets_legacy.offsets")
local enhanced_offsets = dofile("Nenyoo/lib/game_offsets_enhanced.offsets")
for _, group_name in ipairs({"globals", "locals", "scripts"}) do
    for name in pairs(legacy_offsets[group_name]) do
        assert(enhanced_offsets[group_name][name] ~= nil,
            "Enhanced catalog is missing " .. group_name .. "." .. name)
    end
    for name in pairs(enhanced_offsets[group_name]) do
        assert(legacy_offsets[group_name][name] ~= nil,
            "Legacy catalog is missing " .. group_name .. "." .. name)
    end
end
local offset_catalog = dofile("Nenyoo/lib/game_offsets.offsets")
assert(offset_catalog.globals.TRANSACTION_ERROR_GLOBAL_1 == 4516981, "Global offset catalog did not load")
if ctx.edition() == "Enhanced" then
    assert(offset_catalog.edition == "Enhanced" and offset_catalog.build == "1158.13",
        "Enhanced catalog was not selected")
    assert(offset_catalog.globals.ACg1 == 1936408, "Enhanced apartment cut is incorrect")
    assert(offset_catalog.globals.CSg1 == 1575048, "Enhanced session type is incorrect")
    assert(offset_catalog.locals.AHLIVESL == 28164, "Enhanced apartment lives local is missing")
    assert(offset_catalog.globals.APARTMENT_COOLDOWN(0) == 2686124 + 1 + 76,
        "Enhanced dynamic global formula is incorrect")
    assert(offset_catalog.locals.KORTZ_CUT_GLASS(4) == 32856 + (4 * 13) + 3,
        "Enhanced dynamic local formula is incorrect")
else
    assert(offset_catalog.edition == "Legacy" and offset_catalog.build == "3889",
        "Legacy catalog was not selected")
    assert(offset_catalog.locals.AHLIVESL == 26234 + 1325 + 1, "Apartment lives local is missing")
    assert(offset_catalog.globals.APARTMENT_COOLDOWN(0) == 2686119 + 1 + 76,
        "Dynamic global formula is incorrect")
    assert(offset_catalog.locals.KORTZ_CUT_GLASS(4) == 32453 + 1 + (4 * 13) + 3,
        "Dynamic local formula is incorrect")
end
local executed_lines = {}
if os.getenv("UM_SCAN_COVERAGE") then
    debug.sethook(function(_, line)
        local info = debug.getinfo(2, "S")
        if info.source and info.source:find("Ultimate_Menu_Legacy.lua", 1, true) then
            executed_lines[line] = true
        end
    end, "l")
end
local compat = dofile("Nenyoo/Ultimate_Menu.lua")
debug.sethook()
load_phase = false
assert(fake_files["Nenyoo/YimResupplier.json"], "Resupplier config was not kept inside its package")
assert(not fake_files["YimResupplier.json"], "Resupplier config leaked into the game directory")
assert(rawget(_G, "stats") == nil, "Package leaked Yim stats into other scripts")
assert(rawget(memory, "scan_pattern") == nil, "Package changed the global memory API")
if os.getenv("UM_SCAN_COVERAGE") then
    local file = assert(original_io_open("Nenyoo/lib/Ultimate_Menu_Legacy.lua", "r"))
    local line_number = 0
    for line in file:lines() do
        line_number = line_number + 1
        if line:find("ImGui%.[A-Za-z_]+%(") and not executed_lines[line_number] then
            print("Unmaterialized UI line " .. line_number .. ": " .. line)
        end
    end
    file:close()
end
local permitted_load_natives = {
    ["SCRIPT.GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH"] = true,
    ["CLOCK.GET_CLOCK_MINUTES"] = true,
    ["CLOCK.GET_CLOCK_HOURS"] = true,
    ["INTERIOR.GET_INTERIOR_FROM_ENTITY"] = true,
    ["PLAYER.PLAYER_PED_ID"] = true,
}
for name in pairs(direct_native_calls) do
    assert(permitted_load_natives[name], "Menu materialization called unexpected native: " .. name)
end
if os.getenv("UM_SHOW_LOAD_NATIVES") then
    for name in pairs(direct_native_calls) do print(name) end
end
for i = before_load + 1, #native_calls do
    assert(native_calls[i] ~= "B3271D7AB655B441", "Menu materialization wrote a stat")
end
assert(counters.list >= 60, "Missing tab hierarchy: " .. counters.list)
if not os.getenv("UM_START_OFFLINE") then
    assert(counters.action >= 940, "Missing initial actions: " .. counters.action)
end
assert(#compat.imgui_sections >= 43, "Missing ImGui sections: " .. #compat.imgui_sections)
assert(panel_draw, "Information overlay did not register")
if os.getenv("UM_START_OFFLINE") then
    local viewport_thread = coroutine.create(thread_callbacks[#thread_callbacks])
    local ok, message = coroutine.resume(viewport_thread)
    assert(ok, message)
    local recovery_id = util.joaat("Stand#" .. list_refs["Set Rank menu"].id)
    local offline_info = compat.info_for_page(recovery_id)
    local warning = false
    for _, row in ipairs(offline_info.rows) do
        if row.text:find("Unavailable in Single Player", 1, true) then warning = true end
    end
    assert(warning, "Single Player warning did not reach the information panel")
    session_started = true
    ok, message = coroutine.resume(viewport_thread)
    assert(ok, message)
    for _, row in ipairs(compat.info_for_page(recovery_id).rows) do
        assert(not row.text:find("Unavailable in Single Player", 1, true),
            "Single Player warning remained after joining online")
    end
    assert(counters.action >= 940, "Online controls did not appear after joining: " .. counters.action)
end
local apartment_id = util.joaat("Stand#" .. list_refs["Apartment Heist "].id)
local apartment_info = compat.info_for_page(apartment_id)
assert(apartment_info and #apartment_info.rows >= 5, "Apartment Heist instructions did not reach the panel")
assert(counters.text == 0, "Informational text still occupies selectable menu rows")
local kortz_id = util.joaat("Stand#" .. list_refs["Kortz Center Heist"].id)
local kortz_info = compat.info_for_page(kortz_id)
local colored_status, expanded_help = false, false
for _, row in ipairs(kortz_info.rows) do
    if row.color then colored_status = true end
    if row.text:find("Select the main painting", 1, true) then expanded_help = true end
end
assert(colored_status, "Colored YimMenu status text lost its color")
assert(expanded_help, "YimMenu help marker was not expanded in the panel")
local tooltip_explanations = {
    "Enables the Trick or Treat event",
    "Enables the Snowmen Collectibles event",
    "Enables the Yeti Hunt event",
    "Enables the special liveries for Knife",
}
local found_explanations = {}
for id in pairs(compat.info_pages) do
    local page = compat.info_for_page(id)
    for _, row in ipairs(page.rows) do
        assert(row.text ~= "[?]", "Unexpanded help marker on " .. tostring(page.title))
        for i, explanation in ipairs(tooltip_explanations) do
            if row.text:find(explanation, 1, true) then found_explanations[i] = true end
        end
    end
end
for i, explanation in ipairs(tooltip_explanations) do
    assert(found_explanations[i], "Help text did not reach the panel: " .. explanation)
end
for _, action in ipairs(actions) do
    assert(action.label ~= "[?]", "Help marker became an action label")
end
for _, input in ipairs(inputs) do
    assert(input.label ~= "[?]", "Help marker became an input label")
end
assert(not list_names["[?]"], "Help marker became a submenu label")
current_page_id = apartment_id
panel_draw()
local found_instruction = false
local found_wrapped_instruction = false
for _, value in ipairs(drawn_text) do
    if value:find("Pay for the preparation", 1, true) then found_instruction = true end
    if value:find("change the session", 1, true) then found_wrapped_instruction = true end
end
assert(found_instruction, "Long heist instructions were not drawn in the information panel")
assert(found_wrapped_instruction, "Long heist instructions were cut off instead of wrapped")
local drawn_count = #drawn_text
current_page_id = 0
panel_draw()
assert(#drawn_text == drawn_count, "Information panel appeared outside its submenu")
current_page_id = apartment_id
menu_visible = false
panel_draw()
assert(#drawn_text == drawn_count, "Information panel remained after the menu closed")
menu_visible = true
for _, name in ipairs({"Self Menu", "Story Mode", "Recovery Menu", "Online Services Menu",
    "Collectibles", "Events Menu", "YimResupplier", "Heists Data Editor Menu", "Kortz Center Heist"}) do
    assert(list_names[name], "Missing original menu section: " .. name)
end
local rank_action
for _, action in ipairs(actions) do
    if action.label == "Set Rank" then rank_action = action.callback; break end
end
assert(rank_action, "Missing ImGui rank action")
session_started = false
local offline_before = #native_calls
rank_action()
for i = offline_before + 1, #native_calls do
    assert(native_calls[i] ~= "B3271D7AB655B441", "Online action changed stats in Story Mode")
end
session_started = true
local before = #native_calls
rank_action()
local stat_writes = 0
for i = before + 1, #native_calls do
    if native_calls[i] == "B3271D7AB655B441" then stat_writes = stat_writes + 1 end
end
assert(stat_writes == 2, "Rank action did not write both stats: " .. stat_writes)
session_started = false
local story_viewport = coroutine.create(thread_callbacks[#thread_callbacks])
local story_ok, story_error = coroutine.resume(story_viewport)
assert(story_ok, story_error)
session_started = true
local story_cash_action
for _, action in ipairs(actions) do
    if action.label == "Add 1 Mil Cash $" then story_cash_action = action.callback; break end
end
assert(story_cash_action, "Missing Story Mode cash action")
before = #native_calls
story_cash_action()
for i = before + 1, #native_calls do
    assert(native_calls[i] ~= "B3271D7AB655B441", "Story Mode action changed stats online")
end
session_started = false
before = #native_calls
story_cash_action()
local story_wrote = false
for i = before + 1, #native_calls do
    if native_calls[i] == "B3271D7AB655B441" then story_wrote = true end
end
assert(story_wrote, "Story Mode action did not reach the stat bridge offline")
session_started = true
local panther_action
for _, action in ipairs(actions) do
    if action.label == "Panther Statue" then panther_action = action.callback; break end
end
assert(panther_action, "Missing Cayo primary target option")
before = #native_calls
panther_action()
local target_written = false
for i = before + 1, #native_calls do
    if native_calls[i] == "B3271D7AB655B441" then target_written = true end
end
assert(target_written, "Cayo target option did not reach the stat bridge")
local office_action
for _, action in ipairs(actions) do
    if action.label == "Teleport To Office" then office_action = action.callback; break end
end
assert(office_action, "Missing nested YimResupplier action")
before = threads_created
office_action()
assert(threads_created > before, "Nested tab action did not reach its callback")
local native_table = setmetatable({}, {__index = NETSHOPPING})
local wrapper_environment = setmetatable({
    NETSHOPPING = native_table,
    HUD = setmetatable({}, {__index = HUD}),
    ENTITY = setmetatable({}, {__index = ENTITY}),
    CUTSCENE = setmetatable({}, {__index = CUTSCENE}),
    memory = setmetatable({}, {__index = memory}),
}, {__index = _G})
assert(loadfile("Nenyoo/lib/yim_compat.lua", "t", wrapper_environment))()
local service_ok, transaction = native_table.NET_GAMESERVER_BEGIN_SERVICE(-1, 1, 2, 3, 4, 5)
assert(service_ok and transaction == 42, "Weapon unlock service lost the output transaction ID")
assert(rawget(NETSHOPPING, "NET_GAMESERVER_BEGIN_SERVICE") == nil, "Package changed global native wrappers")
local blip_position = wrapper_environment.HUD.GET_BLIP_COORDS(1)
assert(blip_position.x == 1 and blip_position.z == 3, "Blip coordinates lost their vector result")
assert(wrapper_environment.HUD.DOES_BLIP_EXIST(1) == false, "Missing blip must be false, not numeric zero")
assert(wrapper_environment.NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE() == false, "Inactive basket must be false")
assert(wrapper_environment.CUTSCENE.IS_CUTSCENE_PLAYING() == false, "Inactive cutscene must be false")
assert(wrapper_environment.weapons.get_weapon_display_name("WEAPON_PISTOL") == "Pistol", "Weapon editor lost catalog names")
assert(wrapper_environment.weapons.get_weapon_display_name(util.joaat("WEAPON_PISTOL")) == "Pistol", "Gun Van hash did not resolve")
local failures = {}
local initial_action_count = #actions
local initial_toggle_count, initial_input_count, initial_slider_count = #toggles, #inputs, #sliders
for _, action in ipairs(actions) do
    local ok, message = pcall(action.callback)
    if not ok then failures[#failures + 1] = action.label .. ": " .. tostring(message) end
end
for _, toggle in ipairs(toggles) do
    local ok, message = pcall(toggle.callback, not toggle.default)
    if not ok then failures[#failures + 1] = toggle.label .. ": " .. tostring(message) end
end
for _, input in ipairs(inputs) do
    local ok, message = pcall(input.callback, "1")
    if not ok then failures[#failures + 1] = input.label .. ": " .. tostring(message) end
end
for _, slider in ipairs(sliders) do
    local ok, message = pcall(slider.callback, 1)
    if not ok then failures[#failures + 1] = slider.label .. ": " .. tostring(message) end
end
local scheduled = #thread_callbacks
if os.getenv("UM_OWNED_STATS") == "late" then owned_stats = true end
for i = 1, scheduled do
    local thread = coroutine.create(thread_callbacks[i])
    debug.sethook(thread, function() error("Mock thread exceeded one-tick instruction budget") end, "", 1000000)
    for tick = 1, 2 do
        if coroutine.status(thread) == "dead" then break end
        local ok, message = coroutine.resume(thread)
        if not ok then failures[#failures + 1] = "thread " .. i .. " tick " .. tick .. ": " .. tostring(message) .. thread_origins[i]; break end
    end
end
assert(counters.action >= 1046, "Dynamic Gun Van editor controls did not materialize")
if os.getenv("UM_OWNED_STATS") then
    assert(counters.action >= 1069, "Owned-business controls did not materialize")
end
for i = initial_action_count + 1, #actions do
    local ok, message = pcall(actions[i].callback)
    if not ok then failures[#failures + 1] = actions[i].label .. ": " .. tostring(message) end
end
for i = initial_toggle_count + 1, #toggles do
    local ok, message = pcall(toggles[i].callback, not toggles[i].default)
    if not ok then failures[#failures + 1] = toggles[i].label .. ": " .. tostring(message) end
end
for i = initial_input_count + 1, #inputs do
    local ok, message = pcall(inputs[i].callback, "1")
    if not ok then failures[#failures + 1] = inputs[i].label .. ": " .. tostring(message) end
end
for i = initial_slider_count + 1, #sliders do
    local ok, message = pcall(sliders[i].callback, 1)
    if not ok then failures[#failures + 1] = sliders[i].label .. ": " .. tostring(message) end
end
for _, failure in ipairs(failures) do print(failure) end
assert(#failures == 0, string.format("%d action callbacks failed", #failures))
assert(menu_back_calls > 0, "Gun Van Close action did not leave its submenu")
-- A filtered list changes ordinal positions. An action must still select its
-- original weapon rather than whatever weapon moved into that position.
local weapon_filter, pistol_action, set_weapon_action
for _, input in ipairs(inputs) do
    if input.label == "Weapon Name" then weapon_filter = input.callback end
end
for _, action in ipairs(actions) do
    if action.label == "Pistol" then pistol_action = action.callback end
    if action.label == "Set Weapon" then set_weapon_action = action.callback end
end
assert(weapon_filter and pistol_action and set_weapon_action, "Missing Gun Van editor controls")
memory.tunable = function() return 123456 end
weapon_filter("Pistol")
pistol_action()
set_weapon_action()
assert(memory_values[123456] == util.joaat("WEAPON_PISTOL"), "Filtered Gun Van row selected another weapon")
print(string.format("Ultimate Menu loaded: %d nodes, %d lists, %d actions, %d ImGui sections",
    next_ref, counters.list, counters.action, #compat.imgui_sections))
