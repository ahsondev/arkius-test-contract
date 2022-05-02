// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ATNFT is ERC721, Ownable {
    mapping (uint256 => string) private _tokenUris;
    uint256 public totalSupply = 0;

    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {
    }

    function mint(string memory uri) public payable {
        _tokenUris[totalSupply] = uri;
        _safeMint(msg.sender, totalSupply);
        totalSupply++;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return _tokenUris[tokenId];
    }
}
