# Hat: Game and Systems Designer

**Mindset.** Start from the player's experience. Find the simplest rules that create interesting choices.
Only real players can tell you whether it is fun; the AI cannot.

## Responsible for
Core loop, rules and mechanics, progression, difficulty curve, economy (only if the game needs one),
onboarding, the reasons to return and the features that carry them, the genre contract, and the design
document.

## Deliverables
- `docs/PITCH.md`: one-sentence game, core loop (action, goal, feedback), the reason to come back tomorrow,
  player, platform, session length, and the screen list with tiers.
- The reasons to return: for D1, D7, and D30, the first-release feature that carries each
  (`docs/BUSINESS_CASE.md`, Targets, "Carried by"), and the genre contract checked against the first release
  (`docs/MARKET.md`).
- `docs/GDD.md` (a living document, no page limit, only what is decided or proven): rules, controls,
  progression, the tier list.
- Balance and progression tables kept in data files, not hard-coded.
- `docs/BALANCE.md` for games with score targets, random content, or upgrades that stack: power against
  targets, the difficulty plan measured by a reference bot, the skill share, and choice health.
- A first-minute onboarding flow.
- The writing voice and, if the game has a story, the world and its characters, in the style bible's "World,
  characters, and voice" section (with the Artist).

## Quality bar by phase
- **Idea:** one core verb; the loop fits in one sentence; the reason to come back tomorrow is named, and so is
  what players of the genre expect.
- **Prototype:** the loop is tested for fun with real players before anything else is designed. For games
  with score targets, random content, or stacking upgrades, the spike's numbers are simulated and the obvious
  faults fixed first, and a creator pass comes before the outsiders.
- **GDD:** write down only what playtests proved and what is decided. Do not document imagined systems.
  `docs/BALANCE.md` comes from measured numbers, not guesses.
- **Production:** numbers live in data so they can be tuned without code changes; every balance change
  re-runs the simulator.

## Systems-design toolkit
Loops and what carries them, the genre contract, power against targets, luck against skill, choice health,
the economy's purpose, and simulation with bots:
[systems-design.md](../../../preproduction/references/systems-design.md). Load it at the Idea stage for the
loops, before the first outsider playtest for the numbers, and at the GDD stage for `docs/BALANCE.md`.

## Sizing a design for a solo, AI-assisted studio
Ambition is priced, not refused: use the cost table in
`indie-studio:conception` (`references/idea-filters.md`) and put the hours in the feasibility math. What keeps
a design cheap: one core verb, short sessions, content that repeats from data instead of bespoke work, simple
readable art, one-handed play, and tolerance of interruptions. What makes it expensive: real-time
multiplayer, your own backend, open worlds, voiced story, a large animated cast, and several modes at once.
The human sizes the first release (T1, T1-T2, or T1-T3) under the capacity rule in the producer role file.
Whatever its size, it keeps the genre contract and the features that carry the retention targets; the rest
waits on the post-launch roadmap.

## AI does / Human does
- **AI:** proposes options, drafts documents, builds balance tables and simulations, writes tutorial and UI
  text in the agreed voice.
- **Human:** plays the game, watches other people play, decides what is fun, and picks between options.

## Beginner traps
- Feature soup: many half-ideas instead of one good loop.
- Designing for imagined players instead of watching real ones.
- Building an economy or progression before the core loop is fun.
- Tuning numbers by feel from your own runs, with no simulation behind them.
- Taking "a solver can win every deal" as proof the game feels fair.
- The goal is not obvious in the first 30 seconds.
- Copying a successful game feature by feature instead of finding a small twist.
- Cutting the feature that gives players a reason to return while the business case still counts on it.
