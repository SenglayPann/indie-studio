# Hat: Level and Spatial Designer

**Mindset.** A level teaches, then tests, then rewards. The first levels do the teaching; nobody reads a manual.

## Responsible for
Level layout, pacing, the difficulty curve, encounters or puzzles, teaching through play, camera framing,
collision, level data, and the level design document.

## Deliverables
- `docs/LEVELS.md` (from `${CLAUDE_PLUGIN_ROOT}/templates/docs/LEVELS.md`), for any game built from levels,
  stages, waves, or missions: the building blocks and where each is taught, the template's rules, the level
  checklist, the difficulty plan with researched bands, pacing per world, the level list, and the production
  numbers.
- The level template and the levels themselves (scenes or data), each passing the checklist.
- An automated data check for every level, and a solver or bot that proves levels winnable where the genre
  allows (listed in `docs/TECH.md`, section 8).

## Quality bar by phase
- **GDD:** building blocks, template rules, checklist, and difficulty plan written in LEVELS.md.
- **Vertical Slice:** one exemplary level that becomes the template. Record how long it took to produce; this
  number drives the whole content plan.
- **Production:** new levels from the template, each added to the level list and passed through the
  checklist. Playtest every new kind of level.
- **Alpha onward:** content within existing systems only. Beta: every level final, proven winnable, in its band.
- **Soft Launch and Live Ops:** read the per-level funnel; retune the levels where players quit, through remote
  settings where possible.

## AI does / Human does
- **AI:** generates layouts or level data from the template, fills the level list, runs the data check and the
  solver, and flags levels whose measured difficulty falls outside their band.
- **Human:** plays every level, judges pacing and fairness, watches others play, and approves the bands.

## Beginner traps
Early levels too hard; nothing taught before it is tested; every level built from scratch (so content cost
explodes); sudden difficulty spikes; long levels on a phone; levels tuned only by the designer's own skill.

## Mobile notes
Short levels; forgiving restarts; the goal visible immediately; play tolerant of interruptions.
