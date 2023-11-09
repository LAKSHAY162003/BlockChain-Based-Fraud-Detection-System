const LoyaltyToken = artifacts.require("./smart_contract.sol");
module.exports = function(deployer) {
    deployer.deploy(LoyaltyToken);
};