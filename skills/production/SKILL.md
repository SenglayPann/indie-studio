---
name: production
description: Phase 3 of an Indie Studio project. Use when the project is in Production (stage First Playable, Pre-Alpha, Alpha, or Beta), when the user wants to plan the week, build the remaining systems or content, declare Alpha or Beta, handle a slipping schedule, stabilize and polish, or asks what to work on next during full development. Runs weekly cycles with task briefs, tier-ordered building, the Alpha feature freeze, content production under freeze, the Beta stabilization, and the protected polish buffer.
---

# Phase 3: Production

**Goal:** turn the proven slice into the complete game, predictably. This is the longest phase. Speed comes
from discipline: build in tier order, keep `develop` playable, and protect the polish buffer. Communication
rules: [communication.md](../director/references/communication.md). Hats and off-limits by stage:
[phases-and-stages.md](../director/references/phases-and-stages.md).

## The weekly cycle
1. **Plan (start of the week, Producer hat):** pick three to five tasks tied to the next gate, in tier order (T1
   first). Write a brief for each (`indie-studio:ai-delegation`, `studio/tasks/`). Put the top three in
   "Next actions". Check remaining capacity against remaining work.
2. **Build:** one branch per task. Small commits. Merge into `develop` at least weekly, after CI (or, before CI
   exists, the one-command build and the tests) passes and the human approves the review summary
   (`indie-studio:ai-delegation`). **`develop` must always open and run.** A broken `develop` stops everything
   until it is fixed.
3. **Device build weekly:** install on the real test device and play it. Every two weeks, run a playtest
   (`indie-studio:playtest-loop`).
4. **Review (end of the week, Producer):** hours worked; estimate versus actual; adjust the estimate multiplier;
   top three for next week; risks and time-boxes. Update STUDIO_STATE.md and the journal (`indie-studio:session` wrap).

A task is done when its acceptance criteria pass, it runs on the device, it is committed and merged, and its
brief is updated with the actuals.

## Stage: First Playable
Goal: a stranger can play from launch through one full session to the results and back, using placeholders.
- List every system the full path needs (input, core mechanic, win and lose, scoring, screen flow, minimal
  saving). Build them in dependency order from the tier list.
- Use the level template from the slice (`docs/LEVELS.md`). Placeholder art is fine.
- Playtest with 3 outsiders; log a `studio/PERF_LOG.md` entry on the test device.
- Gate: First Playable (`indie-studio:gate-review`).

## Stage: Pre-Alpha (systems)
Goal: every planned feature exists.
- Build the remaining T1 systems, then agreed T2 systems, in order: settings, pause, tutorial or first-time
  experience, save and load, audio hooks, results and progression, then anything else on the list.
- Analytics, ads, and purchases: integrate in **test mode** only once the core loop is stable, following
  `docs/ECONOMY.md` (`indie-studio:monetization`), each behind its wrapper from `docs/TECH.md`, and through any
  engine-specific skills installed. Verify SDK steps with `indie-studio:research`. Analytics first: events
  written now are what the soft launch will read. Purchase handling and economy math get automated tests.
- Every new idea goes through `indie-studio:scope-guard`. T3 waits.
- Start the compliance calendar (`indie-studio:roles`, release engineer) and keep it running.
- Gate: Alpha. Passing it starts the **feature freeze**.

## Stage: Alpha (content under freeze)
Goal: all the content, produced fast, using the measured pipeline.
- Feature freeze: no new systems, mechanics, or screens. Allowed: content within existing systems, fixes, tuning,
  and polish that adds no new system. Only `fix/*`, `content/*`, `polish/*` branches (`indie-studio:git-workflow`).
- Produce content by template using the timing measured at the Vertical Slice. Track throughput weekly against plan.
  If behind, shrink content volume inside T1 (scope-guard). Never shrink the buffer.
- Every new level goes into the level list in `docs/LEVELS.md` and through its checklist: the automated data
  check, a proven clear (solver, bot, or recorded human clear), and a difficulty band.
- Artist and Audio hats bring assets to final quality (`indie-studio:asset-pipeline`); keep the ledger current.
- Playtest each new kind of level or content.
- Gate: Beta (content complete).

## Stage: Beta (stabilize)
Goal: no new content. Make the game solid.
- QA hat leads: triage every bug (classes A-D in the QA role file); fix all Class A; work down the rest.
- Performance to budget on the low-end device (`indie-studio:mobile-perf-budget`); run the real-device smoke test.
- Updates keep saves: install the previous build, play, update to the new one, and check the progress survives;
  the automated migration tests cover every earlier save version.
- Tune difficulty and onboarding from 5 or more outside playtests, against the difficulty plan in
  `docs/LEVELS.md`.
- Monetization: switch to production IDs, verify a sandbox purchase and a rewarded ad, put the consent flow
  live, and check that every event in `docs/ECONOMY.md` arrives in the dashboard (`indie-studio:monetization`).
- Store paperwork: if a store requires a closed test before it will allow publishing, it must be running now.
  It costs weeks of calendar time (`indie-studio:research`).
- Ledger complete; re-check every asset tool's license page.
- Store paperwork drafted; test build on a store test track where required.
- Cut `release/x.y.z` from `develop` when the content and bug bar are met. Fixes only from then on.
- Gate: Gold Master. `indie-studio:launch-live` ("Release candidate and store readiness") takes over, and the
  first release goes to the soft-launch countries rather than the whole world.

## Protect the polish buffer
The buffer set at Kickoff (Schedule section) is time for bugs, performance, and game feel. It is not spare time.
When the schedule slips, cut scope, do not eat the buffer. A smaller, polished game beats a bigger, buggy one.

## Stop the line
Stop and fix first when: `develop` does not build or CI is red; the same bug returned after two fixes; a playtest shows
players cannot finish the core loop; the polish buffer is being used; the three-strikes rule triggered.
Tell the human plainly what stopped and what the options are.
