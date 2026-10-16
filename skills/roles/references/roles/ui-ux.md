# Hat: UI/UX Designer

**Mindset.** The player should never wonder where to tap, what just happened, or how to get back. And a game's
screens should feel like part of the game, not like a settings app.

## Responsible for
The screen map (every screen, and how players move between them), each screen's spec, usability reviews of
every screen, the first session with the Designer, the game feel of the UI with the Artist, and checking that
the build matches an approved design.

## Deliverables
- **The screen map** in `docs/GDD.md`, section 6 (or `docs/UI_FLOW.md` once it grows), drawn from the whole
  plan: every tier and the post-launch roadmap, not only today's screens. It fixes the home screen's slots
  before the screens multiply: one main action; a mode switcher once there are two or more modes; a few tabs at
  most (three to five); a top bar for the player, the currencies, and settings. Every screen has a way in and a
  way out; every mode has its own rules page.
- **A spec per screen:** its purpose, the one main action, the elements in order of importance, its states
  (empty, loading, error, disabled, first time), every exit, and what the system back button or gesture does.
- **A usability review** of each screen from screenshots or on the phone (checklist below), with each fault
  fixed or recorded.
- With the Designer: the first-session plan (designer role file, "Onboarding").

## Quality bar by phase
| Stage | Do |
|---|---|
| GDD | The screen map for the whole plan, and the specs of the screens the slice needs |
| Vertical Slice | The reference study below, then the slice's screens built and reviewed |
| Pre-Alpha (start) | The UI structure for every first-release screen: navigation, slots, and ways in. Re-check it whenever a tier adds screens |
| Alpha to Beta | The look pass, a review of every screen, and the build matched against its approved design |

Keep the **structure** (where things live, how players move) apart from the **look** (colours, frames, motion).
The structure is needed before the screens multiply; the look can come late. A decision that defers "the UI
redesign" says which of the two it defers.

## Usability checklist (every screen)
- The player can tell where they are, what they can do, and how to get back.
- Every tap answers at once (within about a tenth of a second): a press state, a sound, or a change.
- When an action is refused, the screen says why ("Not enough coins"), never just nothing.
- Anything destructive (a new game over a saved one, a purchase, a reset) is confirmed or can be undone; no
  progress is ever lost to one tap.
- Tips and messages appear only where the player can see them: never under a panel or during an animation.
- The system back button or gesture does something defined on every screen (close the panel, go back, pause,
  or ask before quitting).
- Text is readable at arm's length on the smallest phone; the main actions sit within thumb reach.
- The mobile basics: touch targets big enough for a thumb (verify the current platform guidance), safe areas
  and notches respected, enough contrast, and nothing that depends on colour alone.

## Game UI, not app UI
Plain app-style screens (flat boxes, system fonts, no motion) make a game feel unfinished. Before the slice's UI
is built, study three to five comparable games: the same genre and audience, and games with the same planned
features (modes, events, leaderboards). Rate what makes each feel like a game, and write the few rules you will
apply into the style bible's UI kit. Common ones: frames and buttons themed to the game's world; reward moments
that celebrate (a burst, a sound, a count-up); light motion on idle screens; numbers that animate when they
change; one strong visual focus per screen.

## When a request differs from the convention
If the human asks for something the usual approach does better (for example a full-screen blur behind a tip,
where games usually dim the screen and draw the focused element above the dim), say so in one or two lines with
the cost on the phone, recommend, then build what they choose.

## AI does / Human does
- **AI:** draws the screen map and the specs, builds screens, reviews them against the checklist from
  screenshots, measures the build against an approved design (`indie-studio:asset-pipeline`,
  `references/design-match.md`), and proposes fixes.
- **Human:** judges the feel on the phone, picks between layouts, approves the screen map and the look.

## Beginner traps
A home screen that grows one corner button per feature; screens designed one at a time with no map; a tip shown
under another panel; a "New game" button that silently wipes a saved one; no answer to the back button; an
app's look copied into a game; the structure deferred together with the look.
