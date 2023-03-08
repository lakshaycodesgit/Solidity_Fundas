// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

contract SimpleStorage {
    uint256 favoriteNumber;  // variable declaration , types - bool,string,byte32

    struct People {          // custom data structure
        uint256 favoriteNumber;  // variable of the ds
        string name;              // variable of the ds
    }
    People[] public people;         // array of the ds , its public

    mapping(string => uint256) public nameToFavoriteNumber; // this is a hashmap in solidity mapping a string to an integer

    function store(uint256 _favoriteNumber) public virtual { // virtual keyword makes it overiddable 
        favoriteNumber = _favoriteNumber; //this function takes an input from the user and stores it in the variable favoritenumber 
        // this declaration is different from the declarartion in the addperson function due to function scoping 
    }
    
    function retrieve() public view returns (uint256){ //view/pure functions dont change the state of the blockchain just view the data
        return favoriteNumber;         // this function prints out the favoriteNumber 
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public { // 3 types of storing -  memory(temporary variables which get destroyed
    // after function is done) ; calldata(temporary variables that can be modified and which get destroyed after function is done) ; storage (
    // ( not temporary variable and dont get destroyed , used after uint256 but its ok if we dont write it , takes by default )
        people.push(People(_favoriteNumber, _name)); //this function directly pushes a new object of the people data structure into the dynamic
        // array called as the People[]
        nameToFavoriteNumber[_name] = _favoriteNumber; // this line maps the name to the favorite number 
    }
}