---
name: asset-pipeline
description: Rules for making, naming, importing, and tracking game art, audio, and other assets, especially AI-generated ones. Use when creating or importing sprites, models, UI art, animations, sound effects, music, fonts, or icons; when writing a style bible; when choosing or trying an AI asset tool; when organizing asset folders or import settings; or when a question comes up about licenses, ownership, or store disclosure of AI-generated content.
argument-hint: "[asset type or question]"
---

# Asset pipeline

AI can produce a lot of assets fast. Without rules the result is a game that looks like ten different games,
whose files nobody can trace, with license risks nobody checked. Communication rules:
[communication.md](../director/references/communication.md).

## Principles
1. Consistency beats fidelity. One coherent simple style beats a mix of impressive ones.
2. Every shipped asset is traceable: which tool, which prompt, which license, which edits.
3. The human curates and approves. The AI generates, converts, and organizes.
4. Measure production speed at the Vertical Slice; it drives the whole content plan.
5. Nothing final is generated before the style bible exists.

## 1. The style bible (`docs/STYLE_BIBLE.md`)
Create it from `${CLAUDE_PLUGIN_ROOT}/templates/docs/STYLE_BIBLE.md` at the start of the Vertical Slice stage
with the Artist hat. It fixes: palette (hex values), resolution and pixel density, line and shading style,
perspective, UI kit rules, audio mood and loudness, reference images, and do and do-not examples. Every
generated asset is checked against it.

## 2. Generation protocol (per asset class)
1. Choose the tool through the comparison in [tool-evaluation.md](../research/references/tool-evaluation.md).
   One tool per asset class; avoid switching mid-project.
2. Lock the settings: model and version, aspect ratio, resolution, style references, and negative prompts.
   Store them in the style bible so a later session reproduces the same look.
3. Generate several variants; the human picks. Generate a class of assets in one batch or session for consistency.
4. Clean up: background removal, cropping, palette fix, alignment, resizing. Keep the original in a
   `Source/` folder (outside the engine's asset folder; large files through LFS or kept outside the repo).
5. Import with the settings in section 5, then check it in the game at real phone size.
6. Add a row to `studio/ASSET_LEDGER.md`: path, tool and version, plan or tier, prompt or source, date, license
   URL and date checked, commercial use OK?, human edits, style-bible check.
7. Commit on a `content/*` branch with an `art(...)` or `audio(...)` commit (`indie-studio:git-workflow`).

## 3. Licensing, ownership, and disclosure (volatile; verify each time)
- Before an asset from a tool ships, confirm that the plan actually used allows commercial use. Free tiers
  often differ from paid tiers. Save the terms URL and the date in the ledger.
- Ownership of purely AI-generated material is legally unsettled in some places, and rules differ by
  country and change. Substantial human edits strengthen your position. Look up the current position for
  your situation; this is not legal advice, and a lawyer is the right person for a real question.
- App stores increasingly ask developers to disclose AI-generated content. Check the current rules for each
  store you target (`indie-studio:research`) and follow them. Record what you found in `studio/KNOWLEDGE.md`.
- Never prompt for existing copyrighted characters or logos, or for a living artist's name as a style.
- Third-party assets (asset stores, free packs): keep the license text with the asset, follow the credit
  requirements, and add each to the ledger.
- Re-check every tool's terms before the Beta and Gold Master gates.

## 4. Folders and names (engine-agnostic; adapt to engine conventions)
```
Assets/
  Art/      Sprites/  UI/  VFX/  Animations/
  Audio/    Music/    SFX/
  Fonts/
  Data/     (level and balance data)
Source/     (raw and high-resolution originals, prompts; not imported by the engine)
```
Names: lowercase with underscores, `category_name_variant_state`, with a number where needed.
Examples: `ui_button_primary_pressed.png`, `spr_player_run_01.png`, `sfx_match_clear_02.wav`,
`mus_garden_loop.ogg`. No spaces, no capitals, no "final_v2_REAL".

## 5. Import settings for mobile (starting points; verify names and defaults for your engine version)
- Textures: cap the maximum size to what is shown on screen; pack UI and sprites into atlases; use the
  GPU-compressed format the target devices support; turn off mipmaps for UI.
- Audio: short effects as small compressed clips; music streamed rather than fully loaded; mono for effects
  where possible; consistent loudness across the set (normalize).
- Fonts: include only the character sets the game needs.
- Check the engine's build report to see which assets are largest, and keep totals within the size budget
  (`indie-studio:mobile-perf-budget`). If engine-specific skills exist for atlases or import setup, use them.

## 6. Placeholders by stage
Prototype: grey boxes and shapes only. Vertical Slice: final quality for the slice. Production: final assets
in tier order. Beta: nothing placeholder remains in the build.

## 7. Audio notes
Sound effects on every meaningful action make a game feel alive. Check audio on the phone speaker and on earbuds.
Provide volume and mute settings, respect the phone's silent mode, and pause on interruptions.
