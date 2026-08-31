# Wan 3.0 writing guide

Use this reference when a request needs more than the entrypoint's basic workflow.

## Source priority

The Wan 3.0 prompt guide is authoritative. The older Wan 2.2 system prompt contributes only durable writing heuristics such as intent preservation, motion expansion, and camera consistency. Do not carry forward its version-specific defaults, language limits, or content-replacement rules.

## Mode formulas

### Text-to-video

Use this order as a reasoning checklist, not a rigid sentence template:

1. **Entity:** Identity, count, defining appearance, wardrobe or material, posture.
2. **Scene:** Foreground, environment, spatial relation, time and weather when relevant.
3. **Motion:** Main action, direction, amplitude, speed, sequence, interaction, and result.
4. **Aesthetic control:** Light source and quality, shot size, angle, lens, composition, camera movement, tone.
5. **Stylization:** One coherent medium, genre, rendering treatment, or photographic language.

The final prompt should read as a unified shot description, not a labeled form, unless the user asks for a structured breakdown.

### Image-to-video

Assume the image already defines entity, scene, composition, and style. Include only enough visual anchoring to disambiguate motion. A strong I2V prompt normally specifies:

- the subject's first motion, continuation, and end state;
- secondary motion already plausible in the image, such as hair, cloth, foliage, water, smoke, reflections, or background traffic;
- camera behavior, including `fixed camera` when no movement is wanted;
- preservation constraints that matter, such as stable identity, unchanged background geometry, or no new objects.

Do not invent a new subject, wardrobe, scene, or major prop. Do not spend most of the prompt repeating visible details.

### First and last frames

Name the subject that persists across both frames and describe the most plausible continuous path from the first state to the last. Keep changes causally ordered. If the frames imply a major scene cut rather than a continuous transition, state that one generation may not reliably bridge them and offer separate clip prompts.

### Reference-guided generation

Use reference identifiers exactly as supplied by the interface or user. Bind the identifier to a stable noun every time ambiguity is possible, for example, `the red robot in Image 1`. Images and videos may have separate numbering; never renumber them from memory.

## Motion design

Prefer a short causal chain over a verb list:

`initial state -> initiating movement -> visible reaction/effect -> readable end state`

Useful motion controls include direction, trajectory, speed, acceleration, force, repetition, amplitude, and interaction with surfaces or nearby elements. Select only the controls that affect the shot. For subtle scenes, micro-actions such as breathing, gaze shifts, finger movement, cloth response, or changing reflections can carry the clip without forcing an unrelated large action.

Keep action density proportional to clip duration. A short clip should usually contain one main beat and at most one secondary reaction.

## Camera and aesthetics

Choose camera behavior for narrative function:

- **Push-in:** intimacy, attention, realization, or tension.
- **Pull-out:** reveal scale, context, isolation, or surprise.
- **Tracking/follow:** travel alongside the subject and preserve motion readability.
- **Lateral move or pan:** reveal comparison or guide attention across space.
- **Orbit:** present the subject as central or heroic; keep the arc under 45 degrees for spatial stability.
- **Fixed camera:** emphasize stillness, performance, transformation, or precise object motion.

Use one dominant shot size and angle. Add a lens only when its effect matters: long-focus for compression and separation, wide-angle for spatial depth, fisheye for deliberate distortion, tilt-shift for miniature appearance. Avoid incompatible combinations and duplicate labels.

Lighting descriptions work best when they identify a plausible source and one or two consequences, such as `soft daylight through a north-facing window, gentle side light and low contrast`. Do not dump every lighting keyword into the prompt.

## Dialogue and sound

Add audio only when the user requests it or the target generation path supports it. Separate the sound plan mentally into:

- **Voice:** exact line, speaker, emotion, tone, pace, timbre, accent/language.
- **Sound effects:** source, action, material, timing, and ambient context.
- **Background music:** style, energy, instrumentation, and temporal change.

For multiple speakers:

1. Assign unique, stable visual labels.
2. Anchor each line to that character's visible action first.
3. Give distinct voice qualities.
4. Use explicit temporal connectors such as `then`, `immediately after`, or `after a pause`.

Keep spoken lines short. The model may reproduce dialogue content, but exact word-level lip synchronization is not reliable. Use `No dialogue` or `No background music` only when the target interface recognizes those controls or the user explicitly wants them.

## Prompt repair rules

Repair weak inputs without changing their premise:

- **Too vague:** Add a plausible setting, motion path, camera plan, and restrained aesthetic choices that fit the request.
- **Too static:** Convert state into observable change; add micro-motion before inventing a new major action.
- **Too long:** Preserve required beats and remove adjective stacks, redundant static details, and secondary actions.
- **Conflicting camera terms:** Keep the term most important to the stated intention and remove the rest.
- **Several locations in one short clip:** Split into separate prompts unless supported multi-shot output was explicitly requested.
- **Exact text on screen:** Describe approximate signage or reserve exact typography for postproduction.
- **Named real person:** Replace the name with non-identifying visual traits and role while preserving scene function.
- **Exact lip sync:** Keep the spoken line concise and recommend a dedicated lip-sync or postproduction stage only if precision is essential.

## Final quality gate

Before answering, confirm that another reader can identify, in one pass: who or what is present, where it is, what visibly happens, how the camera observes it, and what visual treatment governs the shot. For I2V, the answer should instead emphasize what changes from the supplied frame and what must remain stable.
