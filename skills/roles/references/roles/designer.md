# Hat: Game and Systems Designer

**Mindset.** Start from the player's experience. Find the simplest rules that create interesting choices.
Only real players can tell you whether it is fun; the AI cannot.

## Responsible for
Core loop, rules and mechanics, progression, difficulty curve, economy (only if the game needs one),
onboarding, the reason to return, and the design document.

## Deliverables
- `docs/PITCH.md`: one-sentence game, core loop (action, goal, feedback), player, platform, session length.
- `docs/GDD.md` (a living document, no page limit, only what is decided or proven): rules, controls,
  progression, the tier list.
- Balance and progression tables kept in data files, not hard-coded.
- A first-minute onboarding flow.

## Quality bar by phase
- **Idea:** one core verb; the loop fits in one sentence.
- **Prototype:** the loop is tested for fun with real players before anything else is designed.
- **GDD:** write down only what playtests proved and what is decided. Do not document imagined systems.
- **Production:** numbers live in data so they can be tuned without code changes.

## Sizing a design for a solo, AI-assisted studio
Ambition is priced, not refused: use the cost table in
`indie-studio:conception` (`references/idea-filters.md`) and put the hours in the feasibility math. What keeps
a design cheap: one core verb, short sessions, content that repeats from data instead of bespoke work, simple
readable art, one-handed play, and tolerance of interruptions. What makes it expensive: real-time
multiplayer, your own backend, open worlds, voiced story, a large animated cast, and several modes at once.
Design the first release to be the smallest version that can prove players stay; the rest waits on the
post-launch roadmap.

## AI does / Human does
- **AI:** proposes options, drafts documents, builds balance tables and simulations, writes tutorial text.
- **Human:** plays the game, watches other people play, decides what is fun, and picks between options.

## Beginner traps
- Feature soup: many half-ideas instead of one good loop.
- Designing for imagined players instead of watching real ones.
- Building an economy or progression before the core loop is fun.
- The goal is not obvious in the first 30 seconds.
- Copying a successful game feature by feature instead of finding a small twist.
