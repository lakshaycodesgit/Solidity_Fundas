// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConvertor {
    function getPrice() internal view returns(uint256){
        // ABI
        // Address - 0x0715A7794a1dc8e42615F059dD6e406A6594651A
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x0715A7794a1dc8e42615F059dD6e406A6594651A);
        (,int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price*1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd= (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

}
