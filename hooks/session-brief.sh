#!/bin/sh
# Indie Studio: SessionStart briefing.
#
# Prints a short status brief that Claude Code adds to the session context, so a brand-new
# (or cleared, or compacted) session always knows where the project stands.
# Stays completely silent in projects that have no STUDIO_STATE.md.
#
# POSIX sh only: runs under Git Bash on Windows and under sh/dash/bash elsewhere.
# Always exits 0 so it can never block a session from starting.

root="${CLAUDE_PROJECT_DIR:-$PWD}"
state="$root/STUDIO_STATE.md"
[ -f "$state" ] || exit 0

# Value of a front-matter key (the block between the first two '---' lines).
fm() {
  tr -d '\r' < "$state" | awk -v k="$1" '
    /^---[ \t]*$/ { n++; next }
    n == 1 {
      i = index($0, ":")
      if (i > 0 && substr($0, 1, i - 1) == k) {
        v = substr($0, i + 1)
        sub(/[ \t]+#.*$/, "", v)
        gsub(/^[ \t]+|[ \t]+$/, "", v)
        print v
        exit
      }
    }
    n >= 2 { exit }'
}

# Non-empty, non-comment lines under "## <heading>", at most N lines.
section() {
  tr -d '\r' < "$state" | awk -v h="$1" '
    /^## / { on = ($0 == "## " h); next }
    on && NF && $0 !~ /^<!--/ { print }' | head -n "$2"
}

# Front-matter value, or a fallback when empty.
val() {
  v=$(fm "$1")
  if [ -n "$v" ]; then printf '%s' "$v"; else printf '%s' "$2"; fi
}

echo "=== INDIE STUDIO BRIEF (generated automatically at session start) ==="
echo "Project : $(val project '(untitled)')"
echo "Phase   : $(val phase '?')   Stage: $(val stage '?')   Next gate: $(val next_gate '?')"
echo "Hats    : $(val hats '?')   Engine: $(val engine 'undecided')   Platform: $(val platform '?')"
echo "State last updated: $(val updated '?')"

if command -v git >/dev/null 2>&1 && git -C "$root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  head=$(git -C "$root" rev-parse --short HEAD 2>/dev/null)
  branch=$(git -C "$root" branch --show-current 2>/dev/null)
  [ -n "$branch" ] || branch="(detached HEAD)"
  dirty=$(git -C "$root" status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  if [ -n "$head" ]; then
    last=$(git -C "$root" log -1 --format='%h %s (%cr)' 2>/dev/null)
    echo "Git     : branch $branch, $dirty uncommitted file(s). Last commit: $last"
    synced=$(fm last_synced_commit)
    if [ -n "$synced" ] && [ "$synced" != "none" ]; then
      if git -C "$root" cat-file -e "$synced^{commit}" 2>/dev/null; then
        newer=$(git -C "$root" log --oneline "$synced..HEAD" -- . ':!STUDIO_STATE.md' ':!studio' 2>/dev/null)
        if [ -n "$newer" ]; then
          count=$(printf '%s\n' "$newer" | wc -l | tr -d ' ')
          echo "! STATE MAY BE STALE: $count commit(s) since STUDIO_STATE.md was last synced ($synced):"
          printf '%s\n' "$newer" | head -n 5 | sed 's/^/    /'
          echo "  Reconcile from git log before planning (indie-studio:session, start mode)."
        fi
      else
        echo "! last_synced_commit ($synced) is not in this repository history. Reconcile from git log."
      fi
    else
      echo "Note    : last_synced_commit is not set yet."
    fi
    # The notebook is project-wide, but git keeps one copy per branch. Warn when another branch
    # (or an archived spike tag) holds a newer copy than the one checked out here.
    mine=$(git -C "$root" log -1 --format=%ct HEAD -- STUDIO_STATE.md studio 2>/dev/null)
    best=${mine:-0}
    newer_ref=""
    for ref in $(git -C "$root" for-each-ref --format='%(refname:short)' refs/heads refs/tags/archive 2>/dev/null); do
      ct=$(git -C "$root" log -1 --format=%ct "$ref" -- STUDIO_STATE.md studio 2>/dev/null)
      if [ -n "$ct" ] && [ "$ct" -gt "$best" ]; then best=$ct; newer_ref=$ref; fi
    done
    if [ -n "$newer_ref" ]; then
      when=$(git -C "$root" log -1 --format='%cr' "$newer_ref" -- STUDIO_STATE.md studio 2>/dev/null)
      echo "! NEWER NOTEBOOK on '$newer_ref' (saved $when). The copy on this branch may be out of date."
      echo "  Carry it over before planning (indie-studio:git-workflow, section 8)."
    fi
  else
    echo "Git     : repository has no commits yet (branch $branch)."
  fi
else
  echo "Git     : not a git repository yet. Run indie-studio:git-workflow (init mode)."
fi

next=$(section "Next actions" 5)
if [ -n "$next" ]; then
  echo "Next actions:"
  printf '%s\n' "$next" | sed 's/^/  /'
fi

ask=$(section "Open questions" 4)
if [ -n "$ask" ]; then
  echo "Open questions for the human:"
  printf '%s\n' "$ask" | sed 's/^/  /'
fi

off=$(section "Off-limits right now" 5)
if [ -n "$off" ]; then
  echo "Off-limits right now:"
  printf '%s\n' "$off" | sed 's/^/  /'
fi

cat <<'RULES'
--- Studio operating rules for this project ---
1. Trust STUDIO_STATE.md for the phase and stage. Do not guess them.
2. Open your first reply with a 3-5 line recap of this brief (phase, stage, next actions, open questions), then propose the first action. Skip the recap only if the user is clearly mid-task.
3. User asks for a new feature, mechanic, asset, or plan change: invoke indie-studio:scope-guard BEFORE doing it.
4. Answer depends on a version, API, store rule, price, license, tool feature, or an unfamiliar error: invoke indie-studio:research BEFORE answering.
5. Any git action (commit, branch, merge, tag, push, undo): follow indie-studio:git-workflow.
6. Only the human approves gates, merges into main, spending money, or publishing. Never enter passwords, keys, or payment details.
7. Update STUDIO_STATE.md after each meaningful step. Suggest a compact or fresh session per indie-studio:session.
8. Explain jargon in plain words the first time you use it.
9. A studio rule or skill was wrong, missing, or in the way, or the user overrides one: log it with indie-studio:plugin-feedback in one line, then carry on.
=== END BRIEF ===
RULES

exit 0
