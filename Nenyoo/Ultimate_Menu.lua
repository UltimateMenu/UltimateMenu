-- @nenyoo-menu
-- Ultimate Menu for Nenyoo (GTA V Legacy and Enhanced).
-- Install this package under %LOCALAPPDATA%\Nenyoo\Plus\Scripts\User\UltimateMenu.

local source = debug.getinfo(1, "S").source
assert(source:sub(1, 1) == "@", "Ultimate Menu must be loaded from a file")
local directory = source:sub(2):match("^(.*[\\/])")
assert(directory, "Could not locate the Ultimate Menu package")

-- The YimResupplier config belongs to this package, not the GTA working directory.
local script_io = setmetatable({
    open = function(name, mode)
        if name == "YimResupplier.json" then name = directory .. name end
        return io.open(name, mode)
    end,
}, {__index = io})

-- Keep compatibility overrides inside this package; other Nenyoo scripts use
-- the original native, memory, network, and script tables.
local environment = setmetatable({
    io = script_io,
    memory = setmetatable({}, {__index = memory}),
    network = setmetatable({}, {__index = network or {}}),
    script = setmetatable({}, {__index = script or {}}),
    NETSHOPPING = setmetatable({}, {__index = NETSHOPPING}),
    PAD = setmetatable({}, {__index = PAD}),
    HUD = setmetatable({}, {__index = HUD}),
    ENTITY = setmetatable({}, {__index = ENTITY}),
    CUTSCENE = setmetatable({}, {__index = CUTSCENE}),
}, {__index = _ENV})
local function run(path)
    local chunk, message = loadfile(path, "t", environment)
    assert(chunk, message)
    return chunk()
end

local offsets = run(directory .. "lib\\game_offsets.offsets")
for _, group in ipairs({offsets.globals, offsets.locals, offsets.scripts}) do
    for name, value in pairs(group) do environment[name] = value end
end
environment.ULTIMATE_MENU_OFFSETS = offsets
environment.ULTIMATE_MENU_EDITION = offsets.edition
environment.ULTIMATE_MENU_BUILD = offsets.build

local compatibility = run(directory .. "lib\\yim_compat.lua")
run(directory .. "lib\\Ultimate_Menu_Legacy.lua")
run(directory .. "lib\\info_panel.lua")(compatibility)
compatibility.materialize_imgui()
return compatibility
