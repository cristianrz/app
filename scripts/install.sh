#!/bin/sh
set -eu

VERSION="$(cat VERSION)"

PREFIX="/usr/local/stow/app-$VERSION/bin"

mkdir -p "$PREFIX"

cp build/* "$PREFIX"

cd "/usr/local/stow"

stow "app-$VERSION"
