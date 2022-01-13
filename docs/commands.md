# Commands

## Build

```bash
app build
```

Builds the program on `./build`

## Chroot

```bash
app chroot
```

Creates a chroot with the program on `PREFIX`, set in `scripts/chroot.sh`.

Directories like `/proc` and `/sys` might not be mounted automatically, it's
recommended to:

```bash
mount -t proc /proc "$PREFIX"/proc/
mount -t sysfs /sys "$PREFIX"/sys/
mount --rbind /dev "$PREFIX"/dev/
mount --rbind /run "$PREFIX"/run/

cp /etc/resolv.conf "$PREFIX"/etc/resolv.conf
```

## Init

```bash
app init
```

Initialises a repository to build `app` packages.


## Install

```bash
app install
```

Install the program on `PREFIX`, set in `scripts/install.sh`.

## Pull

```bash
app pull https://my-site.com/my-package.tar.gz
```

Pulls a `.tar.gz` file containing an `app` package and extracts it.

## Run

```bash
app run
```

Runs the program and passes the arguments.

## Test

```bash
app test
```

By default runs all the tests in `./tests`, however this is up to the developer.



