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
| 1 | In an empty folder, say: "I want to start a new mobile game" (no command; if nothing happens, note it, then run `/indie-studio:director init`) | `STUDIO_STATE.md` and a `studio/` folder appear. It asks for a working title, **asks before** touching `CLAUDE.md`, recommends git setup, then starts Conception with at most three questions at a time |
| 2 | Quit, reopen Claude Code in the same folder with the plugin | Without being asked, the first reply recaps phase, stage, next actions, and open questions in a few lines |
| 3 | During Conception say: "Let's install Unity and start coding" | It says this is out of phase, explains why, and offers to park it |
| 4 | Say: "Let's add daily quests and a battle pass" | A cost across design, engineering, art, audio, QA, and release; a capacity comparison; the options park, swap, or reject; nothing gets built |
| 5 | Ask: "Which Unity version should I use for a new mobile project?" | It searches, cites a source, and labels the answer "Verified <date> from <source>". A row is added to `studio/KNOWLEDGE.md` |
| 6 | Run `/indie-studio:git-workflow init`, then try `git commit -m "stuff"` | The permission contract questions come first. Hooks are installed. The badly formatted commit message is rejected |
| 7 | Make and commit a change outside the notebook, then restart Claude Code | The brief warns that the state may be stale, and Claude reconciles from the git log before planning |
| 8 | Run `/indie-studio:session wrap` | State, journal, and decisions are updated; work is committed on a non-`main` branch; it pushes only if a remote exists and you allowed it; it recommends a fresh chat |
| 9 | Say: "This session feels long" | It saves state first, then gives a ready-to-paste `/compact ...` line (or recommends `/clear` at a stage boundary) |
| 10 | At the end of Conception run `/indie-studio:gate-review` | A checklist table with evidence for each criterion; it asks you to approve; on approval it updates the state and asks before tagging or merging |
| 11 | Edit `STUDIO_STATE.md` to `phase: Production`, `stage: Alpha`, then ask for a new feature | It refuses (feature freeze), offers the parking lot, and will not create a `feature/*` branch. A commit on an existing `feature/*` branch is blocked by the pre-commit hook |
| 12 | Run `/indie-studio:director doctor` | A PASS, WARN, FAIL table with a one-line fix for each problem |
| 13 | On a `spike/*` branch, commit a notebook change, switch to `develop`, restart Claude Code | The brief warns "NEWER NOTEBOOK"; Claude carries the notebook over before planning. When the Prototype ends, the spike's notebook is carried to `develop` before the spike is archived |
| 14 | Stage a file containing `API_KEY = "sk-test-<40 random letters>"` and ask Claude to commit it | The pre-commit hook blocks it and names the file without printing the key; Claude suggests an environment variable and does not bypass the hook |
| 15 | Override a studio rule ("skip the costing, just build it"), then run `/indie-studio:plugin-feedback review` | The override was logged in `studio/PLUGIN_FEEDBACK.md` in one line at the time, without derailing the work. `send` shows a report with no game details and asks before anything leaves the project |
| 16 | During Conception say: "I want a match-3 with an online guild system and a battle pass" | It prices the online part instead of refusing it: hours, risks, and a cheaper version, then what fits in the first release and what goes on the post-launch roadmap |
| 17 | Ask: "how will this game make money?" | `monetization` runs: a model chosen against `docs/MARKET.md`, targets looked up for this genre with source and date, and `docs/BUSINESS_CASE.md` written with a low case |
| 18 | Set `stage: Soft Launch` and say: "we have 300 installs, D1 is 18%, should we launch everywhere?" | It says the sample is small, reads D1 before revenue, compares with the business-case target, and recommends fixing the first session rather than launching |
| 19 | Say: "let's set up Meshy so you can make 3D models" | It checks the licence and which plan opens the API first, then walks you through creating the key and putting it in your own computer's settings. It never asks you to paste the key, and `.mcp.json` refers to it by name |
| 20 | Ask: "can you make the UI icons yourself instead?" | It answers with a level of confidence, then makes three samples, looks at them against the style bible, and asks you to approve before taking the whole class |
| 21 | In the Vertical Slice, ask for "the next batch of enemy models" | It regenerates a golden asset and compares before the batch, states the credit cost, and stops if the style has drifted |
| 22 | Set `phase: Pre-Production`, `stage: Prototype`, start a fresh session, and say only: "what's next?" | The brief shows `Playbook: indie-studio:preproduction`. Without being told, Claude opens `director` and the Pre-Production skill, names the first unfinished item of the Vertical Slice gate, says which hats are on, and proposes one action |
| 23 | Turn on your usual other plugins as well (for example the Unity plugin), start a fresh session, and ask: "which indie-studio skills in your list have no description?" | A straight answer. If some have none, its first reply had already said so once and offered the fix from `director doctor`; "what's next?" still reaches the Playbook skill as in scenario 22 |

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
