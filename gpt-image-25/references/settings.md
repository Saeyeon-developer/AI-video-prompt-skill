# 모델 선택과 요청 설정

아래 설정은 OpenAI Image API 기준이다. Flare와 Sunburst는 지원되는 API 요청에서 `model`로 지정한다. ChatGPT 웹과 Codex 내장 이미지 생성에는 두 모델을 지정하는 옵션이 없다. [Image API 모델 필드](https://developers.openai.com/api/reference/resources/images/methods/generate), [ChatGPT·Codex 이미지 생성](https://learn.chatgpt.com/docs/image-generation)

## GPT Image 2.6 설정

| 필드 | 값 또는 제약 |
| --- | --- |
| `model` | `gpt-image-2.6-flare`, `gpt-image-2.6-sunburst` |
| `quality` | `auto`, `low`, `medium`, `high`, `xhigh`, `max`. 질감과 작은 글자 등 렌더링 세부 묘사 조절 |
| `complexity` | `low`, `medium`, `high`. 두 모델 모두 생략 시 `high`. 렌더링 전 구도와 요소 배치 계획 조절 |
| `size` | `auto` 또는 지원되는 `WIDTHxHEIGHT`. 양쪽 변은 16의 배수, 화면 비율은 1:3부터 3:1까지 |
| `background` | `auto`, `opaque`, `transparent` |
| `output_format` | `png`, `jpeg`, `webp`. 새 정지 이미지 생성에서 `svg`도 지원 |
| `output_compression` | JPEG·WebP 전용, 0–100 |
| `markup` | 편집할 영역을 표시하는 투명 PNG 오버레이. [마크업 편집](editing.md#마크업으로-편집-영역-지정) 참조 |

2.6 편집에서 `input_fidelity`는 생략한다. 2.6은 `reasoning.summary`를 지원하지 않는다. [공식 프롬프트 가이드](https://developers.openai.com/api/docs/guides/image-prompting)

## 크기와 로컬 검산

가이드의 2.6 크기 예는 정사각형 `1024x1024`, 가로 `1536x1024`, 세로 `1024x1536`, 16:9 `1536x864`다. 다른 사용자 지정 크기의 허용 여부와 픽셀 한도는 대상 모델과 엔드포인트에서 확인한다. 예를 들어 정확히 `1920x1080`이 필요하면 같은 비율의 `1536x864`로 생성한 뒤 리사이즈하는 방법을 제안할 수 있다. 전달할 때 생성 크기와 최종 파일 크기를 구분한다.

아래 명령은 스킬 폴더 기준이다. 검사기는 Flare와 Sunburst에 공통인 규칙을 적용한다. 로컬 검사에서는 `--model`을 생략할 수 있다. 실제 API 요청에는 사용할 모델을 지정한다.

```sh
python scripts/check_settings.py --model gpt-image-2.6-sunburst --size 1536x864 --quality high --complexity high --background transparent --output-format png
```

검사기는 문서에 명시된 로컬 설정 조건을 검산한다. 계정 접근과 최종 요청의 유효성은 실행 환경에서 확인한다.

## 품질 선택

일상 요청은 `auto` 또는 `medium`에서 시작할 수 있다. 작은 글자나 복잡한 라벨은 `medium`과 `high`의 가독성을 비교한다. `xhigh`나 `max`는 충족하지 못한 렌더링 요구를 개선하는지 확인할 때 사용한다.

배치와 요소 간 관계를 비교할 때는 `quality`를 고정하고 `complexity`만 바꾼다. 조명·질감·글자 선명도를 비교할 때는 `complexity`를 고정하고 `quality`만 바꾼다. 프롬프트, 입력 이미지, 크기와 파일 형식은 비교 중에 유지한다.

## 투명 배경

프롬프트에서 배경 제거/투명 유지와 원하는 그림자 처리를 설명하고, API에서는 `background="transparent"`, `output_format="png"` 또는 `"webp"`를 따로 설정한다. 반환 바이트와 알파를 보존한다. 후속 편집에도 투명 유지 요구를 반복한다.

알파 채널 존재만으로 성공 판정하지 않는다. 배경 영역에 실제 투명 픽셀이 있는지, 머리카락·유리·반투명 그림자·제품 경계가 자연스러운지 확인한다. 흰 배경이나 그려진 체크무늬는 투명이 아니다. 사용자가 JPEG와 투명을 동시에 요구하면 형식 충돌을 설명한다.

## SVG 생성

벡터 경로가 필요한 로고·아이콘은 2.6의 `POST /v1/images/generations`에서 `output_format="svg"`, `n=1`을 사용한다. 투명한 영역이 필요하면 `background="transparent"`를 지정한다. `stream`, `partial_images`, `output_compression`, `prompt_rewriter`는 생략한다. `data[0].b64_json`을 디코딩해 `.svg`로 저장하고 벡터 경로와 렌더링을 확인한다. 편집 입력에는 지원되는 래스터 형식을 사용한다. 공식 가이드의 애니메이션 GIF 예시는 이 스킬의 정지 이미지 범위 밖이다.

## API 요청 설정 예

새 생성은 `client.images.generate`, 입력 이미지 편집은 `client.images.edit`를 사용한다. 아래는 투명 래스터 출력을 위한 필드 예다. 사용 중인 SDK나 도구가 해당 필드를 노출하는 경우에 전달한다.

```json
{
  "model": "gpt-image-2.6-sunburst",
  "quality": "high",
  "size": "1536x1024",
  "background": "transparent",
  "output_format": "png"
}
```

## 기존 워크플로 전환

전환을 요청받았을 때 적용한다. 일반적인 한 장 생성에 성능 실험을 의무화하지 않는다.

1. 대표 프롬프트·참조·현재 설정·통과 결과를 기준선으로 보관한다. 글자, 얼굴, 제품 형상, 투명 소재와 어려운 연속 편집을 포함한다.
2. 속도가 중요하면 Flare, 배치나 정밀 편집이 중요하면 Sunburst부터 시험한다. 첫 비교에는 동일한 프롬프트·참조·크기·품질·형식을 쓰고 `complexity`는 기본값으로 둔다.
3. 각 편집 결과와 최종 이미지의 문구·배치·정체성·제품 형상·수정 범위·알파를 평가한다.
4. `quality`와 `complexity`를 한 번에 하나씩 바꿔 통과율과 지연시간을 비교한다. 품질 기준을 충족한 뒤 필요에 따라 같은 설정으로 Flare도 비교한다.
5. 실제 운영 전환이 요청 범위에 있다면 일부 트래픽부터 확대하고 지원되는 이전 모델의 롤백 경로를 유지한다. 요금과 구형 모델 종료일은 실행 시 [공식 문서](https://developers.openai.com/api/docs/deprecations)에서 재확인한다.
