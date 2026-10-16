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
| 24 | Set `experience: experienced`, start a fresh session, and ask what to do next | The brief shows `Experience: experienced`; a one-line recap; industry terms without explanations; no beginner-trap lists. It still asks before anything hard to undo, public, or paid |
| 25 | In the GDD stage, say: "let's plan how the code is organized" | It writes `docs/TECH.md` from the template: architecture map, save format with a version number, one wrapper per service, text rules, build settings, a test plan. It asks before adding any package |
| 26 | In Production, ask to add a new field to the save data | It raises the save version, adds a migration and a test, updates `docs/TECH.md` in the same branch, and runs the tests before saying "done" |
| 27 | Say: "set up CI" | It checks today's options with research, asks you to put the engine licence and signing secrets into the CI service's own settings, shows the pipeline diff, and proves CI can fail with a deliberately failing test |
| 28 | In the GDD stage of a level-based game, ask for "the level plan" | `docs/LEVELS.md`: building blocks and where each is taught, template rules, a checklist with a proven clear, difficulty bands researched with a source and date, and the rule that every level is winnable without paying |
| 29 | At Kickoff, ask: "which languages should we support?" | An answer from the market check and the soft-launch countries, store page first, recorded in the business case. At the Vertical Slice it runs a pseudo-translation pass |
| 30 | Ask: "how will people find this game?" | The three routes with trade-offs, the publisher terms to read, and a marketability test offered after the prototype if the plan depends on paid players. It never spends or creates accounts |
| 31 | In Live Ops, ask: "is there anything the stores need from us?" | It researches the current requirements (for example the Android target version), puts each deadline in the compliance calendar with a start date two months early, and cites sources |
| 32 | Give the next gate a Planned date and a later Forecast date in the Gates table, then start a fresh session | The brief shows both dates and "SLIPPING"; Claude offers scope options through `scope-guard` (cut scope, never the polish buffer) |
| 33 | With the Unity plugin on, in Pre-Alpha, ask to add in-app purchases | The studio checks `docs/ECONOMY.md` and the wrapper in `docs/TECH.md`, uses Unity's own purchase skill for the engine steps, stays in test mode, and adds the faked-store tests |
| 34 | Say: "I want to hire an artist for the characters" | A brief built from the style bible and character sheets, the contract checklist (rights, AI use, third-party material, source files), payment by milestone, and ledger rows. You sign and pay |
| 35 | In Idea, say: "Give me game ideas; the goal is mainly money" | Each concept shows its audience, a fit score, and a hook score (pull, fresh but familiar, share engine, organic route) side by side, and the recommendation says why |
| 36 | In Idea, say: "make a quick playable demo of each concept" | Allowed: one small sketch per concept, outside the project folder, labelled throwaway. It says the real prototype still waits for Conception Exit |
| 37 | In Idea, say: "I already have this Unity prototype; is it worth continuing?" | The reusable parts listed, both scores for the build as it stands, your own plan kept as the baseline, two or three priced pivots, and a time-boxed test with a kill rule for any pivot you pick |
| 38 | With the organic route in `docs/BUSINESS_CASE.md`, ask for the soft-launch plan | The quiet worldwide shape, with the promotion held back for the global launch, and why (a few countries without paid installs bring almost no players) |
| 39 | Run the Conception Exit review on a plan that fits on raw hours but not on corrected hours | One verdict for the feasibility item, quoting the capacity rule; no "it depends which estimate" |
| 40 | In the Prototype, ask it to create the engine project | The empty project goes on `chore/<engine>-project`, gets a baseline build on the phone, is merged into `develop` after it asks, and only then is `spike/core-loop` branched from `develop` |
| 41 | At Kickoff, ask: "how many screens will the game have?" | The list already exists in `docs/PITCH.md`: one line per screen with its tier, and any screen left out has its reason |
| 42 | After Kickoff, ask to move the feature a retention target relies on out of the first release | `scope-guard` names the target that feature carries and offers to keep it, replace it, or lower the target (recorded) before anything moves |
| 43 | In a roguelite spike with hand-typed targets, before the outsider round, ask: "is it ready for playtesters?" | It proposes a simulation first: a careful and a random bot on fixed seeds, the careful one checked against the random one, then pass rates per round, the skill share, power against targets, and dead or dominant picks |
| 44 | Say: "launch with everything; the date does not matter" | The tiers keep their cutting order, the first-release line becomes T1-T3, Planned dates are derived from the estimate instead of left blank (a latest acceptable date is offered), and the replaced decisions are marked |
| 45 | Work a session, then run `/indie-studio:session wrap` | The journal records the AI session time and asks for your own hands-on hours separately. At the next weekly review, the forecast comes from your hours |
| 46 | With a few decisions recorded, say: "move the target date two months later and drop the leaderboard" | The re-plan checklist runs: re-estimate, new Planned dates, business case and risks updated, replaced decisions marked superseded or amended, and a dated note on documents the change makes stale |
| 47 | In the Prototype, say: "I played 3 runs, here are screenshots, something feels off" | The points sorted into tuning, design, scope, and bugs, the numbers behind the tuning points, one change to try first, and a record in `studio/playtests/<date>-00.md`. Outsiders come next |
| 48 | At the Vertical Slice of a game that used a prototype simulator, ask to rebuild the rules | One rules library with no engine dependency, used by the game, the tests, and the simulator; the old simulator retired; the key balance targets become automated checks |
| 49 | Verify a store rule with research, then wrap the session (no studio-wide file yet) | It asks once whether to keep a studio-wide knowledge file outside the project and records your answer. With yes, the `general` entry is copied to `~/.indie-studio/KNOWLEDGE.md`, and research in a new project reads it before searching |
| 50 | Answer an open question during a session, then wrap | The question is gone from Open questions, and its answer is in `studio/DECISIONS.md` or the journal |
| 51 | Give the state seven next actions, the second one about 400 characters over four lines, then start a fresh session | The brief shows whole items; the long one ends with "(continued in STUDIO_STATE.md)"; the list ends with "(+2 more in STUDIO_STATE.md)". Nothing stops mid-sentence unmarked |
| 52 | Make two code commits, commit a state update without moving `last_synced_commit`, add two commits that touch only `docs/`, restart | No stale warning. One more code commit, then a restart: the warning counts exactly one code commit |
| 53 | Open a project whose state has no `plugin_version` (or an older one) | The brief says PLUGIN VERSION. `director doctor` lists what the notebook is missing, version by version, in two groups ("add now", "needs a decision"), changes nothing before you agree, then sets `plugin_version` |
| 54 | With `experience: new` and three balance choices pending, ask "what should we do about the difficulty?" | One decision per message, starting from what you saw in play; each option in one plain sentence with an example; no labels invented in the session; at most two numbers; how sure it is. After a one-click yes, a plain restatement before it is recorded |
| 55 | Work a session with `Track my own hours: no`, wrap, and later hold a weekly review | The wrap never asks how long you worked. The journal records the AI's time and what finished; the forecast comes from finish dates (the calendar ratio) |
| 56 | With two estimate-versus-actual lines in the journal, ask what a batch of small changes will cost | The AI-hours figure is scaled by the measured AI ratio and names its basis ("from T-012 and T-014"); never a human coder's hours |
| 57 | Say "decide for me overnight and leave me notes", with three tasks, one of which needs a price and a merge | The delegation is recorded and survives a compaction (the brief repeats it). Small calls become provisional decisions; the price and the merge stay proposals; branches are stacked; a review file lists the decisions, the proposals, and the merge order, and the first open question points to it |
| 58 | Approve a gate in a setup that refuses the AI's merge into `main` or its tag | No retry. You get the commands one per block, the step is marked pending and recorded in Permissions, and the Gates table names the tag only once it exists |
| 59 | At intake, say "I can't get anyone to test in person" | The Testers line is recorded; the plan names remote routes and the remote survey; the outsider kill rule is worded for evidence you can really get |
| 60 | Testers answered a form last week; ask for another outsider round in the same stage | It points to the tester budget, offers passive signals or the next milestone build instead, and protects a store's required closed test |
| 61 | Say "I only have a flagship phone; simulate the low-end test" | It measures memory and start time on your phone, proposes named low-end devices in the cloud (verified with research), and plans no gate on a store's automated report arriving |
| 62 | In Pre-Alpha, with an ad network that has no test ad units, ask to "start the ads in test mode" | It looks up how this network tests, plans a live switch that stays off until Beta and a registered test device, and never says "switch to production IDs at Beta" |
| 63 | With a store closed test running, ask to "start the purchases in test mode" | The live switch, the store's test accounts, your setup steps in order (including any upload needed before a product can exist), a restore that re-reads the store, and no working buy button in any store build |
| 64 | Choose an analytics provider while the events table has a parameter named `day` or `value` | It reads the provider's naming rules, flags the clash before the wrapper is built, and keeps the reserved list as a test fixture |
| 65 | Ask to "blur the whole background behind the tutorial tip" | It names the UI/UX designer hat, mentions the usual dim-and-highlight approach and its cost on the phone, recommends, then builds what you choose |
| 66 | In the GDD stage of a game whose roadmap adds two modes and a leaderboard, ask for the UI flow | A screen map for every tier and the roadmap, with room on the home screen for a mode switcher; a spec per screen with its states, exits, and back-button action |
| 67 | In Pre-Alpha, ask to add another corner button to a crowded title screen for a new feature | Scope-guard asks where the feature's way in lives on the screen map and proposes changing the navigation first |
| 68 | Review a slice with a pause screen, a run intro, and "New game" over a saved game | The usability review flags the one-tap wipe and any tip shown under a panel, and gives Back an action on every screen |
| 69 | Ask for "an onboarding tutorial" | It asks which kind you mean (a guided first game, hints during play, or both) before building, and proposes the default with skip and replay |
| 70 | Build a screen from an approved HTML mockup | Before you look, design and build are captured at the same size and compared by measurement and side by side; every difference is listed as deliberate or to fix |
| 71 | Ask it to make a screen better than its approved design | Additions stay inside existing screens, in the design's style, are listed under "Beyond the design" for your approval, and the design is updated once you approve |
| 72 | Ask for a review video of an animated screen | It checks that motion shows in the capture (or records the running game) and says what the capture cannot show |
| 73 | Ask Claude to draw the UI icons in code | A shared style module, renders at the import density, a contrast and colour-blind check before the three samples, and a golden set compared byte for byte |
| 74 | Hand over a build with new sounds | An automated test proved the game can make sound (output exists, clips load, music assigned), and the hand-over says the AI has not heard them |
| 75 | In a game where the player picks upgrades from offers, with 9 in the pool and 7 picks a run, run the choice-health check | It searches for the best fixed pick list, compares it with a reader of the run, warns that a good fixed order will exist at this pool size, and measures dead options by never taking them |
| 76 | Say "it feels randomly too easy or too hard" while the averages look fine | It measures the spread of per-deal pass chances (percentiles, hopeless share), checks any spread goal against the curve's bound, and judges a deal floor together with the player's build |
| 77 | Add 8 items to a tuned pool of 12 | It re-measures the whole game with the full pool at every difficulty level before sizing the new items, and asks you to choose between holding the old power and re-tuning |
| 78 | Ask which upgrades "work well together" | Pairs measured apart from strength, each strong pair with a reason a player would see; one strong all-rounder is not named everyone's partner |
| 79 | The slice's first balance check fails its goal by a point | It keeps the goal, measures candidate fixes with the tool, records them, and asks you; it never edits the goal |
| 80 | At the end of the GDD stage, say "let's move to the Vertical Slice" | It checks the GDD stage's steps (not the Vertical Slice gate), asks for approval, changes the stage, and neither tags nor merges into `main` |
| 81 | In the GDD stage, start a design document | It works on a `docs/<doc>` branch from `develop` and merges with your approval |
| 82 | With no CI yet, ask to merge a finished task | The one-command build and the tests both run before the merge question, and the summary names each result |
| 83 | Remove two scripts with `git rm`, then ask to commit an unrelated art change | The deletions do not ride along in the art commit |
| 84 | Start work in a new worktree of a project with LFS art | It checks for pointer files and runs `git lfs checkout` before the engine opens the folder, and warns that the first import is long |
| 85 | At a weekly review, add a few small features inside tier 2 worth a tenth of the remaining work | Cost, capacity check, and a decision; no separate gate-level review |
| 86 | While a task adds new effects, ask to apply them to older parts of the same screen too | It costs it, records a decision, and builds it without calling it off-limits; the polish buffer is untouched |
| 87 | Share a creator pass in which a run with a known seed was lost | It places your score among random plays of that deal and labels it "hard deal", "missed plays", or "fine"; a second pass that day is saved as `-00b` |
| 88 | Ask "does the simulator match the game?" | It proposes a fixed bot on fixed seeds run inside the engine and compared game by game with the simulator |

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
4. Check that `homepage` and `repository` in `plugin.json` and the install line in the README point at the
   plugin's repository (`plugin-feedback` builds its issue links from `repository`).
5. Merge `develop` into `main` with `--no-ff` and tag `vX.Y.Z`.
