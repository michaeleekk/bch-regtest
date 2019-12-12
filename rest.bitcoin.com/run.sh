#!/bin/bash -e 

docker run -it --rm -p 3000:3000 --name restb --network bitcoin --link insight rest.bitcoin.com

