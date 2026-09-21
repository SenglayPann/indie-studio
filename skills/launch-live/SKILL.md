---
name: launch-live
description: Phase 4 of an Indie Studio project. Use when the project is at or near release (Gold Master gate) or live (stage Launch, Live Ops, or Post-Mortem), or when the user asks about store submission, the release build, store listings, launch day, rollouts, fixing bugs after launch, updates, reading reviews and crash reports, or writing a post-mortem. Covers the release candidate, store readiness with the human-only steps, the rollout plan, live monitoring and hotfixes, and the post-mortem that produces lessons for the next game.
---

# Phase 4: Launch and Live

**Goal:** ship safely, learn from real players, and capture what the project taught you. Store rules,
fees, and requirements are volatile: verify every one with `indie-studio:research` when you reach it
(source and date in `studio/KNOWLEDGE.md`), because they change often. Communication rules:
[communication.md](../director/references/communication.md).

## Human-only steps (say this early and clearly)
The human, not the AI, must: create and pay for developer accounts, complete identity verification, enter tax
and payment details, accept agreements, sign in to store consoles, back up signing keys, and press submit. The AI
prepares checklists, drafts text, builds the release, and guides each step, but never enters credentials,
payment details, or personal identity data, and never says something was approved before the human confirms it.

## Stage: Launch (Release Engineer + Marketer; QA, Monetization, Producer as guests)
1. **Release candidate.** From `release/x.y.z`: bump the version, build a signed release build (not a debug
   build), and install it on real devices. Only fixes go in. Tag candidates `v1.0.0-rc.N`.
2. **Store readiness.** For each store, verify the current requirements, then complete:
   - Listing: title, short and full description, icon, screenshots from real gameplay, and any required
     graphics. Screenshots and trailers must show the actual game.
   - Privacy policy at a public URL (draft with the AI; the human reviews and, for real risk, gets legal help), and
     the data and privacy declarations that match what the game and its SDKs actually collect.
   - Age rating questionnaire, content declarations (including any AI-content disclosure), and ad or purchase
     declarations.
   - Required target platform version, file format, and size limits.
   - Test track or closed-testing steps if the account type requires them.
   - Pricing, regions, and consent flows for ads and analytics where required.
3. **Signing keys.** Confirm the human has backed up the signing keys in two private places (never in the
   repository, never in a chat). Losing them can block updates.
4. **Rollout and safety plan.** Choose a staged rollout if the store supports it; decide what would make you pause
   (crash rate, one-star flood); prepare the hotfix path (`hotfix/*` from `main`).
5. **Marketing basics.** Announcement text, a few short gameplay clips, community posts. Drafted by the AI, posted by
   the human, honest about the game.
6. **Gate:** run `indie-studio:gate-review` for Gold Master. On approval the human submits with their own
   accounts. Merge `release/x.y.z` into `main` and `develop` and tag `v1.0.0` (each with the human's approval).

## Stage: Live Ops (Engineer + QA; Monetization, Marketer, Producer as guests)
1. **Watch:** crash reports, reviews, analytics, and player feedback; check daily for the first week, then weekly.
2. **Triage** every item into: hotfix now, next patch, idea for later (parking lot), or ignore. Log it.
3. **Hotfix:** branch `hotfix/*` from `main`, fix, test on devices, merge into `main` and `develop`, tag
   `v1.0.1`. Keep it small.
4. **Updates:** plan version 1.1 from the parking lot and real feedback through `indie-studio:scope-guard`,
   with a fresh scope tier list and a smaller buffer of its own. Do not promise dates you cannot keep.
5. **Answer reviews** kindly and briefly (a draft by the AI, posted by the human).
6. Protect the human's energy: a live game should not swallow their life. Set a support rhythm.

## Stage: Post-Mortem (Producer; Designer and Engineer as guests)
Do this within a couple of weeks of launch, while it is fresh.
1. Gather the data: `studio/JOURNAL.md`, `studio/DECISIONS.md`, `studio/RISKS.md`, estimates versus actuals, the
   playtest notes, the perf log.
2. Fill in `${CLAUDE_PLUGIN_ROOT}/templates/docs/POSTMORTEM.md` and save it as `docs/POSTMORTEM.md`: what went well,
   what went badly, what surprised us, and the four review areas: estimates versus actuals, pipeline bottlenecks,
   communication or process gaps (how work moved between hats), and toolchain (which tools helped or failed).
3. Extract at most ten concrete lessons into `studio/LESSONS.md`, each as "next time, do X" or "next time, avoid Y".
4. Review the parking lot: what deserves a future version, what belongs in the next game.
5. If a skill in this plugin gave bad advice or missed something, note it so the plugin can be improved.
6. Close the loop: set the state to a finished project, tag the final commit, and back up the repository. For the
   next game, start a new project folder and carry `LESSONS.md` over.

## Rules
- A gate is only passed when the human says so. "Ready to submit" is not "approved by the store".
- Never hide a known Class A bug from the gate. Tell the human plainly.
- Keep launches boring: everything with a waiting period was started weeks ago (`indie-studio:roles`,
  compliance calendar).
