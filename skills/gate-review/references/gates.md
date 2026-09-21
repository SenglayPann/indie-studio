# Gate checklists

Every criterion needs evidence. Numbers below are sensible defaults for a solo mobile game; the human
may adjust them by recording a decision. Store, platform, and price details are volatile: verify them
with `indie-studio:research` and cite the source and date.

Project documents live in the game project: `docs/PITCH.md`, `docs/GDD.md`, `docs/STYLE_BIBLE.md`, and the
`studio/` logs. Templates are in `${CLAUDE_PLUGIN_ROOT}/templates/docs/`.

## Gate 0: Conception Exit (tag `m0-kickoff`)
1. One-sentence game description and the core loop (action, goal, feedback) in `docs/PITCH.md`.
2. Player, platform, and target session length defined.
3. Market sanity check: three comparable games named, the gap stated, sources logged in `studio/KNOWLEDGE.md`.
4. Feasibility: hours per week, target date, and AI tool budget recorded; a solo, AI-assisted plan is realistic.
5. Engine chosen; reasons and verified versions in `studio/DECISIONS.md` (`indie-studio:engine-selector`).
6. Scope tiers T1, T2, T3 written in STUDIO_STATE.md. T1 estimated at no more than about two thirds of
   available hours, leaving room for unknowns.
7. Top five risks, a pre-mortem, and kill or pivot criteria in `studio/RISKS.md`.
8. Repository set up with a remote backup and the permission contract agreed (`indie-studio:git-workflow`).
9. STUDIO_STATE.md filled in and current.

## Gate 1: Vertical Slice (tag `m1-vertical-slice`)
1. Core loop validated by outsiders: at least 3 (aim for 5) people played; notes in `studio/playtests/`;
   a clear signal (most understood the goal within a minute and wanted another go); an iterate-or-kill
   decision recorded.
2. `docs/GDD.md` (GDD-lite, 2-4 pages) written from what playtests proved.
3. A playable slice at final target quality: one complete level or segment with production art, UI, audio,
   and feedback ("juice"), running on a real device.
4. The slice was built the way the rest of the game will be: clean code on a `feature/*` branch (not the
   throwaway spike), a style bible in `docs/STYLE_BIBLE.md`, asset ledger rows filled in.
5. **Pipeline timing measured:** hours per unit of content (per level, per item). Extrapolated to the full
   T1 content list and compared with capacity in `studio/DECISIONS.md`. Tiers re-baselined from this.
6. Runs at the target frame rate on the lowest-end target device; build size and start time measured in
   `studio/PERF_LOG.md` (`indie-studio:mobile-perf-budget`).
7. A fresh clone of the repository builds and runs (repo hygiene).
8. Agent setup in place: `CLAUDE.md` project rules, task briefs in use (`indie-studio:ai-delegation`).

## Gate 2: First Playable (tag `m2-first-playable`)
1. A player can go from launch through a full core-loop session and back to the menu, using placeholders.
2. No crash on the critical path, on a real device.
3. T1 system list with the status of each; remaining T1 work estimated.
4. At least 3 outsiders played this build; notes logged.
5. A `studio/PERF_LOG.md` entry exists for this milestone.

## Gate 3: Alpha, feature complete (tag `m3-alpha`)
1. Every T1 feature (and any T2 feature agreed at Kickoff or by trade) is implemented and reachable, checked
   item by item against `docs/GDD.md` and the tiers.
2. All screens and flows exist: menus, settings, pause, results, first-time experience.
3. Save and load work; pausing, backgrounding, and resuming the app work.
4. Monetization is integrated in test mode if in scope, or explicitly deferred with a recorded reason.
5. No open `feature/*` branches; the parking lot has been reviewed and nothing in it is being built.
6. Remaining content listed with per-unit timing; capacity check recorded.
7. A known-bug list exists.
8. **Feature freeze declared:** state, Off-limits, and branch rules updated.

## Gate 4: Beta, content complete (tag `m4-beta`)
1. All levels, content, art, UI, and audio are in the build (final or near final).
2. Zero known crash or progress-blocking bugs; the rest of the bug list is triaged.
3. Performance within budget on the lowest-end target device (`studio/PERF_LOG.md`): frame rate, memory,
   build size, start time.
4. At least 5 outsiders played the Beta build; difficulty and onboarding tuned from their notes.
5. The real-device smoke test passed on at least two devices, one of them low-end
   (see `indie-studio:mobile-perf-budget`).
6. `studio/ASSET_LEDGER.md` is complete; tool license pages were re-checked (`indie-studio:asset-pipeline`).
7. Store paperwork under way: developer accounts exist, privacy policy drafted, store forms started.
8. The polish buffer is intact and scheduled.

## Gate 5: Gold Master (tag `v1.0.0`; release candidates `v1.0.0-rc.N`)
1. Release candidate built from `release/x.y.z`, versioned, signed with the release key, size within
   current store limits (verified).
2. No known crash or progress-blocking bugs; a regression pass on real devices.
3. Store listing complete: title, description, icon, screenshots, age rating, privacy policy URL, data
   and privacy forms, content declarations including any AI-content disclosure (all checked against the
   current store requirements, with source and date).
4. Ads and purchases: production IDs configured, test purchases verified, consent flows in place where required.
5. Crash reporting and analytics active, and consistent with the privacy declarations.
6. Signing keys backed up in two private places (human confirms; never paste them anywhere).
7. Rollout plan (staged or test track) and a hotfix plan are ready.
8. The human approves submission and submits with their own accounts.
