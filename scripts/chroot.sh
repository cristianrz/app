#!/bin/sh

set -eu
HERE="$(pwd)"

PREFIX="/mnt/app"

mkdir -p "$PREFIX"

cd "$PREFIX"

wget 'https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/aarch64/alpine-minirootfs-3.15.0-aarch64.tar.gz'

tar xzvf alpine-minirootfs-3.15.0-aarch64.tar.gz

rm *tar.gz

mount -t      proc  /proc "$PREFIX/proc"
mount -t      sysfs /sys  "$PREFIX/sys"
mount --rbind       /dev  "$PREFIX/dev"
mount --rbind       /run  "$PREFIX/run"

cp /etc/resolv.conf etc/resolv.conf

cp "$HERE/build/app" "$PREFIX/usr/local/bin"

chroot "$PREFIX" /bin/ash -l
