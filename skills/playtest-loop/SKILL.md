---
name: playtest-loop
description: Run real-player playtests and decide what to do with the results. Use when a prototype, slice, or build is ready for outside eyes, when the user asks "is it fun", how to test with friends, how to read feedback, or whether to keep, change, or drop a concept; and on a regular rhythm at every stage. Provides the observe-do-not-explain protocol, an observation sheet, how to read signals, and the iterate-or-kill decision.
argument-hint: "[build or stage to test]"
---

# Playtest loop

Creators cannot see their own game clearly, and an AI cannot tell whether something is fun. Only new
players can. Testing early, while changes are cheap, is the best money-saving habit in game development.
Communication rules: [communication.md](../director/references/communication.md).

## When and how many
| Stage | Players | Question the round answers |
|---|---|---|
| Prototype | 3-5 | Is the core loop understood and engaging, even when ugly? |
| Vertical Slice | 5 | Do clarity, pace, and quality work at final level? |
| First Playable | 3 | Can a stranger get through a whole session? |
| Alpha | 5 | Is the difficulty and the reason-to-return right? |
| Beta | 5 or more | Bugs, devices, onboarding, and difficulty |
Three to five players find most big problems; more rounds beat more players per round.

## Who to recruit
People who are not developers and ideally not close friends (friends are too kind). Include at least one
person who does not play many games. Adults, or children with a parent present. Say what you will record
before you record anything; never collect personal data.

## Getting the build onto their phone
Prefer the simplest route that works, which changes with the platforms: verify the current options with
`indie-studio:research` (for example, installing a test build directly on Android, or the platform's test
distribution service). Never send a build to someone through an untrusted file host.

## The five-minute protocol (the human runs it; the AI prepares it)
1. Say this: "I am testing the game, not you. Nothing you do is wrong. Please say what you are thinking out loud.
   I will not help unless you are completely stuck for a full minute."
2. Hand over the device. Say nothing about the goal or controls.
3. Watch quietly. Note timestamps: where they hesitate, what they tap by mistake, what makes them smile or
   frown, when they look bored, and whether they quit early. Do not explain, defend, or hint.
4. After play, ask three things: What was the goal? What was fun or frustrating? Would you play again, and what
   would you change? Then watch: did they ask for another go without being asked?
5. Thank them. Do not ask "would you pay for it"; people answer that unreliably. Watch behavior instead.

Use the sheet in `${CLAUDE_PLUGIN_ROOT}/templates/docs/PLAYTEST_SHEET.md`. Save each session as
`studio/playtests/YYYY-MM-DD-NN.md`.

## Reading the signals
| Strong signs | Warning signs |
|---|---|
| Asks for another go unprompted | Hesitates for many seconds at the start (unclear goal) |
| Tries to beat their own score | Makes the same mistake repeatedly (unclear UI or rules) |
| Smiles, laughs, leans in | Silence, looks around, checks their own phone |
| Tells you a strategy or asks about the next level | Quits before two minutes |
Patterns beat opinions. If two of five people stumble at the same point, fix it. A single person's taste
is a note, not a change request.

## After a round (the AI's job)
1. Summarize the top three findings in chat, with a recommended single change for the next round.
2. Save the notes and update STUDIO_STATE.md (next actions) and `studio/DECISIONS.md`.
3. Make one focused change per round so you learn what worked.

## Iterate or kill
| What happened | Decision |
|---|---|
| Most understood it and wanted another go | Proceed to the next stage |
| Understood it but were bored | Change the core once (the verb, the goal, or the feedback), then retest |
| Confused about the goal or controls | Fix clarity and onboarding, then retest |
| No improvement after two focused rounds | Stop or pivot. Record it. The idea goes to the parking lot; the learning is not wasted |
Check the kill criteria written in `studio/RISKS.md` first. The human decides, and the decision is recorded.

## Rules
- The AI never claims "it's fun"; only players can show that.
- Do not skip this loop because the prototype is ugly. Ugly is the point.
- Keep sessions short and light. A tired tester gives poor data.
