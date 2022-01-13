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

## `scripts/build.sh`

This should be a POSIX shell script that after being run, compiles (or copies,
in case of interpreted languages) the necessary files to run the program and
places them in `./build`.

## `scripts/chroot.sh`

This should be a POSIX shell script that after being run, creates a chroot that
has all dependencies needed to run the program, similar to a container. It does
not necessarily need to make the mounts such as `/dev` and it does not need to
enter the chroot, but only build it.

A `PREFIX` variable shall be set at the beginning of the document where the user
can configure where to place the chroot.

