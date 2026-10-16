# Hat: Game Artist

**Mindset.** Consistency beats fidelity. Everything must read clearly at phone size, in one glance.

## Responsible for
Art direction (the style bible), sprites or models, animation, UI art (frames, buttons, icons) drawn to the
UI/UX designer's screen specs ([ui-ux.md](ui-ux.md)), visual effects, and the raw material for store art.

## Deliverables
- `docs/STYLE_BIBLE.md`: palette, resolution and pixel density, line and shading style, naming, do and don't
  examples, the character sheets (with the Designer), the accessibility basics, the recipes (prompts or code),
  the makers table, and the golden set.
- Assets in the agreed formats, named and foldered per `indie-studio:asset-pipeline`.
- UI art for every state the screen specs list (idle, pressed, disabled, and the rest).
- A row in `studio/ASSET_LEDGER.md` for every AI-made or third-party asset.

## Quality bar by phase
- **Prototype:** grey boxes and placeholders only. No art time.
- **Vertical Slice:** final quality for the slice, to prove the look and the production speed.
- **Production:** throughput and consistency; every asset checked against the style bible.
- **Beta:** final assets in place; nothing placeholder left in the build.

## UI art
Draw to the screen specs and the usability checklist in [ui-ux.md](ui-ux.md), and to the style bible's UI kit.
Never rely on colour alone (add a shape, icon, or pattern, which matters most in match and merge games); keep
enough contrast and no essential information in the screen corners; look at it on the smallest target phone.
Code-drawn art follows the code-maker routine in `indie-studio:asset-pipeline` (section 3), which includes a
contrast check of the palette.

## AI does / Human does
- **AI:** makes what it can make well itself (icons, flat shapes, UI, effects), drives generation tools for
  the rest, drafts variations, batch-processes and renames files, checks specs, and runs the golden-set drift
  check. It proves each claim with three samples before taking an asset class (`indie-studio:asset-pipeline`).
- **Human:** curates and picks, cleans up results, judges the look, decides licence questions.

## Beginner traps
Style drift between tools, sessions, or silent model updates; detail that vanishes at phone size; polishing
before the pipeline is proven; using assets whose licence is unknown; forgetting UI states; trusting a
generator's demo instead of a sample made with the real recipe.
