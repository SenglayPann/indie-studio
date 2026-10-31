# <Working title>: economy, ads, and events

Written at the GDD stage with `indie-studio:monetization`, and kept current. Every number lives in a data
file, never in code, so it can be tuned without a new build. Note which file holds each one.

## What the player can buy
| Product | Store product ID | Type (consumable / one-off / subscription) | Price point | What it gives | Why a player wants it |
|---|---|---|---|---|---|
| Remove ads | | one-off | | | |

Paid random items (mystery packs, loot boxes), if any: the odds shown and the real roll come from one list in
<data file>; boosts and guaranteed drops update the shown odds. Store and country disclosure rules: <verified
with `indie-studio:research`, date>.

## Currencies
| Currency | Soft or hard | Earned from | Spent on | For (progress / cosmetics / convenience / power) | Earned per session (typical / heavy) | Starting amount | Data file |
|---|---|---|---|---|---|---|---|

A currency that buys power, and can itself be bought with money, makes the game pay-to-win unless it is capped:
check it against `indie-studio:monetization` and the fairness promises in the business case. A lost run should
still earn a little. Sessions until each unlock, from the simulator: `docs/BALANCE.md`.

## Sources and sinks
Every way currency enters the game, and every way it leaves. If the sources outweigh the sinks, the economy
loses meaning within days.

| Source | How much | How often | | Sink | Cost | How often |
|---|---|---|---|---|---|---|

## Reward schedule
<What a player gets for finishing a round, a level, a day, a streak. Keep it in data.>

## Pacing (games with upgrade ladders, idle income, or resets)
How long the player waits for each next step, at a typical player's income. Method: `indie-studio:preproduction`
(systems design, the economy).

| Step | Cost | Income at that point | Wait | Ratio to the previous wait |
|---|---|---|---|---|

Offline earnings: <cap in hours; share of the playing rate>; a device clock that moved backwards pays nothing.

## Ad moments
| Placement | Format | When it appears | Cap and minimum gap | Reward, if any |
|---|---|---|---|---|
| | rewarded | | | |

First session rule: <what the player must reach before any ad appears>.

## Test mode (`indie-studio:monetization`, section 5)
- Live switch: <data key>, off in every build before Beta; on in the release build only
- Ad network's test method: <test ad units / registered test devices>   Verified: <date, source>
- Store's purchase testing: <test accounts, test cards, sandbox users; the order of the human's steps>

## Analytics events
One naming scheme, decided here. Same names in code, dashboards, and reports. Checked against the provider's
naming rules: <provider, date>; its reserved list is a test fixture at <path>.

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
<Which numbers should be changeable without an app update, and which service holds them.> Every key has a
default inside the build, used when the service cannot be reached, and a safe range the code enforces, so a
typo in a dashboard cannot hand out a million coins. Each risky new feature (a new ad placement, a new saved
field, cloud sync) gets an on/off key, a **kill switch**, so it can be turned off without an update.

| Key | What it changes | Default in the build | Safe range (clamped in code) | Kill switch? |
|---|---|---|---|---|

## Live events and offers (live games only; planned after launch)
One reusable event template, run through remote settings, sized to real hours. Each event names the number it
is meant to move.

| Event or offer | Template | When and how long | What it changes (remote keys) | Number it should move | Result |
|---|---|---|---|---|---|

## Consent and privacy
<Which consent flow applies where, what data each SDK collects, and where that is declared. Verify current
rules with `indie-studio:research` and record source and date in `studio/KNOWLEDGE.md`.>
