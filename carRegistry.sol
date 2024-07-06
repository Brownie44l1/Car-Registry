//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CarRegistry {
    // Define the Car struct
    struct Car {
        string make;
        string model;
        uint256 year;
        address owner;
    }

    // State variables
    Car[] public cars;
    mapping(address => Car[]) public ownerToCars;

    // Function to register a car
    function registerCar(string memory _make, string memory _model, uint256 _year) public {
        // Create a new Car struct and add it to the cars array
        Car memory newCar = Car({
            make: _make,
            model: _model,
            year: _year,
            owner: msg.sender
        });
        cars.push(newCar);

        // Add the new car to the owner's list of cars
        ownerToCars[msg.sender].push(newCar);
    }

    // Function to get cars by owner
    function getCarsByOwner(address _owner) public view returns (Car[] memory) {
        return ownerToCars[_owner];
    }
}
