// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SavingsContract is ReentrancyGuard {
    address public owner;
    uint256 public minimumDeposit;
    mapping(address => uint256) public deposits;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event MinimumDepositUpdated(uint256 newMinimum);

    constructor(uint256 _initialMinimumDeposit) {
        owner = msg.sender;
        minimumDeposit = _initialMinimumDeposit; // Initialize minimum deposit
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function setMinimumDeposit(uint256 _amount) public onlyOwner {
        minimumDeposit = _amount;
        emit MinimumDepositUpdated(_amount);
    }

    function deposit() public payable {
        require(msg.value >= minimumDeposit, "Deposit is below the minimum");

        deposits[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) public nonReentrant {
        require(deposits[msg.sender] >= _amount, "Insufficient balance");

        deposits[msg.sender] -= _amount;
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");
        emit Withdrawn(msg.sender, _amount);
    }

    function getBalance() public view returns (uint256) {
        return deposits[msg.sender];
    }
}