// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.28 < 0.9.0;
import "hardhat/console.sol";

contract SolidityDataTypes {
    uint256 public balance;
    address private owner;
    mapping(string => uint256) private accounts;

    constructor() {
        balance = 10000;
        owner = address(0);
        accounts["theblokc"] = 999999;

        console.log("balance is ", balance);

        console.log("owner is ", owner);

        console.log("account is ", accounts["theblokc"]);
    }
}