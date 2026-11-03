---
name: veo3-prompt-writing
description: Write, revise, or troubleshoot Google Veo video prompts, scoped to Veo 3.1. Use for text-to-video, image animation, first/last frames, ingredient or subject references, video continuation, cinematic direction, dialogue, sound, and timed shots. Produces copyable prompts and settings notes; does not generate or edit media or operate Google Cloud.
license: Apache-2.0
---

# Veo Video Prompt Writing

Turn a scene brief or supplied media into a ready-to-paste Veo prompt. Adapted and substantially rewritten from Google Cloud's `genmedia-video-editor` generation guidance; see [sources and adaptations](references/sources.md). This skill keeps prompt authoring independent of the upstream MCP servers and FFmpeg workflows.

## Establish the brief and mode

Preserve the user's subjects, action order, exact speech, visible copy, format, and deliberate creative choices. Ask only when a missing decision changes the deliverable, such as whether an image is an opening frame or an appearance reference. Infer ordinary creative details without requiring a settings questionnaire.

For an unspecified Veo version, assume Veo 3.1 and disclose that assumption briefly outside the prompt. Preserve an explicitly chosen version or tier. This skill's capability notes do not establish support in Veo 2, other Veo versions, Flow, the Gemini app, or a third-party wrapper.

Select the input role before writing:

| Available input / intended control | Prompt mode |
| --- | --- |
| Scene idea without an image | Text-to-video |
| Image that must be the opening composition | Image-to-video; describe how it moves |
| Images that define the opening and ending | First and last frame; describe the connecting action and camera path |
| Images that define a subject's appearance | Reference / ingredients; map actual images to their intended role |
| Existing clip whose ending must continue | Extension; describe what happens next |

Do not treat reference images as mandatory opening frames, or an ordinary reference clip as a supported motion-control upload. A previs can inform written movement or selected keyframes without being a Veo video input. Extension is distinct from editing an arbitrary section of existing footage.

## Load only what this request needs

- Supplied images, first/last frames, ingredients, or extension: [modes and reference roles](references/modes-and-references.md).
- A requested duration, tier, resolution, asset count, or unsupported combination: [capabilities and settings](references/capabilities.md).
- A prompt example, timed sequence, or failed result: the relevant section of [examples and revisions](references/examples.md).
- Source attribution, changing availability, or conflicting advice: [sources and adaptations](references/sources.md).

Simple text prompts need no SDK, API key, Python, FFmpeg, or separate Gemini call. Inspect supplied media only through available capabilities; if it was not inspected, say the draft relies on the user's description.

## Direct the scene

Use Google's five-part framework as a drafting aid: **cinematography + subject + action + context + style and ambiance**. Write natural English, rather than five empty labeled fields. An image already supplies much of this information; do not rebuild its appearance in an animation prompt.

Specify a readable composition and the visible action that matters. Add light, texture, focus, and atmosphere where they change the image. Describe observable properties instead of stacking praise words such as "stunning" and "masterpiece."

Distinguish camera movement from subject movement: an orbit changes viewpoint; a subject rotation changes the subject's orientation. State the starting framing, movement, and ending framing when they matter. Keep simultaneous camera instructions physically compatible. If a reveal depends on an occluder, eyeline, object contact, or prop ownership, make that relationship explicit.

Prefer one coherent event for a short clip. When the user needs several shots, choose a feasible timed sequence or separate clip prompts, preserving their requested format. Do not force cuts into a continuous take. For timing, use `[00:00-00:02]` style intervals as direction, not an API field or a guarantee of exact cuts. Match the selected clip length and leave time for action completion, speech, and reactions. A longer sequence may need several generations; do not disguise it as a longer supported single clip.

Across clips, carry the same subject identifiers, product state, wardrobe, lighting, screen direction, and sound intent. An approved ad analysis or previs brief supplies intent; convert its internal IDs and source timestamps into target-scene direction. Do not copy source timings onto a rewritten script automatically.

## Direct speech and sound

Write prompt direction in English regardless of the conversation language. Keep spoken dialogue, lyrics, signs, subtitles, labels, and other rendered copy in the language in which they must be heard or seen. Preserve supplied wording verbatim unless rewriting or translation was requested.

Identify the speaker, language, delivery, and whether speech is on camera or voiceover. Put audio in separate sentences or lines so speech, ambience, effects, and music are distinguishable. Tie a crucial effect to the visible event, such as a click when a latch closes. Sound-effect labels are prose direction, not executable tags.

For speech, use a clear speaker clause followed by a colon, for example:

```text
The woman looks toward the doorway and says softly in Korean: 이제 가자.
Ambient sound: steady rain beyond the open window.
```

The supplied blog and upstream skill use quotation marks; newer Google best practices recommend colon-led speech without quotation marks to reduce accidental rendered text. Follow the colon form by default; preserve the actual words. Quotation marks remain useful for exact visible copy. See the source notes when adapting an established working format.

Do not translate a Korean line into English because the surrounding direction is English. Do not equate "no dialogue" with complete silence. Preserve requested music or captions, and explicitly distinguish speech from visible subtitles. When subtitles are unwanted, say so where relevant instead of silently stripping requested visual copy.

If fixed dialogue cannot plausibly fit the requested duration, explain the conflict and provide a feasible clip split or proposed shortened alternative. Do not silently delete words or claim that excessive speaking speed solves the conflict. Generated pronunciation, voice continuity, lip sync, and exact text still require result review.

## Use exclusions and settings deliberately

Describe the desired image positively first. If the interface exposes a negative-prompt field, return only relevant excluded elements in a separate block, using descriptive terms such as `subtitles, title cards` rather than commands such as "don't add subtitles." Do not append a stock list that excludes the scene's intended movement, people, or style.

Keep model/tier, duration, resolution, aspect ratio, and actual attachment mapping outside the creative prompt. The upstream `negative_prompt` name belongs to its tool/SDK context; REST uses `negativePrompt`. An interface without that field needs plain-language constraints instead. Do not invent request JSON, service parameters, upload IDs, `@Image` syntax, or reference bindings for a prompt-only task.

Check [capabilities](references/capabilities.md) when a setting or mode combination affects feasibility. A broad marketing guide is not proof that every tier or interface offers every control.

## Return and review

Lead with the English prompt in a fenced text block. Add only necessary settings, reference assignments, negative-prompt text, and material assumptions outside it, in the user's conversation language. For separate clips, provide one clearly identified prompt per clip and the continuity handoff. Do not add a translated duplicate of the prompt direction.

Before returning, check that:

- Input roles match the intended mode, and all named files actually exist or are supplied.
- Camera, subject motion, action order, final state, and reference preservation agree.
- Speech and actions fit the proposed length; timed intervals do not overshoot it.
- The prompt keeps exact intended speech and visible copy in their content language.
- Chosen tier and interface support the requested inputs and settings, or the uncertainty is stated.

For troubleshooting, compare the submitted prompt, settings, attachments, and observed output. Revise the instruction linked to the failure first; see [examples and revisions](references/examples.md). Distinguish a proposed fix from an observed improvement.

This skill writes prompts. It does not upload assets, run generation jobs, edit videos, install the upstream servers, or publish results. If those actions are separately requested, use an available execution workflow within that authorization. Keep project media and result records in the user's project, outside the skill package.
