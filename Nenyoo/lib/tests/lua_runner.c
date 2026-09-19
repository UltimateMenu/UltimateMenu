#include <stdio.h>
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: lua_runner <test.lua>\n");
        return 2;
    }
    lua_State *lua = luaL_newstate();
    if (!lua) return 2;
    luaL_openlibs(lua);
    int result = luaL_dofile(lua, argv[1]);
    if (result != LUA_OK) fprintf(stderr, "%s\n", lua_tostring(lua, -1));
    lua_close(lua);
    return result == LUA_OK ? 0 : 1;
}
