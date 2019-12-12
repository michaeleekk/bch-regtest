#!/bin/bash -e

docker run -it --rm --network bitcoin --link rest -v `pwd`/test/package.json:/src/package.json -v `pwd`/test/tests:/src/tests bch-regtest-runner
