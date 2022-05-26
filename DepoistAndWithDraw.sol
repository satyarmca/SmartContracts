// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 *contract to do deposits and withdrawl
 */
contract DepositAndWithDraw{

    address accountHolder;
    address dadsAccount = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address kidsAccount = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
   
    mapping(address => uint) account;

    constructor() {
        accountHolder = msg.sender;
        account[accountHolder] = 500;
    }
    
    function depositeTo(uint amount, address toAccount) public {
        require(accountHolder == msg.sender, "Invalid Access");
        require(account[msg.sender] >= amount, "Insufficient Balance");
        account[msg.sender] = account[msg.sender] - amount;
        account[toAccount] = account[toAccount] + amount;
    }

    function withDraw(uint amount) public{
       require(account[msg.sender] >= amount, "Insufficient Balance");
       account[msg.sender] = account[msg.sender] - amount;
    }

    function getBalance() public view returns(uint) {
        return account[msg.sender];
    }

}