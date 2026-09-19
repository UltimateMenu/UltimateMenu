# Nenyoo Legacy and Enhanced in-game verification

Run this pass separately on GTA V **Legacy build 3889** and **Enhanced build 1158.13** with the Nenyoo DLL that exposes `ctx.edition`, `__ny_execute_as_script`, and `__ny_request_script_host`. The package must be at `%LOCALAPPDATA%\Nenyoo\Plus\Scripts\User\UltimateMenu\` with `Ultimate_Menu.lua`, the three `lib\game_offsets*.offsets` files, and `lib\yim_compat.lua` beside `lib\Ultimate_Menu_Legacy.lua`. Open `Ultimate_Menu.lua` from Nenyoo's Scripts menu; it is a menu page that loads when opened. Confirm its heading says `Legacy` or `Enhanced` to match the running game before testing any action.

## First run

1. In Story Mode, open the page. Confirm `Ultimate Menu 1.73 By L7NEG` appears with `Story Mode`, `Self Menu`, `Recovery Menu`, `Online Services Menu`, `Collectibles`, `Events Menu`, `Gun Van Menu`, `YimResupplier`, and `Heists Data Editor Menu`. Open and back out of several nested lists. Pages with explanations should show a companion information panel; the panel should close when leaving the page. Hover and scroll the panel to read long text. Record any missing row, empty page, freeze, or Lua error.
2. In `Story Mode`, record the current character's cash, use `Current Character Cash` to set a distinct value, and confirm the game shows it. Restore the original value. Online-only pages should show `Unavailable in Single Player.` in the information panel rather than actionable controls.
3. Join a GTA Online session and reopen the menu. Verify changing text, toggle, slider, combo, and button controls update the displayed value or game state. Leave the session and confirm Story Mode controls still work.
4. In `Gun Van Menu > Weapons > Edit Weapons`, search for `Pistol`, select its row, and use `Set Weapon` on a recorded slot. Check that the displayed slot and the in-game Gun Van show Pistol. Restore the original weapon. Test `Remove Weapon` and `Close`, then reopen the editor.
5. For a business you own, open `YimResupplier` and verify its controls appear after ownership is detected. Test a teleport to a known property and confirm the landing position. Repeat after changing sessions.

## Full feature pass

The mock check inventories over a thousand actions; opening their rows does not prove their effects. For a full claim, test **each** action, toggle, input, slider, and choice under the game conditions it requires. Cover `Self Menu`, `Story Mode`, `Recovery Menu` (rank, skills, awards, account unlocks, LSCM), `Online Services Menu`, `Collectibles`, `Events Menu`, `Ultimate Money Methods Menu` (businesses and warehouse), `Gun Van Menu`, `YimResupplier`, `Reports Menu`, `Heists Data Editor Menu` (Apartment, Agency, Autoshop, Salvage Yard, Cluckin Bell, Doomsday, Casino, Cayo, Kortz), and `Missions Selector And cooldown Menu`. `Credits` needs only a display check.

Record the exact menu path and control label, session type and relevant property/mission ownership, value before, chosen action, value after, whether it persisted after a session change, and pass/fail. Mark unavailable conditions as **untested**, not passed. Save a screenshot or short recording for visual failures, and the relevant lines from `%LOCALAPPDATA%\Nenyoo\Plus\nenyoo.log` for errors. Some heist and mission actions request script host; test them while the named mission script is active and record whether host was actually acquired. A healthy current host cannot be displaced by Nenyoo's cooperative request, so those effects are not guaranteed in every session.

Report the first failure with this format:

```
GTA build / Nenyoo DLL build:
Session and mission/property state:
Menu path > exact control:
Value before / value entered / value after:
What happened instead:
Error text or log lines (if any):
```

Do not mark either edition fully verified until every applicable control has an observed result on that edition. The automated Lua mock and DLL build cover loading and API calls, not GTA Online outcomes.
