#!/bin/bash

status=0
test=./test.sh

# download the bash binaries
for arch in amd64 i386; do
  for version in $BASHES; do
    wget -nv https://raw.githubusercontent.com/bronson/bashes/master/$arch/bash-$version
    [ ! -f bash-$version ] && exit 1
    chmod a+x bash-$version
  done
done

# and run the tests on each binary
for arch in amd64 i386; do
  for version in $BASHES; do
      echo
      echo ==================
      echo Bash $version $arch
      echo ==================
      bashver=$version ./bash-$version "$test" || status=$?
  done
done

exit $status
