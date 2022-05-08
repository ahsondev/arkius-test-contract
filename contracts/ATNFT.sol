// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ATNFT is ERC721, Ownable {
    uint256 private _counter = 0;
    string public myBaseUri = "";
    string public contractUri = "";

    constructor(string memory name_, string memory symbol_, string memory baseUri_) ERC721(name_, symbol_) {
        myBaseUri = baseUri_;
    }

    function mint(uint256 count) public onlyOwner {
        for (uint256 i = 0; i < count; i++) {
            _safeMint(msg.sender, _counter + i);
        }
        _counter += count;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return myBaseUri;
    }

    function setBaseUri(string memory baseUri_) public onlyOwner {
        myBaseUri = baseUri_;
    }

    function setContractUri(string memory contractUri_) public onlyOwner {
        contractUri = contractUri_;
    }

    function ownedTokens(address addr_) public view returns (uint256[] memory) {
        uint256 balance = balanceOf(addr_);
        uint256[] memory ret = new uint256[](balance);
        uint256 k = 0;
        for (uint256 i = 0; i < _counter; i++) {
            if (_exists(i) && ownerOf(i) == addr_) {
                ret[k++] = i;
            }
        }
        return ret;
    }

    function totalSupply() public view returns (uint256) {
        uint256 cnt = 0;
        for (uint256 i = 0; i < _counter; i++) {
            if (_exists(i)) {
                cnt++;
            }
        }
        return cnt;
    }
}
