pragma solidity 0.5.0;

contract SuicideEasily{
    address public owner;
    
    constructor() public payable{
        owner = msg.sender;
        require(msg.value > 0);
    }
    
    modifier OnlyOwner{
        require(msg.sender == owner);
        _;
    }
    
    function withdraw() external OnlyOwner{
        msg.sender.transfer(address(this).balance);
    }
    
    //The selfdestruct operation has no access control, so anyone
    //can kill the contract and transfer the contract deposit to 
    //their own account.
    function suicide(address payable _Beneficiary) external{
        selfdestruct(_Beneficiary);
    }
}