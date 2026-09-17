# Case: zfilp previs study

Recorded 2026-09-17. This is a case record, not a universal scene specification. Source project on the author's machine: `C:/Projects/Codex/Hypnos/project/zfilp`. The installed skill does not require that project to exist.

## Brief and workflow

The user studied a smartphone advertisement using Blender primitives as the motion/camera reference for AI video. The first experiment covered source 0–9.3 seconds. A later continuation covered 9.3–16.9 seconds through the end card. Model prompt writers were prepared for Seedance, Wan and H3; the user submitted generations manually. Available reviewed outputs included SD, Wan and SD-v2. An H3 generation result was not established.

The case assigned green to one man's hand, yellow to both hands of one woman, blue to an ordinary rigid phone, and red to one foldable in its closed and open states. These colors and product choices belong to this project.

## Evidence status

| Finding | Status and limit | Reusable implication |
|---|---|---|
| The reviewed SD result followed previs closely enough to reproduce an incorrect index shape | Observed in this experiment; no cross-model success rate was measured | Treat action-critical proxy geometry as consequential |
| Hand placement was wrong in early previs: front-covering action appeared as two rear grips, and fingers bent implausibly | User feedback led to scene revisions | Inspect physical side, palm orientation and contact before generation |
| SD-v2 improved the requested index/opening issues after shorter index geometry, hand-free opening and removal of screen dots | User-confirmed improvement after multiple simultaneous changes | Preserve the revised assets; do not claim a single isolated causal effect |
| Front/rear surface confusion remained, including screen/camera mixing | Observed in reviewed output | Make surface roles explicit and investigate sheets, geometry and binding |
| Complex product sheets caused front/rear errors | User hypothesis, not established causally | Test simpler front/back sheets while recording other changes |
| Fixed sheet wallpaper and simplified foldable3/4 sheets improve output | Adopted design/prompt changes; a confirming generated result was not established here | Track as pending rather than guaranteed repair |
| The source live-action hands have subtle human movement missing from the generated result | User clarification; not a claim that the original Blender code contained noise | Distinguish missing human steadiness from unwanted jitter |
| v07 easing and subtle shared hand/device motion improve the next SD result | Implemented and rendered; downstream effect remained unverified in this record | Keep implementation verification separate from video-model validation |
| v08 continuation previs was acceptable | User approved the render and requested the SD prompt | Previs approval is established; the subsequent SD generation remains pending |

## Approved creative adaptations

The opening hinge shot became autonomous and hand-free because the user chose that simplification. The later closing shot retained a pushing index. Screen flower/dot proxies were removed; final image references later supplied fixed wallpaper. The end card used the project's ordinary phone plus one foldable even though the original advertisement showed two foldables. None of these decisions should silently transfer to another brief.

## Provenance within the source project

- `previs/REVIEW_NOTES.md`: version history, user corrections, scope and adaptations.
- `research/generation_test_01/ANALYSIS.md`: first SD/Wan result comparison.
- `research/generation_test_02/ANALYSIS.md`: SD-v2 findings and follow-up hypotheses.
- `research/continuation/ANALYSIS.md`: remaining source shots and cut times.
- `previs/manifest_v07.json`, `manifest_v08.json`, `validation_v08.json`: motion/export checks and unchanged first-segment verification.
- `scripts/build_previs_v07.py`, `build_previs_continuation.py`, `export_previs_continuation.py`: case-specific implementation, not portable generic scripts.
- `prompts/model_tests_v07/` and `prompts/model_tests_v08/`: exact draft prompts and attachment mappings; only an actual submitted copy establishes the final model input.

Source clips, generated outputs, scene files and comparison frames remain in the project. Append new evidence with its run/version rather than rewriting pending findings into successes without a result.
