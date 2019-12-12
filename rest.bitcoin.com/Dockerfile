FROM node:8

WORKDIR /src

RUN apt-get update \
  && apt-get install -y build-essential \
  && rm -rf /var/lib/apt/lists/*

# RUN ufw allow 28332

RUN git clone https://github.com/bitcoin-com/rest.bitcoin.com \
  && cd rest.bitcoin.com \
  && npm install \
  && npm run build

# COPY bitcoin.conf .
COPY route-utils.js /src/rest.bitcoin.com/src/routes/v2/route-utils.js

# On rest.bitcoin.com this env var is to our internal insight API. You can use insight's public API.
ENV BITCOINCOM_BASEURL=http://insight:3001/api/
ENV RPC_BASEURL=http://insight:18443/
ENV RPC_PASSWORD=docker321
ENV RPC_USERNAME=bitcoincash
ENV ZEROMQ_PORT=28332
ENV ZEROMQ_URL=insight
ENV NETWORK=regtest

WORKDIR /src/rest.bitcoin.com

EXPOSE 3000
CMD npm start

# Reference commands
# BITCOINCOM_BASEURL=https://bch-insight.bitpay.com/api/ RPC_BASEURL=http://your.nodes.ip.address:8332/ RPC_PASSWORD=rpcPasssword RPC_USERNAME=rpcUsername ZEROMQ_PORT=28332 ZEROMQ_URL=your.nodes.ip.address BITDB_URL=https://bitdb.bitcoin.com/ SLPDB_URL=https://slpdb.bitcoin.com/ NETWORK=mainnet npm run dev
# PORT=3000 BITCOINCOM_BASEURL=http://localhost:3000/api/ RPC_BASEURL=http://localhost:18332/ RPC_PASSWORD=regtest RPC_USERNAME=regtest ZEROMQ_PORT=0 ZEROMQ_URL=0 NETWORK=local npm start

