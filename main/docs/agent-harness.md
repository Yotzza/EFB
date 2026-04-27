# Agent Harness

This repository follows the Codex harness approach described in OpenAI's ["Harness engineering: leveraging Codex in an agent-first world"](https://openai.com/index/harness-engineering/) article:

- `AGENTS.md` stays short and points to source-of-truth docs.
- Repository-local markdown captures product intent, design taste, architecture, active plans, quality gaps, and technical debt.
- Rules that matter repeatedly should become checkable scripts or tests.
- Feature work updates the docs that future agents need, instead of relying on chat history.

## How Codex Should Work Here

1. Read `AGENTS.md`.
2. Open only the docs relevant to the task.
3. Inspect the matching Godot scenes/scripts/assets.
4. Make the smallest coherent change.
5. Update `docs/product/feature-ledger.md` for feature-facing changes.
6. Run the relevant checks, including `tools/check_feature_docs.ps1` for feature work.
7. Add any discovered recurring risk to `docs/tech-debt-tracker.md`.

## When To Create An Execution Plan

Use `docs/exec-plans/active/` for work that touches multiple systems, changes save data, introduces a new gameplay loop, or needs several validation passes. Move completed plans to `docs/exec-plans/completed/`.

Use `docs/templates/exec-plan-template.md` as the starting point.

## Turning Taste Into Guardrails

When a review comment or bug repeats, prefer one of these durable fixes:

- Update a focused doc if the issue is judgment or product taste.
- Add a script/check if the issue is mechanical.
- Add a test scene or Godot test if the issue is runtime behavior.
- Add a template if the issue is missing structure.
