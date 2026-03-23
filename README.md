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

🛡️ **오발송 방지** — 채팅창 제목 자동 검증 + 발송 중 조작 차단

📇 **주소록** — 카카오톡 친구 자동 가져오기 + 그룹 관리

## 설치

> macOS 13 (Ventura) 이상 · Apple Silicon & Intel 지원

1. **[📥 최신 버전 다운로드](https://github.com/batiai/batiflow-releases/releases/latest)**
2. DMG 열기 → `BatiFlow`를 `Applications`로 드래그
3. 첫 실행 시 **우클릭 → 열기** (미서명 앱 경고 해제)
4. 접근성 권한 허용 (앱이 자동 안내)

## 사용법

### GUI 앱

앱 실행 후 사이드바에서:
- **발송** — 앱 선택 → 수신자 체크 → 메시지 입력 → 발송
- **주소록** — 카톡 친구 가져오기, 그룹 관리, CSV 내보내기
- **가이드** — 앱별 사용법, CLI 명령어, 이용 안내
- **설정** — MCP 원클릭 설정, 상태 확인

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

# 다중 발송
batiflow-cli send-bulk "거래처" "{name}님, 견적서 보내드립니다"
```

> CLI 경로: `/Applications/BatiFlow.app/Contents/MacOS/batiflow-cli`

### MCP 연동 (Claude Code / Cursor)

**원클릭 설정:**
앱 → 설정 → MCP 연동 → 프로젝트 폴더 선택 → **MCP 설정 적용**

**수동 설정** (`.mcp.json`):
```json
{
  "mcpServers": {
    "batiflow": {
      "command": "/Applications/BatiFlow.app/Contents/MacOS/batiflow-cli",
      "args": ["mcp-server"]
    }
  }
}
```

설정 후 Claude Code에서:
```
"홍길동한테 카톡으로 수정 완료 알려줘"
```

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
<summary><b>"확인되지 않은 개발자" 경고가 뜹니다</b></summary>

앱을 **우클릭 → 열기**로 실행하세요. 또는 터미널에서:
```bash
xattr -cr /Applications/BatiFlow.app
```
</details>

<details>
<summary><b>접근성 권한은 왜 필요한가요?</b></summary>

BatiFlow는 macOS Accessibility API를 사용하여 다른 앱(카카오톡, Slack 등)의 UI를 제어합니다. 이 API는 시스템 설정에서 명시적으로 허용해야만 동작합니다. 모든 macOS 자동화 앱(Alfred, Raycast, Keyboard Maestro 등)이 동일한 권한을 요구합니다.
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
