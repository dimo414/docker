# ProfileGem Continuous Integration Image

This image enables testing of both ProfileGem and custom gems.

# Features

* Compiles Bash 3.2.57; `BASH_3` environment variable points to the `bash`
  binary
* Sets `_PGEM_DEBUG=true` for ProfileGem debug output

# Scripts

* `/pgem_test/pgem_test.sh`: Tests a ProfileGem installation
* `/pgem_test/gem_test.sh`:  Tests one or more gems (passed as arguments)

