# Ideas from other studio plugins (2026-10-31)

Three popular Claude Code collections were read side by side with indie-studio to find what it lacks. Only
ideas were taken, rewritten in this plugin's own words and for any game. No text or code was copied, and
nothing from the three repositories was run.

| Source | What it is | Licence | Commit read |
|---|---|---|---|
| Donchitos/Claude-Code-Game-Studios | A game template with 49 agents, 74 skills, 15 hooks; PC and console | MIT | `05ad7c8` (1.2.0, 2026-10-19) |
| obra/superpowers (+ superpowers-skills) | General coding discipline plugin: plans, testing, debugging, review | MIT | `2ce8aa1` (7.0.1) |
| gamedev-skills/awesome-gamedev-agent-skills | 77 engine-by-engine coding skills | Apache-2.0 | shallow clone, 2026-10-31 |

The superpowers evals lab (prime-radiant-inc/superpowers-evals) has no licence file: only its methods were
noted, never its text or scenarios.

## What none of them has

None covers markets, ads, purchases, store policy, soft launch, retention or live ops. indie-studio's phases,
gates, economy and launch work have no rival in the three. Their strength is engineering discipline, which is
where the additions below come from.

## Adopted on `feature/ideas-from-other-studios`

No new skills: everything went into existing skills, reference files, templates and the session brief, so the
skill list does not grow. Each change has a scenario in `docs/TESTING.md` (89-99) and a line in `CHANGELOG.md`.

| Theme | Where | From |
|---|---|---|
| Proof before "done": four results (met, not met, not checked, n/a), a table of what each check proves, new tests seen failing, the running game looked at, a subagent's file checked on disk | `ai-delegation`, `references/done-evidence.md`, `templates/docs/TASK_BRIEF.md` | superpowers, Donchitos, awesome-gamedev |
| Fresh-eyes review before a merge; a cold read of long briefs | `references/review-prompt.md`, `ai-delegation` §5 and §7 | superpowers |
| Root-cause debugging; what counts as a strike | `references/debugging.md`, `research` §5 | superpowers |
| A notebook that stays small (overwrite Now, archive old log entries, brief warning, doctor check) | `session`, `director`, `references/state-file.md`, `hooks/session-brief.sh` | Donchitos |
| "Not checked" as a gate and doctor result; a check counts once seen failing | `gate-review`, `director` | Donchitos |
| Joining a game already under way | `director init`, `references/adopt.md` | Donchitos |
| Docs' versions match the project files | `director` doctor | Donchitos |
| Ad results as a fixed set; pause owners; randomness rules; safer saves | `TECH.md`, `project-rules.md`, `monetization` | awesome-gamedev |
| Growth-economy pacing, offline earnings, odds from one list | `systems-design.md`, `ECONOMY.md`, `monetization` | awesome-gamedev |
| Bad release plan; soak test; cheating and data-leak pass; release notes from commits | `launch-live`, `mobile-perf-budget`, `gates.md`, roles | Donchitos |
| Tests that prove something (fail with the fix undone; targets not computed by the code under test) | `qa.md`, `TECH.md` §8 | superpowers |
| Game feel as a recipe with a strength table; UI checks; audio mix rules; checks on AI-made art | `references/game-feel.md`, `STYLE_BIBLE.md`, `ui-ux.md`, `audio.md`, `artist.md` | awesome-gamedev |

Two figures were written as starting points to verify with `indie-studio:research` before use, because the
helpers had no web access: the flash limit (about three per second) and the mobile loudness target.

## Left for later (worth doing, needs research or its own branch)

1. **Agent-run tests of the plugin's own skills** (superpowers): run each scenario once without the plugin and
   once with it, record the excuses an agent gives for skipping a rule, and close each loophole; pressure
   scenarios that combine time, sunk cost and authority; headless trigger checks. Today all scenarios in
   `docs/TESTING.md` are run by hand. Check `claude plugin eval` with `indie-studio:research` first.
2. **A script that tests the hooks** (superpowers): the session brief and git hooks run against fixture
   folders with no model, replacing about nine hand-run scenarios.
3. **Audit past sessions from their transcripts** (superpowers): a read-only `plugin-feedback audit` mode that
   lists requests that should have started a skill but did not, and "done" claims with no tool result behind
   them. The transcript format belongs to Claude Code and must be verified first.
4. **Skill-writing rules learned from tests** (superpowers): match the fix to the kind of failure (firm wording
   and a list of excuses for rules skipped under pressure; a positive recipe for output of the wrong shape; a
   required template slot for a missing element); descriptions say only when to use a skill; a size limit per
   skill checked by `scripts/check-plugin.sh` (the reload limit after a compaction needs verifying).
5. **A read guard for big documents** (Donchitos): an optional hook that answers a whole-file read of a huge
   log with its headings. Wait to see whether the archive rule in this branch is enough.
6. **Path-scoped project rules** (Donchitos): rules that load only when matching files are touched, to keep
   the always-on project rules short.
7. **A digest of engine changes since the model's training** (Donchitos), as a `research` reference.

## Not adopted (would fight indie-studio's design)

- Many agents in tiers, review panels and director agents: indie-studio uses one agent that changes hats.
- Its own gates and an epic-to-story pipeline: indie-studio has seven gates and task briefs.
- Asking "May I write?" before every file write: the permission system already covers this.
- A strict test-first rule for all code: it fights the throwaway prototype and feel-driven tuning. Only "a
  bug-fix test must fail without the fix" was kept.
- A one-hour prototype called a "vertical slice", the AI picking the art direction, and an easily edited save
  file as the default for games that sell currency.

## Proposal: the tool scout (the human's idea, waiting for a yes)

The human asked for a way to stay up to date with new tools for Claude Code, weekly or on call, and for the
studio to suggest a search when a task is beyond what the AI can do with confidence.

**Recommendation: build it into indie-studio, not as a second plugin.** The pieces already live here:
`toolchain` connects and checks tools, `research` section 8 evaluates new AI tools, `ai-delegation` has the
three-strikes stop, and `asset-pipeline` decides who makes each asset. A second plugin would repeat the vetting
rules, add to the skill-list budget, and could not see those moments where a gap shows.

Shape:
- **On call:** `toolchain scout [topic]` searches official marketplaces and registries, vendor changelogs and
  trusted lists, and, only when the human allows it, their own tech newsletters (read-only).
- **Weekly:** the studio offers to set up a scheduled task that runs the scout and writes a dated digest. The
  plugin cannot schedule itself; the human approves the task.
- **In the flow:** when a gap shows (three strikes on one problem, low confidence on an asset class, or a
  request no installed tool covers), the AI says so in one line and asks before searching.
- **Output:** a short digest per run (what it does, official or community, the gap it fills here, cost,
  licence, security notes, verdict: try, watch or skip). It never installs: installing goes through
  `toolchain connect` and the human's approval, with the vetting checklist.
