# Examples and Revisions

These are original authoring examples, not generated results or measured performance findings. File names describe hypothetical supplied inputs. In actual work, map real files and avoid claiming they were inspected when they were not.

## Text-to-video with Korean speech

Brief: An eight-second vertical scene in a late-night repair shop. A technician says the supplied Korean line; rain is audible, with no music or captions.

```text
Medium close-up at counter height in a small bicycle repair shop after dark. A technician in a canvas apron finishes tightening a brass bell on a bicycle handlebar, tests it once, and smiles toward the customer just beside the camera. Warm light from a bench lamp falls across the metal tools; rain streaks the storefront window behind her. The camera makes a gentle push toward her face as she looks up.
The technician says warmly in Korean: 이제 다시 달릴 수 있어요.
Sound effects: one clear bell ring as she tests the bell. Ambient sound: rain against the window and faint workshop room tone. No background music. No subtitles or title cards.
```

Settings: Veo 3.1; text-to-video; 8 seconds; 9:16. If a negative field is exposed, `subtitles, title cards` can be supplied there instead of repeating caption exclusions throughout the prompt. Exact Korean speech is preserved.

## Image-to-video without appearance reinvention

Input: A supplied opening image of a ceramic teapot beside a window. Requested: a gentle steam animation with a fixed camera.

```text
The camera remains locked to the opening composition. A thin plume of steam rises from the spout, curls gently toward the window, and disperses. The teapot and its handle remain still. A soft shadow from leaves outside drifts across the tabletop. Ambient sound: quiet room tone and a distant bird outside the window.
```

Attachment: the supplied photo is the start image. The prompt does not invent a new teapot, rotate it, or request an orbit that contradicts the fixed viewpoint.

## First and last frame

Inputs: `lamp-start.png` shows a closed desk lamp from front left; `lamp-end.png` shows the same lamp from the same angle with its hinged arm opened. Requested: an eight-second mechanical unfolding.

```text
A single continuous locked-off shot connects the supplied opening and ending states. The upper arm pivots slowly upward at the visible hinge, carrying the lamp head with it. The base stays planted on the desk. The hinge movement eases to a stop as the lamp reaches the ending pose, then the light turns on and casts a warm pool on the desk. Sound effects: a restrained hinge creak during the movement and one switch click when the light comes on. Ambient sound: quiet indoor room tone.
```

Map `lamp-start.png` to start and `lamp-end.png` to end. If the actual images use different bases or incompatible hinges, resolve those differences before treating this as a physical interpolation.

## Subject references

Inputs: three views of one backpack, `bag-front.png`, `bag-side.png`, `bag-back.png`. They are subject references, not start/end frames. The selected interface must support this asset-reference mode.

```text
Medium product shot of a single backpack resting upright on a studio plinth. Use the supplied views to preserve the backpack's silhouette, strap attachments, and front-pocket seam layout. The camera travels in a slow quarter-circle from the front toward the side, revealing the pocket depth while the backpack stays fixed. Broad soft side lighting describes the woven surface against a muted gray background. Ambient sound: low studio room tone.
```

Settings: supported subject-reference mode; 8 seconds for the standard model. Map all three images to the same backpack. Do not use Lite for this input requirement or animate a three-panel layout as though it were one start image.

## Extension from the actual endpoint

Source ending: A cyclist has stopped beside a gate, facing screen right. The camera is stationary and wind is audible. Requested: continue as she opens the gate and wheels the bicycle through.

```text
Continue directly from the final pose. Keeping the bicycle beside her, the cyclist reaches forward with her free hand, swings the gate inward, and walks the bicycle through toward screen right. The camera remains stationary as she clears the gate. The wind continues across the join. Sound effects: the gate latch lifts, followed by the light rattle of the bicycle chain as the wheels roll forward.
```

Bind the eligible source clip in extension mode. The described action belongs to the added segment; it does not regenerate the source approach to the gate. Check that the source actually leaves one hand free.

## Requested cuts within eight seconds

Brief: two shots of one locksmith revealing a key; no dialogue.

```text
[00:00-00:04] Close-up of a locksmith's hands lifting one brass key from a dark wooden tray. The key turns between thumb and forefinger until its teeth face camera. Warm side light catches the worn metal. Sound effects: a small metallic scrape as the key leaves the tray.
[00:04-00:08] Cut to a medium shot of the same locksmith in the same workshop, holding that key at chest height and giving a small satisfied nod. The key remains in the same hand. Ambient sound continues: the quiet tick of a wall clock. No dialogue or music.
```

Settings: 8 seconds; requested two-shot sequence. Timestamps express the target pacing; inspect the result for the actual cut and continuity. If exact timing is essential, plan separate clips and a later edit rather than guaranteeing a frame-accurate generation.

## Focused revisions

| Observed failure | First authoring change to try |
| --- | --- |
| Dialogue appears as visible text | Use colon-led speaker direction, distinguish spoken audio from visible copy, and exclude subtitles/title cards only when unwanted |
| The product rotates when an orbit was intended | Keep the product fixed and describe the camera's start/end viewpoints; remove competing rotation language |
| An opening photo becomes a different scene | Remove redundant appearance rewriting; keep motion direction and only necessary preservation requirements |
| A collage animates as multiple panels | Confirm it was bound as an opening image; propose a single-view start image or a supported subject-reference workflow |
| Speech is cut off | Compare line length, delivery, pauses, and clip duration; split or propose a shorter line without silently changing fixed words |
| A subject changes between shots | Check actual attachment roles and repeat a compact identity description; simplify incompatible views and confirm the interface supports the chosen reference inputs |
| Extension repeats the original scene | Replace the source recap with immediate continuation from the observed ending and carry motion/audio over the join |
| A timed sequence omits an action | Reduce simultaneous tasks, lengthen the relevant beat within supported limits, or split the sequence into separate clips |

Check changed output before claiming success. A prompt revision cannot by itself prove an API setting, fix an incompatible reference, or guarantee exact geometry, timing, or typography.
