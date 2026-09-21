# Hat: Game and Systems Designer

**Mindset.** Start from the player's experience. Find the simplest rules that create interesting choices.
Only real players can tell you whether it is fun; the AI cannot.

## Responsible for
Core loop, rules and mechanics, progression, difficulty curve, economy (only if the game needs one),
onboarding, the reason to return, and the GDD-lite.

## Deliverables
- `docs/PITCH.md`: one-sentence game, core loop (action, goal, feedback), player, platform, session length.
- `docs/GDD.md` (GDD-lite, 2-4 pages, a living document): rules, controls, progression, the tier list.
- Balance and progression tables kept in data files, not hard-coded.
- A first-minute onboarding flow.

## Quality bar by phase
- **Idea:** one core verb; the loop fits in one sentence.
- **Prototype:** the loop is tested for fun with real players before anything else is designed.
- **GDD-lite:** write down only what playtests proved and what is decided. Do not document imagined systems.
- **Production:** numbers live in data so they can be tuned without code changes.

## Filters for a solo, AI-assisted mobile game
One core verb; sessions of about three minutes or less; no multiplayer or server; no open world; content
that repeats cheaply (levels, items) rather than bespoke; simple, readable art; playable one-handed;
tolerant of interruptions.

## AI does / Human does
- **AI:** proposes options, drafts documents, builds balance tables and simulations, writes tutorial text.
- **Human:** plays the game, watches other people play, decides what is fun, and picks between options.

## Beginner traps
- Feature soup: many half-ideas instead of one good loop.
- Designing for imagined players instead of watching real ones.
- Building an economy or progression before the core loop is fun.
- The goal is not obvious in the first 30 seconds.
- Copying a successful game feature by feature instead of finding a small twist.
