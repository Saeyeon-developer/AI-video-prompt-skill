# Kling 4.0 Capabilities and Input Limits

Summary of sections 1.2, 3.1, 3.2, and the FAQ in the official [Kling 4.0 User Guide](https://kling.ai/quickstart/kling-4-model-user-guide), published 2026-10-14. These are documented launch specifications, not an API schema. Verify changeable options in the selected model, entry point, and provider.

## Output and model boundaries

| Item | Full Kling 4.0 | Flash / caveat |
| --- | --- | --- |
| Duration | 3–30 seconds, 1-second increments, default 10 seconds | FAQ: Flash up to 20 seconds. Do not infer its minimum or default from the full model |
| Resolution | 720p / 1080p / 4K | Flash up to 720p |
| Keyframes | Up to 10, with first, last, and intermediate states | Flash is documented without start-and-last-frame or multiple-keyframe support |
| Omni aspect ratio | 21:9 / 16:9 / 1:1 / 9:16 / Auto; default Auto | Verify provider controls |
| Keyframes aspect ratio | Before images: 21:9 / 16:9 / 1:1 / 9:16. After images: follows the first keyframe | Do not promise an independent ratio selection after upload |
| Prompt length | Up to 8,000 tokens | A ceiling, not a target; tokens are not characters |
| Audio | Two-channel stereo; generated speech, ambience, effects, and music | Audio input is for voice profiles, not music/effects uploads |
| HDR | Table lists 10-bit HDR at 1080p/4K; overview says coming soon | Availability unresolved; check the actual interface |
| Video extension | Repeated extension described up to 2 minutes | Coming soon; do not present as a currently available single 120-second generation |

The guide describes speech and text support for Chinese, English, Japanese, Korean, Spanish, Portuguese, German, French, Hindi, and other variants. Validate language, accent, and spelling in generated output. Audio-visual synchronization and Smart Storyboard are documented as enabled by default; do not invent separate enable switches.

## Omni inputs

| Type | Limit |
| --- | --- |
| Images | Up to 10; at most 30 MB each; aspect ratio 2:5–5:2 |
| Reference videos | Up to 5; 3–30 seconds each; combined duration at most 30 seconds; at most 300 MB each; aspect ratio 2:5–5:2 |
| Voice profiles | Up to 3 per task; source audio 5–30 seconds and at most 50 MB per file |
| Elements | Up to 7, including at most 3 video elements; source footage for creating a video element is 3–8 seconds |
| Combined references | Up to 15 across images, videos, voice profiles, and elements |

**Shared video quota:** reference videos, videos for editing, and video elements share the maximum of 5 clips and 30 seconds combined. Video elements consume both the element allowance and the shared video allowance. Count a video element once toward the combined 15-asset total, while also checking both category restrictions.

Examples: four 8-second reference clips exceed the duration allowance at 32 seconds. Five 5-second clips plus one 3-second video element fit the duration ceiling at 28 seconds but exceed the clip allowance at six. Ten images, three static elements, and three voice profiles satisfy individual category ceilings but exceed the combined allowance at 16 assets.

Editing supports up to five clips including one primary video, with each clip 3–30 seconds and the combined duration at most 30 seconds. Additional reference footage is not exempt from the shared quota. If file sizes or durations are unknown, do not claim they were validated; ask only for the information needed. Do not silently discard or trim assets to make them fit.

## Keyframes inputs

Up to 10 images, at most 30 MB each, aspect ratio 2:5–5:2, and up to 8,000 prompt tokens. These images define timeline states, not extra Omni reference slots. Do not prescribe additional video, element, or voice-reference uploads in this entry.
