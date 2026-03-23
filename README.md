# BatiFlow

<p align="center">
  <strong>macOS 메신저 자동화 도구</strong><br>
  카카오톡 · Slack · iMessage 자동 발송
</p>

---

## 다운로드

📥 **[최신 버전 다운로드](https://github.com/batiai/batiflow-releases/releases/latest)**

macOS 13 (Ventura) 이상 · Apple Silicon & Intel 지원

## 주요 기능

- **카카오톡 / Slack / iMessage** 자동 메시지 발송
- **다중 수신자** 선택 → `{name}`님 맞춤 메시지 일괄 발송
- **MCP 연동** — Claude Code / Cursor에서 원클릭 설정
- **오발송 방지** — 채팅창 제목 검증 + 발송 중 조작 차단
- **주소록** 관리 — 카카오톡 친구 자동 가져오기

## 설치 방법

1. [Releases](https://github.com/batiai/batiflow-releases/releases)에서 `.dmg` 다운로드
2. DMG 열기 → BatiFlow를 Applications로 드래그
3. 최초 실행: **우클릭 → 열기** (확인되지 않은 개발자 경고 해제)
4. 접근성 권한 허용 (앱이 자동 안내)

## MCP 연동 (Claude Code / Cursor)

앱 실행 → **설정** → **MCP 연동** → 프로젝트 폴더 선택 → **MCP 설정 적용**

수동 설정이 필요한 경우 `.mcp.json`:
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

## CLI 사용

```bash
# 카카오톡
batiflow-cli send "홍길동" "안녕하세요"

# Slack
batiflow-cli send "류장근" "Slack 테스트" --app slack

# iMessage
batiflow-cli send "010-1234-5678" "iMessage 테스트" --app imessage
```

> CLI 경로: `/Applications/BatiFlow.app/Contents/MacOS/batiflow-cli`

## 지원 앱

| 앱 | 발송 | 채팅 목록 | 친구 목록 |
|----|------|-----------|-----------|
| 카카오톡 | ✅ | ✅ | ✅ |
| Slack | ✅ | ⚠️ 제한적 | - |
| iMessage | ✅ | ✅ | - |

> Slack은 Electron 기반이라 채널 목록 자동 가져오기가 제한적입니다. 메시지 발송은 안정적으로 동작합니다.

## 문의

- Issues: [GitHub Issues](https://github.com/batiai/batiflow-releases/issues)
- 제작: [bati.ai](https://bati.ai)

---

<p align="center">
  <sub>© 2026 bati.ai · macOS Accessibility API 기반</sub>
</p>
