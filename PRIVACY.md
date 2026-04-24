# BatiFlow Privacy

BatiFlow is a local-first macOS app. Your messages, files, browser sessions, and AI prompts
**never leave your Mac** unless you explicitly use a cloud AI provider (Claude / OpenAI / Gemini)
with your own API key — in which case the traffic goes directly from your Mac to that provider.

---

## What we collect

### 1. App launch ping

Sent once per app launch so we can count active users and detect version issues.

| Field | Example | Purpose |
|---|---|---|
| `device_id` | macOS hardware UUID | De-duplicate launches per device |
| `version` | `0.8.9` | Version adoption |
| `os_version` | `macOS 15.0` | Compatibility targeting |
| `arch` | `arm64` | Apple Silicon vs Intel split |
| `locale` / `timezone` | `ko` / `Asia/Seoul` | Localization priority |
| `memory_gb` / `cpu_cores` / `cpu_model` | `48` / `16` / `"Apple M4 Max"` | AI model recommendations |

### 2. Community benchmarks (opt-out, default ON)

When you run a local AI model, its speed is shared with a community aggregate
so other users with similar Macs can see realistic performance estimates.

| Field | Example | Purpose |
|---|---|---|
| `cpu_model` | `"Apple M4 Max"` | Group by hardware |
| `ram_tier` | `48` (GB) | Group by memory |
| `model` | `batiai/qwen3.6-35b:iq4` | Group by AI model |
| `eval_tok_s` | `46.5` | Speed measurement |

Community statistics are only exposed in aggregate form — individual measurements
are never shown.

### 3. Tool usage counts (opt-out, default ON)

Daily counts of which built-in tools were used (e.g. "kakao_send: 12"). No message
content, no contact names, no file paths.

---

## What we don't collect

- Messages, chat content, file contents, clipboard, screen contents
- Contact names, phone numbers, email addresses
- Browser history, cookies, form data
- AI prompts or AI responses
- Recorded workflows, automation scripts, or tool arguments

Cloud AI requests go **directly from your Mac to the provider** — BatiFlow servers
never see prompts or responses.

---

## How to opt out

**Settings → Info → Privacy → Share anonymous performance data**

Toggle OFF to immediately stop all benchmark submissions.

---

## Contact

For questions or data-related requests: **support@bati.ai**

Include your `device_id` (shown in Settings → Info → Privacy) if you want your
data removed from community aggregates.

_Last updated: 2026-04-25_
