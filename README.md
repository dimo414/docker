# Docker Images

This repo contains Docker images, primarily for use with GitHub Actions.

The images are available on [Docker Hub](https://hub.docker.com/u/dimo414/).

## Updating Images

Unfortunately Docker Hub shut down remote builds for free accounts, so they now
have to be built by hand. To do so build, tag, and push a given repo:

```shell
$ docker build [FOO] --tag dimo414/[FOO]
$ docker push dimo414/[FOO]
```
