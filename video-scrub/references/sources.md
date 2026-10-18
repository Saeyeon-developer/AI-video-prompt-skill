# Sources and distribution

This skill is adapted from [eternityspring/reelbench-skills](https://github.com/eternityspring/reelbench-skills), directory `skills/video-scrub`.

- Upstream revision: [`0d2743ade386195caeb6d156da2810cdf6e35a03`](https://github.com/eternityspring/reelbench-skills/tree/0d2743ade386195caeb6d156da2810cdf6e35a03/skills/video-scrub).
- Upstream license: Apache-2.0. A copy of the upstream license is included at [../LICENSE](../LICENSE) so the skill can be distributed independently.
- Only video-scrub is included. Other reelbench skills, the installer and demo media are not dependencies or bundled resources.

## Imported material and local adaptations

- `scripts/video-scrub.mjs` is retained unchanged from the pinned revision. It contains the FFmpeg command builder, inspection and verification logic.
- `scripts/selftest.mjs` retains upstream assertions and replaces identifying email/account fixtures with synthetic placeholders. Its header marks that modification.
- `README.md` and `README.en.md` retain upstream content with an integration qualification and demo links redirected to the pinned upstream repository.
- `references/profiles.md` is retained unchanged. `references/residue-map.md` replaces its example address/account identifier with synthetic placeholders and marks the modification.
- `SKILL.md` is adapted for this library: concise discovery metadata, independent runtime requirements, project-local outputs, fresh output paths, explicit profile choice, and qualified verification reporting.
- `references/limitations.md` and `agents/openai.yaml` are local integration guidance and UI metadata.

Descriptions of upstream experiments, timing and assertion counts are upstream claims. Importing the skill does not independently reproduce those experiments or guarantee every codec/container combination.

The limitations document distinguishes implementation constraints from upstream claims. Consult the pinned code and current [FFmpeg documentation](https://ffmpeg.org/ffmpeg-bitstream-filters.html#filter_005funits) when extending codec support. Preserve provenance and mark changes when updating the imported files.
