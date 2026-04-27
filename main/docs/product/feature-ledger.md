# Feature Ledger

This ledger is the product memory for Escape From Beyoslavia. Update it whenever a feature-facing change lands so future Codex runs do not have to infer the game from code alone.

## Current Features

| Feature | Status | Source | Notes |
| --- | --- | --- | --- |
| Main menu | In progress | `UI/MainMenu/`, `UI/PlayMenu/`, `UI/SettingsMenu/`, `UI/ScreenResolution/`, `Managers/ResolutionManager.gd` | Uses a shared full-screen background across UI scenes, routes Play and Settings to dedicated menus, confirms Exit directly from the main menu, presents Settings as a single vertical stack with audio controls, keeps save-slot actions centered while showing delete buttons only for occupied saves, and caps UI upscaling above 1080p so menus stay sharp and centered on larger displays. |
| New game transition | In progress | `Scenes/GameManager.tscn`, `Scenes/game_manager.gd`, `ui/NewGame/NewGame.tscn` | Game manager removes the main menu and instantiates the new game scene as a generic `Node`, so UI-rooted setup scenes and future `Node2D` gameplay scenes both work. |
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
