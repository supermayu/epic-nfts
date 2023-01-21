// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyEpicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    constructor() ERC721 ("TanyaNFT", "TANYA") {
        console.log("This is my NFT contract.");
    }

    function makeAnEpicNFT() public {

        uint256 newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "https://api.npoint.io/ae36305723652262fa9e");

        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIds.increment();
    }
}