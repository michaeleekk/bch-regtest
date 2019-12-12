/*
  Reference: https://github.com/Bitcoin-com/bitbox-sdk/blob/master/examples/applications/wallet/check-balance/check-balance.js
  Check the balance of the root address of an HD node wallet generated
  with the create-wallet example.
*/

const BITBOX = require("bitbox-sdk").BITBOX

// Set NETWORK to either testnet or mainnet
const NETWORK = `regtest`

// Instantiate BITBOX based on the network.
const bitbox =
  NETWORK === `mainnet`
    ? new BITBOX({ restURL: `https://rest.bitcoin.com/v2/` })
    : new BITBOX({ restURL: `http://rest:3000/v2/` })

// Get the balance of the wallet.
async function getBalance() {
  try {
    // first get BCH balance
    const balance = await bitbox.Blockchain.getBlockchainInfo()

    console.log(`BCH Balance information:`)
    console.log(balance)
  } catch (err) {
    console.error(`Error in getBalance: `, err)
    process.exit(1)
  }
}
getBalance()
