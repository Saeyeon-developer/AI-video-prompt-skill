@AGENTS.md

## Claude Code notes

- Skills are discovered from `.claude/skills/` (project) or `~/.claude/skills/` (personal), one sibling folder per skill. See the README's Claude Code section for installation. Invoke with `/<skill-name>` or let the description trigger it.
- Claude Code can read images (frames, contact sheets, still references) but cannot play video or listen to audio. For video work, extract frames with the analyzer's scripts and read them; treat audio as unverified unless a transcription runtime produced a draft.
- `agents/openai.yaml` in each skill is Codex metadata. Claude Code ignores it; leave it in place so the same folders keep working in Codex.
