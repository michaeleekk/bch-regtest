## BCH Regtest with Docker

This repository uses Docker for containing the Bitcoin Cash test environment.

# Pre-requisities

* [Docker](https://www.docker.com/)

# Start the Regtest network

```bash
# Start the API in one console
docker-compose up
```

# Run the tests

```bash
# Build the base image
./build-test-image.sh

# Prepare some BCHs for testing
,/prepare_test.sh

# Run the test scripts with Docker
./test.sh
```

# Issues

* In the [route-utils.js](https://github.com/Bitcoin-com/rest.bitcoin.com/blob/a1f8cea40c810e04cba39db891093d5a0092af87/src/routes/v2/route-utils.js#L48) in `rest.bitcoin.com` repository, the `validateNetwork(addr)` work only with `mainnet` or `testnet`
  * Workaround [here](rest.bitcoin.com/route-utils.js) by simply always returning true in any cases.
* The original [start-app.sh]() inside [the Insight docker image](https://github.com/christroutner/insight-docker/blob/master/start-app.sh#L22) has a `sleep 10` command. Possibly work without ?
  * Workaround [here](insight-api/start-app.sh) by commenting away the sleep command.
* The [bitbox.HDNode.toCashAddress(hdNode, regtest)](https://github.com/Bitcoin-com/bitbox-sdk/blob/master/lib/HDNode.ts#L36) has the second parameter for generating RegTest addresses.
  * One of the edited places is [here](test/tests/create-wallet.js#L51)
