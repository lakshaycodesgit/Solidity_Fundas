// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./SimpleStorage.sol";
contract StorageFactory {
    SimpleStorage[] public simpleStorageArray; // creates an array to deploy simple storage .sol many times

    function createSimpleStorageContract() public { //function to create values inside the SimpleStorage Array, values being smart contracts itself ,  
    //actually creates and stores the contract and not the address
        SimpleStorage simpleStorage = new SimpleStorage(); //creates new object of the SimpleStorage type , assigned to a variable
        simpleStorageArray.push(simpleStorage); //variable added to the array
    }    

    function sfStore(uint256 _simpleStorageIndex, uint256 _simplestorageNumber) public { //stores the addresses and the contracts
        //Address - the array takes track of it
        // ABI - Application binary interface , array comes automatically with ABI therefore ABI+Address always needed to interact

        /* 
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simplestorageNumber); 
        */

        simpleStorageArray[_simpleStorageIndex].store(_simplestorageNumber); //use this short form 
    }

    function sfget(uint256 _simpleStorageIndex) public view returns(uint256){

        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorage.retrieve();
        // use this instead --> better and easy to like ..print the values
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}

