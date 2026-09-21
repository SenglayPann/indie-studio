# Build status

Working notes for whoever (human or AI) continues building this plugin. Delete this file at v0.1.0.
Branch in use: `develop`. `main` is only updated at release (merge with `--no-ff`, then tag).

## Done and committed
- Plugin manifest and marketplace catalog (`.claude-plugin/`), MIT license, LF line endings.
- SessionStart hook (`hooks/`), tested: silent without a state file, prints a brief with one, flags stale state.
- Templates: `STUDIO_STATE.md`, `studio/*` logs, `CLAUDE_MD_BLOCK.md`, git hooks, ignore and attribute files.
- Git hooks (`templates/git/githooks/`), tested in a scratch repo (9 cases pass).
- Skills written: `director`, `session`, `git-workflow`, `research`, `scope-guard`, `gate-review`, `roles` (with all ten role files).

## Still to build
Skills the finished ones already refer to by name (until they exist, those references are dangling):
1. `conception` - phase 1: intake, ideas, market check, feasibility, tiers, pre-mortem, pitch, gate 0.
2. `preproduction` - prototype (spike branch), playtest loop, GDD-lite, Vertical Slice and its timing math.
3. `production` - First Playable to Beta cycles, task briefs, freeze, protected polish buffer.
4. `launch-live` - store prep, release, live ops, hotfixes, post-mortem and `lessons.md`.
5. `playtest-loop` - protocol, observation sheet, iterate-or-kill.
6. `engine-selector` - decision matrix and record (verify engine facts with `research`).
7. `ai-delegation` - task briefs, delegation matrix, retry cap of 3, checkpoint rule, project `CLAUDE.md` rules.
8. `mobile-perf-budget` - budgets, measuring on a low-end device, smoke test, `PERF_LOG.md`.
9. `asset-pipeline` - style bible, naming, folders, import settings, AI asset ledger and provenance.

Templates still to add under `templates/docs/`: `PITCH.md`, `GDD_LITE.md`, `STYLE_BIBLE.md`,
`TASK_BRIEF.md`, `PLAYTEST_SHEET.md`, `POSTMORTEM.md`.

Repository files still to add: `README.md` (install, quick start, how it works), `CONTRIBUTING.md`, `CHANGELOG.md`.

## Then
- Run `claude plugin validate .` and fix warnings.
- Smoke-test in a scratch game folder: `claude --plugin-dir <this repo>`, run `/indie-studio:director init`.
- Check every relative link and every skill name mentioned in a SKILL.md resolves.
- Merge `develop` into `main` with `--no-ff` and tag `v0.1.0`.

## Open decisions for the owner
- License: MIT with "Senglay Pann" as the holder was assumed. Confirm or change before publishing.
- Fill `homepage` and `repository` in `.claude-plugin/plugin.json` once the GitHub repo exists, and use
  `<owner>/<repo>` in the README install commands.
- `docs/research/` holds AI-generated summaries of third-party web sources. Decide whether to publish it.
