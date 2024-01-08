// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface Privacy {
    function unlock(bytes16 _key) external;
}

contract PrivacyAttack {
    address privacyAddress = 0x1Ce75A371D8aF88a6C2E9F9b481dFbf114C25988;
    Privacy privacyContract = Privacy(privacyAddress);

    function unlock(bytes32 _key) public {
        bytes16 castedKey = bytes16(_key);
        privacyContract.unlock(castedKey);
    }
}
