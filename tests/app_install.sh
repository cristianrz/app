#!/bin/sh

set -eu

rm -rf testapp
mkdir testapp
cd testapp

printf '\n\n\n\n' | ../build/app init

[ -f README.md ]

result="$(../build/app install 2>&1 || true)"

case "$result" in
TODO*install*) exit 0 ;;
*) exit 1 ;;
esac


