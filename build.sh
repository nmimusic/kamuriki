#!/bin/bash
#SPDX-License-Identifier: BSD-3-Clause
#Copyright (C) 2021-2024 Nakamura Musical Industries

source profiledef.sh

lb config \
	--apt apt \
	--architecture "${ARCH}" \
	--distribution "${UPSTREAM}"  \
	--firmware-chroot false \
	--archive-areas "main contrib non-free non-free-firmware" \
	--mirror-bootstrap "${MIRROR}" \
	--mirror-chroot "${MIRROR}" \
	--debconf-frontend noninteractive \
	--bootappend-live "boot=live quiet splash components locales=C.UTF-8 timezone=Asia/Tokyo debug=1" \
	--architecture "${ARCH}" \
	--binary-image "${BINARY_IMG}" \
	--image-name "${ISO_NAME}-${ISO_VERSION}"

wget -q -O config/archives/kamuriki.key.chroot https://master.dl.sourceforge.net/project/kamurikilinux/kamuriki-archive.key
cp config/archives/kamuriki.key.chroot config/archives/kamuriki.key.binary
wget -q -O config/archives/winehq.key.chroot https://dl.winehq.org/wine-builds/winehq.key
cp config/archives/winehq.key.chroot config/archives/winehq.key.binary

sudo lb bootstrap
sudo lb chroot
sudo lb binary
