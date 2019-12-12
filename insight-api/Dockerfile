FROM node:8

RUN apt-get update \
  && apt-get install -y build-essential libzmq3-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /src

# Workaround, --unsafe-perm for installing the cli globally
RUN npm install --unsafe-perm=true -g bitcore@latest \
  && bitcore create mynode \
  && cd mynode \
  && bitcore install insight-api \
  && bitcore install insight-ui

# :FIXME: 2019/12/12, mempool does not exist anymore
RUN cd mynode \
    && bitcore install p2p \
    && bitcore install header \
    && bitcore install block \
    && bitcore install transaction \
    # && bitcore install mempool \
    && bitcore install web \
    && bitcore install fee \
    && bitcore install timestamp

# Workaround, reference: https://github.com/bitpay/bitcore/issues/1454
COPY index.js /usr/local/lib/node_modules/bitcore/node_modules/insight-api/node_modules/bitcore-lib/index.js
COPY index.js /usr/local/lib/node_modules/bitcore/node_modules/bitcore-message/node_modules/bitcore-lib/index.js

COPY bitcore-node.json /src/mynode/bitcore-node.json
COPY bitcoin.conf /src/mynode/data/bitcoin.conf

WORKDIR /src/mynode

# Reference commands from doc
# BITCOINCOM_BASEURL=https://bch-insight.bitpay.com/api/ RPC_BASEURL=http://your.nodes.ip.address:8332/ RPC_PASSWORD=rpcPasssword RPC_USERNAME=rpcUsername ZEROMQ_PORT=28332 ZEROMQ_URL=your.nodes.ip.address BITDB_URL=https://bitdb.bitcoin.com/ SLPDB_URL=https://slpdb.bitcoin.com/ NETWORK=mainnet npm run dev
# PORT=3000 BITCOINCOM_BASEURL=http://localhost:3000/api/ RPC_BASEURL=http://localhost:18332/ RPC_PASSWORD=regtest RPC_USERNAME=regtest ZEROMQ_PORT=0 ZEROMQ_URL=0 NETWORK=local npm start

# rest / RPC / ZMQ respectively
EXPOSE 3001 8332 28332
CMD bitcore start

