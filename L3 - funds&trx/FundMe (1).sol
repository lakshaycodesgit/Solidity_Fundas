/* what this contract will do- 
1. get funds from user
2. Withdraw Funds
3. Set a minimum funding value in usd
*/

// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "./PriceConvertor.sol";

contract FundMe{
    using PriceConvertor for uint256;
    mapping(address => uint256) public addressToAmountFunded;
    uint256 public minimumUsd=60*1e18;
    address[] public funders;
    function fund() public payable{ // like wallets solidity contracts can hold eth , payable keyword to 
    //allow to access the VALUE attribute in deployment
        require(msg.value.getConversionRate() > minimumUsd,"send enough"); //msg.value access the VALUE attribute 
        //and global value depicting how much native currency is sent , 
        //require is a checker , if checker is false revert with this error message , revert == undo any action before , 
        //and send remaining gass fee back , and if reverted prior work will be undone like number will be ==0
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }
}

