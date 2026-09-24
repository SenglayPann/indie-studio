---
name: session
description: Manage the start, end, and length of a working session in an Indie Studio project. Use at the start of a session or after /clear or a compaction (orient from STUDIO_STATE.md and reconcile with git), at the end of a session (save state, write the journal, commit, hand off), and whenever the conversation is long or cluttered, a milestone just finished, or a debugging loop just ended (recommend compacting or a fresh session, saving state first).
argument-hint: "[start | wrap | compact]"
---

# Session protocol

An AI session has no memory of earlier sessions and a fixed-size context. This skill makes sessions
start informed, end clean, and get reset at the right moments. Communication rules:
[communication.md](../director/references/communication.md).

Pick the mode from `$ARGUMENTS`. With no argument, use `start` at the beginning of a session, `wrap`
when the user says they are finishing, and `compact` when a trigger below applies.

## Start
1. Use the session brief injected at startup (phase, stage, hats, git status, next actions, open
   questions). If there is none, read `STUDIO_STATE.md` yourself. If there is no state file, invoke
   `indie-studio:director` in init mode.
2. If the brief flags the state as stale, reconcile first: follow "Reconciling a stale state" in
   [state-file.md](../director/references/state-file.md). If it reports a newer notebook on another branch or
   tag, carry that copy over first (`indie-studio:git-workflow`, section 8).
3. Check the working tree. If there are uncommitted changes from an earlier session, summarize them in
   one or two lines and ask what to do (commit them on the right branch, keep going, or set aside). Never
   discard changes without explicit approval.
4. If `git_permissions` is `not-set` and a repository exists, run the permission contract in
   `indie-studio:git-workflow` before any git action.
5. Give the recap in at most six lines (one line when `experience` is `experienced`): phase and stage, next
   gate, hats, branch, the next three actions, open questions.
6. Ask how much time the user has today if it is not obvious, and propose a plan that fits: one to
   three tasks, each with a rough estimate. Name any time-box in `studio/RISKS.md` that is close or overrun.
7. Begin with the first task once the user agrees.

## Wrap
Run when the user is done for now, or before a long break.
1. Save the work. Show `git status`. Commit per `indie-studio:git-workflow` on the current
   working branch (never directly on `main`). Do not leave work only in the working tree.
2. Update `STUDIO_STATE.md`: Now, the next three actions, open questions, Last session, `updated`, and
   `last_synced_commit` (the latest code commit, not a state-only commit).
3. Append a journal entry to `studio/JOURNAL.md` using the format in that file. Ask roughly how many hours
   were worked and, for finished tasks, the estimate versus the actual (this feeds the post-mortem).
4. Append any decisions made to `studio/DECISIONS.md`. Move any parked ideas to `studio/PARKING_LOT.md`.
5. Back up: if the permission contract allows it, push the working branch to the remote. If there is no
   remote yet, say so and recommend setting one up.
6. Commit the state and journal changes as `chore(state): wrap up <date>`.
7. Tell the user in three lines: what is saved and where, what is unfinished, and what the first action
   next session will be. Recommend a fresh chat next time; the brief will restore the context.
8. Add one short invitation, once, and drop it if they pass: anything the studio itself got wrong today
   (`indie-studio:plugin-feedback`).

## Compact (context hygiene)
You cannot see an exact token count. Watch for these triggers and, when one applies, recommend a reset
once (do not nag; if the user declines, do not repeat for the same trigger). The user can also check the
context meter in their Claude Code client.

| Trigger | Recommendation |
|---|---|
| A gate just passed, or a stage just ended | **Fresh session** (`/clear`). The state file carries everything, so this is the cleanest reset. |
| A wrap just finished | Fresh session next time. |
| A long debugging loop ended, or the retry cap was hit | Compact: the failed attempts are noise. |
| Heavy research (many pages read) or big logs were pasted | Save findings to `studio/KNOWLEDGE.md` first, then compact. |
| Switching hat or subsystem after a long stretch | Compact or fresh session. |
| A big new task is about to start in a long, messy session | Compact first. |
| Symptoms of drift: re-asking answered questions, contradicting `studio/DECISIONS.md`, forgetting the current stage, re-reading the same files | Compact now. |
| The user says the session is long or the meter looks high | Compact now. |

Procedure when recommending:
1. Say in one or two lines why now is a good moment.
2. **Save first.** Update `STUDIO_STATE.md`, add a journal line if the work was significant, save research
   to `studio/KNOWLEDGE.md`, and commit safe work. Nothing important may live only in the chat.
3. Give the exact command in a code block. The user runs it; you cannot. For a compact:

```
/compact Keep: current phase/stage and task, decisions since the last gate, names of failing tests or files, what has already been tried. Drop: raw logs, full web page text, dead-end attempts.
```

   For a fresh start, tell them to run `/clear` (or open a new chat).
4. Explain what happens next: after a compact, clear, or new session the studio brief is injected
   automatically, so nothing is lost. If no brief appears, re-read `STUDIO_STATE.md` before continuing.

## Keep sessions light
- Prefer filtered output (`head`, `grep`, a targeted read) over dumping whole logs or files into the chat.
- Put long plans and documents in files; summarize in chat.
- After reading a long web page, record the few facts that matter in `studio/KNOWLEDGE.md` and move on.
