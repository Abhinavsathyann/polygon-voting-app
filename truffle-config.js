const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config(); // If you're using environment variables for keys

module.exports = {
  networks: {
    mumbai: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://rpc-mumbai.matic.today`),
      network_id: 80001, // Mumbai's network id
      gas: 5500000,       // Gas limit
      confirmations: 2,    // # of confirmations to wait between deployments
      timeoutBlocks: 200,  // # of blocks before a deployment times out
      skipDryRun: true     // Skip dry run before migrations
    },
  },
  compilers: {
    solc: {
      version: "^0.8.0" // Adjust version as per your smart contract needs
    }
  }
};
