<div align="center">

# BatiFlow

**On-device AI desktop automation + local RAG search for Mac** — free, private, unlimited.

Run open-source AI models locally with a few clicks. No cloud, no API keys, no cost.
Control any macOS app through natural language — even apps without APIs.
**NEW in v0.9.0:** Search inside your folders by filename, body keyword, or meaning. Korean filenames work out of the box.

[![Release](https://img.shields.io/github/v/release/batiai/batiflow-releases?style=flat-square&color=5994FF)](https://github.com/batiai/batiflow-releases/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-13%2B-000?style=flat-square&logo=apple)](https://github.com/batiai/batiflow-releases/releases/latest)
[![License](https://img.shields.io/badge/license-Proprietary-333?style=flat-square)](https://bati.ai)

[**Download**](https://github.com/batiai/batiflow-releases/releases/latest) · [Website](https://flow.bati.ai) · [BatiAI Models](https://huggingface.co/batiai) · [Ollama Library](https://ollama.com/batiai) · [Issues](https://github.com/batiai/batiflow-releases/issues)

</div>

---

## Why BatiFlow?

| | BatiFlow | ChatGPT / Claude | Zapier / Make / n8n | Spotlight |
|--|---------|-----------------|---------------------|---------|
| **Cost** | Free forever | $20/month | $11-69/month | Free (built-in) |
| **Privacy** | 🔒 100% on your Mac | Data sent to cloud | Data sent to cloud | 🔒 Local |
| **Limits** | Unlimited | Rate limited | Task limited | — |
| **Desktop app control** | KakaoTalk, Slack, Chrome, Calendar... | Chat only | No desktop apps | ❌ |
| **Apps without APIs** | ✅ via macOS Accessibility | ❌ | ❌ | ❌ |
| **Local AI** | One-click setup | ❌ | ⚠️ Complex | ❌ |
| **Local RAG search** | ✅ filename + body + semantic | ⚠️ cloud-only | ❌ | ❌ filename only |
| **Korean filenames** | ✅ NFD/NFC + bigram fallback | ⚠️ varies | ❌ | ❌ broken |
| **Non-developer friendly** | GUI — no code needed | API/prompt only | Workflow builder | GUI |

---

## Quick Start

1. **Download** — [Latest Release](https://github.com/batiai/batiflow-releases/releases/latest) (6 MB DMG, signed + notarized)
2. **Choose AI** — Gemini (free, recommended) or On-device AI via Ollama
3. **Start chatting** — ask anything in natural language, AI auto-selects from 70+ tools

**On-device AI setup (no internet needed):**
```
Settings > AI > On-device AI (Ollama) > Install > Download model > Done
```
BatiFlow auto-detects your Mac's RAM and recommends the best model. No terminal needed.

---

## AI Agent — Tell it what to do

![BatiFlow AI Demo](demo-ai.gif)

> **1.** Read KakaoTalk messages → AI summary → Forward to another person
>
> **2.** Browse files → Summarize PDF → Save to Notes app
>
> **3.** Google search → Screenshot → Send via KakaoTalk

```
"Search Google for AI news and send a summary to my team on KakaoTalk"
  → browser.search → ai.compose → kakaotalk.send

"What's on my calendar today?"
  → calendar.list → formatted response

"Read the latest chat from John on Slack and reply with a summary"
  → slack.read → ai.compose → slack.send
```

---

## 🔍 Knowledge Search — Local RAG over your Mac folders _(NEW in v0.9.0)_

Spotlight ignores file contents. BatiFlow indexes them. Drag a folder, search by **filename**, **body keyword**, or **meaning**.

```
"이력서.pdf" → 정확히 매칭 (한국어 NFD 정규화)
"마녀공장" → "마녀 공장.pdf"도 매칭 (whitespace equivalence)
"Q4 매출 보고" → 본문 BM25 + 의미 검색 hybrid
```

### Five search modes
**auto** / **filename** / **content** (BM25 / FTS5) / **semantic** (vector / sqlite-vec) / **hybrid** (RRF)
Three sources blended via Reciprocal Rank Fusion with weighted ranking.

### Korean-first text handling
- **NFD/NFC normalization** at every DB write + query — APFS stores Korean filenames decomposed (`이력서` → `ㅇㅣᆯᅧᆨㅅᅥ`); BatiFlow normalizes both directions
- **Multi-word + CJK whitespace equivalence** — `"마녀 공장"` ≡ `"마녀공장"` automatically; bigram fallback for partial-token cases
- **Reverse split** — `"홍길동연구소"` matches `"홍길동 연구소.pdf"`
- **T3 filename-only tier** — `.png` / `.dmg` / `.zip` / `.xlsm` indexed for filename search even when body parser unavailable

### On-device embedding (optional)
- **`batiai/qwen3-embedding`** via Ollama — 0.6B (recommended) / 4B / 8B, all 1024-dim via Qwen3 MRL
- Filename prepended to chunk embedding — domain-specific nouns become topic anchors

### Qwen3-Reranker dedicated cross-encoder
- 0.6B model matches 35B generic LLM accuracy (pairwise binary fine-tune)
- Settings preset menu — Cross-encoder / Generic LLM grouped picks

### Finder-style UI
- **⌘K global search** from anywhere · **Space Quick Look** preview · **↑↓ keyboard navigation** (Spotlight pattern)
- Source badge per result (filename / body / semantic / hybrid color-coded chips)
- Top-1 ★ emphasis · Score normalized 0–100%
- Auto-index on folder add · Live indexing (FSEvents + polling fallback) · WAL-safe migration backups
- 6-step onboarding · in-app Quick Start guide

### Benchmark (67-query Korean working corpus)
| Profile | Recall@5 | Latency p95 |
|---------|:--------:|:-----------:|
| A — no rerank | **78.1%** | **102 ms** |
| B — with Qwen3-Reranker 0.6B | **81.5%** | ~1 s |

### Privacy
**100% on-device.** Embeddings via local Ollama, indexing via local SQLite (FTS5 + sqlite-vec). Nothing leaves your Mac.

---

## On-device AI — BatiAI Quantized Models

[BatiAI](https://huggingface.co/batiai) self-quantized models optimized for Apple Silicon. One-click download from the app — no terminal needed.

| Model | Size | M4 16GB | M3 24GB | M4 Max 128GB | Best for |
|-------|------|:-------:|:------:|:------------:|----------|
| [batiai/gemma4-e2b:q4](https://huggingface.co/batiai/gemma-4-E2B-it-GGUF) | 3.2 GB | 107.8 t/s | — | 132.5 t/s | 8 GB Mac · Ultra light |
| [batiai/gemma4-e4b:q4](https://huggingface.co/batiai/gemma-4-E4B-it-GGUF) | 5.0 GB | 57.1 t/s | — | 84.0 t/s | 8-16 GB Mac |
| ⭐ [batiai/qwen3.5-9b:q4](https://ollama.com/batiai/qwen3.5-9b) | 5.2 GB | 12.5 t/s | — | 50.0 t/s | **16 GB Mac · Best for tool calling** |
| [batiai/qwen3.5-9b:q6](https://ollama.com/batiai/qwen3.5-9b) | 6.9 GB | — | — | 39.2 t/s | 16 GB Mac · Higher quality |
| ⭐ [batiai/gemma4-26b:iq4](https://ollama.com/batiai/gemma4-26b) | 13 GB | — | **17 t/s** | **93.6 t/s** | **24 GB Mac · MoE · Fastest** |
| [batiai/gemma4-26b:q4](https://ollama.com/batiai/gemma4-26b) | 16 GB | — | — | 74.9 t/s | 32 GB Mac · Highest quality |
| [batiai/qwen3.6-35b:iq3](https://ollama.com/batiai/qwen3.6-35b) | 14 GB | — | — | 45.9 t/s | 24 GB+ Mac · MoE · 256K context |
| ⭐ [batiai/qwen3.6-35b:iq4](https://ollama.com/batiai/qwen3.6-35b) | 19 GB | — | — | **46.5 t/s** | **32 GB+ Mac · New flagship · 256K context** |
| [batiai/qwen3.6-35b:q4](https://ollama.com/batiai/qwen3.6-35b) | 19 GB | — | — | — | 48 GB+ Mac · Highest quality |
| [batiai/gemma4-31b:iq4](https://ollama.com/batiai/gemma4-31b) | 16 GB | — | — | 22.8 t/s | 48 GB+ Mac · Dense · 256K context |
| [batiai/gemma4-31b:iq3](https://ollama.com/batiai/gemma4-31b) | 13 GB | — | — | 20.7 t/s | 48 GB+ Mac · Smaller |

> All benchmarks measured with `ollama run --verbose`. Real-world speeds on your Mac.

```bash
# Install from terminal (or just click "Download" in the app)
ollama pull batiai/qwen3.5-9b:q4       # 16 GB Mac
ollama pull batiai/gemma4-26b:iq4      # 24 GB Mac
ollama pull batiai/qwen3.6-35b:iq4     # 32 GB+ Mac — new flagship
ollama pull batiai/gemma4-31b:iq4      # 48 GB+ Mac · dense model
```

Your data never leaves your Mac. 🔒

**Also supports:** Gemini (free tier) · Claude · OpenAI · Claude Max — switch models mid-conversation.

---

## Features

### 🔍 Knowledge Search — Local RAG _(NEW in v0.9.0)_
Drag a folder → auto-index → search by filename / body / meaning. Korean filenames work out of the box (NFD/NFC + bigram fallback + reverse split). Five modes: auto / filename / content (BM25) / semantic (vector) / hybrid (RRF). 100% on-device. ⌘K global search, Space Quick Look, ↑↓ keyboard nav.

### 💬 AI Agent with 70+ Built-in Tools
Natural language → automatic tool selection → execution → result summary. No scripting required. Non-developers can use it right away — just type what you want done.

### 📱 Messenger Automation
- **KakaoTalk** — Send/read messages, bulk send with templates, contact search
- **Slack** — Send to channels/users, read message history
- **iMessage** — Send/read via AppleScript
- Works with apps that have **no public API** — BatiFlow uses macOS Accessibility APIs to directly control desktop apps, just like a human would.

### 🌐 Chrome Browser Automation
- Navigate, click, type, screenshot, extract page content
- **Login sessions preserved** — automate internal dashboards, admin panels, e-commerce backends without re-login
- Network API monitoring + capture
- Auto-diagnostics: Chrome + Node.js one-click install from the app

### 🖥 macOS Native App Control
BatiFlow directly integrates with macOS native frameworks — not just shell scripts, but **real native APIs**:
- **Calendar** — EventKit: create/list/search events
- **Reminders** — EventKit: create/complete reminders
- **Notes** — AppleScript: create/search/append notes
- **Mail** — AppleScript: compose and send emails with attachments
- **Finder** — File operations, PDF/XLSX/DOCX/PPTX text extraction
- **System** — Volume/brightness, screenshots, shell commands, clipboard, notifications

### 🤖 External Channels
Connect AI to external messaging platforms — BatiFlow becomes your AI agent on any channel:
- **Telegram Bot** — Long polling, image sending, Markdown, real-time streaming
- **Slack Bot** — Bidirectional messaging via Web API
- **Discord Bot** — REST API, typing indicators
- **Webhook (HTTP)** — Local HTTP server for curl, Apple Shortcuts, n8n

### 📊 Statistics & Benchmarks
- LLM performance monitoring (tok/s per model)
- Usage analytics (AI calls, session time, tool breakdown)
- Global benchmark comparison — see how your Mac performs vs others with the same chip

### 🛠 Extensible
- **YAML custom tools** — Add your own tools without writing code
- **Multi-step skills** — Chain tools into automated workflows
- **Cron scheduler** — Schedule skills to run daily/weekly/custom
- **Visual editor** — Manage tools and skills in the GUI
- **Skill packages (.bfskill)** — Export/import/share workflows
- **Screen recording → Skill** — Record clicks and keystrokes, convert to reusable automation

### 🔒 Privacy & Intelligence
- 🔒 On-device / ☁️ Cloud badge in chat — always know where your data goes
- ⭐ "Best for your Mac" badge — RAM-based model recommendation
- RAM shortage warning before downloading large models
- Model comparison tooltips — speed · quality · best use at a glance
- 3-step setup guide for first-time users

### ⌨️ Power User
- **Floating mode** — `⌘⇧Space` to summon AI command panel from anywhere
- **CLI** — `batiflow-cli send "John" "Hello"` / `batiflow-cli read "John" --limit 50`
- **MCP** — 21 tools for Claude Code / Cursor (see below)

---

## Desktop App Control — Even Without APIs

![BatiFlow KakaoTalk Demo](demo.gif)

BatiFlow controls desktop apps through **macOS Accessibility APIs** — the same technology used by screen readers. This means it can automate apps that have **no public API**, like KakaoTalk:

- **Send messages** — to any contact or group, with `{name}` template personalization
- **Read + AI summarize** — parse chat → AI summary → forward to another person
- **Bulk send** — select multiple recipients → personalized messages
- **Safety** — chat title verification + send interruption protection + auto-stop on failures
- **Slack · iMessage** — same unified interface

> This is something no cloud service (Zapier, Make, ChatGPT) can do — desktop app automation requires direct macOS integration.

### App Support

| App | Send | Read | Chat List | Contact List | Method |
|-----|:----:|:----:|:---------:|:------------:|--------|
| KakaoTalk | ✅ | ✅ | ✅ | ✅ | AX API |
| Slack | ✅ | — | ⚠️ | — | Cmd+K + Clipboard |
| iMessage | ✅ | — | ✅ | — | AppleScript + AX |

---

## MCP for Developers

BatiFlow exposes 21 tools via [MCP](https://modelcontextprotocol.io) for AI coding assistants:

```json
// Claude Code: ~/.claude.json
{
  "mcpServers": {
    "batiflow": {
      "command": "node",
      "args": ["/Applications/BatiFlow.app/Contents/Resources/mcp-bridge/index.js"]
    }
  }
}
```

Works with **Claude Code**, **Cursor**, and any MCP-compatible client.

**Tools:** `kakaotalk_send`, `slack_send`, `browser_navigate`, `browser_screenshot`, `file_read`, `calendar_create`, `notes_create`, `reminders_create`, `system_shell`, and 12 more.

---

## Install

**DMG** (recommended):
```
https://github.com/batiai/batiflow-releases/releases/latest
```

**Homebrew:**
```bash
brew install batiai/tap/batiflow
```

**Requirements:**
- macOS 13+ (Ventura) · Apple Silicon or Intel
- Accessibility permission (prompted on first launch)
- For on-device AI: [Ollama](https://ollama.com) (auto-installed from the app)
- For browser automation: Chrome + Node.js (auto-diagnosed, one-click install)

---

## FAQ

<details>
<summary><b>How do I set up AI?</b></summary>

Settings → AI → Choose a provider:
- **Gemini** — Free tier, recommended to start
- **Ollama** — 100% free, local, no internet needed
- **Claude / OpenAI** — API key required (paid)
</details>

<details>
<summary><b>"Unidentified developer" warning?</b></summary>

Latest versions are Apple signed + notarized. If you see this on an older version: `xattr -cr /Applications/BatiFlow.app`
</details>

<details>
<summary><b>Accessibility permission not working?</b></summary>

Both BatiFlow AND your terminal/editor need accessibility permission. Restart the app after granting.
</details>

<details>
<summary><b>Does BatiFlow collect personal data?</b></summary>

No. Message contents, contacts, and files stay 100% on your Mac. Only anonymous usage statistics (device ID, app version) are collected, and can be disabled in settings.
</details>

<details>
<summary><b>Browser automation fails?</b></summary>

Check Settings → AI → Browser. If Node.js shows ❌, click "Install Node.js". Chrome must also be installed. See [#3](https://github.com/batiai/batiflow-releases/issues/3) for details.
</details>

---

<details>
<summary><b>🇰🇷 한국어 상세 안내</b></summary>

## 이런 걸 할 수 있습니다

```
"매일 아침 9시에 사내 어드민 들어가서 어제 매출 통계 캡처해서 팀 카톡에 보내줘"
"김바티 대표한테 온 카톡 내용 요약해서 류바티한테 카톡으로 보내줘"
"매주 월요일 10시에 팀 슬랙 #general에 주간 리포트 공지해줘"
```

AI에게 자연어로 말하면, 카카오톡 발송 · 메시지 읽기 · 브라우저 조작 · 반복 스케줄까지 전부 자동 처리합니다.

### 🔍 지식 검색 (Local RAG) — v0.9.0 신규

Spotlight는 파일명만, 그것도 한국어가 제대로 안 잡혀요. BatiFlow는 본문/의미까지 검색하고, 한국어가 처음부터 정상 작동합니다.

- **5가지 검색 모드** — 자동 / 파일명 / 본문(BM25) / 의미(벡터) / 하이브리드(RRF)
- **한국어 NFD/NFC 자동 정규화** — APFS는 한글을 자모 분리(`이력서` → `ㅇㅣᆯᅧᆨㅅᅥ`)로 저장하는데, BatiFlow가 양방향 정규화로 정상 매칭
- **공백/부분 토큰 fallback** — `"마녀 공장"` ≡ `"마녀공장"`, `"홍길동연구소"` → `"홍길동 연구소.pdf"`
- **Qwen3-Embedding** (Ollama 로컬, 0.6B/4B/8B, 1024d MRL)
- **Qwen3-Reranker 전용 cross-encoder** — 0.6B로도 일반 35B LLM 수준 reranker 정확도
- **⌘K 글로벌 검색** · **Space Quick Look** · **↑↓ 키보드 네비** (Spotlight 패턴)
- **100% 로컬** — 외부 전송 0건. 로컬 Ollama 임베딩, 로컬 SQLite(FTS5 + sqlite-vec) 색인

**벤치마크 (한국어 working corpus, 67 쿼리)**
| 프로파일 | Recall@5 | Latency p95 |
|---------|:--------:|:-----------:|
| A — rerank 없음 | **78.1%** | **102 ms** |
| B — Qwen3-Reranker 0.6B | **81.5%** | ~1 s |

폴더 드래그 → 자동 색인 → 검색. PDF, OOXML(docx/xlsx/pptx), RTF, 텍스트 본문까지 indexing.

### 카카오톡 자동화
BatiFlow는 macOS 접근성 API를 사용하여 카카오톡을 직접 제어합니다. 카카오톡은 공식 자동화 API가 없지만, BatiFlow는 화면 요소를 직접 조작하여 메시지 발송, 읽기, 대량 발송을 자동화합니다.

- **메시지 발송** — 원하는 사람에게 카톡 자동 발송
- **메시지 읽기 + AI 요약** — 채팅방 메시지 파싱 → AI가 요약 → 다른 사람에게 전달
- **다중 수신자** — 여러 명 선택 → `{name}`님 개별 메시지 일괄 전송
- **오발송 방지** — 채팅창 제목 자동 검증 + 발송 중 조작 차단
- **Slack · iMessage** — 동일한 방식으로 통합 제어

### 온디바이스 AI — BatiAI 모델
BatiAI가 직접 양자화한 Gemma 4, Qwen 3.5 모델을 클릭 몇 번으로 다운로드하여 Mac에서 바로 실행. 인터넷 없이도, API 키 없이도, 비용 없이 사용 가능. 데이터는 100% Mac에 머물고, 사용량 제한 없음.

| 모델 | 크기 | M4 16GB 속도 | M4 Max 속도 | 대상 |
|------|------|:----------:|:-----------:|------|
| gemma4-e2b:q4 | 3.2 GB | 107.8 t/s | — | 132.5 t/s | 8 GB Mac |
| gemma4-e4b:q4 | 5.0 GB | 57.1 t/s | — | 84.0 t/s | 8-16 GB Mac |
| ⭐ qwen3.5-9b:q4 | 5.2 GB | 12.5 t/s | — | 16 GB Mac |
| ⭐ gemma4-26b:iq4 | 13 GB | — | 93.6 t/s | 24 GB Mac |
| gemma4-31b:iq4 | 16 GB | — | 22.8 t/s | 48 GB+ Mac |

앱이 자동으로 Mac RAM을 감지하여 최적 모델을 ⭐ 배지로 추천하고, 부족한 RAM 경고도 표시합니다.

### macOS 네이티브 앱 제어
캘린더(EventKit), 메모(AppleScript), 미리알림(EventKit), 메일(AppleScript), Finder — macOS 네이티브 프레임워크를 직접 사용하여 안정적으로 제어.

### 외부 채널 연동
Telegram Bot · Slack Bot · Discord Bot · Webhook(HTTP) — AI를 외부 메신저에서도 사용 가능.

### 브라우저 자동화
Chrome을 직접 제어하여 로그인된 상태 그대로 사내 시스템을 자동화. Node.js 미설치 시 앱 내 원클릭 설치.

### 통계 & 벤치마크
로컬 모델 속도(tok/s) 모니터링, AI 호출 수/세션 시간 분석, 동일 칩셋 사용자 대비 전 세계 평균 비교.

### 도구 / 스킬 / 스케줄
- 70+ 내장 도구 · YAML 커스텀 도구 · 멀티스텝 워크플로(스킬) · cron 스케줄러
- 화면 녹화 → 스킬 변환 · 스킬 패키지(.bfskill) 공유 · 플로팅 모드 (⌘⇧Space)

### 설치
1. [다운로드](https://github.com/batiai/batiflow-releases/releases/latest) → Applications로 드래그 → 접근성 권한 허용
2. 설정 → AI → Gemini(무료) 또는 Ollama(로컬) 선택

### 개인정보
메시지 내용, 연락처 등 개인정보 수집 없음. 모든 데이터는 Mac에만 저장.

</details>

---

<div align="center">
  <sub>Built by <a href="https://bati.ai">bati.ai</a></sub>
</div>
