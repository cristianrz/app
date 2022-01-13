#!/bin/sh
set -eu

rm -rf build

mkdir build

cp src/main.sh build/app
chmod +x build/app
