## Bashes [![Build Status](https://travis-ci.org/bronson/bashes.svg?branch=master)](https://travis-ci.org/bronson/bashes)

Provides different versions of Bash to Travis CI tests.

PPAs don't work anymore on TravisCI!  That's probably for the best,
but it removes a great way of installing test dependencies.  This
repository provides a stop-gap until a better technique can be found.

Everything here is derived from the work of Aron Griffis.
Read this post first: http://arongriffis.com/2013/03/25/bashes.html


## Install

Your `.travis.yml` specifies the versions of bash that should be tested:

```yaml
language: bash
env: BASHES="2.05b 3.0.16 3.2.48 4.2.45"
script: ./.travis.sh
```

And `.travis.sh`

```bash
#!/bin/bash

status=0
test=test/run-tests.sh

# download the bash binaries
for version in $BASHES; do
  wget https://raw.githubusercontent.com/bronson/bashes/master/$arch/bash-$version
  [ ! -f bash-$version ] && exit 1
  chmod a+x bash-$version
done

# and run the tests on each binary
for version in $BASHES; do
    echo
    echo ==================
    echo Bash $version
    echo ==================
    ./bash-$version "$test" || status=$?
done

exit $status
```

Now fire off your Travis builds.

Apologies for these docs being rather sparse.  Patches very welcome.
