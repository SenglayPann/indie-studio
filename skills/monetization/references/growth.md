# Getting players (growth)

Revenue is players x revenue per player; this file is about the first half. Mobile games are mostly found in
four ways: store search and browsing (organic), store featuring, paid ads that lead to installs (user
acquisition, UA), and a publisher who runs the paid part for a share. Which of these the game relies on is a
business-case decision, made early and tested before real money is spent. Every platform, price, minimum
budget, form, and deadline here is volatile: verify it with `indie-studio:research` when you reach it, and log
the source and date in `studio/KNOWLEDGE.md`.

## 1. Choose the route (Validation; confirm it after the prototype)
| Route | You keep | You give up | Fits when |
|---|---|---|---|
| Self-publish, organic only | All revenue and all control | Speed: growth depends on store search, featuring, and community | Premium or niche games; a hook that works in short videos; no ad budget |
| Self-publish with paid installs | Revenue minus ad spend; control | Money up front, and the skill of buying traffic that pays back | The soft launch shows LTV comfortably above CPI, and there is cash to wait for payback |
| Mobile publisher | A revenue share | Some control over monetization and updates; sometimes IP, the store account, or exclusivity | Genres publishers buy traffic for (casual, hybrid-casual, puzzle), when their testing and ad budget matter more than control |

Publisher terms to read slowly (the human decides, ideally with legal help): the revenue share, and how
marketing spend is recouped before you are paid; who owns the IP, the code, and the store account; exclusivity
and its length; what happens if they stop spending; your access to the data. Many publishers test prototypes
for free, and submitting one is also a marketability test.

Record the route and its reasons in `docs/BUSINESS_CASE.md` ("How players will find it").

## 2. The marketability test (optional; real money; the human approves)
Before the Vertical Slice commits months of production, find out what an install costs.
1. **When:** after the prototype is fun (the iterate-or-kill decision), if the plan depends on paid installs or
   a publisher. For an organic-only game, skip it and record why.
2. **What:** two or three short vertical videos (10-30 seconds) cut from real prototype gameplay, each showing
   the hook in the first two or three seconds, and a store page draft or test listing where the store allows it.
   Never show anything that is not in the game.
3. **Where and how much:** a self-serve ad network the human signs up for, a small fixed budget, and the target
   countries from the business case. The human creates the account, enters payment details, and presses start.
4. **Read:** cost per install (CPI), click-through rate, and the store page's install rate, per video. Compare
   them with the CPI assumption in the business case and with researched genre ranges. Small samples are noisy:
   treat differences between videos as hints, not proof.
5. **Decide:** keep going, change the hook or the theme and test again, or change the route. Record the numbers
   in the business case and the decision in `studio/DECISIONS.md`.

## 3. Organic basics
The store page and its keywords (ASO) in every launch language, screenshots and a short video from real
gameplay, short clips during production, and one or two communities rather than every platform. Details:
`indie-studio:roles` (marketer).

## 4. Featuring and pre-launch sign-ups
- Stores offer ways to reach their editors (for example featuring nomination forms) and to collect sign-ups
  before launch (pre-registration or pre-orders). What exists, who is eligible, and the lead times change: check
  in Production and put the dates in the compliance calendar (`indie-studio:roles`, release engineer).
- Editors' tastes change too; quality, a clear hook, good localization and accessibility, and no dark patterns
  are the common threads. Verify before pitching.

## 5. Paid installs (soft launch onward)
- **Only while it pays back.** Spend while the LTV of paid players (by cohort) stays comfortably above CPI and
  the spend comes back within the payback time the business case allows. Write the stop rule before spending.
- **Measure it properly.** Paid installs need attribution: knowing which ad brought which player. On iOS it runs
  through Apple's privacy rules and is limited; verify the current tools and rules before spending. Keep paid
  and organic cohorts apart when reading retention.
- **Creatives decide the cost.** Test new short videos regularly; they wear out. The first seconds matter most.
- **Start small** in the soft-launch countries, then scale country by country only while return on ad spend
  (ROAS) holds. Budgets, accounts, and payments belong to the human.

## 6. Traps
Buying installs before D1 is healthy; judging CPI from a handful of installs; ads showing a game you did not
make (stores and reviewers punish it); mixing paid and organic players in retention; signing a publisher deal
without reading the recoupment and IP terms; paying anyone who promises cheap, guaranteed installs.
