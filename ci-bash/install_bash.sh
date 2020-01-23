#!/bin/bash
#
# Downloads and installs the given version of Bash as `bash-n`
# http://stackoverflow.com/a/41554230/113632

# Example: http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz
#BASH_FTP_URL='http://ftp.gnu.org/gnu/bash/%s.tar.gz'
BASH_FTP_URL='http://ftpmirror.gnu.org/bash/%s.tar.gz'

version=bash-${1:?version}
cmd=${version%%.*}
# shellcheck disable=SC2059
printf -v url "$BASH_FTP_URL" "$version"

# TODO clean up the source and build artifacts. Do we need anything other than the bash binary?
(
  set -x
  cd /usr/local/lib \
    && wget "$url" \
    && tar xzf "${version}.tar.gz" \
    && rm "${version}.tar.gz" \
    && cd "$version" \
    && ./configure && make \
    && printf '#!/bin/sh\nPATH="%s:$PATH" exec %s "$@"\n' "$PWD" "$PWD/bash" > "/usr/local/bin/${cmd}" \
    && chmod +x "/usr/local/bin/${cmd}" \
    && "${cmd}" -version
) || exit

echo "${version} installed as ${cmd}"
