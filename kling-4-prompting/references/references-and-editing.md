# References and Editing

Extends the upstream skill's reference-role separation and edit-scope guidance. See [capabilities and input limits](capabilities.md) for quotas. Source: official guide section 3.1 and FAQ.

## Assign each asset a role

Inspect accessible media and identify whether it contributes identity, clothing, product geometry, spatial layout, action, camera path, pacing, style, or voice. If inspection is unavailable, rely explicitly on the user's description. Limit the scope so a background reference does not also supply characters and a camera reference does not accidentally supply the product.

In Omni Reference, assets are numbered automatically in upload order, such as @Image1, @Image2, and @Video1. Do not assume chat attachment order matches the Kling interface. The guide's editing examples refer to an element as @Element1 but do not say how elements are numbered; confirm the label the interface shows. The guide shows no prompt label for voice profiles; use only a label the interface provides, and do not invent syntax such as @Voice1. If an asset has an ID but no stated role, the guide warns that the model infers its use, which makes results less predictable.

Once the mapping is confirmed, assign roles in short sentences or a table and include necessary roles inside the copyable English prompt. A mapping outside the prompt alone is insufficient when the model needs those instructions. Resolve conflicting references for the same attribute by identifying which one takes priority.

Illustrative mapping: @Image1 supplies the product, @Image2 supplies the space, and @Video1 supplies camera movement and pacing. The following is a teaching example, not a claim that assets were uploaded.

~~~text
Use @Image1 for the thermos's shape, matte teal surface, and lid design. Use @Image2 for the arrangement of the table and window and the afternoon side lighting. Reference only the camera approach and movement speed of @Video1.
The thermos stands on the table. At the thermos's mid-height, the camera slowly approaches, revealing the fine surface texture, and stops just below the lid. Preserve the thermos and space from their respective image references. Soft wind is audible outside the window. No background music or subtitles.
~~~

## Storyboards and recreation

Specify whether a storyboard image supplies panel order, shot size, camera movement, screen direction, and emotional progression. Request finished video scenes corresponding to the panels, rather than the storyboard page, borders, notes, or sketches themselves. For required images at specific moments, consider [keyframe planning](shots-and-keyframes.md).

Separate what to borrow from what to replace. For example, preserve the reference's cut order, camera behavior, and pacing while replacing the product and location with the supplied images. Check whether the source and target have compatible shot structure and rhythm.

## Targeted edits

Identify the primary footage and start with wording such as "Edit @Video1." The guide warns that "Reference @Video1" may be read as reference-based generation rather than an edit. Distinguish editing existing footage from borrowing its motion to generate a new scene.

- Replacement: identify the person or object and the specific attributes to replace. Use position, clothing, or entrance order to distinguish several people.
- Removal: identify the target and request natural reconstruction of the previously obscured background.
- Addition: specify entrance position, timing, action, and spatial relationship to the existing scene.
- Style: identify whether the change affects the whole scene or only one subject. Describe materials, light, and shape, with a short exclusion when needed to prevent style mixing.

When everything outside the change must stay, add "Keep everything else unchanged," as the guide recommends, and also name the identity, action, background, lighting, camera behavior, and pacing that matter most; the guide's own examples list them after that phrase. Do not preserve the very attribute being replaced. Explain conflicts between the replacement image's pose/crop and the footage.

Illustrative mapping: @Video1 is the footage to edit and @Image1 shows the replacement coat.

~~~text
Edit @Video1. Replace only the walking actor's coat with the olive waxed-cotton coat in @Image1, including its broad collar and brass snaps. Preserve the actor's face, hair, trousers, walking rhythm, and hand positions. Preserve the street layout, lighting, camera path, and clip duration from @Video1. Keep everything else unchanged. The coat creases naturally at the elbows as the actor bends their arms.
~~~

If original audio matters, express the preservation intent without promising bit-identical generated sound. For exact preservation, recommend reattaching the original audio during the final edit.
