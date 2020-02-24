#!/bin/bash

set -e

# Visually separates test steps
step() {
  printf "\n----------\n%s\n----------\n" "$*"
}

# Prints the command to be run, executes it, then prints its exit code
run() {
  echo '$' "$@"
  "$@"
  local ret=$?
  echo $ret
  echo
  return $ret
}

# Prints the powerset of the inputs, one set per line
# http://stackoverflow.com/a/32641190/113632
#
# e.g.:
#   $ powerset a b
#
#   a
#   b
#   a b
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
    echo "${subset[*]}"
  done
}

# Creates a stub gem with no contents
empty_gem() {
  local dir="${1:-.}"
  run cp -R $dir/template $dir/empty.gem
  run touch $dir/empty.gem/noupdate
}

# Creates a local.conf.sh file with the inputs as gems
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

# Put ProfileGem through its paces
paces() {
  run ./load.sh &&
    run ./load.sh pgem_help &&
    run ./load.sh pgem_info &&
    run ./load.sh pgem_reload &&
    run ./load.sh pgem_update ||
    exit 1
}

