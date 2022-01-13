#!/bin/sh

set -eu

rm -rf testapp

mkdir testapp
cd testapp

printf '\n\n\n' | ../build/app init

[ -f README.md ]