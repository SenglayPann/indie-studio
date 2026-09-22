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
- **Beta:** mixed and balanced; volume and mute settings work; the game respects the phone's silent mode
  and pauses correctly on calls and when backgrounded.

## AI does / Human does
- **AI:** drives generation tools, batch-converts and normalizes files, wires triggers, builds the mixer.
- **Human:** listens on the phone speaker AND earbuds, picks what to keep, checks each tool's licence. Music
  licences are the ones most likely to exclude games: read the terms before generating a note
  (`indie-studio:asset-pipeline`, section 5).

## Beginner traps
Sounds that are too loud or harsh; no feedback sound on key actions; long uncompressed files that bloat the
build; forgetting audio interruptions; mixing only on studio headphones.

## Mobile notes
Prefer short compressed clips for effects; stream long music; keep the total audio size in the size budget
(`indie-studio:mobile-perf-budget`).
