# Hands-on test plan

Run these in a scratch game folder (not this repository) to see whether the plugin behaves the way it was
designed to. Each scenario says what to do and what you should see. Anything that does not match is a bug in
a skill: note which skill and what it said.

## Load the plugin
```
claude --plugin-dir "<path to this repository>"
```
Type `/indie-studio:` and check that the skills are listed. After editing skill files, run `/reload-plugins`.
Web search and fetch tools should be enabled for scenario 5.

## Scenarios

| # | Do this | You should see |
|---|---|---|
| 1 | In an empty folder, run `/indie-studio:director init` | `STUDIO_STATE.md` and a `studio/` folder appear. It asks for a working title, **asks before** touching `CLAUDE.md`, recommends git setup, then starts Conception with at most three questions at a time |
| 2 | Quit, reopen Claude Code in the same folder with the plugin | Without being asked, the first reply recaps phase, stage, next actions, and open questions in a few lines |
| 3 | During Conception say: "Let's install Unity and start coding" | It says this is out of phase, explains why, and offers to park it |
| 4 | Say: "Let's add daily quests and a battle pass" | A cost across design, engineering, art, audio, QA, and release; a capacity comparison; the options park, swap, or reject; nothing gets built |
| 5 | Ask: "Which Unity version should I use for a new mobile project?" | It searches, cites a source, and labels the answer "Verified <date> from <source>". A row is added to `studio/KNOWLEDGE.md` |
| 6 | Run `/indie-studio:git-workflow init`, then try `git commit -m "stuff"` | The permission contract questions come first. Hooks are installed. The badly formatted commit message is rejected |
| 7 | Make and commit a change outside the notebook, then restart Claude Code | The brief warns that the state may be stale, and Claude reconciles from the git log before planning |
| 8 | Run `/indie-studio:session wrap` | State, journal, and decisions are updated; work is committed on a non-`main` branch; it pushes only if a remote exists and you allowed it; it recommends a fresh chat |
| 9 | Say: "This session feels long" | It saves state first, then gives a ready-to-paste `/compact ...` line (or recommends `/clear` at a stage boundary) |
| 10 | At the end of Conception run `/indie-studio:gate-review` | A checklist table with evidence for each criterion; it asks you to approve; on approval it updates the state and asks before tagging or merging |
| 11 | Edit `STUDIO_STATE.md` to `phase: Production`, `stage: Alpha`, then ask for a new feature | It refuses (feature freeze), offers the parking lot, and will not create a `feature/*` branch |
| 12 | Run `/indie-studio:director doctor` | A PASS, WARN, FAIL table with a one-line fix for each problem |

## Offline checks (no model needed)
```
sh scripts/check-plugin.sh         # skill names, links, path references, shell and JSON syntax
claude plugin validate .           # manifest and marketplace
```
To test the hook by hand, create a folder with a `STUDIO_STATE.md`, then run
`CLAUDE_PROJECT_DIR=<folder> sh hooks/session-brief.sh`. It should print a brief. With no state file it should print nothing.

## What to note while testing
- Any reply that is too long, too technical, or uses jargon without explaining it.
- Any place a skill did not trigger when it should have, or triggered when it should not.
- Any question asked twice, or a recap that repeats information you already gave.
- Anything the AI did that you would have wanted to approve first.

## Before a release
1. All scenarios above behave as described.
2. `sh scripts/check-plugin.sh` and `claude plugin validate .` pass.
3. Update `CHANGELOG.md` and bump `version` in `.claude-plugin/plugin.json` **only**. Do not also set it in
   `marketplace.json`: Claude Code silently prefers the `plugin.json` value, so a stale second copy would hide
   updates. Users only receive an update when the version changes, so bump it on every release.
4. Fill `homepage` and `repository` in `plugin.json`, and the `<owner>/<repo>` placeholders in the README.
5. Merge `develop` into `main` with `--no-ff` and tag `vX.Y.Z`.
