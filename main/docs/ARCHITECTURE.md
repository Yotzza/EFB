# Architecture

Escape From Beyoslavia is currently organized as a small Godot 4 project with a simple scene-first structure.

## Project Shape

- `Scenes/`: gameplay and world scenes.
- `Scenes/player/`: player scene and movement/appearance script.
- `Scripts/`: reusable GDScript classes and player data.
- `ui/`: menu and interface scenes, scripts, and button art.
- `art/`: pixel-art character and game assets.
- `data/`: structured game content, currently reserved for future data files.

## Current Runtime Flow

`Scenes/GameManager.tscn` is the main scene. `Scenes/game_manager.gd` loads the main menu on startup, listens for menu signals, and instantiates the new game scene when the player starts.

`ui/MainMenu/MainMenu.tscn` owns the main menu controls and `ui/MainMenu/main_menu.gd` emits intent signals instead of directly changing game state.

`Scenes/player/player.tscn` and `Scenes/player/player.gd` own player movement and sprite direction. Movement uses the configured Godot input actions from `project.godot`.

## Dependency Direction

Keep dependencies predictable:

1. UI emits intent signals.
2. Manager/root scenes coordinate transitions.
3. Gameplay scenes own local gameplay behavior.
4. Reusable data/classes live under `Scripts/`.
5. Art and UI assets are referenced by scenes/scripts but should not contain logic.

Avoid having reusable data classes reach into scene nodes. Avoid having UI nodes directly mutate player/world state when a manager signal can keep the flow explicit.

## Godot Conventions

- Prefer exported scene references for scene wiring that designers may adjust.
- Prefer signals for UI-to-gameplay intent.
- Use `class_name` for reusable data/classes that are intended to be instantiated across the project.
- Keep paths stable when referenced from scenes or preloads.
- Preserve Godot-generated metadata unless the editor produces the change.
