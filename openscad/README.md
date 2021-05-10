# OpenSCAD Docker Image

Installs `openscad` and a few dependencies useful dependencies. Notably, `Xvfb` is installed to work around a
[known limitation](https://github.com/openscad/openscad/issues/1798) that PNG generation requires a running X server.
This is
[how OpenSCAD tests PNG rendering](https://github.com/openscad/openscad/blob/d1c445d4c74272abd17c5e52af460dbd249b1d4a/doc/testing.txt).

The easiest way to run `Xvfb` is via [`xvfb-run`](https://manpages.debian.org/xvfb-run), like so:

```shell
$ docker run -v $PWD:/mnt dimo414/openscad xvfb-run openscad -o /mnt/render.png /mnt/example.scad
```

Most other invocations to `openscad` don't require an X server and therefore can be run without `xvfb-run` (though doing
so is fairly harmless):

```shell
$ docker run -v $PWD:/mnt dimo414/openscad openscad -o /mnt/render.stl /mnt/example.scad
```

## Alternatives

Although OpenSCAD uses Docker for CI, there are presently
[no official user-facing images](https://github.com/openscad/docker-openscad/issues/3#issuecomment-587078923).
It's straightforward to create a custom image with `apt-get install openscad` (or similar), but this does not support
PNGs or other invocations that require an X server.

There are other unofficial images such as [`bbassett/openscad`](https://hub.docker.com/r/bbassett/openscad/) and
[`wtnb75/openscad`](https://hub.docker.com/r/wtnb75/openscad) however neither appears to support running an
X server.
