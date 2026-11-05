# 용도별 프롬프트 예

아래 프롬프트는 ChatGPT 웹, Codex, OpenAI API에서 사용할 수 있다. 모델명과 요청 필드는 GPT Image 2.6 API에서만 적용한다. 프롬프트는 영어로 쓰고, 이미지에 렌더링할 문구는 원래 언어 그대로 따옴표 안에 둔다.

## 제품 광고와 정확한 한글

입력: 이미지 1이 사용자가 제공한 텀블러 사진인 경우.

```text
Create a vertical product advertising photo with the tumbler from Image 1 as the hero. Place the product large in the lower center of the frame and leave empty space at the top for a headline. Pale cream studio background, soft light from the left, natural contact shadow. Keep the product's shape, lid structure, colors and existing logo.
Display the Korean headline "매일의 온도를 담다" exactly once at the top, in a legible bold dark-brown sans-serif typeface. Do not add any text other than the existing product label and this headline.
```

API에서는 Sunburst, `size="1024x1536"`, `quality="high"`, `output_format="png"`를 검토한다. 제목 철자와 횟수, 제품 로고와 형상을 우선 확인한다.

## 배경 제거

```text
Isolate only the product from Image 1 and place it on a fully transparent background. Center the whole product with margin around it so nothing is cropped. Keep the product's shape, proportions, colors and label text. Cut it out cleanly, with no white fringe or color bleed along the edges. Do not draw a solid-color or checkerboard background. Do not add new shadows.
```

API에서는 Flare, `size="1024x1536"`, `quality="medium"`, `background="transparent"`, `output_format="png"`를 검토한다. 결과의 배경 알파와 반투명 경계를 확인한다.

## 다중 참조 의상 편집

```text
Use Image 1 as the edit source. Dress the person in Image 1 in the jacket from Image 2, changing nothing else about the outfit. Follow Image 2 for the jacket's design and material, but adapt its folds, perspective and shadows naturally to the pose in Image 1. Keep the face, skin tone, body shape, expression, hairstyle, hand positions and original pants. Do not change the background, camera angle or framing.
```

API에서는 Sunburst, `quality="high"`, `complexity="low"`부터 시험한다. 바지가 보이는지 등 실제 참조를 확인해 보존 목록을 조정한다.

## 수업 도표와 데이터

과학 도표는 대상 독자·학습 목표·필수 구성 요소·정확한 라벨·관계를 먼저 확정한다. 숫자나 인용이 필요한데 없으면 사실처럼 만들어 넣지 않는다. 시안용 가상 데이터라면 명확히 표시한다.

```text
Create a landscape educational diagram for elementary school students, titled "물의 순환". Show water vapor rising from the ocean (evaporation), clouds forming (condensation), rain falling (precipitation), and water flowing along a river back to the ocean (surface runoff). Point every arrow in the actual direction of movement. Use exactly these Korean labels: "증발", "응결", "강수", "지표 흐름". White background, consistent flat icons, generous spacing and large text.
```

API에서는 Sunburst, `size="1536x1024"`, `quality="high"`, 기본 `complexity`에서 시작한다. 라벨과 화살표 방향, 과정 누락을 검수한다. 배치와 연결을 조정할 때는 품질을 고정하고, 가독성만 부족할 때는 품질 단계를 비교한다.

## 다른 용도에 적용

- UI 미리보기는 출시된 제품처럼 화면 구조·위계·간격·실제 문구를 설명한다. 막연한 콘셉트 아트 표현을 피한다. 결과는 화면 이미지다.
- 만화는 패널마다 눈에 보이는 사건 하나를 주고 순서와 반복 캐릭터를 명시한다. 정지 패널 이미지를 영상으로 소개하지 않는다.
- 역사 장면은 장소와 날짜를 제시하고 의복·배경·소품을 따로 검증한다. 모델이 추론한 시대적 세부를 검증된 사실로 취급하지 않는다.
- 로고는 작은 크기에서 읽히는 실루엣·여백·형태를 설명한다. 경로 편집이 필요하면 [SVG 생성 설정](settings.md#svg-생성)을 적용한다.
- 카드·패키지는 재질과 조명, 종이층·접힘 같은 물성을 설명하고 들어갈 문구를 정확히 지정한다.
