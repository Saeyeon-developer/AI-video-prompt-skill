# AI Video Production Skills

[한국어](README.ko.md)

A library of agent skills for AI video production. It covers ad reference analysis, Blender previs, prompt writing for several video models, and supporting still-image work. The skills are plain Markdown instructions plus a few helper scripts. They work with Claude Code, Codex and other agents that can read files.

The skills **write prompts and plans; they do not call any generation API**. You submit prompts to Seedance, MiniMax, Wan or GPT Image yourself, or through a separate tool you choose.

## For AI agents reading this repository

1. Read [AGENTS.md](AGENTS.md). It explains how to select and load skills.
2. This repository holds **seven separate skills**, not one. Each entrypoint is `<skill>/SKILL.md`.
3. If the right skill is unclear or the task spans stages, start with [ai-video-production](ai-video-production/SKILL.md). The [skill catalog](ai-video-production/references/skill-catalog.md) is the source of truth for routing.
4. Load only the selected skill and the references it links to for the current step.

## Skills

| Skill | Output | Use it for | Instruction language |
|---|---|---|---|
| [ai-video-production](ai-video-production/SKILL.md) | Routing decision and production brief | Choosing skills and carrying context across analysis, previs, image and prompt stages | English |
| [video-ad-analyzer](video-ad-analyzer/SKILL.md) | Analysis timeline/JSON, creative plan, Seedance prompt | Analyzing viral ads, Reels, Shorts or UGC by cut, action and dialogue, and adapting them to a new product or script. Optional local WhisperX transcription | Mostly Korean |
| [blender-previs-to-video](blender-previs-to-video/SKILL.md) | Blender primitive previs, reference clip, comparison notes | Controlling camera, motion, contact and timing with a previs reference, then diagnosing generated results | English |
| [sd25-pe](sd25-pe/SKILL.md) | **Video** prompt: Seedance 2.5 | Scene, reference, keyframe, blockout, edit and extension prompts. Final prompts are always in English | English |
| [h3-prompt-writing](h3-prompt-writing/SKILL.md) | **Video** prompt: MiniMax H3 | Text, first/last frame and full image/video/audio reference prompts with H3 fields and tags | English |
| [wan3-prompt-writing](wan3-prompt-writing/SKILL.md) | **Video** prompt: Wan 3.0 | Text-to-video, image-to-video, reference, sound and multi-shot prompts | English |
| [gpt-image-25](gpt-image-25/SKILL.md) | **Still image** prompt and settings: GPT Image 2.5 | Product sheets, backgrounds, keyframes, reference compositing and edits. **Not a video skill** | Mostly Korean |

Agents can apply skills whose instructions are written in Korean to requests in any language.

### How the skills fit together

1. **Analyze** a reference ad with `video-ad-analyzer`, or **block out** camera and motion with `blender-previs-to-video`.
2. **Prepare still assets** (product sheets, backgrounds, keyframes) with `gpt-image-25` when the video model needs appearance references.
3. **Write the video prompt** with the chosen model's skill: `sd25-pe`, `h3-prompt-writing` or `wan3-prompt-writing`.
4. **Submit** the prompt and references yourself.
5. **Review** the result against the previs or reference with `blender-previs-to-video`, then fix the previs, asset or prompt that caused the problem.

Every stage is optional. A simple model-specific prompt request goes straight to that model's skill. Previs and analysis can proceed before a model is chosen.

## Getting started

### Option A: use the repository as a workspace

Clone the repository and open it in your agent. Claude Code loads `CLAUDE.md`, which imports `AGENTS.md`. Codex reads `AGENTS.md` directly. Then ask for the task:

```text
Read AGENTS.md, then analyze the cuts and dialogue of the attached ad.
Write a Seedance 2.5 prompt for this scene using my previs clip as the motion reference.
```

When working from a different folder, point the agent to the actual path: `Read <path-to-clone>/AGENTS.md and ...`.

### Option B: install as skills

Install each skill folder **as a sibling**, with its `references/`, `scripts/`, `assets/` and `agents/` folders intact. Copying only `SKILL.md` breaks it, and so does nesting the whole repository as one skill. A link (junction or symlink) keeps installed skills in sync with your clone; a copy does not update.

**Claude Code** discovers skills in `~/.claude/skills/` (personal) or `<project>/.claude/skills/` (project). Invoke a skill with `/<skill-name>` or let the agent select it from its description.

Windows (PowerShell, junctions):

```powershell
$repo = 'C:/path/to/video-skill'
$dest = Join-Path $HOME '.claude/skills'
New-Item -ItemType Directory -Force $dest | Out-Null
foreach ($s in 'ai-video-production','video-ad-analyzer','blender-previs-to-video','sd25-pe','h3-prompt-writing','wan3-prompt-writing','gpt-image-25') {
  New-Item -ItemType Junction -Path (Join-Path $dest $s) -Target (Join-Path $repo $s)
}
```

macOS / Linux (symlinks):

```bash
repo=/path/to/video-skill
dest="$HOME/.claude/skills"
mkdir -p "$dest"
for s in ai-video-production video-ad-analyzer blender-previs-to-video sd25-pe h3-prompt-writing wan3-prompt-writing gpt-image-25; do
  ln -s "$repo/$s" "$dest/$s"
done
```

**Codex** discovers skills in `<project>/.agents/skills/` or `~/.agents/skills/` ([skill discovery docs](https://learn.chatgpt.com/docs/build-skills)). Use the same loops with that destination. Each skill's `agents/openai.yaml` is Codex UI metadata; other hosts ignore it.

**Other hosts:** follow the host's skill registration method, or give the agent the path to the relevant `SKILL.md`.

You can install a subset. The router alone does not include the other skills' capabilities. For ad analysis, install `video-ad-analyzer`; to get final Seedance prompts as well, also install `sd25-pe`.

## Requirements by task

Nothing is installed automatically. Prepare only what the task needs.

| Task | Requirement |
|---|---|
| Routing and prompt writing | An agent that reads Markdown. No SDK, API key or Python. Interpreting reference media depends on the host's image/video viewing ability |
| Frame, contact sheet and audio extraction | Python 3.11+, `ffmpeg` and `ffprobe` on `PATH`, and a font for labels (pass `--font` if auto-detection fails). See [local observation](video-ad-analyzer/references/local-observation.md) |
| Analysis JSON and image settings checks | Python 3.11+ standard library |
| Local transcription and alignment (optional) | A separate Python 3.11 environment with WhisperX and a model cache. The bundled setup script targets Windows with an NVIDIA GPU and needs `uv`. See the [speech runtime guide](video-ad-analyzer/references/speech-transcription.md) |
| Blender previs (optional) | Blender and a way for the agent to run or control it, plus video encoding tools for the requested output |

Agents that can read images but cannot play video (including Claude Code) analyze video through extracted frames. Treat audio as unverified unless a transcription produced a draft.

Check the local tools from the repository root. These commands only print versions and help:

```bash
python --version
ffmpeg -version
ffprobe -version
python video-ad-analyzer/scripts/extract_evidence.py --help
python video-ad-analyzer/scripts/check_analysis.py --help
python video-ad-analyzer/scripts/transcribe_video.py --help
```

To reuse an existing WhisperX environment, run `transcribe_video.py` with that environment's Python and pass `--cache-dir`. Run the setup script only when you need a new one. By default it installs to a per-user location outside the skill folders (`%LOCALAPPDATA%/video-skill/whisperx` on Windows); pass `-RuntimeRoot` to choose another.

## Repository layout

```text
AGENTS.md                 agent instructions (CLAUDE.md imports it)
README.md                 this guide; README.ko.md is the Korean version
<skill>/SKILL.md          skill entrypoint
<skill>/references/       guidance loaded only when a step needs it; sources.md records provenance
<skill>/scripts/          helper scripts (analyzer and image settings check)
<skill>/agents/           Codex UI metadata
```

Not included: generation SDKs, API keys, model weights, Python environments and project media. Keep your videos, `.blend` files, transcripts and outputs in your own project. Keep runtimes and model caches outside the skill folders.

## Contributing

- Add or change a skill: update the [skill catalog](ai-video-production/references/skill-catalog.md) first (identifier, entrypoint, output medium, trigger, deliverable, overlap), then the table above.
- Keep model-specific syntax inside its own skill.
- Contribute reusable methods, not project logs. Do not commit personal paths, private project or client names, hardware details or user feedback records.
- Report a finding with the model, version, date and inputs used, and say whether the result was observed or is a hypothesis.

## Sources and disclaimer

Each model skill's `references/sources.md` separates vendor material from this library's own writing conventions. These skills are not official vendor distributions and do not guarantee generation quality. Model capabilities and limits change, so verify them against current vendor documentation before relying on a hard limit.

## License

Licensed under the [Apache License 2.0](LICENSE). Vendor guides and third-party material cited in `references/sources.md` remain under their own terms.
