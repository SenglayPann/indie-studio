---
name: roles
description: The ten studio roles ("hats") a solo developer covers - Producer, Designer, Engineer, Artist and UI/UX, Level Designer, Audio, QA, Monetization, Release Engineer, Marketer - each with a mindset, deliverables, phase-appropriate quality bar, and a split between what AI does and what the human must do. Use when a stage calls for a role, when the user says "act as", "switch to", or "who should do this", or when you need the standards for a specific kind of work.
argument-hint: "[role name]"
---

# Studio roles

A one-person studio still needs ten kinds of expertise. This skill holds one file per role. Put on only
the hats the current stage needs (at most three in one session; see the stage table in
[phases-and-stages.md](../director/references/phases-and-stages.md)). Communication rules:
[communication.md](../director/references/communication.md).

## Role files
| Hat | File | Focus | Main stages |
|---|---|---|---|
| Producer | [producer.md](references/roles/producer.md) | Scope, schedule, risk, gates | All (standing supervisor) |
| Designer | [designer.md](references/roles/designer.md) | Core loop, rules, progression, GDD | Idea to Pre-Alpha |
| Engineer | [engineer.md](references/roles/engineer.md) | Code, architecture, builds | Prototype to Live Ops |
| Artist and UI/UX | [artist.md](references/roles/artist.md) | Style, sprites or models, animation, UI | Vertical Slice to Beta |
| Level Designer | [level-designer.md](references/roles/level-designer.md) | Levels, pacing, difficulty curve, `docs/LEVELS.md` | GDD to Live Ops |
| Audio | [audio.md](references/roles/audio.md) | Sound effects, music, mixing | Vertical Slice to Beta |
| QA | [qa.md](references/roles/qa.md) | Testing, bugs, devices, performance | Prototype to Live Ops |
| Monetization | [monetization.md](references/roles/monetization.md) | Ads, purchases, economy, analytics, consent | Conception, then Pre-Alpha to Live Ops |
| Release Engineer | [release-engineer.md](references/roles/release-engineer.md) | Builds, signing, stores, compliance | Alpha to Launch |
| Marketer | [marketer.md](references/roles/marketer.md) | Market check, store listing, community | Idea, Beta to Live Ops |

## How to wear a hat
1. Read the role file (only the ones needed now; they cost context). When `experience` is `experienced`,
   skip its "Beginner traps" section unless one of them is happening right now.
2. Say in one line which hat is on and what it will focus on. Update `hats` in STUDIO_STATE.md.
3. Work to that role's quality bar **for the current phase**. Prototype-stage engineering is deliberately
   messy; Beta-stage engineering is not. Do not apply late-phase standards early.
4. Follow the "AI does / Human does" split. The human keeps the final call on taste, spending, and publishing.
5. When done, note the hand-off (what the next hat needs) and take the hat off.

## Rules for every hat
- Stay inside the stage's "Off-limits right now" list. A hat does not license out-of-phase work.
- New ideas go through `indie-studio:scope-guard`. Facts that can go stale go through `indie-studio:research`.
  Money questions go through `indie-studio:monetization`.
- Delegating to other agents or tools follows `indie-studio:ai-delegation`.
- Every deliverable is a file or a commit, not just chat text.
- Guest hats join for one task, then leave. Do not accumulate hats.
