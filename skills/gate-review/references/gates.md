# Gate checklists

Every criterion needs evidence. The numbers below are sensible defaults for a solo mobile game; the human may
adjust them by recording a decision. Store, platform, price, and benchmark details are volatile: verify them
with `indie-studio:research` and cite the source and date.

Project documents live in the game project: `docs/PITCH.md`, `docs/MARKET.md`, `docs/BUSINESS_CASE.md`,
`docs/GDD.md`, `docs/LEVELS.md` (games built from levels), `docs/ECONOMY.md`, `docs/TECH.md`,
`docs/STYLE_BIBLE.md`, and the `studio/` logs. Templates are in `${CLAUDE_PLUGIN_ROOT}/templates/docs/`.

## Gate 0: Conception Exit (tag `m0-kickoff`)
1. One-sentence game description and the core loop (action, goal, feedback) in `docs/PITCH.md`. The working
   title was searched in the stores and trademark databases (source and date in `studio/KNOWLEDGE.md`).
2. Player, platform, and target session length defined; the computer the game is built on and the first store
   recorded.
3. `docs/MARKET.md`: three to five comparable games with how each earns, what brings players back, and what
   reviewers complain about; the gap in one sentence; sources logged in `studio/KNOWLEDGE.md`.
4. `docs/BUSINESS_CASE.md`: the model, researched targets with source and date, the route to players
   (organic, paid installs, or a publisher) and how they will find the game, the languages, what it costs, a
   low and a middle case in plain arithmetic, and the soft-launch plan (or a recorded decision to skip it).
5. Feasibility: hours per week, target date, and tool budget recorded; every ambition priced rather than
   refused; the first release fits in about two thirds of the available hours.
6. Engine chosen; reasons and verified versions in `studio/DECISIONS.md` (`indie-studio:engine-selector`).
7. Scope tiers in STUDIO_STATE.md: T1 is the first release, with T2, T3, and a post-launch roadmap for the
   bigger ambitions.
8. Top five risks, a pre-mortem, and kill or pivot criteria in `studio/RISKS.md`, including the business-case
   numbers that would change or end the project.
9. Repository set up with a remote backup and the permission contract agreed (`indie-studio:git-workflow`).
10. STUDIO_STATE.md filled in and current.

## Gate 1: Vertical Slice (tag `m1-vertical-slice`)
1. Core loop validated by outsiders: at least 3 (aim for 5) people played; notes in `studio/playtests/`;
   a clear signal (most understood the goal within a minute and wanted another go); an iterate-or-kill
   decision recorded.
2. `docs/GDD.md` written from what playtests proved: rules, controls, progression, content plan, UI flow. As
   long as it needs to be and no longer; anything unproven is written as an open question, not as a design.
3. `docs/ECONOMY.md` drafted if the game earns from ads or purchases: what is sold, currencies, ad moments,
   and the analytics event list (`indie-studio:monetization`). Nothing integrated yet.
4. A playable slice at final target quality: one complete level or segment with production art, UI, audio,
   and feedback ("juice"), running on a real device.
5. The slice was built the way the rest of the game will be: clean code on a `feature/*` branch (not the
   throwaway spike), a style bible in `docs/STYLE_BIBLE.md`, asset ledger rows filled in.
6. **Pipeline timing measured:** hours per unit of content (per level, per item). Extrapolated to the full
   T1 content list and compared with capacity in `studio/DECISIONS.md`. Tiers re-baselined from this.
7. Runs at the target frame rate on the lowest-end target device; build size and start time measured in
   `studio/PERF_LOG.md` (`indie-studio:mobile-perf-budget`).
8. A fresh clone of the repository builds and runs with the one-command build (repo hygiene).
9. Agent setup in place: `CLAUDE.md` project rules, task briefs in use (`indie-studio:ai-delegation`).
10. `docs/TECH.md` written, and the slice follows it: architecture map, conventions, save format with a version
    number, one wrapper per service, text rules, build and release settings, test plan.
11. Automated tests for saving and loading pass, including loading a save from an older version. All
    player-facing text in the slice comes from string tables: a pseudo-translation pass shows nothing
    hard-coded and nothing cut off (`indie-studio:asset-pipeline`, localization).
12. If the game is built from levels: `docs/LEVELS.md` holds the building blocks and where each is taught, the
    template rules and level checklist, the difficulty plan with researched bands, and the slice's levels with
    the measured time per level.
13. If the route to players depends on paid installs or a publisher: the marketability test ran and its numbers
    are in `docs/BUSINESS_CASE.md`, or the reason it was skipped is recorded (`indie-studio:monetization`).

## Gate 2: First Playable (tag `m2-first-playable`)
1. A player can go from launch through a full core-loop session and back to the menu, using placeholders.
2. No crash on the critical path, on a real device.
3. T1 system list with the status of each; remaining T1 work estimated.
4. At least 3 outsiders played this build; notes logged.
5. A `studio/PERF_LOG.md` entry exists for this milestone.
6. Every merge into `develop` is built and tested automatically (CI), or a recorded reason why not
   (`indie-studio:toolchain`). `docs/TECH.md` matches the code.

## Gate 3: Alpha, feature complete (tag `m3-alpha`)
1. Every T1 feature (and any T2 feature agreed at Kickoff or by trade) is implemented and reachable, checked
   item by item against `docs/GDD.md` and the tiers.
2. All screens and flows exist: menus, settings, pause, results, first-time experience.
3. Save and load work; pausing, backgrounding, and resuming the app work.
4. Analytics, ads, and purchases integrated in **test mode** and reachable, or explicitly deferred with a
   recorded reason (`indie-studio:monetization`); the consent flow drafted. Each sits behind its wrapper as
   `docs/TECH.md` describes; no game code calls an SDK directly.
5. No open `feature/*` branches; the parking lot has been reviewed and nothing in it is being built.
6. Remaining content listed with per-unit timing (for levels, the level list in `docs/LEVELS.md`); capacity
   check recorded.
7. A known-bug list exists.
8. **Feature freeze declared:** state, Off-limits, and branch rules updated.
9. Automated tests cover purchase handling (with the store faked) and the economy math, and pass in CI.

## Gate 4: Beta, content complete (tag `m4-beta`)
1. All levels, content, art, UI, and audio are in the build (final or near final).
2. Zero known crash or progress-blocking bugs; the rest of the bug list is triaged.
3. Performance within budget on the lowest-end target device (`studio/PERF_LOG.md`): frame rate, memory,
   build size, start time.
4. At least 5 outsiders played the Beta build; difficulty and onboarding tuned from their notes. Every level in
   the build is in the level list, passed its checklist, was proven winnable, and sits in its difficulty band.
5. The real-device smoke test passed on at least two devices, one of them low-end
   (see `indie-studio:mobile-perf-budget`).
6. Analytics verified end to end: every event in `docs/ECONOMY.md` arrives in the dashboard with the right
   properties. A sandbox purchase and a rewarded ad completed in test mode.
7. `studio/ASSET_LEDGER.md` is complete; tool license pages were re-checked (`indie-studio:asset-pipeline`).
8. Store paperwork under way: the final name cleared, developer accounts exist, privacy policy drafted, store
   forms started, featuring and pre-launch sign-up options checked with their lead times. If a
   store requires a closed test before it will allow publishing (Google Play does for new personal accounts),
   that test is already running: verify the current tester count and duration, because it costs weeks of
   calendar time and needs real people (`indie-studio:research`).
9. The polish buffer is intact and scheduled.
10. An update from the previous build keeps the player's save: tested automatically and on a device. CI is
    green on `develop`.
11. Translations for the soft-launch languages are in the build and checked on the smallest phone: nothing cut
    off, no missing characters (`docs/BUSINESS_CASE.md`, Languages).

## Gate 5: Gold Master (tag `v1.0.0`; release candidates `v1.0.0-rc.N`)
1. Release candidate built from `release/x.y.z` by CI or the one-command build, versioned, with a build number
   higher than any build already uploaded, signed with the release key, size within current store limits
   (verified), and crash-report symbols uploaded. SDK versions in `docs/TECH.md` match the build.
2. No known crash or progress-blocking bugs; a regression pass on real devices.
3. Store listing complete in each soft-launch language: title, description, icon, screenshots (with their
   text translated), age rating, privacy policy URL, data and privacy forms, content declarations including any
   AI-content disclosure (all checked against the current store requirements, with source and date).
4. Ads and purchases: production IDs configured, test purchases verified, consent flows in place where
   required.
5. Crash reporting and analytics active, and consistent with the privacy declarations.
6. Signing keys backed up in two private places (human confirms; never paste them anywhere).
7. Release plan ready: the soft-launch countries (or a recorded decision to skip the soft launch), the
   rollout, and the hotfix path.
8. The human approves submission and submits with their own accounts.

## Gate 6: Global Launch (tag `m5-global-launch`)
Passed at the end of the Soft Launch stage, before the worldwide release. If the soft launch was skipped by
decision, judge whatever evidence exists and say plainly how much weaker it is.
1. The soft launch ran for the planned time, with enough players for the numbers to mean anything (sample
   size researched, not guessed).
2. Retention read in order (D1, then D7, then D30 where time allows) against the targets in
   `docs/BUSINESS_CASE.md`, by cohort, with paid and organic players kept apart.
3. Revenue per player read against the same targets; a real purchase and a rewarded ad verified in production.
4. Crash-free rate and store rating acceptable; the worst reported problems fixed.
5. Every change made during the soft launch listed with the number that prompted it. For a game built from
   levels: the per-level funnel was read, and the levels where most players quit were retuned.
6. The decision recorded in `studio/DECISIONS.md` (scale up, keep fixing, or stop), using the rules written
   before any results arrived.
7. Launch plan ready: countries, store listing localized where it matters, announcement, and the first update
   already planned.
8. Support plan: who answers reviews and how often, and what would trigger a hotfix or a paused rollout.
9. Upkeep scheduled: the next store and SDK requirement deadlines are in the compliance calendar, each with a
   start date. For a live game, the first month's live calendar fits the human's real hours.
