---
name: mobile-perf-budget
description: Performance, memory, battery, and build-size budgets for mobile games, and how to measure them on real phones. Use when writing code or assets that affect speed, memory, or size; when setting or auditing texture, audio, or rendering settings; when a game stutters, overheats, or crashes on a phone; and at every milestone (Vertical Slice, First Playable, Alpha, Beta, Gold Master) to run the real-device checks and log them in studio/PERF_LOG.md.
argument-hint: "[milestone or problem]"
---

# Mobile performance budget

Phones throttle when hot, kill apps that use too much memory, and players skip large downloads. A game that
runs well on a developer's PC can be unplayable on a cheap phone. Communication rules:
[communication.md](../director/references/communication.md).

## 1. Pick the test devices (once, at Conception or the Prototype baseline)
- The **lowest-end device you intend to support**. This is the one that matters.
- One mid-range device. Note the OS versions.
- The human must own or borrow at least one low-end phone. An emulator or a high-end phone is not enough.
Record them in `studio/PERF_LOG.md` and in STUDIO_STATE.md.

## 2. Starting budgets (rules of thumb; measure and set your own; verify store limits)
| Area | Starting target | Notes |
|---|---|---|
| Frame rate | 60 fps for action; 30 fps can suit slow puzzle games and saves battery | Choose and record one. Frame time: about 16.7 ms at 60 fps, 33.3 ms at 30 fps |
| Worst frames | No repeated stutters over about 2x the frame time | Watch the worst 1%, not only the average |
| Build size | As small as the game allows; verify current store download and size limits | Big downloads lose installs. Volatile: `indie-studio:research` |
| Cold start | A few seconds on the low-end device | Ad and analytics SDKs add start time |
| Memory | Comfortably below what gets the app killed on the low-end device | Measure the peak; do not guess |
| Heat and battery | Fifteen minutes of play should not make the phone hot | Feel the phone; check battery drop |
| Touch targets | Roughly the size of a thumb pad (platform guidance is about 44-48 points or dp; verify) | Test with a real thumb |
These are starting points. The truth is what the low-end device shows.

## 3. Code rules (also placed in the project's CLAUDE.md)
- No allocations in per-frame code: no new collections, string building, or closures in update loops.
- Cache references at load time; do not search the scene every frame.
- Pool objects that spawn often (projectiles, effects, floating text).
- Decouple UI from gameplay with events or signals.
- Load scenes and big assets asynchronously; do not freeze the game.
- Handle pause, resume, and interruptions; save state when the app goes to the background.

## 4. Asset rules
GPU-compressed textures in the format the devices support (verify for the engine version); atlases for UI and
sprites; texture sizes capped to what appears on screen; short compressed audio with music streamed; only the
font characters needed; strip unused assets. Check the engine's build report for the biggest files
(`indie-studio:asset-pipeline`, section 5).

## 5. Measure (at each milestone, and after any big asset or SDK addition)
1. Make a development build with profiling enabled and install it on the low-end device.
2. Play a scripted five-minute session that covers the heaviest scene.
3. Record: average FPS and worst frames, peak memory, cold start time, build size, and how hot the phone felt.
4. Use the engine's profiler and memory tools (verify the current tool names for your engine version).
5. Add a row to `studio/PERF_LOG.md`, with pass or fail against the budget. Copy the numbers, not impressions.

When to measure: Vertical Slice (the baseline), First Playable, Alpha, Beta, Gold Master.

## 6. If a budget fails
Measure first, then fix the single biggest cost. Typical order: too many separate draw calls (use atlases and
batching); allocation spikes (pooling, caching); oversized textures or audio (compress, cap); too much on
screen at once; expensive effects. Re-measure after each fix. Do not optimize what has not been measured.

## 7. Real-device smoke test
Run the checklist in [qa.md](../roles/references/roles/qa.md) at Beta and before Gold Master, on at least two
devices, one of them low-end. Record failures in the bug list.

## 8. Who does what
The AI analyzes profiler output and proposes fixes, and can write the scripted session. The human runs the build
on the phone, reads the heat and feel, and confirms the numbers.
