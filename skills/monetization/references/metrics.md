# The numbers, in plain words

Every number here is measured, not guessed. Benchmarks (what counts as good) differ by genre, country, and
year, so look them up when you need them (`indie-studio:research`, volatile tier) and write the source and
date in `docs/BUSINESS_CASE.md`. Never reuse a benchmark from another genre.

## Players and returning
| Term | What it means | Why it matters |
|---|---|---|
| Install | Someone downloaded and opened the game | The top of everything; most of them leave |
| D1 retention | Of the players who installed on a day, the share who opened the game the next day | The first health check. A weak D1 means the first session fails |
| D7 / D30 retention | The same, a week and a month later | Whether a habit forms, and whether the game has a life |
| Session length | How long one play lasts | Short sessions need many of them to earn from ads |
| Sessions per day | How often a player comes back within a day | Ad revenue roughly follows this |
| DAU | Daily active users: how many people play on a given day | The base every revenue number multiplies |
| Cohort | A group defined by when they installed ("everyone who installed last Tuesday") | The only honest way to compare; totals hide decline |
| Churn | The share who stop playing | The other side of retention |

## Money
| Term | What it means | Why it matters |
|---|---|---|
| ARPDAU | Average revenue per daily active user, ads and purchases together | The simplest "is it earning" number |
| Payer share | The share of players who ever buy anything | Usually small; a game lives on the few who do |
| ARPPU | Average revenue per paying user | Says whether your prices suit the people who pay |
| LTV | What one player earns you over their whole life in the game | The number that decides whether paid installs make sense |
| eCPM | What a thousand ad views pay | Varies wildly by country, format, and season |
| Fill rate | The share of ad requests that actually return an ad | A low fill rate quietly halves ad revenue |
| CPI | What one install costs when you pay for it | Paying for installs only makes sense while LTV is comfortably above CPI |
| Store cut | The share the store keeps from each purchase | Your revenue is what is left, and it arrives weeks later |

## Getting players ([growth.md](growth.md))
| Term | What it means | Why it matters |
|---|---|---|
| CTR | Click-through rate: the share of people who saw an ad and tapped it | Tells you whether the hook in the first seconds works |
| Store conversion | The share of store-page visitors who install | Tells you whether the page keeps the ad's promise |
| ROAS | Return on ad spend: revenue from paid players divided by what they cost, by day 7, 30, and so on | The number that says whether to keep spending |
| Payback time | How long until paid players have earned back what they cost | Cash flow: a long payback needs money to wait with |
| Attribution | Knowing which ad or channel brought which player | Without it, paid and organic players blur together |
| Organic uplift | Extra organic installs that paid campaigns bring (ranking, word of mouth) | Real but hard to measure; never plan on it |

## Quality
| Term | What it means |
|---|---|
| Crash-free sessions | The share of plays that end without a crash. Store consoles report it |
| ANR / freeze rate | Plays where the game stopped responding |
| Store rating | The public average. Early one-star reviews are very hard to outrun |

## How to read them without fooling yourself
1. **Enough players first.** A handful of installs tells you nothing. Find out how many you need for the
   difference you are trying to see, before you draw a conclusion.
2. **In order:** D1, then D7, then money. Fixing prices when D1 is broken wastes the fix.
3. **One change at a time,** or you will not know which one worked.
4. **Compare like with like:** same country, same platform, same cohort age.
5. **Paid traffic flatters nothing:** players who arrive through an ad usually behave differently from players
   who searched for the game. Keep them apart when reading retention.
6. **Write the target before the result.** Numbers you judge after the fact always look acceptable.
