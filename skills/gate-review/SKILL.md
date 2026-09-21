---
name: gate-review
description: Run a phase or milestone exit review ("gate") in an Indie Studio project - Conception Exit, Vertical Slice, First Playable, Alpha, Beta, or Gold Master. Use when a stage's work looks finished, when the user asks "are we ready to move on", "can we start the next phase", or wants to declare a milestone. Checks each criterion against evidence, reports gaps, and on the human's approval advances the state, tags the release line, and resets the session.
argument-hint: "[gate name]"
---

# Gate review

A gate is an "are we ready to move on?" check. It stops the project drifting forward on hope. **Only the
human approves a gate.** You gather evidence and make a recommendation. Communication rules:
[communication.md](../director/references/communication.md).

Checklists for all six gates are in [gates.md](references/gates.md).

## Procedure
1. **Pick the gate:** from `next_gate` in STUDIO_STATE.md, or from `$ARGUMENTS`.
2. **Load its checklist** from gates.md.
3. **Check every criterion against evidence**, not impressions. Evidence is a file path, a commit or tag,
   a log or measurement, a playtest note, or the human's explicit confirmation. Mark each criterion:
   met (with the evidence), partly met, or not met.
4. **Read the risks:** open `studio/RISKS.md`. Has any kill or pivot criterion triggered? Is a time-box overrun?
   Say so.
5. **Report** in chat: a compact table (criterion, status, evidence), then a recommendation:
   - **Ready:** everything met.
   - **Not yet:** list the top three gaps and the smallest work that closes them. Turn them into next actions.
   - **Ready with risk:** name the unmet items and what could go wrong. Passing this way is the human's
     informed choice; record it in DECISIONS.md as an override with the reason.
6. **Ask for approval** explicitly: "Approve the <gate> gate?" Do not treat silence or enthusiasm as approval.
7. **If approved:**
   1. Update STUDIO_STATE.md: Gates table (passed, date, evidence), `phase`, `stage`, `next_gate`, `hats`, "Off-limits right now",
      three new "Next actions", `updated`. Use [phases-and-stages.md](../director/references/phases-and-stages.md).
   2. Append the decision to `studio/DECISIONS.md` and an entry to `studio/JOURNAL.md`.
   3. Git (`indie-studio:git-workflow`): with the user's approval, merge `develop` into `main` with `--no-ff`,
      create the annotated gate tag, and push `main` and the tag. Update `last_synced_commit`.
      (For Gold Master, merge the `release/x.y.z` branch into `main` and `develop` instead; see `indie-studio:launch-live`.)
   4. Give one line on what this milestone means and one line on what the next stage is about.
   5. Recommend a **fresh session** (`indie-studio:session`, compact mode): a gate is the cleanest reset point.
8. **If not approved or not ready:** record the missing items as next actions. Do not advance the stage.

## Rules
- A gate cannot be skipped. If the human wants to move on anyway, record it as a risk override (step 5).
- Do not lower a criterion to make it pass. If a criterion is wrong for this game, propose changing the
  checklist in `studio/DECISIONS.md` first, and have the human approve.
- Passing the Alpha gate starts the feature freeze: state it clearly and update Off-limits and the branch rules.
- Gold Master approval means "ready to submit". The human submits with their own store accounts.
