# Proof before "done"

An agent's "done" is a claim. This file turns the claim into something the human can trust: it names the
check that proves it, the check ran after the last change, and its result is in the message. It applies to
every agent, subagent, and session, and to the task brief's Result section.

## 1. The rule
Before you write any word that means finished (done, fixed, works, passing, ready, matches the design):
1. Name the check that proves that exact claim (section 2).
2. Run it now. A result from before the last edit does not count.
3. Read the output yourself, all of it, not only whether the command reported success or its last line.
4. Put the result in the message: the command and its result line, the test's name, or the capture's path.

Every check ends in one of four results:

| Result | Means |
|---|---|
| **Met** | It ran and passed; the proof is named |
| **Not met** | It ran and failed; say what failed |
| **Not checked** | It could not run (no device, no sound, no access, skipped); say why. Never reported as met |
| **Not applicable** | There is nothing to check, with the reason. "It is only logic" is not a reason when a player can see the result |

Report failures first, then what was not checked, then what passed.

Words that claim without proof: "should work", "looks right", "probably fixed", "tests pass" with no run in
this turn, "done!" before the check. When you catch one, run the check or write "not checked" and why.

## 2. What each check proves
Pick the check that matches the claim. Several claims need several checks.

| Check | Proves | Does not prove |
|---|---|---|
| Compiles, no errors in the editor | The code builds | That it runs, or that the scene or level loads |
| A build for the target platform | A package can be made with these settings | That it starts on a phone, or runs well there |
| Automated tests of game rules | The tested cases give the right outcome | Untested cases, the screen, feel. Counts only once the test was seen failing (section 3) |
| A scripted run, bot, or headless play (no window drawn) | A state can be reached without errors; numbers over many runs | Human timing, readability, feel. A headless run may draw nothing |
| A still capture of the running game | Layout, clipping, colour, contrast, missing letters, in that state, at that screen size | Motion, timing, sound, touch, smoothness, other screen sizes |
| A video of the running game | Motion and timing in that state | Sound (unless recorded with it), feel in the hand, speed on other phones |
| A run on an emulator (a phone simulated on the computer) | It starts, screens connect, layout at that size | Speed, heat, memory limits, real sensors, the real store, real sound |
| A faked store or ad result (a test feeds the game each answer the SDK can give) | The game's handling of each answer | The real network, the store or ad account setup, the SDK's own settings |
| The human plays a build on a real phone, sound on | Feel, sound, and speed on that phone | Other phones; the low-end check is its own (`indie-studio:mobile-perf-budget`) |
| Reading the code | What the code says | Never enough alone for a behaviour, feel, or speed criterion |
| A subagent's or tool's report | Nothing yet: it is a claim | Check its file on disk (section 6) and the diff, and re-run the check |

"Fixed" means the original symptom was re-tested with the original steps, where it first happened (editor,
build, or phone), and is gone.

## 3. Watch a new test fail
A test for a bug is run once against the broken code (before the fix, or with the fix undone) and seen
failing, then passing with the fix. A check that guards a number (balance, economy, price) is seen failing
once by breaking that number in a throwaway change. A test that only asserts "no error" or "something changed"
proves nothing: it must assert the exact outcome the player should get.

## 4. Look at the running game
A change a player can see is checked in the running game, in the exact state it touched, before it is called
done. Open the capture and look at it; a capture you did not open is not proof. Report one line per change:
- `Seen: <what was on screen> (<capture path>)`
- `Not checked: <why>`: a UI or visual task stays open, or the item goes on the human's list
- `Nothing visible: <why>`

**Reaching the state.** A debug shortcut (jump to a level, set the currency, open a screen; noted in
`docs/TECH.md` with the other debug tools, and stripped from release builds), a launch option, or a deep link
reaches a deep state fast.
Say how the state was reached. When the claim is about the way there (a button, a tap order, a transition),
reach it with the player's own input, tapped or scripted, not by setting it from code.

**Capture a normally running game.** An editor that is not playing, or a batch or headless render, can skip
drawing or freeze motion ([design-match.md](../../asset-pipeline/references/design-match.md), section 5; for
a screen with an approved design, follow that whole file). A still cannot show motion, timing, sound, or feel:
those go on the human's list.

## 5. Check each step of a flow
Flows break between their steps, and the end state can look right anyway. Check the state after every step:
- Pause, open settings, go back, resume: the game stays paused until resume, and the tap that closed a panel
  did not also press what was under it.
- Win, collect a reward, unlock, leave: the reward is granted once, and the next level starts clean.
- Start a run, switch apps or take a call, come back: the run resumes where it was, and no timer ran on.
- Buy, close the game before the answer arrives, reopen (with the store faked): the item is granted once.

When a scripted step fails, save the game state and a screenshot from the same moment, so each explains the
other.

## 6. Scope and hand-offs
- **Files changed vs allowed.** Run `git diff --name-only <base>...HEAD` (the base is the branch the task
  started from, usually `develop`). Name every file outside the brief's "Allowed to touch", with the reason.
  Name any rule or tuned number in `docs/` or the data files that changed without the brief asking for it.
- **A subagent's output.** A brief to a subagent names the file it must write. Its work counts only once that
  file exists on disk and holds the result, whatever its reply says. If the file is missing, resume the same
  agent and ask for the file, or a plain "could not" with the reason. Never fill its part with your own guess.

## 7. Where the proof goes
- The task brief's Result: one row per acceptance criterion, with its result and proof
  (`${CLAUDE_PLUGIN_ROOT}/templates/docs/TASK_BRIEF.md`). The brief's Status becomes done only when every
  criterion is met, or the human has accepted the open ones by name.
- The merge summary (`indie-studio:ai-delegation`, section 5) and a delegate-mode review file
  (`indie-studio:session`) repeat it in plain words.
- What no check of yours could cover (sound, feel, a real phone) goes to the human as one thing to try each.
