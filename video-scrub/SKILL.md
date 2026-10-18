---
name: video-scrub
description: Inspect and strip identifying video metadata from local MP4/MOV files, then verify known residues with Node.js and FFmpeg. Use for video metadata removal, privacy cleanup, 메타데이터 삭제 or 영상 익명화. Produces a cleaned video and verification report; does not remove visible or robust watermarks.
license: Apache-2.0
---

# Video metadata cleanup

Create a separate local output containing the first video stream and, if present, the first audio stream. This skill is independent of the other production skills. It does not generate video or upload media.

Requires Node.js 18+ and `ffmpeg` / `ffprobe` on PATH; no npm packages, Python, API key or model cache. Check only these tools for this task. Resolve `scripts/` relative to this skill folder, not the current project. Keep input media, outputs and reports in the user's project, outside the skill folder.

## Inspect before processing

Run the script with `inspect` and use ffprobe to confirm the first video codec:

```text
node "<skill-dir>/scripts/video-scrub.mjs" inspect "<project>/input.mp4" --json
```

Check codec, HDR flag, side data, rotation, all stream types, and known tool marks. The bundled script does not enforce its documented container boundary, so confirm MP4/MOV input and output. For unsupported media, inspection may still be useful; do not promise successful cleanup.

Read [limitations](references/limitations.md) before processing. The normal processing path is SDR H.264 with MP4 output. MOV output may fail verification on a muxer-generated vendor tag; report that failure instead of claiming success. HEVC and other codecs need codec-specific handling outside this imported implementation; do not apply its H.264 SEI filter to them. HDR inspection is supported, but do not use the bundled encode mode for HDR preservation.

Explain material changes when relevant: only the first audio track survives, separate subtitles/data/chapters are dropped, and embedded captions may be lost if SEI is removed. If the user needs those preserved, resolve that conflict before processing. Do not silently trade them for cleanup.

## Choose mode and profile

- `copy` is the default: video is not re-encoded, but SEI may be removed and audio is re-encoded to AAC at 192 kb/s. Do not describe the whole file or audio as lossless.
- `encode` re-encodes video (default libx264, CRF 18, yuv420p) and audio. Use only when requested or needed, and verify the output: a new encoder mark can appear even when none existed in the source.
- For an unspecified metadata-privacy request, explicitly select `--profile bare` to omit the encoder and creation-time tags. The underlying CLI defaults to `obs`, which writes new tool/time metadata.
- Honor an explicitly requested profile. See [profiles](references/profiles.md) for the four profiles. A profile does not establish capture provenance.

Choose a fresh output path distinct from the input and existing files. The upstream command uses `-y` and overwrites an existing output without asking; check the destination before running it. Keep the original intact.

## Process and verify

Use `run` to perform cleanup and verification together:

```text
node "<skill-dir>/scripts/video-scrub.mjs" run "<project>/input.mp4" -o "<project>/clean.mp4" --mode copy --profile bare
```

For inspection or reporting alone, use `inspect` or `verify`. `scrub` alone does not verify. A separate verification must use the same mode/profile as processing:

```text
node "<skill-dir>/scripts/video-scrub.mjs" verify "<project>/input.mp4" "<project>/clean.mp4" --mode copy --profile bare --json
```

Inspect the actual gate results and skipped checks. In the upstream JSON path, failed gates can still leave exit code 0; read JSON `ok` and `failed` rather than treating process success as validation. If any gate fails, keep the result labeled unverified and report the issue; do not retry by discarding HDR/captions or changing the user's requirements.

Report the output path, mode/profile, audio or track changes, failed/skipped gates and applicable limits in the user's language. A passing report means the implemented checks found no prohibited residues; it is not proof of complete anonymity, source untraceability, watermark removal, or unchanged audiovisual content. The checks do not compare decoded pictures/audio or prove synchronization.

## Supporting resources

- [Residue map](references/residue-map.md): upstream explanation of container tags, compressorname, SEI, AAC DSE and handler names. Read when diagnosing residue; its recorded experiments are upstream evidence.
- [Limitations](references/limitations.md): codec/HDR/caption constraints and verification gaps.
- [Sources](references/sources.md): pinned upstream revision, license and local adaptations.
- Retained upstream [English README](README.en.md): command reference; the workflow and qualifications in this entrypoint take precedence.

For maintenance, run `node "<skill-dir>/scripts/selftest.mjs"`. This tests pure functions with synthetic fixtures; real-file FFmpeg checks are separate.
