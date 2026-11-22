// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FavoriteRecords {
    mapping(string => bool) public approvedRecords;
    mapping(address => mapping(string => bool)) public userFavorites;

    string[] private approvedList;
    mapping(address => string[]) private userFavoriteList;

    error NotApproved(string albumName);

    constructor() {
        approvedList = [
            "Thriller",
            "Back in Black",
            "The Bodyguard",
            "The Dark Side of the Moon",
            "Their Greatest Hits (1971-1975)",
            "Hotel California",
            "Come On Over",
            "Rumours",
            "Saturday Night Fever"
        ];
        for (uint i = 0; i < approvedList.length; i++) approvedRecords[approvedList[i]] = true;
    }

    function getApprovedRecords() external view returns (string[] memory) {
        return approvedList;
    }

    function addRecord(string memory _albumName) external {
        if (!approvedRecords[_albumName]) revert NotApproved(_albumName);
        if (!userFavorites[msg.sender][_albumName]) {
            userFavorites[msg.sender][_albumName] = true;
            userFavoriteList[msg.sender].push(_albumName);
        }
    }

    function getUserFavorites(address _address) external view returns (string[] memory) {
        return userFavoriteList[_address];
    }

    function resetUserFavorites() external {
        string[] storage list = userFavoriteList[msg.sender];
        for (uint i = 0; i < list.length; i++) delete userFavorites[msg.sender][list[i]];
        delete userFavoriteList[msg.sender];
    }
}
