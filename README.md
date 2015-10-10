## Bashes [![Build Status](https://travis-ci.org/bronson/bashes.svg?branch=master)](https://travis-ci.org/bronson/bashes)

Provides different versions of Bash to Travis CI tests.

PPAs don't work anymore on TravisCI!  That might be for the best
but it removes a great way of installing test dependencies.  This
repository provides a stop-gap until a better technique can be found.

Everything here is derived from the work of Aron Griffis.
Read this post first: http://arongriffis.com/2013/03/25/bashes.html


## Install

Specify the versions of bash that you want to run in your `.travis.yml`:

```yaml
language: bash
env: BASHES="2.05b 3.0.16 3.2.48 4.2.45"
script: ./.travis.sh
```

Then add a `.travis.sh` file to run your test with each version of bash.  Set the `test` variable to launch your own tests.

```bash
#!/bin/bash

status=0
test=test/run-tests.sh

# download the bash binaries
for version in $BASHES; do
  wget -nv https://raw.githubusercontent.com/bronson/bashes/master/$(arch)/bash-$version
  [ ! -f bash-$version ] && exit 1
  chmod a+x bash-$version
done

# run the tests on each binary
for version in $BASHES; do
  echo
  echo ==================
  echo Bash $version
  echo ==================
  ./bash-$version "$test" || status=$?
done

exit $status
```

There's also a [slightly more complex example](https://github.com/bronson/bashes/blob/master/.travis.sh),
that runs both 32 bit and 64 bit bashes.

Now fire off your Travis builds and prosper.
