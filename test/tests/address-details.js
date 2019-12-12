/*
  Reference: https://github.com/Bitcoin-com/bitbox-sdk/blob/master/examples/low-level/address-details/address-details.js
  Check the balance of the root address of an HD node wallet generated
  with the create-wallet example.
*/

// Instantiate bitbox.
const BITBOX = require("bitbox-sdk").BITBOX
const bitbox = new BITBOX({ restURL: "http://rest:3000/v2/" })

const ADDR = `bchreg:qqak4ljes43xfwlzgsg9s5e5k2vxr4sq8yl9t85nu9`

async function addressDetails() {
  try {
    // first get BCH balance
    const balance = await bitbox.Address.details(ADDR)

    console.log(`BCH Balance information:`)
    console.log(balance)
  } catch (err) {
    console.error(`Error in getBalance: `, err)
    throw err
  }
}
addressDetails()