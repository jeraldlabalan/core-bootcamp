// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.28 < 0.9.0;
import "hardhat/console.sol";

contract SolidityFunctions {
    uint256 private balance = 0;

    constructor(uint256 initialBalance) {
        balance = initialBalance;
    }

    function addBalance(uint256 toAddBalance) public {
        balance += toAddBalance;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}