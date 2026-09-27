---
name: engine-selector
description: Choose or confirm the game engine. Use during Validation or Kickoff when the engine is undecided, when the user asks about Unity, Godot, Unreal, GameMaker or another engine, or proposes switching engines. Weighs the project's needs, the user's AI-assisted workflow, target platforms, monetization tooling, and the agent and skill support available, verifies current facts, recommends, and records the human's decision.
---

# Engine selector

The engine is one of the hardest decisions to reverse. The AI should recommend with evidence and let the
human decide. Communication rules: [communication.md](../director/references/communication.md).

## 1. Gather the inputs
Dimension (2D or 3D), target platforms, the computer the human builds on (it decides how iOS builds are made),
art style, the monetization plan (ads and purchases need mature SDKs),
performance needs, the human's prior experience with any language, whether console or PC releases are
possible later, budget and comfort with license terms, and the tools already set up in the user's Claude
Code (which engine-specific skills, editor bridges, or MCP servers are installed).

## 2. Factors that matter for an AI-assisted solo developer
- **AI reliability:** how much good, current documentation and example code exists for the engine's language and
  APIs. Test it: ask for a small piece of code and check it against the docs.
- **Agent tooling:** are engine-specific skills or editor-control servers available and maintained? (Check the
  installed skills list, and verify anything else with `indie-studio:research`.) A tool that lets the AI drive
  the editor and read its errors makes the self-checking loop possible.
- **Text-based scene files** merge and diff better in git.
- **Automation:** can builds and tests run from the command line, and in CI (`indie-studio:toolchain`)?
- **The human's experience:** an engine they already know well is worth a lot; weigh it honestly against the
  factors above.
- **Build path from the human's computer:** iOS builds must be compiled, signed, and uploaded from macOS. If
  they target iOS without a Mac, does the engine offer its own cloud build service, or a documented path
  through a hosted macOS runner? Verify the current options, limits, and costs.
- **Mobile SDK ecosystem:** ads, purchases, analytics, crash reporting. Mature official SDKs save weeks.
- **Build size and startup cost** of an empty mobile project.
- **License and fees:** terms change; verify the current terms at decision time.
- **Community:** how easy it is to find answers to common problems.

## 3. Starting tendencies (heuristics from the research docs; verify before relying on them)
- Simple 2D games where small builds and fast iteration matter: Godot is a strong candidate.
- Games that need mature ad, purchase, and analytics SDKs, a large asset store, or the deepest agent and skill
  support: Unity is a strong candidate.
- Unreal is rarely the right choice for a novice building a mobile-only game.
These are tendencies, not rules. The right answer depends on the inputs above.

## 4. Verify, then record
Check with `indie-studio:research` and log in `studio/KNOWLEDGE.md` (source and date): the current stable or
long-term-support version; current license and fee terms; mobile export requirements; availability and
maintenance of the ad and purchase SDKs; minimum device support; any known issue affecting the plan; the
empty-project build size.

## 5. Recommend
Present a short plain-language comparison of the two or three realistic options: what each is good at for
THIS project, the main risk of each, and the effect on the plan. Mark one as recommended, with the top two
reasons. Then the human decides.

## 6. Record the decision
Append to `studio/DECISIONS.md` (decision, reasons, alternatives rejected, "revisit if" conditions), set `engine`
in STUDIO_STATE.md, and note which engine-specific skills to use for setup. Extend `.gitignore` and the LFS plan
in the Prototype stage (`indie-studio:git-workflow`).

## 7. Switching engines later
Switching after the Vertical Slice is expensive and usually a mistake. Treat any request to switch as a major
scope change: run `indie-studio:scope-guard`, cost it honestly (everything is rebuilt), and require a gate-level
review with the human's explicit approval.
