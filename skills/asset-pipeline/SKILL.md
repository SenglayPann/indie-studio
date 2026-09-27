---
name: asset-pipeline
description: Rules for making, naming, importing, and tracking game art, audio, 3D models, and text, especially AI-generated ones. Use when creating or importing sprites, models, UI art, animations, sound effects, music, fonts, or icons; when preparing text for translation or translating the game or its store page (localization); when deciding who should make an asset (Claude itself, an AI generator such as Meshy or Tripo, a bought pack, a hired freelancer, or the human); when writing a style bible, character sheets, the writing voice, or prompt recipes; when generated assets drift out of style between batches or tool versions; when organizing asset folders, 3D budgets, or import settings; or when a question comes up about licences, ownership, or store disclosure of AI-generated content.
argument-hint: "[asset type or question]"
---

# Asset pipeline

AI can produce a lot of assets fast. Without rules the result is a game that looks like ten different games,
whose files nobody can trace, with licence risks nobody checked. Communication rules:
[communication.md](../director/references/communication.md). 3D specifics:
[3d-pipeline.md](references/3d-pipeline.md). Text and translations: [localization.md](references/localization.md).
Connecting the tools: `indie-studio:toolchain`.

## Principles
1. Consistency beats fidelity. One coherent simple style beats a mix of impressive ones.
2. Every shipped asset is traceable: which maker, which recipe, which licence, which edits.
3. The human curates and approves. The AI generates, converts, and organizes.
4. Nobody is trusted on their own say-so, including you: a maker earns an asset class by showing samples.
5. Measure production speed at the Vertical Slice; it drives the whole content plan.
6. Nothing final is generated before the style bible exists.

## 1. The style bible (`docs/STYLE_BIBLE.md`)
Create it from `${CLAUDE_PLUGIN_ROOT}/templates/docs/STYLE_BIBLE.md` at the start of the Vertical Slice stage
with the Artist hat. It fixes the palette (hex values), resolution and pixel density, line and shading style,
perspective, UI rules with the accessibility basics, audio mood and loudness, the world, characters, and
writing voice (with the Designer), reference images, the 3D technical spec, the **prompt recipes**, the
**makers** table, and the **golden set**. Every generated asset, and every line of player-facing text, is
checked against it.

## 2. Who makes each asset
Decide per asset class (UI icons, character sprites, props, environment, sound effects, music), and write the
answer in the makers table.

| Maker | Usually good at | Usually weak at |
|---|---|---|
| **Claude directly** (written as code or vector files) | Icons, flat and geometric shapes, UI layouts and states, colour work, particle and shader effects, simple animation, patterns, level data, all text | Illustration, characters and faces, detailed textures, music, voice |
| **Claude driving a generator** (`indie-studio:toolchain`) | 3D models from text or a picture, illustrated sprites, textures, sound effects, voice, music | Fine control, consistency without recipes, anything the licence excludes |
| **A bought or free pack** | A whole consistent set at once, cheaply | Looking like other games; licence tracking |
| **A hired freelancer** (section 10) | A signature look, characters, music and voice with feeling, native-quality translation | Cost at volume, turnaround of revisions; needs a contract first |
| **The human** | Taste, final judgement, small fixes | Volume |

**Samples decide, not confidence.** Claiming you can match a style proves nothing:
1. Propose the maker for the class and say plainly how sure you are and why.
2. Produce **three samples** exactly the way production would (same recipe, same settings).
3. Look at them: render vector output to an image, take a screenshot of a model, and compare against the
   style bible and the technical spec. If you cannot see the result, it is not verified: say so and ask the
   human to look.
4. The human approves or rejects. After two failed rounds, change the maker rather than the prompt.
5. Record the decision, the date, and the samples in the makers table.
Re-run this whenever the style bible changes or a tool changes its model.

## 3. Generation protocol (per asset class)
1. Choose the tool through [tool-evaluation.md](../research/references/tool-evaluation.md), connect it with
   `indie-studio:toolchain`. One tool per asset class; do not switch mid-project.
2. **Write the recipe** in the style bible: a **style block** that never changes (palette, line, shading,
   perspective, background, framing, negative prompts) and a **subject slot** that does. Generate by filling
   the slot, never by improvising the style block.
3. **Attach the same reference images** every time the tool accepts them. Reference images hold a style far
   better than words do. A named character always gets its reference sheet from the style bible's character
   table. For 3D: approve a 2D concept in the locked style first, then turn that picture into the model.
4. Lock and record the settings: model name and version, aspect and resolution, seed if the tool has one.
5. Generate several variants; the human picks. Do a whole class in one batch or session.
6. Clean up: background removal, cropping, palette fix, alignment, resizing, loudness. Keep the original in
   `Source/` (outside the engine's asset folder; large files through LFS or outside the repo).
7. Import with the settings in section 6, then look at it in the game at real phone size.
8. Add a row to `studio/ASSET_LEDGER.md` and commit on a `content/*` branch with an `art(...)` or `audio(...)`
   message (`indie-studio:git-workflow`).

## 4. Keeping the style from drifting
Generators change models quietly, and prompts wander between sessions. Three habits prevent a game that looks
like several games:
- **The golden set.** Keep 3-5 approved assets per class in `Source/golden/` with their exact recipes,
  settings, and reference images. At the start of every new batch, and after any tool or model update,
  regenerate one golden asset and compare it with the original side by side.
- **Stop when it drifts.** If the golden asset comes back different, do not "fix it later": re-tune the recipe
  (or pin the older model version if the tool allows) before producing anything else. Note it in the ledger.
- **Normalize after generation.** Remap to the palette, keep one canvas size and pivot per class, apply the
  same outline and shadow treatment, normalize audio loudness. Tools vary; post-processing is what makes a set
  look like a set.
For 3D, the strongest control is to let the engine own the look: one shared material or shader and one
lighting setup, so models from different batches match (3d-pipeline.md).

## 5. Licences, ownership, and disclosure (volatile; verify every time)
- Before an asset from a tool ships, confirm that **the plan actually used** allows commercial use. Free tiers
  often differ from paid ones: some require crediting the tool in the game or the store listing, some grant
  ownership only on paid plans. Save the terms URL and the date in the ledger.
- **Look for game-shaped exclusions.** Some tools allow "commercial use" but carve out games, or games that
  earn money, or games released on more than one platform, and push those to an enterprise licence. Search the
  terms for "game", "interactive", "broadcast", and "enterprise" before you rely on a tool for music or voice.
- Only upload reference images you own or have the right to use. Generating from someone else's artwork,
  a trademarked character, or licensed material can void your rights to the output.
- Ownership of purely AI-generated material is unsettled in some countries and changes. Substantial human
  editing strengthens your position. This is guidance, not legal advice.
- Stores may require disclosing AI-generated content, and what they ask changes. Check the current rules for
  every store you target (`indie-studio:research`) and record what you found in `studio/KNOWLEDGE.md`.
- Never prompt for existing copyrighted characters or logos, or a living artist's name as a style.
- Third-party assets (asset stores, free packs): keep the licence text with the asset, follow the credit
  requirements, and add each to the ledger.
- Re-check every tool's terms before the Beta and Gold Master gates.

## 6. Folders, names, and import settings
```
Assets/
  Art/      Sprites/  UI/  VFX/  Animations/  Models/  Materials/
  Audio/    Music/    SFX/
  Fonts/
  Data/     (level and balance data)
Source/     (raw originals, .blend files, prompts and recipes; not imported by the engine)
Source/golden/  (the golden set and its recipes)
```
Names: lowercase with underscores, `category_name_variant_state`, with a number where needed. Examples:
`ui_button_primary_pressed.png`, `spr_player_run_01.png`, `mdl_crate_small.glb`, `sfx_match_clear_02.wav`,
`mus_garden_loop.ogg`. No spaces, no capitals, no "final_v2_REAL".

Import settings for mobile (starting points; verify the names for your engine version): cap texture size to
what is shown on screen; pack UI and sprites into atlases; use the GPU-compressed format the target devices
support; turn off mipmaps for UI; short effects as small compressed clips; music streamed; mono for effects
where possible; include only the font characters the game needs. Check the engine's build report for the
largest assets and keep totals inside the size budget (`indie-studio:mobile-perf-budget`). Use engine-specific
skills for atlases and import setup when they are installed.

## 7. Placeholders by stage
Prototype: grey boxes and shapes only. Vertical Slice: final quality for the slice. Production: final assets
in tier order. Beta: nothing placeholder remains in the build.

## 8. Audio notes
Sound effects on every meaningful action make a game feel alive. Check audio on the phone speaker and on
earbuds. Provide volume and mute settings, respect the phone's silent mode, and pause on interruptions. Music
licences are the ones most likely to exclude games: read section 5 before generating a note of it.

## 9. Text and translations
Text is an asset too. From the Vertical Slice, every player-facing string lives in a string table (never in
code or images), layouts leave room for longer languages, and fonts cover the target scripts, even if the game
launches in one language. The languages themselves are chosen at Kickoff from market data, starting with the
store page. How to build for translation, choose languages, translate with AI and native review, and check the
result: [localization.md](references/localization.md).

## 10. Working with freelancers
A hired artist, composer, sound designer, voice actor, or translator is a maker like any other: they earn an
asset class with samples, work from the style bible, and every delivery goes into the ledger.
- **Choosing:** a portfolio in the target style, then a small paid test task made from the real brief.
- **Brief:** the style bible, the recipe or character sheet for the class, the golden set, exact specs (sizes,
  formats, loudness, file names), the deadlines, and what "done" means.
- **Contract, before any work starts:** the rights pass to the human (an assignment of copyright, not just a
  licence, where the law allows); whether the freelancer may use AI tools, and how that is disclosed; every
  piece of third-party material listed with its licence; source files delivered; credit wording;
  confidentiality. Laws differ by country: this is a checklist, not legal advice, and the human signs.
- **Payment by milestone,** each paid on acceptance against the brief (a first sample, then batches), through the
  human's own accounts. The AI never handles payment details.
- **Record it:** a ledger row for every delivered asset with the freelancer's name and the contract reference,
  and the signed contract kept privately, outside the repository.
