# Feature Ledger

This ledger is the product memory for Escape From Beyoslavia. Update it whenever a feature-facing change lands so future Codex runs do not have to infer the game from code alone.

## Current Features

| Feature | Status | Source | Notes |
| --- | --- | --- | --- |
| Main menu | In progress | `ui/MainMenu/`, `Scenes/game_manager.gd` | Emits new game, load game, settings, and exit intents. Load/settings are stubs in the game manager. |
| New game transition | In progress | `Scenes/GameManager.tscn`, `Scenes/game_manager.gd`, `ui/NewGame/new_game.tscn` | Game manager removes the main menu and instantiates the new game scene. |
| Player movement | In progress | `Scenes/player/player.gd`, `project.godot` | WASD input drives `CharacterBody2D` movement. |
| Mouse-facing player sprites | In progress | `Scenes/player/player.gd`, `art/playerBody/`, `art/playerHead/` | Body/head textures switch between four directions based on mouse position. |
| Player progression data | Early model | `Scripts/PlayerData.gd`, `Scripts/SkillsClass.gd` | Tracks money, reputation, skill points, level, and starter skill values. |

## Update Template

Copy this row when a feature changes:

| Feature name | Planned/In progress/Done | `path/to/source` | One sentence on player impact and any vision constraints. |

## Open Product Questions

- What is the first playable survival location?
- Which survival pressures arrive first: hunger, injury, thirst, radiation, temperature, enemies, or time?
- Is the base a shop, shelter, hideout, or mixed safe hub?
- How should reputation affect events and NPC access?
