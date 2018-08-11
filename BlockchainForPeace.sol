pragma solidity ^0.4.24;

contract BlockchainForPeace{
    
    //address is a place hoder for the address of the charity, this is my address for testing
 

    // to see the total raised 
    uint public raised;
    address public charity; 
    //struct for the donation 
    struct Donation {
        address from; 
        bytes32 message; 
        uint value; 
    }
    
    Donation [128] public board; 
   
   
    constructor (address _charity) public {
        charity = _charity;
    }
   
    
    //function payable takes in address a message and a value, transfers is to set charity address and get a value
    function donate (uint i, bytes32 message) payable public{
        
        board [i] = Donation ({
            from: msg.sender, 
            message: message, 
            value: msg.value
        });
        
        charity.transfer(msg.value);
       donate(msg.value, message);
        
        raised += msg.value;
    }
    
    event Donate (address indexed from, uint amount);
}