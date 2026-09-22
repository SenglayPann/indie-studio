# Project rules starting point

Copy the block below into the game project's `CLAUDE.md` when the engine is chosen (Prototype stage),
fill the placeholders, and delete any line that does not apply. Keep the whole file under about 100 lines.
Show it to the human and get approval before writing it.

```markdown
## Project rules (<engine> <version>, <language>, mobile)

### Workflow
- Read STUDIO_STATE.md first. Work only on the current task brief and stay inside its allowed files.
- One branch per task. Small commits in the `type(scope): summary` format. Never commit to `main`.
- Compile or run before saying "done". Report failures and skipped steps honestly.
- Three failed attempts at the same problem: stop, summarize, and give the human the options from
  `indie-studio:ai-delegation` (fresh session, look it up, make it smaller, ask people, hands on).
- Check engine and SDK calls against the docs for the installed version. Never invent an API.

### Code
- No allocations in per-frame code: no new collections, string building, or closures in update loops.
- Cache references at load time. Pool objects that spawn often (projectiles, effects, floating text).
- Gameplay code never queries UI objects directly. Use events or signals between them.
- Numbers that designers tune (speeds, costs, rewards) live in data files, not in code.
- Handle pause, resume, and interruptions (calls, notifications). Respect safe areas and notches.
- Touch targets must be large enough for a thumb (see `indie-studio:mobile-perf-budget`).

### Assets
- Follow the naming and folder rules in `indie-studio:asset-pipeline`. Register every AI-made or
  third-party asset in `studio/ASSET_LEDGER.md`.
- Use compressed textures and atlases; keep audio short and compressed.

### Do not
- Hand-edit scene, prefab, or resource files. Use the editor or an engine tool.
- Add packages, SDKs, or plugins without approval.
- Refactor code unrelated to the task.
- Commit secrets, keystores, or build output. Never ask for or store credentials.
```

## Engine and language additions (fill in, verify with `indie-studio:research`)
- The exact command to build or run tests headlessly, if any.
- The editor-control tool or MCP server in use, and what it is allowed to change.
- Project-specific naming and folder rules that are not in `indie-studio:asset-pipeline`.
- Known gotchas discovered while working (add a line each time an agent repeats a mistake).
