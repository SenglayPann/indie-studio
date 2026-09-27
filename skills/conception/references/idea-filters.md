# Sizing an idea for a solo, AI-assisted commercial mobile game

An idea is not rejected for being big. It is **priced**. This file turns the usual danger signs into costs and
risks that can go into the feasibility math, so the human chooses with open eyes.

Two things stay as rules, because they cost nothing and protect everything else:
1. **The core loop fits in one sentence** (action, goal, feedback). A loop nobody can state in a sentence is
   not ready to build, at any size.
2. **Prove it before you widen it, and fit the first release to the hours.** Breadth waits for proof: the core
   loop is proven with outsiders before more is designed around it (the Prototype), and the reasons to return
   are checked before anything bigger is built on top of them (live events, passes, the post-launch roadmap):
   asked about in the Alpha playtest round, then watched in players who keep the game for days (a closed test,
   then the soft launch).
   Within that, the first release is as big as the human chooses: T1, T1-T2, or T1-T3, with the tiers kept as
   the cutting order either way. Whatever it includes passes the capacity rule: the first release fits when
   the human's corrected hands-on hours for everything it includes, plus the protected polish buffer, fit in
   the weeks before the target date at their real weekly hours, with every wait that cannot run alongside the
   work (such as the final store review) added as weeks. With no target date, the same sum sets the Planned
   dates instead.

   How big it should be depends on the route to players (`indie-studio:monetization`, growth). A free game
   found only through store search gets one big moment of attention at launch (the first reviews, any
   featuring), which argues for a first release that feels complete. A game that buys installs can test the
   install cost and retention cheaply with a smaller first release, and grow from real numbers.

## What each ambition costs
Price every row that applies, in hours and in risk. The "cheaper version" is the first thing to offer when
the numbers do not fit.

| Ambition | Why it costs | Cheaper version to offer |
|---|---|---|
| Real-time multiplayer | Servers, matchmaking, cheating, support, and an empty game whenever too few people play at once. The hardest item on this list for one person | Asynchronous play: leaderboards, ghosts, turn-by-turn, shared daily seeds, through a managed service |
| Your own backend | Hosting, updates, downtime, data protection, and a bill that grows with players | Managed services (below). Most free-to-play games need some, which is not the same as running a server |
| Accounts and social features | Sign-in, privacy law, moderation, player support | Local save, plus optional cloud save through a managed service |
| Open world or big handmade levels | Content cost multiplies because every level is bespoke | Levels from a template and data; seeded or procedural variation |
| Story, voice, cutscenes | Writing, recording, localization, and re-recording after every change | Light framing: a few lines of text, static art, a short intro |
| Realistic 3D or a large animated cast | Modelling, rigging, animation, performance work on cheap phones, and constant style drift | Stylized low-poly with one shared look and a small cast (`indie-studio:asset-pipeline`) |
| Several core verbs or modes | Each one multiplies design, UI, tutorial, testing, and content | One verb at launch; further modes as post-launch updates |
| Long sessions (10+ minutes) | Phone players get interrupted, so you need saving, pausing, and a way back in | A round that ends in a few minutes and makes you want another |
| Live-service promises | New content forever, or players leave. A commitment, not a feature | A finished game plus one or two planned updates, sized in the business case |

## Managed services are not "a server"
Free-to-play games usually need some of these, and they are ordinary work rather than a showstopper:
analytics, crash reporting, remote settings (changing numbers without shipping an update), cloud save,
leaderboards, purchase receipt checks, and live events. They are rented and priced per use, and every major
engine offers them. Verify current limits, prices, and terms (`indie-studio:research`) and put the cost in
`docs/BUSINESS_CASE.md`. Building your own versions of these is what costs months.

## Two scores for every concept (0-2 each, to compare ideas with each other)
**Fit** asks whether the game can be built and can earn. **Hook** asks whether players will want it and tell
others. A game meant to earn needs both: a high fit with a low hook is a safe game nobody looks for, and a high
hook with a low fit is a price to pay, not a veto. Show both scores side by side, with each concept's audience
(who exactly, and what they play now).

### Fit: can it be built, and can it earn?
| Question | 0 | 1 | 2 |
|---|---|---|---|
| Is it fun in its ugliest form (grey boxes)? | unlikely | maybe | very likely |
| Can the first release be built in the hours available? | no | tight | comfortably |
| Can content grow from data or a template? | no | partly | yes |
| Is there a reason to come back tomorrow? | none | weak | strong |
| Does this genre earn the way you plan to (ads, purchases, or both)? | no evidence | mixed | clear evidence |
| Are there natural moments for a rewarded ad or an offer? | none | few | many |
| Can the AI handle most of the building? | doubtful | probably | yes |
| Can outsiders playtest it in five minutes? | no | maybe | yes |
| Do interruptions hurt (a phone call mid-play)? | badly | somewhat | not at all |

### Hook: will players want it, and tell others?
| Question | 0 | 1 | 2 |
|---|---|---|---|
| **A named pull:** which feeling keeps players tapping (mastery, surprise, collecting, completing, showing off, beating friends)? | none named | named, but the loop only sometimes gives it | one clear pull, given every round |
| **Fresh but familiar:** a genre people already look for, with a twist they have not seen | a clone, or too strange to place | a small twist | a clear twist on a known genre |
| **A share engine:** does play make something worth showing or sending (a daily result, a seed code, a score, a funny fail, a build)? | nothing | possible, but not built in | built into the loop |
| **An organic route:** can players find it without paid ads (words they type in the store, a ten-second video that sells it, communities that gather around the genre)? | none | one | several |

A low score is not a veto. It is a list of what to fix, to cut, or to pay for.

## Salvage and pivot: when a build already exists
A prototype or an earlier project is worth what its parts are worth to the new plan, not what it cost.
1. **List the parts** and what each is worth now: game feel (controls, timing, juice), tech (the engine project,
   tools, the build path to a phone), code clean enough to keep, art and audio (with their licences), data
   (levels, balance), and what real players showed when they played it.
2. **Score the build as it stands** with both tables, and say plainly where the loop is weak.
3. **Offer priced options.** The human's own plan for the build is the baseline and is always shown. Beside it,
   two or three pivots that keep the strongest parts, for example: the same feel with a new core verb; the same
   verb in a new structure (runs, levels, a daily puzzle); the same tech with a new theme. For each: hours, what
   it reuses, and the risk it removes or adds.
4. **Test before committing.** A pivot the human picks gets a time-boxed test (a throwaway sketch, or a spike on
   a copy of the build) with a kill rule written first, for example "if 3 of 5 outsiders do not ask for another
   go after two rounds, stop".
5. **Record** what is kept, what is dropped, and why in `studio/DECISIONS.md`. Carried-over assets go into
   `studio/ASSET_LEDGER.md` with their licences.

## Genres that suit a solo, AI-assisted first release
Match and merge puzzles; one-touch arcade and endless runners; stacking, aiming, and physics toys; tower
defence with a few unit types; idle and incremental games; word and number puzzles; small roguelites and card
games. They share cheap repeatable content, short sessions, and known ways to earn.

Hybrid-casual (a simple loop plus a light meta layer: a collection, upgrades, a base that grows) is where a
large share of free-to-play mobile money is made. It costs more than a pure arcade game and pays better when
players come back. Check the current picture for your genre with `indie-studio:research` before betting on it.

## Ideas that end first projects
Competitive online games; open worlds; large crafting or inventory systems; anything that needs moderation of
player-made content; a game whose fun depends on a crowd being online from day one. Price them honestly and
the numbers usually say the same thing, but the human decides.

## Finding ideas
- Take a loop the human already enjoys and change one rule: a different goal, a constraint, a new input.
- Combine two tiny loops (matching plus growing a garden).
- Turn a physical toy or a small daily habit into a one-verb game.
- Mine the complaints in reviews of comparable games (`docs/MARKET.md`).
- Avoid pure clones. A clone with no twist gives nobody a reason to choose it, and gives you nothing to say in
  a store listing or a video.

## Content cost rule of thumb (replace with measured numbers at the Vertical Slice)
The first level or unit costs many times more than the tenth, because the tools and templates get built along
with it. Expect later ones at roughly a third to a half of the first. Never plan from the first one, and never
from the best case.
