---
name: monetization
description: Design how the game earns money, and check whether it actually does. Use when choosing a business model (paid, ads, in-app purchases, both, subscription), deciding where ads go and how often, deciding what to sell and at what price, designing the in-game economy (currencies, rewards, sinks), planning analytics events, setting or reading numbers such as retention, revenue per player, or payer share, preparing or reading a soft launch, or integrating ad, purchase, analytics, or consent SDKs. Also how the game gets players: a marketability test, self-publishing or a publisher, paid installs, and store featuring. Also when the user asks how this game will make money or find players, where ads should go, what to sell, whether the price is right, or whether the game is earning enough.
argument-hint: "[model | ads | purchases | economy | events | numbers | growth]"
---

# Making money, and knowing whether it works

Revenue follows players who come back. A game nobody returns to earns nothing, whatever you put in it. So the
order is always: the loop works, players return, then the game asks for something. Communication rules:
[communication.md](../director/references/communication.md). Words and numbers explained:
[metrics.md](references/metrics.md). Getting players, the other half of the money:
[growth.md](references/growth.md).

The human owns every money decision: accounts, terms, prices, and spending. You design, integrate in test
mode, measure, and explain.

## Where this happens
| Stage | What to do |
|---|---|
| Conception (Validation) | The route to players: organic, paid installs, or a publisher (growth.md, section 1) |
| Conception (Kickoff) | The model and `docs/BUSINESS_CASE.md`: how it earns, targets from research, how players find it, costs, soft-launch plan |
| Prototype (end) | If the plan depends on paid installs or a publisher: the marketability test (growth.md, section 2) |
| GDD | `docs/ECONOMY.md`: what is sold, currencies and rewards, ad moments, the analytics event list |
| Vertical Slice | Integrate nothing. Check the loop leaves natural room for the planned ad and offer moments |
| Pre-Alpha | Integrate analytics, ads, and purchases in **test mode**, through the engine's own skills when they are installed |
| Alpha | Every ad and purchase path reachable and testable; consent flow drafted |
| Beta | Production IDs, a real sandbox purchase verified, consent flow live, events checked end to end |
| Gold Master | Verified on a real device; store data declarations match what the game and its SDKs collect |
| Soft Launch | Read the numbers, tune, decide (`indie-studio:launch-live`); CPI and payback if you pay for installs |
| Live Ops | Offers, events (the live calendar in `docs/ECONOMY.md`), and balance changes driven by data, through `indie-studio:scope-guard` |

## 1. Principles
- Fun first, money second. Never block the core fun behind a payment or an ad.
- Ask at natural breaks: a round ended, a screen changed, the player wants something extra.
- Rewarded (the player chooses to watch for a reward) beats forced. It earns more trust and often more money.
- Be honest: real prices, real odds, no fake countdowns, no tricks. Trickery costs reviews and can cost the
  account.
- If children may play, the rules are much stricter in every store and country. Verify them before designing
  anything (`indie-studio:research`).
- Every number is a guess until real players prove it, so keep numbers in data files, not in code.

## 2. Choosing the model
| Model | Fits when | Needs | Main risk |
|---|---|---|---|
| Paid (pay once) | A finished, self-contained game with a clear promise | A strong store page; no revenue after the sale | Almost nobody discovers paid mobile games without an audience |
| Free with ads | Short sessions, high replay, broad appeal | Many sessions per player; careful placement | Lots of players for little money if sessions are short |
| Free with purchases | Progression, collection, or convenience worth paying for | An economy, and content worth buying | A small share of players ever buys |
| Both (hybrid) | Most casual and hybrid-casual games | Both of the above, without either spoiling the loop | Doing both badly instead of one well |
| Subscription | Continuing value, updated often | Ongoing content and support | A promise you have to keep for years |

Decide with the evidence in `docs/MARKET.md`, write it in `docs/BUSINESS_CASE.md`, and treat it as tentative
until the soft launch shows real numbers.

## 3. Ads
- **Formats:** rewarded video (player chooses, gets something), interstitial (between rounds), banner (always
  on screen, small), app-open. Rewarded first, interstitial sparingly, banner only if it does not crowd a
  phone screen.
- **Placement rules:** never mid-action; after a round or on a results screen. Leave the first session mostly
  clean, so the player learns the game before it asks for anything. Cap how often interstitials appear and
  respect a minimum gap. Offer a "remove ads" purchase.
- **Mediation** means one service collecting several ad networks and letting them bid for each slot. One
  mediation service is enough; each extra network adds build size, permissions, and support work. Which ones
  exist and what they pay changes constantly: verify before choosing (`indie-studio:research`), and use the
  engine's own ad skills when they are installed.
- **Test mode until Beta.** Never ship test IDs, and never tap your own ads: it gets accounts closed.
- **Consent:** privacy rules differ by region and store and change often. Verify what applies, and make the
  consent flow part of the build, not an afterthought.

## 4. Purchases
- **What to sell, in rough order of how well it suits a first game:** remove ads; a cheap starter pack; a
  consumable that helps in a hard moment; cosmetics; currency packs; a pass or season later, if the game
  keeps players long enough to justify it.
- **Price:** use the store's own price points. Look at what comparable games charge (`docs/MARKET.md`). One
  cheap entry item matters most: the first purchase is the hard one.
- **Must work before launch:** restoring purchases, checking the receipt, a purchase interrupted by a call or
  a lost connection, and a refund leaving the player in a sane state. Keep purchases behind one wrapper
  (`docs/TECH.md`) and cover each of these cases with an automated test against a faked store.
- **Never:** pay-to-win that spoils the loop, hidden prices, pressure aimed at children, or anything the store
  forbids. Use the engine's own purchase skills where they exist.

## 5. The economy (`docs/ECONOMY.md`)
Write it at the GDD stage from
`${CLAUDE_PLUGIN_ROOT}/templates/docs/ECONOMY.md`: currencies (one soft currency, at most one hard one),
every source and every sink, the reward schedule, prices, and the ad moments. Keep all of it in data files so
tuning needs no new build, and plan to move the important numbers to remote settings before launch.

## 6. Measuring
- **Minimum event list:** first open; tutorial step started and finished; session start and end; level or
  round started, finished, failed (with the level and the attempt number); currency earned and spent (with
  the reason); ad requested, shown, completed, failed (with the placement); purchase started, completed,
  failed (with the product); settings changed.
- One analytics tool, one naming scheme, written down once in `docs/ECONOMY.md` and never improvised.
- Verify events arrive in the dashboard before Beta ends. An event you never see is worse than no event.
- What you collect must match the store's data declarations and the privacy policy.
- Read cohorts, not totals: "players who installed this week", not "everyone since launch". Small numbers lie;
  check how many players you need before a difference means anything (`indie-studio:research`), and change
  one thing at a time.

## 7. Reading a soft launch
1. Check you have enough players for the numbers to mean anything. If not, wait; do not redesign on noise.
2. **D1 first.** If players do not come back the next day, no ad placement or price fixes it. The problem is
   the first session: clarity, difficulty, length, or the promise the store page made. In a game built from
   levels, the per-level funnel shows exactly where they leave (`docs/LEVELS.md`).
3. **Then D7.** It shows whether a habit forms. If D1 is fine and D7 collapses, the game runs out of reasons
   to return: progression, variety, or goals.
4. **Then money per player**, and only then prices and placements.
5. Check crash-free rate and store rating at the same time; a technical problem can look like a design one.
6. Decide with the rules written in `docs/BUSINESS_CASE.md` before any results arrived: scale, keep fixing, or
   stop. Record the decision in `studio/DECISIONS.md`.

## 8. Getting players
Players are the other half of revenue. Choose the route early (organic, paid installs, or a publisher), test
what an install costs before production commits when the plan depends on paying for players, and buy installs
only while they pay back, with the stop rule written first. The procedures, publisher terms to check, and
traps: [growth.md](references/growth.md).

## 9. AI does / Human does
- **AI:** designs the model and economy, drafts the event plan, integrates SDKs in test mode, builds the
  analysis, drafts store declarations and the privacy policy for review.
- **Human:** creates every account (ad network, store, payments, tax), accepts the terms, sets prices,
  approves spending, and submits. The AI never enters payment, bank, or identity details and never accepts
  terms on someone else's behalf.

## 10. Beginner traps
Ads in the first minute; an interstitial after every single round; three ad networks in one build; no
consent flow; test IDs shipped to production; a paywall in front of the fun; an economy tuned by feel and
never measured; reading results from a handful of players; treating downloads as success; building a season
pass for a game nobody returns to; forgetting that the store takes a cut and that money arrives late.
