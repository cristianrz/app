#!/bin/sh

set -eu

init_test() {

	cat <<'EOF' >"scripts/test.sh"
#!/bin/sh

set -eu

pass=0
fail=0

arg="${1-}"

# runs a command without outputting anything to terminal
quiet(){
	case "x$arg" in
		x-v) "$@" ;;
		*) "$@" >/dev/null 2>&1 ;;
	esac
}

run_test(){
	quiet printf '\tRunning %s...\n' "$1"
	if quiet sh "$1"; then
		printf '\e[42m\e[30m PASS \e[39m\e[49m %s\n' "$1"
		: "$((pass+=1))"
	else
		printf '\e[41m\e[30m FAIL \e[39m\e[49m %s\n' "$1"
		: "$((fail+=1))"
	fi
}

for test in ./tests/*; do
	run_test "$test"
done

printf '\nRan %d tests, %d passed, %d failed (%d%% pass).\n' "$((pass+fail))" "$((pass))" "$((fail))" "$((100*pass/(pass+fail)))"
EOF
}

init_index() {
	cat <<EOF >"docs/index.md"
# Introduction to $project

TODO: write [great documentation](http://jacobian.org/writing/what-to-write/)
EOF
}

init_readme() {
	cat <<EOF >README.md
# $project

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on
your local machine for development and testing purposes. See deployment
for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* Give examples

### Installing

A step by step series of examples that tell you how to get a development
env running

Say what the step will be

	 Give the example

And repeat

	 until finished

End with an example of getting some data out of the system or using it
for a little demo

### How to use

How to use the program.

## Authors

  * [$user](https://github.com/$user)

See also the list of
[contributors](https://github.com/$user/$project/contributors)
who participated in this project.

## License

See the [LICENSE](LICENSE) file for details
EOF
}

init_license() {
	cat <<EOF >LICENSE
BSD 3-Clause License

Copyright (c) $(date +"%Y"), $user
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
	list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
	this list of conditions and the following disclaimer in the documentation
	and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
	contributors may be used to endorse or promote products derived from
	this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
EOF
}

init() {
	dirname="$(basename "$(pwd)")"
	printf 'Project name [%s]: ' "$dirname" && read -r project
	: "${project:=$dirname}"

	# printf 'Run command [bash]: ' && read -r run
	# : "${run:=bash}"

	printf 'Source file extension [sh]: ' && read -r ext
	: "${ext:=sh}"

	# printf 'Compile command [cp]: ' && read -r build
	# : "${build:=cat}"

	printf 'Username [%s]: ' "$(whoami)" && read -r user
	: "${user:=$(whoami)}"

	# URL="https://github.com/$user/$project"

	mkdir -p "docs" \
		"src" \
		"tests" \
		"scripts"

	for script in "scripts/install.sh" "scripts/chroot.sh" "scripts/run.sh" "tests/test.$ext"; do
		if [ -f "$script" ]; then
			printf "%s already exists. Exiting." "$script" >&2
			exit 1
		fi

		echo "echo 'TODO: $script script.'; exit 1" >"$script"
	done

	echo "mkdir build" >"scripts/build.sh"
	echo "v0.0.1" > "VERSION"

	touch "src/main.$ext" "test.sh"


	git init >/dev/null 2>&1

	init_index
	init_license
	init_readme
	init_test

	printf 'build/\nbuild/*\n' >.gitignore

}

pull(){
	FILE="$(basename "$1")"
	wget "$1"

	tar xzf "$FILE"
	rm "$FILE"
}

PROGRAM="$(basename "$0")"

[ "$#" -eq 0 ] && set -- help

case "$1" in
build) sh scripts/build.sh ;;
init) init ;;
install) sh scripts/install.sh ;;
run) sh scripts/run.sh ;;
test) sh scripts/test.sh ;;
chroot) sh scripts/chroot.sh ;;
pull) shift && pull "$@" ;;
*)
	cat <<EOF
Usage: $PROGRAM [COMMAND]

Commands:
	build    Builds the package
	chroot   Creates a chroot with the package
	help     Shows this help
	init     Initialises the package
	install  Installs the package
	pull     Downloads a package from a git repository
	run      Runs the package
	test     Tests the package
EOF
	;;
esac