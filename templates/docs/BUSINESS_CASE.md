# <Working title>: business case

Filled at Kickoff with `indie-studio:monetization`, and re-checked at every gate. It answers one question:
if this game works, what does "works" look like in numbers, and what happens if it does not?

Benchmarks change and differ by genre. Look up current ones (`indie-studio:research`, volatile tier), write
the source and date beside each, and never borrow a number from another genre.

## What this game is for
<Money, learning, a portfolio piece, or a mix. What "worth it" would mean in the first year.>

## How it earns
- Model: <paid / free with ads / free with purchases / both / subscription>
- What players can buy: <...>
- Where ads appear, if any: <...>
- Why this fits the genre: <evidence from docs/MARKET.md>

## Targets (from research: source and date in every row)
| Number | What it means | Benchmark for this genre | Our target | Why |
|---|---|---|---|---|
| D1 | Share of players who come back the next day | | | |
| D7 | The same, a week later | | | |
| D30 | The same, a month later | | | |
| Session length and sessions per day | How long and how often they play | | | |
| ARPDAU | Average revenue per daily player | | | |
| Payer share | Share of players who ever buy anything | | | |
| Cost per install | Only if you pay for installs | | | |

## How players will find it
- **Free:** store listing and keywords, short videos, communities, store featuring. Who does what, and when.
- **Paid:** budget, where, and the rule that stops it (keep paying only while a player earns back more than
  they cost).
- **If nobody finds it:** <does the project still make sense, and what would you do next>

## Languages
| What | Languages at soft launch | At global launch | Later | Why (market data) and cost |
|---|---|---|---|---|
| Store page (text and screenshots) | | | | |
| First session (tutorial, menus) | | | | |
| The rest of the game | | | | |

How: `indie-studio:asset-pipeline` (localization). The game is built for translation from the Vertical Slice
either way.

## What it costs
| Item | Cost | When |
|---|---|---|
| Store accounts and fees | | |
| Tools and subscriptions | | |
| Managed services (analytics, cloud save, remote settings) | | |
| Paid installs, if any | | |
| Your hours | | |

## Simple arithmetic
Revenue per day is about (daily players) x (revenue per daily player). Daily players only grow while new
installs outnumber the players who drift away. Fill in two cases with your own researched numbers, and plan
from the low one.

- **Low case:** <installs a day> with <retention> gives <daily players>, x <ARPDAU> = <a day> / <a month>
- **Middle case:** <the same arithmetic with better numbers>
- **Break-even:** <what has to be true to cover the costs above>

## Soft launch plan
- Countries, and why: <a few cheap markets that resemble the target audience; verify current advice>
- How long, and how many players before the numbers mean anything: <from research>
- The numbers that decide it: <which rows from the table above>
- Decision rules, written before any results arrive: scale / keep fixing / stop.

## Kill or pivot rules
<Copy these into `studio/RISKS.md`: "If <number> is not <target> by <date>, we <change this / stop>.">
