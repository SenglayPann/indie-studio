# Bringing a notebook up to date after a plugin update

Skills from a newer plugin can rely on lines and sections that an older notebook does not have. The session
brief says "PLUGIN VERSION" when `plugin_version` in STUDIO_STATE.md differs from the installed plugin
(`version` in `${CLAUDE_PLUGIN_ROOT}/.claude-plugin/plugin.json`).

## How (director, doctor item 14)
1. Compare the two versions. If the notebook names a newer version than the one installed (the plugin was
   rolled back), change nothing: say so in one line. The older skills ignore lines they do not know.
2. For every version below that is newer than the notebook's, list what this project is missing. Skip items
   for documents the project does not have yet: those are written from the new templates when their stage
   comes. A notebook with no `plugin_version` was set up before 0.4.0: start from the 0.3.0 list.
3. Show the list in plain words, in two groups: **add now** (small lines with a safe default) and **needs a
   decision or real work** (offer each as a next action). Change nothing without the human's yes.
4. Add the approved pieces. Never rewrite history into the new format: old journal entries, decisions, and
   playtest notes stay as they were written.
5. Set `plugin_version` to the installed version and commit `chore(state): update notebook to <version>`.

## 0.4.0
Add now:
- STUDIO_STATE.md front matter: `plugin_version`.
- STUDIO_STATE.md, Schedule: `Track my own hours: no`. Do not ask; the human can switch it on.
- STUDIO_STATE.md, Permissions: `Git steps the AI cannot run here (the human runs them): none known` (or the
  steps that were already refused here), and `Standing delegation: none`.
- `docs/PITCH.md`, Constraints: `Testers:` (ask once: people the human can watch, people online only, a store
  test track only, or nobody yet).

Needs a decision or real work:
- `docs/GDD.md`, section 6: the screen map for every tier and the roadmap (`indie-studio:roles`, UI/UX
  designer). Past the GDD stage, offer it as a next action before the next feature that adds a screen.
- A tester budget, if outsiders can only be reached remotely (`indie-studio:playtest-loop`).

## 0.3.0
Add now:
- STUDIO_STATE.md, Scope tiers: `First release includes: T1` (or what a recorded decision chose).
- STUDIO_STATE.md, Schedule: `Estimate ratios, actual / estimate: ...` (measured ratios if the journal has them).
- STUDIO_STATE.md, Permissions: `Studio-wide knowledge file ...: not asked yet`.
- `studio/KNOWLEDGE.md`: the Kind column (`general` or `game`) for new rows.
- `studio/DECISIONS.md`: `Replaces` and `Status` for new decisions; mark the old decisions a newer one replaced.

Needs a decision or real work:
- `docs/PITCH.md`: the hook section, and the Screens list (build it from `docs/FEASIBILITY.md` or the GDD).
- `docs/FEASIBILITY.md` in three columns, if the project has not yet passed the Vertical Slice timing exercise.
- `docs/MARKET.md`: the genre contract. `docs/BUSINESS_CASE.md`: the "Carried by" column of the targets.
- `docs/BALANCE.md`, for a game with score targets, random content, or upgrades that stack.
