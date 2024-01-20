// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;

    function notify(address user, bytes calldata msgData) external;

    function raiseAlert(address user) external;
}

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

contract DoubleEntryPointBot is IDetectionBot {
    address cryptoVaultAdress;
    IForta forta;

    constructor(address _fortaAddress, address _cryptoVaultAddress) {
        forta = IForta(_fortaAddress);
        cryptoVaultAdress = _cryptoVaultAddress;
    }

    function handleTransaction(address user, bytes calldata msgData) public {
        // msgData contient la signature de la fonction delegateTransfer, et ses 3 paramètres;
        // on veut accéder à la valeur de origSender, soit le 3ème paramètre
        // on va donc émettre une alerte quand originSender == adresse de CryptoVault
        address origSender;
        assembly {
            origSender := calldataload(0xa8)
        }
        if (cryptoVaultAdress == origSender) {
            forta.raiseAlert(user);
        }
    }
}
