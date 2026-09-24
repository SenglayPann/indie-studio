# <Working title>: level design

For games built from levels, stages, waves, missions, or puzzles. The GDD says what the game is; this file says
how every level is made, how hard each one should be, and whether it is. Started at the GDD stage with the
Level Designer hat, proven by the Vertical Slice, and kept current through Live Ops. Level data lives in data
files; this document is the plan and the record, not the data.

## 1. Building blocks
Every element a level can contain, and where the player first meets it.

| Element | What it does | First appears | How it is taught | Combines with |
|---|---|---|---|---|
| <obstacle, piece, enemy, hazard> | | <level ID> | <a safe first encounter, without text if possible> | |

One new element at a time: teach it safely, let the player practise it, then test it in combination.

## 2. Template and rules
- Size and layout limits: <grid size, screens, or arena>   Target length: <seconds or moves per attempt>
- Fairness: every level can be won without paying; luck never decides it alone; a fail explains itself.
- Readability: the goal is visible in the first second; nothing important under a thumb, a notch, or a banner.
- Data format and IDs: <one file per level, or a table>. IDs like `<world>-<nn>` are never reused, because
  analytics and remote settings depend on them.
- How a level is made: <by hand in the editor / written as data by Claude / generated, then curated>.

## 3. Level checklist (every level passes before it ships)
- [ ] Loads and passes the automated data check (valid IDs, reachable goal, no overlapping objects)
- [ ] Proven winnable: an automated solver or bot clear where the genre allows, otherwise a recorded human clear
- [ ] Teaches or tests what its row in the level list says, and nothing unplanned
- [ ] Played on the smallest target phone
- [ ] Difficulty inside its band after playtests (and, after launch, in the data)

## 4. Difficulty plan
- Measured by: <first-attempt win rate / average attempts / completion time>, from the `level_start` and
  `level_end` events in `docs/ECONOMY.md`.
- Curve shape: <for example a sawtooth: a few easier levels, a rise, a hard level, then relief, with a bigger
  spike every <n> levels>.

| Band | Target (researched for the genre, with source and date) | Used for |
|---|---|---|
| Easy | | Teaching levels and the whole first session |
| Medium | | Most levels |
| Hard | | Spike levels |

- First session: the first <n> levels are Easy. Nobody should fail before they understand the game.
- Money and difficulty: helpers for sale (boosters, extra moves) naturally matter at hard moments, but a level
  is hard for pacing, never to force a purchase, and every level stays winnable without paying.

## 5. Pacing by world or chapter
| World or chapter | Levels | New element | Theme or setting | Ends with |
|---|---|---|---|---|

## 6. Level list
| ID | New or tested element | Goal and limits | Band | Status (draft / playtested / final) | Measured (win rate, attempts) |
|---|---|---|---|---|---|

## 7. Production numbers
- Time per level, measured at the Vertical Slice: <hours for design, build, test, and tuning>
- Levels in the first release (T1): <range>   Per update after launch: <number>
- Capacity check: <levels x hours per level against the hours available> (STUDIO_STATE.md, Schedule)

## 8. Tuning after launch
- Per-level funnel: where players quit, retry, or spend, read by cohort (`indie-studio:monetization`).
- Numbers that can change without an update (moves, time, targets) live in remote settings: <keys>.
- A retuned level keeps its ID; note the change, the reason, and the date in its row.
