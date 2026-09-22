---
name: conception
description: Phase 1 of an Indie Studio project. Use when the project is in Conception (stage Idea, Validation, or Kickoff), when the user has no game idea yet or wants to pick, refine, or stress-test a concept, check the market, judge feasibility, define the MVP scope tiers, list risks, or write the pitch. Runs intake, idea generation filtered for a solo AI-assisted mobile developer, the market sanity check, feasibility math, engine choice, scope tiers, pre-mortem, pitch, and the Conception Exit gate.
---

# Phase 1: Conception

**Goal:** end with a small, feasible, clearly described game and honest numbers, not a big design.
Nothing gets built in this phase. Communication rules:
[communication.md](../director/references/communication.md). Idea filters and genre notes:
[idea-filters.md](references/idea-filters.md).

Hats: Idea = Designer + Producer (Marketer as guest). Validation = Designer + Marketer (Engineer and
Producer as guests). Kickoff = Producer + Designer. Off-limits: see the Idea, Validation, Kickoff rows in
[phases-and-stages.md](../director/references/phases-and-stages.md).

## Stage: Idea
1. **Intake.** Ask at most three questions at a time, each with a suggested default:
   - Honest hours per week, and a target date (or none).
   - Monthly budget for AI tools, and which phone(s) the user owns for testing.
   - Which computer they build on (Windows, Mac, or Linux), and whether iOS matters for the first release.
     iOS builds are signed and uploaded from macOS, either on a Mac or through a cloud build service, and
     Apple charges a yearly fee: verify today's options and costs with `indie-studio:research` before planning
     both stores. Android-first is often the cheaper start; say so plainly if it applies.
   - Games they love and play, what they want from this project (learn, ship, earn), and what they can do
     themselves (drawing, music, code, none).
   Write the answers into the Schedule section of STUDIO_STATE.md and the constraints part of `docs/PITCH.md`
   (copy `${CLAUDE_PLUGIN_ROOT}/templates/docs/PITCH.md` first).
2. **If the user already has an idea,** skip to step 4 and stress-test it against the filters. Do not
   replace it with your own.
3. **Generate 4-6 concepts** that pass the filters (idea-filters.md). For each: one sentence, the core verb, session
   length, why content is cheap to produce, the twist that makes it not a clone, the biggest risk, and a rough
   size (small, medium, large). Show the best 3-4, mark one as recommended, and say why.
4. **The human picks** (or combines). Then write the one-sentence game and the core loop (action, goal, feedback)
   in `docs/PITCH.md`. Check the loop against the filters again.

## Stage: Validation
5. **Market sanity check** (Marketer hat; use `indie-studio:research`, sources logged in `studio/KNOWLEDGE.md`):
   find three comparable games in the target store. Note what they do, how they earn, and what reviewers
   complain about. State the gap this game could fill. A crowded category is not fatal; a category with no gap
   is a warning. Treat popularity and revenue estimates as rough.
6. **Feasibility** (Producer with the Engineer as guest): list the skills the game needs, which the AI can
   cover, and which need the human. Estimate T1 roughly (for example, "12 levels x about 6 hours each plus
   about 40 hours of systems"), then do the capacity math: hours per week x weeks available. Multiply beginner
   estimates by 1.5 to 2. Flag showstoppers: multiplayer, servers, huge content, real-time networking, heavy 3D.
   Check the build path to every target store from the human's own computer (see the intake), and the store
   account steps and fees that only they can do.
7. **Engine choice:** run `indie-studio:engine-selector`.
8. Adjust the concept if feasibility or the market check demands it. Say plainly when something must shrink.

## Stage: Kickoff
9. **Scope tiers** in STUDIO_STATE.md: T1 (the game works and is fun; at most about two thirds of available
   hours), T2 (should have), T3 (nice to have). Add content targets as ranges (for example, 10-15 levels) and a
   short "not doing" list. Cutting order: T3, then T2.
10. **Risks:** run a pre-mortem ("imagine the game failed; why?") and fill `studio/RISKS.md`: the top five risks,
    kill or pivot criteria (for example, "if 3 of 5 outsiders are not keen to replay the prototype after two
    rounds, we stop or change the core"), and a time-box for the Prototype stage.
11. **Money in one line:** a tentative monetization model in the pitch. No SDKs, no accounts yet.
12. **Foundations:** set up version control with `indie-studio:git-workflow` (init mode: repo, remote backup, permission
    contract). Offer the CLAUDE.md block from `indie-studio:director`. Make sure STUDIO_STATE.md and `studio/` are current.
13. **Gate:** run `indie-studio:gate-review` for Conception Exit. On approval: tag `m0-kickoff`; set phase
    Pre-Production, stage Prototype, hats Engineer + Designer; refresh Off-limits and Next actions (first action: create the
    engine project and a `spike/core-loop` branch); recommend a fresh session.

## Rules for this phase
- The human chooses the idea. You supply options, evidence, and honest numbers.
- Do not let the concept grow while validating it. If a nice extra appears, park it (`indie-studio:scope-guard`).
- If the honest math says the idea does not fit the hours available, say so and shrink the idea, not the estimates.
- Explain every unfamiliar term once. Keep chat replies short; put the long text in `docs/PITCH.md`.
