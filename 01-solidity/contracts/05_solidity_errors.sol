// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.28 < 0.9.0;
import "hardhat/console.sol";

error YouAreNotError();

contract SolidityErrors {
    address public admin;
    uint256 private balance = 0;

    constructor(uint256 initialBalance, address allowedAddress) {
        balance = initialBalance;
        admin = allowedAddress;
    }

    modifier isAdmin() {
        if (msg.sender != admin) {
            revert YouAreNotError();
        }
        _;
    }

    function addBalance(uint256 toAddBalance) public isAdmin {
        balance += toAddBalance;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}