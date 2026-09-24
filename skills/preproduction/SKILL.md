---
name: preproduction
description: Phase 2 of an Indie Studio project. Use when the project is in Pre-Production (stage Prototype, GDD, or Vertical Slice), when the user wants to create the engine project, build or test a first prototype, decide whether the core loop is fun, write the design document, plan the economy and analytics events, build the Vertical Slice, or measure how long content takes to produce. Runs the messy prototype on a throwaway branch, outside playtests, the iterate-or-kill decision, the design document, the production-quality slice with timing math, and the Vertical Slice gate.
---

# Phase 2: Pre-Production

**Goal:** prove the game is fun, prove the team (you plus AI) can produce it at the needed speed, and only then
commit to Production. Everything here is about removing uncertainty cheaply. Communication rules:
[communication.md](../director/references/communication.md). Stage hats and off-limits:
[phases-and-stages.md](../director/references/phases-and-stages.md).

## Stage: Prototype (Engineer + Designer; QA and Producer as guests)
1. **Create the project.** Use the engine-specific skills installed in the user's setup if there are any
   (for example project creation and command-line skills for Unity). Otherwise follow the engine's official docs
   (`indie-studio:research`). Pin and record the engine version. Extend `.gitignore` and decide the LFS plan
   (`indie-studio:git-workflow`). Add project rules to `CLAUDE.md` from
   `indie-studio:ai-delegation` (`references/project-rules.md`) with the human's approval.
2. **Baseline check.** Build an empty project onto the real test device. Record the empty build size and start
   time in `studio/PERF_LOG.md`. This proves the whole path from code to phone works before any game exists.
3. **Time-box.** Use the Prototype time-box in `studio/RISKS.md` (default: about 2-3 weeks or about 30 hours,
   whichever comes first).
4. **Build on `spike/core-loop`.** Grey boxes, placeholder shapes, only the core loop. No menus beyond a start
   button, no saving, no audio, no ads, no polish, no architecture. Messy code is correct here. Ask the AI to keep
   it working, not tidy.
5. **Playtest early:** run `indie-studio:playtest-loop` with 3-5 outsiders as soon as the loop is playable.
6. **Decide:** proceed, change the core once, or stop (iterate-or-kill in the playtest-loop skill). At most two
   focused rounds. Record it in `studio/DECISIONS.md`.
7. **Close the spike** once the decision is to proceed or to stop. With the human's approval: switch to `develop`,
   carry the notebook over from the spike so the playtest notes and the decision are kept (`indie-studio:git-workflow`,
   section 8), then tag the spike `archive/spike-core-loop` and delete the branch. The spike is reference only.
   Never merge it.

## Stage: GDD (Designer + Producer; Engineer and Monetization as guests)
8. **Write `docs/GDD.md`** from `${CLAUDE_PLUGIN_ROOT}/templates/docs/GDD.md`: a living document, as long as
   the game needs and no longer. Include only what playtests proved or the human decided; write open questions
   as open questions. Split anything that grows on its own into its own file, so a session loads only what it
   needs.
9. **Draft `docs/ECONOMY.md`** if the game earns from ads or purchases (`indie-studio:monetization`): what is
   sold, currencies, sources and sinks, ad moments, and the analytics event list. Nothing is integrated yet;
   this is the plan the build will follow from Pre-Alpha.
10. **Write `docs/TECH.md`** (Engineer) from `${CLAUDE_PLUGIN_ROOT}/templates/docs/TECH.md`: the architecture
    map, conventions, the save format with its version number, one wrapper per service (ads, purchases,
    analytics, remote settings, consent), text rules, build and release settings, and the test plan. Size it
    to the game; it is the rulebook every later session codes by. Record the reasons in `studio/DECISIONS.md`.
11. **Define the Vertical Slice exactly:** one level or one complete segment; the list of systems, art, audio,
    UI, and feedback it must include; and a definition of done. Everything outside that list waits.

## Stage: Vertical Slice (Engineer + Artist + Level Designer; Audio, QA, Producer as guests)
12. **Style bible first:** `docs/STYLE_BIBLE.md` and the tool choices (`indie-studio:asset-pipeline`;
    time-boxed comparison in `indie-studio:research`, setup and key handling in `indie-studio:toolchain`).
    Decide who makes each asset class and approve three samples from each maker before production starts.
    Nothing final gets generated before this exists.
13. **Rebuild cleanly** on `feature/vertical-slice` from `develop`, following `docs/TECH.md`. Port the proven
    logic from the spike; do not copy the spike wholesale. The slice must use the same pipeline the rest of the
    game will use. **Automated checks start here:** a one-command build, and tests for saving and loading
    (including a save from an older version). Set up CI now if you can (`indie-studio:toolchain`); it is due
    by the First Playable gate.
14. **Bring the slice to final quality:** production art, UI, sound effects, one music loop, and game feel ("juice").
15. **Timing exercise (the most important step).** Log real hours for each kind of work on the slice: level
    design, art, audio, integration, testing, including AI generation and cleanup time. Compute the cost per
    content unit, extrapolate to the T1 content list, and compare it with capacity. Record the numbers in
    `studio/DECISIONS.md`. Re-baseline the tiers. If the math does not fit, shrink the first release now.
16. **Device check.** Run it on the lowest-end target device; record frame rate, memory, size, and start time
    in `studio/PERF_LOG.md` (`indie-studio:mobile-perf-budget`).
17. **Fresh-clone test:** clone the repository to a new folder and build it with the one-command build from
    `docs/TECH.md`. If it does not build, fix the repository.
18. **Playtest** with 5 outsiders on the slice.
19. **Gate:** run `indie-studio:gate-review` for Vertical Slice.

## Pitfalls to guard against
- A slice polished with hacks or manual work that cannot scale. If it took six months to make ten minutes, the
  full game is impossible. Treat the slice as a stress test of the pipeline.
- Skipping outside playtests because the prototype "feels" fine to the creator.
- Building features beyond the slice, or mass-producing content before the timing is known.
- Over-engineering the prototype. Frameworks now are wasted work if the loop changes.
- Showing the slice publicly as if it were the finished game (it misleads players and can hurt trust).
