# 출처와 적용 범위

확인 기준일은 2026-11-06이다.

GPT Image 2.6 가이드의 작성 원칙을 적용한다. 모델명과 요청 필드는 OpenAI API용으로 구분한다.

- 2.6 모델 선택, 작성 원칙, 검수 및 전환 절차. [OpenAI Image prompting](https://developers.openai.com/api/docs/guides/image-prompting)
- API 모델 지정과 ChatGPT 웹·Codex 내장 이미지 생성의 사용 방식. [Image API 모델 필드](https://developers.openai.com/api/reference/resources/images/methods/generate), [ChatGPT·Codex 이미지 생성](https://learn.chatgpt.com/docs/image-generation)
- Image API의 `complexity`, 마크업 편집, SVG 생성의 요청 조건. [OpenAI Image generation](https://developers.openai.com/api/docs/guides/image-generation)
- 요금과 모델 지원 상태 확인. [Pricing](https://developers.openai.com/api/docs/pricing#image-generation), [Deprecations](https://developers.openai.com/api/docs/deprecations)

## 원문에서 반영한 구분

- Flare/Sunburst 선택, `quality`와 `complexity` 구분 → `SKILL.md`, `settings.md`의 모델 선택과 전환 절차.
- 크기 제약, 투명 배경과 정지 SVG → `settings.md`와 로컬 설정 검사 도구.
- Prompting fundamentals → `SKILL.md`의 프롬프트 작성 원칙.
- 생성·편집·반복 개선 → `editing.md`, `examples.md`의 참조·마크업 편집·용도별 지침.
- Check the result → 결과 검수와 반복 편집 중단 기준.

한국어 설명, 영어 프롬프트와 예시, 오프라인 설정 검사는 이 저장소의 적용 방식이다. `gpt-image-25`는 기존 호출과 설치 경로에서 사용하는 식별자다. 예시의 브랜드·문구·그림자 제약은 해당 작업에 적용한다.
