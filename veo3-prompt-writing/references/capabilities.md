# Capabilities and Settings

Read when the brief depends on a tier, mode, duration, resolution, or input limit. Checked against Google Cloud documentation on 2026-11-03; links and scope are recorded in [sources](sources.md). These are Cloud model specifications, not a universal contract for Flow, Gemini, or wrappers. Recheck the exact interface when availability matters.

## Veo 3.1 Cloud snapshot

| Setting / feature | Standard | Fast | Lite |
| --- | --- | --- | --- |
| Model ID | `veo-3.1-generate-001` | `veo-3.1-fast-generate-001` | `veo-3.1-lite-generate-001` |
| Ordinary generation duration | 4, 6, 8 seconds | 4, 6, 8 seconds | 4, 6, 8 seconds |
| Output resolution listed on model page | 720p, 1080p, 4K | 720p, 1080p | 720p, 1080p |
| Aspect ratios | 16:9, 9:16 | 16:9, 9:16 | 16:9, 9:16 |
| Native sound | Supported | Supported | Supported |
| Asset reference images | Supported | Supported | Not supported |
| Launch stage | GA | GA | Preview |

The standard model's reference-image mode is restricted to 8 seconds. The reference guide's Veo REST example also sets 8 seconds; verify Fast's reference duration in the actual interface instead of assuming its ordinary duration choices apply. First/last-frame and extension controls are listed for the family, but model-page modality summaries and detailed workflows are not fully consistent. Check the task-specific entry before promising a combination.

The upstream skill suggests Lite for quicker exploration. Select a tier by the required feature and the user's choice, rather than making Lite a universal default. Its lack of asset-reference support matters for ingredient-based requests.

## Reference and extension checks

- **Subject references:** The Cloud reference guide describes up to three images of one subject. Distinguish this documented scope from the blog's broader creative ingredients examples.
- **Extension:** The Cloud extension page lists MP4 input, 1–30 seconds, 24 fps, 16:9 or 9:16; the added segment is 7 seconds. It lists 720p, 1080p, and 4K, but the selected tier's output limits still apply. Verify the selected workflow's source-video eligibility; do not promise arbitrary-source editing.
- **Requested combinations:** Do not assume reference images, first/last frames, and extension are additive controls in one request. Check the exact mode's documentation or interface.

The model page lists 4K for standard, while the older blog lists only 720p/1080p and some task samples retain preview-only wording for 4K. Treat 4K as conditional on the selected mode and interface. Do not promise it from the blog alone.

## Separate settings from prose

Only return settings needed for the task. Do not assign arbitrary seeds, sample counts, safety controls, project IDs, regions, or storage locations to a creative prompt request. If a parameter payload is explicitly requested, check its current schema rather than copying an old example.

| Item | Where it belongs |
| --- | --- |
| Composition, action, light, sound, desired end state | Creative prompt |
| Exact spoken or rendered words | Creative prompt, in their intended content language |
| Model/tier, duration, aspect ratio, resolution | Settings notes or the actual interface fields |
| Start/end/subject/source file assignments | Attachment notes and the actual interface bindings |
| Excluded elements | Separate negative field when exposed; otherwise concise prose constraints |

`negative_prompt` appears in the upstream skill and Python/tool contexts; Cloud REST examples use `negativePrompt`. Both name a setting, not a magic word to paste into the main prompt. Use short descriptive exclusions. Never infer attachment binding from an invented `@` label.

The blog's object insertion/removal note explicitly describes Veo 2 without audio. Do not present it as a Veo 3.1 prompt-editing feature. Editing, compositing, GIF conversion, upscaling, and media encoding require their own workflow and authorization.
