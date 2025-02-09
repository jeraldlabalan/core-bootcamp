// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.28 < 0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

contract J3ez is ERC721URIStorage {
    uint256 tokenId;

    constructor() ERC721("J3ez", "jjj") {}

    function mint() external {

        _safeMint(msg.sender, tokenId); // checks compatibility of contracts _safeMint
        _setTokenURI(
            tokenId,
            "https://rose-brillian-boa-505.mypinata.cloud/ipfs/bafkreidtqgjebivrlqclz5xzz5fj2fz6zhthkqmlj5jdi3dxtt4lr6v5je"
        );
        tokenId++;
    }
}