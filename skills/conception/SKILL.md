---
name: conception
description: Phase 1 of an Indie Studio project. Use when the project is in Conception (stage Idea, Validation, or Kickoff), when the user has no game idea yet or wants to pick, refine, or stress-test a concept, study the market and what comparable games earn, judge feasibility and cost, decide how the game will make money, define the scope tiers and the first release, list risks, or write the pitch and the business case. Runs intake, idea generation and sizing, the market and money check, feasibility math, engine choice, business case, scope tiers, pre-mortem, and the Conception Exit gate.
---

# Phase 1: Conception

**Goal:** end with a clearly described game, an honest business case, and numbers the human can plan from.
The size of the game comes from the evidence, not from a rule. Nothing gets built in this phase.
Communication rules: [communication.md](../director/references/communication.md). Sizing an idea, cost
factors, and genre notes: [idea-filters.md](references/idea-filters.md).

Hats: Idea = Designer + Producer (Marketer as guest). Validation = Designer + Marketer (Engineer, Producer,
and Monetization as guests). Kickoff = Producer + Designer (Monetization as guest). Off-limits: see the Idea,
Validation, Kickoff rows in [phases-and-stages.md](../director/references/phases-and-stages.md).

## Stage: Idea
1. **Intake.** Ask at most three questions at a time, each with a suggested default:
   - Honest hours per week, and a target date (or none).
   - Monthly budget for AI tools, and which phone(s) the user owns for testing.
   - Which computer they build on (Windows, Mac, or Linux), and whether iOS matters for the first release.
     iOS builds are signed and uploaded from macOS, either on a Mac or through a cloud build service, and
     Apple charges a yearly fee: verify today's options and costs with `indie-studio:research` before planning
     both stores. Android-first is often the cheaper start; say so plainly if it applies.
   - What this game is for: money, learning, a portfolio piece, or a mix. If money, what "worth it" would look
     like in the first year, and whether there is any budget to pay for installs.
   - Games they love and play, and what they can do themselves (drawing, music, code, none).
   - Games they have shipped before, and how their estimates compared with reality. This sets `experience`
     if init did not, and the estimate correction in step 6.
   Write the answers into the Schedule section of STUDIO_STATE.md and the constraints part of `docs/PITCH.md`
   (copy `${CLAUDE_PLUGIN_ROOT}/templates/docs/PITCH.md` first).
2. **If the user already has an idea,** skip to step 4 and stress-test it. Do not replace it with your own.
3. **Generate 4-6 concepts** that fit the intake (idea-filters.md). For each: one sentence, the core verb,
   session length, how content is produced, the twist that makes it not a clone, the biggest risk, how it
   would earn, and a rough size in hours for a first release. Show the best 3-4, mark one as recommended, and
   say why. Do not drop a big idea: show its price and the cheaper version beside it.
4. **The human picks** (or combines). Write the one-sentence game and the core loop (action, goal, feedback)
   in `docs/PITCH.md`, and check it against the two rules in idea-filters.md.

## Stage: Validation
5. **Market and money check** (Marketer hat, Monetization as guest; `indie-studio:research`, sources logged in
   `studio/KNOWLEDGE.md`). Copy `${CLAUDE_PLUGIN_ROOT}/templates/docs/MARKET.md` to `docs/MARKET.md` and fill
   it: three to five comparable games, what each does well, how each earns (what it sells, where its ads
   appear), what keeps players coming back, what reviewers complain about, and any rough size signals such as
   download or revenue estimates (label them rough, with source and date). End with the gap this game fills in
   one sentence. A crowded category is not fatal; a category where nothing earns the way you plan to is a
   warning.
6. **Feasibility** (Producer with the Engineer as guest): list the skills the game needs, which the AI can
   cover, and which need the human. Estimate the first release roughly (for example, "12 levels at about 6
   hours each plus about 40 hours of systems"), then do the capacity math: hours per week x weeks available.
   Correct the estimates as the experience setting says (communication.md): 1.5 to 2 times for `new`, the
   human's own track record for `experienced`. Price every ambition from the cost table in idea-filters.md
   instead of refusing it. Check the build path to every target store from the human's own computer (see the
   intake), and the store account steps and fees that only they can do.
7. **Engine choice:** run `indie-studio:engine-selector`.
8. Adjust the concept if feasibility or the market check demands it. Say plainly what must move to a later
   release, and offer the cheaper version of anything that does not fit.

## Stage: Kickoff
9. **Business case** (`indie-studio:monetization`): copy
   `${CLAUDE_PLUGIN_ROOT}/templates/docs/BUSINESS_CASE.md` to `docs/BUSINESS_CASE.md` and fill it with the
   human: how the game earns, what it will sell or where ads appear, the numbers to aim for (researched for
   this genre, with source and date), how players will find the game, what it all costs, a low and a
   middle case in plain arithmetic, and the soft-launch plan. Be honest that most mobile games earn little:
   the plan has to survive the low case, or the project has to be worth it for other reasons.
10. **Scope tiers** in STUDIO_STATE.md: T1 is the **first release** (the smallest version that can show
    whether players stay and spend; at most about two thirds of available hours), T2 (should have), T3 (nice
    to have), plus a **post-launch roadmap** where the bigger ambitions wait. Add content targets as ranges
    (for example, 10-15 levels) and a short "not doing" list. Cutting order: T3, then T2, then content volume
    inside T1.
11. **Risks:** run a pre-mortem ("imagine this failed; why?") and fill `studio/RISKS.md`: the top five risks,
    kill or pivot criteria (both kinds: "if 3 of 5 outsiders are not keen to replay the prototype after two
    rounds" and the business-case numbers from the soft launch), and a time-box for the Prototype stage.
12. **Foundations:** set up version control with `indie-studio:git-workflow` (init mode: repo, remote backup,
    permission contract). Offer the CLAUDE.md block from `indie-studio:director`. Make sure STUDIO_STATE.md and
    `studio/` are current.
13. **Gate:** run `indie-studio:gate-review` for Conception Exit. On approval: tag `m0-kickoff`; set phase
    Pre-Production, stage Prototype, hats Engineer + Designer; refresh Off-limits and Next actions (first
    action: create the engine project and a `spike/core-loop` branch); recommend a fresh session.

## Rules for this phase
- The human chooses the idea and the size. You supply options, evidence, prices, and honest numbers.
- Never reject an idea for being ambitious. Price it, show the cheaper version, and show what fits in the
  first release.
- Do not let the concept grow while validating it. If a nice extra appears, park it (`indie-studio:scope-guard`).
- If the honest math does not fit the hours available, shrink the first release, not the estimates.
- Money plans stay tentative here: no SDKs, no store accounts, no spending yet.
- Explain terms as the experience setting says. Keep chat replies short; the long text goes in `docs/`.
