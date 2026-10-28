---
name: kling-4-prompting
description: Write, revise, or troubleshoot English Kling AI video prompts from scene ideas, images, video references, storyboards, and keyframes. Use for Kling 4.0 and Flash mode selection, reference roles, timed direction, dialogue, subtitles, and footage-editing prompts. Prompt authoring does not itself generate videos or execute APIs.
license: Apache-2.0
metadata:
  author: "Adapted from aedev-tools / Michael Nahmias"
  version: "1.1.1"
---

# Kling AI Video Prompting

Turn the user's creative intent into ready-to-paste English video direction. Retain the upstream skill's concise drafting, reference-role separation, and continuity checks, supplemented by the official Kling 4.0 guide. See [sources and version boundaries](references/sources.md).

## Understand the brief and select a mode

Preserve supplied subjects, action order, exact dialogue, content language, duration, framing, and deliberate visual choices. Keep simple scenes simple. Ask only about ambiguities that materially change the result, such as which person to replace or which image is the endpoint. Infer ordinary creative choices and state material assumptions outside the prompt.

For an unspecified Kling model, use this skill's 4.0 scope and briefly disclose the assumption when relevant. Do not silently replace a requested 3.x, O1, or third-party model with 4.0. Check that model's official documentation separately. Drafting a prompt does not require a questionnaire about every interface setting.

- **Omni Reference:** generation from ideas, combined character/product/scene/action/camera/voice references, and targeted edits to existing footage.
- **Keyframes:** images defining required visual states at the beginning, end, or intermediate timeline positions. This entry accepts keyframe images, without additional reference-asset uploads.
- **4.0 Flash:** consider for rapid exploration, but do not apply the full model's duration, resolution, or keyframe features to it.

Omni can also accept textual instructions assigning first- or last-frame roles to images. Do not equate those instructions with the separate Keyframes entry's timeline upload controls or combine both entries' controls in one task.

## Read only the relevant references

- Multiple assets, recreation, or footage edits: [references and editing](references/references-and-editing.md).
- Multiple shots, first/last/middle images, or loops: [shots and keyframes](references/shots-and-keyframes.md).
- Duration, mode, file, or asset limits: [capabilities and input limits](references/capabilities.md).
- Illustrations or a failed prompt: the relevant section of [examples and revisions](references/examples.md).
- Current availability or conflicting documentation: [sources and version boundaries](references/sources.md).

Do not load every reference for an ordinary single-shot request.

## Write the prompt

Write all prompt headings, asset-role descriptions, scene direction, action, camera, lighting, timing, audio instructions, and preservation requirements in English, even when the conversation or brief is in Korean or another language. Translate the user's intended direction faithfully rather than copying non-English instructions into the final prompt.

Begin with the subject, location, visible action, and emotional progression. Add framing, camera behavior, lighting, materials, and sound only where they affect the result. Replace abstract terms such as "premium" or "cinematic" with visible qualities such as side backlighting, a blurred background, and a fine matte surface. Avoid arbitrary lens measurements and decorative adjective lists.

When animating a supplied photo, focus on movement and preservation rather than reinventing its appearance. Distinguish a subject turning in front of a fixed camera from a camera orbiting the subject. Keep continuous takes, cuts, camera movement, and subject movement unambiguous.

For complex requests, use the following progression without empty sections or unnecessary headings:

1. **Asset roles:** the contribution and preserved attributes of each actual upload ID.
2. **Scene:** subject, space, style, light, and composition.
3. **Progression:** ordered actions; timing, camera, transitions, and final state when useful.
4. **Audio and on-screen text:** dialogue, ambience, sound effects, music, and any requested subtitles or signage.

Describe the desired state positively before adding exclusions. If subtitles or background music are unwanted, explicitly exclude each. Preserve requested music or subtitles instead of automatically banning them. Do not append a generic list banning faces, hands, watermarks, or other unrelated features. Use short exclusions when needed to prevent style mixing or unwanted reference carryover, while preserving the user's explicit constraints.

### Dialogue, sound, and exact text

English direction does not mean translating the video's intended speech or visible text into English. Preserve user-specified dialogue, subtitles, signs, product labels, names, and exact copy in their requested language and spelling unless the user requests translation. Place exact dialogue and text in quotation marks, and describe the speaker, language, placement, and behavior in English. For example: The woman says softly in Korean, "아직 기억해?"

Tie each line to its speaker. Add voice tone, pace, emotion, or accent where useful, and allow time for pauses and reactions. If the script cannot fit the duration, explain the conflict and offer a longer clip or a shortened script without silently rewriting the supplied words.

Distinguish ambience, sound effects, music, and complete silence. No dialogue is not the same as silence. Voice profiles reference a speaker's voice; do not describe them as background-music or sound-effect uploads.

For requested subtitles, specify exact text, language, placement, size or readability, display intervals, and speech synchronization. For signs or labels, specify the object, attachment position, spelling, and duration. Text-generation support is not a guarantee of correct spelling or frame-accurate timing.

## Check before returning

- Is all direction in the final prompt English, with non-English text limited to intentional dialogue, exact on-screen copy, or supplied identifiers?
- Can the actions and dialogue fit the requested duration, and do timed intervals cover it?
- Do simultaneous camera instructions or preservation and replacement requirements conflict?
- Does every @ID correspond to supplied media and the actual upload order?
- Do multiple references demand conflicting versions of the same attribute?
- Do identity, product geometry, props, eyelines, screen direction, space, and lighting continue across cuts?
- Are model-specific, entry-specific, total-asset, and shared-video limits satisfied?
- Are coming-soon features and unverified provider options clearly conditional?

For a failed result, revise the instruction most closely related to the failure first and explain why briefly. Exact identity, spelling, timing, and motion require checking the generated output.

## Return the result

When the request can be completed, lead with one English prompt in a fenced text block. Follow with only necessary reference assignments, interface settings, or material assumptions. Distinguish model, duration, resolution, and aspect-ratio settings from creative direction inside the prompt.

The final copyable video prompt must be English regardless of the conversation language. Keep explanations, questions, and settings notes outside the prompt in the user's conversation language. Do not automatically add a translated duplicate. Preserve intentional non-English speech and exact visual copy as described above. Offer alternatives only when requested or when a meaningful creative choice requires them.

If media was not inspected, disclose reliance on the user's description. If upload IDs are unresolved, first consider whether a complete prompt can use ordinary descriptions; otherwise label it as a draft awaiting mapping. Never invent uploads or voice IDs and present them as a runnable prompt.

This skill authors and reviews prompts. Video generation requires a separate request and available tools. Do not claim that examples are generated results, benchmarks, or measured credit savings.
