## BCH Regtest

This repository is trying to 

# Pre-requsities

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
