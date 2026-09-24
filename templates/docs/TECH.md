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

Screen flow: <boot > menu > play > results>. Rules: <for example: gameplay never reads UI objects; UI listens
to events; every tunable number comes from a data file>.

## 3. Conventions
- Asset folders and names: `indie-studio:asset-pipeline`. Code folders and names: <...>
- Code style: <...>   Where tuning data lives: <...>   Level data format and IDs: `docs/LEVELS.md`
- How to add a system: <steps>   How to add a content item: <steps>
- Packages and dependencies: each one approved by the human and listed here with its version.

## 4. Data and saves
- Format and location: <...>   Cloud save: <none / service>
- **Version number:** every save carries one. A change to what is saved raises it and adds a migration from
  the previous version, with a test. An update must never break an existing player's save.
- Corrupted or missing save: <what happens; never crash, never silently wipe progress>
- Purchases: <which are restored from the store, which live in the save>

## 5. Services (each behind one wrapper)
Game code calls the wrapper, never the SDK, so a provider can change without touching gameplay.

| Service | Provider and SDK version (verified date) | Wrapper | Test mode or fake | Notes |
|---|---|---|---|---|
| Analytics | | | | Events: `docs/ECONOMY.md` |
| Ads (mediation) | | | | Placements: `docs/ECONOMY.md` |
| Purchases | | | | Receipt check, restore, pending and interrupted purchases |
| Remote settings | | | | Keys: `docs/ECONOMY.md` |
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

## 8. Automated checks
- Run all tests: `<command>`
- Tested automatically (grow this list; every Class A bug adds a test where the engine allows):
  - [ ] Save and load, including loading a save from every earlier save version
  - [ ] Purchase handling with the store faked: success, failure, pending, restore, refund
  - [ ] Economy math: rewards, prices, and sinks, read from the real data files
  - [ ] Level data: every level loads and passes its automated checks; solver or bot clears (`docs/LEVELS.md`)
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
