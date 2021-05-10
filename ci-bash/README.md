# Bash Continuous Integration Image

[
![Docker Build Status](https://img.shields.io/docker/cloud/build/dimo414/ci-bash)
![Docker Pulls](https://img.shields.io/docker/pulls/dimo414/ci-bash)
![Docker Image Size](https://img.shields.io/docker/image-size/dimo414/ci-bash)
](https://hub.docker.com/r/dimo414/ci-bash)

This image enables testing of Bash scripts and related shell utilities.

## Features

* Includes stable `bash` builds at different versions
  (in addition to the default shell which is configured in dimo414/base).
   * `5.0` as `bash-5`
   * `4.4.18` as `bash-4`
   * `3.2.57` as `bash-3`

  *Note: minor version numbers are subject to change*
* [`bats`](https://github.com/bats-core/bats-core), a bash unit testing framework
* [`shellcheck`](https://www.shellcheck.net/), a shell linter

