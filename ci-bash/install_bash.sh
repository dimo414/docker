#!/bin/bash
#
# Downloads and installs the given version of Bash as `bash-n`
# http://stackoverflow.com/a/41554230/113632

# Example: http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz
#BASH_FTP_URL='http://ftp.gnu.org/gnu/bash/%s.tar.gz'
BASH_FTP_URL='http://ftpmirror.gnu.org/bash/%s.tar.gz'

version=bash-${1:?version}
cmd=${version%%.*}
url=$(printf "$BASH_FTP_URL" "$version")

(
  set -x
  cd /usr/local/lib \
    && wget "$url" \
    && tar xzf "${version}.tar.gz" \
    && rm "${version}.tar.gz" \
    && cd "$version" \
    && ./configure && make \
    && ln -s "$PWD/bash" "/usr/local/bin/${cmd}" \
    && "${cmd}" -version
) || exit

echo "${version} installed as ${cmd}"
