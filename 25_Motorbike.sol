// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract DestroyEngine {
    function destroy() external {
        selfdestruct(payable(address(0)));
    }
}
