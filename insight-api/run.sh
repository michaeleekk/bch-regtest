#!/bin/bash -e 

docker run -it --rm --name insight --network bitcoin --link bitcoind \
	-v `pwd`/bitcore-node.json:/src/mynode/bitcore-node.json \
	-v `pwd`/bitcoin.conf:/src/mynode/data/bitcoin.conf \
	insight-api

