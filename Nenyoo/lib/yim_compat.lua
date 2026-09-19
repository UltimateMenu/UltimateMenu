-- YimMenu API compatibility for Ultimate Menu on Nenyoo.
-- Loaded by the Nenyoo entry script on Nenyoo's script thread.
local nv = native_invoker
local stat_out = memory.alloc_int()
local float_out = memory.alloc_float()
local scan_context

local function invoke(hash, args, result)
    nv.begin_call()
    for _, arg in ipairs(args) do
        local kind, value = arg[1], arg[2]
        if kind == "float" then nv.push_arg_float(value)
        elseif kind == "bool" then nv.push_arg_bool(value)
        elseif kind == "ptr" then nv.push_arg_pointer(value)
        else nv.push_arg_int(value) end
    end
    nv.end_call(hash)
    if result == "bool" then return nv.get_return_value_bool() end
    if result == "int" then return nv.get_return_value_int() end
    if result == "float" then return nv.get_return_value_float() end
    if result == "vector3" then return nv.get_return_value_vector3() end
end

local function stat_hash(name) return util.joaat(name) end

stats = {}
function stats.get_int(name)
    local ok = invoke("767FBC2AC802EF3D", {{"int", stat_hash(name)}, {"ptr", stat_out}, {"int", -1}}, "bool")
    return ok and memory.read_int(stat_out) or 0
end
function stats.get_float(name)
    local ok = invoke("D7AE6C9C9C6AC54C", {{"int", stat_hash(name)}, {"ptr", float_out}, {"int", -1}}, "bool")
    return ok and memory.read_float(float_out) or 0.0
end
function stats.get_bool(name)
    local ok = invoke("11B5E6D2AE73F48E", {{"int", stat_hash(name)}, {"ptr", stat_out}, {"int", -1}}, "bool")
    return ok and memory.read_bool(stat_out) or false
end
function stats.set_int(name, value)
    if scan_context then return false end
    return invoke("B3271D7AB655B441", {{"int", stat_hash(name)}, {"int", value}, {"bool", true}}, "bool")
end
function stats.set_float(name, value)
    if scan_context then return false end
    return invoke("4851997F37FE9B3C", {{"int", stat_hash(name)}, {"float", value}, {"bool", true}}, "bool")
end
function stats.set_bool(name, value)
    if scan_context then return false end
    return invoke("4B33C4243DE0C432", {{"int", stat_hash(name)}, {"bool", value}, {"bool", true}}, "bool")
end
function stats.get_masked_int(name, offset, width)
    local ok = invoke("655185A06D9EEAAB", {
        {"int", stat_hash(name)}, {"ptr", stat_out}, {"int", offset}, {"int", width}, {"int", -1},
    }, "bool")
    return ok and memory.read_int(stat_out) or 0
end
function stats.set_masked_int(name, value, offset, width)
    if scan_context then return false end
    return invoke("7BBB1B54583ED410", {
        {"int", stat_hash(name)}, {"int", value}, {"int", offset}, {"int", width}, {"bool", true},
    }, "bool")
end
function stats.set_bool_masked(name, value, bit)
    if scan_context then return false end
    return invoke("5BC62EC1937B9E5B", {
        {"int", stat_hash(name)}, {"bool", value}, {"int", bit}, {"bool", true},
    }, "bool")
end
local function character_slot() return stats.get_int("MPPLY_LAST_MP_CHAR") end
function stats.set_packed_stat_bool(index, value)
    if scan_context then return false end
    invoke("DB8A58AEAA67CD07", {{"int", index}, {"bool", value}, {"int", character_slot()}})
end
function stats.set_packed_stat_int(index, value)
    if scan_context then return false end
    invoke("1581503AE529CD2E", {{"int", index}, {"int", value}, {"int", character_slot()}})
end

globals = {}
local function global_addr(index)
    local addr = memory.script_global(index)
    return addr and addr ~= 0 and addr or nil
end
function globals.get_int(index)
    local addr = global_addr(index)
    return addr and memory.read_int(addr) or 0
end
function globals.set_int(index, value)
    if scan_context then return false end
    local addr = global_addr(index)
    if addr then memory.write_int(addr, value); return true end
    return false
end
function globals.set_float(index, value)
    if scan_context then return false end
    local addr = global_addr(index)
    if addr then memory.write_float(addr, value); return true end
    return false
end

locals = {}
local function local_addr(script_name, index)
    local addr = memory.script_local(util.joaat(script_name), index)
    return addr and addr ~= 0 and addr or nil
end
function locals.get_int(script_name, index)
    local addr = local_addr(script_name, index)
    return addr and memory.read_int(addr) or 0
end
function locals.get_float(script_name, index)
    local addr = local_addr(script_name, index)
    return addr and memory.read_float(addr) or 0.0
end
function locals.set_int(script_name, index, value)
    if scan_context then return false end
    local addr = local_addr(script_name, index)
    if addr then memory.write_int(addr, value); return true end
    return false
end
function locals.set_float(script_name, index, value)
    if scan_context then return false end
    local addr = local_addr(script_name, index)
    if addr then memory.write_float(addr, value); return true end
    return false
end

tunables = {}
local function tunable_addr(name)
    local addr = memory.tunable(name)
    return addr and addr ~= 0 and addr or nil
end
function tunables.get_int(name)
    local addr = tunable_addr(name)
    return addr and memory.read_int(addr) or 0
end
function tunables.get_float(name)
    local addr = tunable_addr(name)
    return addr and memory.read_float(addr) or 0.0
end
function tunables.set_int(name, value)
    if scan_context then return false end
    local addr = tunable_addr(name)
    if addr then memory.write_int(addr, value); return true end
    return false
end
function tunables.set_float(name, value)
    if scan_context then return false end
    local addr = tunable_addr(name)
    if addr then memory.write_float(addr, value); return true end
    return false
end
function tunables.set_bool(name, value)
    if scan_context then return false end
    local addr = tunable_addr(name)
    if addr then memory.write_bool(addr, value); return true end
    return false
end

network = network or {}
function network.is_session_started()
    return invoke("9DE624D2FC4B603F", {}, "bool")
end
function network.force_script_host(name)
    if scan_context then return false end
    return __ny_request_script_host(name)
end

-- Yim's generated native binding returns an output argument as a second Lua
-- value. Nenyoo's generic named-native wrapper only returns the native result.
-- Preserve the transaction ID required by Ultimate Menu's weapon unlocks.
NETSHOPPING.NET_GAMESERVER_BEGIN_SERVICE = function(_, category, item, action, value, flags)
    if scan_context then return false, 0 end
    memory.write_int(stat_out, 0)
    local ok = invoke("3C5FD37B5499582E", {
        {"ptr", stat_out}, {"int", category}, {"int", item},
        {"int", action}, {"int", value}, {"int", flags},
    }, "bool")
    return ok, memory.read_int(stat_out)
end
NETSHOPPING.NET_GAMESERVER_BASKET_IS_ACTIVE = function()
    return invoke("A65568121DF2EA26", {}, "bool")
end
local disable_control_action = PAD.DISABLE_CONTROL_ACTION
PAD.DISABLE_CONTROL_ACTION = function(...)
    if not scan_context then return disable_control_action(...) end
end
-- The generated native.call wrappers return one integer; blip coordinates are
-- a three-float native result used by several Resupplier teleport actions.
HUD.GET_BLIP_COORDS = function(blip)
    return invoke("586AFE3FF72D996E", {{"int", blip}}, "vector3")
end
HUD.DOES_BLIP_EXIST = function(blip)
    return invoke("A6DB27D19ECBB7DA", {{"int", blip}}, "bool")
end
ENTITY.DOES_ENTITY_EXIST = function(entity)
    return invoke("7239B21A38F536BA", {{"int", entity}}, "bool")
end
CUTSCENE.IS_CUTSCENE_PLAYING = function()
    return invoke("D3C2E180A40F031E", {}, "bool")
end

joaat = util.joaat
vec3 = {new = function(_, x, y, z) return {x = x, y = y, z = z} end}
log = {
    info = function(message) if util.log then util.log(message) end end,
    warning = function(message) if util.log then util.log(message) end end,
    debug = function(message) if util.log then util.log(message) end end,
}
entities = {
    get_all_objects_as_handles = function()
        return __stand_get_all(false, false, true)
    end,
}
local function pattern_at(addr)
    return {
        is_null = function() return addr:is_null() end,
        add = function(_, offset) return pattern_at(addr:add(offset)) end,
        rip = function() return pattern_at(addr:rip()) end,
        get_string = function() return addr:read_string() end,
    }
end
memory.scan_pattern = function(pattern) return pattern_at(mem.scan_address(pattern)) end
self = {
    get_id = function() return PLAYER.PLAYER_ID() end,
    get_ped = function() return PLAYER.PLAYER_PED_ID() end,
}

weapons = {}
local weapon_names = {}
local weapon_catalog_loaded, next_weapon_lookup = false, 0
local function readable_weapon_name(value)
    return value:gsub("^WEAPON_", ""):gsub("_", " "):lower():gsub("(%a)([%w']*)", function(first, rest)
        return first:upper() .. rest
    end)
end
function weapons.get_weapon_display_name(value)
    if value == nil or value == "" or value == 0 then return "" end
    if not weapon_catalog_loaded and __stand_get_weapons and os.clock() >= next_weapon_lookup then
        local catalog = __stand_get_weapons()
        weapon_catalog_loaded = #catalog > 0
        next_weapon_lookup = os.clock() + 1
        for _, entry in ipairs(catalog) do
            local name = entry.d or readable_weapon_name(entry.n)
            weapon_names[entry.n] = name
            weapon_names[util.joaat(entry.n)] = name
        end
    end
    if weapon_names[value] then return weapon_names[value] end
    if type(value) == "string" and value:match("^WEAPON_[%w_]+$") then
        return readable_weapon_name(value)
    end
    return ""
end

local tab_methods = {}
local imgui_sections = {}
local info_pages = {}
local tab_mt = {__index = tab_methods}
local function page_id(ref)
    return util.joaat("Stand#" .. tostring(type(ref) == "table" and ref.id or ref))
end
local function info_page(ref, title)
    local id = page_id(ref)
    if not info_pages[id] then info_pages[id] = {title = title or "Information", static = {}} end
    return info_pages[id], id
end
local function text_input(parent, label, help, callback, value)
    if menu.text_input then
        return menu.text_input(parent, label, {}, help, callback, value)
    end
    return __smenu.text_input(type(parent) == "table" and parent.id or parent, label, {}, help, callback, value)
end
local function tab(ref, path)
    info_page(ref, path:match("([^/]+)$") or path)
    return setmetatable({ref = ref, path = path}, tab_mt)
end

gui = {}
function gui.get_tab(name)
    return tab(menu.list(menu.my_root(), name, {}, "Ultimate Menu for Nenyoo"), name)
end
function gui.show_message(title, message) util.toast(tostring(title) .. ": " .. tostring(message)) end
gui.show_success = gui.show_message
gui.show_error = gui.show_message
function gui.add_notification(message) util.toast(tostring(message)) end

function tab_methods:add_tab(name)
    return tab(menu.list(self.ref, name, {}, ""), self.path .. "/" .. name)
end
function tab_methods:add_button(label, callback)
    return menu.action(self.ref, label, {}, "", callback)
end
function tab_methods:add_checkbox(label, default_value)
    local ref = menu.toggle(self.ref, label, {}, "", function() end, default_value or false)
    return {
        is_enabled = function() return menu.get_value(ref) and true or false end,
        set_enabled = function(_, value) menu.set_value(ref, value and true or false) end,
    }
end
function tab_methods:add_input_int(label, default_value)
    local obj = {value = default_value or 0}
    text_input(self.ref, label, "Enter an integer", function(text)
        local number = tonumber(text)
        if number then obj.value = math.tointeger(number) or math.floor(number) end
    end, tostring(obj.value))
    function obj:get_value() return self.value end
    function obj:set_value(value) self.value = value end
    return obj
end
function tab_methods:add_text(label)
    local page = info_page(self.ref)
    page.static[#page.static + 1] = {text = tostring(label or "")}
end
function tab_methods:add_separator() return menu.divider(self.ref, "") end
function tab_methods:add_sameline() end
function tab_methods:add_imgui(callback)
    imgui_sections[#imgui_sections + 1] = {parent = self.ref, path = self.path, callback = callback}
end

script = script or {}
-- The upstream script also calls script:sleep() directly from one menu action.
function script.sleep(_, ms) util.yield(ms) end
local fiber_script = {
    yield = function(_, ms) util.yield(ms) end,
    sleep = function(_, ms) util.yield(ms) end,
}
function script.register_looped(_, callback)
    return util.create_thread(function()
        while true do
            callback(fiber_script)
            util.yield()
        end
    end)
end
function script.run_in_fiber(callback)
    return util.create_thread(function() callback(fiber_script) end)
end
function script.execute_as_script(name, callback)
    if scan_context then return false end
    return __ny_execute_as_script(name, callback)
end

local current_section, current_event, building, widget_index, widget_occurrences, separator_occurrences, parent_stack
local function current_parent() return parent_stack[#parent_stack] end
local function push_parent(ref) parent_stack[#parent_stack + 1] = ref end
local function pop_parent() if #parent_stack > 1 then parent_stack[#parent_stack] = nil end end
local function ancestors(extra)
    local out = {}
    for _, ref in ipairs(parent_stack) do
        out[type(ref) == "table" and ref.id or ref] = true
    end
    if extra then out[type(extra) == "table" and extra.id or extra] = true end
    return out
end
local function source_key(counters, fallback, label)
    for level = 3, 12 do
        local info = debug.getinfo(level, "Sl")
        if not info then break end
        if info.source and info.source:find("Ultimate_Menu_Legacy.lua", 1, true) then
            local line = info.currentline
            local key = tostring(line)
            if label ~= nil then key = key .. ":" .. tostring(label) end
            counters[key] = (counters[key] or 0) + 1
            return key .. ":" .. counters[key]
        end
    end
    return fallback
end
local function next_id(label)
    widget_index = widget_index + 1
    return source_key(widget_occurrences, tostring(widget_index), label)
end
local function label_for_menu(label)
    if label:sub(1, 2) ~= "##" then return label:gsub("##.*$", "") end
    if current_section.last_text and current_section.last_text ~= "" then return current_section.last_text end
    return label:sub(3):gsub("_", " "):gsub("(%l)(%u)", "%1 %2")
end
local function replay(section, event)
    current_section, current_event = section, event
    building, widget_index, widget_occurrences, separator_occurrences, parent_stack = false, 0, {}, {}, {section.parent}
    section.info_rows = {}
    section.callback()
    current_section, current_event, parent_stack = nil, nil, nil
end
local function event_for(id, value)
    return current_event and current_event.id == id and current_event.value == value
end
local function register_action(label, value)
    local id = next_id(label)
    local section = current_section
    if not section.widget_refs[id] then
        local path = ancestors()
        section.widget_refs[id] = menu.action(current_parent(), label_for_menu(label), {}, "", function()
            replay(section, {id = id, value = value, ancestors = path})
        end)
    end
    section.last_ref = section.widget_refs[id]
    section.last_info_row = nil
    return event_for(id, value)
end

ImGui = {}
function ImGui.Button(label) return register_action(label, true) end
function ImGui.Selectable(label) return register_action(label, true) end
function ImGui.Checkbox(label, value)
    local id = next_id(label)
    local section = current_section
    if not section.widget_refs[id] then
        local path = ancestors()
        section.widget_refs[id] = menu.toggle(current_parent(), label_for_menu(label), {}, "", function(on)
            replay(section, {id = id, value = on, ancestors = path})
        end, value and true or false)
    end
    section.last_ref = section.widget_refs[id]
    section.last_info_row = nil
    if current_event and current_event.id == id then return current_event.value, true end
    return value, false
end
local function numeric_input(label, value, as_float)
    local id = next_id(label)
    local section = current_section
    if not section.widget_refs[id] then
        local path = ancestors()
        section.widget_refs[id] = text_input(current_parent(), label_for_menu(label), "Enter a number", function(text)
            local number = tonumber(text)
            if number then
                if not as_float then number = math.tointeger(number) or math.floor(number) end
                replay(section, {id = id, value = number, ancestors = path})
            end
        end, tostring(value or 0))
    end
    section.last_ref = section.widget_refs[id]
    section.last_info_row = nil
    if current_event and current_event.id == id then return current_event.value, true end
    return value, false
end
function ImGui.InputInt(label, value) return numeric_input(label, value, false) end
function ImGui.InputFloat(label, value) return numeric_input(label, value, true) end
function ImGui.DragInt(label, value) return numeric_input(label, value, false) end
function ImGui.SliderInt(label, value, min_value, max_value)
    local id = next_id(label)
    local section = current_section
    if not section.widget_refs[id] then
        local path = ancestors()
        section.widget_refs[id] = menu.slider(current_parent(), label_for_menu(label), {}, "", min_value, max_value, value, 1, function(selected)
            replay(section, {id = id, value = selected, ancestors = path})
        end)
    end
    section.last_ref = section.widget_refs[id]
    section.last_info_row = nil
    if current_event and current_event.id == id then return current_event.value, true end
    return value, false
end
function ImGui.InputText(label, value)
    local id = next_id(label)
    local section = current_section
    if not section.widget_refs[id] then
        local path = ancestors()
        section.widget_refs[id] = text_input(current_parent(), label_for_menu(label), "", function(text)
            replay(section, {id = id, value = text, ancestors = path})
        end, value or "")
    end
    section.last_ref = section.widget_refs[id]
    section.last_info_row = nil
    if current_event and current_event.id == id then return current_event.value, true end
    return value, false
end
function ImGui.Combo(label, selected, choices, count)
    local id = next_id(label)
    local section = current_section
    local menu_label = label_for_menu(label)
    if not section.containers_by_id[id] then
        local list = menu.list(current_parent(), menu_label, {}, "")
        section.containers_by_id[id] = list
        section.containers[#section.containers + 1] = list
        local path = ancestors(list)
        for i = 1, count or #choices do
            local choice = choices[i] or tostring(i)
            local choice_index = i - 1
            menu.action(list, choice, {}, "", function()
                replay(section, {id = id, value = choice_index, ancestors = path})
            end)
        end
    end
    section.last_ref = section.containers_by_id[id]
    section.last_info_row = nil
    local current_choice = choices[(selected or 0) + 1]
    if current_choice then
        local display = menu_label .. ": " .. tostring(current_choice)
        if menu.get_menu_name(section.last_ref) ~= display then menu.set_menu_name(section.last_ref, display) end
    end
    if current_event and current_event.id == id then return current_event.value, true end
    return selected, false
end
local function record_text(value, color)
    if value == nil or value == "" then return end
    local label = tostring(value)
    if current_section.tooltip then
        if current_section.last_info_row then
            local row = current_section.last_info_row
            if row.text == "[?]" then row.text = label
            else row.tooltip = label end
        elseif current_section.last_ref then
            menu.set_help_text(current_section.last_ref, label)
        end
        return
    end
    local compact = label:gsub("%s+", " "):match("^%s*(.-)%s*$")
    local _, id = info_page(current_parent())
    local rows = current_section.info_rows[id]
    if not rows then rows = {}; current_section.info_rows[id] = rows end
    local row = {text = label, color = color}
    rows[#rows + 1] = row
    current_section.last_info_row = row
    current_section.last_ref = nil
    if compact ~= "[?]" and #compact <= 60 then
        current_section.last_text = compact:gsub(":$", "")
    end
end
ImGui.Text = record_text
ImGui.TextUnformatted = ImGui.Text
ImGui.TextWrapped = ImGui.Text
function ImGui.TextColored(r, g, b, a, value)
    record_text(value, {r, g, b, a})
end
function ImGui.Separator()
    local id = source_key(separator_occurrences, "separator:" .. tostring(widget_index))
    if not current_section.separator_refs[id] then
        current_section.separator_refs[id] = menu.divider(current_parent(), "")
    end
end
function ImGui.Spacing() end
function ImGui.SameLine() end
function ImGui.Dummy() end
function ImGui.ProgressBar(fraction, _, _, overlay)
    ImGui.Text(overlay or string.format("%d%%", math.floor(math.max(0, math.min(1, fraction or 0)) * 100)))
end
function ImGui.SetTooltip(message)
    if current_section.last_info_row then
        local row = current_section.last_info_row
        if row.text == "[?]" then row.text = tostring(message)
        else row.tooltip = tostring(message) end
    elseif current_section.last_ref then
        menu.set_help_text(current_section.last_ref, tostring(message))
    end
end
function ImGui.BeginTooltip() current_section.tooltip = true; return true end
function ImGui.EndTooltip() current_section.tooltip = false end
function ImGui.IsItemHovered() return true end
function ImGui.IsItemActive() return false end
function ImGui.GetFontSize() return 14 end
function ImGui.PushStyleColor() end
function ImGui.PopStyleColor() end
function ImGui.PushTextWrapPos() end
function ImGui.PopTextWrapPos() end
function ImGui.PushItemWidth() end
function ImGui.SetNextItemWidth() end
function ImGui.SetNextWindowSize() end
function ImGui.OpenPopup() end
function ImGui.CloseCurrentPopup()
    -- The Gun Van editor is a Nenyoo submenu. Keep its source branch active
    -- after closing so re-entering the submenu does not leave inert controls.
    weapon_editor_popup = true
    menu.go_back()
end
function ImGui.BeginTabBar() return true end
function ImGui.BeginTabItem(label)
    local id = next_id(label)
    local ref = current_section.containers_by_id[id]
    if not ref then
        ref = menu.list(current_parent(), label, {}, "")
        info_page(ref, label)
        current_section.containers[#current_section.containers + 1] = ref
        current_section.containers_by_id[id] = ref
    end
    if not ref then return false end
    if current_event and not current_event.ancestors[ref.id] then return false end
    current_section.last_info_row = nil
    push_parent(ref)
    return true
end
function ImGui.EndTabItem() pop_parent() end
function ImGui.BeginListBox(label)
    return ImGui.BeginTabItem(label)
end
function ImGui.EndListBox() pop_parent() end
function ImGui.TreeNode(label)
    return ImGui.BeginTabItem(label)
end
function ImGui.TreePop() pop_parent() end
function ImGui.BeginPopupModal(label)
    return ImGui.BeginTabItem(label)
end
function ImGui.EndPopup() pop_parent() end
function ImGui.EndTabBar() end

ImGuiCol = {Text = 0}
ImGuiTabBarFlags = {None = 0}
ImGuiWindowFlags = {Modal = 0, NoCollapse = 0, NoMove = 0, NoResize = 0}

local compat = {imgui_sections = imgui_sections, info_pages = info_pages}
function compat.info_for_page(id)
    local page = info_pages[id]
    if not page then return nil end
    local rows, last_label = {}, nil
    local function append(row)
        local label = row.text:gsub("%s+", " "):match("^%s*(.-)%s*$")
        if label == "" then
            if #rows > 0 and rows[#rows].text ~= "" then rows[#rows + 1] = {text = ""} end
            last_label = nil
        elseif label ~= last_label then
            rows[#rows + 1] = row
            last_label = label
        end
    end
    for _, row in ipairs(page.static) do append(row) end
    for _, section in ipairs(imgui_sections) do
        local live = section.info_rows and section.info_rows[id]
        if live then for _, row in ipairs(live) do append(row) end end
    end
    return {title = page.title, rows = rows}
end
function compat.materialize_imgui()
    for _, section in ipairs(imgui_sections) do
        section.widget_refs, section.separator_refs = {}, {}
        section.info_rows = {}
        section.containers, section.containers_by_id = {}, {}
        section.tooltip, section.last_ref, section.last_text = false, nil, nil
        current_section, current_event = section, nil
        building, widget_index, widget_occurrences, separator_occurrences, parent_stack = true, 0, {}, {}, {section.parent}
        scan_context = section.path:find("Story Mode", 1, true) and "story" or "online"
        section.callback()
        scan_context = nil
    end
    current_section, current_event, parent_stack = nil, nil, nil
    if __smenu and __smenu.node_in_viewport then
        util.create_thread(function()
            while true do
                for _, section in ipairs(imgui_sections) do
                    local parent = section.parent
                    local visible = __smenu.node_in_viewport(type(parent) == "table" and parent.id or parent)
                    if not visible then
                        for _, ref in ipairs(section.containers) do
                            if __smenu.node_in_viewport(type(ref) == "table" and ref.id or ref) then
                                visible = true
                                break
                            end
                        end
                    end
                    if visible then replay(section, nil) end
                end
                util.yield()
            end
        end)
    end
end

return compat
