#!/bin/bash
# A lot of packages in this script is from FEX-Emu, so give your thanks and stars to them
# https://github.com/FEX-Emu/FEX/
apt-get update
dpkg --add-architecture i386
apt-get install -y software-properties-common

add-apt-repository -y ppa:kisak/kisak-mesa
apt-get update
apt-get upgrade -y
apt-get install -y sudo file lsof pkexec policykit-1 rsync apt-utils lsb-release libc-bin libc6:i386 dbus systemd pulseaudio libgles1 libgles2 libglx-mesa0 libgl1-mesa-dri libglx-mesa0 libglvnd-dev libglvnd-dev:i386 libglu1-mesa libegl1 libegl1:i386 mesa-utils libunwind8 libsdl1.2debian libsdl2-2.0-0 protobuf-compiler libprotobuf-c1 libopenal1 libjpeg8 libjpeg8:i386 libjpeg62 libjpeg62:i386 libspeex1 libspeex1:i386 libvorbisfile3 libvorbisfile3:i386 libgles1:i386 libgles2:i386 libglx-mesa0:i386 libgl1-mesa-dri:i386 libglx-mesa0:i386 libglu1-mesa:i386 libunwind8:i386 libsdl1.2debian:i386 libsdl2-2.0-0:i386 libasound2-plugins:i386 usbutils pciutils libpciaccess0 libpciaccess0:i386 libpciaccess-dev libpciaccess-dev:i386 libglew2.2 libxcb1 libxcb-cursor0 libxcb-imdkit1 libxcb-xrm0 libxcb-composite0 libxcb-dri2-0 libxcb-dri3-0 libxcb-dpms0 libxcb-glx0 libxcb-shm0 libxcb-damage0 libxcb-shape0 libxcb-xinput0 libxcb-icccm4 libxcb-image0 libxcb-util1 libxcb-keysyms1 libxcb-xinerama0 libxcb-xkb1 libxcb-render0 libxkbcommon-x11-0 libxcb1:i386 libxcb-composite0:i386 libxcb-dri2-0:i386 libxcb-dri3-0:i386 libxcb-dpms0:i386 libxcb-glx0:i386 libxcb-shm0:i386 libxcb-damage0:i386 libxcb-shape0:i386 libxcb-xinput0:i386 libxcb-icccm4:i386 libxcb-image0:i386 libxcb-util1:i386 libxcb-keysyms1:i386 libxcb-xinerama0:i386 libxcb-xkb1:i386 libxcb-render0:i386 libxkbcommon-x11-0:i386 libwayland-client0:i386 libwayland-dev:i386 libwayland-egl-backend-dev:i386 libx11-dev:i386 libxext-dev:i386 libxdamage-dev:i386 libx11-xcb-dev:i386 libxcb-present0:i386 libxshmfence1:i386 libxxf86vm1:i386 libxrandr2:i386 libllvm14 libllvm16 libllvm14:i386 libllvm16:i386 libva2 libva2:i386 libva-x11-2 libva-x11-2:i386 libharfbuzz0b libharfbuzz0b:i386 libvdpau1 libvdpau1:i386 mesa-vdpau-drivers mesa-vdpau-drivers:i386 libfuse2 libfuse2:i386 libopenal1 libopenal1:i386 libibus-1.0-5 libibus-1.0-5:i386 locales language-pack-en-base mangohud libnss3 libnspr4 python3 python3-apt libssl3 libssl3:i386 curl xterm zenity xz-utils xdg-desktop-portal xdg-desktop-portal-gtk wine64 wine32 glibc-tools vulkan-tools pkgconf pkgconf:i386 clinfo gir1.2-gtk-3.0 mesa-va-drivers mesa-vdpau-drivers mesa-vulkan-drivers libglx-mesa0 libgl1-mesa-dri libegl-mesa0
apt-get upgrade -y

# Create a .tar.gz inside the container while excluding the tempfs directories
touch archive.tar.gz
tar  --exclude=archive.tar.gz --exclude=./media --exclude=./mnt --exclude=./root --exclude=./srv --exclude=./boot --exclude=./home --exclude=./run --exclude=./proc --exclude=./sys --exclude=./dev --exclude=./tmp --exclude=./.dockerenv -czf archive.tar.gz .
