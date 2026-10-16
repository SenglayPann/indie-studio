---
name: gate-review
description: Run a phase or milestone exit review ("gate") in an Indie Studio project - Conception Exit, Vertical Slice, First Playable, Alpha, Beta, Gold Master, or Global Launch - and close the stages that end without a gate. Use when a stage's work looks finished, when the user asks "are we ready to move on", "can we start the next phase", or wants to declare a milestone. Checks each criterion against evidence, reports gaps, and on the human's approval advances the state, tags the release line, and resets the session.
argument-hint: "[gate name]"
---

# Gate review

A gate is an "are we ready to move on?" check. It stops the project drifting forward on hope. **Only the
human approves a gate.** You gather evidence and make a recommendation. Communication rules:
[communication.md](../director/references/communication.md).

Checklists for all seven gates are in [gates.md](references/gates.md).

## Procedure
1. **Pick the gate:** from `next_gate` in STUDIO_STATE.md, or from `$ARGUMENTS`. If the current stage ends
   without a gate (Idea, Validation, Prototype, GDD, Launch, Live Ops), run the stage close below instead:
   the next gate's checklist cannot pass yet and is not the test.
2. **Load its checklist** from gates.md.
3. **Check every criterion against evidence**, not impressions. Evidence is a file path, a commit or tag,
   a log or measurement, a playtest note, or the human's explicit confirmation. Mark each criterion:
   met (with the evidence), partly met, or not met.
4. **Consistency pass.** Every plan fact has one home: the scope, the first-release line, and the dates in
   STUDIO_STATE.md; the targets in `docs/BUSINESS_CASE.md`; the estimate in `docs/FEASIBILITY.md`; the screens
   in `docs/PITCH.md`. Look through the other documents for copies of these facts and check that each copy
   agrees with its home, and that every decision a newer one replaced says so in its Status line
   (`studio/DECISIONS.md`). A copy that disagrees is a gap: replace it with a link to its home.
5. **Read the risks:** open `studio/RISKS.md`. Has any kill or pivot criterion triggered? Is a time-box overrun?
   Say so.
6. **Report** in chat: a compact table (criterion, status, evidence), then a recommendation:
   - **Ready:** everything met.
   - **Not yet:** list the top three gaps and the smallest work that closes them. Turn them into next actions.
   - **Ready with risk:** name the unmet items and what could go wrong. Passing this way is the human's
     informed choice; record it in DECISIONS.md as an override with the reason.
7. **Ask for approval** explicitly: "Approve the <gate> gate?" Do not treat silence or enthusiasm as approval.
8. **If approved:**
   1. Update STUDIO_STATE.md: Gates table (status passed, the Passed date, evidence; re-forecast the remaining
      gates), `phase`, `stage`, `next_gate`, `hats`, "Off-limits right now", three new "Next actions", `updated`.
      Use [phases-and-stages.md](../director/references/phases-and-stages.md).
   2. Append the decision to `studio/DECISIONS.md` and an entry to `studio/JOURNAL.md`.
   3. Git (`indie-studio:git-workflow`): with the user's approval, merge the stage's own branch into
      `develop` first if it was built on one (for example `feature/vertical-slice`), then `develop` into `main`
      with `--no-ff`, create the annotated gate tag, and push `main` and the tag. If Permissions lists these
      as steps the AI cannot run here, or a safety setting refuses one, give the human the exact commands (one
      per code block) and mark the step pending. Write the tag into the Gates table and update
      `last_synced_commit` only once the tag exists. (For Gold Master, merge the `release/x.y.z` branch into
      `main` and `develop` instead; see `indie-studio:launch-live`.)
   4. Give one line on what this milestone means and one line on what the next stage is about.
   5. If `studio/PLUGIN_FEEDBACK.md` holds entries that were never sent, say how many and offer to send them
      (`indie-studio:plugin-feedback`, send mode). A gate is a good moment to give something back.
   6. Recommend a **fresh session** (`indie-studio:session`, compact mode): a gate is the cleanest reset point.
9. **If not approved or not ready:** record the missing items as next actions. Do not advance the stage.

## Stage close (a stage that ends without a gate)
1. **Checklist:** the ending stage's playbook steps, from the table "Stage closes" in
   [gates.md](references/gates.md). Check each against evidence, as for a gate.
2. Run the consistency pass and read the risks (steps 4 and 5).
3. Report the table and ask: "Close the <stage> stage and start <next stage>?"
4. **If approved:** update `stage` (and `phase` if it changes), `hats`, "Off-limits right now", and three new
   "Next actions" from [phases-and-stages.md](../director/references/phases-and-stages.md), plus `updated`; add a
   decision and a journal entry. No tag and no merge into `main`: those belong to gates. Recommend a fresh
   session.

## Rules
- A gate cannot be skipped. If the human wants to move on anyway, record it as a risk override (step 6).
- Do not lower a criterion to make it pass. If a criterion is wrong for this game, propose changing the
  checklist in `studio/DECISIONS.md` first, and have the human approve.
- Passing the Alpha gate starts the feature freeze: state it clearly and update Off-limits and the branch rules.
- Gold Master approval means "ready to submit". The human submits with their own store accounts.
