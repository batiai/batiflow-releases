#!/bin/bash
set -e

APP_NAME="BatiFlow"
DMG_URL="https://github.com/batiai/batiflow-releases/releases/latest/download/BatiFlow.dmg"
DMG_PATH="/tmp/${APP_NAME}.dmg"
MOUNT_DIR="/tmp/${APP_NAME}_mount"

echo ""
echo "  ⚡ ${APP_NAME} 설치를 시작합니다..."
echo ""

# 1. Download
echo "  📥 다운로드 중..."
curl -sL "$DMG_URL" -o "$DMG_PATH"
echo "  ✅ 다운로드 완료"

# 2. Remove quarantine
xattr -cr "$DMG_PATH" 2>/dev/null

# 3. Mount DMG
echo "  📦 설치 중..."
hdiutil attach "$DMG_PATH" -mountpoint "$MOUNT_DIR" -quiet 2>/dev/null

# 4. Copy to Applications (remove old version first)
rm -rf "/Applications/${APP_NAME}.app"
cp -r "${MOUNT_DIR}/${APP_NAME}.app" "/Applications/${APP_NAME}.app"
xattr -cr "/Applications/${APP_NAME}.app" 2>/dev/null

# 5. Unmount & cleanup
hdiutil detach "$MOUNT_DIR" -quiet 2>/dev/null
rm -f "$DMG_PATH"

echo "  ✅ 설치 완료: /Applications/${APP_NAME}.app"
echo ""
echo "  🚀 실행하려면:"
echo "     open /Applications/${APP_NAME}.app"
echo ""
echo "  ⚠️  최초 실행 시 접근성 권한 허용이 필요합니다."
echo "     (시스템 설정 > 개인정보 보호 및 보안 > 접근성)"
echo ""

# 6. Ask to launch
read -p "  지금 실행할까요? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    open "/Applications/${APP_NAME}.app"
fi
