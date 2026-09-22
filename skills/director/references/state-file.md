# STUDIO_STATE.md: format and update rules

`STUDIO_STATE.md` sits at the root of the game project. It is the project's memory across sessions.
The SessionStart hook reads it, so keep the headings and front-matter keys exactly as in the template
(`${CLAUDE_PLUGIN_ROOT}/templates/STUDIO_STATE.md`).

## Front-matter keys
| Key | Meaning | Allowed values |
|---|---|---|
| `studio_state` | Format version | `1` |
| `project` | Working title | text |
| `phase` | Big chapter | `Conception`, `Pre-Production`, `Production`, `Launch-Live` |
| `stage` | Step in the phase | see `phases-and-stages.md` |
| `next_gate` | Gate being worked toward | gate names, or `none` |
| `hats` | Roles active this session, at most 3 | role names |
| `engine` | Chosen engine | `undecided`, `Unity`, `Godot`, ... |
| `platform` | Target platforms | `mobile`, `Android`, `iOS`, ... |
| `git_permissions` | Whether the git permission contract was agreed | `set`, `not-set` |
| `last_synced_commit` | Latest code commit this file accounts for | short hash or `none` |
| `updated` | Date of last edit | `YYYY-MM-DD` |

Only put a `#` comment after a value, never inside one (the hook strips text after ` #`).

## Body sections (keep these exact headings; the hook reads three of them)
`Now`, `Next actions` (hook), `Off-limits right now` (hook), `Open questions` (hook), `Scope tiers`,
`Gates`, `Permissions`, `Schedule`, `Last session`.

Keep the whole file under about 80 lines. It is read at every session start; every line costs context.
Move history to `studio/JOURNAL.md`, reasons to `studio/DECISIONS.md`, and verified facts to
`studio/KNOWLEDGE.md`.

## When to update (state as you go)
Update the file at each of these moments, not only at the end of a session:
1. A task finishes or the "Next actions" list changes.
2. A decision is made (also append to DECISIONS.md).
3. A gate passes or a stage changes (also update Off-limits, Hats, next_gate, and the Gates table).
4. The human answers or raises an open question.
5. Before recommending a compact or a fresh session.
6. At wrap-up.

After a real code commit, set `last_synced_commit` to that commit's short hash, so the next session
can tell whether anything happened outside the notebook. Commits that only touch STUDIO_STATE.md or
`studio/` do not count (the hook ignores them).

Always set `updated` to today's date when editing.

## One notebook, many branches
Git keeps a copy of this file and of `studio/` on every branch, and the newest copy is the true one. If the
session brief says "NEWER NOTEBOOK", carry that copy over before planning (`indie-studio:git-workflow`,
section 8). Before a branch that will not be merged is deleted (every spike), carry its notebook to `develop`.

## Reconciling a stale state
If the brief says the state is behind git, run `git log --oneline <last_synced_commit>..HEAD`, read the
commit subjects (and diffs where unclear), summarize what changed since, update STUDIO_STATE.md, and
only then plan the session. Tell the user what you found in one or two lines.
