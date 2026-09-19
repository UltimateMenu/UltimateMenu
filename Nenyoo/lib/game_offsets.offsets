-- Select the build-specific GTA address catalog at runtime.
local source = debug.getinfo(1, "S").source
assert(source:sub(1, 1) == "@", "Offset catalog must be loaded from a file")
local directory = assert(source:sub(2):match("^(.*[\\/])"), "Could not locate offset catalogs")

local edition = "Legacy"
if ctx and type(ctx.edition) == "function" then
    local reported = tostring(ctx.edition())
    if reported:lower() == "enhanced" then edition = "Enhanced" end
end

local filename = edition == "Enhanced" and "game_offsets_enhanced.offsets" or "game_offsets_legacy.offsets"
return assert(loadfile(directory .. filename, "t", _ENV))()
