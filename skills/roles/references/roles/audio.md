# Hat: Audio Engineer and Composer

**Mindset.** Sound is half of how a game feels. Small sounds on every action make a game feel alive.

## Responsible for
Sound effects, music, mixing, audio triggers, loudness balance, and formats.

## Deliverables
A sound list, the SFX set, one or more music loops, the mixer setup, and a row in `studio/ASSET_LEDGER.md`
per sound or track.

## Quality bar by phase
- **Prototype:** none, or placeholder beeps.
- **Vertical Slice:** final SFX for the core actions and one music loop.
- **Production:** the full sound list implemented.
- **Beta:** mixed to the style bible's loudness target and balanced; volume and mute settings work; the game
  respects the phone's silent mode and pauses correctly on calls and when backgrounded.

## Mix rules
Engine steps belong to the engine vendor's audio skill when it is installed; these rules hold in any engine.
- **Buses.** A bus is a channel that sets the volume of everything routed through it. Route every sound through
  one of a few: music, effects, UI, and voice if the game has any. The settings sliders change the buses. A
  sound that skips its bus ignores the player's slider: check that none does.
- **Slider curve.** A slider wired straight to the sound level changes little until near the bottom, because
  ears hear volume on a curve. Map it through a curve (a common starting point: square the slider value to get
  the level), make zero true silence, and check by ear that every step is audible.
- **Loudness.** LUFS measures how loud a mix seems over time; true peak (dBTP) is its highest point. Measure
  both over a few minutes of real play, not per file. A starting point only: one published game-audio guideline
  (Sony's ASWG-R001) has suggested about -18 LUFS for handheld and mobile, with peaks at or under -1 dBTP.
  Verify the current figures with `indie-studio:research` before writing them in the style bible, then
  normalize every file so the mix lands there.
- **Variation.** A sound that plays often gets a few takes and a small random change of pitch, never the same
  take twice in a row, and a cap on how many copies play at once.
- **Ducking.** The music dips briefly under the sounds that matter (a reward, a warning, a voice line) and
  comes back smoothly.
- **Strength.** Effects follow the style bible's feedback-strength levels: a small event never sounds bigger
  than a large one (`indie-studio:asset-pipeline`, `references/game-feel.md`).
- A sound that carries information has a visible match on screen ([ui-ux.md](ui-ux.md), usability checklist).

## AI does / Human does
- **AI:** drives generation tools, batch-converts and normalizes files, wires triggers, builds the mixer, and
  measures loudness and peaks of each file and of a recording of a play session with a meter already on the
  machine (ask before adding one). A meter cannot tell whether it sounds good.
- **Human:** listens on the phone speaker AND earbuds, picks what to keep, checks each tool's licence. Music
  licences are the ones most likely to exclude games: read the terms before generating a note
  (`indie-studio:asset-pipeline`, section 5).

## Beginner traps
Sounds that are too loud or harsh; no feedback sound on key actions; long uncompressed files that bloat the
build; forgetting audio interruptions; mixing only on studio headphones; a sound that skips its bus and
ignores the volume slider; the same take fifty times in a row.

## Mobile notes
Prefer short compressed clips for effects; stream long music; keep the total audio size in the size budget
(`indie-studio:mobile-perf-budget`).
