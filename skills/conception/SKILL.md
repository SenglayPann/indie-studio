---
name: conception
description: Phase 1 of an Indie Studio project. Use when the project is in Conception (stage Idea, Validation, or Kickoff), when the user has no game idea yet, wants to pick, refine, or stress-test a concept, or asks whether an existing prototype or earlier project is worth continuing, and to study the market and what comparable games earn, judge feasibility and cost, decide how the game will make money, define the scope tiers and the first release, list risks, or write the pitch and the business case. Runs intake, idea generation with fit and hook scores, the market and money check, feasibility math, engine choice, business case, scope tiers, pre-mortem, and the Conception Exit gate.
---

# Phase 1: Conception

**Goal:** end with a clearly described game, an honest business case, and numbers the human can plan from.
The size of the game comes from the evidence, not from a rule. Nothing that ships gets built in this phase:
throwaway sketches (step 5) are the only code, and they are never reused.
Communication rules: [communication.md](../director/references/communication.md). Scoring and sizing an idea,
cost factors, genre notes, and builds that already exist: [idea-filters.md](references/idea-filters.md).

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
     if init did not, and the estimate correction in step 8.
   Write the hours and the target date into the Schedule section of STUDIO_STATE.md (their only home) and the
   other answers into the constraints part of `docs/PITCH.md` (copy
   `${CLAUDE_PLUGIN_ROOT}/templates/docs/PITCH.md` first).
2. **If the user already has an idea,** score it with both tables in idea-filters.md (fit and hook), stress-test
   it, then go to step 6. Their idea stays the baseline: if the scores call for it, put named, priced pivots
   beside it, but never replace it with your own.
3. **If the user already has a build** (a prototype or an earlier project), judge what it is worth before
   planning around it, with "Salvage and pivot" in idea-filters.md: the parts worth keeping, both scores for the
   build as it stands, two or three priced pivots beside the human's own plan, and a time-boxed test with a kill
   rule for any pivot they choose. Sunk cost is not a reason to continue; the parts that work are.
4. **Generate 4-6 concepts** that fit the intake (idea-filters.md). For each: one sentence, the audience (who,
   and what they play now), the core verb, session length, the reason to come back tomorrow, how content is
   produced, the twist that makes it not a clone, the biggest risk, how it would earn, and a rough size in hours
   for a first release. Score each with both tables in idea-filters.md: **fit** (can it be built, and can it
   earn) and **hook** (will players want it and tell others). Show the best 3-4 with both scores, mark one as
   recommended, and say why. Do not drop a big idea: show its price and the cheaper version beside it.
5. **Throwaway sketches (optional).** When feel would decide between concepts, or the human asks to play them,
   build one small playable sketch per concept (for example a single HTML page, about an hour each) outside the
   game's repository (a sibling folder, or a page the human can open), labelled throwaway. Never reuse their
   code: the real prototype starts after Conception Exit (the sketch note in
   [phases-and-stages.md](../director/references/phases-and-stages.md)).
6. **The human picks** (or combines). Write the one-sentence game, the core loop (action, goal, feedback),
   the reason to come back tomorrow, and the hook in `docs/PITCH.md`, and check it against the two rules in
   idea-filters.md.

## Stage: Validation
7. **Market and money check** (Marketer hat, Monetization as guest; `indie-studio:research`, sources logged in
   `studio/KNOWLEDGE.md`). Copy `${CLAUDE_PLUGIN_ROOT}/templates/docs/MARKET.md` to `docs/MARKET.md` and fill
   it: three to five comparable games, what each does well, how each earns (what it sells, where its ads
   appear), what keeps players coming back, what reviewers complain about, and any rough size signals such as
   download or revenue estimates (label them rough, with source and date). End with the gap this game fills in
   one sentence, and the **genre contract**: what players of this genre expect from any game wearing its label
   (for a roguelite, for example, progress that carries over between runs). A crowded category is not fatal; a
   category where nothing earns the way you plan to is a warning.
8. **Feasibility** (Producer with the Engineer as guest): copy
   `${CLAUDE_PLUGIN_ROOT}/templates/docs/FEASIBILITY.md` to `docs/FEASIBILITY.md`. List the skills the game
   needs, which the AI can cover, and which need the human. Estimate every part in three columns, as the
   producer role file describes ([producer.md](../roles/references/roles/producer.md), "Estimating in three
   columns"): the AI's build time, the human's hands-on hours (playing, reviewing, testing, store tasks,
   recruiting testers, decisions), and the calendar waits (store reviews, required tests, identity checks).
   Correct only the human's column, as the experience setting says (communication.md), and do the capacity
   math on it: their real hours per week x weeks available. Price every ambition from the cost table in
   idea-filters.md instead of refusing it. Check the build path to every target store from the human's own
   computer (see the intake), and the store account steps, fees, and waits that only they can do.
9. **Engine choice:** run `indie-studio:engine-selector`.
10. Adjust the concept if feasibility or the market check demands it. Say plainly what must move to a later
    release, and offer the cheaper version of anything that does not fit.

## Stage: Kickoff
11. **Business case** (`indie-studio:monetization`): copy
    `${CLAUDE_PLUGIN_ROOT}/templates/docs/BUSINESS_CASE.md` to `docs/BUSINESS_CASE.md` and fill it with the
    human: how the game earns, what it will sell or where ads appear, the numbers to aim for (researched for
    this genre, with source and date) and the feature that carries each one, how players will find the game,
    which languages the store page and the game need and when (from the market check), what it all costs, a
    low and a middle case in plain arithmetic, and the soft-launch plan. Be honest that most mobile games earn
    little: the plan has to survive the low case, or the project has to be worth it for other reasons.
12. **Scope tiers** in STUDIO_STATE.md, the only copy of the scope (the pitch, the GDD, and the business case
    link to it instead of repeating it). T1 (must have), T2 (should have), and T3 (nice to have) set the
    **build and cutting order**: T1 is built first and cut last; cut T3 first, then T2, then content volume
    inside T1. Add content targets as ranges (for example, 10-15 levels), a **post-launch roadmap** where the
    bigger ambitions wait, and a short "not doing" list. List every **screen** in `docs/PITCH.md` (Screens),
    one line each with its tier, and write down any screen left out (for example leaderboards) with the reason.
13. **The first release.** The human chooses what it includes: T1, T1-T2, or T1-T3 (T1 unless they choose
    otherwise). How big it should be depends on the route to players (idea-filters.md, rule 2), and the choice
    must pass the capacity rule: the first release fits when the human's corrected hands-on hours for
    everything it includes, plus the protected polish buffer, fit in the weeks before the target date at their
    real weekly hours, with every wait that cannot run alongside the work (such as the final store review)
    added as weeks. With no target date, the same sum sets the Planned dates instead. Then **check what it
    carries**: every retention target in the business case names a first-release feature in its "Carried by"
    column, and every line of the genre contract in `docs/MARKET.md` is kept or has a written reason. If not,
    bring the feature in or lower the target, and record the choice in `studio/DECISIONS.md`.
14. **Planned dates:** split the human's corrected hours by stage, divide by their real weekly hours, add the
    waits that cannot run alongside the work, keep the polish buffer before Gold Master and the soft launch's
    length before Global Launch, and write a Planned date (and the same Forecast) for every gate in the Gates
    table.
15. **Risks:** run a pre-mortem ("imagine this failed; why?") and fill `studio/RISKS.md`: the top five risks,
    kill or pivot criteria (both kinds: "if 3 of 5 outsiders are not keen to replay the prototype after two
    rounds" and the business-case numbers from the soft launch), and a time-box for the Prototype stage.
16. **Foundations:** set up version control with `indie-studio:git-workflow` (init mode: repo, remote backup,
    permission contract). Offer the CLAUDE.md block from `indie-studio:director`. Search the stores and the
    trademark databases for the working title (`indie-studio:research`); if it is taken, change it now, before
    anything is built around it. Make sure STUDIO_STATE.md and `studio/` are current.
17. **Gate:** run `indie-studio:gate-review` for Conception Exit. On approval: tag `m0-kickoff`; set phase
    Pre-Production, stage Prototype, hats Engineer + Designer; refresh Off-limits and Next actions (first
    action: create the empty engine project on `chore/<engine>-project` and merge it into `develop`, then
    branch `spike/core-loop` from `develop`); recommend a fresh session.

## Rules for this phase
- The human chooses the idea and the size. You supply options, evidence, prices, and honest numbers.
- Never reject an idea for being ambitious. Price it, show the cheaper version, and show what fits in the
  first release.
- Do not let the concept grow while validating it. If a nice extra appears, park it (`indie-studio:scope-guard`).
- If the honest math does not fit the hours available, shrink the first release, not the estimates.
- Money plans stay tentative here: no SDKs, no store accounts, no spending yet.
- Explain terms as the experience setting says. Keep chat replies short; the long text goes in `docs/`.
