#!/bin/sh
set -eu

PREFIX="/usr/local"

VERSION="$(cat VERSION)"
APPDIR="$PREFIX/app-$VERSION"

mkdir -p "$APPDIR"

cp build/* "$APPDIR"

cd "$PREFIX/bin"

ln -s ../app-$VERSION/app app
