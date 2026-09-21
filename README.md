# Indie Studio for Claude Code

A virtual game studio for **solo indie developers who build with AI**. It turns Claude Code into a small
professional team: it knows which phase your project is in, which role to play right now, what is off-limits
yet, when to look things up instead of guessing, how to keep your work safe in git, and where you left off
last time.

You stay the decision-maker. The plugin makes the AI act like an experienced studio lead who protects your
scope, your schedule, and your project.

## What you get

- **Always knows where you are.** A `STUDIO_STATE.md` notebook tracks phase, stage, next actions, and open
  questions. A session-start hook briefs Claude on it automatically, even after `/clear` or a compaction.
- **The right hat for the moment.** Ten studio roles (producer, designer, engineer, artist, level designer,
  audio, QA, monetization, release engineer, marketer), activated a few at a time by stage.
- **Gates, not guesses.** Six evidence-based checkpoints from idea to release. Only you approve them.
- **Scope protection.** Every new idea is costed, then parked or traded. The feature freeze at Alpha is enforced.
- **Disciplined version control.** Practice branches, a commit convention, gate tags, safe undo, and real git hooks
  that block secrets, huge files, and direct commits to `main`.
- **Looks things up.** Versions, store rules, prices, licenses, and AI-tool terms are verified and logged with a
  date instead of answered from memory.
- **Knows when to reset.** Recommends `/compact` or a fresh session at the right moments, saving state first.
- **Built for AI-assisted work.** Task briefs, a delegation matrix, a three-strikes rule, and an asset ledger for
  AI-generated art and audio.

## Requirements

- [Claude Code](https://code.claude.com)
- Git (on Windows, Git for Windows, which also provides the shell the hooks use)
- Recommended: web search and fetch tools enabled, so the `research` skill can verify facts

## Install

Once this repository is on GitHub:

```
/plugin marketplace add <owner>/<repo>
/plugin install indie-studio@indie-studio
```

To try it from a local copy without installing:

```
claude --plugin-dir /path/to/this/repository
```

Run `/reload-plugins` after changing files. Check the plugin with `claude plugin validate .` and
`sh scripts/check-plugin.sh`.

## Quick start

1. Make an empty folder for your game and open Claude Code in it.
2. Run `/indie-studio:director init`. It creates `STUDIO_STATE.md` and `studio/` and starts Conception.
3. Answer its questions. It will help you find an idea, check the market, choose an engine, set scope, and
   reach the first gate.
4. Next time, just open Claude Code in the same folder. The brief appears on its own; say what you want to do.

Useful commands (all under `/indie-studio:`):

| Command | Use it to |
|---|---|
| `director status` / `director next` | See where you are, or start the next action |
| `director doctor` | Health-check the project state, git, and rules |
| `director hat <role>` | Switch role |
| `session wrap` | Finish a session cleanly (state, journal, commit, backup) |
| `session compact` | Get advice on compacting or starting fresh |
| `gate-review` | Check whether you are ready for the next gate |
| `scope-guard <idea>` | Cost a new idea before building it |
| `research <question>` | Verify something that may be out of date |
| `git-workflow` | Any git action, with the rules applied |

Most skills also trigger on their own when the conversation calls for them.

## How it works

| Layer | Purpose |
|---|---|
| **Skills** | Procedures and judgment, loaded when relevant |
| **Session hook** | Deterministic: prints the project brief at session start (silent in projects without `STUDIO_STATE.md`) |
| **Project files** | `STUDIO_STATE.md` (now), `studio/` (history, decisions, verified facts, risks, ledgers), `docs/` (pitch, GDD, style bible) |
| **Git hooks** | Copied into your game repository; enforce commit format and block secrets, huge files, direct commits to `main` |

| Phase | Stages | Skill |
|---|---|---|
| Conception | Idea, Validation, Kickoff | `conception` |
| Pre-Production | Prototype, GDD-lite, Vertical Slice | `preproduction` |
| Production | First Playable, Pre-Alpha, Alpha, Beta | `production` |
| Launch and Live | Launch, Live Ops, Post-Mortem | `launch-live` |

## Skills

| Skill | What it does |
|---|---|
| `director` | Entry point: init, status, next, doctor, hats |
| `session` | Start, wrap, and compact routines |
| `git-workflow` | Branching, commits, tags, backups, safe undo, permission contract |
| `research` | Verify-before-you-rely protocol and AI-tool evaluation |
| `scope-guard` | Costs ideas; park, swap, or reject; Alpha freeze |
| `gate-review` | Evidence-based gate checklists |
| `roles` | The ten hats, one reference file each |
| `conception`, `preproduction`, `production`, `launch-live` | The four phases |
| `playtest-loop` | Real-player testing and the iterate-or-kill decision |
| `engine-selector` | Engine choice for an AI-assisted beginner |
| `ai-delegation` | Task briefs, three strikes, review protocol, project rules |
| `mobile-perf-budget` | Budgets and real-device measurement |
| `asset-pipeline` | Style bible, AI asset protocol, licensing, ledger |

The plugin is engine-agnostic. If engine-specific skills are installed (for example Unity ones), it uses them
for engine work instead of reinventing them.

## Safety and honesty

- **You approve** gates, merges into `main`, spending, and publishing. The plugin recommends; you decide.
- **It never handles credentials.** It will not enter passwords, keys, or payment details, and it tells you which
  steps are yours to do (store accounts, tax and payment details, submitting).
- **Facts go stale.** Version numbers, store rules, prices, and licenses in any skill are starting points. The
  `research` skill verifies them at the moment they matter.
- **Not legal advice.** Licensing, ownership, and store-policy notes are guidance to check, not legal opinions.
- The hook script and git hooks are short, readable shell scripts. Read them before you install.

## Repository layout

```
.claude-plugin/    plugin.json and marketplace.json
hooks/             SessionStart hook (hooks.json, session-brief.sh)
skills/            one folder per skill: SKILL.md plus references/
templates/         state file, studio/ logs, docs/ templates, git hooks and ignore files
scripts/           check-plugin.sh (integrity checks for maintainers)
docs/research/     background research this plugin was designed from (reference only)
```

## Contributing and license

See [CONTRIBUTING.md](CONTRIBUTING.md). Licensed under the [MIT License](LICENSE). The files in `docs/research/`
are reference material and are not covered by that license.
