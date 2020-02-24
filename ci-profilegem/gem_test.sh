#!/bin/bash
#
# Tests for a ProfileGem gem. All arguments will be treated as Mercurial repos
# (local or remote) and cloned into a ProfileGem installation to be tested.

set -e

PGEM_DIR="${PGEM_TEST:-/tmp}/ProfileGem"

source "$(dirname "$0")/util.sh"

step "Bash Version: $BASH_VERSION"

step "Cloning ProfileGem"

# TODO swap to GitHub
run hg clone https://bitbucket.org/dimo414/profilegem "$PGEM_DIR"

step "Cloning Gems"

gems=()

for src in "$@"; do
  src=$(readlink -f "$src" || echo "$src")
  gem=$(basename "$src")
  if [[ "$src" =~ git ]] || [[ -d "$src/.git" ]]; then
    run git clone "$src" "${PGEM_DIR}/${gem}"
  else
    run hg clone "$src" "${PGEM_DIR}/${gem}"
  fi
  gems+=("${gem%.gem}")
done

step "Creating Empty Gem"

empty_gem "$PGEM_DIR"
gems+=(empty)

step "Starting Tests"

run cd "$PGEM_DIR"

powerset "${gems[@]}" | while read -r line; do
  write_conf $line # intentionally unquoted
  paces
done

