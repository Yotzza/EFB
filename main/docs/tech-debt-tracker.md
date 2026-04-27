# Technical Debt Tracker

Track debt here when fixing it immediately would distract from the current task.

| Debt | Impact | Suggested Fix | Status |
| --- | --- | --- | --- |
| No automated Godot validation documented | Agents cannot reliably prove scene/script changes work. | Add a Godot CLI smoke-test command and document it in `AGENTS.md`. | Open |
| Load game and settings menu actions are stubs | Main menu exposes options that do not yet work. | Either implement flows or disable/label them until ready. | Open |
| Survival loop is not specified | Feature additions may drift away from the core game promise. | Create an execution plan for the first playable survival loop. | Open |
| Player data has no persistence boundary | Save/load may grow around ad hoc state. | Design save data schema before implementing load game. | Open |
