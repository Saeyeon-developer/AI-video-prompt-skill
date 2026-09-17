---
name: blender-previs-to-video
description: Analyze reference video and build or revise primitive Blender previs for AI video camera, motion and contact control; compare generated results and prepare a reference handoff. Use for previs-driven video work, not generic Blender modeling or a model-specific prompt-only request.
---

# Blender Previs to AI Video

Turn the requested camera and action design into a reviewable motion reference, or analyze an existing result at the requested stage. Preserve the user's scope, chosen software, clip boundaries, product identities and approved creative deviations. A prompt-only request does not require rebuilding a scene.

## Work from the actual reference

Inspect available source video, existing scene/build scripts, current renders, asset sheets and prior decisions. Record FPS, duration, frame numbering and cut boundaries. Use timed frame extracts to inspect gesture transitions and contact, not just an opening still. State the coverage actually inspected; sparse frames do not establish every intermediate motion.

Separate camera movement from object movement as an implementation hypothesis when a plain background makes the original rig ambiguous. Aim for the observed screen-space composition and timing without claiming to recover the original camera settings. Preserve the requested interval rather than automatically shortening the experiment.

Build a shot table with time interval, camera/framing, active subjects, action, visible product surfaces, contact/occlusion and end state. Use one identity per real person or object; left/right hands of the same person share an identity. Assign clear proxy colors for the current project and document the mapping. Particular colors are not universal rules.

## Build only the needed geometry, but preserve essential structure

Use basic shapes for appearance simplification. Keep action-critical anatomy, rigid-part relationships, contact and silhouettes plausible: a video model may reproduce an incorrect finger or palm rather than repair it. Read [geometry and motion](references/geometry-and-motion.md) when building or revising hands, hinges, grips, occlusion or animation.

Before full rendering, inspect representative start, contact, transition and end frames. Correct disconnected or overstretched fingers, wrong front/back placement, panel intersections and unintended hands. Recheck affected intermediate frames after a structural change. Basic numeric checks may support this review but do not prove anatomical correctness or eliminate all collisions.

Prefer editable scene versions and reproducible build/render steps. Reuse a stable scene when adding shots; preserve approved earlier output where the request is a continuation. Detect local Blender/encoding tools rather than embedding one author's executable paths. Keep source media untouched.

## Hand off and evaluate

Export the requested clean reference clip, editable scene, and a synchronized comparison when useful. Distinguish full-sequence time from a submitted subclip's local time. Confirm exported duration, frame count, dimensions and FPS. Explain material adaptations, such as preserving the user's actual product type when it differs from the source advertisement.

Read [handoff and experiment records](references/handoff-and-experiments.md) for model prompt preparation, attachment mapping or output diagnosis. Use the selected model's available prompt-writing skill for its syntax; if none is available, do not invent required fields. Model choice need not block independent previs work.

The [zfilp case](references/case-zfilp.md) contains the observations behind this workflow. Read it when a matching failure or evidence question arises, not as a mandatory scene template. Do not copy its product colors, hand identities, lavender setting, silent/no-copy treatment or self-opening direction into unrelated projects.

Deliver the completed requested stage, the files needed for review or submission, and any remaining issue that affects use. A previs review does not authorize model submission; preserve an established manual-submission workflow.
