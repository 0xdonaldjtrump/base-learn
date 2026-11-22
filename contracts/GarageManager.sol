// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract GarageManager {
    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    mapping(address => Car[]) public garage;

    error BadCarIndex(uint index);

    function addCar(string memory _make, string memory _model, string memory _color, uint _numberOfDoors) external {
        garage[msg.sender].push(Car(_make, _model, _color, _numberOfDoors));
    }

    function getMyCars() external view returns (Car[] memory) {
        return garage[msg.sender];
    }

    function getUserCars(address _user) external view returns (Car[] memory) {
        return garage[_user];
    }

    function updateCar(uint _index, string memory _make, string memory _model, string memory _color, uint _numberOfDoors) external {
        if (_index >= garage[msg.sender].length) revert BadCarIndex(_index);
        garage[msg.sender][_index] = Car(_make, _model, _color, _numberOfDoors);
    }

    function resetMyGarage() external {
        delete garage[msg.sender];
    }
}
