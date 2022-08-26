// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;


contract HackathonContract {

    string public hackathonName;
    address immutable public organizerAddress;
    uint public prizeCounter;

    mapping(address => string) public sponsors;
    mapping(uint => Prize) public prizes;

    struct Prize {
        string name;
        address sponsor;
        uint amount;
        address organizersNominee;
        address sponsorsNominee;
	bool paid;
    }

    constructor(string memory name_, address organizer_) {
        hackathonName = name_;
        organizerAddress = organizer_;

    }

    function depositPrize(string memory name_, address sponsor_) public payable { 
        bytes memory sponsorBytes = bytes(sponsors[msg.sender]);
        if(sponsorBytes.length == 0){
            sponsors[msg.sender] = name_;
        }

        Prize memory newPrize = Prize(name_, sponsor_, msg.value,address(0),address(0));
        prizes[prizeCounter] = newPrize;
        prizeCounter++;  
    }

    function startDistribution(uint prizeId, address nominated_) public {
	require(msg.sender == organizerAddress, "only organizer");
        prizes[prizeId].organizersNominee = nominated_;
    }

    function approveDistribution(uint prizeId, address nominated_) public {
        require(msg.sender == prizes[prizeId].sponsor, "only sponsor");
        prizes[prizeId].sponsorsNominee = nominated_;
    }

    function withdraw(uint prizeId) public {
        require(prizes[prizeId].organizersNominee == msg.sender && prizes[prizeId].sponsorsNominee == msg.sender && prizes[prizeId].paid != true, "error");
        prizes[prizeId].paid = true;
       	payable(msg.sender).transfer(prizes[prizeId].amount);

    }

  
}
