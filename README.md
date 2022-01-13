# app

app is an attempt of a simple universal package manager with the following
premises:

* should have no dependencies, should be able to run just with something like
  busybox installed
* should work in such a way that the user can do any of the package manager
  functions trivially
* should allow for the developer to make it work with any programming language
* a user should be able to install the package without reading any documentation

This implies that:

* app is written in POSIX shell
* app is based on scripts such as `install.sh`, `build.sh`, `test.sh`
* there are very minimal restrictions in terms of what the scripts can do as
  long as they accomplish their purpose

## Dependencies

* `/bin/sh` 

## Getting Started

To get `app` up and running:

```bash
# Pull the repo
git clone https://github.com/cristianrz/app.git
cd app

# Build 
sh scripts/build.sh

# edit the path where you want app installed
vi scripts/install.sh

# Install
$ sh scripts/install.sh
```

To start using it:

```bash
# Pull a package
app pull https://github.com/cristianrz/hello-world/archive/refs/tags/v0.0.1.tar.gz
cd hello-world-0.0.1

# Build it
app build

# Edit install directory
vi scripts/install.sh

# and install
app install
```

Available commands:

```terminal
$ app                                                                               
Usage: app [COMMAND]

Commands:
	build    Builds the package
	chroot   Creates a chroot with the package
	help     Shows this help
	init     Initialises the package
	install  Installs the package
	pull     Downloads a package from a git repository
	run      Runs the package
	test     Tests the package
```

Detailed usage on the [wiki](https://cristianrz.github.io/app/).

## Authors

  * [cristianrz](https://github.com/cristianrz)

See also the list of
[contributors](https://github.com/cristianrz/app/contributors)
who participated in this project.

## License

See the [LICENSE](LICENSE) file for details
