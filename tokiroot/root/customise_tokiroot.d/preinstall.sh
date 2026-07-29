#!/bin/sh
export PATH=/usr/bin:/usr/local/bin:/usr/sbin

wget -O - https://dl.winehq.org/wine-builds/winehq.key | gpg --dearmor -o /etc/apt/keyrings/winehq-archive.key -
