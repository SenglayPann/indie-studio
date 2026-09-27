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

## 3. Luck against skill
Randomness (deals, draws, drops, spawns) keeps runs fresh. Too much of it makes choices meaningless.
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

## 5. Simulation
The cheapest balance tool for any game with score targets, random content, or upgrades that stack.
1. **Rules that run without the engine.** Bots need the rules (scoring, dealing, targets, upgrades, economy
   math) as plain code that plays thousands of games in seconds. In the Prototype, a quick script that replays
   the spike's rules is enough; prove it matches the build by replaying one recorded game (same seed, same
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
   and take risks. Compare the bot's pass rates with what playtesters reached, and move the targets to fit the
   people, not the other way round.
6. **Checks that stay.** From the Vertical Slice, the key balance targets run as automated tests on fixed
   seeds (for example "the careful bot passes round 4 in 75-85% of games"), so a change that breaks the curve
   fails CI (`indie-studio:toolchain`).

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
| Production and after | Re-run the simulator after every balance change; compare with playtests and, after launch, with analytics |

## Beginner traps
Tuning by feel from your own runs; trusting one bot on one deal; treating a solver's "winnable" as "fair";
targets that grow by adding while power multiplies; answers to threats that never bite; a second copy of the
rules in another language, drifting away from the game; a reason to return that the business case promises
and the first release does not contain.
