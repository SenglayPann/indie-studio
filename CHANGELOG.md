# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses semantic versioning.

## [0.4.0] - 2026-10-16

Built from the second critique of the first real project run with the plugin (the same solo developer's game,
from the Prototype through the Vertical Slice and First Playable gates into Pre-Alpha), and written for any
genre. The theme: the plugin assumed resources a solo developer does not have. Every change below has a scenario
in `docs/TESTING.md` (51-88).

### Added
- **Decisions a new developer can make:** one decision per message, told from what the human saw in play, each
  option in plain words with an example, at most two numbers, how sure the AI is, and a plain restatement of a
  quick approval before it is recorded as the human's.
- **Delegate mode** (`session`): "decide for me and leave me notes" is recorded, repeated by the brief while it
  lasts, and limited to small reversible calls (provisional decisions). Prices, spending, accounts, publishing,
  merges, packages, gates, and plan changes stay proposals. A plain review file (`templates/docs/REVIEW.md`)
  waits for the human, with stacked branches and their merge order.
- **Testing without testers in the room** (`playtest-loop`): remote routes, a six-question remote survey that
  the gates accept with its limits, what bots and a cold-read AI can and cannot stand in for, kill rules
  rewritten instead of filled with simulated numbers, and a tester budget that protects a store's closed test.
- **The UI/UX designer hat** (the eleventh): a screen map for every tier and the roadmap before screens
  multiply, a spec per screen, a usability checklist, a "game UI, not app UI" reference study, and the UI
  structure kept apart from the look. Roles names the hat each kind of request needs, put on before building.
- **Matching an approved design** (`asset-pipeline`, `references/design-match.md`): design and build captured
  alike and measured (boxes, text, ink, word widths, clipping), the usual browser-to-engine traps, the design
  as the floor with extras kept apart for approval, and review captures that may freeze motion.
- **Onboarding** for the designer: ask which kind is meant; a guided first game plus hints by default.
- **Claude as a code maker** for art: a shared style module, renders at the import density, a contrast and
  colour-blind check of the palette, and a byte-compared golden set. **The AI cannot listen:** a test proves a
  build can make sound before the human gets it.
- **Balance checks that find a solved game:** the best fixed pick list against a reader of the run, dead
  options measured by never taking them, when "no best list" is reachable, the spread between deals and the
  bound a curve puts on it, growing a pool as a difficulty change, partners measured apart from strength, and a
  check that fails on day one treated as a finding.
- **Stage closes** in `gate-review` for the six stages that end without a gate.
- **Plugin version check:** `plugin_version` in the state file; the brief says when the installed plugin
  differs, and `director doctor` adds what the newer version needs from `references/upgrades.md`, with the
  human's approval.

### Changed
- **Hours are never asked for by default.** The Schedule line "Track my own hours" is `no` unless the human
  turns it on; pace comes from finish dates (a calendar ratio), and AI-hours figures always use the measured AI
  ratio with its basis stated.
- **Test mode for ads and purchases** means who can see a real ad or pay: a live switch in data, off until
  Beta, and each network's and store's own test method looked up first. Analytics event names are checked
  against the provider's naming rules.
- Low-end checks without a low-end phone use named cloud devices; a store's automated report is never planned on.
- A safety setting that refuses an approved git step hands the human the commands, and the notebook never
  claims a refused step. Gate merges take the stage's own branch into `develop` first.
- Git: `docs/<doc>` branches for design documents, the same checks before every merge, `git rm` staged with its
  own commit, and new worktrees checked for LFS pointer files.
- Scope-guard: small additions inside a tier skip the re-plan review. Small polish that reuses a task's new
  code is allowed before Beta with a decision.

### Fixed
- The brief printed lists by line count and cut items mid-sentence; it now prints whole items (long ones marked
  "continued") and counts the rest.
- False "STATE MAY BE STALE" warnings after state updates that did not move `last_synced_commit`, and after
  commits that touch only `docs/`.
- The GDD template pointed older projects at a pitch section they did not have; it now falls back.

## [0.3.0] - 2026-09-27

The design layer, built from the critique of the first real project run with the plugin (a solo developer's
card roguelite for Android, from Conception to the first phone playtest). Every change below has a scenario in
`docs/TESTING.md` (35-50).

### Added
- **Systems design for the designer hat** (`preproduction`, `references/systems-design.md`): the round loop and
  the return loop with the feature that carries each, the genre contract, power against targets, luck against
  skill, choice health, what each currency is for, and how to simulate (fixed seeds, enough games, a careful
  bot checked against a random one, then people).
- **Balance before strangers play:** in the Prototype, games with score targets, random content, or upgrades
  that stack are simulated before the outsider round. New `docs/BALANCE.md` for run-based and systemic games.
  From the Vertical Slice the rules live in one engine-free library shared by the game, the tests, and the
  bots, and balance targets run as automated checks.
- **Creator pass** (`playtest-loop`): the creator's own runs, sorted by the AI into tuning, design, scope, and
  bugs, with the numbers checked and one change to try first, before every outsider round. A creator variant of
  the playtest sheet, and a closed-test row for checking reasons to return.
- **Hook score** beside the fit score for every concept (a named pull, fresh but familiar, a share engine, an
  organic route), with each concept's audience and reason to come back tomorrow.
- **Salvage and pivot** for a build the human already has: the parts worth keeping, both scores, priced pivots
  beside the human's own plan, and a time-boxed test with a kill rule.
- **Throwaway concept sketches** are allowed in Idea and Validation, outside the game's repository.
- **Screen list** at Kickoff in `docs/PITCH.md`, each screen with its tier; the GDD's UI flow connects them.
- **Feasibility template** (`docs/FEASIBILITY.md`): every part estimated in three columns, the waits, and the
  capacity check.
- **Re-plan checklist** in `scope-guard` for a major change, and `Replaces` and `Status` lines for decisions
  (active, amended, superseded).
- **Two soft-launch shapes:** a few countries with paid installs, or a quiet worldwide release for organic-only
  games, with the promotion held back for the global launch.
- **Studio-wide knowledge (opt-in):** facts that hold for any game are copied at wrap-up to
  `~/.indie-studio/KNOWLEDGE.md`, and research in the next game reads them.

### Changed
- **The tiers are the build and cutting order only.** A separate line in `STUDIO_STATE.md` says what the first
  release includes (T1, T1-T2, or T1-T3), chosen by the human; the right size depends on the route to players.
- **One capacity rule** replaces "the first release fits in about two thirds of the hours". It is worded the
  same in all five places that state it, and `scripts/check-plugin.sh` fails if a copy drifts.
- **Estimates for an AI studio:** the AI's build time, the human's hands-on hours, and calendar waits are
  estimated apart. Capacity and the first-game correction use the human's column; the journal, task briefs,
  weekly review, timing exercise, and post-mortem track both kinds of hours.
- **Reasons to return are checked:** each business-case target names the first-release feature that carries
  it, the market check lists the genre contract, Conception Exit checks both, and `scope-guard` flags a cut
  that removes a carrier.
- **One home per plan fact:** scope and dates in `STUDIO_STATE.md`, targets in the business case, the estimate
  in the feasibility file, screens in the pitch. Other documents link instead of copying, and every gate review
  runs a consistency pass.
- The empty engine project is created on `chore/<engine>-project` and merged into `develop` before the spike
  branches from it; spikes start at the Prototype.
- The session wrap removes answered open questions (their answers go to decisions or the journal), so the brief
  stays lean.
- `plugin.json` names the repository and homepage, so `plugin-feedback` can build a pre-filled issue link, and
  the README's install line uses the real address.

## [0.2.0] - installed from `develop`, never released

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
