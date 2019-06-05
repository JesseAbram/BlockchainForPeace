pragma solidity ^0.5.0;

contract BlockchainForPeace {
    

    // to see the total raised 
    uint public raised;
    address payable charity; 
    
    //struct for the donation 
    struct Donation {
        address donor; 
        string message; 
        uint value; 
    }
    
    Donation[] public donations; 
    
    //mapping an address to the donation struct 
    //mapping (address => donation) public donors;
    event Donate(address indexed from, uint amount, string message);
    
    //constructor to initiate the address of the charity being donated to
    constructor () public {
        charity = 0x7cbac639dbb1Ec92DC0FBDDEEdbbf3Cfd397387D;
    }
   
    // payable function which auto transfers money to charity address, collects the value and increases the total value counter. Also allows for anonoymous donations
     function () payable external {
        raised += msg.value;
        charity.transfer(msg.value);
     }
    // optional message to be sent with donation, peace message.
    function messageForPeace(string memory _message) payable public {
        require(msg.value > 0);
        donations.push(Donation(msg.sender, _message, msg.value));
        charity.transfer(msg.value);
        raised += msg.value;
        emit Donate(msg.sender, msg.value, _message);
    }

    function getDonation(uint _index) public view returns (address, string memory, uint) {
        Donation memory don = donations[_index];
        return (don.donor, don.message, don.value);
    }
    
    function getDonationLength() public view returns (uint){
        return donations.length;
    }

     function getRaised() public view returns (uint){
        return raised;
    }
}