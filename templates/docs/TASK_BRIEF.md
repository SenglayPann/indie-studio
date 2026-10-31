# T-<###>: <short title>

- Status: <todo / in progress / done>   Tier: <T1 / T2 / T3>   Hat: <role>
- Branch: <feature/scope-desc>   Waits: <none / what this task waits on>
- Estimate: AI <h>, human <h>   Actual: AI <h>, human <h, if tracked>   Finished: <date>

## Why
<Which part of the game or which gate criterion this serves, in one or two sentences.>

## What to build
<Clear description of the result, not the method.>

## Acceptance criteria (each one testable)
- [ ] <When I do X, Y happens>
- [ ] <No crash when Z>
- [ ] <Runs at the target frame rate on the test device>
- [ ] Build and automated tests pass (CI green); a new test, seen failing once, covers it if it touches saves,
      purchases, or economy math
- [ ] If it changes rules or numbers: the balance checks pass and `docs/BALANCE.md` is updated

## Allowed to touch
<files, folders, or scenes. Follow `docs/TECH.md`; a change to structure, saves, or services updates it.>

## Out of scope
<things the agent must not do or change>

## How to verify
<exact steps, each with what passing looks like: the build command and the line it prints; the screen or state
to reach and how (the player's taps, or a debug shortcut when the way there is not what is tested); what to
tap; what the screen, log, or test shows. A change the player can see ends with a capture of the running game.>

## Review focus
<two to five player situations this change could break that no criterion covers, each with how it is checked:
first launch with no save, a save from an older version, a call or app switch mid-run, no network, a small or
notched screen, the low-end phone, the longest translation, a double tap>

## Risks and notes
<save data, purchases, permissions, dependencies, unknowns>

## Result (filled in at the end; Status is done only when every criterion is met or the human accepted it open)
| Criterion | Met / not met / not checked / n/a | Proof, or why not |
|---|---|---|
| <criterion> | <...> | <test name and result line, command and output line, capture path, or "the human saw it on <date>"> |

- In the running game: <Seen: what was on screen (capture path) / Not checked: why / Nothing visible: why>
- Files changed outside "Allowed to touch": <none / each, with the reason>
- Fresh review: <MUST FIX, SHOULD FIX, NOTE counts; what was fixed or declined and why; what it could not judge>
- For the human to check: <sound, feel, a real phone: one thing to try each>
- What changed: <...>   Commit(s): <hashes>   Follow-ups: <...>
