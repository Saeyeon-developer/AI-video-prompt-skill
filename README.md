# AI 영상 제작 통합 스킬 공간

영상 제작에 필요한 광고 레퍼런스 분석, 프리비즈, 모델별 영상 프롬프트, 보조 이미지 작업을 제공하는 통합 스킬 모음입니다. Git clone 또는 ZIP으로 받은 파일만으로 지침을 사용할 수 있습니다. 실행 도구는 아래의 작업별 요구사항에 따라 별도로 준비합니다.

**AI가 처음 읽을 문서:** [AGENTS.md](AGENTS.md). **어떤 스킬을 쓸지 판단할 진입점:** [ai-video-production](ai-video-production/SKILL.md). 전체 분류와 사용 조건은 [스킬 목록](ai-video-production/references/skill-catalog.md)이 기준입니다.

## 구성

| 단계 | 스킬 | 주요 용도 |
|---|---|---|
| 작업 선택·단계 연결 | [ai-video-production](ai-video-production/SKILL.md) | 광고 분석, 프리비즈, 영상 프롬프트, 이미지 에셋 작업을 구분하고 필요한 스킬 선택 |
| 광고 분석·재창작 설계 | [video-ad-analyzer](video-ad-analyzer/SKILL.md) | 컷·행동·대사 분석, WhisperX 전사·정렬, 새 멘트에 맞춘 연출 계획과 Seedance 프롬프트 |
| 프리비즈·결과 분석 | [blender-previs-to-video](blender-previs-to-video/SKILL.md) | 원본 구도·동작 분석, Blender 기본 도형 제작, 접촉·회전 검토, 생성 결과 비교 |
| 영상 프롬프트 | [sd25-pe](sd25-pe/SKILL.md) | Seedance 2.5의 장면·참조·프리비즈·편집·연장 프롬프트 |
| 영상 프롬프트 | [h3-prompt-writing](h3-prompt-writing/SKILL.md) | MiniMax H3의 텍스트·키프레임·전체 참조 모드와 전용 필드·태그 |
| 영상 프롬프트 | [wan3-prompt-writing](wan3-prompt-writing/SKILL.md) | Wan 3.0의 T2V·I2V·참조·오디오·멀티샷 프롬프트 |
| **정지 이미지** | [gpt-image-25](gpt-image-25/SKILL.md) | GPT Image 2.5용 이미지 생성·편집 프롬프트와 설정; 제품 시트·배경·키프레임 준비 |

`gpt-image-25`는 **동영상 생성 스킬이 아닙니다.** 영상 제작에 쓰일 이미지를 준비할 수 있지만, 이미지를 움직이는 영상으로 만드는 프롬프트는 해당 영상 모델의 스킬을 사용합니다.

## 새 환경에서 시작하기

1. 저장소를 clone하거나 ZIP을 풀고 폴더 구조를 유지합니다. 위 7개 스킬 폴더가 배포 단위입니다. `SKILL.md`만 복사하지 말고 각 폴더 안의 `references/`, `scripts/`, `assets/`, `agents/`도 있는 그대로 유지합니다.
2. 이 폴더를 AI 작업 공간으로 열고 `AGENTS.md`를 읽도록 요청합니다. 다른 작업 공간에서는 **실제 다운로드 위치**의 `AGENTS.md` 경로를 알려줍니다. 예: “`<다운로드한 폴더>/AGENTS.md`를 읽고 첨부 광고의 컷과 대사를 분석해 주세요.” 꺾쇠 부분은 실제 경로로 바꿉니다.
3. 모델이 정해진 프롬프트 요청은 해당 `SKILL.md`로 바로 들어갑니다. 분석·프리비즈·프롬프트를 연결하거나 스킬 선택이 필요하면 `ai-video-production`에서 시작합니다.
4. 아래 표에서 필요한 도구만 준비합니다. 스킬 파일을 다운로드해도 Python, FFmpeg, Blender, WhisperX 환경이나 모델 가중치가 자동 설치되지는 않습니다.

Codex 자동 발견을 사용하려면 7개 스킬 폴더를 프로젝트의 `.agents/skills/` 또는 개인 `~/.agents/skills/` 아래에 **나란히** 복사합니다. 통합 모음 전체를 하나의 스킬 폴더로 중첩하지 않습니다. 설치 후 구조는 다음과 같습니다. [공식 스킬 발견 경로 안내](https://learn.chatgpt.com/docs/build-skills)

```text
.agents/skills/
├── ai-video-production/SKILL.md
├── video-ad-analyzer/SKILL.md
├── blender-previs-to-video/SKILL.md
├── sd25-pe/SKILL.md
├── h3-prompt-writing/SKILL.md
├── wan3-prompt-writing/SKILL.md
└── gpt-image-25/SKILL.md
```

위 트리는 진입점만 표시하며 각 폴더의 보조 파일도 함께 복사해야 합니다. 루트 `README.md`와 `AGENTS.md`는 모음의 사용·관리 안내이므로 대상 프로젝트의 기존 `AGENTS.md`를 덮어쓸 필요가 없습니다. 일부 스킬만 설치할 수도 있지만 라우터만 복사하면 다른 스킬의 기능이 포함되지 않습니다. 광고 분석만 할 때는 `video-ad-analyzer`, Seedance 2.5용 재창작 프롬프트까지 작성할 때는 `sd25-pe`도 함께 설치합니다.

다른 AI 환경에서는 해당 호스트의 스킬 등록 방법을 따르거나 실제 `SKILL.md` 경로를 지정합니다. 상대 링크는 해당 문서 위치를 기준으로 해석합니다. 관리본을 갱신해도 다른 위치의 복사본은 자동 갱신되지 않으므로, 같은 이름의 사본이 중복되지 않게 관리합니다.

## 작업별 실행 도구

| 작업 | 필요한 환경 | 준비·확인 방법 |
|---|---|---|
| 라우팅·모델별 텍스트 프롬프트 | Markdown을 읽는 AI | 생성 SDK·API 키·Python 불필요. 참조 미디어 해석은 호스트의 관찰 기능 필요 |
| 영상 직접 관찰 | 호스트의 영상·이미지·음성 관찰 기능 | 접근 가능한 원본을 제공. 음성 확인이 안 되면 시각 분석을 진행하고 음향은 미확인으로 기록 |
| 프레임·컨택트시트·오디오 추출 | Python 3.11+, PATH의 `ffmpeg`·`ffprobe`, 라벨용 폰트 | [로컬 관찰 절차](video-ad-analyzer/references/local-observation.md). 폰트 자동 탐색 실패 시 `--font` 지정 |
| 분석 JSON·이미지 설정 검사 | Python 3.11+ 표준 라이브러리 | `video-ad-analyzer/scripts/check_analysis.py`, `gpt-image-25/scripts/check_settings.py`의 `--help` 확인 |
| 로컬 음성 전사·정렬(선택) | 별도 Python 3.11·WhisperX·모델 캐시, FFmpeg/ffprobe | [전사 환경 구성](video-ad-analyzer/references/speech-transcription.md). 제공 설치 스크립트는 Windows/NVIDIA 기준이며 `uv` 필요 |
| Blender 프리비즈 제작·렌더(선택) | Blender와 해당 환경에서 사용할 실행·제어 수단 | 현재 환경에서 실행 파일/연결을 확인. 영상 인코딩·확인 도구는 요청한 출력에 맞춰 준비 |

로컬 분석 도구는 저장소 루트에서 다음과 같이 확인할 수 있습니다. 이는 도움말 확인이며 설치나 모델 다운로드를 실행하지 않습니다.

```text
python --version
ffmpeg -version
ffprobe -version
python video-ad-analyzer/scripts/extract_evidence.py --help
python video-ad-analyzer/scripts/check_analysis.py --help
python video-ad-analyzer/scripts/transcribe_video.py --help
```

전사는 준비된 환경의 Python과 `--cache-dir`를 명시해 재사용합니다. 새 환경이 필요한 경우에만 설치 예제의 `-RuntimeRoot`를 지정합니다. Windows/NVIDIA 이외의 환경은 해당 런타임 구성을 별도로 확인해야 하며, 제공 설치 스크립트의 지원 범위로 간주하지 않습니다. 도구가 없는 단계는 한계를 밝히고 독립적으로 가능한 분석·설계를 계속합니다.

## 배포 파일과 외부 자료

`Base*` 원본 자료와 `AUDIT*` 검수 기록은 **Git 배포에 포함되지 않으며 스킬 실행·설치에도 필요하지 않습니다.**

각 스킬의 `references/`는 필요한 단계에서 읽는 작업 지침입니다. 영상·`.blend`·전사·생성 결과는 작업 프로젝트에 두고, 가상환경·모델 캐시는 공용 또는 프로젝트별 외부 위치에서 관리합니다. 개인 환경 설정과 비공개 프로젝트 기록은 저장소에 포함하지 않습니다.

## 광고 분석과 대사 기반 재창작

[video-ad-analyzer](video-ad-analyzer/SKILL.md)는 원본의 컷·행동·대사와 그 연결을 관찰하고, 새 제품·인물·멘트에 맞는 연출 계획을 작성합니다. 원본 타임스탬프는 관찰 근거로 보존하고, 새 영상의 화면은 새 대사나 행동에 연결합니다. Seedance 2.5용 최종 문법은 함께 있는 `sd25-pe`에 연결합니다. Blender가 필요한 동작·접촉 검토는 별도 프리비즈 단계로 선택합니다.

시각 근거 추출은 Python·FFmpeg, JSON 검사는 Python으로 실행합니다. 음성 전사는 별도 WhisperX 환경이 있을 때 사용하며, 모델과 가상환경은 스킬에 포함하지 않습니다. [전사 절차](video-ad-analyzer/references/speech-transcription.md)에 기존 환경 재사용과 새 환경 설치 방법이 있습니다.

## 프리비즈와 결과 비교

[Blender 프리비즈 스킬](blender-previs-to-video/SKILL.md)은 손가락·접촉·제품 앞뒤·힌지의 표현, 사람의 미세 움직임과 카메라 흔들림의 구분, 원본과 제출 클립의 시간축, 에셋 역할 분리, 생성 결과 비교를 다룹니다. [결과 비교와 기록 방법](blender-previs-to-video/references/handoff-and-experiments.md)에 따라 관찰·가설·검증 대기를 구분합니다.

새 스킬을 추가할 때는 [스킬 목록](ai-video-production/references/skill-catalog.md)에 정확한 이름, 용도, 출력 매체와 사용 조건을 먼저 반영합니다. 모델의 상세 문법은 해당 스킬에서 관리하고 통합 안내에 중복 복사하지 않습니다.

## 실행과 출처

세 영상 모델 스킬은 프롬프트를 작성하며 생성 서비스나 API를 직접 운영하지 않습니다. 실제 생성·업로드는 사용자의 해당 요청과 이용 가능한 실행 도구에 따릅니다. 이미지 스킬 역시 프롬프트만 요청한 경우 이미지를 생성하지 않습니다.

각 모델 스킬의 `references/sources.md`는 참고 자료와 자체 작성 지침을 구분합니다. 공급사의 공식 배포판이나 생성 품질 보증을 의미하지 않습니다. 원본 자료의 배포 조건과 프로젝트 라이선스는 공개 배포 시 별도로 확인해야 합니다.
