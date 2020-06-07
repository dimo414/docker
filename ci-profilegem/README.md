# ProfileGem Continuous Integration Image

[
![Docker Build Status](https://img.shields.io/docker/build/dimo414/ci-profilegem)
![Docker Pulls](https://img.shields.io/docker/pulls/dimo414/ci-profilegem)
![Docker Image Size](https://img.shields.io/docker/image-size/dimo414/ci-profilegem)
](https://hub.docker.com/r/dimo414/ci-profilegem)

This image enables testing of [ProfileGem](https://github.com/dimo414/ProfileGem) and custom gems.

**Note:** this image will likely be removed and the scripts listed below replaced with utilities
in the ProfileGem repo itself.

## Features

* Sets `_PGEM_DEBUG=true` for ProfileGem debug output

## Scripts

* `/pgem_test/pgem_test.sh`: Tests a ProfileGem installation
* `/pgem_test/gem_test.sh`:  Tests one or more gems (passed as arguments)

