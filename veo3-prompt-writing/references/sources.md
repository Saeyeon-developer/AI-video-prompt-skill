# Sources and Adaptations

## Requested source materials

1. Google Cloud, [The ultimate prompting guide for Veo 3.1](https://cloud.google.com/blog/products/ai-machine-learning/ultimate-prompting-guide-for-veo-3-1/), published 2025-10-15; checked 2026-11-03. Used for the five-part scene framework, cinematic direction, soundstage, first/last-frame and ingredients workflows, and timestamp prompting. The article's image-model workflow is an example, not a dependency of this prompt writer. Examples in this package are newly written rather than copied from the article.
2. GoogleCloudPlatform, [genmedia-creative-studio](https://github.com/GoogleCloudPlatform/genmedia-creative-studio), specifically [genmedia-video-editor/SKILL.md at the base revision](https://github.com/GoogleCloudPlatform/genmedia-creative-studio/blob/f693c7075574b2e1c160af338f4ca1d79cf226ca/experiments/mcp-genmedia/skills/genmedia-video-editor/SKILL.md). Base repository commit: `f693c7075574b2e1c160af338f4ca1d79cf226ca`, dated 2026-11-02. Base skill blob: `d4e734937c3004743c273d48399252c59d4f7da2`. The selected upstream directory contains one `SKILL.md`; the full studio application was not imported.

The upstream repository is [Apache-2.0 licensed](https://github.com/GoogleCloudPlatform/genmedia-creative-studio/blob/f693c7075574b2e1c160af338f4ca1d79cf226ca/LICENSE). This adaptation retains that license, bundled at [LICENSE](../LICENSE), with provenance in [NOTICE](../NOTICE). It is a derivative prompt-writing skill, not an official Google distribution. Google Cloud blog material remains under its own terms; linking it does not relicense the article.

## Additional official checks

These sources resolve operational ambiguity in the two requested materials. They do not add an API-execution workflow. All were checked on 2026-11-03. Google's former Vertex AI documentation URLs now redirect to Gemini Enterprise Agent Platform documentation.

| Official documentation | Used for |
| --- | --- |
| [Video generation prompt guide](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/video/video-gen-prompt-guide) | Separate audio direction; descriptive exclusions in a negative field; camera, focus, and temporal vocabulary |
| [Best practices for generating videos](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/video/best-practice) | Colon-led speech, focused short scenes, and motion-focused image animation |
| [Veo 3.1 model specifications](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/veo/3-1-generate) | Standard/Fast/Lite distinctions, model IDs, duration, output sizes, native sound, asset inputs, and preview status |
| [Generate videos from references](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/video/generate-videos-from-references) | Up to three images of a single subject; reference duration and actual REST attachment/negative field names |
| [Extend videos](https://docs.cloud.google.com/gemini-enterprise-agent-platform/models/video/extend-videos) | Input clip constraints and fixed added segment, distinct from ordinary generation duration |

The cited documentation pages identify their prose as CC BY 4.0 except where otherwise noted, with code samples under Apache-2.0. This package summarizes and adapts guidance; it does not bundle those pages or their media. Original examples and library workflow choices are not Google test results.

## Conflicts and chosen interpretation

- **Speech punctuation:** The supplied blog and upstream skill quote speech. The newer best-practice page advises a colon without quotation marks to reduce accidental text rendering. This writer uses the latter by default, preserving the words and requested language. Neither convention guarantees correct audio or absent captions.
- **Negative instructions:** The blog illustrates exclusions inside scene prose; the prompt guide recommends descriptive unwanted elements rather than "no/don't" in a separate negative field. Keep that field separate when available; ordinary prose can still state a necessary constraint. The upstream `negative_prompt` spelling is not the REST `negativePrompt` spelling.
- **Ingredients scope:** The blog illustrates multiple characters and a setting; the current reference guide describes one subject with up to three images. Asset support is not proof of a dedicated style-reference mode. Do not assume the broad creative recipe is accepted by every interface.
- **Resolution and tier:** The older blog lists 720p/1080p; the current model page lists 4K for standard, with lower limits for Fast/Lite. Some task samples retain preview-only 4K wording. Confirm mode-specific availability rather than combining the most generous claims.
- **Modality summaries:** Lite's model-page summary marks image input unsupported while its capabilities row includes image-to-video and first/last frames. General video-input summaries also differ from the separate extension workflow. Use task-specific documentation and the actual interface to resolve these cases; do not infer general video editing or motion-reference support.
- **Availability:** The blog contains both GA and preview language. Use the current model page and actual interface for launch status. Do not extrapolate these Cloud specifications to consumer apps or other providers.
- **Object edits:** The blog explicitly attributes its object insertion/removal feature to Veo 2 without audio. It is not evidence of a Veo 3.1 footage-editing mode.

## Changes from the upstream skill

`SKILL.md` has been substantially rewritten and renamed to `veo3-prompt-writing`. The adaptation retains the Veo scene framework, sound direction, exclusions, and mode distinctions, then adds progressive references, input-role checks, continuity, original examples, scoped settings, and revision guidance. It removes the upstream tool allowlist, generation execution, Google Cloud setup assumptions, overlay/GIF/concatenation/audio-mixing workflows, and automatic tier recommendation.

English prompt direction, preservation of intentional non-English speech and visual copy, separate operator settings, project-local artifacts, and no generation authorization from prompt writing are library conventions. They are not claims of a Google requirement or measured language advantage. Prompts and timestamps are directions, not guarantees of identity, typography, timing, physical accuracy, or generated quality.
