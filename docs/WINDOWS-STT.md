> **🎉 업데이트: 이제 Windows 전용 앱이 있습니다 — [BatiSay 받아쓰기](https://github.com/batiai/batisay-releases)**
> 드래그드롭 받아쓰기 + 화자분리 + 타임스탬프 재생을 설치 한 번으로. 아래 CLI 방법은 고급 사용자용으로 남겨둡니다.

# Windows에서 BatiFlow 한국어 음성인식(batisay) 쓰기

> BatiFlow 앱은 현재 macOS 전용이지만, **음성인식 모델(batisay)은 공개되어 있어 Windows에서도 그대로 쓸 수 있습니다.**
> 오픈소스 엔진 [whisper.cpp](https://github.com/ggml-org/whisper.cpp) + BatiAI의 한국어 특화 모델 조합으로, 설치 5분이면 완전 온디바이스(오프라인) 전사가 됩니다 — 오디오가 PC 밖으로 나가지 않습니다.

## 준비물 (다운로드 2개)

### 1) whisper.cpp Windows 실행파일
[whisper.cpp Releases](https://github.com/ggml-org/whisper.cpp/releases) 에서 PC에 맞는 zip 하나:

| 파일 | 대상 |
|------|------|
| `whisper-bin-x64.zip` | **일반 PC (CPU)** — 대부분 이걸로 충분 |
| `whisper-cublas-12.4.0-bin-x64.zip` | NVIDIA GPU 있는 PC — 수 배 빠름 (CUDA 12) |

압축을 원하는 폴더(예: `C:\batisay`)에 풉니다. 안에 `whisper-cli.exe` 가 있습니다.
실행이 안 되면 [Microsoft Visual C++ 재배포 패키지](https://aka.ms/vs/17/release/vc_redist.x64.exe)를 설치하세요.

### 2) batisay 한국어 모델 (1회, ~547MB)
BatiAI가 통화·회의 한국어에 맞게 파인튜닝한 모델입니다 (HuggingFace 공개, 계정 불필요):

- **[ggml-batisay-ko-turbo-q5_0.bin 다운로드](https://huggingface.co/batiai/batisay-ko-turbo/resolve/main/ggml-batisay-ko-turbo-q5_0.bin)** ← 권장 (속도·정확도 균형)
- 더 높은 정확도가 필요하면 [q8_0](https://huggingface.co/batiai/batisay-ko-turbo/resolve/main/ggml-batisay-ko-turbo-q8_0.bin) (~830MB)

받은 `.bin` 파일을 `whisper-cli.exe` 와 같은 폴더에 둡니다.

## 사용법

명령 프롬프트(cmd)나 PowerShell에서, 압축 푼 폴더로 이동 후:

```bat
cd C:\batisay
whisper-cli.exe -m ggml-batisay-ko-turbo-q5_0.bin -l ko --max-context 0 --suppress-nst -f 녹음파일.mp3
```

- `--max-context 0 --suppress-nst` : **통화·회의 등 긴 녹음 품질 옵션** (반복 환각·숫자 누락 방지 — BatiFlow 앱과 동일 설정)
- 결과를 파일로 저장하려면 뒤에 붙이기:
  - `-otxt` → `녹음파일.mp3.txt` (텍스트)
  - `-osrt` → `녹음파일.mp3.srt` (자막, 타임스탬프)

### 지원 오디오 형식
`wav / mp3 / flac / ogg` 는 바로 됩니다. **`m4a / aac`(휴대폰 통화녹음)** 는 먼저 변환이 필요합니다 — [ffmpeg](https://www.gyan.dev/ffmpeg/builds/) 설치 후:

```bat
ffmpeg -i "통화 녹음.m4a" -ar 16000 -ac 1 녹음.wav
whisper-cli.exe -m ggml-batisay-ko-turbo-q5_0.bin -l ko --max-context 0 --suppress-nst -f 녹음.wav -otxt
```

## 자주 묻는 질문

**Q. 인터넷이 필요한가요?**
아니요. 다운로드 2개만 받으면 이후 전사는 완전 오프라인입니다. 오디오가 어디로도 전송되지 않습니다.

**Q. 화자분리(누가 말했는지)도 되나요?**
이 가이드는 전사(받아쓰기)까지입니다. 화자분리는 현재 macOS 앱(BatiFlow)에서 지원합니다.

**Q. 속도는?**
CPU 기준 실시간보다 빠르고(대략 수 배속), NVIDIA GPU(cublas 빌드)면 수십 배속입니다.

**Q. 상업적 사용 가능한가요?**
batisay 모델의 라이선스는 [HuggingFace 모델 페이지](https://huggingface.co/batiai/batisay-ko-turbo)를 확인하세요.

---
문의: [batiflow-releases Issues](https://github.com/batiai/batiflow-releases/issues) · bati.ai
