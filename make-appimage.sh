#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q zrythm | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/org.zrythm.Zrythm.svg
export DESKTOP=/usr/share/applications/org.zrythm.Zrythm.desktop
export DEPLOY_QT=1

# Deploy dependencies /usr/bin/zrythm_launch
quick-sharun /usr/bin/zrythm /usr/lib/zrythm

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the test fails due to the app
# having issues running in the CI use --simple-test instead
quick-sharun --test ./dist/*.AppImage
