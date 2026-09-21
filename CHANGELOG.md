# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and the project uses semantic versioning.

## [0.1.0] - unreleased

### Added
- Plugin manifest and marketplace catalog (installable through `/plugin marketplace add`).
- SessionStart hook that briefs Claude on the project state at startup, resume, clear, and compact, and flags
  state that is behind git. Silent in projects without `STUDIO_STATE.md`.
- Sixteen skills: `director`, `session`, `git-workflow`, `research`, `scope-guard`, `gate-review`, `roles`
  (ten role files), `conception`, `preproduction`, `production`, `launch-live`, `playtest-loop`,
  `engine-selector`, `ai-delegation`, `mobile-perf-budget`, `asset-pipeline`.
- Templates: project state file, `studio/` logs, pitch, GDD-lite, style bible, task brief, playtest sheet,
  post-mortem, CLAUDE.md block.
- Git hooks (`commit-msg`, `pre-commit`) plus `.gitignore` and `.gitattributes` templates for Unity and Godot.
- `scripts/check-plugin.sh` integrity check.
