pragma solidity ^0.4.24;

contract BlockchainForPeace {
    
    //address is a place hoder for the address of the charity, this is my address for testing
    address charity = 0x362f03a4a65162ba13a74b97cd8c921ed38757fb;
    
    // to see the total raised 
    uint public raised;
    
    //struct for the donation 
    struct Donation {
        address from; 
        bytes32 message; 
        uint value; 
    }
    
    Donation [128] public board; 
    
    //function payable takes in address a message and a value, transfers is to set charity address and get a value
    function donate (uint i, bytes32 message) payable public{
        
        board [i] = Donation ({
            from: msg.sender, 
            message: message, 
            value: msg.value
        });
        
        charity.transfer(msg.value);
        
        raised += msg.value;
    }
    
    
}