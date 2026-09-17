# 사례: 바이럴 광고 분석에서 대사 기반 재창작까지

기록일: 2026-09-18. 원본 프로젝트는 작성자 PC의 `C:/Projects/Codex/Hypnos/project/viral`이다. 아래 상대 경로는 이 프로젝트를 기준으로 하며 스킬 실행의 필수 의존성이 아니다. 영상·프레임·캐릭터 이미지·분석 결과는 프로젝트에 보관한다. 가상환경·모델은 같은 날 프로젝트 밖의 공용 환경으로 분리했다.

## 검증과 적용 범위

| 단계 | 근거와 상태 | 재사용할 판단 |
|---|---|---|
| 시각 분석 | `ref.mp4`의 `analysis/ref_v2/analysis.json`, `analysis.md`, `timeline.md`와 근거 프레임. 약 14초 영상에서 5개 숏·8개 비트를 기록했고, 유사 구도의 11.333333초 점프컷을 좁은 구간의 원본 프레임으로 재확인했다. 음성 청취·전사는 수행하지 않은 분석이다. | 개요 샘플 뒤 의심 구간만 고밀도로 확인하고 컷·행동·조명 변화를 구분한다. |
| 한국어 전사 | `ref-korean.mp4`와 `analysis/ref_korean_speech/review.md`, `runtime_checks.json`, `wrapper_checks.json`. `run03`, `run04_fp16`, `realign_check`에서 전사/정렬 또는 재정렬을 검증했다. 초기 `run01`·`run02`는 다운로드 중단 기록이다. | 자동 전사·정렬 성공과 청취로 확인한 정확도를 구분한다. 사용자는 빠른 다화자 영상의 오인식을 감안해 연출 분석용으로 수용했다. 화자 자동 분리는 검증하지 않았다. |
| 새 영상 설계 | `recreation/siot_15s/creative-plan.md`와 `seedance-prompt.md`. 제공된 시작 프레임과 인물 2명을 이용한 15초 고정 카메라 장면으로 바꿨다. 질문→답변→봉투 개봉→지폐 공개→웃음을 새 대사·행동에 연결했다. | 원본 초 단위 위치 대신 새 구절과 행동 완료를 연출 기준으로 삼는다. 15초·고정 카메라·인물 배치는 이 사례의 조건이다. |
| 생성 결과 | 사용자가 성공적으로 영상이 생성되었다고 보고했다. 생성 결과 파일이나 실제 제출본을 이번 정리에서 직접 검토하지 않았다. | 사용자 보고를 기록하되 대사 정확도·동기화·동작 성공률의 측정 결과로 확대하지 않는다. |

## 공용 전사 환경 이전과 재사용

- 공용 루트: `C:/Projects/Codex/.runtime/whisperx`.
- 실행 Python: 공용 루트 아래 `venv/Scripts/python.exe`.
- `--cache-dir`: 공용 루트 아래 `models`.
- 독립 Python 본체: 공용 루트 아래 `python/cpython-3.11.15-windows-x86_64-none/python.exe`. 패키지 캐시는 `uv-cache`.
- 경로와 검증 정보: 공용 루트의 `runtime-info.json`, `README.md`.
- 검증 환경: Windows, RTX 3070 8GB, Python 3.11.15, WhisperX 3.8.6, PyTorch 2.8.0+cu128, Whisper large-v3, 한국어 강제 정렬. CPU·다른 GPU·다른 OS의 검증 결과는 아니다.

가상환경은 최종 경로에 새로 생성하고 기존 104개 패키지 버전을 동일하게 오프라인 설치했다. 모델·문장 분리 데이터 219개 파일(약 4.4GB)은 이전 전후 SHA256 일치를 확인했다. 공용 환경의 `--offline` 전사·정렬은 5개 구간·33단어·미정렬 0개로 완료되었다. 검증 후 Hypnos의 옛 `.runtime` 전체를 제거했으며, 제거 후 공용 환경만 사용한 재정렬도 성공했다. 전역 Python 설치나 시스템 PATH·영구 환경 변수는 변경하지 않았다.

이는 실행과 경로 독립성 검증이며 청취 기반 전사 정확도·화자 분리 검증은 아니다. 선택적 pyannote/TorchCodec 파일 디코더 경고는 유지되었지만 FFmpeg·메모리 오디오 경로의 전사·정렬은 통과했다. 실제 호출은 [전사 절차](speech-transcription.md)의 공용 환경 예제를 따른다. 다른 기기에서는 실제로 준비된 환경을 지정하거나 새로 구성한다. 배포본 사용에 이 절대 경로나 Hypnos 프로젝트는 필요하지 않다.

## 파일과 출처 추적

- `analysis/upstream_reference_review.md`: ByteDance·Novoads 관찰 지침 검토. 재사용한 개념의 출처는 [로컬 관찰](local-observation.md)에 있다.
- `analysis/skill_check/verification.json`: 근거 추출·분석 검사 도구의 기존 검증 기록.
- `analysis/ref_korean_speech/run03/`, `run04_fp16/`, `realign_check/`: 원문·정렬·실행 설정의 버전별 기록. `candidate.raw.json`의 자막 기반 수정 후보는 청취 확인된 정답이 아니다.
- `analysis/ref_korean_speech/model_sources.json`: 최초 검증에 사용한 가중치 출처·리비전·해시.
- `analysis/shared_runtime_migration/migration-checks.json`: 104개 패키지, 219개 모델·캐시 파일의 해시와 옛 런타임 제거 확인.
- `analysis/shared_runtime_migration/asr_run01/job.json`, `transcript.json`: 공용 환경에서 수행한 오프라인 전사·정렬 결과.
- `analysis/shared_runtime_migration/after_cleanup_realign/job.json`: 옛 런타임 제거 후 재정렬 성공 기록.
- `asset/start_frame.png`, `character1.png`, `character2.png`: 해당 재창작의 제공 이미지.
- [대사 기반 연출](semantic-direction.md): Hypit에서 참고한 설계와 Seedance 자연어 프롬프트로의 변환 원칙.

작성자의 스킬 관리본은 `C:/Projects/Codex/video-skill/video-ad-analyzer`로 통합되었고 Hypnos의 기존 스킬 사본은 제거되었다. 원본 영상·에셋·분석 결과는 Hypnos에 남으며, WhisperX 실행 환경은 위 공용 루트에서 재사용한다. 이는 해당 PC의 관리 이력이며 다른 환경에서 경로를 강제하거나 기존 사본을 삭제하라는 지시가 아니다. 재실행 시 현재 설치본의 스크립트, 실제 런타임·캐시, 현재 작업 프로젝트의 입력·출력 위치와 스킬 버전을 함께 기록한다.
