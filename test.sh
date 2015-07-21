#!/bin/bash

if [ "$bashver(1)-release" != "$BASH_VERSION" ]; then
  echo "Expected BASH_VERSION '$bashver(1)-release' but found '$BASH_VERSION'"
  exit 1
fi

echo "installed: $bashver"
