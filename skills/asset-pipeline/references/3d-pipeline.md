# 3D assets for a mobile game

AI 3D generators (text to model, picture to model) are fast and produce models that are rarely ready for a
phone: too many triangles, big textures, odd scale, and a different look each time. This is the cleanup and
the discipline that turns them into a set.

Budgets and format names are starting points. The truth is what the lowest-end test device shows
(`indie-studio:mobile-perf-budget`), and engine settings change: verify names for your version
(`indie-studio:research`).

## 1. Decide the look before the models
- One shared material or shader for everything (flat, toon, or simply lit), and one lighting setup. Generated
  models arrive with their own textures and materials; overriding them in the engine is what makes a set look
  like a set.
- A small palette, applied as a palette texture or per-material colours, beats per-model textures for a
  stylized game: smaller, faster, and impossible to drift.
- Decide silhouette rules: models must read at phone size, from the game's camera angle, against the
  background. Test that before the style is locked.

## 2. Budgets (starting points for low-end phones; measure and adjust)
| Asset class | Triangles | Texture | Materials |
|---|---|---|---|
| Hero or player character | 3,000-10,000 | one 512-1024 px sheet | 1 |
| Enemy or NPC | 1,000-5,000 | shared sheet | 1 |
| Prop or pickup | 100-1,500 | shared atlas | 1 |
| Environment piece (modular) | 200-2,000 | shared atlas | 1 |
Also watch the whole scene: total triangles on screen, and how many separate draw calls it takes. A model
inside budget is worthless if the scene needs hundreds of draw calls. Measure both on the device.

## 3. Conventions, fixed once in the style bible
- Scale: one unit is one metre (state it), and every model exported at that scale with transforms applied.
- Up and forward axis to match the engine; generated models often arrive rotated.
- Pivot at the base centre for things that stand on the ground, at the visual centre for things that spin.
- One mesh per asset unless the game needs parts; no leftover cameras, lights, or empties in the export.
- Format: glTF/GLB or FBX, whichever the engine imports most cleanly. Keep the editable original in `Source/`.

## 4. Cleaning up a generated model
1. **Reduce**: ask the generator for its low-polygon or remesh option first (cheaper and cleaner than fixing
   it afterwards), then decimate in Blender if needed, checking the silhouette after each step.
2. **Fix the mesh**: normals facing out, no interior faces, no stray geometry, sane UVs.
3. **Textures**: bake down to one sheet per asset or per set; cap the size; drop unused maps (a stylized game
   rarely needs metal or roughness maps).
4. **Orient and scale**: apply the conventions above.
5. **Look at it in the game**, at phone size, on the real device, next to an approved model.
6. Only then add it to the ledger and commit it.

## 5. Rigging and animation
- Automatic rigging works best on human-shaped models in a neutral pose. Anything else is quicker to rig by
  hand or to design around.
- Decide the animation list before generating: idle, move, the core action, hit, win or lose. Each one costs.
- Keep the bone count modest and check deformation at the joints; generated meshes often bend badly.
- Reuse one skeleton across characters where possible, so animations are shared instead of remade.

## 6. When 3D is the wrong answer
A stylized 2D game usually ships faster, runs better on cheap phones, and stays consistent more easily. Choose
3D because the game needs depth, rotation, or physics, not because the tools are impressive. If the Vertical
Slice timing shows each model costing hours of cleanup, that number decides the content plan, or the style
changes (`indie-studio:scope-guard`).
