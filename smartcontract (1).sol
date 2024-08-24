// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint public value;

    function setValue(uint _value) public {
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    function doubleValue() public {
        value *= 2;
        assert(value % 2 == 0); 
    }

    function resetValue() public {
        if (value == 0) {
            revert("Value is already zero");
        }
        value = 0;
    }
}
