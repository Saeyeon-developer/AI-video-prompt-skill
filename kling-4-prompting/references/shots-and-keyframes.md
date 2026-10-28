# Shots and Keyframes

Retains the upstream skill's timing and continuity checks, supplemented by official guide sections 2.1 and 3.2. See [sources](sources.md) for conflicting examples in the guide.

## Mode and timing

Omni Reference combines assets to guide appearance, action, camera movement, and other attributes. Images can also be assigned first- or last-frame roles in the prompt. Keyframes is a separate entry that places image states at particular timeline positions. Distinguish a reference for a desired look from a required visual state at a specified time.

If a request combines exact intermediate frames with video-motion references, do not claim both entries' upload controls can be combined. Check the actual interface or propose a suitable alternative: describe the motion in words for Keyframes, accept less precise timing in Omni, or split the work into separate tasks. Do not silently discard an important requirement.

## Multiple shots

Define each shot's start/end time, framing, action, camera behavior, and transition. Cover the total duration without accidental gaps or overlaps. Carry identity, product geometry, props, screen direction, eyelines, space, and lighting across cuts.

Keep continuous takes continuous. State the moment of a cut into a new viewpoint. Subject movement, camera reframing, and editing are distinct instructions. Compress long production processes with explicit editorial time jumps when appropriate instead of implying the entire real process physically occurs in a few seconds.

Example: a 12-second coffee advertisement.

~~~text
A small coffee stand in the morning. The same blue ceramic cup and wooden counter continue across every shot. Warm sunlight enters from frame-left.
0–4 seconds: A fixed overhead close-up shows coffee beans falling from a paper bag onto the counter.
4–8 seconds: Cut to a side close-up. A hand pours coffee into the same blue cup; steam rises into the light.
8–12 seconds: Cut wider. The customer lifts the cup, revealing the morning landscape behind it. Hold a settled final composition.
Audio: beans tapping wood, coffee pouring, and a distant bird. No background music or subtitles.
~~~

## Image states and transitions

Connect each actual supplied image to a time and role once the mapping is confirmed. First, last, and middle images are required states rather than mood boards. If an image is missing, identify it as an asset to prepare, not an existing upload.

- First frame: begin from @Image1 and describe what moves next.
- First and last frames: design the movement, action, or transformation from @Image1 to @Image2.
- Last frame only: establish @Image1 as the endpoint and describe how the preceding sequence reaches it.
- Middle frames: assign each image a time and state, with action and camera direction leading to the next state.

Keyframes accepts up to 10 images. After upload, the aspect ratio follows the first keyframe; resolve conflicts with the intended output ratio or cropping. If the provider lacks timestamp controls, distinguish timing written in a prompt from precise timeline controls.

Illustrative confirmed mapping: @Image1 is a closed gift box and @Image2 is the open box. This eight-second example uses Omni Reference's textual first/last-frame roles. In the Keyframes entry, place the two images with its timeline controls instead and write the prompt for the motion between those states, using only the image labels that interface actually shows.

~~~text
Use @Image1 as the first frame and @Image2 as the last frame. Show the same gift box on the same table in a fixed composition slightly above eye level. One continuous shot.
0–2 seconds: Hands enter from both sides and grasp the two corners of the lid.
2–6 seconds: The hands slowly lift the lid and place it behind the box. The box itself remains resting on the table.
6–8 seconds: The hands leave the frame. The open box reaches the final composition of @Image2 and holds briefly.
Audio: paper friction and a soft tap as the lid touches the table. No background music or subtitles.
~~~

Consider physical distance, speed, occlusion, contact, weight, and settling time. Even this example requires compatible lid, hand, and background states in the actual images. Matching endpoints alone do not guarantee a seamless loop: motion direction, velocity, and lighting must also join. Frame-accurate validation happens after generation.
