#!/bin/sh
# Integrity check for the indie-studio plugin. Run from anywhere:  sh scripts/check-plugin.sh
#
# Checks:
#   1. Every skills/<name>/SKILL.md has frontmatter with name == folder name and a description.
#   2. Every "indie-studio:<skill>" mention points at an existing skill.
#   3. Every relative markdown link inside skills/ resolves to a real file.
#   4. Every ${CLAUDE_PLUGIN_ROOT}/<path> mention points at a real file or folder.
#   5. Shell scripts parse (sh -n) and JSON files are valid (when node is available).
# Exit status is the number of problems found (0 means clean).

cd "$(dirname "$0")/.." || exit 1
errors=0
fail() { printf 'FAIL: %s\n' "$*"; errors=$((errors + 1)); }

# 1. Skill frontmatter
for dir in skills/*/; do
  name=$(basename "$dir")
  f="skills/$name/SKILL.md"
  if [ ! -f "$f" ]; then fail "$name: missing SKILL.md"; continue; fi
  first=$(head -n 1 "$f" | tr -d '\r')
  [ "$first" = "---" ] || fail "$f: does not start with frontmatter '---'"
  fm_name=$(awk '/^---[ \t\r]*$/ {n++; next} n==1 && /^name:/ {sub(/^name:[ \t]*/, ""); sub(/[ \t\r]+$/, ""); print; exit}' "$f")
  [ "$fm_name" = "$name" ] || fail "$f: frontmatter name '$fm_name' does not match folder '$name'"
  desc=$(awk '/^---[ \t\r]*$/ {n++; next} n==1 && /^description:/ {sub(/^description:[ \t]*/, ""); print; exit}' "$f")
  [ -n "$desc" ] || fail "$f: missing description"
  len=$(printf '%s' "$desc" | awk '{ print length($0) }')
  [ "${len:-0}" -le 1000 ] || fail "$f: description is $len chars (keep it under 1000)"
  lines=$(wc -l < "$f" | tr -d ' ')
  [ "$lines" -le 500 ] || fail "$f: $lines lines (keep SKILL.md under 500)"
done

# 2. indie-studio:<skill> mentions
grep -rhoE 'indie-studio:[a-z][a-z-]*' skills hooks templates README.md CONTRIBUTING.md 2>/dev/null | sort -u | while IFS= read -r ref; do
  skill=${ref#indie-studio:}
  skill=${skill%-}
  [ -d "skills/$skill" ] || echo "FAIL: reference to missing skill '$ref'"
done > /tmp/indie_check_refs.$$ 2>/dev/null
if [ -s /tmp/indie_check_refs.$$ ]; then cat /tmp/indie_check_refs.$$; errors=$((errors + $(wc -l < /tmp/indie_check_refs.$$))); fi
rm -f /tmp/indie_check_refs.$$

# 3. Relative markdown links inside skills/
find skills -name '*.md' | while IFS= read -r f; do
  grep -o '\]([^)]*)' "$f" 2>/dev/null | sed 's/^](//; s/)$//' | while IFS= read -r link; do
    case "$link" in http*|\#*|mailto:*|'') continue ;; esac
    target=${link%%#*}
    [ -e "$(dirname "$f")/$target" ] || echo "FAIL: $f links to missing file '$link'"
  done
done > /tmp/indie_check_links.$$ 2>/dev/null
if [ -s /tmp/indie_check_links.$$ ]; then cat /tmp/indie_check_links.$$; errors=$((errors + $(wc -l < /tmp/indie_check_links.$$))); fi
rm -f /tmp/indie_check_links.$$

# 4. ${CLAUDE_PLUGIN_ROOT}/... mentions
grep -rhoE '\$\{CLAUDE_PLUGIN_ROOT\}/[A-Za-z0-9_./-]*' skills templates 2>/dev/null | sort -u | while IFS= read -r ref; do
  path=${ref#'${CLAUDE_PLUGIN_ROOT}'/}
  path=${path%.}
  path=${path%,}
  [ -e "$path" ] || echo "FAIL: plugin path '$ref' does not exist"
done > /tmp/indie_check_paths.$$ 2>/dev/null
if [ -s /tmp/indie_check_paths.$$ ]; then cat /tmp/indie_check_paths.$$; errors=$((errors + $(wc -l < /tmp/indie_check_paths.$$))); fi
rm -f /tmp/indie_check_paths.$$

# 5. Syntax
for s in hooks/session-brief.sh templates/git/githooks/commit-msg templates/git/githooks/pre-commit scripts/check-plugin.sh; do
  sh -n "$s" 2>/dev/null || fail "$s: shell syntax error"
done
if command -v node >/dev/null 2>&1; then
  for j in .claude-plugin/plugin.json .claude-plugin/marketplace.json hooks/hooks.json; do
    node -e "JSON.parse(require('fs').readFileSync(process.argv[1],'utf8'))" "$j" 2>/dev/null || fail "$j: invalid JSON"
  done
fi

count=$(find skills -name SKILL.md | wc -l | tr -d ' ')
if [ "$errors" -eq 0 ]; then
  echo "OK: $count skills checked, no problems found."
else
  echo "$errors problem(s) found in $count skills."
fi
exit "$errors"
