---
name: wan3-prompt-writing
description: Turn rough video concepts, shot directions, story beats, or reference images into copy-ready prompts for Wan 3.0 text-to-video or image-to-video generation. Use when the user asks to write, improve, translate, structure, or troubleshoot a Wan 3.0 video prompt; do not use for operating a video-generation service or editing a finished video.
---

# Wan 3.0 Prompt Writing

Convert the user's creative intent into a prompt the model can execute reliably. Preserve the requested subject, action, setting, mood, style, constraints, and continuity. Add only compatible details that resolve underspecification; never replace the concept with a different one.

## Choose the generation mode

- **Text-to-video (T2V):** Build `entity + scene + motion + aesthetic control + stylization`. Use the basic `entity + scene + motion` form when the user wants open-ended exploration or a deliberately simple prompt.
- **Image-to-video (I2V):** Treat the image as the source of appearance, composition, scene, and style. Write mainly `motion + camera movement`; mention visible entities only as anchors for who or what moves. Do not needlessly redescribe the image.
- **First/last-frame animation:** Describe the continuous transformation or movement that plausibly connects the supplied frames. Do not invent cuts between them.
- **Multiple references:** Bind every action and scene to the user's reference labels exactly. Never guess which reference is which.
- **Multi-shot request:** Default to one prompt per continuous clip. Use a timestamped multi-shot prompt only when the user explicitly requests one and the selected Wan 3.0 interface is known to support it.

If the mode is evident from attached media and wording, infer it. Ask one concise question only when the missing mode, duration, or reference mapping would materially change the result.

## Write the prompt

1. Extract hard constraints before embellishing: required subjects, count, identity, action, setting, duration, framing, camera behavior, style, dialogue/audio, and exclusions.
2. Give the clip one clear visual event or compact cause-and-effect beat. Express motion as an observable sequence with direction, speed or intensity, and physical result where useful.
3. Choose a coherent camera plan. One primary move is usually enough. Use `fixed camera` when stillness matters; avoid contradictory moves or piling on cinematic terms.
4. Add only the aesthetic controls that materially shape the shot: shot size, angle, lens, composition, light source/quality, tone, and time of day. Make them mutually compatible.
5. State one consistent visual style when requested or clearly implied. For an underspecified live-action concept, use restrained cinematic realism rather than imposing a conspicuous genre.
6. Put temporal information in execution order. Keep the main action easy to find and avoid long inventories of static detail.
7. Run the checks below, then deliver a copy-ready prompt.

For detailed mode formulas, camera intent, dialogue/audio handling, and prompt repair rules, read [references/wan3-writing-guide.md](references/wan3-writing-guide.md). For representative transformations, read [references/examples.md](references/examples.md) only when examples would help resolve an unusual or ambiguous request.

## Reliability checks

- **Intent:** No requested subject, action, relationship, visual style, or constraint was silently changed.
- **Continuity:** One continuous clip does not contain rapid scene changes, impossible geography, or too many choreographed actions.
- **Motion:** The prompt says what moves, how it moves, and what changes; I2V prompts prioritize dynamics over static restatement.
- **Camera:** Shot size, angle, lens, and movement support the same composition. Limit orbit arcs to under 45 degrees unless the user explicitly accepts distortion risk.
- **Identity:** Keep subject labels unique and consistent. Do not substitute pronouns when multiple speakers or similar subjects could be confused.
- **Model limits:** Avoid naming specific real people, relying on exact rendered text, or promising exact word-level lip sync. When the user's goal depends on one of these, preserve the creative intent with a workable generic description or briefly flag the limitation.
- **Syntax:** Do not invent parameters, negative-prompt syntax, weights, or reference identifiers that the user did not provide and the target interface has not established.

## Output contract

Default to a single heading, `Wan 3.0 prompt`, followed by one fenced text block containing only the final model prompt. Write the model prompt in English for copy-ready consistency unless the user requests another language; preserve quoted dialogue in the requested spoken language.

Add a short `Assumptions` note after the prompt only when a material choice had to be inferred. If the user asks for prompt-only output, return only the prompt. When the user requests alternatives, vary one meaningful dimension per version and label that difference rather than rewriting arbitrarily.
