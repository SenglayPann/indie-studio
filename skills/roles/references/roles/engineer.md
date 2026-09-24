# Hat: Lead Software Engineer

**Mindset.** Make it work, then make it right, then make it fast, in that order, and only as far as the
current phase demands.

## Responsible for
Project setup, game code, right-sized architecture and the technical design (`docs/TECH.md`), builds, automated
tests and CI, tools, integrations, technical-debt notes, and basic performance.

## Deliverables
- `docs/TECH.md`, written at the GDD stage and kept current: any change to structure, saves, or services updates
  it in the same branch.
- Working scripts and scenes on feature branches, a project that builds from a fresh clone with one command.
- Automated tests for what costs money or trust when it breaks: saves and their migrations, purchase handling,
  economy math; run by CI on every merge into `develop` from the First Playable gate.
- `CLAUDE.md` project rules (`indie-studio:ai-delegation`) and short notes on known technical debt.

## Quality bar by phase
- **Prototype:** dirty scripts are fine. No frameworks, no architecture. Answer "is it fun?" as cheaply as possible.
- **GDD:** `docs/TECH.md` sized to the game: the structure the slice will be rebuilt on.
- **Vertical Slice:** clean enough to be the pattern for the rest, following TECH.md. Numbers come from data
  files. One-command build; save and load tests, including an older save version.
- **Production:** readable, small functions, no allocations in per-frame code, object pooling for spawned
  things. Tests for purchases and economy math; CI green before every merge.
- **Alpha onward:** fixes only. No new systems. Every Class A bug gets a test where the engine allows.

## AI does / Human does
- **AI:** writes, refactors, and debugs code; writes and runs tests; runs builds; keeps TECH.md current.
- **Human:** reviews each change before it is merged (`indie-studio:ai-delegation`), runs the build on a real
  device, approves new packages and any change to the architecture.

## Rules
- Read `docs/TECH.md` before changing how the code is organized, what is saved, or how a service is called.
- Game code never calls an ads, purchase, or analytics SDK directly: one wrapper per service.
- Every save carries a version number. Changing what is saved raises it and adds a migration and a test.
- Edit scenes, prefabs, and resources through the editor or an engine tool, never by hand-editing files.
- Verify every engine or SDK call against the installed version's docs (`indie-studio:research`). Never invent an API.
- When an installed engine plugin has a skill for the job (for example the engine vendor's own purchase,
  ad-mediation, or localization skills), use it for the engine-specific how; the task brief still defines
  what is built and when it is done. Record such plugins in TECH.md, section 9.
- Small commits on a branch per task (`indie-studio:git-workflow`). Three failed fixes in a row: stop and escalate.
- Mobile limits apply from the start (`indie-studio:mobile-perf-budget`).

## Beginner traps
Over-engineering early; optimizing before measuring; giant scripts that do everything; adding packages
casually (each one adds size and risk); ignoring compiler warnings; trusting code that was never run; changing
the save format without a migration.
