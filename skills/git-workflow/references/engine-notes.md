# Engine notes for version control

These are starting points. Engine and host recommendations change; verify each with
`indie-studio:research` (official docs for the engine version in use) before committing files that
depend on them, and record what you verified in `studio/KNOWLEDGE.md`.

## Unity
- **Commit:** `Assets/` (including every `.meta` file), `Packages/manifest.json`,
  `Packages/packages-lock.json`, `ProjectSettings/`.
- **Never commit:** `Library/`, `Temp/`, `Obj/`, `Logs/`, `UserSettings/`, `Builds/`, generated
  `*.csproj` / `*.sln`.
- Keep project settings on text serialization ("Force Text") and meta files visible, so scenes and
  prefabs are text and diffable. Verify the current setting names in the docs for your editor version.
- Scenes, prefabs, and ScriptableObjects are text YAML files that merge badly. Prefer one person or one
  branch touching a given scene at a time. Break big scenes into prefabs. Do not hand-edit them.
- Unity ships a merge tool for these files (search "UnityYAMLMerge" / "Smart Merge" in the current docs)
  that can be wired into git. Verify before setting it up.
- Use the installed Unity helper skills when available (project creation, CLI, packages) instead of
  raw file edits.

## Godot
- **Commit:** `project.godot`, scenes (`.tscn`), resources (`.tres`), scripts, and the asset files.
  Check the current docs for whether `*.import` files should be committed for your Godot version.
- **Never commit:** `.godot/` (the imported-asset cache), export credentials, build output.
- Scenes and resources are text and merge reasonably, but hand-editing is still risky. Prefer the editor
  or an engine tool/MCP server.

## Both engines
- Binary assets (images, audio, 3D, video, fonts) belong in Git LFS. Decide this before the first
  binary asset is committed. Check the host's storage and bandwidth limits first, since free tiers are
  small and change.
- Keep generated output out of git: builds, caches, profiler captures, screenshots that are not documentation.
- Do not commit personal editor layouts or local paths.
- Store signing material (Android keystore, iOS certificates) outside the repository and back it up in
  two private places. Never paste it into a chat.

## Repository hygiene checklist
1. `.gitignore` and `.gitattributes` exist and match the engine.
2. `git status` is clean after a fresh clone and a project open (no generated files appear).
3. No file over the size limit outside LFS (`pre-commit` checks this).
4. A fresh clone opens and runs on another machine (test this once around the Vertical Slice gate).
