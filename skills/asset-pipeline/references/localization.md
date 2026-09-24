# Text and translations (localization)

A translated store page is often the cheapest growth a mobile game can buy, and a translated game opens
markets where players expect their own language. Both stay cheap only if the game is built for translation
from the start. For the engine-specific setup, use the engine vendor's localization skill when it is
installed, and verify current tooling with `indie-studio:research`.

## 1. From the Vertical Slice: build for translation, even if you launch in one language
- Every player-facing string lives in a string table under a stable key (`menu.play`, `level.fail.title`). No
  text in code, scenes, or images. Numbers and dates are formatted for the player's locale; prices come from
  the store, never from a hard-coded string.
- Leave room: layouts that survive text at least 30-40% longer than English (short labels can double), and
  auto-sizing that only shrinks within readable limits.
- Fonts: cover the scripts of every target language, with a fallback font for the rest; check what they add to
  the build size (`indie-studio:mobile-perf-budget`).
- Plurals, gender, and word order differ by language: use the engine's plural support and placeholders
  (`{count} coins`), never sentences glued together from pieces.
- Right-to-left languages (Arabic, Hebrew) need mirrored layouts: decide at the Vertical Slice whether they are
  in scope, because adding them later touches every screen.
- **Pseudo-translation test:** swap every string for a longer, accented version (`[Ƥļàý ƒöŕ ƒŕéé ẋẋẋ]`) and play
  through. Any text still in plain English is hard-coded; anything cut off needs more room.

## 2. At Kickoff: which languages, in which order
- Choose from data, not habit: the soft-launch and launch countries in `docs/BUSINESS_CASE.md`, where
  comparable games earn (`docs/MARKET.md`), and the cost of each language (word count x rate, or review hours).
- The usual order: the store page (title, descriptions, and the screenshots' text), then the first session
  (tutorial and main menus), then the rest of the game, then any story.
- Record the list and the order in `docs/BUSINESS_CASE.md` (Languages) and `docs/TECH.md` (section 6).

## 3. Translating
- Keep a glossary (game terms, names of characters and items, words never translated) and a note on every
  string with its context and its character limit. Translators without context make the worst mistakes.
- AI drafts are fine for a first pass. A native speaker reviews at least the store page and the first session,
  because players judge the whole game by them. Use a freelancer or an agency for the rest when the budget
  allows (see the freelancer rules in `indie-studio:asset-pipeline`).
- Freeze a screen's text before translating it: every later change costs a round trip in every language.
- Store pages: translate the text inside screenshots, not only the description, and research search keywords
  per language rather than translating the English ones.

## 4. Checking
- Play every language on the smallest target phone: nothing cut off or overlapping, no missing characters
  (empty boxes), correct plurals, readable size.
- Look at each store listing in the store's own preview for that country.
- Include the language pass in the milestone smoke test (`indie-studio:roles`, QA).

## 5. Traps
Text baked into images; sentences glued together from pieces; a font without the needed characters;
translating before the text is final; unreviewed machine translation on the store page; forgetting that
screenshots contain text.
