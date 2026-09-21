# Phases, stages, gates, hats, and off-limits

Position in the project has three levels: **Phase** (big chapter) > **Stage** (step inside the
chapter) > **Cycle** (the current short list of tasks, kept in STUDIO_STATE.md under "Next actions").

## Phase and stage map

| Phase | Stages, in order | Skill that runs it | Ends with gate |
|---|---|---|---|
| Conception | Idea > Validation > Kickoff | `indie-studio:conception` | Conception Exit |
| Pre-Production | Prototype > GDD-lite > Vertical Slice | `indie-studio:preproduction` | Vertical Slice |
| Production | First Playable > Pre-Alpha > Alpha > Beta | `indie-studio:production` | First Playable, Alpha, Beta (one at the end of each of the first three stages), Gold Master (end of Beta) |
| Launch-Live | Launch > Live Ops > Post-Mortem | `indie-studio:launch-live` | none (Post-Mortem closes the project) |

A stage is named for the milestone reached at its start (industry usage): "in Pre-Alpha" means the
First Playable gate has passed and the systems are being built. The stage called First Playable is
the stretch from the Vertical Slice gate until the First Playable gate.

## Gates, `next_gate` values, and bookmarks (git tags)

| Gate | Passed at end of stage | `next_gate` while working toward it | Git tag on `main` |
|---|---|---|---|
| Conception Exit | Kickoff | Conception Exit | `m0-kickoff` |
| Vertical Slice | Vertical Slice | Vertical Slice | `m1-vertical-slice` |
| First Playable | First Playable | First Playable | `m2-first-playable` |
| Alpha (feature freeze) | Pre-Alpha | Alpha | `m3-alpha` |
| Beta (content complete) | Alpha | Beta | `m4-beta` |
| Gold Master | Beta | Gold Master | `v1.0.0` (release candidates: `v1.0.0-rc.N`) |

Checklists for every gate are in `../../gate-review/references/gates.md`.

Values for `next_gate` in STUDIO_STATE.md: the gate names above, or `none` in Launch-Live.

## Hats per stage (at most 3 hats in one session)

"Primary" hats do most of the work in that stage. "Guest" hats join for one task, then leave.
Scope and schedule discipline does not need a hat: `scope-guard` and `gate-review` are always on.

| Stage | Primary hats | Guest hats |
|---|---|---|
| Idea | Designer, Producer | Marketer |
| Validation | Designer, Marketer | Engineer, Producer |
| Kickoff | Producer, Designer | Engineer |
| Prototype | Engineer, Designer | QA (playtests), Producer |
| GDD-lite | Designer, Producer | Engineer |
| Vertical Slice | Engineer, Artist, Level Designer | Audio, QA, Producer (timing math) |
| First Playable | Engineer, Level Designer | Designer, Producer |
| Pre-Alpha | Engineer, Designer, Artist | Audio, Monetization, Producer |
| Alpha | Level Designer, Artist, Audio | Engineer, QA, Producer, Release Engineer |
| Beta | QA, Engineer | Artist, Audio, Release Engineer, Marketer, Producer |
| Launch | Release Engineer, Marketer | QA, Monetization, Producer |
| Live Ops | Engineer, QA | Monetization, Marketer, Producer |
| Post-Mortem | Producer | Designer, Engineer |

Role details: `indie-studio:roles`.

## Off-limits by stage (the "not yet" list)

Write the relevant lines into STUDIO_STATE.md under "Off-limits right now" whenever the stage changes.
If the user asks for something on the list, say it is out of phase, offer to park it in
`studio/PARKING_LOT.md`, and explain when it becomes appropriate.

| Stage | Not yet |
|---|---|
| Idea, Validation, Kickoff | Creating an engine project; writing game code; final art or audio; ad or purchase SDKs; store accounts or paperwork (only note lead times); buying tools or assets |
| Prototype | Ad or purchase SDKs; final art (use grey boxes and placeholders); audio; menus beyond a start button; save systems; frameworks or architecture; anything store-related |
| GDD-lite | Building beyond what is needed to answer open design questions; new systems not in the pitch |
| Vertical Slice | Features outside the slice; mass-producing content before the per-level time is measured |
| First Playable | Polish; T2 and T3 features; live ad or purchase integration |
| Pre-Alpha | T3 features; systems not in the scope tiers (go through scope-guard); store submission |
| Alpha | New features of any kind (feature freeze). Allowed: content, fixes, polish, tuning |
| Beta | New content beyond the plan; risky refactors; new SDKs or packages |
| Launch | Gameplay changes; unrelated features |
| Live Ops | Large features outside the agreed update plan |

## Branch rules by stage (see `indie-studio:git-workflow`)
- Idea to Prototype: `spike/*` allowed and encouraged; messy code is fine there.
- From Vertical Slice on: `feature/*`, `content/*`, `fix/*` off `develop`.
- From the Alpha gate on: no new `feature/*` branches. Only `fix/*`, `content/*`, `polish/*`.
- Beta to release: `release/x.y.z` accepts fixes only.
- After launch: `hotfix/*` from `main`.
