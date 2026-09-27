# Commit message convention

Format:

```
<type>(<scope>): <summary in the imperative, 72 characters or fewer>

<body: why this change was made, what it affects. Wrap at about 72 columns.>

Task: T-014
```

- The subject line is required. Body and footer are optional but recommended for anything non-trivial.
- Imperative mood: "add", "fix", "lower", not "added" or "adds". No trailing period.
- Scope is the subsystem or area in lowercase: `inventory`, `scoring`, `ui`, `economy`, `level-3`,
  `build`, `state`, `deps`. It may be omitted for small project-wide changes.
- Add `!` before the colon for a change that breaks saved data or compatibility, and explain in the body.

## Types
| Type | Use for |
|---|---|
| `feat` | New player-facing behavior or capability |
| `fix` | Bug fix |
| `perf` | Speed, memory, size, or battery improvement |
| `refactor` | Code restructuring with no behavior change |
| `test` | Adding or changing tests |
| `docs` | Documentation, GDD, README |
| `build` | Build settings, packages, engine or SDK version, CI |
| `chore` | Housekeeping, project state, tooling (`chore(state): wrap up 2026-09-21`) |
| `art` | Sprites, models, animations, UI art, textures |
| `audio` | Music, sound effects, mixing |
| `level` | Level layout, encounters, spatial design |
| `balance` | Numbers: difficulty, economy, rewards, timing |
| `ui` | UI layout or behavior (use `art(ui)` for pure visuals) |
| `revert` | Reverting an earlier commit |

## Examples
```
feat(inventory): add drag-drop slot swap
fix(scoring): stop combo counter resetting on pause
perf(rendering): batch tile sprites into one atlas
art(ui): add pressed state to all buttons
audio(sfx): add match-clear chime
level(garden-3): shorten the opening corridor
balance(economy): lower level-5 coin reward by 20%
build(deps): update the ads package to <version>
docs(gdd): add scoring rules
chore(state): wrap up 2026-09-21
revert: "feat(inventory): add drag-drop slot swap"
```

## Bad and better
| Bad | Better |
|---|---|
| `update stuff` | `fix(input): ignore taps during level transition` |
| `WIP` | Commit the work under a real message, or keep it uncommitted |
| `feat: many changes (art, code, sounds)` | Three commits: `feat(...)`, `art(...)`, `audio(...)` |
| `fix bug` | `fix(save): prevent crash when the save file is empty` |

## Body: explain why
The diff shows what changed. The body says why, and any consequence someone would not guess:

```
fix(save): prevent crash when the save file is empty

A failed write on low storage left a zero-byte file, and the loader
assumed valid JSON. Treat an empty file as "no save" and start fresh.

Task: T-031
```

## Rules the commit-msg hook enforces
Subject must match `<type>(<scope>)?: <summary>` with a listed type, be 72 characters or fewer, and be
followed by a blank line before any body. Merge, revert, fixup, and squash messages that git generates are
allowed as they are.
