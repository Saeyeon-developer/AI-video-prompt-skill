# Wan 3.0 Prompt Writing Skill

Turn rough video ideas into clear, copy-ready prompts that Wan 3.0 can execute more reliably.

Describe the core of a scene in natural language. This skill preserves your intent while organizing the subject, setting, motion, camera, lighting, lens, visual style, and optional audio into a coherent video-generation prompt.

> This repository provides prompt-writing instructions. It does not call the Wan API or generate, edit, or render video.

## Features

| Feature | What it does |
| --- | --- |
| Rough-idea expansion | Develops short or vague concepts into concrete motion and shot direction. |
| Text-to-Video | Builds T2V prompts around `entity + scene + motion + aesthetic control + stylization`. |
| Image-to-Video | Focuses on motion and camera behavior instead of redundantly describing the source image. |
| First/last-frame animation | Designs a continuous, physically plausible transition between supplied frames. |
| Multiple references | Preserves user-provided image and video identifiers and binds each action to the correct reference. |
| Motion design | Expresses direction, speed, intensity, causality, and a readable end state. |
| Camera and aesthetics | Combines shot size, angle, lens, composition, lighting, color, and movement without conflicts. |
| Dialogue and audio | Structures speakers, lines, voice qualities, sound effects, and background music when supported. |
| Prompt repair | Simplifies static, overlong, contradictory, or overloaded video descriptions. |
| Reliability checks | Verifies intent, continuity, identity, motion readability, model limitations, and interface syntax. |

## Quick start

Invoke the skill explicitly in Codex:

```text
$wan3-prompt-writing A tired office worker closes his umbrella and enters a convenience store on a rainy night. Make it an 8-second, lonely cinematic shot.
```

By default, the skill returns a `Wan 3.0 prompt` heading followed by a copy-ready English prompt. Quoted dialogue stays in the requested spoken language. Ask for another language, multiple variants, or prompt-only output when needed.

Codex may also select the skill automatically when the request matches its description. Use `$wan3-prompt-writing` when you want to guarantee explicit invocation.

```text
$wan3-prompt-writing Create a 6-second luxury product shot of a black perfume bottle rotating slowly. Keep the camera fixed. Return only the prompt.
```

## Installation

### Windows PowerShell

```powershell
$skillHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE ".codex" }
New-Item -ItemType Directory -Force -Path (Join-Path $skillHome "skills") | Out-Null
git clone https://github.com/Saeyeon-developer/Wan3.0_prompt_writer.git (Join-Path $skillHome "skills\wan3-prompt-writing")
```

### macOS or Linux

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
git clone https://github.com/Saeyeon-developer/Wan3.0_prompt_writer.git "${CODEX_HOME:-$HOME/.codex}/skills/wan3-prompt-writing"
```

Using `wan3-prompt-writing` as the installation directory keeps the folder name aligned with the skill name. If the skill is already installed, update it with `git pull` from that directory.

## Usage

### 1. Text-to-Video

Use T2V when the scene must be created from scratch. A subject and action are enough to start, but the following details provide more control:

- video duration;
- subject identity and count;
- setting and time of day;
- main action and final state;
- shot size and camera movement;
- lighting, color palette, and visual style;
- dialogue, sound effects, and background music;
- elements that must be preserved or excluded.

```text
$wan3-prompt-writing 10-second T2V. On an empty subway platform at dawn, a woman in a red coat watches a train disappear. The camera slowly pulls back. Use a cold, realistic cinematic look.
```

### 2. Image-to-Video

When an image is attached, it defines the subject, setting, composition, and style. Describe what should change and what must remain stable.

```text
$wan3-prompt-writing Preserve the attached subject's identity, clothing, background, and lighting. A gentle breeze moves the hair and fabric. The subject blinks once, then looks toward the lens as the camera pushes in very slowly.
```

### 3. First and last frames

Describe the intended change between the two frames. The skill prioritizes a continuous transition and does not invent a cut between them.

```text
$wan3-prompt-writing Connect the folded paper flower in the first frame to the fully opened flower in the last frame. Preserve the paper texture. With a fixed camera, the petals unfold slowly from the center outward.
```

### 4. Multiple speakers and audio

Give every speaker a distinct visual identity, action, voice, and place in the speaking order to reduce dialogue attribution errors.

```text
$wan3-prompt-writing A detective and a barista exchange one short line each in a quiet café. The detective speaks in a low, controlled voice. After a pause, the barista answers hesitantly and softly. Include a refrigerator hum and distant traffic, with no background music.
```

### 5. Multi-shot requests

The default is one continuous shot per clip. If the story requires multiple locations or cuts, ask for separate prompts for each clip. Timestamped multi-shot syntax is used only when the selected Wan 3.0 interface is known to support it.

```text
$wan3-prompt-writing Split the following story into three independent 5-second clip prompts. Preserve the same character appearance and clothing in every clip: ...
```

See [references/examples.md](./references/examples.md) for complete prompt transformations.

## Prompt design principles

The skill follows these priorities:

1. Preserve the subjects, relationships, actions, setting, style, and constraints explicitly requested by the user.
2. Give a short clip one readable main event and only the secondary reactions it needs.
3. Express motion as `initial state → initiating movement → visible reaction → readable end state`, not as a list of unrelated verbs.
4. Give camera movement one primary narrative purpose and avoid stacking contradictory cinematography terms.
5. In I2V prompts, prioritize what moves and what remains stable over static visual restatement.
6. Never invent unsupported parameters, weights, negative-prompt syntax, or reference identifiers.

Detailed mode formulas and camera, motion, dialogue, and audio guidance live in [references/wan3-writing-guide.md](./references/wan3-writing-guide.md).

## Model limitations

The skill does not promise reliable results for:

- recreating a specific real person by name;
- exact spelling or long readable text inside the generated image;
- exact word-level lip synchronization;
- rapid location changes inside a short clip;
- long, highly choreographed action sequences.

If exact typography or lip synchronization is essential, use a dedicated post-production step after video generation.

## How it was built

The skill uses two source documents with a deliberate priority order:

- **Wan 3.0 prompt guide:** The authoritative source for current prompt formulas, mode selection, motion, camera and aesthetic control, and documented model limitations.
- **Wan 2.2 system prompt:** A secondary source used only for durable writing heuristics such as preserving user intent, expanding observable motion, prioritizing dynamics in I2V prompts, and maintaining camera consistency.

When the two sources conflict, the Wan 3.0 guide wins. Version-specific Wan 2.2 defaults, fixed language restrictions, and content-replacement rules were intentionally not carried forward.

The package also uses progressive disclosure instead of placing every instruction in one file:

```text
Wan3.0_prompt_writer/
├── SKILL.md                         # Skill routing, core workflow, and output contract
├── agents/
│   └── openai.yaml                  # Codex UI metadata and default invocation
├── references/
│   ├── wan3-writing-guide.md        # Mode formulas, motion, camera, audio, and repair rules
│   └── examples.md                  # Representative input/output transformations
├── .coderabbit.yaml                 # Repository review configuration
└── README.md                        # Usage guide for people and external agents
```

`SKILL.md` contains only the decision rules needed for every invocation. Detailed guidance and examples are loaded only when the request requires them. The completed package passes Codex's official `quick_validate.py` skill-structure validator.

## Using the repository with other AI agents

This repository can also serve as a prompt-writing instruction package for agents other than Codex. Give the agent access to the repository and provide the following integration contract in its system instructions or tool description.

### Agent integration contract

```text
Use this repository as a Wan 3.0 video-prompt writing instruction package.

1. Read SKILL.md completely before writing or revising a Wan 3.0 prompt.
2. Preserve the user's explicit instructions over repository defaults.
3. Read references/wan3-writing-guide.md when the request needs detailed mode,
   motion, camera, dialogue, audio, or prompt-repair guidance.
4. Read references/examples.md only when an example is needed to resolve an
   unusual or ambiguous request. Do not copy example subjects into new prompts.
5. Infer T2V or I2V from the user's input and attachments when clear. Ask only
   when missing mode, duration, or reference mapping materially changes the result.
6. Return a copy-ready Wan 3.0 prompt and disclose only material assumptions.
7. Do not claim that this repository runs Wan, generates video, or guarantees
   interface-specific features that the user has not established.
```

## Repository maintenance

- Change core behavior or the output contract in [SKILL.md](./SKILL.md).
- Keep detailed model-writing rules in one place: [references/wan3-writing-guide.md](./references/wan3-writing-guide.md).
- Add an item to [references/examples.md](./references/examples.md) only when a real use case exposes behavior that the existing rules do not explain.
- Keep the skill name in `SKILL.md` aligned with the `$wan3-prompt-writing` identifier in [agents/openai.yaml](./agents/openai.yaml).
- When CodeRabbit is connected to the repository, non-draft pull requests receive automatic Korean-language reviews with path-specific guidance.

## Scope

This repository covers prompt writing, improvement, translation, structuring, and troubleshooting for Wan 3.0. Operating a generation service, calling an API, and editing or rendering the resulting video require separate tools or workflows.
