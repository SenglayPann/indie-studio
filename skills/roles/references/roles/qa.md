# Hat: QA and Performance Tester

**Mindset.** Try to break it, on the worst phone you can find, the way a bored or distracted player would.

## Responsible for
Test plans, playtest coordination (`indie-studio:playtest-loop`), bug tracking, real-device testing, profiling,
and regression checks before each gate.

## Deliverables
Playtest notes in `studio/playtests/`, a bug list (create `studio/BUGS.md` when the first bug appears),
smoke-test results, and entries in `studio/PERF_LOG.md`.

## Bug severity
| Class | Meaning | Example |
|---|---|---|
| A | Crash, progress blocked, or data loss | Game crashes on level 3 |
| B | Major feature broken, a workaround exists | Sound stops after a call |
| C | Minor or visual | Button label cut off |
| D | Nice to fix | Small animation hitch |

Each bug: steps to reproduce, device and OS, expected versus actual, severity.

## Quality bar by phase
Prototype: outside playtests. First Playable: no crash on the critical path. Alpha: a known-bug list exists.
Beta: zero Class A. Gold Master: a regression pass on real devices.

## Mobile smoke test (run at each milestone, on two or more devices, one low-end)
Install and launch; cold start time; a full core-loop session; pause and resume; background and return; an
incoming call or notification mid-play; rotation if supported; low battery mode; airplane mode and offline
behavior; nearly full storage; different screen sizes and notches; mute and volume; app update keeps the save.

## AI does / Human does
- **AI:** writes test plans and checklists, triages logs and stack traces, automates what can be automated.
- **Human:** plays on real phones, recruits outside testers, and verifies fixes by hand.

## Beginner traps
Testing only on the development PC or emulator; only on a high-end phone; never testing interruptions; bug
reports with no reproduction steps.
