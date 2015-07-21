#!/bin/bash

# some executables have a slightly different notion of their version numbers
case $bashver in
  2.05b) bashver=2.05b.0 ;;
  3.0.16) bashver=3.00.16 ;;
esac

if [ "$bashver(1)-release" != "$BASH_VERSION" ]; then
  echo "Expected BASH_VERSION '$bashver(1)-release' but found '$BASH_VERSION'"
  exit 1
fi

echo "running $bashver"
