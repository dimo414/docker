# Base Image

[
![Docker Build Status](https://img.shields.io/docker/cloud/build/dimo414/base)
![Docker Pulls](https://img.shields.io/docker/pulls/dimo414/base)
![Docker Image Size](https://img.shields.io/docker/image-size/dimo414/base)
](https://hub.docker.com/r/dimo414/base)

This is the base image for all Docker images in this repository.

This image should *only* be used by other images in this repository - not
directly by other applications - and is subject to breaking changes (e.g.
a step may be moved into a "public" sub-image). Sub-images that need no
additional functionality may simply `FROM` this image with no other changes.

## Features

* Sets the system language to `en_US.UTF-8` to support UTF-8 / Unicode.
* Installs several core utilities such as Mercurial and Java, see the
  Dockerfile for details.
* Creates a `/dimo414` directory and makes it the `WORKDIR`, sub-images can use
  this directory to store executables and data.

