# <Working title>: balance

For games whose challenge comes from rules and numbers rather than hand-made levels: score targets, random
deals, drops, or spawns, upgrades that stack, runs, waves, idle growth. Started from the prototype's simulation,
written at the GDD stage with the Designer hat (the Engineer builds the simulator), and kept current: every
balance change updates this file and re-runs the simulator. Method: `indie-studio:preproduction`
(`references/systems-design.md`). Hand-made levels are planned in `docs/LEVELS.md`; a game with both uses both.

## 1. Loops and what carries them
- Round: <action, goal, feedback, reason to go again>
- Run or session: <how rounds chain, and how a run ends>
- Return: <the features that carry D1, D7, and D30 (`docs/BUSINESS_CASE.md`, Targets, "Carried by")>
- Genre contract: `docs/MARKET.md`

## 2. Power against targets
| Source of power | Kind | Adds or multiplies | Typical size | How often offered |
|---|---|---|---|---|

| Round | Target | Threats | Average build power (measured) | Target divided by average power |
|---|---|---|---|---|

## 3. Difficulty plan (measured by the reference bot)
- Reference bot: <the careful bot: what it sees, how it chooses>   Seeds: <which set, how many games>
- Curve: <for example: teaching rounds, a rise, a spike at each boss, then relief>

| Round | Careful bot pass rate: target | Measured | Random bot pass rate | Skill share (careful minus random) |
|---|---|---|---|---|

| Difficulty level | Run win rate for the careful bot: target | Measured |
|---|---|---|

- People against the bot: <what playtesters reached compared with the bot, and what was adjusted>

## 4. Luck against skill
- Skill share target at the hard rounds: <a starting guess, tuned with playtests>
- Ceiling from a solver that sees everything: <share of deals winnable>. A ceiling, not a fairness check.
- Counterplay against bad luck: <information, rerolls, choices>

## 5. Choice health
| Pick or picking style | How often picked | Run win rate | Change against not picking it | Verdict (fine / dominant / dead) |
|---|---|---|---|---|

## 6. Economy links
<Currencies, sources, and sinks live in `docs/ECONOMY.md`. Here: sessions until each unlock for a typical and a
heavy player, from the simulator.>

## 7. Simulator and checks
- Rules: <the rules library, `docs/TECH.md` section 2>   Simulator: <where it lives, how to run it>
- Checked against the game: <a recorded game replayed with the same result, and the date>
- Automated balance checks (fixed seeds, run in CI): <for example: the careful bot passes round 4 in 75-85% of
  games>

## 8. Change log
| Date | Change | Why (which number) | Result |
|---|---|---|---|
