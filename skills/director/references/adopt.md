# Joining a game already under way

Use this when `director init` runs in a folder that already holds a game. The studio then starts at the stage
the game has really reached, not at Conception/Idea, and what earlier gates would have asked for becomes a
numbered catch-up plan. Walking gates that no longer apply wastes weeks. Skipping their missing pieces in
silence is how a released game loses its players' saves or its signing key.

## 1. Look first (read only)
Gather evidence before asking anything, and change nothing yet.

| Look at | Where | What it tells you |
|---|---|---|
| The engine project | the engine's own project file, for example `ProjectSettings/ProjectVersion.txt` (Unity), `project.godot` (Godot), a `.uproject` file (Unreal) | Pre-Production at least; the engine and its version |
| Git history | the commit count, the first and last commit dates, `git tag`, `git branch -a` | how long it has run; release tags |
| Builds | build folders, installable files (`.apk`, `.aab`, `.ipa`), a build script, CI settings | whether it builds, and how |
| The game itself | its scenes or screens, menus, the save code, the SDKs in the package manifest | how much of a full game exists |
| Documents | a design document, notes, a README, a task list | the plan the human has followed so far |
| Store and players | ask the human: a store page, a test track, a release, reviews, analytics | Launch-Live, if anyone outside plays it |

For an engine not listed, look for its own project file. Never sign in to a store console or any other account
to look: the human tells you, or shows you.

## 2. Place the project
Pick the latest stage the evidence supports. Judge by what the game does today, not by what its documents
claim or how long it has taken. When it sits between two stages, take the earlier one and say why.

| The evidence shows | Phase / stage | `next_gate` |
|---|---|---|
| Notes or an idea, no engine project | Conception / the stage its notes reach | Conception Exit |
| An engine project with a rough playable loop | Pre-Production / Prototype | Vertical Slice |
| One part of the game at final quality, or being built to it | Pre-Production / Vertical Slice | Vertical Slice |
| Launch to a full session and back to the menu, mostly placeholders | Production / Pre-Alpha | Alpha |
| Every planned feature in; content still being made | Production / Alpha | Beta |
| Content complete; fixing and polishing | Production / Beta | Gold Master |
| Released on a test track or in a few countries | Launch-Live / Soft Launch | Global Launch |
| Released everywhere, with players | Launch-Live / Live Ops | `none` |

Gates before that stage get the Status `adopted` in the Gates table, with no Passed date and the Evidence
"joined at <stage> on <date>; see studio/CATCH_UP.md". They get no tags: a tag marks a gate the human passed.

## 3. The catch-up plan
Go through every gate and stage close before the starting stage
([gates.md](../../gate-review/references/gates.md)). Mark each item met (with the evidence), missing, or not
relevant to this game (with the reason). Write the missing ones to `studio/CATCH_UP.md` as one numbered list,
each with the gate it comes from and the smallest step that closes it. Order them by what it costs to find
out late:
1. **Loss that cannot be undone:** a remote backup of the repository; secrets out of git; a version number in
   every save file before more players have saves; once anything was uploaded to a store, the signing key
   backed up in two private places and, for a released game, a bad-release plan (`indie-studio:launch-live`,
   "Bad release plan").
2. **Whether the game is worth finishing:** the business case (the model, and targets with source and date),
   the scope tiers with the first-release line, Planned dates for the gates ahead, and the risks with kill
   criteria.
3. **What keeps the AI on track:** project rules in `CLAUDE.md`, `docs/TECH.md` written from the code as it
   is, and the design document written from the build as it plays.
4. **The rest:** the style bible, asset ledger rows for assets already made with AI or bought, playtest notes.

Group 1 comes before any new feature. The rest are worked in with the stage's own tasks, and the next gate
review checks the list. When it is empty, move the file to `studio/archive/`.

## 4. Fit around what exists
- Never overwrite or rewrite the human's files. An existing document stays where it is: the studio's home for
  that subject points to it (one line at the top of, say, `docs/GDD.md`), or it moves only with the human's yes.
- Keep the repository as it is: no new `git init`, no rewritten history. `indie-studio:git-workflow` (init
  mode) adds only what is missing, such as `develop`, the hooks, or ignore rules appended to the existing file.
- The logs start today. The journal gets one entry that sums up the history from `git log` (dates, milestones,
  releases); DECISIONS.md gets one entry, "Joined the project at <stage>", with the evidence. Do not rebuild
  old decisions one by one.
- Versions, store rules, and tool facts in old documents are checked again before anything relies on them
  (`indie-studio:research`).

## 5. Confirm, then hand over
1. Show the human, in plain words: the evidence in five to eight lines, the stage you recommend and why, and
   the first five catch-up items. Ask: "Start the studio at <stage>?" Placing the project is their call.
2. On yes, fill the front matter from the evidence (phase, stage, `next_gate`, hats, engine, platform, and
   `last_synced_commit` set to the latest code commit), "Off-limits right now" from the stage's row in
   [phases-and-stages.md](phases-and-stages.md), the Gates table, and the first three catch-up items as Next
   actions.
3. Hand over to the phase skill for that stage.

If the human is not sure the game is worth continuing at all, that is a different question:
`indie-studio:conception`, step 3 ("Salvage and pivot").
