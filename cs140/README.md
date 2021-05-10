# Stanford CS140 - Operating Systems

[
![Docker Build Status](https://img.shields.io/docker/cloud/build/dimo414/cs140)
![Docker Pulls](https://img.shields.io/docker/pulls/dimo414/cs140)
![Docker Image Size](https://img.shields.io/docker/image-size/dimo414/cs140)
](https://hub.docker.com/r/dimo414/cs140)

Docker image that's able to build and test all the assignments for
[CS140](http://cs140.stanford.edu) (Winter '18).

## Caveats

This image has been tested with a slightly modified version of Pintos from the one provided via
http://www.scs.stanford.edu/18wi-cs140/:

Two upstream patches must be applied:

* [support modern Perl](http://pintos-os.org/cgi-bin/gitweb.cgi?p=pintos-anon;a=commitdiff;h=fd2a5afa946474ba0839de0e9da238dbaecbd6a5)
* [support modern GCC](http://pintos-os.org/cgi-bin/gitweb.cgi?p=pintos-anon;a=commitdiff;h=21848a29ff6f6d52751bd91463be03b790f6e3e5)

To use `src/utils/pintos-gdb` apply this patch, so the `gdb-macros` can be found automatically:

    diff --git a/src/utils/pintos-gdb b/src/utils/pintos-gdb
    index 4ef38d3..288318a 100755
    --- a/src/utils/pintos-gdb
    +++ b/src/utils/pintos-gdb
    @@ -1,7 +1,10 @@
    -#! /bin/sh
    +#! /bin/bash

    -# Path to GDB macros file.  Customize for your site.
    -GDBMACROS=/usr/class/cs140/pintos/pintos/src/misc/gdb-macros
    +# https://stackoverflow.com/a/246128/113632
    +SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    +
    +# Path to GDB macros file.
    +GDBMACROS="$SOURCE_DIR/../misc/gdb-macros"

     # Choose correct GDB.
     if command -v i386-elf-gdb >/dev/null 2>&1; then

To support the `-v` flag apply this patch:

    diff --git a/src/threads/init.c b/src/threads/init.c
    index cebec2c..0964565 100644
    --- a/src/threads/init.c
    +++ b/src/threads/init.c
   @@ -233,8 +233,10 @@ parse_options (char **argv)
           char *save_ptr;
           char *name = strtok_r (*argv, "=", &save_ptr);
           char *value = strtok_r (NULL, "", &save_ptr);
    -
    -      if (!strcmp (name, "-h"))
    +
    +      if (!strcmp (name, "-v"))
    +        continue; // -v is controlled by pintos wrapper
    +      else if (!strcmp (name, "-h"))
             usage ();
           else if (!strcmp (name, "-q"))
             shutdown_configure (SHUTDOWN_POWER_OFF);

