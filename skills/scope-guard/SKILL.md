---
name: scope-guard
description: Protect the project's scope. Use whenever the user or you propose a new feature, mechanic, content type, system, platform, art style, tool swap, or any change to the agreed plan ("let's also add", "what if we", "quick idea", "it would be cool", "while we're at it"), including what the first release includes or the target date, and whenever the schedule slips or a task grows. Applies the scope tiers and cutting order, one-in-one-out trades, the check that retention targets keep the features they rely on, the Alpha feature freeze, the protected polish buffer, the parking lot, and the re-plan checklist for a major change.
argument-hint: "[the idea or change]"
---

# Scope guard

Scope creep is the most common way solo projects die. Each new feature multiplies work across design,
code, art, audio, UI, testing, and store setup. Your job is to make that cost visible and to make the
human choose deliberately, never to say "no" to ideas forever. Ideas are not rejected; they are
**parked or traded**. Communication rules: [communication.md](../director/references/communication.md).

## Procedure
1. **Read the stage** from STUDIO_STATE.md. If the Alpha gate has passed, use the freeze rules below.
2. **Restate the idea in one sentence** and classify it:
   - Already in a scope tier: build it in tier order. Not a scope question.
   - A bug fix: not scope. Allowed at every stage.
   - New feature or system: continue.
   - "Just polish" that secretly needs a new system (animation framework, new screen, new save data):
     treat it as a new feature.
   - A change of plan (engine, platform, art style, core loop, what the first release includes, the target
     date): treat as major and run the re-plan checklist below. Recommend against a new engine, platform, art
     style, or core loop after the Vertical Slice.
3. **Cost it across the studio** with a quick range in hours, in two columns: the AI's build time and the
   human's hands-on time (deciding, reviewing, testing, store work), plus any new calendar wait
   (`indie-studio:roles`, producer, "Estimating in three columns"). Do not skip a row: hidden costs are the point.

| Area | Ask |
|---|---|
| Design | Rules, balance, tutorial or explanation needed? |
| Engineering | New systems, save data changes, edge cases, platform behavior? |
| Art and UI | New screens, sprites, animations, icons, states? |
| Audio | New sounds or music? |
| Levels and content | How many new levels or items does it multiply into? |
| QA | New paths to test, new devices or states? |
| Monetization and release | New SDK, store text, screenshots, privacy declarations? Does it change `docs/ECONOMY.md`, the prices, or the analytics events? |

   Calibrate with history: scale each column by its measured ratio (STUDIO_STATE.md, Schedule, from the
   journal) and say so.
4. **Compare with capacity:** the human's hours left before the next gate or the target date (their hours per
   week x weeks), minus the protected polish buffer, minus the first release's remaining work (the human's
   column). Show the numbers.
5. **Check what it carries.** If a feature would leave the first release (a cut, a swap, or a re-tier), look it
   up in the "Carried by" column of the targets in `docs/BUSINESS_CASE.md` and in the genre contract in
   `docs/MARKET.md`. If it carries a retention target or a genre promise, say which, and add the choices: keep
   it, replace it with another feature that carries the same target, or lower the target (recorded).
6. **Offer options, with a recommendation:**
   - **Park it** (default when it does not strengthen the first release): add to `studio/PARKING_LOT.md` with
     the cost and when to revisit. If it is a real intention for later rather than a maybe, put it on the
     **post-launch roadmap** in STUDIO_STATE.md instead, where the bigger ambitions wait for numbers that
     justify them.
   - **Swap it in** (one in, one out): name the specific T2 or T3 item to drop, of equal or greater cost.
   - **Replace or re-tier**: change the tiers deliberately.
   - **Reject** (after Alpha): only content within existing systems, fixes, and polish remain allowed.
7. **Record the human's choice:** `studio/DECISIONS.md` (marking any decision it replaces), the tiers in
   STUDIO_STATE.md, and the parking lot. Update the Schedule section if capacity changed.
8. **Keep the tone warm:** "Good idea. It is not lost: parked as P-004 for version 1.1."

## Re-plan checklist (a major change)
A change to the core loop, the engine, the platform, the art style, what the first release includes, or the
target date touches every plan document. Work through this list the same day, then tell the human in three
lines what changed.
1. **Record it** in `studio/DECISIONS.md`, naming what it replaces, and set each replaced decision's Status to
   `superseded by D-0xx` or `amended by D-0xx (<what changed>)`.
2. **Re-estimate** what changed in `docs/FEASIBILITY.md` (three columns), and check the capacity rule for the
   first release (`indie-studio:roles`, producer).
3. **Re-derive the dates:** new Planned dates in the Gates table from the estimate, with matching Forecasts.
   Planned dates change only through a recorded decision like this one.
4. **Business case:** dates, costs, what is sold, the targets' "Carried by" features, and the soft-launch plan.
5. **Risks:** the risks, kill criteria, and time-boxes in `studio/RISKS.md`.
6. **Copies:** any document that repeats the scope, a date, or a target gets a link to its home instead (scope
   and dates: STUDIO_STATE.md; targets: the business case). A long document the change makes partly stale gets
   a one-line dated note at the top ("<date>, D-0xx: ...") until it is rewritten.
7. **Review:** a major change needs a gate-level review. Before the Vertical Slice, the next scheduled review
   (the end of the Prototype time-box, or a weekly review) can serve as one if the human agrees. After it, hold
   a review of its own.

## After the Alpha gate: hard freeze
Ask two questions. Does it add a new system, mechanic, screen, or dependency? Does it change what the
player can do? If either answer is yes, it is frozen: park it for the next version or the next game.
Still allowed: bug fixes, more content using existing systems (levels, items, sounds), tuning, and polish
that adds no new system. Refuse to create `feature/*` branches (see `indie-studio:git-workflow`; the
pre-commit hook blocks them too).

The freeze lifts at the **Soft Launch** stage, and only for changes a measurement asks for: name the number
the change is meant to move, size it as usual, and record it. "Players quit in the tutorial, D1 is under
target" is a reason; "it would be cool" is still not.

## When the schedule slips
A slip shows first as a gate's Forecast passing its Planned date in the Gates table (the session brief warns
with "SLIPPING"). Act then, while the options are still cheap.
Cut scope, never the polish buffer. In order: drop T3, then trim T2, then shrink content volume within T1.
Before each cut, check what it carries (step 5).
Do not solve a slip with heroic extra hours; that is how burnout and skipped testing happen. Tell the human
plainly: "We are two weeks behind. Options: cut X, or move the target date."

## Warning phrases
"While we're at it", "one more mode", "it would be easy to add", "everyone will expect", "let's support
tablets or landscape too", "let's switch the art style", "let's try another engine", "just a small tweak to the
save format". Treat each as a scope question.
