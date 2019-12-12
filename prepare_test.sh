#!/bin/bash -e

echo Generate 3000 BCH...
docker exec docker_insight_1 bitcoin-cli -regtest -rpcport=18443 -rpcuser=bitcoincash -rpcpassword=docker321 -rpcconnect=localhost generate 3000

echo Send 10 BCH to testing address...
docker exec docker_insight_1 bitcoin-cli -regtest -rpcport=18443 -rpcuser=bitcoincash -rpcpassword=docker321 -rpcconnect=localhost sendtoaddress bchreg:qqak4ljes43xfwlzgsg9s5e5k2vxr4sq8yl9t85nu9 10

docker exec docker_insight_1 bitcoin-cli -regtest -rpcport=18443 -rpcuser=bitcoincash -rpcpassword=docker321 -rpcconnect=localhost getaddressbalance '{"addresses": ["mkw8LQzRjeb6PBSG3GMjKXnmZz9UrPoM8q"]}'

echo Generating 5 BCH...
docker exec docker_insight_1 bitcoin-cli -regtest -rpcport=18443 -rpcuser=bitcoincash -rpcpassword=docker321 -rpcconnect=localhost generate 5

docker exec docker_insight_1 bitcoin-cli -regtest -rpcport=18443 -rpcuser=bitcoincash -rpcpassword=docker321 -rpcconnect=localhost getaddressbalance '{"addresses": ["mkw8LQzRjeb6PBSG3GMjKXnmZz9UrPoM8q"]}'
