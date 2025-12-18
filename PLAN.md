# K-Wave Connect POC 구현 계획 (팬 이벤트 예약)

## 목표

- 하드코딩된 이벤트 목록을 기반으로 팬 이벤트 예약 플로우를 end-to-end로 검증한다.
- 로컬 상태/스토리지만 사용하여 빠르게 동작하는 데모를 완성한다.
- BLUEPRINT.md의 디자인(핑크 계열 팔레트, Pretendard, 그리드 카드, 미묘한 트랜지션)을 준수한다.

## 범위

- 이벤트 목록/검색/필터(아티스트, 날짜) UI
- 이벤트 상세 + 단일 단계 "Reserve" 액션
- 예약 완료 토스트/다이얼로그 및 "My Bookings" 리스트
- 간단한 룰 기반 추천(최근 조회/예약 아티스트 우선)
- 로컬 스토리지(예: `shared_preferences`/`hydrated_bloc`/`provider` 내 임시 메모리)만 사용

## 기술 선택

- 상태관리: `bloc` (이미 very_good_cli 템플릿과 궁합이 좋음)
- 라우팅: 기존 go_router(프로젝트에 맞춰 확인 후 재사용) 또는 `MaterialApp.router`
- 스토리지: POC 단계에서는 in-memory -> 필요 시 `shared_preferences`로 확장
- 테마: `ThemeData`에 주요 색상(Primary #FF69B4, Accent #FF1493, Background #D3D3D3) 적용, Pretendard 폰트 번들 또는 대체 산세리프

## 작업 항목

1. 기본 도메인/모델 정의
   - `Event`(id: BigInt, artist, title, date, venue, tags, image/icon, totalSeats, bookedSeats)
   - `Booking`(eventId: BigInt, bookedAt)
   - 목업 데이터 생성: 5~8개 K-POP 팬미팅/콘서트 (좌석 정보 포함)

2. 앱 구조 뼈대
   - 홈 탭: 이벤트 그리드 + 검색/필터 + 추천 섹션
   - 상세 화면: 이벤트 설명, 날짜/장소, 버튼 `Reserve`, 좌석 잔여 수(총/예매됨/남음) 표시
   - 마이 페이지/탭: 예약 목록(`My Bookings`)
   - 단순 레이아웃 전환 애니메이션 적용

3. 상태 & 로직
   - Riverpod: `eventsProvider`(검색/필터), `bookingsProvider`(+SharedPrefs 지속), `recommendationsProvider`, `viewedEventsProvider`
   - 예약 흐름: 좌석 가능 여부 체크 -> 버튼 탭 -> 상태 업데이트 및 좌석 수 반영 -> 스낵바/다이얼로그 확인 -> My Bookings 반영

4. 저장소 레이어 (옵션적 단기 구현)
   - In-memory repository 기본 구현
   - 시간이 허용되면 `shared_preferences` 연결(앱 재시작 시에도 예약 유지)

5. UI 스타일링
   - 컬러 팔레트/폰트 적용, K-pop 테마 아이콘
   - 카드형 그리드(2열), 버튼 색상 강조(Accent)
   - 미묘한 Hero 또는 Fade 전환

6. 추천 로직 (간단 룰)
   - 최근 조회/예약한 아티스트와 동일 아티스트 우선 정렬
   - 태그(예: "fanmeet", "concert") 일치 시 가중치 부여

7. 테스트
   - Bloc 단위 테스트: 예약 생성/중복 방지/추천 정렬
   - 위젯 스모크 테스트: 홈 그리드 렌더, 예약 버튼 탭 시 상태 변화

8. 문서화
   - README에 POC 범위/실행 방법 반영 (완료)
   - 주요 위젯/Bloc 간 단순 다이어그램(시간 허용 시)

## 완료 기준 (Acceptance)

- 홈에서 이벤트 목록/검색/필터/추천이 보인다.
- 상세 화면에서 `Reserve` 시 즉시 예약되고 피드백(스낵바/다이얼로그)이 나온다.
- "My Bookings"에서 예약한 이벤트가 리스트로 보인다.
- 추천 섹션이 최근 활동을 반영해 순서가 바뀐다.
- 최소 한 개 이상의 Bloc/위젯 테스트가 통과한다.

## 타임라인(권장)

- Day 1: 모델/목업 데이터, Bloc 뼈대, 홈/상세 최소 UI
- Day 2: 예약 흐름 + 추천 로직 + 스타일링
- Day 3: 로컬 스토리지(옵션), 테스트 보강, 다듬기
