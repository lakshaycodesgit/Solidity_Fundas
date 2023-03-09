/* what this contract will do- 
1. get funds from user
2. Withdraw Funds
3. Set a minimum funding value in usd
*/

// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract FundMe{
    uint256 public number;
    uint256 public minimumUsd = 50;
    function fund() public payable{ // like wallets solidity contracts can hold eth , payable keyword to 
    //allow to access the VALUE attribute in deployment
        number = 5;
        require(msg.value > minimumUsd,"send enough"); //msg.value access the VALUE attribute and minimum 1eth set , 
        //require is a checker , if checker is false revert with this error message , revert == undo any action before , 
        //and send remaining gass fee back , and if reverted prior work will be undone like number will be ==0
    }
}

