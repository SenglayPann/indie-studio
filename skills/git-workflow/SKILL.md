---
name: git-workflow
description: Version control for game projects. Use for ANY git action (commit, branch, merge, tag, push, pull, revert, undo, checkpoint, save my work, back up) and to set up a repository in a game project (init mode). Applies phase-aware branching (throwaway spikes early, feature freeze after Alpha), the commit message convention, gate tags, safe undo, game-specific traps (engine cache folders, binary assets, .meta files, secrets), and the human's git permission contract.
argument-hint: "[init | status | commit | merge | tag | undo]"
---

# Git workflow

Git is the project's save system. In plain words: the `main` copy is your best working version; the
AI does risky work in **practice copies** (branches); good work is copied into the main line; bad work
is deleted with no harm. Communication rules: [communication.md](../director/references/communication.md).

If `$ARGUMENTS` names a mode, jump to it: `init` = section 1, `status` = section 7, `commit` = section 4,
`merge` or `tag` = section 3, `undo` = section 5. With no argument, use the section that matches the request.

Commit message format and examples: [commit-convention.md](references/commit-convention.md).
Engine-specific notes (Unity, Godot): [engine-notes.md](references/engine-notes.md).
Templates live in `${CLAUDE_PLUGIN_ROOT}/templates/git/`.

## 0. Permission contract (do this before the first git action)
In a Claude Code session, commits and pushes normally need the user's say-so. Agree it once, record it
in STUDIO_STATE.md under "Permissions" and set `git_permissions: set`. Propose this default and let the
user change it:

- **Pre-approved (no need to ask):** create branches; commit on `feature/*`, `content/*`, `fix/*`,
  `polish/*`, `spike/*`, `chore/*`; commit `chore(state)` updates; push those branches to `origin`;
  read-only commands (`status`, `log`, `diff`).
- **Ask every time:** merge into `develop`; anything into `main`; gate tags; deleting a branch that has
  unmerged work; `push --force`; `reset --hard`; `clean`; discarding changes (`restore`, `checkout --`);
  rewriting history; changing remotes or hooks; skipping hooks (`--no-verify`).

Until the contract is set, ask before every commit or push.

## 1. Init mode (new game repository)
One repository per game, at the game project folder root. Docs first; the engine project is added later.
1. `git --version`. If git is missing, help the user install it (verify the current install steps with
   `indie-studio:research`).
2. `git init -b main` (skip if a repo exists). If `user.name` or `user.email` is unset, ask the user for
   them; never guess.
3. Copy `templates/git/gitattributes-base` to `.gitattributes`, and `templates/git/gitignore-base` to
   `.gitignore`. When the engine is chosen, append `gitignore-unity` or `gitignore-godot`. If the engine is
   still undecided, do the engine part later, at project creation in Pre-Production.
4. Binary assets: when real assets start to appear (Vertical Slice at the latest) decide on Git LFS:
   check the host's current LFS storage and bandwidth limits first (`indie-studio:research`), then
   `git lfs install` and append `gitattributes-lfs`. Do this BEFORE the first binary asset is committed;
   fixing it afterwards rewrites history.
5. Hooks: copy `templates/git/githooks/` to `tools/githooks/`, run `git config core.hooksPath tools/githooks`,
   and mark them executable (`chmod +x tools/githooks/*` and `git update-index --chmod=+x` after adding).
   The hooks enforce the message format and block direct commits to `main`, oversized files, secrets,
   and engine caches. They work for the human and for agents.
6. First commit on `main` (docs only): `STUDIO_ALLOW_MAIN=1 git commit -m "chore: initialize game repository"`.
   This is the only direct commit to `main` there will ever be. Then `git switch -c develop`.
7. Remote (your backup if the disk dies): ask if the user has a GitHub (or other) account. The user creates
   an empty PRIVATE repository; you then run `git remote add origin <url>` and
   `git push -u origin main develop`. Never handle passwords or tokens; if authentication is needed,
   the user signs in themselves.
8. Agree the permission contract (section 0). Tell the user what was set up in three lines.

## 2. Branches
| Branch | Purpose | Rule |
|---|---|---|
| `main` | Last known-good, playable state | Only gate and release merges. Every gate merge gets a tag. |
| `develop` | Daily integration | Always opens and builds. Merge here only after the checks pass. |
| `feature/<scope>-<desc>` | One task or feature | Short-lived; branch from `develop`; delete after merging. |
| `content/<desc>` | Art, audio, levels | Same as feature, but separate so big binary changes do not bury code changes. |
| `fix/<desc>` | Bug fixes | Allowed at every stage. |
| `polish/<desc>` | Juice, tuning, small UX | Allowed after Alpha. |
| `spike/<idea>` | Throwaway experiments and prototypes | Never merged. When done: tag `archive/spike-<idea>`, then delete. Messy code is fine here. |
| `release/<x.y.z>` | Stabilizing Beta to Gold Master | Fixes only. Merge into `main` and `develop`. |
| `hotfix/<desc>` | Post-launch emergency fix | Branch from `main`; merge into `main` and `develop`. |

Names: lowercase, hyphens. Work on one task per branch. Parallel AI agents each get their own branch
(or `git worktree`); never let two agents edit the same working folder at once.

**Phase rules** (read `stage` from STUDIO_STATE.md):
- Idea to Prototype: `spike/*` is the normal way to work.
- From the Vertical Slice stage: `feature/*`, `content/*`, `fix/*` from `develop`.
- **From the Alpha gate onward: refuse to create new `feature/*` branches.** Only `fix/*`, `content/*`,
  `polish/*`. This is the feature freeze made mechanical; see `indie-studio:scope-guard`.
- Beta to Gold Master: cut `release/x.y.z` from `develop`; fixes only.

## 3. Daily flow
1. Start a task: `git switch develop`, `git pull` if a remote exists, `git switch -c feature/<scope>-<desc>`.
2. Before a big or risky agent run: make sure the tree is clean (commit or set aside), so undo is easy.
3. Work in small steps. Commit each logical change (section 4). Push the branch at least at wrap-up.
4. Finished: run the engine's compile or test check (the engine skill defines it), then show the user a
   plain-language summary of the diff and ask before merging into `develop`:
   `git switch develop && git merge --no-ff feature/... && git branch -d feature/...`.
   If the remote is GitHub, offering a pull request is a good way for a beginner to review the changes visually.
5. Gate passed and approved by the human: merge `develop` into `main` with `--no-ff`, create an annotated
   tag (table in [phases-and-stages.md](../director/references/phases-and-stages.md)), then push `main` and
   the tag (each needs the user's approval). Update the Gates table in STUDIO_STATE.md.

## 4. Committing
1. `git status` and `git diff --stat`. Read what is about to be saved.
2. Stage deliberately: name the files or use `git add -p`. Avoid `git add -A` unless status shows nothing
   surprising (no secrets, caches, builds, huge files).
3. Message: `<type>(<scope>): <summary>` per the convention, blank line, then a body that explains why.
   Add `Task: T-014` in a footer when a task ID exists. Add any attribution line the Claude Code
   environment asks for.
4. If a hook rejects the commit, fix the cause and commit again. Never bypass with `--no-verify` or the
   override variables unless the human explicitly asks.
5. Small and often: one logical change per commit; do not mix art, code, and config in one commit.
6. After a code commit, update `last_synced_commit` in STUDIO_STATE.md.

## 5. Safe undo
Always ask first for anything that discards work. Prefer the reversible option.

| Situation | Do this | Risk |
|---|---|---|
| Want to try something risky | New branch first | None |
| Undo edits to one file, not committed | `git restore <file>` (ask) | Loses those edits |
| Last commit was wrong, not pushed | `git reset --soft HEAD~1` | Keeps the changes staged |
| Bad commit already pushed or merged | `git revert <hash>` | Safe; adds an undo commit |
| Return to a milestone | `git switch -c fix/from-<tag> <tag>` | Safe; new branch |
| Something vanished | `git reflog` then recover | Usually recoverable |
| Whole experiment failed | Delete the practice branch (ask if it has unmerged work) | Loses that branch's work |

Never: `push --force` to `main` or `develop`; `reset --hard` or `clean -fd` without showing what would be lost
and getting a yes; amend or rebase commits that were already pushed.

## 6. Game-specific rules
- **Do not hand-edit scene, prefab, or resource files** (`.unity`, `.prefab`, `.tscn`, `.tres`, `.asset`).
  A wrong edit corrupts them silently. Use the engine editor or an engine tool/MCP server. If a merge
  conflict lands in one of these, stop and ask the user; do not "resolve" it by guessing.
- Unity: always commit `.meta` files; never commit `Library/`, `Temp/`, `Obj/`, `Logs/`, `UserSettings/`.
- Never commit signing keystores, API keys, or store credentials. Losing an Android keystore can block
  future updates: back it up somewhere private and outside the repo (tell the user; see `indie-studio:launch-live`).
- Large binaries go through LFS (section 1, step 4); text-based engine files stay out of LFS.
- Tag every gate; tags are the "bookmarks" the user can return to.
- Commit `STUDIO_STATE.md` and `studio/` with the project; they are part of the project's history.

## 7. Status mode
Report in a few lines: current branch and its purpose, uncommitted changes, commits ahead of `develop`
and of the remote, last tag, whether the phase rules allow this branch, and the next git action to take.
