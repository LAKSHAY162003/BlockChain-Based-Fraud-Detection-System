const Contract = artifacts.require("./smartContract.sol");
module.exports = function(deployer) {
    deployer.deploy(Contract);
};