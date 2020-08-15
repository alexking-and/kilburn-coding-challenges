const Adder = artifacts.require("Adder");
const StringUtils = artifacts.require("strings");
const Provable = artifacts.require("usingProvable");

module.exports = (deployer) => {
  // deployment steps
  deployer.deploy(StringUtils);
  deployer.deploy(Provable);
  deployer.deploy(Adder, "http://localhost:8000");
};
