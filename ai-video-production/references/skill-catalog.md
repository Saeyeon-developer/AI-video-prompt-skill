# Active skill catalog

This is the maintained routing index for the `video-skill` workspace. Select by the user's requested output and model, not by the repository name. Paths below resolve within this library; an independently installed router may instead resolve the same skill names from the host's available skills.

| Skill / entrypoint | Category | Use when | Deliverable and boundary |
|---|---|---|---|
| [ai-video-production](../SKILL.md) | Production coordination | The request spans stages or asks which production skill applies | Chooses and coordinates relevant skills; does not impose a model, Blender workflow or automatic generation |
| [blender-previs-to-video](../../blender-previs-to-video/SKILL.md) | Previs and result analysis | Build/revise Blender blocking for video references, analyze shot motion, or diagnose generated-video fidelity | Reference analysis, primitive scene/render, comparison or handoff as requested; calls a model writer only when prompt work is needed |
| [sd25-pe](../../sd25-pe/SKILL.md) | **Video** prompt: Seedance 2.5 | SD/Seedance scene prompts, references, previs, keyframes, editing or extension prompts | Model-specific copyable text and reference roles; no service operation |
| [h3-prompt-writing](../../h3-prompt-writing/SKILL.md) | **Video** prompt: MiniMax H3 | H3 text/keyframe modes or full image/video/audio reference prompts | Mode-specific fields, native subject/media labels and retention relationships; no service operation |
| [wan3-prompt-writing](../../wan3-prompt-writing/SKILL.md) | **Video** prompt: Wan 3.0 | Wan text-to-video, image-to-video, references, sound or multi-shot prompts | Wan prompt and applicable reference identifiers; no service operation |
| [gpt-image-25](../../gpt-image-25/SKILL.md) | **Still image**: GPT Image 2.5 | Image-generation/edit prompts, product sheets, backgrounds, keyframes, visible text or reference image edits | Still-image prompt/settings; actual image work only when requested and supported by available tools. Never a video writer |

`SD` means Seedance only when the conversation establishes that meaning, as in the zfilp study. In another context it may refer to a different model; resolve a material ambiguity rather than silently routing it. `H3` here means MiniMax H3, not every product offered by a similarly named platform.

## Choose only the needed route

| User request | Route |
|---|---|
| “SD로 이 프리비즈를 활용할 프롬프트를 써줘” | `sd25-pe`; inspect relevant motion/reference roles, no automatic Blender rebuild |
| “엄지·검지로 네모를 만드는 다음 장면을 Blender로 만들어줘” | `blender-previs-to-video`; model choice can wait |
| “손이 왜 이렇게 나왔는지 생성 결과를 비교해줘” | `blender-previs-to-video` analysis stage; diagnose before selecting a fix |
| “제품 앞·뒷면만 있는 이미지 시트용 프롬프트” | `gpt-image-25`; still-image task |
| “이 제품 사진으로 Wan 영상을 만들 프롬프트” | `wan3-prompt-writing`; not the still-image writer |
| “H3에서 참조 매핑 후 Subject/Video를 어떻게 쓰지?” | `h3-prompt-writing`, relevant native syntax/reference guide |
| “같은 프리비즈를 SD, H3, Wan용으로 각각 작성해줘” | Shared reference-role brief, then each of the three requested video writers |
| “Base-H3 원문과 현재 스킬을 대조해줘” | Skill maintenance: read the named archive as source material, not as an active skill |
| “모델은 나중에 정하고 우선 프리비즈부터” | Blender workflow; do not block on model selection |

## Source archives and supporting files

All root folders whose names start with `Base` are original authoring materials. Current examples are `Base-H3`, `Base-sd25`, `Base-wan3`, and `Base-gpt-image-25`. They are **not active skills**, regardless of internal filenames. Production routing and installation use only the six active skill directories above. The rule also applies to future `Base*` folders.

`README.md` is the human entrypoint. Root `AGENTS.md` provides workspace instructions. `AUDIT*.md` files record dated maintenance findings. A selected skill's `references/` holds conditional working guidance; `references/sources.md` holds provenance. None of these imply that every file should be loaded for every request.

When adding a skill, update this catalog with its exact identifier, entrypoint, output medium, trigger, deliverable and important overlap. Preserve model-specific syntax in the individual skill; do not maintain a second copy here.
