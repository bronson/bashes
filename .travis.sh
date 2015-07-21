#!/bin/bash

status=0
test=./test.sh

# download the bash binaries
for arch in amd64 i386; do
  for version in $BASHES; do
    wget https://raw.githubusercontent.com/bronson/bashes/master/$arch/bash-$version
    [ ! -f bash-$version ] && exit 1
    chmod a+x bash-$version
  done

  # and run the tests on each binary
  for version in $BASHES; do
      echo
      echo ==================
      echo Bash $version $arch
      echo ==================
      bashver=$version ./bash-$version "$test" || status=$?
  done

  exit $status
done
