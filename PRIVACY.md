# BatiFlow Privacy

BatiFlow is a local-first macOS app. Your messages, files, browser sessions, and AI prompts
**never leave your Mac** unless you explicitly use a cloud AI provider (Claude / OpenAI / Gemini)
with your own API key — in which case the traffic goes directly from your Mac to that provider.

This document describes the **only** data BatiFlow itself transmits to our servers
(`flow.bati.ai`), what it's used for, and how to opt out.

---

## What we collect

### 1. Anonymous launch ping (always, unless disabled)

Sent once per app launch to count active users and detect crashes. **No personal content.**

| Field | Example | Purpose |
|---|---|---|
| `device_id` | `7F9A3B2C-...` (macOS hardware UUID hash) | De-duplicate launches per device |
| `version` | `0.8.9` | Version adoption, rollout health |
| `os_version` | `macOS 15.0` | macOS compatibility targeting |
| `arch` | `arm64` | Apple Silicon vs Intel split |
| `locale` | `ko` / `en` | Localization priority |
| `timezone` | `Asia/Seoul` | Roll-up region (not a precise location) |
| `total_memory_gb` / `cpu_cores` / `cpu_model` | `48` / `16` / `"Apple M4 Max"` | Hardware tier for AI model recommendations |
| `screen_width` / `screen_height` | `3024` / `1964` | UI layout sizing |

### 2. Anonymous community benchmarks (opt-out, default ON)

When you run a local AI model, its speed (`tokens/second`) is optionally submitted to a
**community aggregate** so other users with similar Macs can see realistic performance estimates.

| Field | Example | Purpose |
|---|---|---|
| `device_id` | hashed UUID | Count unique contributors (never displayed) |
| `cpu_model` | `"Apple M4 Max"` | Group by hardware |
| `ram_tier` | `48` (GB) | Group by memory |
| `model` | `batiai/qwen3.6-35b:iq4` | Group by AI model |
| `eval_tok_s` | `46.5` | Speed measurement |
| `prompt_tok_s` | `212.3` | Prompt processing speed |

**Aggregation protects individuals**: Community statistics are only shown when **≥3 unique devices**
have contributed to a given `(CPU, RAM tier, model)` group. Nothing about a single device is ever
exposed in the UI or API.

### 3. Anonymous tool-usage counts (opt-out, default ON)

Aggregated daily counts of which built-in tools were invoked (e.g. "kakao_send: 12"). **No
message content, no contact names, no file paths.**

---

## What we never collect

- ❌ Your name, email, IP address, or geographic location beyond timezone
- ❌ Messages, chat content, file contents, clipboard, screen contents
- ❌ Contact names, phone numbers, email addresses
- ❌ Browser history, cookies, form data
- ❌ AI prompts or AI responses
- ❌ Recorded workflows, automation scripts, or tool arguments

Cloud AI requests (Claude / OpenAI / Gemini / Ollama Cloud) go **directly from your Mac to the
provider** — BatiFlow servers never see prompts or responses.

---

## How to opt out

**Settings → Info → Privacy → Share anonymous performance data**

Toggle OFF to immediately stop all benchmark submissions. The app continues to work fully;
only the community comparison view is hidden.

To disable the launch ping as well (advanced):

```bash
defaults write ai.bati.batiflow telemetry_enabled -bool false
```

---

## Data retention & deletion

- **Launch pings**: retained indefinitely for version-adoption analytics (no per-user
  aggregation beyond counters).
- **Benchmark submissions**: retained indefinitely as part of the community aggregates.
  Individual rows are never exposed — only group percentiles.
- **Tool usage counts**: retained 1 year, then aggregated into year-level counters.

### Deletion requests (GDPR Article 17 / CCPA §1798.105)

If you would like your `device_id`'s data removed from our systems, email
**privacy@bati.ai** with:

1. Your `device_id`, shown in **Settings → Info → Privacy → View my device ID**
2. The type of data to delete (benchmarks / pings / all)

We respond within **30 days** as required by applicable law. There is no automated self-serve
delete UI at this time — we evaluated this against actual request volume and concluded an
email workflow is proportionate for the data's sensitivity (no PII, k-anonymized aggregates).
We will add a self-serve flow if request volume indicates it is needed.

---

## Contact

- **Email**: privacy@bati.ai
- **Source code**: https://github.com/batiai/batiflow
- **Policy changes**: tracked in the git history of this file

_Last updated: 2026-04-19_
