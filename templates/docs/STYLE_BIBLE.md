# <Working title>: style bible (art, sound, and story)

Every asset and every line of player-facing text is checked against this. If an asset does not match, change the
asset, not the bible (unless the human deliberately changes the bible and records it in `studio/DECISIONS.md`).

## Look in two sentences
<e.g. Flat, soft-shaded shapes in warm pastel colours with thick rounded outlines. Friendly and calm.>

## Palette
| Role | Hex | Use |
|---|---|---|
| Primary | | |
| Secondary | | |
| Accent | | |
| Background | | |
| Text and UI | | |
| Warning or danger | | |

## Technical spec
- Perspective: <top-down / side / isometric / flat UI>
- Sprite size and pixel density: <e.g. 128x128 tiles, 100 pixels per unit>
- Outline: <thickness, colour rule>   Shading: <flat / one-step / gradient>
- Screen: <reference resolution, orientation, safe-area margins>

## UI kit
- Buttons: <shape, corner radius, states: idle / pressed / disabled>
- Text: <fonts, minimum size on the smallest phone, contrast rule>
- Touch target minimum: <size, verify current platform guidance>
- Accessibility basics: never rely on colour alone (add a shape, icon, or pattern); text follows the phone's
  text-size setting where the engine allows; an option to reduce motion and flashing; separate switches for
  sound, music, and vibration; captions for any voice.

## Audio mood and loudness
- Music: <mood, tempo range, instruments>   Effects: <soft / crisp / playful>
- Loudness target: <how the set is normalized>

## World, characters, and voice
Skip the world and characters if the game has none; every game still needs the writing voice.

- Setting in two sentences: <where and when, and what makes it feel like this game>
- Characters (each one's reference sheet is attached to every generation of that character):

| Name | Role in the game | Look (reference sheet path) | Personality | A line they would say |
|---|---|---|---|---|

- Writing voice: <tone, reading level, sentence length, humour or not, words to avoid>
  - A button: <...>   A tutorial line: <...>   A fail message: <...>   The store description's first line: <...>
- Text volume: <rough word count by area (UI, tutorial, story); drives the translation cost>

## Makers (who makes each asset class)
Filled by `indie-studio:asset-pipeline` after three samples were approved. Re-check when the style changes or
a tool changes its model.

| Asset class | Maker (Claude / tool name / pack / freelancer / human) | Samples approved | Notes |
|---|---|---|---|
| UI icons | | | |
| Sprites or models | | | |
| Sound effects | | | |
| Music | | | |

## Tools and locked settings (one tool per asset class)
| Asset class | Tool and model version | Locked settings (aspect, resolution, seed policy) | Licence checked (URL, date) |
|---|---|---|---|
| | | | |

## Prompt recipes
One per asset class. The **style block** never changes; only the subject slot does. Copy it exactly.

```
Recipe: R-01 <asset class>
Style block: <the fixed sentence(s): style, palette, line, shading, lighting, background, framing>
Subject slot: <what changes, e.g. "a wooden crate">
Negative: <what must never appear>
Settings: <model + version, aspect, resolution, seed policy>
References: <file paths of the images attached to every generation>
```

## Golden set
Three to five approved assets per class, kept in `Source/golden/` with their recipes. Regenerate one at the
start of every batch and after any tool update, and compare side by side.

| Golden asset | Recipe | Made on | Last drift check | Result |
|---|---|---|---|---|
| | | | | |

## 3D spec (if the game is 3D; details in `indie-studio:asset-pipeline`, 3d-pipeline.md)
- Units: <1 unit = 1 metre>   Up and forward axis: <...>   Pivot rule: <...>
- Shared material or shader: <...>   Lighting setup: <...>
- Budgets: <triangles and texture size per asset class>
- Animation list: <idle, move, action, hit, win/lose>
- Export format: <glb / fbx>   Editable originals in `Source/`

## Reference images
<links or file paths to 3-6 reference images and the AI-generated "style anchor" sheet>

## Do and do not
| Do | Do not |
|---|---|
| | |
