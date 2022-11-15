#!/bin/bash
set -u
#
# Downloads and installs the given version of Bash as `bash-x.y.z` (and `bash-x.y` and `bash-x`).
# http://stackoverflow.com/a/41554230/113632
# https://tiswww.case.edu/php/chet/bash/INSTALL

# note minor==major if version doesn't have a patch, e.g. 5.0 instead of 5.0.0
version=bash-${1:?version}
minor=${version%.*}
major=${minor%.*}

# Example: http://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz
url="http://ftpmirror.gnu.org/bash/${version}.tar.gz"

src="/usr/local/src/${version}"
build="/usr/local/build/${version}"
bin="/usr/local/bin/${version}"

(
  set -x
  cd /usr/local/src \
    && wget "$url" \
    && tar xzf "${version}.tar.gz" \
    && mkdir -p "${build}" && cd "${build}" \
    && "${src}/configure" && make \
    && rm -r "/usr/local/src/${version}"* \
    && printf '#!/bin/sh\nexport PATH=%q":$PATH"\nexec %q "$@"\n' "${build}" "${build}/bash" > "${bin}" \
    && chmod +x "${bin}" \
    && cp "${bin}" "/usr/local/bin/${minor}" \
    && cp "${bin}" "/usr/local/bin/${major}" \
    && "${version}" -version
) || exit

echo "${version} installed as ${version}, ${minor}, ${major}"
