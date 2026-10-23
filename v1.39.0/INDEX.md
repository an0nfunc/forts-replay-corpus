# v1.39.0

Header version 1390. Single-player games by @an0nfunc on Abyss, recorded in v1.39.0 r22735. Each repeats the scenario of the v1.38.2 replay of the same name. Record types are those of version 1390. With the options of these games, the weapon list holds a water cannon at index 4, so the build slots that placed a mortar and a cannon in v1.38.2 place a water cannon and a fireball cannon here. Sandbox games unless the row says skirmish, mostly with unlimited resources and fast building turned on.

| File | Kind | What happens |
|---|---|---|
| `devices.fwr` | basic | Each device slot placed once, except the metal mine. |
| `fire-mg-mortar.fwr` | basic | A machine gun and a water cannon placed, then the water cannon fired once and the machine gun three times. The water cannon's shot also writes a 0xcc record. |
| `probe-delete.fwr` | basic | A strut out and one back, a battery placed, then the second strut deleted and the battery scrapped (0xcf, 0xd1, 0xd6, 0xd2, 0xda). |
| `probe-node.fwr` | basic | Twice: a strut out and one back, then the new node deleted (0xd0). |
| `skirmish-idle.fwr` | basic | Skirmish against the Easy AI with the Fulminator commander. The player does nothing. |
| `skirmish-quit.fwr` | basic | Skirmish against the Normal AI with the Fulminator commander, ended by quitting from the pause menu. No result is recorded. |
| `struts-materials-1-4.fwr` | basic | For material slots 1 to 4: one strut out to a new node, one strut between two existing nodes. |
| `swap-material.fwr` | basic | A strut's material swapped from wood to armour to bracing and back to wood. |
| `tech.fwr` | basic | Two technology buildings placed, then a click with the locked technology slot 4 selected, which writes an `OnBuildError` script call. |
| `upgrade-weapons.fwr` | basic | A machine gun upgraded to a minigun. A water cannon placed in the mortar's build slot; its upgrade click records nothing. |
| `weapons-1-3.fwr` | basic | Weapon slots 1 to 3 placed once each. |
| `damage-weapons.fwr` | edge case | Skirmish against the Easy AI with the Eagle Eye commander, unlimited resources, fast building and all weapons unlocked: a sniper, a fireball cannon, a water cannon and a machine gun placed; the machine gun, the water cannon and the sniper fired in turn at the AI fort, five times each, then the fireball cannon until the AI's reactor is destroyed. A second fireball cannon order comes after the end. Pins the damage counters. |
| `economy-storage.fwr` | edge case | Sandbox without unlimited resources: idle at full storage, an armour-piercing sniper placed, then a battery, a metal store and a wind turbine, each left to fill, then the sniper scrapped while full. Pins current, maximum and floated metal and energy against the HUD. |
