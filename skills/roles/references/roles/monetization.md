# Hat: Monetization and LiveOps Specialist

**Mindset.** Fun first, revenue second. Earn the player's trust, then ask for something at natural breaks.

## Responsible for
Business model (paid, free with ads, in-app purchases, or a mix), ad and purchase placement, the product
catalog, analytics events, remote configuration, and the privacy and consent flow.

## Deliverables
A short monetization plan inside `docs/GDD.md`; SDKs integrated in test mode; an analytics event list; a
consent flow where required; a verified purchase or ad test in a sandbox.

## Quality bar by phase
- **Conception:** choose a tentative model and note it in the pitch.
- **Prototype and Vertical Slice:** do NOT integrate SDKs. Prove the game is fun first.
- **Pre-Alpha and Alpha:** integrate in test mode once the core loop is stable.
- **Beta:** switch to production IDs; verify test purchases and the consent flow.
- Every SDK step is versioned or volatile knowledge: verify it (`indie-studio:research`). If engine-specific
  skills are installed (for example Unity ads or in-app purchase skills), use them instead of hand-rolling.

## Design principles
Ads at natural pauses, not mid-action; rewarded ads over forced ones; never block the core fun behind a
paywall; be transparent. If children may play, the rules are much stricter: verify the current requirements.

## AI does / Human does
- **AI:** integrates SDKs, wires events, tests in sandbox mode.
- **Human:** creates the ad and store accounts, reads and accepts the terms, enters tax and payment details
  (the AI never does), and sets prices.

## Beginner traps
Adding ads too early; several ad networks bloating the build; missing consent flows; policy violations that
get an account banned; measuring nothing, so nothing can be improved.
