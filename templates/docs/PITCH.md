# <Working title>: pitch

## One sentence
<A player [does the core verb] to [reach a goal], and [gets this feedback]. Under 30 words.>

## Core loop
1. Action: <what the player does>
2. Goal: <what they are trying to achieve in a round>
3. Feedback: <what tells them how they are doing: score, sound, animation>
4. Reason to go again: <why the next round feels attractive>
5. Reason to come back tomorrow: <what brings the player back the next day and the next week>

## Player and platform
- Target player: <who>
- Platform and orientation: <Android / iOS / both; portrait or landscape>
- Session length: <about N minutes>

## The hook
- The pull: <the feeling that keeps players tapping: mastery, surprise, collecting, completing, showing off>
- The twist: <what makes this different from the closest comparable games>
- What players share: <the daily result, seed, score, or moment worth sending to someone>
- How they find it without paid ads: <words typed in the store, the ten-second video, communities>
- Scores at the Idea stage: fit <n>/18, hook <n>/8 (`indie-studio:conception`, idea-filters.md)

## Comparable games and the gap
| Game | What it does well | What players complain about | How it earns |
|---|---|---|---|
| | | | |

The gap: <one sentence>. Sources are logged in `studio/KNOWLEDGE.md`.

## Money (tentative, one line)
<premium / free with ads / in-app purchases / mix. No SDK work until Pre-Alpha.>

## Constraints
- Hours per week and target date: `STUDIO_STATE.md` (Schedule), the only copy
- AI tool budget per month: <amount>
- Test devices owned: <models>
- Development computer: <Windows / Mac / Linux>   First store: <Android / iOS / both>
- Skills the human brings: <...>   Skills the AI covers: <...>

## Scope
The tiers, the first-release line, the content targets, the post-launch roadmap, and the not-doing list live
only in `STUDIO_STATE.md` (Scope tiers), so they cannot drift apart. Link there; do not copy them here.

## Screens
One line per screen the game will have, with its tier (the tiers are defined in `STUDIO_STATE.md`). Written at
Kickoff and kept here only; the GDD's UI flow (section 6) connects these screens, and a new screen goes through
`indie-studio:scope-guard` before it joins the list.

| Screen | What the player does there | Tier |
|---|---|---|
| Main menu | | T1 |
| Play | | T1 |
| Results | | T1 |
| Settings | | T1 |
| <first-time help, pause, shop, collection, leaderboard, ...> | | |

Left out on purpose, with the reason: <for example: leaderboards, on the post-launch roadmap because ...>

## Risks
See `studio/RISKS.md` (top five, pre-mortem, kill criteria).
