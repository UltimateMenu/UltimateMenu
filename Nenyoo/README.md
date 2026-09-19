# Ultimate Menu for Nenyoo (GTA V Legacy and Enhanced)

This edition runs the YimMenu Legacy script through a Nenyoo API adapter on GTA V Legacy and Enhanced. The menu hierarchy and action callbacks come from the YimMenu source. YimMenu tabs, controls, and popups appear as nested Nenyoo menu lists. Informational text and live status appear in a companion panel only while their submenu is open; hover the panel and use the mouse wheel for longer instructions. Controls that depend on game state are added when their conditions become true.

Copy the contents of this folder to `%LOCALAPPDATA%\Nenyoo\Plus\Scripts\User\UltimateMenu\`, then select `Ultimate_Menu.lua` from Nenyoo's Scripts menu to load its page. Keep the `lib` folder beside the entry script. The script selects the matching address catalog using Nenyoo's game-edition API. The included catalogs target GTA V Legacy build 3889 and Enhanced build 1158.13. Use the online menus only after joining GTA Online.

When a GTA update changes script addresses, update the named entries in `lib/game_offsets_legacy.offsets` or `lib/game_offsets_enhanced.offsets`. The `.offsets` files contain Lua-readable data but do not appear as runnable Lua scripts. Each catalog separates `globals`, `locals`, and script names and keeps dynamic address formulas beside their bases. `lib/game_offsets.offsets` only detects the edition and loads the appropriate catalog.

The adapter requires a Nenyoo build exposing `ctx.edition`, `__ny_execute_as_script`, and `__ny_request_script_host`. The host request uses Nenyoo's cooperative script-host election and cannot evict a healthy current host. Actions that rely on becoming mission-script host therefore need in-game validation on each edition.

The mock-runtime check in `lib/tests/load_yim_test.lua` covers both edition catalogs, menu construction, all exposed action and input callbacks, stat and native return bridges, and controls that appear after a game-state change. Run it once normally and once with `UM_EDITION=Enhanced` using Lua 5.4 from the repository root. It does not validate GTA Online results or the visual menu in a running game.

Follow [TESTING.md](TESTING.md) for the in-game checks and a failure-report template.
