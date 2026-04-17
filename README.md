# 아카넘 한글 패치 (Arcanum Korean Patch)

**Arcanum: Of Steamworks and Magick Obscura** 한글 번역 패치입니다.

## 다운로드

| 패키지 | 대상 | 다운로드 |
|--------|------|----------|
| **올인원 인스톨러** (511MB) | 신규 유저 (순정 스팀/GoG) | [v1.8 다운로드](https://github.com/hyunjun6928-netizen/arcanum-korean-patch/releases/tag/v1.8) |
| **단독 패치** (8.4MB) | 이미 UAP + 고해상도 설치한 유저 | [v1.8 다운로드](https://github.com/hyunjun6928-netizen/arcanum-korean-patch/releases/tag/v1.8) |

## 포함 내용

### 올인원 인스톨러
- **UAP (Unofficial Arcanum Patch) 2.0.2** — 비공식 버그 수정 패치
- **고해상도 패치 (High Resolution Patch) 1.5** — Drog Black Tooth 제작
- **한글 번역 패치 v1.8**
- **한글 폰트 패치** — Arcanum_CN_Font.exe 기반

### 한글 번역 범위
| 항목 | 번역률 | 비고 |
|------|--------|------|
| 대화 (DLG) | 618개, 100% | 모든 NPC 대화 |
| UI/시스템 메뉴 | 100% | ArcanumA_Language.dat |
| 퀘스트 로그 | 98.8% | |
| 신문 기사 | 99.3% | |
| NPC 이름 | 94.4% | 고유명사 64개 영어 유지 |
| 평판 로그 | 100% | |
| NPC 대화 반응 | 99~100% | |
| 책/비문/전보 | 70~97% | 일부 미번역 |
| 스토리/스킬 UI | 97~100% | |

## 설치 방법

### 올인원 (권장)
1. **스팀 또는 GoG**에서 아카넘 설치
2. `Arcanum_AllInOne_Korean_v1.8.exe` 실행
3. 설치 경로 자동 탐지 (스팀/GoG 모두 지원)
4. 완료 — 바로 플레이

> ⚠️ 기존에 다른 패치가 설치되어 있어도 자동으로 정리하고 클린 설치합니다.  
> 세이브 파일은 보존됩니다.

### 단독 패치
이미 UAP 2.0.2 + 고해상도 패치 1.5가 설치된 환경에서:
1. `Arcanum_Korean_Patch_v1.8.exe` 실행
2. 아카넘 설치 폴더 선택
3. 완료

## v1.8 변경사항
- **gamedesc.mes NPC 이름 버그 수정** — UAP 2.0.2의 Vormantown 모듈 통합 시 13개 NPC 이름이 엉뚱하게 표시되던 버그 수정
- **Vormantown 모듈 자동 제거** — 한글 미지원 + gamedesc.mes 충돌 원인
- **DLG 전수 검증** — 606개 DLG 바이너리 비교, 구조 버그 전부 수정
- **번역 스크립트 버그 8개 파일 수정**
- **UAP 미적용 DLG 6개 보충**
- **용어 통일 12종** (~860회 치환)
  - 블랙 마운틴 클랜, 휠 클랜, 절망의 섬, 아이언 클랜, 다크 엘프, 슈라우디드 힐스, 통합 왕국, 은빛 여인, 스톤월 산맥, 타나토스 섬, 진실의 기둥
  - 스킬 마스터 호칭 "마스터님" 통일
- **핵심 NPC 어투 통일 6명** (~215회)
  - 토르발드, 버질, 로게르, 베가드, 란드버, 케르간
- **re41 포맷 통일** (132파일 560곳, UAP 포맷 준수)
- **클린 설치 방식** — 기존 패치 잔재 자동 정리, 세이브 보존

## 알려진 이슈
- 전보(telegram) 일부, 축복/저주 메시지 일부, 쪽지(note) 대부분이 영어로 표시됩니다 (향후 업데이트 예정)
- gamedesc.mes 영어 잔존 64개는 고유명사(인명, 지명)입니다

## 저작권 안내
- **UAP (Unofficial Arcanum Patch)** — Drog Black Tooth 및 Terra-Arcanum 커뮤니티 제작. 편의를 위해 올인원에 통합되어 있습니다.
- **고해상도 패치 (High Resolution Patch)** — Drog Black Tooth 제작. 편의를 위해 올인원에 통합되어 있습니다.
- **Arcanum: Of Steamworks and Magick Obscura** — Troika Games 개발, Sierra Entertainment 배급.
- **한글 번역** — 본 프로젝트의 번역물입니다.

이 패치는 팬 번역 프로젝트이며, 게임 원본을 포함하지 않습니다. 게임은 [Steam](https://store.steampowered.com/app/500810/) 또는 [GOG](https://www.gog.com/game/arcanum_of_steamworks_and_magick_obscura)에서 구매하세요.

## 빌드
인스톨러 빌드에는 [Inno Setup 6](https://jrsoftware.org/isinfo.php)이 필요합니다.  
`.iss` 스크립트는 `installer/` 폴더에 있습니다.

## 문의 / 버그 제보
[Issues](https://github.com/hyunjun6928-netizen/arcanum-korean-patch/issues)에 남겨주세요.
