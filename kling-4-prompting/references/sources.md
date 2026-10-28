# Sources, Version Boundaries, and Adaptation

## Upstream skill

- Repository: [aedev-tools/kling-4-prompting-skill](https://github.com/aedev-tools/kling-4-prompting-skill).
- Base commit: [f3808475a3293aa5885d53899b1ca99f41f530d7](https://github.com/aedev-tools/kling-4-prompting-skill/commit/f3808475a3293aa5885d53899b1ca99f41f530d7), dated 2026-10-16.
- Original author: Michael Nahmias / aedev-tools. This adaptation is distributed under Apache-2.0 ([LICENSE](../LICENSE)); the upstream MIT copyright and permission notice is retained in [NOTICE](../NOTICE).
- Base files: the upstream SKILL.md and references/examples.md, references/references-and-editing.md, references/shots-and-keyframes.md, and references/sources.md.

Inherited practices include concise treatment of simple requests, preservation of creative intent and exact dialogue, specific roles for each asset, targeted edit scope, shot continuity and timing checks, focused revisions after failures, and a copyable prompt as the primary output.

## Official source

[Kling 4.0 User Guide](https://kling.ai/quickstart/kling-4-model-user-guide), published 2026-10-14. The capability summaries below describe the documented launch specifications, subject to the actual product interface; embedded examples are not generation-test evidence.

| Official section | Used for |
| --- | --- |
| 1.2 Core Capabilities and Specifications | Output boundaries, audio, and token ceiling |
| 2.1 Choose a Creation Mode | Separate Omni and Keyframes entry points |
| 2.2 Write Effective Prompts | Concrete visual descriptions and fewer unnecessary negative instructions |
| 3.1 Omni Reference — Input Limits | Category, combined-asset, and shared-video quotas |
| 3.1 Usage Guide / Prompt Structure | Asset roles, scene, progression, and audio |
| 3.1 Video Editing / Creative Recreation | Primary footage, change targets, and preservation scope |
| 3.1 Audio and Languages / Text Generation | Speaker-linked dialogue, language, voice, subtitles, and visual copy |
| 3.2 Keyframes | First, last, and middle states; image limits; first-keyframe aspect ratio |
| FAQ | Flash boundaries, voice-only audio input, and default audio/storyboard behavior |

## Conflicts inside the guide

- HDR is marked coming soon in the overview but listed in the specifications. Treat current availability as unresolved until confirmed in the actual interface.
- Video extension is marked coming soon. Do not treat the two-minute extension description as a currently supported single-generation duration.
- Section 3.2 says the Keyframes entry does not support reference-asset uploads, yet its first-frame example references @Video1. Section 2.1 also describes keyframe-to-video through Omni. Distinguish textual first/last-image roles from the dedicated Keyframes upload controls; do not infer mixed-entry upload support from one example.
- The guide recommends fewer negative instructions while some examples contain long prohibition lists. Prefer concrete positive direction, retaining necessary exclusions and the user's explicit constraints.
- Some examples have inconsistent cut or map-close-up instructions. Do not copy entire examples as normative rules; resolve camera, cut, and timing conflicts for the actual request.

## Adaptation choices

This derivative adds explicit input-limit tables and over-limit examples, verified upload-ID handling, dialogue and subtitle guidance, English examples, and Codex interface metadata. These are workflow choices, not measured performance findings.

All skill instructions and references are written in English, and the final copyable video prompt uses English direction regardless of the conversation language. Exact dialogue, subtitles, signs, labels, names, and other intentional visual copy retain their requested content language. Explanations outside the prompt may follow the conversation language. The English-output convention is a library convention, not a claim that Kling only accepts English or that English is proven superior.

Do not infer support for other Kling models or third-party providers from this 4.0/Flash guide. For questions about current availability, check the relevant official section and actual interface/provider documentation, distinguish dates, and disclose when only the last-checked specification is available.
