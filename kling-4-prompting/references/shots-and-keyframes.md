# Shots and Keyframes

Retains the upstream skill's timing and continuity checks, supplemented by official guide sections 2.1 and 3.2. See [sources](sources.md) for conflicting examples in the guide.

## Mode and timing

Omni Reference combines assets to guide appearance, style, action, and camera movement. Section 2.1 says keyframe-to-video is also available through Omni, but the guide documents the first-, last-, and middle-frame prompt formats only under the Keyframes entry (3.2). It describes that entry as keeping the familiar first-frame and first-and-last-frame Image-to-Video workflow with pixel-level keyframe consistency, and as controlling where key moments fall on the timeline. The two entries cannot be combined in one task. Distinguish a reference for a desired look from a required visual state at a specified time.

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

The Keyframes entry supports first frames, last frames, start-and-last frames, and middle frames at any timeline position: set the required moments as keyframes, then describe the actions and transitions between them. Connect each actual supplied image to a time and role once the mapping is confirmed. First, last, and middle images are required states rather than mood boards. If an image is missing, identify it as an asset to prepare, not an existing upload. The guide's formats:

- First frame: "Use @Image1 as the first frame," then describe what happens next.
- First and last frames: "Use @Image1 as the first frame and @Image2 as the last frame," then describe the process in between.
- Last frame only: "Use @Image1 as the last frame," then describe what happens before it.
- Middle frames: one entry per keyframe in the form `X–Y sec | Keyframe 1: …`, stating what appears at that point and how the camera reaches it.

Keyframes accepts up to 10 images. After upload, the aspect ratio follows the first keyframe; resolve conflicts with the intended output ratio or cropping. The guide says keyframes define the visuals at specific timestamps but does not describe the control that places them or how the entry numbers its images: the format templates use @Image1 and @Image2, while its middle-frame example cites labels such as "Image Node_23". Use the labels the interface actually shows. If timestamps cannot be set in the interface, distinguish timing written in the prompt from precise timeline placement.

Illustrative confirmed mapping: in the Keyframes entry, @Image1 is a closed gift box set as the first frame and @Image2 is the open box set as the last frame. This eight-second example follows the guide's first-and-last-frame format from section 3.2; substitute the labels the interface shows. The guide gives no separate Omni wording for keyframe-to-video, so reusing this format in Omni is an unverified adaptation, and Omni is not described as giving the Keyframes entry's pixel-level keyframe consistency.

~~~text
Use @Image1 as the first frame and @Image2 as the last frame. Show the same gift box on the same table in a fixed composition slightly above eye level. One continuous shot.
0–2 seconds: Hands enter from both sides and grasp the two corners of the lid.
2–6 seconds: The hands slowly lift the lid and place it behind the box. The box itself remains resting on the table.
6–8 seconds: The hands leave the frame. The open box reaches the final composition of @Image2 and holds briefly.
Audio: paper friction and a soft tap as the lid touches the table. No background music or subtitles.
~~~

Consider physical distance, speed, occlusion, contact, weight, and settling time. Even this example requires compatible lid, hand, and background states in the actual images. Matching endpoints alone do not guarantee a seamless loop: motion direction, velocity, and lighting must also join. Frame-accurate validation happens after generation.
