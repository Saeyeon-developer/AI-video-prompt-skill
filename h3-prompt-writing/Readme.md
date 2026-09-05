# MiniMax H3 Prompt Writing

MiniMax H3 전용 영상 프롬프트 작성 스킬입니다. 장면 아이디어와 이미지·영상·음성 참조를 H3의 구조화된 시청각 프롬프트로 정리합니다.

Turn scene ideas and image/video/audio references into structured MiniMax H3 audiovisual prompts.

## 기능 / Features

- T2VA: 텍스트에서 장면과 소리 구성 / text-to-video-and-audio.
- I2VA, FL2VA, L2VA: 시작·종료 프레임 정렬 및 동작 연결 / first/last-frame alignment.
- Ref2VA: 인물·장면·동작·음성 참조와 보존 관계 / full-reference bindings and retention.
- 화자 ID, 대사·가사 태그, 컷 타이밍, 환경음·배경음악 구분 / speaker, dialogue, cut, and audio syntax.

## 설치 / Installation

이 폴더 전체를 프로젝트의 `.agents/skills/h3-prompt-writing/`로 복사하세요. 개인 공용 설치 위치는 `~/.agents/skills/h3-prompt-writing/`입니다. 기존에 같은 이름의 스킬이 설치되어 있다면 사용할 사본을 하나로 정리하세요. 이 문서는 설치 방법을 안내하며, 자동 설치를 수행하지 않습니다.

Copy this entire folder into your project's `.agents/skills/h3-prompt-writing/` or your user's `~/.agents/skills/h3-prompt-writing/`. Keep `references/` and `agents/` beside `SKILL.md`. The sibling `Base-*` source archives are not needed. See [official skill discovery documentation](https://learn.chatgpt.com/docs/build-skills). If the skill does not appear, restart Codex.

다른 에이전트에서는 `SKILL.md`를 읽고 작업에 해당하는 참조 문서만 불러오도록 요청하면 됩니다. `agents/openai.yaml`은 Codex UI용 선택 메타데이터입니다.

Other agents can read `SKILL.md` and follow its task-specific reference links. No SDK, API key, Python dependency, or generation connector is needed for text authoring.

## 사용 / Usage

Codex에서 `$h3-prompt-writing`와 장면 설명을 함께 입력하세요. 자연어로 대상 모델을 명시해도 자동 선택될 수 있습니다. 모델명, 핵심 동작, 참조 역할, 필요한 대사·길이·카메라 방향을 알려주면 좋습니다. 단순한 장면에 모든 항목이 필수인 것은 아닙니다.

Invoke `$h3-prompt-writing` with your scene. Include the essential event, reference roles, and any exact dialogue or timing constraints. Media inspection requires your agent's media-reading capabilities; inaccessible references retain their stated roles without invented observations.

```text
$h3-prompt-writing 비 오는 골목에서 종이배가 떠가는 6초 장면. 고정 카메라, 대사와 음악 없음.

$h3-prompt-writing Picture 1은 접힌 우산, Picture 2는 펼쳐진 우산입니다. 8초 FL2VA, 한 샷으로 연결하세요.

$h3-prompt-writing Use Picture 1 for character appearance and Audio 1 only for voice timbre. The character says “안녕하세요.” No music.
```

## 출력 / Output

기본 모드는 정렬 문장(해당 시)과 `integrated_multimodal_description`, `overall_soundscape`, `non_diegetic_music`를 출력합니다. Ref2VA는 `subject_definitions`, `summary`, `retention_analysis`, `detailed_description`, `overall_soundscape`, `non_diegetic_music` 순서입니다. 본문은 기본 영어이며, 대사·화면 글자는 원문을 보존합니다. 다른 언어를 요청할 수 있습니다.

Base modes return three named fields plus any frame-alignment line. Ref2VA returns six fields. English is the writing default; explicit language requests take precedence. `retention_analysis` describes reference retention, not hidden reasoning.

## 파일 / Files

- [SKILL.md](SKILL.md): 에이전트 진입점 / agent entrypoint.
- [Shared syntax](references/shared-syntax.md): shots, dialogue, sound.
- [Base modes](references/base-modes.md): T2VA/I2VA/FL2VA/L2VA.
- [Full reference](references/full-reference.md): Ref2VA.
- [Examples](references/examples.md): 완성 예제 / finished examples.
- [Sources](references/sources.md): 출처·버전·적용 범위 / provenance and adaptations.
- [UI metadata](agents/openai.yaml): Codex display and starter prompt.

## 범위 / Scope

영상 생성·업로드·서비스 조작이 아닌 **프롬프트 작성** 스킬입니다. 실제 생성 결과, 정확한 글자·픽셀·입 모양 재현을 보장하지 않습니다. 생성 서비스의 설정은 별도로 적용해야 합니다.

This community adaptation is not an official vendor release. Examples demonstrate prompt structure, not measured video quality. Source attribution and release-license status are recorded in the source notes.
