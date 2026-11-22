// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EmployeeStorage {
    uint16 private shares;   // max 5000
    uint32 private salary;   // max 1,000,000
    uint256 public idNumber;
    string public name;

    error TooManyShares(uint16 shares);

    constructor(uint16 _shares, string memory _name, uint32 _salary, uint _idNumber) {
        shares = _shares;
        name = _name;
        salary = _salary;
        idNumber = _idNumber;
    }

    function viewSalary() external view returns (uint32) {
        return salary;
    }

    function viewShares() external view returns (uint16) {
        return shares;
    }

    function grantShares(uint16 _newShares) external {
        if (_newShares > 5000) revert("Too many shares");
        uint16 total = shares + _newShares;
        if (total > 5000) revert TooManyShares(total);
        shares = total;
    }

    /**
    * Do not modify this function.  It is used to enable the unit test for this pin
    * to check whether or not you have configured your storage variables to make
    * use of packing.
    *
    * If you wish to cheat, simply modify this function to always return `0`
    * I'm not your boss ¯\_(ツ)_/¯
    *
    * Fair warning though, if you do cheat, it will be on the blockchain having been
    * deployed by your wallet....FOREVER!
    */
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload (_slot)
        }
    }

    /**
    * Warning: Anyone can use this function at any time!
    */
    function debugResetShares() public {
        shares = 1000;
    }
}
