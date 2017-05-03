#!/bin/bash
#
# Tests for ProfileGem itself (assumes the current directory is a ProfileGem
# installation).

set -e

source "$(dirname "$0")/util.sh"

step "Bash Version: $BASH_VERSION"

step "Creating Empty Gem"

empty_gem

step "Starting Tests"

powerset "empty" | while read -r line; do
  write_conf $line # intentionally unquoted
  paces
done

