# <Working title>: technical design

The rulebook for the code. Written by the Engineer at the GDD stage, before the Vertical Slice is rebuilt
cleanly, and kept current: any change to the structure, the saves, or the services updates this file in the
same branch. AI agents read it before changing how the code is organized. Verify every version and SDK fact
with `indie-studio:research` and write the date beside it.

## 1. Summary
- Engine and version: <...>   Language: <...>   Renderer or render pipeline: <...>
- Platforms: <Android / iOS>   Minimum OS: <...>   Target API or SDK level: <..., verified YYYY-MM-DD>
- Orientation: <...>   Reference resolution and safe areas: <...>
- Performance budgets: `studio/PERF_LOG.md` (`indie-studio:mobile-perf-budget`)

## 2. Architecture map
One row per system. A new system gets a row before it gets code.

| System | Responsible for | Lives in | Talks to (and how) |
|---|---|---|---|
| Game loop | <...> | <folder or scene> | <events / direct calls> |
| Save system | Saving, loading, and migrating player data | | |
| Services | Ads, purchases, analytics, remote settings, consent (section 5) | | |
| Rules library | The game's rules and math (scoring, dealing, targets, upgrades, economy), with no engine dependency | | Called by the game, the tests, and the balance simulator |

Screen flow: <boot > menu > play > results>. Rules: <for example: gameplay never reads UI objects; UI listens
to events; every tunable number comes from a data file>.

**Rules library** (games with scoring, random content, or upgrades that stack): the rules live in one library
with no engine dependency, used by the game, the automated tests, and the headless bots of `docs/BALANCE.md`.
There is never a second copy of the rules in another language for the simulator. How this engine runs such
code outside the editor: <verified with `indie-studio:research`, date>.

**Randomness** (games with random content): gameplay draws (deals, drops, spawns) come from the game's own
seeded generators, never the engine's global random function; some engine shuffle helpers use the global one,
so check. Visual effects (particles, idle motion, shake) use a separate generator, so adding a sparkle never
changes the next deal. The save keeps each generator's current state, not only its seed. Undo, reloading after
the app was closed, and a retry restore that state (unless the design says a retry deals afresh); otherwise
players re-roll bad luck. Shuffles use the standard Fisher-Yates method (from the last item down, swap each item
with a random one at or before it); home-made shuffles are often biased. No gameplay result depends on the clock
or on the order a dictionary or hash set returns its items.

**Pause has owners.** The game is paused while any reason holds: the player's pause menu, the app in the
background, an ad on screen, a purchase sheet, a system dialog. Each owner adds and removes only its own reason,
so closing an ad never unpauses a game the player paused. Slow-motion and freeze-frame effects scale game time
on their own and never touch the pause state; their timers run on real time, so a freeze always ends. Pause
owners in this game: <...>.

## 3. Conventions
- Asset folders and names: `indie-studio:asset-pipeline`. Code folders and names: <...>
- Code style: <...>   Where tuning data lives: <...>   Level data format and IDs: `docs/LEVELS.md`
- How to add a system: <steps>   How to add a content item: <steps>
- Packages and dependencies: each one approved by the human and listed here with its version.

## 4. Data and saves
- Format and location: <...>   Cloud save: <none / service>
- **Version number:** every save carries one. A change to what is saved raises it and adds a migration from
  the previous version, with a test. An update must never break an existing player's save.
- **Safe writes:** write the new save to a temporary file, then rename it over the old one, keeping the
  previous save as a backup. A crash or a dead battery mid-write then leaves a good save; loading falls back to
  the backup when the main file fails.
- **Newer than the build:** a save written by a newer game version (a cloud save after a downgrade, a second
  phone on an older build) is refused with a message, never guessed at.
- **Repair, do not crash:** on load, removed or unknown item IDs are dropped or replaced, values outside current
  limits are clamped, negative or not-a-number values are reset, and each repair is logged. Corrupted or missing
  save: <what happens; never crash, never silently wipe progress>
- **Save what cannot be recomputed** (choices, unlocks, inventory, generator state). Totals and other derived
  values are recomputed on load, so a formula change in a patch cannot leave them out of step.
- Purchases: <which are restored from the store, which live in the save>. What was bought is restored from the
  store, never trusted from the local file: a save a player can open and edit is a cheat path in a game that
  sells currency or power (`indie-studio:roles`, engineer, cheating and data-leak pass).

## 5. Services (each behind one wrapper)
Game code calls the wrapper, never the SDK, so a provider can change without touching gameplay.

| Service | Provider and SDK version (verified date) | Wrapper | Test mode or fake | Notes |
|---|---|---|---|---|
| Analytics | | | | Events: `docs/ECONOMY.md` |
| Ads (mediation) | | | | Placements: `docs/ECONOMY.md`. A fixed set of results, an ID per request, a reward granted at most once, a timeout rule (`indie-studio:monetization`, section 3) |
| Purchases | | | | Receipt check, restore (re-reads the store's purchases), pending and interrupted purchases |
| Remote settings | | | | Keys, defaults, safe ranges, kill switches: `docs/ECONOMY.md`. Every value read is clamped to its range; a missing one uses the build's default |
| Consent | | | | Regions and flows: `docs/ECONOMY.md` |
| Crash reporting | | | | Symbols uploaded for every release build |

## 6. Text and languages
- All player-facing text comes from string tables from the Vertical Slice on: no text in code or images.
- Fonts cover every target script; layouts leave room for text about 40% longer than English.
- Launch languages: <from `docs/BUSINESS_CASE.md`>. How: `indie-studio:asset-pipeline` (localization).

## 7. Build and release
- One-command build: `<command>`   Profiles: <dev / release>; debug tools stripped from release builds.
- Application IDs: <Android package name / iOS bundle ID>
- Versioning: <x.y.z> for players, plus a build number that rises with every upload and is never reused.
- Signing: the human holds the keys and two private backups; CI reads them only from its secret settings.
- A bad store build is fixed forward with a higher build number; stores usually cannot roll one back
  (`indie-studio:launch-live`, Bad release plan).

## 8. Automated checks
- Run all tests: `<command>`
- A test counts once it has been seen failing: a bug-fix test fails with the fix reverted, and a new balance or
  economy check fails when the number it guards is broken on purpose. Expected values come from the design docs
  or are worked out by hand, never computed by the rules code under test.
- Tested automatically (grow this list; every Class A bug adds a test where the engine allows):
  - [ ] Save and load, including a save from every earlier save version, a cut-off file (the backup loads), a
    save from a newer version (refused), and a removed item ID (repaired)
  - [ ] Purchase handling with the store faked: success, failure, pending, restore, refund
  - [ ] Ad handling with the network faked: no ad available, closed without reward, the reward reported before
    and after the close, the same reward twice, a result for an old request, a timeout then a late reward, the
    app sent to the background mid-ad
  - [ ] Pause: the player pauses, an ad or a purchase sheet opens and closes, the game is still paused
  - [ ] Randomness: the same seed and moves give the same game with visual effects on and off; undo, or save
    and reload, then the same move gives the same draw
  - [ ] Remote settings: a missing or out-of-range value falls back to the default or is clamped
  - [ ] Economy math: rewards, prices, and sinks, read from the real data files
  - [ ] Level data: every level loads and passes its automated checks; solver or bot clears (`docs/LEVELS.md`)
  - [ ] Balance: on fixed seeds, the bots' numbers stay inside the targets in `docs/BALANCE.md`
- CI: <service> builds <platforms> and runs the tests on every merge into `develop`. Status: <...>.
  Secrets live in the CI service's secret settings, never in the repository (`indie-studio:toolchain`).

## 9. Engine plugins and tools
| Plugin, MCP server, or tool | Used for | May change |
|---|---|---|
| <for example, the engine vendor's official Claude plugin> | <purchases, ad mediation, localization setup> | <project settings, packages> |

The studio decides what to build, when, and what "done" means; an installed engine plugin's skill supplies
the engine-specific how.

## 10. Known technical debt
| Item | Risk if left | Plan |
|---|---|---|
