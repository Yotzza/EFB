# Codex Map

This repo is a Godot 4 project for **Escape From Beyoslavia**, a top-down 2D survival game.

Use this file as the map, not the manual. Keep deeper product, design, and architecture knowledge in `docs/` so future Codex runs can discover it without carrying one giant instruction file.

## Start Here

- Product direction: `docs/product/game-vision.md`
- Documentation index: `docs/README.md`
- Feature history and documentation ledger: `docs/product/feature-ledger.md`
- Visual rules: `docs/design/art-direction.md`
- Godot architecture: `docs/ARCHITECTURE.md`
- Agent workflow and harness rules: `docs/agent-harness.md`
- Quality/debt tracking: `docs/QUALITY_SCORE.md` and `docs/tech-debt-tracker.md`
- Larger implementation plans: `docs/exec-plans/active/`

## Working Rules

- Preserve the game idea: top-down pixel art, 2D survival, muted realistic post-apocalyptic Eastern Europe, gritty atmosphere, low saturation, 16-bit style, clean pixel edges, minimal anti-aliasing, tile-based environments, soft ambient lighting.
- When adding or changing a feature, update `docs/product/feature-ledger.md` in the same change. If the feature changes the core fantasy, world tone, art direction, or player promise, update `docs/product/game-vision.md` too.
- Prefer existing Godot scene/script organization: `Scenes/` for gameplay scenes, `Scripts/` for reusable data/classes, `ui/` for interface scenes/assets, `art/` for source game art, and `data/` for structured content.
- Keep GDScript small and legible. Use typed variables and return types for new code where practical.
- Do not hand-edit Godot-generated `.uid` or `.import` files unless the engine generated the change or the task explicitly requires it.
- For UI/gameplay changes, verify in Godot when available and document any manual checks that could not be run.

## Before Finishing Feature Work

Run:

```powershell
powershell -ExecutionPolicy Bypass -File tools/check_feature_docs.ps1
```

This guard keeps the repo-local product memory updated when code, scene, art, UI, or data files change.
