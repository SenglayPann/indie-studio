# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses semantic versioning.

## [0.2.0] - unreleased

The professional layer: the same studio for a solo developer's first game and their tenth.

### Added
- **Experience setting** (`experience: new | experienced` in `STUDIO_STATE.md`): plain words, explained terms,
  and beginner traps for `new`; industry language, one-line recaps, and estimates from the developer's own
  track record for `experienced`. Approvals and safety rules are the same for both.
- **Technical design** (`docs/TECH.md`): architecture map, conventions, versioned saves with migrations, one
  wrapper per service, text rules, build and release settings, automated checks, engine plugins, technical
  debt. Written at the GDD stage and followed from the Vertical Slice.
- **Automated checks:** save, purchase, economy, and level-data tests, and CI on every merge into `develop`
  from First Playable (`toolchain` walks through the setup; secrets stay in the CI service).
- **Level design document** (`docs/LEVELS.md`) for games built from levels: building blocks, template rules, a
  checklist every level passes (including a proven clear), a difficulty plan with researched bands, the level
  list, production numbers, and per-level tuning after launch.
- **Translation** (`asset-pipeline`, `references/localization.md`): string tables and room for longer text from
  the Vertical Slice, languages chosen at Kickoff from market data, AI drafts with native review, and checks on
  the smallest phone.
- **Getting players** (`monetization`, `references/growth.md`): the route (organic, paid installs, or a
  publisher) with publisher terms to read, an optional marketability test after the prototype, featuring and
  pre-launch sign-ups, and paid installs only while they pay back. New metrics: CTR, store conversion, ROAS,
  payback, attribution.
- **Life after launch:** a compliance calendar that keeps running (stores raise their requirements every
  year), and an optional live calendar of events and offers built on one reusable template.
- **Style bible for art, sound, and story:** setting, character sheets attached to every generation of a
  character, the writing voice, and accessibility basics (never rely on colour alone).
- **Freelancers** as a maker in the asset pipeline: brief, contract checklist (rights assignment, AI use,
  third-party material, source files), payment by milestone, ledger records.
- **Milestone dates:** Planned, Forecast, and Passed columns in the Gates table; the brief prints the next
  gate's dates and warns "SLIPPING" when the forecast passes the plan.
- A name check for the game against the stores and trademark databases, at Kickoff and before the store page.

### Changed
- Review before a merge, the session recap, estimates, and the role files' beginner traps follow the experience
  setting instead of assuming a beginner. `engine-selector` weighs the engine the developer already knows.
- Installed engine plugins do the engine-specific how; the task brief still decides what is built and when it
  is done.
- The gates check the new documents and checks at the stage each one belongs to.

## [0.1.0] - test build, installed from `develop`, never released

### Added
- Plugin manifest and marketplace catalog (installable through `/plugin marketplace add`).
- SessionStart hook that briefs Claude on the project state at startup, resume, clear, and compact, and flags
  state that is behind git. Silent in projects without `STUDIO_STATE.md`.
- The brief names the skill that runs the current phase (`Playbook:`) and sends "what next", finished stages,
  and role standards to `director`, `gate-review`, and `roles` by name. Skill names always reach Claude, so the
  core workflow holds even when a crowded skill list has dropped descriptions.
- The brief and `director doctor` notice studio skills listed without a description (too many plugins) and
  offer the settings fix. `gate-review` names all seven gates, including Global Launch.
- Nineteen skills: `director`, `session`, `git-workflow`, `research`, `scope-guard`, `gate-review`, `roles`
  (ten role files), `conception`, `preproduction`, `production`, `launch-live`, `playtest-loop`,
  `engine-selector`, `ai-delegation`, `mobile-perf-budget`, `asset-pipeline`, `monetization`, `toolchain`,
  `plugin-feedback`.
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
