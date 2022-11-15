# Bash Continuous Integration Image

This image enables testing of Bash scripts and related shell utilities.

## Features

* Includes stable `bash` builds at different versions
  (in addition to the default shell which is configured in the parent image).
    * `5.2` as `bash-5`, `bash-5.2`
    * `5.1.16` as `bash-5.1`, `bash-5.1.16`
    * `5.0` as `bash-5.0`
    * `4.4.18` as `bash-4`, `bash-4.4`, `bash-4.4.18`
    * `4.3.30` as `bash-4.3`, `bash-4.3.30`
    * `3.2.57` as `bash-3`, `bash-3.2`, `bash-3.2.57`
* [`bats`](https://github.com/bats-core/bats-core), a Bash unit testing framework
* [`shellcheck`](https://www.shellcheck.net/), a shell linter

### Bash 4.2

Bash 4.2 is not included because the current installation behavior exposes a
serious parsing bug; demo:

```
$ docker run bash-ci bash-4.2 -x -c 'echo $(date)'
/usr/local/build/bash-4.2.53/bash: command substitution: line 1: syntax error near unexpected token `)'
/usr/local/build/bash-4.2.53/bash: command substitution: line 1: `date)'

# Notably, this prevents using bats with bash 4.2
$ docker run bash-ci bash-4.2 -x bats
+ set -euo pipefail
+ command -v greadlink
/usr/local/bin/bats: command substitution: line 53: syntax error near unexpected token `)'

# But this isn't an issue for the official image....
$ docker run bash:4.2 -x -c 'echo $(date)'
++ date
+ echo Tue Nov 15 10:12:58 UTC 2022
Tue Nov 15 10:12:58 UTC 2022
```

Possibly related: https://lists.gnu.org/archive/html/bug-bash/2013-05/msg00017.html
