#!/bin/bash
set -e

APP_NAME="BatiFlow"
DMG_URL="https://github.com/batiai/batiflow-releases/releases/latest/download/BatiFlow.dmg"
DMG_PATH="/tmp/${APP_NAME}.dmg"
MOUNT_DIR="/tmp/${APP_NAME}_mount"

echo ""
echo "  ⚡ ${APP_NAME} 설치를 시작합니다..."
echo ""

echo "  📥 다운로드 중..."
curl -sL "$DMG_URL" -o "$DMG_PATH"
echo "  ✅ 다운로드 완료"

xattr -cr "$DMG_PATH" 2>/dev/null

echo "  📦 설치 중..."
hdiutil attach "$DMG_PATH" -mountpoint "$MOUNT_DIR" -quiet 2>/dev/null

rm -rf "/Applications/${APP_NAME}.app"
cp -r "${MOUNT_DIR}/${APP_NAME}.app" "/Applications/${APP_NAME}.app"
xattr -cr "/Applications/${APP_NAME}.app" 2>/dev/null

hdiutil detach "$MOUNT_DIR" -quiet 2>/dev/null
rm -f "$DMG_PATH"

echo "  ✅ 설치 완료!"
echo ""
echo "  ────────────────────────────────────────"
echo "  📌 접근성 권한 설정 (최초 1회)"
echo "  ────────────────────────────────────────"
echo ""
echo "  BatiFlow가 카카오톡 등 다른 앱을 제어하려면"
echo "  접근성 권한이 필요합니다."
echo ""
echo "  시스템 설정 > 개인정보 보호 및 보안 > 접근성에서"
echo "  아래 두 항목을 모두 허용해주세요:"
echo ""
echo "    ✅ BatiFlow (앱 자체)"
echo "    ✅ 터미널 (또는 iTerm 등 사용 중인 터미널 앱)"
echo ""
echo "  권한 변경 후 터미널을 재시작해야 적용됩니다."
echo "  ────────────────────────────────────────"
echo ""
echo "  🚀 BatiFlow를 실행합니다..."

open "/Applications/${APP_NAME}.app"
