---
name: ai-delegation
description: Rules for handing game-development work to AI coding agents, subagents, editor-control tools, and generators. Use when delegating a task, writing or updating the project's CLAUDE.md or AGENTS.md rules, planning multi-step or parallel agent work, reviewing agent-written code before a merge, or when an agent keeps failing at the same problem. Provides task briefs, a delegation matrix, the three-strikes rule, the checkpoint-before-big-runs rule, and the human review protocol.
argument-hint: "[task to delegate or brief to write]"
---

# AI delegation

AI agents are fast and tireless, and they can also drift, invent APIs, and quietly break things. These
rules keep the speed and remove the damage. Communication rules:
[communication.md](../director/references/communication.md).

## 1. Context in three layers
| Layer | File | Holds | Size rule |
|---|---|---|---|
| Now | `STUDIO_STATE.md` | Phase, stage, next actions | About 80 lines |
| Rules | `CLAUDE.md` (and `AGENTS.md` if other tools are used) | How to work in THIS project | Under about 100 lines; project-specific only |
| Specs | `docs/*.md` | Detail per subsystem (GDD, style bible, data formats) | Read only when working on that subsystem |
Every line in CLAUDE.md must prevent a real mistake; delete lines that do not. When an agent repeats a
mistake twice, add one line. Start from [project-rules.md](references/project-rules.md) once the engine is chosen
(Pre-Production, Prototype stage) and adapt it to the engine and language.

## 2. Write a task brief before delegating
Copy `${CLAUDE_PLUGIN_ROOT}/templates/docs/TASK_BRIEF.md` to `studio/tasks/T-###.md` (a short inline brief
is enough for tiny tasks). It states: why (which scope tier), what to build, acceptance criteria that can be
tested, the files or areas the agent may touch, what is out of scope, how to verify, and the estimate.
Size: one session or about four hours at most. Split anything bigger. Vague briefs cause drift.

## 3. Delegation matrix
| Work | Agent alone? | Human involvement |
|---|---|---|
| Boilerplate, glue code, data files | Yes | Skim the summary |
| Gameplay logic | Yes, with tests | Playtest the result |
| Architecture, new packages or SDKs, engine settings | Proposes only | Approves before anything is installed |
| Scenes, prefabs, resources | Through engine tools only | Look at the result in the editor |
| Art and audio generation | Drafts | Curates, cleans, approves (`indie-studio:asset-pipeline`) |
| Balance numbers | Proposes | Playtests |
| Store, legal, accounts, money, credentials | Drafts text only | Does it personally |
| Deleting, renaming across the project, history rewrites | No | Explicit approval first |

## 4. Rules every agent follows
1. Read STUDIO_STATE.md and the task brief first. Touch only the allowed files.
2. **Checkpoint first.** Before a large change, make sure the working tree is clean (commit or set aside) on a
   branch made for this task, so undo is one command (`indie-studio:git-workflow`).
3. Verify engine and SDK calls against the docs for the installed version. Never invent an API
   (`indie-studio:research`).
4. Run, compile, or test before saying "done". Report results honestly, including failures and skipped steps.
5. **Three strikes.** After three failed attempts at the same problem, stop. Do not keep patching symptoms, and
   do not widen the scope by rewriting things to "fix" it. Write a short summary (what was tried, what is now
   known, two or three hypotheses), then offer the human these options with one marked as recommended. The
   human may not be able to read the code, so give them choices they can act on:
   - **Fresh session** (`indie-studio:session`, compact mode): failed attempts crowd the context and cause
     repeats. Often the cheapest fix.
   - **Look it up** (`indie-studio:research`, section 5): the exact error text with the engine and version,
     plus the engine's issue tracker.
   - **Make it smaller** (`indie-studio:scope-guard`): cut or simplify the feature, or reach the same result
     another way. Anything that has cost three failed attempts is rarely worth its tier.
   - **Ask people:** draft a question for the engine's official forum or community with the version, the exact
     error, what was tried, and the shortest steps to reproduce. The human posts it under their own account.
   - **Hands on:** talk the human through the step in the editor and watch what comes back.
   When it is solved, record the cause and the fix in `studio/KNOWLEDGE.md` so the next session does not repeat it.
6. No new dependencies, packages, or SDKs without approval. No unrelated refactors. No secrets read or printed.
7. Subagents get a brief and return short findings. Only the main thread edits STUDIO_STATE.md, so updates do
   not collide.
8. Parallel agents work on separate branches or worktrees, never in the same folder.

## 5. Reviewing before a merge
For every change to be merged, give:
1. A summary of what changed and why: in plain language for `new` (the human may not read code), short and
   technical for `experienced`, with the diff or the files to read.
2. The riskiest part, and anything touching save data, purchases, permissions, or networking.
3. How to test it (exact steps on the device or in the editor), and whether the automated tests passed.
4. The size of the change (files and lines).
Then ask before merging into `develop`.

## 6. Closed-loop testing
Where the engine allows it, let the agent run the build or the game headlessly (or through an editor-control
tool), read the console errors, and fix them, within the three-strikes limit. What tools exist changes
quickly: verify the current options for the chosen engine with `indie-studio:research`. Never let a loop run
unattended past its retry limit.

## 7. Planning bigger work
For anything spanning several files or systems, plan first (use plan mode if available), agree the plan with
the human, then delegate the steps as separate briefs in dependency order. The plan lives in `docs/` or the task
briefs, not only in chat.

## 8. Keeping the rules useful
Review CLAUDE.md at each gate: remove stale lines, add the lessons from repeated mistakes, keep it short.
