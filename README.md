# Wan 3.0 Prompt Writing Skill

대략적인 영상 아이디어를 Wan 3.0이 이해하기 쉬운 실행 가능한 비디오 프롬프트로 바꾸는 Codex 스킬입니다.

사용자는 장면의 핵심만 자연어로 설명하면 됩니다. 이 스킬은 원래 의도를 유지하면서 주체, 장면, 동작, 카메라, 조명, 렌즈, 스타일과 필요한 오디오 정보를 정리해 복사해서 사용할 수 있는 프롬프트를 만듭니다.

> 이 저장소는 프롬프트 작성 스킬입니다. Wan API를 호출하거나 영상을 직접 생성·편집·렌더링하지는 않습니다.

## 주요 기능

| 기능 | 설명 |
| --- | --- |
| 거친 아이디어 확장 | 짧거나 모호한 설명을 구체적인 영상 동작과 촬영 계획으로 발전시킵니다. |
| Text-to-Video | `주체 + 장면 + 동작 + 미학 제어 + 스타일` 구조로 T2V 프롬프트를 작성합니다. |
| Image-to-Video | 이미지에 이미 존재하는 외형을 반복하지 않고 동작과 카메라 움직임에 집중합니다. |
| 첫·마지막 프레임 연결 | 두 프레임 사이의 연속적인 변화와 물리적으로 자연스러운 이동 경로를 설계합니다. |
| 다중 레퍼런스 | 사용자가 제공한 이미지·비디오 식별자를 유지하고 대상과 행동을 명확히 연결합니다. |
| 동작 설계 | 방향, 속도, 강도, 원인과 결과가 읽히는 짧은 동작 시퀀스를 만듭니다. |
| 카메라·미학 제어 | 샷 크기, 각도, 렌즈, 구도, 조명과 카메라 이동을 서로 충돌하지 않게 조합합니다. |
| 대사·오디오 | 지원되는 생성 경로에서 화자, 대사, 음색, 효과음과 배경음악을 구조화합니다. |
| 프롬프트 교정 | 너무 정적이거나 길고, 카메라 지시가 충돌하거나, 짧은 클립에 장면이 과도하게 포함된 입력을 정리합니다. |
| 신뢰성 점검 | 사용자 의도, 연속성, 정체성, 동작 가독성, 모델 한계와 인터페이스 문법을 최종 확인합니다. |

## 빠른 시작

Codex에서 스킬을 직접 지정해 사용할 수 있습니다.

```text
$wan3-prompt-writing 비 오는 밤, 편의점 앞에서 우산을 접고 들어가는 지친 회사원. 8초짜리 쓸쓸한 영화 장면으로 만들어줘.
```

기본 출력은 `Wan 3.0 prompt` 제목과 복사 가능한 영어 프롬프트입니다. 대사는 사용자가 지정한 언어를 유지합니다. 다른 언어, 여러 버전 또는 프롬프트만 필요하면 요청에 명시하세요.

스킬 설명과 요청이 일치하면 Codex가 자동으로 선택할 수도 있습니다. 특정 작업에서 확실히 적용하려면 `$wan3-prompt-writing`으로 명시적으로 호출하세요.

```text
$wan3-prompt-writing 검은 향수병이 천천히 회전하는 6초 제품 광고. 카메라는 고정. 결과는 프롬프트만 출력해줘.
```

## 설치

### Windows PowerShell

```powershell
$skillHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE ".codex" }
New-Item -ItemType Directory -Force -Path (Join-Path $skillHome "skills") | Out-Null
git clone https://github.com/Saeyeon-developer/Wan3.0_prompt_writer.git (Join-Path $skillHome "skills\wan3-prompt-writing")
```

### macOS 또는 Linux

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
git clone https://github.com/Saeyeon-developer/Wan3.0_prompt_writer.git "${CODEX_HOME:-$HOME/.codex}/skills/wan3-prompt-writing"
```

설치 경로의 폴더 이름은 스킬 이름과 동일한 `wan3-prompt-writing`을 권장합니다. 이미 설치되어 있다면 해당 폴더에서 `git pull`로 업데이트할 수 있습니다.

## 사용 방법

### 1. Text-to-Video

장면을 처음부터 생성할 때 사용합니다. 최소한 주체와 행동만 알려줘도 되며, 아래 정보가 있으면 결과를 더 정밀하게 제어할 수 있습니다.

- 영상 길이
- 주체와 수량
- 장소와 시간대
- 핵심 행동과 마지막 상태
- 샷 크기와 카메라 이동
- 조명, 색감과 시각 스타일
- 대사, 효과음과 배경음악
- 반드시 유지하거나 제외할 요소

```text
$wan3-prompt-writing 10초 T2V. 새벽의 텅 빈 지하철 승강장에서 빨간 코트를 입은 여자가 멀어지는 열차를 바라본다. 카메라는 천천히 뒤로 빠지고, 차갑고 현실적인 영화 톤.
```

### 2. Image-to-Video

이미지를 함께 제공하면 해당 이미지가 인물, 배경, 구도와 스타일의 기준이 됩니다. 원하는 변화와 유지 조건을 중심으로 설명하세요.

```text
$wan3-prompt-writing 첨부 이미지의 인물 정체성, 의상, 배경과 조명을 그대로 유지해줘. 약한 바람에 머리카락과 옷자락이 움직이고, 인물이 한 번 눈을 깜빡인 뒤 렌즈를 바라본다. 카메라는 아주 천천히 푸시인.
```

### 3. 첫·마지막 프레임

두 프레임 사이에서 무엇이 어떻게 변해야 하는지 설명하세요. 스킬은 컷을 임의로 추가하지 않고 가능한 연속 동작을 우선합니다.

```text
$wan3-prompt-writing 첫 프레임의 접힌 종이꽃이 마지막 프레임의 완전히 핀 꽃으로 이어지게 해줘. 종이 결은 유지하고, 고정 카메라에서 중앙부터 바깥쪽 꽃잎 순서로 천천히 펼쳐진다.
```

### 4. 여러 화자와 오디오

화자별 외형, 행동, 목소리와 발화 순서를 구분하면 대사 귀속 오류를 줄일 수 있습니다.

```text
$wan3-prompt-writing 조용한 카페의 형사와 바리스타가 한국어로 한 문장씩 대화한다. 형사는 낮고 단호한 목소리, 바리스타는 잠시 멈칫한 뒤 작은 목소리로 답한다. 냉장고 소리와 멀리서 들리는 교통음, 배경음악 없음.
```

### 5. 멀티숏

기본값은 한 클립당 하나의 연속적인 샷입니다. 여러 장소나 컷이 필요하면 각 클립을 분리해 달라고 요청하세요. 타임스탬프 기반 멀티숏 문법은 사용하는 Wan 3.0 인터페이스가 지원한다고 확인된 경우에만 사용합니다.

```text
$wan3-prompt-writing 아래 이야기를 3개의 독립적인 5초 클립 프롬프트로 나눠줘. 각 클립에서 같은 인물의 외형과 의상을 유지해줘: ...
```

더 많은 변환 예시는 [references/examples.md](./references/examples.md)를 참고하세요.

## 프롬프트 작성 원칙

이 스킬은 다음 원칙을 우선합니다.

1. 사용자가 지정한 주체, 관계, 행동, 배경, 스타일과 제약을 임의로 바꾸지 않습니다.
2. 한 짧은 클립에는 읽기 쉬운 핵심 사건 하나와 필요한 보조 반응만 배치합니다.
3. 동작을 단순한 동사 목록이 아니라 `초기 상태 → 시작 동작 → 가시적 반응 → 마지막 상태`로 구성합니다.
4. 카메라 움직임은 하나의 주된 목적을 갖도록 하며 충돌하는 촬영 용어를 쌓지 않습니다.
5. 이미지 기반 입력에서는 정적인 외형 설명보다 무엇이 움직이고 무엇을 유지해야 하는지를 우선합니다.
6. 확인되지 않은 파라미터, 가중치, 네거티브 프롬프트 문법이나 레퍼런스 번호를 만들지 않습니다.

세부 공식과 카메라·오디오 규칙은 [references/wan3-writing-guide.md](./references/wan3-writing-guide.md)에 있습니다.

## 모델 한계 처리

아래 요구는 생성 모델에서 일관성이 떨어질 수 있으므로 스킬이 그대로 보장하지 않습니다.

- 특정 실존 인물의 이름을 사용한 재현
- 화면 속 정확한 철자와 긴 문장
- 단어 단위로 정확히 맞는 립싱크
- 짧은 클립 안의 빠른 장소 전환
- 지나치게 길고 복잡한 안무나 행동 목록

정확한 텍스트나 립싱크가 결과의 핵심이면 영상 생성 후 별도의 후반 작업 단계를 사용하는 것이 적합합니다.

## 어떻게 만들어졌나요?

이 스킬은 두 자료를 역할별로 분리해 설계했습니다.

- **Wan 3.0 프롬프트 가이드:** 현재 프롬프트 공식, 모드 선택, 동작·카메라·미학 구성과 모델 한계의 최우선 기준입니다.
- **Wan 2.2 시스템 프롬프트:** 사용자 의도 보존, 동작 구체화, 이미지 기반 프롬프트의 동적 정보 우선과 카메라 일관성처럼 버전에 종속되지 않는 작성 원칙만 선별했습니다.

두 자료가 충돌하면 Wan 3.0 가이드를 따릅니다. Wan 2.2의 버전 전용 기본값, 고정 언어 제한과 콘텐츠 대체 규칙은 계승하지 않았습니다.

또한 모든 지침을 한 파일에 넣지 않고 단계적으로 공개하도록 구성했습니다.

```text
Wan3.0_prompt_writer/
├── SKILL.md                         # 스킬 선택, 핵심 워크플로와 출력 계약
├── agents/
│   └── openai.yaml                  # Codex UI 이름과 기본 호출 문장
├── references/
│   ├── wan3-writing-guide.md        # 모드별 공식, 동작, 카메라, 오디오와 교정 규칙
│   └── examples.md                  # 대표 입력과 출력 예시
├── .coderabbit.yaml                 # 저장소 리뷰 설정
└── README.md                        # 사람과 외부 에이전트를 위한 사용 안내
```

`SKILL.md`는 항상 필요한 결정 규칙만 제공하고, 상세 지식과 예시는 실제 요청에서 필요할 때만 읽도록 라우팅합니다. 생성 후 Codex의 공식 스킬 구조 검증기인 `quick_validate.py`를 통과했습니다.

## 다른 AI 에이전트에서 사용하기

Codex가 아니어도 이 저장소를 프롬프트 작성 지침으로 사용할 수 있습니다. 에이전트의 시스템 지침 또는 도구 설명에 저장소 경로를 제공하고 다음 읽기 순서를 지시하세요.

### Agent integration contract

```text
Use this repository as a Wan 3.0 video-prompt writing instruction package.

1. Read SKILL.md completely before writing or revising a Wan 3.0 prompt.
2. Preserve the user's explicit instructions over repository defaults.
3. Read references/wan3-writing-guide.md when the request needs detailed mode,
   motion, camera, dialogue, audio, or prompt-repair guidance.
4. Read references/examples.md only when an example is needed to resolve an
   unusual or ambiguous request. Do not copy example subjects into new prompts.
5. Infer T2V or I2V from the user's input and attachments when clear. Ask only
   when missing mode, duration, or reference mapping materially changes the result.
6. Return a copy-ready Wan 3.0 prompt and disclose only material assumptions.
7. Do not claim that this repository runs Wan, generates video, or guarantees
   interface-specific features that the user has not established.
```

## 저장소 유지 관리

- 핵심 동작이나 출력 계약을 바꿀 때는 [SKILL.md](./SKILL.md)를 수정합니다.
- 상세한 모델 작성 규칙은 [references/wan3-writing-guide.md](./references/wan3-writing-guide.md)에 한 번만 유지합니다.
- 새로운 예시는 기존 규칙으로 설명하기 어려운 실제 사용 사례가 있을 때만 [references/examples.md](./references/examples.md)에 추가합니다.
- `SKILL.md`의 이름과 [agents/openai.yaml](./agents/openai.yaml)의 `$wan3-prompt-writing` 식별자를 항상 일치시킵니다.
- CodeRabbit이 연결된 저장소에서는 비초안 PR에 대해 한국어 자동 리뷰와 파일별 검토 지침이 적용됩니다.

## 범위

이 저장소가 담당하는 범위는 Wan 3.0용 프롬프트 작성, 개선, 번역, 구조화와 문제 진단입니다. 실제 생성 서비스 운영, API 호출, 결과 영상 편집과 렌더링은 별도의 도구나 워크플로가 필요합니다.
