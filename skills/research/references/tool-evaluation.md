# Evaluating a new AI or asset tool

New tools appear constantly. Without a method, a beginner ends up paying for several subscriptions and
switching tools mid-project, which ruins visual consistency. Use this protocol, time-boxed to about two hours.

## 1. Define the need first
Write one line: what job must the tool do for THIS project, and what does good look like? Example:
"Generate 2D icon sprites, 128x128, flat pastel style matching the style bible, transparent background."
If there is no real task waiting, do not evaluate. Do not adopt tools "just in case".

## 2. Shortlist at most three
Search for current candidates (`indie-studio:research`, volatile tier). Read each tool's official pricing,
terms, and export pages, not review sites.

## 3. Paper check (before any test)
Record for each candidate, with source URLs and dates in `studio/KNOWLEDGE.md`:
- **Commercial use:** is selling a game with its output allowed on the plan you would use? Free tiers often
  differ from paid ones.
- **Ownership and attribution:** who owns the output; is credit required?
- **Data use:** does the tool train on what you upload? Can you opt out?
- **Store and platform rules:** do the stores you target require disclosing AI-generated content? Check
  the current rules (volatile).
- **Formats:** does it export what the engine needs (PNG with alpha, WAV or OGG, FBX or GLB, sprite sheets)?
- **Price:** free-tier limits, monthly cost, credits. Prefer monthly over annual plans before the Vertical
  Slice gate.
- **Integration:** API, plugin, or MCP server available? Useful for automation later.
Drop any candidate that fails commercial use or export.

## 4. Fair test
Run the same three test jobs on every remaining candidate. Take them from real project needs, and use the
style bible as the brief.
- Generate five variations per job to see consistency, not just the best result.
- Time the cleanup a human must do to make each result usable.

Score each 1-5 and write it down:

| Criterion | Tool A | Tool B | Tool C |
|---|---|---|---|
| Matches the style bible | | | |
| Consistency across 5 variations | | | |
| Cleanup effort (5 = almost none) | | | |
| Speed to a usable asset | | | |
| Cost per usable asset | | | |
| License and terms comfort | | | |
| **Total** | | | |

## 5. Decide and record
The human decides. Record the winner, the scores, and the reason in `studio/DECISIONS.md`, and add the
tool to the header of `studio/ASSET_LEDGER.md`. Note the plan tier and the terms URL with the date.

## 6. Subscription discipline
- One tool per job. Do not switch tools for a single asset type mid-project unless the style bible is
  re-checked and the old assets are re-evaluated.
- Set a reminder to review each paid tool monthly; cancel what is unused.
- Terms change: re-check a tool's license page before each release gate (Beta and Gold Master).
