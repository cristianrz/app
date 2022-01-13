#!/bin/sh

set -eu

rm -rf hello-world-0.0.1

./build/app pull https://github.com/cristianrz/hello-world/archive/refs/tags/v0.0.1.tar.gz

[ -f hello-world-0.0.1/src/main.sh ]