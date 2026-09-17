# Sources and version boundaries

Reviewed against user-supplied snapshots on 2026-09-05:

| Historical authoring source (not distributed) | Scope |
| --- | --- |
| `Base-wan3/Wan3.md` | Model Studio T2V/I2V prompt guide; includes explicit Wan 3.0 multi-shot, sound, and reference sections, plus older-model examples |
| `Base-wan3/system_prompt.py` | Wan 2.2 prompt-rewriting heuristics |
| `Base-wan3/prompt_extend.py` | Wan 2.2 prompt-expander dispatch and runtime code |

The provided guide identifies the [Model Studio documentation index](https://docs.modelstudio.console.alibabacloud.com/llms.txt). Local files are the review evidence; no fresh verification of every vendor endpoint or capability is claimed. Provenance paths are not runtime dependencies.

Apply Wan 3.0-labeled formulas before generic conflicting advice. In particular, the explicit multi-shot formula takes precedence over the generic table saying one clip must contain one continuous shot. Keep the source's under-45-degree orbit advice as a recommendation when an orbit is chosen, not a hard limit. Retain `Image 1`/`Video 1` per-type numbering and documented `No dialogue.` / `No background music.` controls. Do not import Wan 2.6 `character1` syntax or its character count limit, or treat Wan 2.7's `shot_type` note as a universal Wan 3.0 API rule.

From Wan 2.2, retain only intent preservation, motion-focused I2V rewriting, and compatible aesthetic detail. Do not inherit fixed 60–200/100-word budgets, forced English/Chinese, forced daytime or blue sky, or silent replacement of the user's requested content. The Python implementations are reference material, not dependencies to execute; no torch, DashScope, Qwen, or GPU setup is needed.

The final prompt's English default is a local convenience and can be overridden. Exact words are preserved without promising perfect text rendering or word-level lip sync. Examples are illustrative, not model benchmarks.

[OpenAI model guidance](https://developers.openai.com/api/docs/guides/latest-model) and [Build skills](https://learn.chatgpt.com/docs/build-skills) inform the assistant-facing structure, not Wan generation parameters.

This is a community adaptation, not an official Alibaba release. The supplied Python files retain Alibaba Wan Team copyright notices in the source archive; release licensing is for the repository maintainer to establish separately.
