# Seedance 2.5 Prompt Writing

Seedance 2.5 전용 프롬프트 작성·개선 스킬입니다. 짧은 장면부터 다중 참조, 편집, 연장까지 사용자의 의도와 소재 역할을 명확한 지시로 정리합니다.

Compile scene ideas, stories, and references into Seedance 2.5 prompts for generation, editing, and extension.

## 기능 / Features

- 텍스트 장면·스토리·멀티샷·타임라인 / scenes, stories, shots, timing.
- 이미지·영상·음성 역할과 인물·소품 연결 / reference and subject bindings.
- 엄격한 시작·종료 프레임과 일반 키프레임 구분 / strict versus semantic keyframes.
- 스토리보드·블록아웃, 영상·오디오 편집, 앞·뒤 연장 / storyboard, blockout, edits, extensions.

## 설치 / Installation

이 폴더 전체를 프로젝트의 `.agents/skills/sd25-pe/`로 복사하세요. 개인 공용 설치 위치는 `~/.agents/skills/sd25-pe/`입니다. 기존에 같은 이름의 스킬이 설치되어 있다면 사용할 사본을 하나로 정리하세요. 이 문서는 설치 방법을 안내하며, 자동 설치를 수행하지 않습니다.

Copy this entire folder into your project's `.agents/skills/sd25-pe/` or your user's `~/.agents/skills/sd25-pe/`. Keep `references/` and `agents/` beside `SKILL.md`. The sibling `Base-*` source archives are not needed. See [official skill discovery documentation](https://learn.chatgpt.com/docs/build-skills). If the skill does not appear, restart Codex.

다른 에이전트에서는 `SKILL.md`를 읽고 작업에 해당하는 참조 문서만 불러오도록 요청하면 됩니다. `agents/openai.yaml`은 Codex UI용 선택 메타데이터입니다.

Other agents can read `SKILL.md` and follow its task-specific reference links. No SDK, API key, Python dependency, or generation connector is needed for text authoring.

## 사용 / Usage

Codex에서 `$sd25-pe`와 장면 설명을 함께 입력하세요. 자연어로 대상 모델을 명시해도 자동 선택될 수 있습니다. 모델명, 핵심 동작, 참조 역할, 필요한 대사·길이·카메라 방향을 알려주면 좋습니다. 단순한 장면에 모든 항목이 필수인 것은 아닙니다.

Invoke `$sd25-pe` with your scene. Include the essential event, reference roles, and any exact dialogue or timing constraints. Media inspection requires your agent's media-reading capabilities; inaccessible references retain their stated roles without invented observations.

```text
$sd25-pe 빨간 우산이 빗속에서 천천히 펼쳐지는 장면. 고정 카메라, 대사와 음악 없음.

$sd25-pe @Image1은 인물 외형, @Video1은 걷는 동작만 참고합니다. 인물이 카페로 걸어 들어가도록 작성하세요.

$sd25-pe Edit @Video1: translate its dialogue into Korean and adapt the lip movements. Preserve everything else. No subtitles.
```

## 출력 / Output

기본적으로 사용자 언어와 관계없이 영어로 된 최종 프롬프트 하나만 출력합니다. 복잡한 작업에는 소재 역할·사건·연속성 구획이 포함될 수 있습니다. 대사·인용문·화면 문구는 필요한 경우 원문 언어를 보존할 수 있습니다. 화면비·총길이·해상도 같은 실행 설정은 프롬프트와 분리합니다. 장면별 타임스탬프는 창작 지시이므로 사용할 수 있습니다.

Returns one final prompt written in English regardless of the user's language or requested prompt language. Quoted dialogue and visible text may remain in their original language when required. Ratio, total duration, resolution, and other interface settings stay outside it; creative timing may appear inside. Explicit edits are not silently converted into regeneration when settings conflict.

## 파일 / Files

- [SKILL.md](SKILL.md): 에이전트 진입점 / agent entrypoint.
- [Asset roles](references/asset-roles.md): mappings and input envelope.
- [Task routing](references/task-routing.md): editing, extension, settings.
- [Narrative and sound](references/narrative-and-sound.md): story, timing, camera, dialogue.
- [Visual control](references/visual-control.md): frames, grids, blockouts.
- [Examples](references/examples.md): 완성 예제 / finished examples.
- [Sources](references/sources.md): 출처·버전·적용 범위 / provenance and adaptations.
- [UI metadata](agents/openai.yaml): Codex display and starter prompt.

## 범위 / Scope

영상 생성·업로드·서비스 조작이 아닌 **프롬프트 작성** 스킬입니다. 실제 생성 결과, 정확한 글자·픽셀·입 모양 재현을 보장하지 않습니다. 생성 서비스의 설정은 별도로 적용해야 합니다.

This community adaptation is not an official vendor release. Examples demonstrate prompt structure, not measured video quality. Source attribution and release-license status are recorded in the source notes.
