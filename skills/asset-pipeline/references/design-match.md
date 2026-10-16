# Matching an approved design

When a screen or effect has an approved design (an HTML mockup, a canvas, images from a design tool), "it looks
right" is not a check: small differences add up, and the human ends up finding them one by one. Prove the match
before the human looks.

## 1. Capture both sides the same way
- Render the design at the phone's resolution and pixel density, with the game's own fonts and the design's own
  images. A design kept as a canvas or artifact may store its images apart from its pages: fetch them too, or
  the capture shows broken images.
- Capture the build at the same size, in the same screen state.
- Show them side by side (design left, build right) for every screen, and magnified for every text style,
  icon, and button, not only whole screens.

## 2. Measure, then look
- **Boxes:** position, size, corner radius, border and outline width, shadow offset and blur.
- **Text:** font, size, letter spacing, line height, baseline, colour, and the width of every word (kerning
  faults show there first).
- **Ink:** count the dark and the light pixels of each text and symbol over the same box on both sides. A few
  percent apart is fine; ten percent is visible (renderers draw letters at different weights).
- **Clipping:** render each sprite with a margin, so a blur, glow, or stroke cut off by its own box shows.
- **Anchors:** each piece is placed by its centre or by its edge the same way as in the design.
List every difference as either deliberate (with a decision) or still to fix.

## 3. Usual traps when a browser design meets a game engine
- **Colour:** browsers blend see-through colours in gamma space; an engine project in linear colour space
  lightens them. Convert, or blend the way the design does.
- **Shadows and lips:** a CSS shadow with a spread is a ring drawn around the box, and a "lip" under a button is
  a separate offset shape. Rebuild each piece from the CSS values, not from how the result looks.
- **Blur:** a CSS blur radius is about twice the Gaussian sigma most tools ask for.
- **Outlines:** set text outlines in points at every size; engines scale them differently.
- **Text placement:** line height, baseline, and letter spacing differ between a browser and the engine's text
  renderer: match them by measurement. Measuring tools can be wrong too (a zero-size baseline marker inside a
  flex box lands at its centre), so check a surprising number before "fixing" the build.
- **Moving parts:** check what must stay put when the content moves (scenery must not scroll with the cards).

## 4. The design is the floor, not the ceiling
Matching a design exactly can leave the game flatter than it should be (a gentle pulse that reads as a sticker
on a phone). Improvements beyond the design are welcome when they stay inside existing screens and moments, use
the design's own style, are small, and can be removed. Keep them apart for approval ("Beyond the design" in the
review file, `${CLAUDE_PLUGIN_ROOT}/templates/docs/REVIEW.md`). Anything that adds a system, a screen, saved
data, or a rule goes through `indie-studio:scope-guard`. Once an addition is approved, update the design, so it
stays the one reference.

## 5. Captures for review
A capture made without running the game normally (an editor that is not playing, a batch or headless render)
can freeze everything driven by the game's own clock: idle motion, loops, counters. Before sending the human a
review video, check that something that should move does move between two frames, or record the running game,
and say in the review what the capture cannot show. (In Unity, for example, an editor recording in batch mode
does not run component updates: record in Play Mode, or drive screen motion from one clock the recorder steps.)
