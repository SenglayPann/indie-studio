# Game feel (how the game answers the player)

"Juice" is the answer the game gives to what the player does: a pop, a burst, a sound, a buzz. Added one effect
at a time, it ends up flat in one place and noisy in the next. This file turns it into a recipe that is written
in the style bible, built the same way in every session, and checked before a gate. The human judges the feel on
the phone; the AI proposes samples, builds, and checks. For the engine steps (particles, tweens, camera,
haptics), use the engine vendor's skills when they are installed.

## 1. Start from the game's events
- List the events the rules already report: a piece placed, a match, a hit, a landing, a pickup, a combo, a
  refused move, a level won or lost, a reward. Feedback hangs on these events, never on a check every frame,
  and the rules never wait for it (rules and screens talk through events).
- Every action gets an answer within about a tenth of a second (a starting point). A refused action gets one
  too: a small "no" shake and a soft sound, clearly different from success.
- A thumb hides what it touches. Put the visible answer around the finger or where the eyes go next, and let
  the sound and the haptic answer the tap itself.

## 2. Three strength levels
Sort every event into one of three levels. Each level has one preset bundle of effects; an event takes its
level's preset and changes only the colour, the sprite, or the sound. The game stays in proportion: the biggest
answer is kept for the biggest moment.

| Level | Used for | Motion | Flash | Particles | Sound | Haptic | Hit-stop |
|---|---|---|---|---|---|---|---|
| Small | Frequent events, maybe several a second (tap, place, collect one) | A quick pop, about 10% bigger and back | None | A few, short | Short, soft, pitch varied | The lightest tick, or none | None |
| Medium | A clear success or failure (a match, a hit, a step won) | A pop that overshoots, a small shake | A soft glow on the spot | A burst | Fuller | A light click | None, or a few frames |
| Large | Rare peaks (level won, a big combo, a rare reward) | A short strong shake, a count-up | At most one, screen-wide | A big burst | A sting; the music dips under it | A stronger pattern | About 0.05-0.1 s |

The sizes and times are starting points, tuned on the phone with the human. Hit-stop is a very short freeze of
the action at the moment of impact; it makes a hit feel heavy. Measure motion as a share of the screen's short
side, so it feels the same in portrait, in landscape, and on a tablet. When many events land at once (a
cascade, ten coins), play the strongest answer once and show the rest as a count: one shake, not ten, and a cap
on how many copies of a sound and how many particles play at the same time.

Propose, then let the human pick: build the three presets on the slice's main event, record the running game
with two variants of each, and let the human choose on the phone.

## 3. Rules every effect follows
1. **Exaggerate briefly, then return to rest.** Every effect ends exactly where it started (size, position,
   rotation, colour, game speed). A new effect on the same object resets the old one first; otherwise
   interrupted pops pile up and leave the object bigger.
2. **Ease the motion.** Easing is the speed curve of a movement: overshoot to pop in, slow down to settle.
   Motion at a constant speed looks mechanical.
3. **Never block input.** The player can act while effects play. If the rules need a wait (pieces falling),
   that wait is a rule written in the design and kept short, and a tap during it is queued or visibly refused,
   never silently lost.
4. **Move the picture, not the thing.** Shake moves the camera or a container of the visuals; squash and
   stretch changes the sprite. The object the rules or the physics use keeps its position and collision shape,
   so an effect can never change a result.
5. **Freezes run on the real clock.** Hit-stop and slow motion change the game's speed and set it back with a
   timer that keeps counting while the game is frozen. They never touch the pause state, and the pause menu
   keeps moving during a freeze.
6. **Reuse what spawns often** (particles, floating numbers) from a pool, and play the worst moment (the
   longest cascade) on the lowest target phone (`indie-studio:mobile-perf-budget`).
7. **Haptics go through one helper** that checks the vibration switch. Phones differ widely, and many only
   buzz: keep patterns short, try them on the cheapest target phone, and verify the platform's current haptics
   features with `indie-studio:research`.

## 4. Comfort and safety
- **A "reduce motion and flashing" setting** (the style bible's accessibility basics): shake off, flashes become
  a soft glow, hit-stop and big bursts shortened. The information stays: the sound, a colour change, the count.
  Where the engine can read the phone's own reduce-motion setting, start from it.
- **Flashes can trigger seizures** in people with photosensitive epilepsy. Accessibility guidelines (the WCAG
  "three flashes" rule, for example) limit large bright flashes to about three per second and treat saturated
  red as worse. Check the current guideline and any store rule with `indie-studio:research` before writing a
  limit in the style bible, then count the flashes frame by frame in a recording of the worst moment.
- Shake tires some players and makes others feel sick: keep it short, and never constant.
- No channel is the only signal: a sound has a visible match, and a haptic has a sound or a visual.

## 5. Write it down
The style bible holds the feedback-strength table: the three presets, one row per event (event, level, what
changes), and what each level becomes with reduce-motion on. A new event gets a row before it gets effects.
Every session builds from the table, so the game stays consistent from one session to the next.

## 6. Check it
- **The AI, from the build and recordings:** every event the rules report has a row, and every row is wired (a
  test raises each event and checks that each channel was asked to play); after each preset, and after one
  interrupted halfway, the object is back at rest and the game speed is normal; a tap during the large preset
  is accepted; with reduce-motion on there is no shake and no flash; the flash count of the worst moment stays
  within the researched limit; frame time in the worst moment stays in budget. Screenshots cannot show motion:
  record the running game (frozen captures: [design-match.md](design-match.md), section 5).
- **The human, on the phone with sound:** the small preset still pleases on the hundredth tap, the large one
  feels like a reward, and nothing tires. The AI cannot hear, feel a vibration, or judge motion from frames:
  say so in the hand-over.
- **For the Vertical Slice gate:** the table is filled for the slice's events, the checks above pass, and the
  human's note on the feel is recorded.

## 7. Traps
Effects added one by one until everything shakes; the same big effect on every event, so nothing feels special;
a shake that moves the physics; an object left bigger after an interrupted pop; the next tap ignored until an
animation ends; a hit-stop that also freezes the pause menu; flashes nobody counted; a reduce-motion setting
that also removes the information.
