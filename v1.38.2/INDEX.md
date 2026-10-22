# v1.38.2

Header version 1383. Single-player games by @an0nfunc. All are on Abyss except `swarm-missiles.fwr` and `swarm-immediate-fire.fwr`, on Bombard. Sandbox games unless the row says skirmish, mostly with unlimited resources and fast building turned on.

| File | Kind | What happens |
|---|---|---|
| `abyss-bot-278f.fwr` | basic | Skirmish against the AI, 11 seconds. The player gives no commands. |
| `abyss-bot-974f.fwr` | basic | Skirmish against the AI, 39 seconds, which the AI wins. The player deletes struts and nodes. |
| `camera.fwr` | basic | Zooming, panning and moving the pointer. No commands. |
| `devices.fwr` | basic | Each device slot placed once, except the metal mine. |
| `fire-mg-mortar.fwr` | basic | A machine gun and a mortar placed, then each fired three times. |
| `probe-delete.fwr` | basic | A strut out and one back, a battery placed, then the second strut deleted and the battery scrapped (0xcb, 0xcd, 0xd2, 0xce, 0xd6). |
| `probe-node.fwr` | basic | Twice: a strut out and one back, then the new node deleted (0xcc). |
| `skirmish-idle.fwr` | basic | Skirmish against the Easy AI with the Fulminator commander. The player does nothing. |
| `skirmish-quit.fwr` | basic | Skirmish against the Normal AI, ended by quitting from the pause menu. No result is recorded. |
| `struts-materials-1-4.fwr` | basic | For material slots 1 to 4: one strut out to a new node, one strut between two existing nodes. |
| `struts-materials-5-7.fwr` | basic | The same for slots 5 to 7. Not every drag built a strut. |
| `swap-material.fwr` | basic | A strut's material swapped from wood to armour to bracing and back to wood. |
| `tech.fwr` | basic | Two technology buildings placed. |
| `upgrade-turbine.fwr` | basic | An upgrade centre built, then a wind turbine upgraded. |
| `upgrade-weapons.fwr` | basic | A machine gun upgraded to a minigun, a mortar to a heavy mortar. |
| `weapons-1-3.fwr` | basic | Weapon slots 1 to 3 placed once each. |
| `ammo-select.fwr` | edge case | A weapon that takes ammo: each ammo type selected, then fired (0xdc). |
| `area-repair.fwr` | edge case | A mortar placed and fired at with a machine gun, then area repair (a click and a drag) over the mortar, and the wrench on an undamaged strut. Only the wrench is recorded (0xd0): area repair over undamaged structure records nothing. |
| `area-repair-damaged.fwr` | edge case | Skirmish against the Normal AI. After AI fire damages the fort, area repair with one click and one drag over the damaged part (0xe0, three records). It ends as the AI destroys the reactor; no result is recorded. |
| `device-repair.fwr` | edge case | Skirmish against the Normal AI. After AI fire damages the reactor and a machine gun, each is repaired from its context menu, the reactor three times (0xd4). Ends by quitting. |
| `hotkeys.fwr` | edge case | Weapon and device hotkeys from the input options, one key every 4 seconds. |
| `laser-sight.fwr` | edge case | Skirmish with the Eagle Eye commander: a minigun's laser sight toggled, its bias moved, then fired. |
| `mg-fire-variants.fwr` | edge case | A machine gun fired in different ways: press and hold, drag, group selection, clicking the selected gun again, and a target outside its arc then inside (0xc7 and 0xca). |
| `pause-skirmish.fwr` | edge case | Skirmish against the Easy AI, paused and resumed with the HUD button and the pause key. Pausing records nothing. |
| `portal-link.fwr` | edge case | Two portal triangles linked, unlinked, linked again, reversed, and passthrough turned on and off (0xd7, 0xd8). |
| `probe-dblclick.fwr` | edge case | Three machine guns and a mortar placed; a machine gun with a blocked line of fire, another machine gun and the mortar each double-clicked to fire at once (0xc5, 0xc6, 0xc7, 0xca). A click while the mortar reloads records nothing. |
| `probe-doors.fwr` | edge case | Door struts built, then a door opened and closed twice (0xd1). |
| `probe-downgrade-overdrive.fwr` | edge case | Skirmish against the Easy AI with the Overdrive commander: a machine gun upgraded, then downgraded (0xd5). |
| `probe-ground.fwr` | edge case | A strut that anchors to the cave wall (0xcb). |
| `probe-mine.fwr` | edge case | One of the fort's mines scrapped, a new one placed on the freed ore spot: a placement without nodes (0xd2). |
| `probe-move-phantom.fwr` | edge case | Skirmish against the Easy AI with the Phantom commander: a battery moved to the floor above (0xd2). Moving it with the M key records nothing. |
| `probe-repair.fwr` | edge case | A machine gun and a mortar placed, the machine gun fired four times, then repair on the undamaged mortar and on an undamaged strut. Only the strut's repair is recorded (0xca, 0xd0). |
| `refused-builds.fwr` | edge case | Four builds the game refuses: a battery in open sky, a battery on an occupied spot, swarm missiles away from ground, a strut that is too long. Refused builds record nothing. |
| `strut-repair.fwr` | edge case | Skirmish against the Normal AI. After AI fire cracks struts, a strut and then a node are repaired with the wrench (0xcf, 0xd0). The AI wins. |
| `swarm-immediate-fire.fwr` | edge case | A swarm missile launcher and a sniper. The launcher's door item in its menu records nothing. The launcher is fired at the sniper's mark by a click, and with the fire key: 0xc5, a 0xdb 40 frames later, and 0xc6 192 frames after the 0xc5. Its doors open and close on their own around each aim (24 0xd1 records in groups of three, sources 3 and 4). Then its menu's door item is used and the launcher scrapped (0xd6); no 0xd1 accompanies the scrap. |
| `swarm-missiles.fwr` | edge case | Swarm missile launchers fired without a spotter, then at a point a sniper marks, then double-clicked while reloading (0x94, 0xdb). Weapon doors open and close on their own (0xd1). |
| `toggles.fwr` | edge case | Shield and door struts opened and closed from their menus (0xd1, source 11). A machine gun's door shut and opened from its menu records nothing. |
