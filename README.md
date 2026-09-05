# AI Video Prompt Skills

영상 생성 모델별로 장면 의도를 실행 가능한 프롬프트로 구체화하는 세 가지 독립형 커뮤니티 스킬 모음입니다. 프롬프트 텍스트를 작성하며, 영상 생성 서비스나 API를 직접 조작하지 않습니다.

Three self-contained community skills for turning creative intent into model-specific video prompts. They author prompt text; they do not operate generation services or APIs.

| 모델 / Model | 스킬 / Skill | 안내 / Guide |
| --- | --- | --- |
| MiniMax H3 | `h3-prompt-writing` | [한국어·English](h3-prompt-writing/Readme.md) |
| Seedance 2.5 | `sd25-pe` | [한국어·English](sd25-pe/Readme.md) |
| Wan 3.0 | `wan3-prompt-writing` | [한국어·English](wan3-prompt-writing/Readme.md) |

## Quick start

1. 원하는 스킬 폴더 전체를 프로젝트의 `.agents/skills/` 아래에 복사합니다. 개인 공용 설치 경로는 `~/.agents/skills/`입니다.
2. Codex에서 `$h3-prompt-writing`, `$sd25-pe`, `$wan3-prompt-writing` 중 하나와 장면 설명을 입력합니다.
3. 반환된 프롬프트를 대상 영상 생성 서비스에 전달하고, 출력 설정과 참조 파일은 해당 서비스에서 연결합니다.

Copy the chosen folder into a [Codex skill discovery location](https://learn.chatgpt.com/docs/build-skills), then invoke its `$skill-name`. Other agents can read the folder's `SKILL.md` and load only the relevant reference files. Each package is self-contained.

## Package layout

Each skill folder contains its `SKILL.md` entrypoint, conditional writing references, examples, optional Codex UI metadata, and a bilingual `Readme.md`:

- `h3-prompt-writing`: T2VA, I2VA, FL2VA, L2VA, and Ref2VA prompts for MiniMax H3.
- `sd25-pe`: Seedance 2.5 prompts for scenes, references, keyframes, storyboards, edits, and extensions.
- `wan3-prompt-writing`: Wan 3.0 prompts for text-to-video, image-to-video, references, sound, and multi-shot narratives.

## Scope and release status

각 패키지의 `references/sources.md`에 참고 자료와 자체 작성 규칙을 구분해 기록했습니다. 이 저장소는 공급사의 공식 배포판이나 영상 품질·동기화 성능 인증을 의미하지 않습니다.

The source notes in each package distinguish references from community-authored guidance. No generation result, exact text or pixel rendering, lip-sync accuracy, or service behavior is guaranteed. No project license has been supplied; maintainers should select a license and confirm redistribution terms before publishing as open source.
