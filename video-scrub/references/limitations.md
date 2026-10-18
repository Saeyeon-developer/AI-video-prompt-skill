# Supported workflow and verification limits

These qualifications apply to the imported implementation and take precedence over stronger claims in the retained upstream documentation and CLI messages. They are reusable usage constraints, not a record of local test results.

## Containers, codecs and SEI

The documented input/output containers are MP4 and MOV. The CLI does not explicitly enforce their extensions or probe formats.

MOV output can contain a muxer-generated stream tag such as `vendor_id=FFMP`. If the source carries the same value, the tag-residue gate may flag it, although it is a generic tool marker. Prefer MP4 output when the user has no container requirement; report any MOV failure without treating all matching values as harmless.

The default cleanup path is SDR H.264. The implementation searches the whole file for known ASCII tool strings; it does not parse those hits into SEI, DSE or MP4 box boundaries. SEI removal is selected from the source's x264/x265 marks and HDR heuristic.

When selected, the script uses `filter_units=remove_types=6`. That removes all H.264 SEI, not only an encoder's user-data payload. Embedded CEA-608/708 captions and other useful SEI can be removed. The script has no selective caption-preserving cleanup.

HEVC SEI uses NAL types 39/40, not 6. Although the script recognizes the string `x265` and accepts encoder options, its removal plan is not codec-aware. Do not assume HEVC, AV1, ProRes or other codec cleanup is supported just because the container opens.

The SEI plan is computed before encoding. If the source has no detected encoder identity, encode mode can introduce a new x264 identity without selecting the removal filter. Verify every output rather than assuming encode mode is more complete.

See [FFmpeg filter_units documentation](https://ffmpeg.org/ffmpeg-bitstream-filters.html#filter_005funits) for codec-specific unit types and SEI side effects.

## HDR and rotation

The source HDR heuristic includes HDR transfer functions, BT.2020 primaries and selected 10/12-bit pixel formats. It can classify SDR high-bit-depth material conservatively.

HDR causes the script to retain SEI even when it contains an encoder mark; verification may then fail. It is not a promise that every HDR-related payload or container field is preserved.

Encode mode forces `yuv420p` and does not implement a complete HDR-preserving pipeline. Do not use it to promise HDR fidelity. Copy mode preserves display rotation data and skips its rotation gate; encode mode relies on FFmpeg's rotation behavior.

## Tracks, picture and sound

Only the first video and first audio streams are selected. Additional audio, separate subtitles, chapters, attachments, timecode and telemetry streams are excluded. No-audio input is supported.

Both modes re-encode audio to AAC at 192 kb/s. Copy mode avoids video recompression but can modify the bitstream by removing SEI; it does not produce an identical file.

Neither mode reliably removes robust pixel watermarks. The workflow does not redact faces, voices, visible addresses, logos, burned-in text or other identifying audiovisual content.

## Meaning of verification

The twelve gates inspect known source strings, tags, location/device keys, timestamps, rotation, stream layout, chapters, known tool strings, selected profile fields, duration and decoding.

- Byte matching uses UTF-8 strings from probed tags/chapter titles, excluding generic values and strings shorter than five bytes. It is not an exhaustive parser for unknown, binary or differently encoded identifiers.
- Tool detection uses a finite mark list. The OBS profile exempts matching tool strings; a passing result is profile-dependent.
- The stream gate permits no audio even if the source had audio. The profile gate does not check every audio handler/time field. Duration tolerance is 0.5 seconds.
- The decode check invokes FFmpeg and catches a nonzero exit status; it does not evaluate all emitted error text. It is not a guarantee of error-free playback.
- The checks do not establish picture equality, audio quality, synchronization or the retention of every frame.
- The JSON verification path returns before setting the failure exit code. Consumers must inspect JSON `ok` / `failed`, including with `run --json`.
- Whole-file `readFileSync` scanning uses memory proportional to file size; long or very large media may need a streaming implementation.

A passing result means the implemented checks found no prohibited residue under the selected settings. It does not establish that no source metadata or identifying information can remain.
