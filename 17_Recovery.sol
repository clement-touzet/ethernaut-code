// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface SimpleToken {
    function destroy(address payable _to) external;
}

contract TokenRecovery {
    address recoveredAddress = 0xeFB056C73447E3Eb318419d0564271D0148b7FBf;
    SimpleToken simpleTokenContract = SimpleToken(recoveredAddress);

    constructor() {
        simpleTokenContract.destroy(payable(msg.sender));
    }
}
