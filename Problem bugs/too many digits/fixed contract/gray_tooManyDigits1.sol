pragma solidity 0.5.0;

//based on slither

contract gray_tooManyDigits1 {
    uint256 public oncePrice = 1e18; //10^18 
    address[] public users;
    address public payable owner;
    
    constructor() public{
        owner = msg.sender;
    }
    
    function withdraw() external{
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
    
    function pay() external payable{
        require(msg.value == oncePrice);    //1 ether 1 time
        users.push(msg.sender);
    }
}