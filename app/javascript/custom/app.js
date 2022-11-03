var TruffleContract = require("truffle-contract");
var Web3 = require("web3");

const showAccount = document.querySelector(".showAccount");

const ethereumButton = document.querySelector(".enableEthereumButton");
ethereumButton.addEventListener("click", () => {
  App.loadAccount();
});

const App = {
  contracts: {},

  init: async () => {
    await App.loadContract();
  },

  loadContract: async () => {
    const kontractumJSON = require("../../../build/contracts/Kontractum.json");
    var currentProvider = new Web3.providers.HttpProvider(
      "http://localhost:7545"
    );
    App.contracts.Kontractum = TruffleContract(kontractumJSON);
    App.contracts.Kontractum.setProvider(currentProvider);

    // Hydrate the smart contract with values from the blockchain
    App.kontractumJSON = await App.contracts.Kontractum.deployed();
    console.log("Contrato cargado");
    console.log(kontractumJSON);
  },

  loadAccount: async () => {
    const accounts = await ethereum.request({ method: "eth_requestAccounts" });
    const account = accounts[0];
    showAccount.innerHTML = "Already connected! Address: " + account;
  },

  createContract: async () => {
    const content = $("#title").val();
    App.kontractumJSON.createContract(content);
    window.location.reload();
  },
};

$(() => {
  $(window).on("load", () => {
    App.init();
  });
});
