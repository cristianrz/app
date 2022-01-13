# Introduction

app is an attempt of a simple universal package manager with the following
premises:

* should have no dependencies, should be able to run just with something like
  busybox installed
* should work in such a way that the user can do any of the package manager
  functions trivially
* should allow for the developer to make it work with any programming language

This implies that:

* app is written in POSIX shell
* app is based on scripts such as `install.sh`, `build.sh`, `test.sh`
* there are very minimal restrictions in terms of what the scripts can do as
  long as they accomplish their purpose

