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
echo "  🚀 BatiFlow를 실행합니다..."
echo "  ⚠️  최초 실행 시 접근성 권한 허용이 필요합니다."
echo ""

open "/Applications/${APP_NAME}.app"
