# Idea filters for a solo, AI-assisted mobile developer

An idea must pass the hard filters and should score well on the soft ones. These are rules of thumb
drawn from how solo projects fail, not laws. Say so when an idea breaks one and the human still wants it.

## Hard filters (an idea that fails one needs a rewrite)
1. **One core verb.** The player mostly does one thing: tap, swipe, drag, match, aim, merge, stack.
2. **The loop fits in one sentence** (action, goal, feedback) and can be understood in under a minute.
3. **Short sessions.** A satisfying round takes about three minutes or less.
4. **No server.** No multiplayer, no accounts, no live backend, no real-time networking.
5. **Cheap, repeatable content.** More content comes from data or a template (levels, items, puzzles), not from
   bespoke hand-built scenes or long story scripting.
6. **Achievable art.** A simple, consistent style (flat shapes, pixel art, icons, silhouettes) that AI tools and a
   beginner can keep consistent. No realistic characters, no cinematic cutscenes.
7. **Playable one-handed** in portrait (or one clearly chosen orientation).
8. **Fits the hours.** T1 can be built in at most about two thirds of the available hours.

## Soft filters (score 0-2 each; prefer 10 or more of 16)
| Question | 0 | 1 | 2 |
|---|---|---|---|
| Is it fun in its ugliest form (grey boxes)? | unlikely | maybe | very likely |
| Is there a small twist that is not a clone? | none | slight | clear |
| Do interruptions hurt (phone call mid-play)? | badly | somewhat | not at all |
| Can content scale by data? | no | partly | yes |
| Does the player have a reason to return? | none | weak | strong |
| Can the AI handle most of the code? | doubtful | probably | yes |
| Is the market gap visible? | no | maybe | yes |
| Can outsiders playtest it in 5 minutes? | no | maybe | yes |

## Genres that tend to suit this profile
Match and merge puzzles; one-touch arcade and endless runners; stacking, aiming, and physics toys; simple
tower defense with a few unit types; idle or incremental games (watch the balance work); word and number
puzzles; small roguelite or card games (content-heavy, so keep the card count small).

## Genres and features to avoid on a first project
MMOs, PvP or any online multiplayer; open worlds; large crafting or inventory systems; story-heavy games with
voice acting; realistic 3D; live-service games that need constant new content; games that need social graphs
or user-generated content moderation.

## Idea generation prompts
- Start from a very simple loop the user already enjoys, then change one rule (a different goal, a
  constraint, a new input).
- Combine two tiny loops (for example, matching plus growing a garden).
- Take a physical toy or a small daily activity and make it a one-verb game.
- Ask: "What frustrates you in the games you play? Could a small game fix that?"
- Avoid pure clones. A clone with no twist has no reason for anyone to choose it.

## Rough content-cost heuristics (calibrate with real data at the Vertical Slice)
A first level or unit takes many times longer than later ones because tools and templates get built; expect
later ones to cost roughly a third to a half of the first, once a template exists. Never plan from the
first-level cost or from the best case.
