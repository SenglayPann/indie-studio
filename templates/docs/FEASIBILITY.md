# <Working title>: feasibility and estimate

Written at Validation (`indie-studio:conception`, step 8) with the Producer hat and the Engineer as guest.
Re-run by every re-plan (`indie-studio:scope-guard`), and corrected with measured numbers at the weekly review
and the Vertical Slice timing exercise. The method is in `indie-studio:roles` (producer, "Estimating in three
columns"). The scope itself lives in `STUDIO_STATE.md` (Scope tiers); this file only prices it, so re-run the
totals whenever the tiers or the first-release line change.

## Who covers what
| Skill the game needs | AI | Human | Bought or hired | Note |
|---|---|---|---|---|
| | | | | |

## Estimate by part
One row per part: each system, each screen from `docs/PITCH.md`, content, art and audio, store and release work,
playtests, testing and fixes, studio work (documents, gate reviews). Ranges, not single numbers.

| # | Part | Tier | AI build (h) | Human hands-on (h) | Waits it causes | Measured (AI / human) |
|---|---|---|---|---|---|---|
| 1 | Engine project and a first build on the phone | T1 | | | | |

## Totals
| First release includes | AI build (h) | Human hands-on, raw (h) | Human, corrected (x <ratio>) |
|---|---|---|---|
| T1 | | | |
| T1-T2 | | | |
| T1-T3 | | | |

## Calendar waits
Verify every length with `indie-studio:research` (source and date in `studio/KNOWLEDGE.md`).

| Wait | Length | Can start when | Runs alongside the work? | Blocks |
|---|---|---|---|---|
| <for example: a store's required closed test> | | | | <publishing> |

## Capacity
- The human's hours per week: <n>   Target date: <date, or none>   Weeks available: <n>
- Polish buffer (protected): <weeks>
- **Capacity rule:** the first release fits when the human's corrected hands-on hours for everything it
  includes, plus the protected polish buffer, fit in the weeks before the target date at their real weekly
  hours, with every wait that cannot run alongside the work (such as the final store review) added as weeks.
  With no target date, the same sum sets the Planned dates instead.
- Result for the first release in `STUDIO_STATE.md`: <fits / does not fit>, with the arithmetic.
- AI build hours needed per week: <n>, against the session time the human can give: <n>.

## If it does not fit
The cutting order (T3, then T2, then content volume inside T1) with what each cut saves, and the cheaper
version of each expensive part (`indie-studio:conception`, idea-filters.md).

## Measured so far
| Date | What was measured | AI ratio (actual / estimate) | Human ratio | From |
|---|---|---|---|---|
