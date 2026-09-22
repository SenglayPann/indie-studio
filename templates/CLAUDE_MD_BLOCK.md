## Indie Studio workflow

This project uses the `indie-studio` plugin.

- `STUDIO_STATE.md` is the project's memory: phase, stage, and next actions. Read it first in every session and keep it up to date.
- Supporting logs live in `studio/` (JOURNAL, DECISIONS, KNOWLEDGE, PARKING_LOT, RISKS, ASSET_LEDGER,
  PLUGIN_FEEDBACK).
- Do not start anything listed under "Off-limits right now" in `STUDIO_STATE.md`.
- New features or plan changes go through `indie-studio:scope-guard`. Git work follows `indie-studio:git-workflow`. Facts that can go out of date (versions, store rules, prices, licenses, tool features) are verified with `indie-studio:research`.
- Only the human approves gates, merges into `main`, spending money, and publishing.
