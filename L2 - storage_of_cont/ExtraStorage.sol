// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage { // inheritence , here ExtraStorage is a child of the simplstorage smart contract, inherit all functionalities
    function store(uint256 _favoriteNumber) public override { // to use this f instead of parent function , 
    //we need to use ovveride in this and virtual in parent contract to make it overridable 
        favoriteNumber = _favoriteNumber + 5;
    }
}