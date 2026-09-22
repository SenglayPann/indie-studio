---
name: launch-live
description: Phase 4 of an Indie Studio project. Use when the project is at or near release (Gold Master gate), in soft launch, or live (stage Soft Launch, Launch, Live Ops, or Post-Mortem), or when the user asks about store submission, the release build, store listings, launch day, staged rollouts, which countries to soft launch in, what the soft-launch numbers mean, fixing bugs after launch, updates, reading reviews and crash reports, or writing a post-mortem. Covers the release candidate, store readiness and the human-only steps, the soft launch and its scale-or-stop decision, the worldwide rollout, live monitoring and hotfixes, and the post-mortem that produces lessons for the next game.
---

# Phase 4: Launch and Live

**Goal:** ship safely, find out what real players actually do, and turn that into either a bigger game or an
honest stop. Store rules, fees, and requirements are volatile: verify every one with `indie-studio:research`
when you reach it (source and date in `studio/KNOWLEDGE.md`). Communication rules:
[communication.md](../director/references/communication.md). Reading the numbers:
`indie-studio:monetization`.

## Human-only steps (say this early and clearly)
The human, not the AI, must: create and pay for developer accounts, complete identity verification, enter tax
and payment details, accept agreements, sign in to store consoles, back up signing keys, and press submit. The
AI prepares checklists, drafts text, builds the release, and guides each step, but never enters credentials,
payment details, or personal identity data, and never says something was approved before the human confirms it.

## Release candidate and store readiness (end of Beta, before the Gold Master gate)
1. **Release candidate.** From `release/x.y.z`: bump the version, build a signed release build (not a debug
   build), and install it on real devices. Only fixes go in. Tag candidates `v1.0.0-rc.N`.
2. **Store readiness.** For each store, verify the current requirements, then complete:
   - Listing: title, short and full description, icon, screenshots from real gameplay, and any required
     graphics. Screenshots and trailers must show the actual game.
   - Privacy policy at a public URL (draft with the AI; the human reviews and, for real risk, gets legal
     help), and the data and privacy declarations that match what the game and its SDKs actually collect.
   - Age rating questionnaire, content declarations (including any AI-content disclosure), and ad or purchase
     declarations.
   - Required target platform version, file format, and size limits.
   - Any closed test the store demands before it will allow publishing. For new personal accounts on Google
     Play this takes weeks of calendar time and a group of real testers: verify the current rules and start
     early (this belongs in the compliance calendar from Pre-Alpha).
   - Pricing, regions, and consent flows for ads and analytics where required.
3. **Signing keys.** Confirm the human has backed up the signing keys in two private places (never in the
   repository, never in a chat). Losing them can block updates forever.
4. **Release plan.** Decide the soft-launch countries from `docs/BUSINESS_CASE.md` (or record the decision to
   skip the soft launch), the staged rollout, what would make you pause it (crash rate, one-star flood), and
   the hotfix path (`hotfix/*` from `main`).
5. **Gate:** run `indie-studio:gate-review` for Gold Master. On approval the human submits with their own
   accounts. Merge `release/x.y.z` into `main` and `develop` and tag `v1.0.0` (each with the human's approval).
   Set the stage to Soft Launch, or to Launch if the soft launch was skipped by decision.

## Stage: Soft Launch (Monetization + Producer + Engineer; QA, Marketer, Release Engineer, Designer as guests)
Release the finished game in a few small countries first, and learn whether players stay and spend while
mistakes are still cheap. Skipping this is a decision to record, not a default.
1. **Release to the planned countries only.** Keep the store listing and price the same as the global plan,
   so the numbers mean something.
2. **Check the plumbing before reading anything:** events arriving with the right properties, purchases
   completing, ads filling, crash-free rate, no install or first-run failures on real devices.
3. **Wait for enough players.** Decide the number before looking (`indie-studio:monetization`, section 7).
   Reading a handful of installs is worse than reading nothing, because it feels like evidence.
4. **Read in order:** D1, then D7, then revenue per player, always by cohort, and never mixing paid traffic
   with organic. Write each reading in `studio/PERF_LOG.md` or a soft-launch section of `studio/JOURNAL.md`
   with the date and the cohort size.
5. **Change one thing at a time.** Every change names the number it is meant to move and goes through
   `indie-studio:scope-guard`; the feature freeze is lifted here for exactly that reason. Ship each round as a
   new `release/x.y.z` and let it run long enough to compare.
6. **Protect the human:** a soft launch can run for weeks. Agree a rhythm and a stop date rather than watching
   dashboards daily.
7. **Gate:** run `indie-studio:gate-review` for Global Launch. The decision is scale up, keep fixing, or stop,
   using the rules written in `docs/BUSINESS_CASE.md` before the results existed. Stopping is a real, honest
   outcome: the post-mortem still runs and the lessons still count.

## Stage: Launch (Release Engineer + Marketer; QA, Monetization, Producer as guests)
1. **Open up in steps.** Use a staged rollout where the store supports it, and watch crash rate, rating, and
   retention between steps. Pause on the rules agreed in the release plan.
2. **Store listing per country:** localized where the data says it matters; screenshots and text from the real
   game.
3. **Marketing basics.** Announcement text, a few short gameplay clips, community posts. Drafted by the AI,
   posted by the human, honest about the game.
4. **Support rhythm from day one:** who answers reviews, how often, and what counts as a hotfix.
5. Tag the launch and update the Gates table; set the stage to Live Ops once the rollout is complete.

## Stage: Live Ops (Engineer + QA; Monetization, Marketer, Producer as guests)
1. **Watch:** crash reports, reviews, analytics, and player feedback; daily for the first week, then weekly.
2. **Triage** every item into: hotfix now, next patch, idea for later (parking lot), or ignore. Log it.
3. **Hotfix:** branch `hotfix/*` from `main`, fix, test on devices, merge into `main` and `develop`, tag
   `v1.0.1`. Keep it small.
4. **Updates:** plan the next version from the parking lot, the post-launch roadmap, and real numbers through
   `indie-studio:scope-guard`, with a fresh scope tier list and a buffer of its own. Do not promise dates you
   cannot keep.
5. **Tune from data, not feeling:** move numbers through remote settings where possible, one change at a time,
   and measure the result (`indie-studio:monetization`).
6. **Answer reviews** kindly and briefly (a draft by the AI, posted by the human).
7. Protect the human's energy: a live game should not swallow their life. Set a support rhythm and keep it.

## Stage: Post-Mortem (Producer; Designer and Engineer as guests)
Do this within a couple of weeks of launch, while it is fresh.
1. Gather the data: `studio/JOURNAL.md`, `studio/DECISIONS.md`, `studio/RISKS.md`, estimates versus actuals,
   the playtest notes, the perf log, and the soft-launch and live numbers against `docs/BUSINESS_CASE.md`.
2. Fill in `${CLAUDE_PLUGIN_ROOT}/templates/docs/POSTMORTEM.md` and save it as `docs/POSTMORTEM.md`: what went
   well, what went badly, what surprised us, and the review areas: estimates versus actuals, pipeline
   bottlenecks, communication or process gaps, toolchain, and what the business case got right or wrong.
3. Extract at most ten concrete lessons into `studio/LESSONS.md`, each as "next time, do X" or "next time,
   avoid Y".
4. Review the parking lot and the post-launch roadmap: what deserves an update, what belongs in the next game.
5. Go through `studio/PLUGIN_FEEDBACK.md` with the human: summarize the top items in the post-mortem and offer
   to send them (`indie-studio:plugin-feedback`, send mode).
6. Close the loop: set the state to a finished project, tag the final commit, and back up the repository. For
   the next game, start a new project folder and carry `LESSONS.md` over.

## Rules
- A gate is only passed when the human says so. "Ready to submit" is not "approved by the store".
- Never hide a known Class A bug from a gate. Tell the human plainly.
- Keep launches boring: everything with a waiting period was started weeks ago (`indie-studio:roles`,
  compliance calendar).
- Numbers decide scaling, not hope. If the soft launch says stop, say stop, and say what it taught.
