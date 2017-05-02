#!/bin/bash

set -e

step() {
  printf "\n----------\n%s\n" "$*"
}

# http://stackoverflow.com/a/32641190/113632
powerset() {
  local powersize=$((1 << $#))
  for ((i=0; i < powersize; i++)); do
    subset=()
    for ((j=1; j < $# + 1; j++)); do
      local bit=$((1 << (j - 1)))
      if (( (bit & i) > 0 )); then
        subset+=("${!j}")
      fi
    done
    echo "${subset[@]}"
  done
}

write_conf() {
  local conf=local.conf.sh
  echo "# Enabled Gems: $#" > "$conf"
  while (( $# )); do
    echo "#GEM $1" >> "$conf"
    shift
  done

  echo "Updated ${conf}:"
  cat "$conf"
  echo
}

run() {
  echo '$' "$@"
  "$@"
  local ret=$?
  echo $ret
  echo
  return $ret
}

# Put it through its paces
paces() {
  run ./load.sh &&
    run ./load.sh pgem_help &&
    run ./load.sh pgem_info &&
    run ./load.sh pgem_reload &&
    run ./load.sh pgem_update ||
    exit 1
}

step "Bash Version: $BASH_VERSION"

step "Cloning ProfileGem"

cd "${PGEM_TEST:-/tmp}"
run hg clone https://dimo414@bitbucket.org/dimo414/profilegem
run cd profilegem
run cp -R template empty.gem
run touch empty.gem/noupdate

step "Cloning Gems"

gems=(empty)

for src in "$@"; do
  gem=$(basename "$src" | sed 's/.gem$//')
  run hg clone "$src" "${gem}.gem"
  gems+=("$gem")
done

step "Starting Tests"

powerset "${gems[@]}" | while read -r line; do
  write_conf $line # intentionally unquoted
  paces
done

