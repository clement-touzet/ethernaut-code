// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface Shop {
    function buy() external;

    function isSold() external view returns (bool);
}

contract Buyer {
    uint256 cheaperPrice = 1;
    uint256 initialPrice = 100;
    Shop shopContract;

    constructor(address _shopAddress) {
        shopContract = Shop(_shopAddress);
    }

    function buyCheaper() external {
        shopContract.buy();
    }

    function price() external view returns (uint256) {
        if (shopContract.isSold()) {
            return cheaperPrice;
        }
        return initialPrice;
    }
}
