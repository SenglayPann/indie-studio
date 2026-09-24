---
name: scope-guard
description: Protect the project's scope. Use whenever the user or you propose a new feature, mechanic, content type, system, platform, art style, tool swap, or any change to the agreed plan ("let's also add", "what if we", "quick idea", "it would be cool", "while we're at it"), and whenever the schedule slips or a task grows. Applies the MVP tiers, one-in-one-out trades, the Alpha feature freeze, the protected polish buffer, and the parking lot.
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
   - A change of plan (engine, platform, art style, core loop): treat as major. Recommend a gate-level
     review, and recommend against it after the Vertical Slice.
3. **Cost it across the studio** with a quick range in hours. Do not skip a row: hidden costs are the point.

| Area | Ask |
|---|---|
| Design | Rules, balance, tutorial or explanation needed? |
| Engineering | New systems, save data changes, edge cases, platform behavior? |
| Art and UI | New screens, sprites, animations, icons, states? |
| Audio | New sounds or music? |
| Levels and content | How many new levels or items does it multiply into? |
| QA | New paths to test, new devices or states? |
| Monetization and release | New SDK, store text, screenshots, privacy declarations? Does it change `docs/ECONOMY.md`, the prices, or the analytics events? |

   Calibrate with history: if `studio/JOURNAL.md` shows tasks ran over their estimates, scale up by that
   ratio and say so.
4. **Compare with capacity:** hours left before the next gate or target date (hours per week x weeks),
   minus the protected polish buffer, minus remaining T1 work. Show the numbers.
5. **Offer options, with a recommendation:**
   - **Park it** (default when it does not strengthen the first release): add to `studio/PARKING_LOT.md` with
     the cost and when to revisit. If it is a real intention for later rather than a maybe, put it on the
     **post-launch roadmap** in STUDIO_STATE.md instead, where the bigger ambitions wait for numbers that
     justify them.
   - **Swap it in** (one in, one out): name the specific T2 or T3 item to drop, of equal or greater cost.
   - **Replace or re-tier**: change the tiers deliberately.
   - **Reject** (after Alpha): only content within existing systems, fixes, and polish remain allowed.
6. **Record the human's choice:** `studio/DECISIONS.md`, the tiers in STUDIO_STATE.md, and the parking lot.
   Update the Schedule section if capacity changed.
7. **Keep the tone warm:** "Good idea. It is not lost: parked as P-004 for version 1.1."

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
Do not solve a slip with heroic extra hours; that is how burnout and skipped testing happen. Tell the human
plainly: "We are two weeks behind. Options: cut X, or move the target date."

## Warning phrases
"While we're at it", "one more mode", "it would be easy to add", "everyone will expect", "let's support
tablets or landscape too", "let's switch the art style", "let's try another engine", "just a small tweak to the
save format". Treat each as a scope question.
