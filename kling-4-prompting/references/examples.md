# Examples and Focused Revisions

Adapted from the upstream skill's concise scene, dialogue, and troubleshooting examples. All prompt direction is English, including when the user briefs in another language. Non-English quoted dialogue and exact visual copy are intentional content exceptions. These are teaching prompts, not generated or benchmarked Kling results. Asset IDs are illustrative unless a real mapping has been confirmed.

## Animate a photo — 5 seconds

Brief: the person in a bus-stop photo notices someone approaching; keep the camera fixed.

~~~text
Use the supplied photo as the first frame. The person looks toward frame-right, then turns their head slightly in that direction. Their shoulders relax and a small smile appears. Preserve the face, hair, clothing, and bus-stop layout from the photo. The camera stays fixed at eye level. A passing bus is audible in the distance. No background music or subtitles.
~~~

## A deliberately short idea

~~~text
A paper boat drifts slowly across a shallow puddle. A fixed camera at water level watches it pass, leaving small ripples behind it.
~~~

A short prompt does not automatically need timeline, equipment, music, or subtitle sections.

## English direction with Korean dialogue — 10 seconds

Brief: preserve Jisu's and Minho's exact Korean lines; no subtitles.

~~~text
A quiet bicycle repair shop after closing. Jisu stands beside a bicycle on a work stand; Minho sits at the wooden bench. Hold one medium two-shot with a fixed camera. Warm light from the desk lamp falls across the tools.
Jisu glances at the bicycle, looks at Minho, and asks softly in Korean, "아직 기억해?" After a brief pause, Minho looks up and replies in Korean, "당연하지." Jisu rests her hand on the saddle and smiles. Keep their positions and clothes consistent.
Audio: distinct natural voices, subtle room tone, and a low desk-fan hum. No background music or subtitles.
~~~

The brief may be Korean, but all directing prose stays English. Do not translate the requested Korean dialogue unless the user asks to change the spoken language.

## Preserve requested music and subtitles — 8 seconds

Brief: a warm tea advertisement, gentle piano, and the exact Korean subtitle "잠깐의 여유" during the final three seconds.

~~~text
A white teacup rests on a wooden table beside a window. Soft morning light enters from the right, illuminating the rim and thin wisps of steam. In one continuous shot, the camera slowly moves closer and holds a composition that includes the cup's handle during the final three seconds.
From 5–8 seconds, display the exact Korean subtitle "잠깐의 여유" at the bottom center, comfortably inside the frame edges. Use one line of readable white lettering with a subtle dark shadow, maintaining a stable size and position.
Audio: gentle piano and subtle room ambience. No dialogue.
~~~

Do not append "No music or subtitles" when either is requested.

## Unsupported settings

Brief: Flash, 30 seconds, 4K, and first-and-last frames.

Explain that these requirements conflict with Flash's documented limits. To preserve 30 seconds, 4K, and first-and-last frames, propose the full 4.0 model after checking the selected interface. To retain Flash, propose redesigning within its documented maximum of 20 seconds and 720p, without silently discarding important timing, quality, or keyframe requirements. A conditional draft is possible, but must not be presented as a supported final configuration.

## Troubleshooting

| Result | First revision to try |
| --- | --- |
| Camera circles the product | Separate a fixed viewpoint from the product's own rotation |
| Photo appearance changes | Remove invented appearance details; specify movement and preserved attributes |
| Extra people appear | Identify the people in the shot and what each one does |
| References blend backgrounds or clothing | Narrow each asset's contribution and specify attribute priority |
| Sequence feels rushed | Offer fewer actions or more time |
| Wrong person speaks | Connect names, screen positions, turn-taking, and exact lines |
| An edit changes the whole room | Narrow the edit and specify the retained spatial layout |
| Music masks dialogue | Specify the sound balance and dialogue priority; exclude unwanted music |
| Text or subtitles are incorrect | Simplify exact copy, placement, and display intervals; suggest finishing in an editor when needed |
| Final direction follows the brief's non-English language | Translate direction into English while preserving intentional quoted speech and exact visual copy |

Change the part most closely related to the failure first. Do not replace the whole prompt with a long prohibition list.
