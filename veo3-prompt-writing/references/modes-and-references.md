# Modes and Reference Roles

Use only the section that matches the current inputs. These are authoring methods; supported settings remain conditional on the exact model and interface in [capabilities](capabilities.md).

## Text-to-video

Describe what must be invented: the focal subject, space, visible action, composition, and look. Establish enough identity to distinguish recurring subjects. A single reveal or interaction usually benefits from an ordered action with a clear outcome more than a large list of events.

Keep a continuous take and a shot sequence distinct. For a montage or dialogue exchange that spans several clips, repeat the stable subject description and link each clip's starting state to the preceding result. Repeated descriptions support continuity without guaranteeing identical faces or voices.

## Image-to-video

Treat the image as the opening visual state. Focus on camera motion, subject animation, and environmental change. Use ordinary terms such as "the subject" unless multiple subjects require disambiguation. Avoid re-describing every color, garment, background, and light source already visible in the input.

State only the preserved attributes that matter to the requested action. For a product reveal, decide whether the camera travels around a fixed product or the product rotates on its base. Do not request both while also requiring an unchanged viewpoint.

Inspect whether a requested reveal can be supported by the image. An unseen product back or hidden mechanism is unspecified; ask for an appropriate reference or disclose that it would be invented. A diagram, grid, or multi-view sheet used as the first frame may animate its layout. When a single product is intended, recommend a suitable single-view opening image rather than assuming the collage will become one object.

## First and last frame

Map two actual files to **start frame** and **end frame** outside the prompt. Check subject identity, object state, orientation, background, and framing for compatibility. If the images conflict, identify the conflict before promising a seamless physical move.

Write the journey between the endpoints: who moves, how the camera travels, what becomes visible, and the end state. A moving camera does not require the subject to turn. Two images alone do not specify intermediate states, an exact mechanical trajectory, or a cut-free transition.

Use a plausible connecting action when requested; use a transformation when the creative intent calls for one. Avoid demanding both rigid product geometry and an incompatible morph. Do not silently reverse the image order to make the transition easier.

Creating missing keyframes is a separate still-image task. The library's still-image writer can help when requested, but this mode does not require generating new assets or using the particular image model featured in Google's blog.

## Ingredients / subject references

An appearance reference is not an opening-frame instruction. List each actual image and the contribution it should make, with any important boundaries. For example, three product views can specify the same product's silhouette, rear connector, and surface finish; they do not call for three products on screen.

Google's blog illustrates character/setting ingredients and consistency across dialogue shots. The current Cloud reference guide describes up to three images of a **single** person, character, or product. Do not assume every interface accepts multiple independent characters, a setting image, or a dedicated style-reference input just because the blog illustrates them. Verify that interface's ingredients controls for such a request; otherwise supply a conditional plan or a supported single-subject alternative.

The model page lists **asset** image support; it does not establish a separate Veo 3.1 style-reference mode. Style can be expressed in the text. Do not label an arbitrary asset upload as a native style parameter, and do not promise that asset images can be combined with first/last frames in one request without checking the actual interface.

When the available image count exceeds the supported allowance, select views by the information needed for the shot or propose separate clips. Do not hide extra uploads in invented aliases. Maintain the chosen reference set and stable appearance wording across related prompts.

## Extension

Read or obtain the source clip's ending: pose, camera direction and speed, prop positions, environment, and the sound already in progress. If the ending cannot be inspected, ask for the relevant description and label assumptions.

Write only the new continuation. Start from that endpoint, carry motion and sound across the join, and specify the next event and desired ending. Do not restart the source scene, repeat its whole story, or describe replacing its middle section as extension.

The Cloud extension workflow documents a fixed added segment; this is not a free-form total-duration setting. Check input eligibility and limits in [capabilities](capabilities.md). A Veo video-generation interface's general video-input label is not proof of arbitrary video-to-video editing or camera/motion reference support.

## Timed shots

Use timestamps only when pacing or cuts need them. For a single continuous take, describe continuous motion and ordered beats instead. For requested cuts, identify the framing and action in each interval and maintain identities, geography, object state, and speaker ownership across cuts.

Intervals describe intended screen time, not guaranteed edit points. Do not time a long line to an interval too short to speak it. Split a sequence into separate feasible clips when necessary, with exact carryover states. The operator still needs to assemble those clips; writing them does not perform an edit.
