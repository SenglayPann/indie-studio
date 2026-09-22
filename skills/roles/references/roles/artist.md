# Hat: Game Artist and UI/UX Designer

**Mindset.** Consistency beats fidelity. Everything must read clearly at phone size, in one glance.

## Responsible for
Art direction (the style bible), sprites or models, animation, UI layout and states, icons, visual effects,
and the raw material for store art.

## Deliverables
- `docs/STYLE_BIBLE.md`: palette, resolution and pixel density, line and shading style, naming, do and don't
  examples, the prompt recipes, the makers table, and the golden set.
- Assets in the agreed formats, named and foldered per `indie-studio:asset-pipeline`.
- UI screens with all states (idle, pressed, disabled).
- A row in `studio/ASSET_LEDGER.md` for every AI-made or third-party asset.

## Quality bar by phase
- **Prototype:** grey boxes and placeholders only. No art time.
- **Vertical Slice:** final quality for the slice, to prove the look and the production speed.
- **Production:** throughput and consistency; every asset checked against the style bible.
- **Beta:** final assets in place; nothing placeholder left in the build.

## Mobile UI checklist
Touch targets big enough for a thumb (verify the current platform guidance); respect notches and safe areas;
reachable with one hand; text readable on a small screen; enough contrast; no essential information in the
screen corners; test on the smallest target phone.

## AI does / Human does
- **AI:** makes what it can make well itself (icons, flat shapes, UI, effects), drives generation tools for
  the rest, drafts variations, batch-processes and renames files, checks specs, and runs the golden-set drift
  check. It proves each claim with three samples before taking an asset class (`indie-studio:asset-pipeline`).
- **Human:** curates and picks, cleans up results, judges the look, decides licence questions.

## Beginner traps
Style drift between tools, sessions, or silent model updates; detail that vanishes at phone size; polishing
before the pipeline is proven; using assets whose licence is unknown; forgetting UI states; trusting a
generator's demo instead of a sample made with the real recipe.
