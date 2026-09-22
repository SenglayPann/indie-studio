# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses semantic versioning.

## [0.1.0] - unreleased

### Added
- Plugin manifest and marketplace catalog (installable through `/plugin marketplace add`).
- SessionStart hook that briefs Claude on the project state at startup, resume, clear, and compact, and flags
  state that is behind git. Silent in projects without `STUDIO_STATE.md`.
- Seventeen skills: `director`, `session`, `git-workflow`, `research`, `scope-guard`, `gate-review`, `roles`
  (ten role files), `conception`, `preproduction`, `production`, `launch-live`, `playtest-loop`,
  `engine-selector`, `ai-delegation`, `mobile-perf-budget`, `asset-pipeline`, `plugin-feedback`.
- `plugin-feedback` records where the plugin itself was wrong, in the way, or missing, in
  `studio/PLUGIN_FEEDBACK.md`, and turns those notes into a scrubbed report only when the human approves the
  exact text. No telemetry, no automatic sending. A GitHub issue form matches the same fields.
- Templates: project state file, `studio/` logs, pitch, market check, business case, GDD, economy, style
  bible, task brief, playtest sheet, post-mortem, CLAUDE.md block.
- Built for games that are meant to earn: ideas are priced rather than refused (cost table and fit scoring in
  `conception`), a `monetization` skill covers the model, ads, purchases, the economy, analytics events, and
  how to read numbers, and `docs/BUSINESS_CASE.md` holds researched targets with sources.
- A **Soft Launch** stage and a **Global Launch** gate: release in a few countries, read retention before
  revenue, change one thing at a time, then scale up, keep fixing, or stop by rules written in advance.
- T1 now means the first release, with a post-launch roadmap for bigger ambitions. Managed backend services
  are treated as ordinary work; only custom servers and real-time multiplayer carry the old warning.
- No page limits on design documents: write what is decided or proven, and split by topic.
- Git hooks (`commit-msg`, `pre-commit`) plus `.gitignore` and `.gitattributes` templates for Unity and Godot.
  `pre-commit` blocks direct commits to `main`, `feature/*` commits during the Alpha-to-Launch feature freeze,
  oversized files, engine caches, and likely keys (any letter case, common key formats, file names only).
- Notebook safety: the session brief warns when another branch or an `archive/*` tag holds a newer
  `STUDIO_STATE.md` or `studio/`, and `git-workflow` section 8 explains how to carry it over.
- Conception and `engine-selector` ask which computer the game is built on, because iOS builds are signed and
  uploaded from macOS.
- Three strikes now offers a beginner real options: fresh session, look it up, make it smaller, ask people,
  or do the step by hand.
- Works with AI asset generators: the new `toolchain` skill connects them (and engine bridges, Blender, build
  services) through MCP, walks the human through creating and storing the API key themselves, never lets the
  key reach the chat or git, proves the tool with one cheap job, and treats credits as spending.
- `asset-pipeline` now decides **who makes each asset class** (Claude directly, Claude driving a generator, a
  bought pack, or the human) by approving three real samples instead of trusting a claim, and defends against
  style drift with prompt recipes, fixed reference images, and a golden set that is regenerated whenever a
  tool changes its model. New `references/3d-pipeline.md` covers 3D for phones: budgets, conventions, cleanup
  of generated models, rigging, and letting the engine own the final look.
- The style bible gained makers, prompt recipes, a golden set, and a 3D spec; the asset ledger records the
  recipe and seed behind every generated asset.
- `scripts/check-plugin.sh` integrity check.
