var Greeter = artifacts.require("./Greeter.sol");
var Fibonacci = artifacts.require("./Fibonacci.sol");
var XOR = artifacts.require("./XOR.sol");
var Concatenate = artifacts.require("./Concatenate.sol");

module.exports = function(deployer) {
  deployer.deploy(Greeter, "hello");
  deployer.deploy(Fibonacci);
  deployer.deploy(XOR);
  deployer.deploy(Concatenate);
};
