# <Working title>: game design

A living document. Write only what is proven by playtests or decided; if a section is unknown, write "open
question" instead of inventing it. There is no page limit, but there is a rule: every line is a decision
someone made, not a wish. Update it when the game changes.

Keep separate documents for the things that grow on their own: money and the economy in `docs/ECONOMY.md`,
the market in `docs/MARKET.md`, the look in `docs/STYLE_BIBLE.md`. Anything an agent has to read in full
belongs in a file of its own, so a session only loads what it needs.

## 1. The game in one paragraph
<One-sentence game from the pitch, plus what a typical session feels like.>

## 2. Core loop and controls
- Loop: <action, goal, feedback, reason to go again>
- Controls: <touch gestures and what each does; one-handed?>
- Session length: <...>

## 3. Rules
<The rules a player must understand: what scores, what loses, special pieces or powers. A short table works.>

## 4. Progression and difficulty
- How levels or rounds are ordered: <...>
- Difficulty curve: <what changes and when>
- Unlocks or rewards: <...>
- Numbers live in: <data file path>
- Level-by-level detail (building blocks, difficulty bands, the level list): `docs/LEVELS.md`

## 5. Content plan
| Content type | Count target | Made from | Time per unit (measured at the slice) |
|---|---|---|---|
| Levels | | template + data | |

## 6. UI flow
<Screens and how the player moves between them: start > play > result > menu; settings; pause.>

## 7. Look, sound, and story (summary; details in the style bible)
<Art style in two sentences; audio mood in one; the setting and main characters in one, if any; the writing
voice in a few words.>

## 8. Technical summary (the rulebook is `docs/TECH.md`)
- Engine and version: <...>   Target devices and minimum spec: <...>   Orientation: <...>
- Anything the design needs from the tech (offline play, cloud save, live events): <...>

## 9. Money
<One paragraph: the model from `docs/BUSINESS_CASE.md`. The detail lives in `docs/ECONOMY.md`. No SDK work
before Pre-Alpha.>

## 10. Scope tiers (mirror of STUDIO_STATE.md)
- T1 (first release): <...>   T2: <...>   T3: <...>
- Post-launch roadmap: <...>   Not doing: <...>

## 11. Open questions
- <...>
