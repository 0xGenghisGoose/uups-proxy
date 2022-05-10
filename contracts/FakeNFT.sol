//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

// Fake NFT is `implementation` contract

contract FakeNFT is
    Initializable,
    ERC721Upgradeable,
    UUPSUpgradeable,
    OwnableUpgradeable
{
    // Initialize function since implementation can't use constructors, only run once w modifier
    function initialize() public initializer {
        // Have to manually initialize ERC721 & Ownable constructors
        __ERC721_init("FakeNFT", "FNFT");
        __Ownable_init();
        _mint(msg.sender, 1);
    }

    // Only added an onlyOwner modifier here
    function _authorizeUpgrade(address _newImplementation)
        internal
        override
        onlyOwner
    {}
}
