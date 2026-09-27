---
name: preproduction
description: Phase 2 of an Indie Studio project. Use when the project is in Pre-Production (stage Prototype, GDD, or Vertical Slice), when the user wants to create the engine project, build or test a first prototype, check its difficulty, balance, or luck with bot simulations, decide whether the core loop is fun, write the design or balance document, plan the economy and analytics events, build the Vertical Slice, or measure how long content takes to produce. Runs the messy prototype on a throwaway branch, a simulation of its numbers and a creator pass before outside playtests, the iterate-or-kill decision, the design documents, the production-quality slice with timing math, and the Vertical Slice gate.
---

# Phase 2: Pre-Production

**Goal:** prove the game is fun, prove the team (you plus AI) can produce it at the needed speed, and only then
commit to Production. Everything here is about removing uncertainty cheaply. Communication rules:
[communication.md](../director/references/communication.md). Stage hats and off-limits:
[phases-and-stages.md](../director/references/phases-and-stages.md). Loops, numbers, luck, choices, and
simulation: [systems-design.md](references/systems-design.md).

## Stage: Prototype (Engineer + Designer; QA and Producer as guests)
1. **Create the empty project on a branch that is kept.** From `develop`, create `chore/<engine>-project` (for
   example `chore/unity-project`) and make the empty engine project there, never on the spike: a spike is never
   merged, so a project created on it would be lost and rebuilt later. Use the engine-specific skills installed
   in the user's setup if there are any (for example project creation and command-line skills for Unity).
   Otherwise follow the engine's official docs (`indie-studio:research`). Pin and record the engine version.
   Extend `.gitignore` and decide the LFS plan (`indie-studio:git-workflow`). Add project rules to `CLAUDE.md`
   from `indie-studio:ai-delegation` (`references/project-rules.md`) with the human's approval.
2. **Baseline check.** Build the empty project onto the real test device. Record the empty build size and start
   time in `studio/PERF_LOG.md`. This proves the whole path from code to phone works before any game exists.
   Then, with the human's approval, merge `chore/<engine>-project` into `develop`.
3. **Time-box.** Use the Prototype time-box in `studio/RISKS.md` (default: about 2-3 weeks of calendar time or
   about 30 of the human's hands-on hours, whichever comes first).
4. **Build on `spike/core-loop`, branched from `develop`** once the empty project is there. Grey boxes,
   placeholder shapes, only the core loop. No menus beyond a start button, no saving, no audio, no ads, no
   polish, no architecture. Messy code is correct here. Ask the AI to keep it working, not tidy.
5. **Check the numbers before anyone else plays** (Designer, with the Engineer as guest). If the game has score
   targets, random content (deals, drops, spawns), or upgrades that stack, simulate the spike first, so the
   outsider round and the kill rule judge the concept rather than first-guess numbers. A quick script that
   replays the spike's rules is enough; prove it matches the build by replaying one recorded game. Run a careful
   bot and a random bot on the same fixed seeds, a thousand games or more each, and trust the careful one only
   once it beats the random one. Report the pass rate per round, the skill share (careful minus random), how
   power stacks against the targets, and any dead or dominant picks. Fix the obvious faults (runaway stacking,
   coin-flip rounds, picks that do nothing) and run it again. Method:
   [systems-design.md](references/systems-design.md), sections 2-5.
6. **Creator pass, then outsiders.** As soon as the loop runs on the phone, the creator plays two or three runs
   and shares notes or screenshots. The AI sorts them into tuning, design, scope, and bugs, checks the numbers,
   and fixes the tuning with the human's approval (the creator pass in `indie-studio:playtest-loop`, recorded
   as `studio/playtests/<date>-00.md` with the simulation's numbers). Then run `indie-studio:playtest-loop` with
   3-5 outsiders.
7. **Decide:** proceed, change the core once, or stop (iterate-or-kill in the playtest-loop skill). At most two
   focused rounds. Record it in `studio/DECISIONS.md`. If the business case depends on paid installs or a
   publisher, run the marketability test before proceeding: short ads cut from the prototype show what an
   install costs (`indie-studio:monetization`, growth). It spends real money, so the human approves it.
8. **Close the spike** once the decision is to proceed or to stop. With the human's approval: switch to `develop`,
   carry the notebook over from the spike so the playtest notes and the decision are kept (`indie-studio:git-workflow`,
   section 8), then tag the spike `archive/spike-core-loop` and delete the branch. The spike is reference only.
   Never merge it.

## Stage: GDD (Designer + Producer; Engineer, Level Designer, and Monetization as guests)
9. **Write `docs/GDD.md`** from `${CLAUDE_PLUGIN_ROOT}/templates/docs/GDD.md`: a living document, as long as
   the game needs and no longer. Include only what playtests proved or the human decided; write open questions
   as open questions. Split anything that grows on its own into its own file, so a session loads only what it
   needs. If the game is built from levels (or stages, waves, missions), start **`docs/LEVELS.md`** from
   `${CLAUDE_PLUGIN_ROOT}/templates/docs/LEVELS.md` with the Level Designer hat: building blocks and where each
   is taught, the template's rules, the level checklist, and the difficulty plan with researched bands. If the
   game has score targets, random content, or upgrades that stack, write **`docs/BALANCE.md`** from
   `${CLAUDE_PLUGIN_ROOT}/templates/docs/BALANCE.md` with the Designer hat: the loops and what carries them,
   power against targets, the difficulty plan measured by the reference bot, the skill share, and choice health.
10. **Draft `docs/ECONOMY.md`** if the game earns from ads or purchases (`indie-studio:monetization`): what is
    sold, currencies and what each is for, sources and sinks, ad moments, and the analytics event list. Nothing
    is integrated yet; this is the plan the build will follow from Pre-Alpha.
11. **Write `docs/TECH.md`** (Engineer) from `${CLAUDE_PLUGIN_ROOT}/templates/docs/TECH.md`: the architecture
    map (including the rules library, if the game has one), conventions, the save format with its version
    number, one wrapper per service (ads, purchases, analytics, remote settings, consent), text rules, build and
    release settings, and the test plan. Size it to the game; it is the rulebook every later session codes by.
    Record the reasons in `studio/DECISIONS.md`.
12. **Define the Vertical Slice exactly:** one level or one complete segment; the list of systems, art, audio,
    UI, and feedback it must include; and a definition of done. Everything outside that list waits.

## Stage: Vertical Slice (Engineer + Artist + Level Designer; Audio, QA, Producer as guests)
13. **Style bible first:** `docs/STYLE_BIBLE.md` and the tool choices (`indie-studio:asset-pipeline`;
    time-boxed comparison in `indie-studio:research`, setup and key handling in `indie-studio:toolchain`).
    Decide who makes each asset class and approve three samples from each maker before production starts.
    Nothing final gets generated before this exists.
14. **Rebuild cleanly** on `feature/vertical-slice` from `develop`, following `docs/TECH.md`. Port the proven
    logic from the spike; do not copy the spike wholesale. The slice must use the same pipeline the rest of the
    game will use. **Automated checks start here:** a one-command build, and tests for saving and loading
    (including a save from an older version). If the game has a balance simulator, move the rules into one
    library with no engine dependency, used by the game, the tests, and the simulator (`docs/TECH.md`, section
    2); retire any separate prototype simulator, and turn the key balance targets in `docs/BALANCE.md` into
    automated checks. Set up CI now if you can (`indie-studio:toolchain`); it is due by the First Playable gate.
15. **Bring the slice to final quality:** production art, UI, sound effects, one music loop, and game feel ("juice").
16. **Timing exercise (the most important step).** Log real hours for each kind of work on the slice (level
    design, art, audio, integration, testing, including AI generation and cleanup) in two columns: the AI's
    session time and the human's hands-on time. Compute both per content unit, extrapolate to the content list
    of the first release, and compare the human's hours with capacity (the capacity rule in `indie-studio:roles`,
    producer). Record the numbers and both measured ratios in `studio/DECISIONS.md` (and the time per level in
    `docs/LEVELS.md`, section 7). Re-baseline the tiers, update `docs/FEASIBILITY.md`, and re-forecast every
    remaining gate date in the Gates table. If the math does not fit, shrink the first release now.
17. **Device check.** Run it on the lowest-end target device; record frame rate, memory, size, and start time
    in `studio/PERF_LOG.md` (`indie-studio:mobile-perf-budget`).
18. **Fresh-clone test:** clone the repository to a new folder and build it with the one-command build from
    `docs/TECH.md`. If it does not build, fix the repository.
19. **Playtest:** a creator pass, then 5 outsiders on the slice (`indie-studio:playtest-loop`).
20. **Gate:** run `indie-studio:gate-review` for Vertical Slice.

## Pitfalls to guard against
- A slice polished with hacks or manual work that cannot scale. If it took six months to make ten minutes, the
  full game is impossible. Treat the slice as a stress test of the pipeline.
- Skipping outside playtests because the prototype "feels" fine to the creator.
- Sending untuned numbers to outsiders: then the kill rule judges first-guess difficulty, not the concept.
- Building features beyond the slice, or mass-producing content before the timing is known.
- Over-engineering the prototype. Frameworks now are wasted work if the loop changes.
- Showing the slice publicly as if it were the finished game (it misleads players and can hurt trust).
