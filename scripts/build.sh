#!/bin/sh
set -eu

sh scripts/clean.sh

mkdir build

cp src/main.sh build/app
chmod +x build/app
