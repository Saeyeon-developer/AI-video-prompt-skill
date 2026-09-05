# Sources and adaptations

Reviewed against user-supplied `Base-sd25/Sd25.md` on 2026-09-05. The original 92,672-byte local `sd25-pe/SKILL.md` was also reviewed as the implementation being audited. The guide links to the [Seedance skill distribution](https://arkdocs.tos-cn-beijing.volces.com/skills/) and [prompt templates](https://bytedance.larkoffice.com/docx/OsiUdR1OxoDqvnxsK8LczYx7nPd); those links are provenance pointers, not additional fetched sources or installation requirements.

| Source section | Implementation |
| --- | --- |
| 任务使用说明 / 有锁定 / 无锁定 | Task routing and strict versus semantic frame roles |
| 素材输入建议 | Hard asset limits separated from quality recommendations |
| 基础写作 / 时间戳 | Subject/event descriptions and optional shot numbers or timestamps |
| 参考类（多素材映射） | Explicit binding, adopted attributes, concise precise references |
| 白模参考/渲染 / 多宫格分镜 / 关键帧参考 | Blockout, grid, and frame guidance |
| 视频音频编辑 | Translation can include requested lip adaptation |
| 视频延长 | Explicit before/after source boundaries |

Local conventions, not claimed vendor syntax: bracketed output sections, unused-asset lists, coarse/fine blockout categories, and the optional sentence distinguishing regeneration from editing. Aliases are preserved or proposed explicitly; no hidden upload mapping is claimed.

Corrections to the original implementation: removed the 0.3-second difference as an automatic task-rerouting threshold; separated API boundary roles from reference_image; allowed useful newly designed timestamps; preserved hard user timing; allowed requested dialogue creation and lip adaptation; removed mandatory subtitle exclusions and redundant full-object inventories. One asset can contribute multiple assigned dimensions, and user-requested identical subjects are not forbidden.

Input limits describe the supplied snapshot and should not be assumed universal across providers. Runtime instructions are fully local; `Base-sd25` is not required after installation.

[OpenAI model guidance](https://developers.openai.com/api/docs/guides/latest-model) informs concise, intent-preserving instructions; [Build skills](https://learn.chatgpt.com/docs/build-skills) informs progressive disclosure. Neither establishes Seedance capabilities.

This is a community adaptation, not an official ByteDance release. The supplied source does not establish redistribution terms; the maintainer supplies release licensing separately.
