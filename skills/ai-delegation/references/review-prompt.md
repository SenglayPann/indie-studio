# Fresh-eyes review and the builder check

The agent that wrote a change or a brief shares its own blind spots, so it cannot be its only reviewer. A
subagent starts with no memory of the chat: it reads only what is on disk, as the human or a later session
would. Use one in two places: to review a change before the human is asked to merge it, and to cold-read a
brief before anyone builds from it.

## 1. Review before a merge
**When:** every agent-written change to code, data, scenes, or saves, before you ask the human to merge it
into `develop`. A change to text documents only may skip it; say so in the merge summary.

**Give it files, not the chat history:**
- the task brief (`studio/tasks/T-###.md`) with its Result filled in. These are the builder's claims.
- the command that shows the change: `git diff <base>...<branch>`
- the project rules (`CLAUDE.md`) and `docs/TECH.md`
- where to write its report: `studio/tasks/T-###-review.md`

Name a model tier for it: a middle one is enough for a small change; use the strongest available for saves,
purchases, or a large change. Model names change quickly, so name the tier, not a model.

**The prompt** (fill in the `<...>`):

```text
You are reviewing a change to a mobile game before the developer decides whether to merge it. You have not
seen how it was made. Judge only what is on disk.
Read <brief path>, <CLAUDE.md path>, and <docs/TECH.md path>. See the change with: git diff <base>...<branch>
The brief's Result section holds the builder's claims, not facts. Check each one against the diff.

Give two verdicts. Each finding gets a file and line, and a severity.
1. Does it match the brief? Criteria missing or half done; work the brief did not ask for; files outside
   "Allowed to touch"; anything misunderstood; tuned numbers or design rules changed without being asked.
2. Is it built well? Bugs and crashes; the project rules in CLAUDE.md, especially allocations in per-frame
   code, tuned numbers kept in data, game rules reaching the UI only through events, saves (version raised,
   migration, test), player text from string tables, ads, purchases and analytics only through their
   wrappers, pause and resume, safe areas; tests that would still pass if the feature were broken.
Severity: MUST FIX (breaks a criterion, loses or corrupts a save, mishandles a purchase, crashes, exposes a
secret), SHOULD FIX (breaks a project rule, or a likely bug), NOTE (smaller ideas).
Then list what you could not judge from the diff: scenes or other files changed through the editor, how it
looks, moves, sounds or feels, speed on a phone.
Do not edit any file and do not start other agents. Write the report to <report path>, then reply with the
count per severity and the path.
```

**After the review:**
1. Check that the report file exists before you rely on it ([done-evidence.md](done-evidence.md), section 6).
2. Fix every MUST FIX and SHOULD FIX, or write down why not. A finding can be wrong: say why, with proof.
   Run the checks again after the fixes.
3. If a MUST FIX was fixed, run one more fresh review of the new diff. Two rounds at most; anything left goes
   to the human as it stands.
4. The merge summary names the result: the counts, what was fixed, what was declined and why, and what the
   reviewer could not judge. The human still decides the merge.

## 2. Builder check: a cold read of a brief
**When:** before a brief goes to an agent for a long or unattended run, before a brief goes to a freelancer,
and before others build from a plan or a section of `docs/TECH.md` or the GDD. Not for a tiny task.

**The prompt:**

```text
You must build from this document alone, with no chance to ask questions later: <path>, and any file it
points to. List the questions you would need answered first, only where a wrong guess would change the
result, most important first, at most seven. For each, say what you would guess if nobody answered.
Do not build anything.
```

**Sort the questions, in one round only:**
- Already answered in the project's documents: write the answer into the brief.
- Small and easy to undo: decide, and mark it "(AI's call)" in the brief.
- The human's call (scope, money, what the player experiences): ask in one message, most important first
  ([communication.md](../../director/references/communication.md)).
