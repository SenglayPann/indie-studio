---
name: plugin-feedback
description: Capture and send feedback about the Indie Studio plugin itself, not about the game. Use when a studio rule, skill, gate, or template gave wrong or outdated advice, got in the way, did not start when it should have, or started when it should not; when a hook, template, or tool setup failed; when something the user needed was missing; when the user corrects or overrides a studio rule; and when the user says the plugin is wrong, wants to report a problem with the studio, or suggests an improvement to it. Logs short entries in studio/PLUGIN_FEEDBACK.md as they happen and, only with the human's approval of the exact text, turns them into a scrubbed report for the plugin's issue tracker.
argument-hint: "[log <what happened> | review | send]"
---

# Plugin feedback

This plugin is young. The fastest way to improve it is to record what went wrong while it is fresh, in the
words of the person it happened to. Communication rules:
[communication.md](../director/references/communication.md).

Three things are kept apart:
- **The studio was wrong** (this skill): a rule, skill, gate, or template misfired.
- **The game has a bug**: `studio/BUGS.md` (`indie-studio:roles`, QA).
- **Claude Code itself misbehaved** (the app, a tool, a model): its own `/bug` command, which reaches
  Anthropic, not this plugin.

Pick the mode from `$ARGUMENTS`: no argument or a description = `log`, `review`, or `send`.

## When to log, without being asked
- The human corrects you on something a studio rule told you to do, or overrides a rule ("skip that",
  "stop costing every idea", "that gate does not fit").
- Advice from a skill turned out to be wrong or out of date (research contradicted it, a store rule changed,
  a number was far off for this project).
- A skill did not start when it should have, or started when it should not, and the human had to name it.
- A gate criterion, template, or off-limits rule did not fit this game.
- Setup failed: a hook, a template copy, a git step, a tool connection.
- Something the human needed was missing and no skill covered it.

**Do not log** the game's own bugs, your own slips that no rule caused, or the human's preferences about their
game. If the problem is blocking work right now, solve it first and log it afterwards.

## 1. Log (the default)
1. Read the plugin version from `${CLAUDE_PLUGIN_ROOT}/.claude-plugin/plugin.json`.
2. If `studio/PLUGIN_FEEDBACK.md` does not exist, copy
   `${CLAUDE_PLUGIN_ROOT}/templates/studio/PLUGIN_FEEDBACK.md` into it.
3. Append one entry, using the format in that file: id, date, version, status `new`, skill, phase and stage,
   kind, severity, what happened, what was expected, a suggested fix if you have one, and evidence (a source
   URL with the date for a fact that changed, or the exact words that were wrong).
4. Keep every field to one or two lines, and write what a stranger would need to reproduce it.
5. Tell the human in **one line** ("Noted as F-003 for the plugin's author.") and carry on with the task.
   Never turn this into a conversation or interrupt the work in progress.

## 2. Review
Show the entries that have not been sent, grouped by kind, with a count by severity. Let the human edit the
wording, merge duplicates, or drop an entry (`status: dropped (<reason>)`). Then offer `send`.

## 3. Send (the human approves every time)
1. Choose the entries: by default all with `status: new`.
2. **Scrub them.** The report describes the plugin's behavior only. Remove or generalize the game's title and
   concept, mechanics, art, store or revenue data, code and file contents, absolute paths and user names,
   private repository URLs, keys, e-mail addresses, and playtester names. "In a mobile puzzle project" is all
   the context a reader needs. If an entry cannot be written without the game's details, say so and let the
   human decide whether to drop it or share it anyway.
3. **Show the full text and ask.** Nothing is sent without an explicit yes to that exact text.
4. Send it the way the human picks:
   - **`repository` is set in `plugin.json`** (a GitHub URL): build a pre-filled link they open themselves,
     `https://github.com/<owner>/<repo>/issues/new?title=<encoded>&body=<encoded>`. Keep the whole link under
     about 6000 characters; if it is longer, send one entry per issue, or give them the report to paste into
     the issue form. If `gh` is installed and the human is signed in, offer instead to run
     `gh issue create --repo <owner>/<repo> --title "<title>" --body-file <path>` once they approve.
   - **No repository set:** save the report as `studio/plugin-feedback-<date>.md` and tell the human where it
     is and how to pass it on.
5. Mark each sent entry `status: sent <date>` with the issue link when there is one.

## Rules
- Nothing leaves the project without the human's yes on the exact text. No automatic sending, no counters, no
  telemetry, no background reporting. The plugin collects nothing on its own.
- Ask at most one invitation per session, at wrap ("anything the studio got wrong today?"). If the human
  declines, drop it for that session.
- Never send a report that contains a key, a password, or anything private, even if the human asks. Say why,
  and offer the scrubbed version instead.
- Praise is worth logging too: a rule that clearly saved time is evidence for keeping it.
