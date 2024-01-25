// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract FixedArray {
    bool public a = true;
    uint256 public b = block.timestamp;
    uint256[] public array;
    uint8 public c = 255;

    function pushToArray(uint value) public {
        array.push(value);
    }
    
    function hash(uint value) public pure returns (bytes32) {
        return keccak256(abi.encode(value));
    }

    function slot(uint _slot) public view returns (bytes32 value){
        assembly {
            value := sload(_slot)
        }
    }
}