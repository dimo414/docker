# Bash Continuous Integration Image

This image enables testing of Bash scripts and related shell utilities.

## Features

* Includes Bash 3.2.57 (in addition to the default shell which is configured in dimo414/base); the
 `BASH_3` environment variable points to the built `bash` binary
* Adds [`bats`](https://github.com/sstephenson/bats) to the `PATH`

