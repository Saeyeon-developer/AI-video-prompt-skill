# Wan 3.0 Prompt Writing

Wan 3.0 전용 영상 프롬프트 작성 스킬입니다. 장면·동작·카메라·소리를 구체화하며, 이미지 애니메이션과 참조 기반 멀티샷도 지원합니다.

Develop Wan 3.0 scene prompts with clear motion, camera, aesthetics, sound, and reference-aware multi-shot narratives.

## 기능 / Features

- T2V: 주체·환경·동작·미학·스타일 / entity, scene, motion, aesthetics, style.
- I2V: 이미지 재설명보다 동작과 카메라에 집중 / motion-first image animation.
- R2V: Image 1 / Video 1 등 유형별 참조 / per-type reference identifiers.
- 멀티샷, 화자별 대사, 효과음·음악 / multi-shot narratives and audio.
- Wan 2.2의 유용한 작성 요령만 선별 / legacy heuristics without legacy model limits.

## 설치 / Installation

이 폴더 전체를 프로젝트의 `.agents/skills/wan3-prompt-writing/`로 복사하세요. 개인 공용 설치 위치는 `~/.agents/skills/wan3-prompt-writing/`입니다. 기존에 같은 이름의 스킬이 설치되어 있다면 사용할 사본을 하나로 정리하세요. 이 문서는 설치 방법을 안내하며, 자동 설치를 수행하지 않습니다.

Copy this entire folder into your project's `.agents/skills/wan3-prompt-writing/` or your user's `~/.agents/skills/wan3-prompt-writing/`. Keep `references/` and `agents/` beside `SKILL.md`. The sibling `Base-*` source archives are not needed. See [official skill discovery documentation](https://learn.chatgpt.com/docs/build-skills). If the skill does not appear, restart Codex.

다른 에이전트에서는 `SKILL.md`를 읽고 작업에 해당하는 참조 문서만 불러오도록 요청하면 됩니다. `agents/openai.yaml`은 Codex UI용 선택 메타데이터입니다.

Other agents can read `SKILL.md` and follow its task-specific reference links. No SDK, API key, Python dependency, or generation connector is needed for text authoring.

## 사용 / Usage

Codex에서 `$wan3-prompt-writing`와 장면 설명을 함께 입력하세요. 자연어로 대상 모델을 명시해도 자동 선택될 수 있습니다. 모델명, 핵심 동작, 참조 역할, 필요한 대사·길이·카메라 방향을 알려주면 좋습니다. 단순한 장면에 모든 항목이 필수인 것은 아닙니다.

Invoke `$wan3-prompt-writing` with your scene. Include the essential event, reference roles, and any exact dialogue or timing constraints. Media inspection requires your agent's media-reading capabilities; inaccessible references retain their stated roles without invented observations.

```text
$wan3-prompt-writing 비 오는 밤 편의점 앞에서 우산을 접고 들어가는 사람. 쓸쓸한 느낌.

$wan3-prompt-writing 이 이미지에서 머리카락이 바람에 살짝 움직이고 카메라가 가까워지게 해주세요.

$wan3-prompt-writing The robot in Image 1 folds and launches a paper airplane in the workshop in Image 2. Six seconds, two shots. No dialogue or music.
```

## 출력 / Output

기본적으로 `Wan 3.0 prompt` 제목과 복사 가능한 텍스트 블록을 출력합니다. 본문은 기본 영어이며 대사는 요청한 언어로 유지합니다. “한국어로”, “프롬프트만”처럼 형식을 지정할 수 있습니다. 멀티샷은 전체 설명과 샷 번호·시간·내용으로 정리합니다.

Defaults to an English prompt in a text block, with quoted dialogue preserved in its requested language. Request another language or prompt-only output freely. Multi-shot stories stay in one prompt unless separate clips are requested or necessary.

## 파일 / Files

- [SKILL.md](SKILL.md): 에이전트 진입점 / agent entrypoint.
- [Writing guide](references/wan3-writing-guide.md): modes, camera, sound, multi-shot, repairs.
- [Examples](references/examples.md): 완성 예제 / finished examples.
- [Sources](references/sources.md): 출처·버전·적용 범위 / provenance and adaptations.
- [UI metadata](agents/openai.yaml): Codex display and starter prompt.

## 범위 / Scope

영상 생성·업로드·서비스 조작이 아닌 **프롬프트 작성** 스킬입니다. 실제 생성 결과, 정확한 글자·픽셀·입 모양 재현을 보장하지 않습니다. 생성 서비스의 설정은 별도로 적용해야 합니다.

This community adaptation is not an official vendor release. Examples demonstrate prompt structure, not measured video quality. Source attribution and release-license status are recorded in the source notes.
