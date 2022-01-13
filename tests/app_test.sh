#!/bin/sh

set -eu

rm -rf testapp
mkdir testapp
cd testapp

printf '\n\n\n\n' | ../build/app init

[ -f README.md ]

result="$(../build/app test 2>&1 || true)"

case "$result" in
*FAIL*) exit 0 ;;
*) exit 1 ;;
esac


