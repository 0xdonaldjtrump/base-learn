// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AddressBook is Ownable {
    struct Contact {
        uint id;
        string firstName;
        string lastName;
        uint[] phoneNumbers;
    }

    Contact[] private contacts;
    mapping(uint => uint) private idToIndex; // id -> index + 1

    error ContactNotFound(uint id);

    constructor(address _owner) Ownable(_owner) {}

    function addContact(uint _id, string calldata _firstName, string calldata _lastName, uint[] calldata _phoneNumbers) external onlyOwner {
        contacts.push(Contact(_id, _firstName, _lastName, _phoneNumbers));
        idToIndex[_id] = contacts.length;
    }

    function deleteContact(uint _id) external onlyOwner {
        uint idx = idToIndex[_id];
        if (idx == 0) revert ContactNotFound(_id);
        uint last = contacts.length - 1;
        if (idx - 1 != last) {
            contacts[idx - 1] = contacts[last];
            idToIndex[contacts[idx - 1].id] = idx;
        }
        contacts.pop();
        delete idToIndex[_id];
    }

    function getContact(uint _id) external view returns (Contact memory) {
        uint idx = idToIndex[_id];
        if (idx == 0) revert ContactNotFound(_id);
        return contacts[idx - 1];
    }

    function getAllContacts() external view returns (Contact[] memory) {
        return contacts;
    }
}

contract AddressBookFactory {
    function deploy() external returns (address) {
        AddressBook book = new AddressBook(msg.sender);
        return address(book);
    }
}
