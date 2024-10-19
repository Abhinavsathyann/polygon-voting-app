// migrations/2_deploy_voting.js
const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
  const candidateNames = ["Alice", "Bob", "Charlie"];
  deployer.deploy(Voting, candidateNames);
};
