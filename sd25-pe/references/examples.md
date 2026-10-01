# Seedance 2.5 examples

These authored examples demonstrate decisions, not measured generation quality. Explanations and deployment notes stay outside the model prompt.

## Simple scene

Brief: A red umbrella opens in the rain. Fixed camera, no dialogue or BGM.

```text
빗속에서 빨간 우산 하나가 천천히 펼쳐진다. 접힌 천이 우산살을 따라 펴지고 빗방울이 가장자리에서 떨어진다. 카메라는 고정된 근접 구도를 유지한다. 빗소리와 우산이 펼쳐지는 소리만 들린다. 대사와 배경음악은 없다.
```

## Semantic keyframes

Brief: @Image1 is the starting state, @Image2 is the ending state. Both use reference_image. New 9:16 output; no dialogue.

```text
Use @Image1 as the first-frame reference and @Image2 as the last-frame reference. The subject moves continuously from the starting pose and object state in @Image1 to the ending state in @Image2, keeping the same identity and prop count. Adapt the composition while retaining the key spatial relationships. No dialogue.
```

Handoff: set 9:16 outside the prompt. Ordinary reference_image roles do not lock ratio or guarantee exact frame matches. Strict boundary roles would follow different settings.

## Audio edit with requested lip adaptation

Brief: Translate @Video1 dialogue into Korean; adapt lip movement; preserve everything else. No subtitles.

```text
Edit @Video1 as the sole source video. Translate its spoken dialogue into Korean, preserving the meaning, speaker assignments, and speaking intervals. Adapt only the speaking characters' lip movements to the translated lines. Preserve all other appearance, body actions, backgrounds, camera work, cuts, ambience, effects, and music. Do not add subtitles.
```

No unobserved transcript or replacement audio asset is invented.

## Extension before the source

Brief: Before @Video1 begins, the person approaches and takes the position in its opening frame.

```text
Extend @Video1 before its beginning. The same person approaches the opening-frame position and settles into its posture. End the new segment at the first-frame state of @Video1, maintaining the person's identity, prop positions, camera composition, lighting, motion continuity, and ambient sound. The person remains one continuous instance. Do not alter the original segment or introduce later source events early.
```
