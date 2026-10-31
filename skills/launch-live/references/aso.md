# Store page and search (ASO)

ASO (app store optimization) is the work of getting a game **found** in store search and **chosen** once a
player lands on its page. Found depends on the words on the page, the game's ratings, and its installs. Chosen
depends on the icon, the first screenshots, the short text, and the rating. Both are measured by the store
consoles, so the work runs as small tests, not as guesses.

Store rules, character limits, and console features change: verify today's for each store
(`indie-studio:research`) before writing the listing or reading a report.

## 1. Who does what
- **The AI:** finds search terms, studies competing pages and their reviews, drafts every text field within
  its limit, plans the screenshot set and its captions, prepares test variants, and reads the console's
  reports when the human opens them in a browser for it.
- **The human:** signs in to the consoles, approves every word that goes public, starts and stops tests,
  and presses publish. The AI never signs in, never changes a live listing, and never starts a test.
- **Paid ASO tools** estimate search volume and difficulty. Their numbers are models, not store data, and they
  cost a monthly fee. Before the game earns, the store's own suggestions and console reports are enough;
  weigh a paid tool later through [tool-evaluation.md](../../research/references/tool-evaluation.md).

## 2. Search terms
1. **Seed list:** the genre, the core action, the theme, and the words players use in reviews of the
   comparable games from `docs/MARKET.md` ("relaxing", "offline", "no wifi" are player words).
2. **Expand it** with the store's own search suggestions: type each seed into the store's search box and note
   what it suggests. Suggestions differ by country and language, so note where you looked.
3. **Judge each term:**
   - Relevant: would someone who searched it and installed the game be happy? A wrong term brings installs
     that uninstall, which hurts more than it helps.
   - Crowded: if the top results are huge games with millions of ratings, the term is a long shot for now.
     Specific two- and three-word terms are easier to win.
   - Real: it appears in the suggestions, or the console shows it once the game is live.
4. **Place them** as each store indexes text (verify): the main term once in the title, naturally; a few in
   the subtitle or short description; the rest in the long description, written for people. Never stuff
   lists of words, never use other games' names, and never claim "#1", "best", or a price in the title; stores
   reject or demote these.
5. **Per language,** research terms in that language; do not translate the English ones
   (`indie-studio:asset-pipeline`, localization).

## 3. The page that converts
- The icon and the first two or three screenshots decide most installs; many players never scroll.
- Show the real game. Put the hook in the first screenshot, with a caption of a few words. Every screenshot
  and video must show what the game really looks like.
- Keep the look of the game's style bible, so the page and the game feel like one thing.
- A video helps only if its first seconds show play. A slow logo intro does harm.
- Ratings and recent reviews sit next to everything else on the page: answer reviews
  (Live Ops, step 8 in SKILL.md).

## 4. Test, one change at a time
1. Use the store's own listing tests where they exist (verify the current names, limits, and which fields can
   be tested). Test one thing per run: the icon, the first screenshot, or the short description.
2. Write down before starting: what changed, what result would make it the winner, and how long it runs. Run a
   full week at least, so weekdays and weekends both count, and follow the store's own guidance on enough
   visitors.
3. A game with few visitors may never get a clear result. Then keep the better-reasoned version, change one
   thing, and compare the install rate before and after, noting anything else that changed at the same time
   (a feature, an ad campaign, a holiday).
4. Apply the winner, record it, and start the next test from the new page.

## 5. Read the reports
Once the game is public, read the console's acquisition reports monthly (weekly in the first month):
- Which search terms bring visitors, and which turn visitors into installs. Grow the terms that convert;
  rethink the ones that bring visitors who leave.
- The install rate by source (search, browsing, ads, links) and by country, compared with the console's peer
  benchmarks where it shows them.
- After each store change, a short note of the number before and after.
The human opens the console in the browser; the AI reads, and only reads.

## 6. Rhythm
- **Store readiness (Beta):** the first full pass: terms, every field, and the screenshot set, in each launch
  language.
- **Soft launch or early access:** one test at a time on the icon and first screenshot; the monthly report.
- **Launch:** the page per country where the data says it matters (SKILL.md, Launch, step 2).
- **Live Ops:** the monthly report; new screenshots when an update changes what the game looks like;
  seasonal touches only when the game really has them.

## 7. Records
Keep `docs/store/LISTING.md`: the term table (term, language, where it is placed, evidence, date), the live
text of every field per language, and the test log (date, what changed, result, decision). Decisions that
change the plan go in `studio/DECISIONS.md`; store rules found by research go in `studio/KNOWLEDGE.md`.
