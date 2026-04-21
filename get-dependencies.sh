#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    boost           \
    boost-libs      \
    fluidsynth      \
    gtksourceview5  \
    kvantum         \
    libadwaita      \
    libbacktrace    \
    libcyaml        \
    liblo           \
    libpanel        \
    lxqt-qtplugin   \
    ninja           \
    pipewire-audio  \
    pipewire-jack   \
    qt5-base        \
    qt6-base        \
    qt6ct           \
    rtaudio         \
    rtmidi          \
    rubberband      \
    sdl2            \
    vamp-plugin-sdk \
    yyjson

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package lsp-dsp-lib
make-aur-package carla-git
make-aur-package zrythm

# If the application needs to be manually built that has to be done down here

# if you also have to make nightly releases check for DEVEL_RELEASE = 1
#
# if [ "${DEVEL_RELEASE-}" = 1 ]; then
# 	nightly build steps
# else
# 	regular build steps
# fi
