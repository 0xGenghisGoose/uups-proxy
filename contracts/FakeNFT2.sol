//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "./FakeNFT.sol";

contract FakeNFT2 is FakeNFT {
    function test() public pure returns (string memory) {
        return "upgraded";
    }
}
