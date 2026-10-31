# Debugging: find the cause before the fix

The three-strikes rule (`indie-studio:ai-delegation`, rule 5) limits how many fixes are tried. This file
decides how each one is chosen, so three attempts are not spent on three guesses. The fix comes after the
cause is found, never before.

## 1. Make it happen on purpose
- Write the exact steps and where it happens: editor, desktop build, emulator, or phone (which one). Note the
  save or the random seed (the number that fixes a random sequence) when progress or luck matters, and how
  often it happens (every time, one try in five).
- Check that you run the build you think you run: show the build number in the game or the log. A phone still
  holding an older install, or a stale build cache, explains many "the fix did not work".
- If you cannot make it happen, do not patch. Add logging around the suspected area, ask the human for the
  exact steps, or save the device log the next time it happens.

## 2. Read the evidence
- Read the whole error and its stack trace (the chain of calls that led to it). Start from the first error in
  the log, not the last: later ones are often side effects.
- On a phone, read the phone's own log too (on Android, `adb logcat` filtered to the game); some errors appear
  only there.
- An error you do not recognize: search its exact text with the engine and version (`indie-studio:research`,
  section 5).

## 3. Find what changed
- If it worked before, find the last commit, build, or version where it worked, and read what changed since
  (`git log`, `git diff <good>..HEAD`).
- When the list is long, halve it until one change is left (`git bisect` does this over commits; older builds
  can be installed the same way).
- Compare with a part of the same project that works (another screen, level, or button that does the same
  thing) and list every difference.

## 4. Find where it goes wrong
A value passes through several stages before the player sees it. Add a temporary log line at each boundary,
run once, and find where the value first goes wrong:
- a game rule, then its event, then the UI that shows it
- a save: the values in memory, then the file on disk, then the values after loading
- a reward or purchase: the answer arrives, then the game grants it, then the save records it
- a build: the project settings, then the package, then what the installed game does
The bug lives between the last right value and the first wrong one. Remove the temporary lines afterwards.

Usual suspects in game engines, worth checking early: a reference lost after a rename or a move (an empty
slot in a scene), import or platform settings that differ between the editor and the phone, code that runs on
one platform only, the order things start in on the first frame, and timing that changes with the frame rate.

## 5. One hypothesis at a time
1. Write the hypothesis in one line: "X happens because Y".
2. Pick the smallest test that could prove it wrong: a log line, one changed value, one test case.
3. Change one thing only. Two changes at once teach nothing.
4. Where the engine allows, write a test that fails because of the bug, and watch it fail before the fix and
   pass after it ([done-evidence.md](done-evidence.md), section 3).
5. Re-test the original symptom with the original steps, where it first happened.

## 6. What counts as a strike
A strike is a hypothesis that was tested and proved wrong, or a fix that did not remove the symptom. A patch
made without a written hypothesis counts too. After three, the answer is not a fourth patch: the approach or
the design is in question. Stop and offer the options in rule 5; "make it smaller" fits when the design is
the problem.

When the human says "stop guessing", "is that really happening?", or "you said it was fixed", go back to
section 1 and show evidence (a log line, a capture) before the next change.

## 7. After the fix
Record the cause and the fix as rule 5 says, and add how the cause was found: the next bug of that kind is
found faster. Keep the test that caught it, so the bug cannot come back unseen.
