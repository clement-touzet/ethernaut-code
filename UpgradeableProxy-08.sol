// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UpgradeableProxy {
    constructor(address implementation, bytes memory initData) {}

    function _upgradeTo(address _newImplementation) public {}
}
