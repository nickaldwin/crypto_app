// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Crowdfunfing {
    struct Campaign {
        address: owner;
        string: title;
        string: description;
        uint256: target;
        uint256: deadline;
        uint256: ammountCollected;
        string: image;
        address: [] donators;
        uint256: [] donations;   
    }
    mapping(uint256)
}