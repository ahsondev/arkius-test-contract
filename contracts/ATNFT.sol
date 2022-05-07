// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ATNFT is ERC721, Ownable {
    uint256 public totalSupply = 0;
    string private _myBaseUri = "";

    constructor(string memory name_, string memory symbol_, string memory baseUri_) ERC721(name_, symbol_) {
        _myBaseUri = baseUri_;
    }

    function mint(uint256 count) public onlyOwner {
        for (uint256 i = 0; i < count; i++) {
            _safeMint(msg.sender, totalSupply + i);
        }
        totalSupply += count;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _myBaseUri;
    }

    function setBaseUri(string memory baseUri_) public onlyOwner {
        _myBaseUri = baseUri_;
    }
}
