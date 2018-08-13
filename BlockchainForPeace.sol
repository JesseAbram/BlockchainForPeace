pragma solidity ^0.4.24;

contract BlockchainForPeace{
    

    // to see the total raised 
    uint public raised;
    address public charity; 
    //struct for the donation 
   
    struct Donation {
        string message; 
        uint value; 
    }
    
    mapping (address => Donation) public donors;
    
   
    constructor (address _charity) public {
        charity = _charity;
    }
   

    function () payable public {
        charity.transfer(msg.value);
        donors[msg.sender].value = msg.value; 
        raised += msg.value;
    }

    function messageForPeace(string _message) public {
        donors[msg.sender].message = _message;
    }
    
    event Donate (address indexed from, uint amount);
}