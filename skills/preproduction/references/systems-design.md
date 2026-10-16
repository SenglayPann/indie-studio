# Systems design: loops, numbers, luck, and choices

The Designer's toolkit for the rules and numbers of a game. Load it at the Idea stage for the loops, before the
first outsider playtest for the numbers, and at the GDD stage for `docs/BALANCE.md`
(`${CLAUDE_PLUGIN_ROOT}/templates/docs/BALANCE.md`). Players still decide what is fun
(`indie-studio:playtest-loop`); this file makes sure they judge the design, not first-guess numbers.

## 1. Two loops, and what carries each
- **The round loop** (seconds to minutes): action, goal, feedback, and the reason to go again. It is the core
  loop in the pitch.
- **The return loop** (days and weeks): why a player opens the game tomorrow and next week. Common carriers:
  progress that carries over (unlocks, a collection, a harder ladder), a daily or weekly challenge, a goal that
  takes several sessions, a streak, other players' scores, and new content on a schedule.
- **Every retention target needs a carrier.** For D1, D7, and D30, name the feature that carries it and check
  that the feature is in the first release (`docs/BUSINESS_CASE.md`, Targets, "Carried by"). A target with no
  carrier is a wish: add a carrier, or lower the target.
- **The genre contract.** A genre label is a promise. A roguelite promises runs that differ and progress that
  carries over between runs; a level-based puzzle promises a long map of levels; an idle game promises growth
  while the player is away. List what players of the genre expect (`docs/MARKET.md`) and check that the first
  release keeps each promise, or say why not.

## 2. Power against targets
**Power** is anything that raises the player's score or strength: upgrades, charms, combos, gear. A **target**
is anything the player must beat: a score target, enemy health, a level goal.
1. List every source of power and how it combines. Sources of the same kind should add (+50% and +50% make
   +100%); sources of different kinds multiply. When everything multiplies with everything, a few picks run
   away with the game.
2. Set the targets from the power of an **average build** at each round, measured in the simulator, not
   guessed. If power grows by multiplying, the targets must grow the same way, steeply, round after round;
   otherwise late rounds become trivial for strong builds and impossible for weak ones. Look at how a
   comparable game actually scales before choosing a curve (`indie-studio:research`).
3. Write the curve you want first, as pass rates for the reference bot (section 5): for example, easy
   teaching rounds, a rise, a spike at each boss round, then relief. Then let the simulator find the numbers
   that produce it.
4. Rare power spikes are fun; common ones are the balance. Keep the one or two picks that truly multiply rare.
5. **Size bonuses as fixed amounts, not as a share of the target.** When targets are calibrated from what builds
   score, a bonus that grows with the target feeds back into the very targets it is meant to beat. A cost that
   grows with the target is safe.
6. **Re-calibrate the targets after every change to power, then judge the change.** Measured at the old targets,
   multipliers look weak and flat bonuses strong; once the targets are re-calibrated, multipliers raise them and
   flat bonuses fall behind.

## 3. Luck against skill
Randomness (deals, draws, drops, spawns) keeps runs fresh. Too much of it makes choices meaningless. Below, a
**deal** means one random setup of a round, whatever the game draws: a card deal, a board, a map, a wave of
enemies, a set of drops.
- **Measure it** with two bots on the same seeds: a **careful** bot that plays sensibly using only what a
  player can see, and a **random** bot that makes any legal move. The difference between their pass rates is
  the **skill share**: how much playing well matters. A small share means luck decides; a very large one can
  mean the game is harsh on beginners.
- **A solver shows the ceiling, not fairness.** A solver that sees everything (face-down cards, the next
  draws) shows what could be won with perfect knowledge. "Every deal is winnable", checked by such a solver,
  can pass nearly every random deal and still feel like a coin flip, because the luck players feel comes from
  what is hidden. Judge fairness with the careful bot, which sees only what the player sees.
- **Set a target** for the skill share at the hard rounds (a starting guess, tuned with playtests), and give
  the player counterplay against bad luck: information (show what comes next), a reroll, or a choice of what to
  keep.
- **Measure the spread between deals, not only the average.** Players feel luck as "randomly too easy or too
  hard". Give each deal a pass chance for a person-like bot (the careful bot with some mistakes, many replays of
  the same deal), then report the 10th, 50th, and 90th percentile, the share of hopeless deals (under about
  10%), and the share of sure ones (over about 95%). The average and the skill share can look fine while the
  spread is not.
- **Goals the curve allows.** If a round is passed p of the time on average, at most (1 - p) / (1 - u) of its
  deals can have a pass chance in a band whose top is u, and at most p / l in a band whose bottom is l. With a
  25-75% band and p = 0.9, that is at most 40% of deals. Check a spread goal against this before chasing it.
- **Floors and ceilings.** A floor that re-deals hopeless deals must judge the deal together with the player's
  current build (their upgrades); judged on the content alone, it barely helps. A ceiling that re-deals easy
  deals for a strong build punishes good picks.
- **Reading a person's run.** For a run with a known seed, place the person's result among many random plays of
  that exact deal (a percentile) and against the careful bot. Both bots failing points to a near-impossible
  deal; a result below almost every random play points to missed plays. Label it "hard deal", "missed plays", or
  "fine" (the creator pass in `indie-studio:playtest-loop`).

## 4. Choice health
Every choice the game offers (a pick of upgrades, a route, a build) should be a real decision.
- **No dominant pick.** If one option, or one way of picking, wins most runs whatever else happens, it is not a
  choice. Compare run win rates by pick and by picking style (for example "always take multipliers" against
  "always take utility").
- **No dead pick.** An option that changes the result by a few percent is a trap. Strengthen it, give it a
  job, or cut it.
- **Every counter has something to counter.** An answer to a threat (a key for locked cards, a cleanse for
  curses) is worth picking only if the threat really hurts when left unanswered.
- **Show what the choice needs.** The pick screen shows what the player needs to choose well, such as the next
  round's target and threats.
- **Find the best fixed way of picking.** Comparing a few hand-written styles is not enough. Search for the best
  fixed priority list (start from a sensible order, swap neighbours, keep any swap that wins more runs), and
  compare it with a **reader**: a picker that sees only what the player sees and decides each pick from the run
  so far (by playing out unseen deals). If the list does as well as the reader, picking is solved by memorising
  a list. Fit the creator's own picks to a list too.
- **Measure a dead option two ways:** how much never taking it changes run wins for random pickers, and how
  often it is the best option on offer. "Owned from round 2" can hide a trap.
- **Judge picks on unseen deals.** Ranking a player's picks in hindsight on the deal they played shows luck,
  not decision quality.
- **When "no best list" is reachable.** While a run picks a large share of the pool (picks divided by pool size
  above about 0.5), a good fixed order exists whatever the numbers. Depth then comes from a bigger pool,
  options that reward building around them, and run variety the player can see ahead (the next boss announced
  a round early). Set the "reading the run beats any list" goal for the full content, not a prototype's pool.
- **Depth must not cost newcomers.** An option that silently cancels another is a trap for newcomers and lists
  alike, not depth. Count a change as depth only if random pickers who never take the new option are not worse
  off.
- **Growing the pool** (adding upgrades, cards, or items to a tuned set). When the player picks from offers drawn
  from a pool, the pool's size is a difficulty setting: more items make each strong combination rarer, so
  adding average items can lower run wins for every kind of player while every per-item check still passes.
  Before sizing new items, measure the whole game with the full pool (the calibration player, a fixed-list
  player, and a reader, at every difficulty level) against the old pool, and decide with the human whether the
  new items must hold the old power (sized near the strongest) or the difficulty is re-tuned for players who
  own the full collection. Measure players who never own the new items too.
- **Measuring partners** (for "works well with" hints). Raw results for a pair mostly show strength: on run
  wins most pairs of decent options look like partners, and on win odds most look redundant. Instead, hand the
  pair over at a fixed point in the run with the other picks kept off it; compare each pair with the same two
  options' pairs with all the others (subtract each option's own average effect from its row and column); work
  on the log odds of winning, with ranges from resampling the runs; repeat on a second set of seeds and keep
  only pairs that clear the borderline ones in both. Report each strong pair with a reason a player would see.
  An option that helps everything is not everyone's partner.

## 5. Simulation
The cheapest balance tool for any game with score targets, random content, or upgrades that stack.
1. **Rules that run without the engine.** Bots need the rules (scoring, dealing, targets, upgrades, economy
   math) as plain code that plays thousands of games in seconds. In the Prototype, a quick script that replays
   the spike's rules is enough. Prove it matches the build: best, run a fixed bot on fixed seeds inside the
   engine with the build's own code and compare the results with the simulator's, game by game (easier and
   stronger than replaying a game recorded on a phone); at the least, replay one recorded game (same seed, same
   result). From the Vertical Slice, the rules live in one library used by the game, the tests, and the bots
   (`docs/TECH.md`, section 2), so the simulator can never drift away from the game.
2. **Two bots, then trust.** The random bot is the baseline. The careful bot must beat it across many seeds
   before any of its numbers are trusted; on a single deal either one can win.
3. **Enough games.** Fixed seeds, so every result can be repeated. A thousand games measure a pass rate to
   about plus or minus 3 percentage points, ten thousand to about 1. A handful of runs proves nothing.
4. **Report:** the pass rate per round or level for both bots, the skill share, average power against the
   target per round, the run win rate by picking style and by difficulty level, and the win rate with and
   without each pick.
5. **Then people.** Bots cannot feel clarity, tension, or fun, and people play differently: they miss moves
   and take risks. Compare the bot's pass rates with what playtesters reached, read each known seed as in
   section 3 ("Reading a person's run"), and move the targets to fit the people, not the other way round.
6. **Checks that stay.** From the Vertical Slice, the key balance targets run as automated tests on fixed
   seeds (for example "the careful bot passes round 4 in 75-85% of games"), so a change that breaks the curve
   fails CI (`indie-studio:toolchain`). A check that fails the day it is built is a finding, not a broken
   tool: keep the goal, measure candidate fixes with the tool, record the numbers in `docs/BALANCE.md`, and let
   the human choose. Never loosen a goal to make a check pass.

## 6. The economy (with `indie-studio:monetization`)
- For each currency: every source and sink, the earn rate per session, and what it is **for**: progress,
  cosmetics, convenience, or power. Power that can be bought with money needs a fairness check against the
  promises in the business case.
- A lost run should still move the player forward a little, or losing feels like wasted time.
- Run the economy through the simulator too: how many sessions until each unlock, for a typical player and a
  heavy one.

The plan itself lives in `docs/ECONOMY.md`.

## 7. When to use what
| Stage | Do |
|---|---|
| Idea, Validation | Name each concept's round loop, return loop, and genre contract |
| Kickoff | Each retention target carried by a first-release feature; the genre contract checked against the first release |
| Prototype | Before outsiders play: simulate the spike and fix the obvious faults (runaway stacking, coin-flip rounds, dead or dominant picks) |
| GDD | `docs/BALANCE.md`: the loops, power against targets, the difficulty plan, the skill share, choice health |
| Vertical Slice | One rules library shared by the game, the tests, and the bots; balance targets as automated checks |
| Production and after | Re-run the simulator after every balance change and every time a pool of picks grows (section 4); compare with playtests and, after launch, with analytics |

## Beginner traps
Tuning by feel from your own runs; trusting one bot on one deal; treating a solver's "winnable" as "fair";
targets that grow by adding while power multiplies; answers to threats that never bite; a second copy of the
rules in another language, drifting away from the game; a reason to return that the business case promises
and the first release does not contain; judging luck by the average alone; never searching for the best fixed
pick order; adding items to a pool without re-measuring the whole game; calling two strong items partners.
