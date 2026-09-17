---
name: ai-video-production
description: Route AI video production work to the right skill for Blender previs, Seedance 2.5, MiniMax H3, Wan 3.0, or supporting GPT Image 2.5 still images. Use for multi-stage production, reference planning, or choosing among these skills; go directly to the named model skill for a simple model-specific prompt request.
---

# AI Video Production

Identify the requested deliverable and current stage, then use the smallest relevant set of skills from the [skill catalog](references/skill-catalog.md). Complete the authorized stage; a routing decision is not the deliverable.

## Select by task and output medium

1. **Previs or motion control:** Use the catalog's Blender workflow for reference analysis, primitive blocking, camera/action control, render review, and comparison with generated video. If the request is analysis-only, deliver the analysis without assuming scene creation is authorized.
2. **Video prompt:** Use the explicitly selected video model's writer. Keep its reference identifiers, field order, prompt language rules and output format. A shared brief can feed several requested model writers, but their final prompts remain separate.
3. **Still-image assets:** Use the image writer only when the user needs an image prompt or image work, such as a product sheet, background, keyframe or edit. A still image for a video project is still an image deliverable. Image-to-video prompting goes to the selected video model writer.
4. **Generation or submission:** Prompt skills supply instructions, not a generation service. Use a separate available execution capability only when the user's request includes that action. Preserve an established manual-submission workflow.
5. **Feedback:** Compare the reference, actual submitted inputs and result. Distinguish geometry/contact, motion/timing, identity/surfaces and appearance. Route a confirmed cause to the affected previs, image asset or prompt, then verify the changed part.

Use the user's model choice and prior decisions. If no model has been chosen, continue independent reference analysis, asset planning or previs work. Ask for a model only when a model-specific deliverable depends on that choice; do not silently choose one or force every project through Blender.

## Carry context between stages

Maintain a compact brief containing the output medium, subjects and object identities, reference roles, required action and outcome, shot boundaries, product states, sound/text requirements, file versions and approved deviations. Use this brief instead of reopening the whole conversation or loading unrelated model guides.

For reference-driven video, distinguish what the reference controls: composition, camera, motion, timing, anatomy, identity, product design, surfaces, wallpaper, style or sound. Resolve contradictions by preserving the user's current intent and stating any material assumption. An appearance sheet must not accidentally become a multi-object layout instruction.

Keep output settings and platform attachment mapping outside the copyable prompt unless the selected writer's format requires otherwise. An `@` alias in plain text is not proof that a platform attachment is bound; native subject tags and actual attachment chips have different roles.

## Scope and library boundaries

- The catalog lists the active skills. All `Base*` directories are authoring source archives; do not select, install or execute them as production skills, even if they contain `SKILL.md`.
- Read references progressively. Do not copy the source archives or every model guide into this router.
- Do not create images, render Blender scenes, run paid generations or publish content solely because a later production stage may need them.
- This router uses the catalog's sibling skills when present. If copied alone, locate the named installed skill through the host's available skill list; if missing, report the missing capability rather than inventing its model syntax. A generic draft may still be delivered when useful and clearly labeled.
- Keep observed results, hypotheses and pending validation separate. An untested prompt or previs is not a successful model test.

Deliver the requested artifact and a concise handoff: the relevant input files, exact prompt if requested, settings or bindings the operator must supply, and any unresolved issue that changes the result.
