<div align="center">

# BatiFlow

**AI가 내 Mac을 자동화해주는 무료 앱**

카카오톡 · Slack · iMessage · 브라우저 — 말로 시키면 AI가 알아서 합니다

[![Release](https://img.shields.io/github/v/release/batiai/batiflow-releases?style=flat-square&color=5994FF)](https://github.com/batiai/batiflow-releases/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-13%2B-000?style=flat-square&logo=apple)](https://github.com/batiai/batiflow-releases/releases/latest)
[![License](https://img.shields.io/badge/license-Proprietary-333?style=flat-square)](https://bati.ai)

[다운로드](https://github.com/batiai/batiflow-releases/releases/latest) · [이슈 리포트](https://github.com/batiai/batiflow-releases/issues) · [flow.bati.ai](https://flow.bati.ai)

</div>

---

![BatiFlow Demo](demo.gif)

## 이런 걸 할 수 있습니다

```
"매일 아침 9시에 사내 어드민 들어가서 어제 매출 통계 캡처해서 팀 카톡에 보내줘"
```
```
"김바티 대표한테 온 카톡 내용 요약해서 류바티한테 카톡으로 보내줘"
```
```
"매주 월요일 10시에 팀 슬랙 #general에 주간 리포트 공지해줘"
```
```
"지금 보이는 웹페이지에서 상품 목록 가져와서 정리해줘"
```

AI에게 자연어로 말하면, **카카오톡 발송 · 메시지 읽기 · 브라우저 조작 · 반복 스케줄**까지 전부 자동으로 처리합니다.

## BatiFlow의 시작

BatiFlow는 **카카오톡 자동 발송**에서 시작했습니다.

macOS에서 카카오톡 메시지를 자동으로 보내고, 읽고, 다중 수신자에게 맞춤 발송하는 기능을 — 비개발자도 UI로 쉽게 쓸 수 있게 만들어 무료로 배포했고, 좋은 반응을 받았습니다.

그런데 요즘, AI 시대에 정말 좋은 기술들이 쏟아지고 있습니다. 도구(Tool), 스킬(Skill), 에이전트(Agent), 오픈소스 언어모델, 브라우저 자동화 — 개발자라면 바로 활용할 수 있지만, 비개발자에게는 여전히 허들이 높습니다.

**BatiFlow는 이 기술들을 비개발자도 쉽게, 무료로 쓸 수 있도록 업그레이드했습니다.**

카카오톡 발송은 물론이고, AI 채팅으로 자연어 명령, 브라우저 자동화, 반복 스케줄, 업무 녹화까지 — 클릭 몇 번이면 시작할 수 있습니다.

## 카카오톡 자동화

BatiFlow의 핵심 기능입니다. macOS에서 카카오톡을 직접 제어합니다.

```
"홍길동한테 카톡으로 회의 참석 알려줘"
"김바티 대표한테 온 카톡 읽어서 요약해줘"
"이바티 채팅방 메시지 요약해서 류바티한테 카톡으로 보내줘"
```

- **메시지 발송** — 원하는 사람에게 카톡 자동 발송
- **메시지 읽기 + AI 요약** — 채팅방 메시지 파싱 → AI가 요약 → 다른 사람에게 전달까지 가능
- **다중 수신자** — 여러 명 선택 → `{name}`님 개별 메시지 일괄 전송
- **오발송 방지** — 채팅창 제목 자동 검증 + 발송 중 조작 차단 + 연속 실패 자동 중단
- **Slack · iMessage** — 동일한 방식으로 통합 제어

> 발송 탭에서 UI로 직접 보내거나, AI 채팅에서 자연어로 명령할 수 있습니다.

## 왜 BatiFlow인가?

### 비개발자도 AI 자동화를 무료로

Zapier, Make 같은 자동화 도구는 월 $10~70이고, n8n은 Docker 설치가 필요합니다. Claude/ChatGPT의 도구 호출은 개발자 전용이고, **카카오톡 같은 데스크탑 앱을 직접 제어하는 건 어떤 도구도 지원하지 않습니다.**

BatiFlow는 이 모든 걸 **무료로, 비개발자도 쓸 수 있게** 만듭니다.

| | Zapier | Make | n8n | BatiFlow |
|---|:---:|:---:|:---:|:---:|
| **월 비용** | $20~69 | $11~29 | $24~60 | **무료** |
| **카카오톡 직접 제어** | ❌ | ❌ | ❌ | **✅** |
| **무료 AI (로컬)** | ❌ | ❌ | ⚠️ 설정 복잡 | **✅ 원클릭** |
| **브라우저 자동화** | 제한적 | ✅ | ✅ | **✅ 로그인 유지** |
| **비개발자 사용** | ✅ | ✅ | ⚠️ | **✅** |
| **자연어 명령** | ⚠️ | ⚠️ | ⚠️ | **✅** |
| **macOS 앱 제어** | ❌ | ❌ | ❌ | **✅** |

### AI를 무료로 쓰는 방법

BatiFlow는 설정에서 **클릭 몇 번으로 AI를 바로 사용**할 수 있습니다:

| 프로바이더 | 설정 방법 | 비용 | 모델 예시 |
|-----------|----------|------|----------|
| **Ollama (로컬)** | 설정에서 "Ollama 설치" 클릭 → 모델 선택 | **완전 무료** | Llama, Qwen, Gemma, DeepSeek 등 |
| **Google Gemini** | [AI Studio](https://aistudio.google.com/apikey)에서 API 키 발급 → 붙여넣기 | **무료** (제한 있음) | Gemini 3.1 Flash Lite, 2.5 Flash 등 10+ 모델 |
| **Claude Max** | 설정에서 "프록시 자동 설치" 클릭 | **구독자 무료** | Claude Sonnet 4, Opus 4 |
| **Anthropic** | API 키 입력 | 유료 API | Claude Sonnet 4.5, Opus 4.1 |
| **OpenAI** | API 키 입력 | 유료 API | GPT-4o, o3-mini |

> Ollama는 인터넷 없이도 사용 가능하고, 데이터가 외부로 전송되지 않습니다.
> 채팅에서 모델을 자유롭게 전환하며 사용할 수 있습니다.

### 내 업무를 녹화하면 AI가 반복해줍니다

1. **녹화** 버튼을 누르고 평소처럼 업무를 수행합니다 (클릭, 타이핑 등)
2. BatiFlow가 작업 순서를 **자동 기록**합니다
3. 기록된 워크플로를 **스킬로 변환** → 이후 AI가 대신 실행
4. **스케줄 등록** → 매일/매주 자동 반복

브라우저 자동화(CDP)를 활용하면 **로그인이 필요한 사내 시스템**도 기존 세션을 유지한 채 자동화할 수 있습니다.

## 실제 활용 예시

| 분류 | 명령 예시 |
|------|----------|
| **카톡 발송** | "홍길동한테 카톡으로 회의 참석 알려줘" |
| **카톡 읽기 + 전달** | "김바티 대표한테 온 카톡 읽어서 요약해서 류바티한테 보내줘" |
| **Slack** | "팀 슬랙 #general에 배포 완료 공지해줘" |
| **iMessage** | "010-1234-5678에 iMessage로 확인 부탁드린다고 보내줘" |
| **브라우저 + 발송** | "사내 어드민에서 어제 매출 가져와서 팀 카톡에 보내줘" |
| **반복 스케줄** | "매일 아침 9시에 일일 리포트 발송해줘" |
| **일회성 예약** | "오늘 저녁 7시에 바티AI한테 인사 보내줘" → 실행 후 자동 삭제 |
| **스킬 생성** | "매일 아침 팀 리포트 보내는 자동화 만들어줘" |
| **브라우저 자동화** | "네이버 접속해서 상품 리뷰 확인해줘" |

---

## 주요 기능

### AI 채팅
- **자연어 명령** → "카톡 보내줘", "브라우저에서 통계 가져와줘" — AI가 도구를 자동 선택하고 실행
- **스마트 도구 라우팅** — 프롬프트 분석 → 관련 도구만 AI에 전달 (토큰 60%+ 절약, 정확도 향상)
- **에이전트 모드** — 메신저/브라우저/복합 작업별 최적화 자동 감지
- **멀티 프로바이더** — Claude, OpenAI, Gemini, Ollama, Claude Max — 채팅에서 모델 즉시 전환
- **도구 ON/OFF** — 메신저/브라우저/스킬 그룹별 토글 (저사양 모델 최적화)
- **마크다운 렌더링** — 헤딩, 테이블, 코드블록(복사), 체크박스, 인용문
- **대화 관리** — 검색, Markdown 내보내기(도구 포함 옵션), 말풍선 복사

### 메시지 자동화
- **카카오톡 · Slack · iMessage** — 하나의 앱에서 통합 제어
- **카카오톡 고속 탐색** — AX 경로 캐시로 반복 작업 50%+ 속도 향상
- **iMessage 안정 읽기** — chat.db 직접 읽기 (앱 활성화 불필요, 100% 안정)
- **다중 수신자 맞춤 발송** — 여러 명 선택 → `{name}`님 개별 메시지 일괄 전송
- **메시지 읽기 + AI 요약** — 채팅방 메시지 파싱 → AI 요약 → 다른 사람에게 전달
- **오발송 방지** — 채팅창 제목 자동 검증 + 발송 중 조작 차단

### 도구 / 스킬 / 스케줄
- **15개 내장 도구** — 카카오톡, Slack, iMessage, 브라우저, 스킬 관리 등
- **시각적 관리** — 도구 목록 조회, 카테고리 필터, 파라미터 확인, 즉시 실행 테스트
- **AI로 스킬 생성** — "매일 리포트 보내는 자동화 만들어줘" → 스킬 자동 생성
- **인라인 편집** — 앱 내에서 스킬 직접 수정 + 즉시 적용
- **스킬 패키지(.bfskill)** — ZIP으로 내보내기/가져오기/공유
- **일회성 vs 반복** — AI가 자동 판단, 일회성은 실행 후 삭제
- **스케줄러** — 시간 예약, 활성/비활성 필터, macOS 알림, 실행 기록

### 브라우저 자동화 (CDP)
- **Chrome 직접 제어** — 페이지 이동, 클릭, 입력, 스크린샷 — AI 채팅에서 자연어로 명령 가능
- **로그인 세션 유지** — 기존에 로그인된 상태 그대로 자동화 (사내 시스템, 쇼핑몰 어드민 등)
- **네트워크 API 캡처** — 웹사이트의 API 요청/응답 실시간 모니터링
- **메신저 연계** — 브라우저에서 가져온 데이터를 AI가 정리해서 카톡/슬랙으로 전송

### 기타
- **MCP 연동** — Claude Code / Cursor에서 원클릭 설정, AI IDE에서 직접 메시지 발송
- **플로팅 모드** — ⌘⇧Space로 어디서든 AI 커맨드 패널 호출
- **화면 녹화 → 스킬** — 클릭/타이핑을 녹화하면 재사용 가능한 자동화로 변환
- **주소록** — 카카오톡 친구 자동 가져오기, 그룹 관리, 검색

## 설치

> macOS 13 (Ventura) 이상 · Apple Silicon & Intel · 서명 + 공증 완료

### DMG 다운로드

1. **[최신 버전 다운로드](https://github.com/batiai/batiflow-releases/releases/latest)**
2. DMG 열기 → `BatiFlow`를 `Applications`로 드래그
3. BatiFlow 실행

### 터미널 설치

```bash
curl -sL https://flow.bati.ai/install.sh | bash
```

### 필수: 접근성 권한

1. **시스템 설정** > **개인정보 보호 및 보안** > **접근성**
2. **BatiFlow** + **터미널/에디터** 모두 허용
3. 권한 변경 후 앱 재시작

### AI 설정

1. 설정 → AI 설정 → 프로바이더 카드 클릭 → API 키 입력
2. 무료로 시작: **Gemini**(무료 티어) 또는 **Ollama**(로컬)
3. 채팅에서 모델 전환하며 사용

## 사용법

### AI 채팅 (메인)

자연어로 명령 → AI가 도구 자동 선택 + 실행:

```
"홍길동한테 카톡으로 회의 참석 알려줘"
"매일 9시에 팀 리포트 보내는 스킬 만들어줘"
```

### 발송 탭

앱 선택 → 수신자 체크 → 메시지 입력 → ⌘+Enter 발송

### 자동화 탭

| 서브탭 | 설명 |
|--------|------|
| **도구** | 등록된 도구 (카테고리 필터, 즉시 실행) |
| **스킬** | 멀티스텝 워크플로 (편집, 내보내기/가져오기) |
| **스케줄** | 예약 실행 (활성/비활성 필터, 시간 편집) |
| **녹화** | 화면 녹화 → 스킬 변환 |
| **기록** | 실행 로그 (상세 내역) |

### CLI

```bash
batiflow-cli send "홍길동" "안녕하세요"
batiflow-cli read "홍길동" --limit 50
batiflow-cli send "#general" "공지사항입니다" --app slack
```

## MCP 연동 (Claude Code / Cursor)

설정 → MCP 연동 → 폴더 선택 → 적용 → Claude Code 재시작

### 메신저 도구

| 도구 | 설명 |
|------|------|
| `batiflow_send` | 메시지 발송 (카카오톡/Slack/iMessage) |
| `batiflow_read` | 채팅방 메시지 읽기 |
| `batiflow_send_bulk` | 그룹 일괄 발송 |
| `batiflow_chats` | 채팅 목록 조회 |
| `batiflow_friends` | 카카오톡 친구 목록 |
| `batiflow_contacts` | 주소록 조회 |

### 브라우저 도구

| 도구 | 설명 |
|------|------|
| `batiflow_browser_navigate` | URL 이동 |
| `batiflow_browser_click` | 요소 클릭 |
| `batiflow_browser_get_text` | 페이지 텍스트 추출 |
| `batiflow_browser_screenshot` | 스크린샷 캡처 |
| `batiflow_browser_evaluate` | JavaScript 실행 |
| `batiflow_browser_page_info` | 현재 페이지 정보 |

> Claude Code에서 "브라우저에서 사내 어드민 통계 가져와서 정리해줘" 같은 명령도 가능합니다.

## 스킬 패키지

스킬을 `.bfskill` 파일로 공유할 수 있습니다:

- **내보내기**: 스킬 선택 → 내보내기 → `.bfskill` 파일 저장
- **가져오기**: 가져오기 → `.bfskill` 파일 선택 → 즉시 설치

## 지원 현황

| 앱 | 발송 | 읽기 | 채팅 목록 | 친구 목록 | 방식 |
|----|:---:|:---:|:-------:|:-------:|------|
| 카카오톡 | ✅ | ✅ | ✅ | ✅ | AX API |
| Slack | ✅ | — | ⚠️ | — | Cmd+K + Clipboard |
| iMessage | ✅ | — | ✅ | — | AppleScript + AX |

## FAQ

<details>
<summary><b>AI 설정이 필요하다고 나와요</b></summary>

설정 → AI 설정에서 프로바이더 API 키를 등록하세요.
무료로 시작하려면 **Google Gemini** (무료 티어) 또는 **Ollama** (로컬, 완전 무료)를 추천합니다.
</details>

<details>
<summary><b>"확인되지 않은 개발자" 경고가 나와요</b></summary>

최신 버전은 Apple 서명 + 공증 적용으로 경고가 나오지 않습니다.
이전 버전이면: `xattr -cr /Applications/BatiFlow.app`
</details>

<details>
<summary><b>접근성 권한을 줬는데 동작하지 않아요</b></summary>

BatiFlow + 사용 중인 **터미널/에디터** 모두 접근성 허용이 필요합니다. 권한 변경 후 앱을 재시작하세요.
</details>

<details>
<summary><b>발송 중 멈추거나 오류가 나요</b></summary>

1. 카카오톡이 로그인 상태인지 확인
2. 비밀번호 잠금 해제
3. 설정에서 발송 속도를 "느림"으로 조절
</details>

<details>
<summary><b>개인정보를 수집하나요?</b></summary>

메시지 내용, 연락처 등 개인정보는 **수집하지 않습니다**. 모든 데이터는 사용자의 Mac에만 저장됩니다. 익명 사용 통계(기기 ID, 앱 버전)만 수집하며, 설정에서 비활성화 가능합니다.
</details>

## 피드백

버그 리포트, 기능 제안, 질문:
- [GitHub Issues](https://github.com/batiai/batiflow-releases/issues)

---

<div align="center">
  <sub>Built by <a href="https://bati.ai">bati.ai</a></sub>
</div>
