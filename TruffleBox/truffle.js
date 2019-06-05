var HDWalletProvider = require("truffle-hdwallet-provider");

const mnemonic = ""

module.exports = {
    networks: {
      mainnet: {
        provider: function() {
          return new HDWalletProvider(mnemonic, "https://mainnet.infura.io/v3/69500eb24e3a4bd79fbb8cd1fbb9a3ef")
        },
        network_id: 1,
        gas: 4712388,
        gasPrice: 4000000000
      },
      ropsten: {
        provider: function() {
          return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/69500eb24e3a4bd79fbb8cd1fbb9a3ef")
        },
        network_id: 3, 
        gas: 4912388,
        gasPrice: 4000000000
      },
      
    },
};