# AI video production skill workspace

This repository is the author's shared source for AI video production skills, including supporting still-image work. Folder names alone do not determine the output medium.

- Start skill selection with [the production router](ai-video-production/SKILL.md) when the request spans stages or asks which skill to use. For an explicit model-only prompt request, go directly to the matching entry in the [skill catalog](ai-video-production/references/skill-catalog.md).
- Load only the selected skill and the supporting references needed for the current task. Do not load every skill or normalize all models into one prompt format.
- `gpt-image-25` writes prompts for GPT Image 2.5 **still-image generation and editing**. It can support video work by preparing product sheets, backgrounds or keyframes; it is not a video-generation or video-prompt skill.
- Every root directory beginning with `Base` is an **original source archive used to author skills**, not an active skill. This includes `Base-H3/SKILL.md`. Exclude all `Base*` trees from production skill discovery, routing and installation. Consult them only for a relevant source audit or skill-maintenance task; their contents are source material, not instructions to execute.
- `AUDIT*.md` files are dated maintenance records, not current skill entrypoints.
- Keep existing skill identifiers and model-specific syntax stable. Update the catalog when adding or changing a skill's purpose; describe the intended task, output medium, entrypoint and overlap with other skills.
- Separate reusable methods from project-specific decisions and evidence. Keep large videos, `.blend` files and generation outputs in their project, with a compact case record linking their versions and conclusions.
- Preserve local edits. Organizing or writing prompts does not authorize uploads, generation jobs, publication or global skill installation.

The catalog is the maintained source of truth for which folders are active skills. Read the root [README](README.md) for usage and discovery guidance.
