// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.28 < 0.9.0;
import "hardhat/console.sol";

contract SolidityConstructor {
    uint256 private balance = 0;

    constructor(uint256 initialBalance) {
        balance = initialBalance;

        console.log("balance is now ", balance);
    }
}