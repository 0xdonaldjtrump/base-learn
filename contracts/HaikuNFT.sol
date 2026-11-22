// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract HaikuNFT is ERC721 {
    struct Haiku {
        address author;
        string line1;
        string line2;
        string line3;
    }

    Haiku[] public haikus;
    mapping(address => uint[]) public sharedHaikus;
    uint public counter = 1;
    mapping(bytes32 => bool) private usedLines;

    error HaikuNotUnique();
    error NotYourHaiku(uint id);
    error NoHaikusShared();

    constructor() ERC721("HaikuNFT", "HAIKU") {
        haikus.push(); // index 0 unused, ids start at 1
    }

    function mintHaiku(string calldata _line1, string calldata _line2, string calldata _line3) external {
        bytes32 h1 = keccak256(bytes(_line1));
        bytes32 h2 = keccak256(bytes(_line2));
        bytes32 h3 = keccak256(bytes(_line3));
        if (usedLines[h1] || usedLines[h2] || usedLines[h3]) revert HaikuNotUnique();
        usedLines[h1] = true;
        usedLines[h2] = true;
        usedLines[h3] = true;
        uint id = counter;
        haikus.push(Haiku(msg.sender, _line1, _line2, _line3));
        counter++;
        _mint(msg.sender, id);
    }

    function shareHaiku(uint _id, address _to) public {
        if (ownerOf(_id) != msg.sender) revert NotYourHaiku(_id);
        sharedHaikus[_to].push(_id);
    }

    function getMySharedHaikus() public view returns (Haiku[] memory) {
        uint[] storage ids = sharedHaikus[msg.sender];
        if (ids.length == 0) revert NoHaikusShared();
        Haiku[] memory out = new Haiku[](ids.length);
        for (uint i = 0; i < ids.length; i++) out[i] = haikus[ids[i]];
        return out;
    }
}
