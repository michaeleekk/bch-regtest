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

# Run the test scripts with Docker
./test.sh
```
