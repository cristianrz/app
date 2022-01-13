# Getting started

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

