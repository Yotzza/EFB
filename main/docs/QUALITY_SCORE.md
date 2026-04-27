# Quality Score

This file tracks repo health for future Codex work. Keep scores honest and short.

| Area | Score | Notes |
| --- | --- | --- |
| Product documentation | 3/5 | Core vision and feature ledger now exist; needs updates as features land. |
| Architecture documentation | 3/5 | Current scene flow is mapped; deeper gameplay systems are not designed yet. |
| Runtime verification | 1/5 | No automated Godot checks are present yet. |
| Art direction consistency | 3/5 | Direction is documented; future assets need review against it. |
| Feature completeness | 1/5 | Early menu, player movement, and progression data foundations exist. |

## Next Quality Moves

- Add a documented way to launch and smoke-test the Godot project from the command line.
- Add save/load architecture before implementing persistent progression.
- Add survival system specs before implementing hunger, injury, inventory, or raids.
- Add lightweight validation for broken scene/script references if Godot CLI is available.
