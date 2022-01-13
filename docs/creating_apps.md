# How to create apps

In general the easiest way to create packages is to use `app init`, however the
open nature of `app` makes it so that it is necessary to establish some guidelines
on creating `app` packages.

## Directory structure

`app` packages shall have the following directory:

```
.
├── docs
│   └── index.md
├── README.md
├── scripts
│   ├── build.sh
│   ├── chroot.sh
│   ├── install.sh
│   ├── run.sh
│   └── test.sh
├── src
│   └── main.c
├── tests
│   └── test1.sh
└── VERSION
```

The following sections go in detail about the contents of the `app`-specific files.

## scripts/build.sh

This file is run when using `app build`.

This should be a POSIX shell script that after being run, compiles (or copies,
in case of interpreted languages) the necessary files to run the program and
places them in `./build`.

## scripts/chroot.sh

This file is run when using `app chroot`.

This should be a POSIX shell script that after being run, creates a chroot that
has all dependencies needed to run the program, similar to a container. It does
not necessarily need to make the mounts such as `/dev` and it does not need to
enter the chroot, but only build it.

A `PREFIX` variable shall be set at the beginning of the document where the user
can configure where to place the chroot.

## scripts/install.sh

This file is run when using `app install`.

This should be a POSIX shell script that after being run, assuming `./build`
already contains the built program, installs the program.

A `PREFIX` variable shall be set at the beginning of the document where the user
can configure where to install the program.

Install shall install under `PREFIX` a folder with the structure
`[appname]-[version]` and to include all the dependencies necessary for the
program to run. In this way, multiple version of the program can run in parallel
and it will not affect other programs. Then, either a shell script or a symlink
shall be placed on `$PREFIX/bin` that starts the program.

## scripts/run.sh

This file is run when using `app run`.

This should be a POSIX shell script that after being run, builds the program on
runs it on the fly, passing command-line arguments to the program.

## script/test.sh

This file is run when using `app test`.

Given that tests are usually not going to be run by users but rather by
developers, there are not stringent rules for this. However, `app init` provides
a script that will run all tests inside `./tests` (also shell scripts) and
output a summary of failed and passed tests.

## src/main.c

The main source file that will load other files/libraries.

## VERSION

Plain text file containing only the program version. This can be used to create
the respective directory when using `app install`.