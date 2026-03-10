#!/bin/sh
PATH=$PATH:/usr/sbin

systemctl enable lightdm
dpkg-reconfigure wine-stable-amd64 wine-stable-i386 wine-stable
