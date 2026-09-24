# <Working title>: economy, ads, and events

Written at the GDD stage with `indie-studio:monetization`, and kept current. Every number lives in a data
file, never in code, so it can be tuned without a new build. Note which file holds each one.

## What the player can buy
| Product | Store product ID | Type (consumable / one-off / subscription) | Price point | What it gives | Why a player wants it |
|---|---|---|---|---|---|
| Remove ads | | one-off | | | |

## Currencies
| Currency | Soft or hard | Earned from | Spent on | Starting amount | Data file |
|---|---|---|---|---|---|

## Sources and sinks
Every way currency enters the game, and every way it leaves. If the sources outweigh the sinks, the economy
loses meaning within days.

| Source | How much | How often | | Sink | Cost | How often |
|---|---|---|---|---|---|---|

## Reward schedule
<What a player gets for finishing a round, a level, a day, a streak. Keep it in data.>

## Ad moments
| Placement | Format | When it appears | Cap and minimum gap | Reward, if any |
|---|---|---|---|---|
| | rewarded | | | |

First session rule: <what the player must reach before any ad appears>.

## Analytics events
One naming scheme, decided here. Same names in code, dashboards, and reports.

| Event name | When it fires | Properties |
|---|---|---|
| first_open | | |
| session_start | | |
| level_start | | level_id, attempt |
| level_end | | level_id, attempt, result, duration |
| currency_earn | | currency, amount, source |
| currency_spend | | currency, amount, sink |
| ad_show | | placement, format, result |
| purchase | | product_id, result |

## Remote settings
<Which numbers should be changeable without an app update, and which service holds them.>

## Live events and offers (live games only; planned after launch)
One reusable event template, run through remote settings, sized to real hours. Each event names the number it
is meant to move.

| Event or offer | Template | When and how long | What it changes (remote keys) | Number it should move | Result |
|---|---|---|---|---|---|

## Consent and privacy
<Which consent flow applies where, what data each SDK collects, and where that is declared. Verify current
rules with `indie-studio:research` and record source and date in `studio/KNOWLEDGE.md`.>
