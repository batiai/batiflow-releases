<div align="center">

# BatiFlow

**macOS 메신저 자동화 도구**

카카오톡 · Slack · iMessage — 메시지 발송을 자동화하세요

[![Release](https://img.shields.io/github/v/release/batiai/batiflow-releases?style=flat-square&color=5994FF)](https://github.com/batiai/batiflow-releases/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-13%2B-000?style=flat-square&logo=apple)](https://github.com/batiai/batiflow-releases/releases/latest)
[![License](https://img.shields.io/badge/license-Proprietary-333?style=flat-square)](https://bati.ai)

[다운로드](https://github.com/batiai/batiflow-releases/releases/latest) · [이슈 리포트](https://github.com/batiai/batiflow-releases/issues) · [bati.ai](https://bati.ai)

</div>

---

## 주요 기능

🚀 **메시지 자동 발송** — 카카오톡, Slack, iMessage를 하나의 앱에서 제어

👥 **다중 수신자 맞춤 발송** — 여러 명 선택 → `{name}`님 개별 메시지 일괄 전송

🤖 **MCP 연동** — Claude Code / Cursor에서 원클릭 설정, AI와 함께 사용

🛡️ **오발송 방지** — 채팅창 제목 자동 검증 + 발송 중 조작 차단 + 연속 실패 자동 중단

📇 **주소록** — 카카오톡 친구 자동 가져오기 + 그룹 관리

⚡ **속도 조절** — 설정에서 발송 속도를 PC 환경에 맞게 조절 가능

## 설치

> macOS 13 (Ventura) 이상 · Apple Silicon & Intel 지원 · 서명 + 공증 완료

### 방법 1: DMG 다운로드 (일반 사용자)

1. **[📥 최신 버전 다운로드](https://github.com/batiai/batiflow-releases/releases/latest)**
2. DMG 열기 → `BatiFlow`를 `Applications`로 드래그
3. BatiFlow 실행

### 방법 2: 터미널 설치 (개발자)

```bash
curl -sL https://flow.bati.ai/install.sh | bash
```

### 설치 후 필수 설정: 접근성 권한

BatiFlow가 카카오톡 등 다른 앱을 제어하려면 **접근성 권한**이 필요합니다.

1. **시스템 설정** > **개인정보 보호 및 보안** > **접근성**
2. 아래 항목을 **모두 허용**:
   - ✅ **BatiFlow** (앱 자체)
   - ✅ **터미널** 또는 **iTerm** (터미널에서 CLI를 사용하는 경우)
   - ✅ **VS Code** 또는 **Cursor** (MCP를 사용하는 경우)
3. 권한 변경 후 **앱/터미널 재시작** 필요

> 💡 **접근성 권한이 없으면** 메시지 발송, MCP 모두 동작하지 않습니다.
> Alfred, Raycast, Keyboard Maestro 등 모든 macOS 자동화 앱이 동일한 권한을 요구합니다.

### 카카오톡 준비

- 카카오톡 Mac 앱이 **실행 + 로그인** 상태여야 합니다
- 비밀번호 잠금이 설정되어 있으면 발송이 실패할 수 있습니다

## 사용법

### GUI 앱

앱 실행 후 사이드바에서:
- **발송** — 앱 선택 → 수신자 체크 → 메시지 입력 → 발송
- **주소록** — 카톡 친구 가져오기, 그룹 관리, CSV 내보내기
- **가이드** — 앱별 사용법, CLI 명령어, 이용 안내
- **설정** — MCP 설정, 발송 속도 조절, 상태 확인

### CLI

```bash
# 카카오톡
batiflow-cli send "홍길동" "안녕하세요"

# Slack (DM)
batiflow-cli send "류장근" "확인 부탁드립니다" --app slack

# Slack (채널)
batiflow-cli send "#general" "공지사항입니다" --app slack

# iMessage
batiflow-cli send "010-1234-5678" "확인 부탁드립니다" --app imessage
```

> CLI 경로: `/Applications/BatiFlow.app/Contents/MacOS/batiflow-cli`

## MCP 연동 (Claude Code / Cursor)

BatiFlow는 MCP(Model Context Protocol)를 지원하여 Claude Code나 Cursor에서 자연어로 메시지를 보낼 수 있습니다.

### 사전 요구사항

- **Node.js** 설치 필요 ([nodejs.org](https://nodejs.org))
  - Claude Code 사용자는 이미 설치되어 있습니다
- **접근성 권한**: BatiFlow + **사용 중인 터미널/에디터** 모두 허용 필요
  - 예: VS Code에서 Claude Code를 사용하면 → BatiFlow + VS Code 모두 접근성 허용
  - 예: 터미널에서 Claude Code를 사용하면 → BatiFlow + Terminal (또는 iTerm) 모두 허용

### 설정 방법

**원클릭 설정 (권장):**
1. BatiFlow 앱 → **설정** → **MCP 연동**
2. **폴더 선택** → Claude Code 프로젝트 폴더 선택
3. **MCP 설정 적용** 클릭
4. **Claude Code 재시작** (`/quit` → `claude`)
5. `/mcp`에서 `batiflow · ✔ connected` 확인

**글로벌 설정 (모든 프로젝트에서 사용):**
1. BatiFlow 앱 → **설정** → **MCP 연동**
2. **글로벌 설정** 클릭
3. Claude Code 재시작

**수동 설정** (`~/.claude.json`):
```json
{
  "mcpServers": {
    "batiflow": {
      "type": "stdio",
      "command": "node",
      "args": ["/Users/당신의이름/.batiflow/mcp-bridge/index.js"],
      "env": {}
    }
  }
}
```

### MCP 사용 예시

설정 후 Claude Code에서:
```
"홍길동한테 카톡으로 수정 완료 알려줘"
"팀 슬랙 #general에 배포 완료 공지해줘"
"010-1234-5678에 iMessage로 확인 부탁드린다고 보내줘"
```

### MCP 트러블슈팅

| 증상 | 해결 |
|------|------|
| `batiflow · ✘ failed` | Claude Code 완전 종료 후 재시작 |
| `connection timed out` | 접근성 권한에서 **에디터/터미널도** 허용했는지 확인 |
| Node.js 없음 | `node --version`으로 확인. 없으면 [nodejs.org](https://nodejs.org) 설치 |
| 카톡 발송 안 됨 | 카카오톡 앱 실행 + 로그인 상태 확인 |
| 발송 시 이상한 동작 | 카카오톡 비밀번호 잠금 해제 확인 |

## 지원 현황

| 앱 | 메시지 발송 | 채팅 목록 | 친구 목록 | 자동화 방식 |
|----|:---------:|:--------:|:--------:|-----------|
| 카카오톡 | ✅ | ✅ | ✅ | AX API |
| Slack | ✅ | ⚠️ | — | Cmd+K + Clipboard |
| iMessage | ✅ | ✅ | — | AppleScript + AX |

> Slack은 Electron 기반으로 채널 목록 자동 가져오기가 제한적입니다.
> 메시지 발송은 안정적으로 동작합니다.

## FAQ

<details>
<summary><b>"확인되지 않은 개발자" 또는 "손상된 파일" 경고</b></summary>

최신 버전은 Apple 서명 + 공증이 적용되어 있어 경고가 뜨지 않습니다.
만약 이전 버전에서 경고가 나타나면:

1. 시스템 설정 > 개인정보 보호 및 보안 > 하단 "확인 없이 열기"
2. 또는 터미널: `xattr -cr /Applications/BatiFlow.app`
</details>

<details>
<summary><b>접근성 권한을 줬는데 동작하지 않아요</b></summary>

1. **BatiFlow** 앱 자체 + **사용 중인 터미널/에디터** 모두 접근성 허용 필요
2. 권한 변경 후 **앱 재시작** 필요 (Cmd+Q 후 다시 실행)
3. iTerm의 경우 **새 창(Cmd+N)**에서 실행해야 반영될 수 있음
</details>

<details>
<summary><b>발송 중 멈추거나 이상한 동작</b></summary>

1. **중단 버튼** 클릭으로 즉시 멈출 수 있습니다
2. 연속 3회 실패 시 자동으로 중단됩니다
3. 카카오톡이 **로그인 상태**인지 확인하세요
4. 카카오톡 **비밀번호 잠금**이 설정되어 있으면 해제하세요
5. 설정에서 **발송 속도**를 "느림"으로 조절해보세요
</details>

<details>
<summary><b>개인정보를 수집하나요?</b></summary>

메시지 내용, 연락처 등 개인정보는 **수집하지 않습니다**. 모든 데이터는 사용자의 Mac에만 저장됩니다. 앱 개선을 위해 익명 사용 통계(기기 ID, 앱 버전)를 수집하며, 설정에서 비활성화할 수 있습니다.
</details>

## 피드백

버그 리포트, 기능 제안, 질문:
- [GitHub Issues](https://github.com/batiai/batiflow-releases/issues)

---

<div align="center">
  <sub>Built by <a href="https://bati.ai">bati.ai</a></sub>
</div>
