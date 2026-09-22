# Contributing

Thanks for helping improve Indie Studio. This plugin is instructions and small scripts, so most contributions
are careful edits to Markdown.

## Set up and test

```
claude --plugin-dir .          # load the plugin from this folder
/reload-plugins                # pick up edits without restarting
claude plugin validate .       # manifest and marketplace check
sh scripts/check-plugin.sh     # skill names, links, path references, shell syntax
```

Run both checks before every commit. Hook scripts are tested by running them against a scratch game folder
(one with a `STUDIO_STATE.md`, one without) and, for the git hooks, in a throwaway repository.

## Writing or changing a skill

- One folder per skill under `skills/`, with a `SKILL.md`. The frontmatter `name` must equal the folder name.
- The **description** decides when Claude loads the skill. Say what it does and list the situations that should
  trigger it, using the words a user would say. Keep it under 1000 characters.
- Keep `SKILL.md` under 500 lines. Move detail into `references/` files and link to them with relative paths.
- Refer to other skills as `indie-studio:<name>` and to plugin files as `${CLAUDE_PLUGIN_ROOT}/...`.
- Write for a beginner: plain words, one-line explanation of any unavoidable term, short sentences.
- The human decides; skills recommend. Never write instructions that publish, spend, merge into `main`, or handle
  credentials without a human approval step.
- **Facts that go stale** (versions, store rules, prices, licenses, tool features) must not be stated as current
  truth. Say "verify with `indie-studio:research`" and give the method, not the number. Numbers in skills are labeled
  starting points.
- Every new skill needs a mention in the README table and a `CHANGELOG.md` entry.

## Commits and branches

This repository follows its own rules (see `skills/git-workflow/`): work on a short-lived branch from `develop`,
commit with `<type>(<scope>): <summary>`, merge into `develop`, and merge `develop` into `main` only for a release,
with a version tag.

## Reporting bad advice

While you work, the studio logs its own misfires in your project's `studio/PLUGIN_FEEDBACK.md`. Run
`/indie-studio:plugin-feedback send` to turn those notes into a report: it removes everything about your game,
shows you the text, and hands you a pre-filled issue link. You can also open the **Plugin feedback** issue form
directly and fill it in by hand.

Either way, the useful parts are: plugin version, which skill, what it did, what you expected, and a source
with a date when a fact has changed.

### Triage (maintainers)
1. Label the issue by kind (`wrong-advice`, `outdated`, `in-the-way`, `trigger`, `missing`, `setup`).
2. Reproduce it with the matching scenario in `docs/TESTING.md`, or write the smallest scenario that shows it.
3. Fix the skill, add that scenario to `docs/TESTING.md` so it cannot come back, and note it in `CHANGELOG.md`.
4. Outdated facts are a design signal: if a skill stated something that goes stale, replace the fact with a
   method and a pointer to `indie-studio:research`.

## Adding an engine or platform

Prefer small reference files (`references/`) over new top-level skills. A new skill is justified only when it
has its own trigger situation that no existing skill covers.
