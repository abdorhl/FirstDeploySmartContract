# SContract

## Overview

The `SmContract` is a smart contract that allows users to deposit and withdraw Ether in a decentralized and secure manner. The contract enforces a minimum deposit amount and ensures the contract owner has control over the minimum deposit threshold. Additionally, it uses the `ReentrancyGuard` from OpenZeppelin to protect against reentrancy attacks during withdrawals.

## Features

- **Minimum Deposit**: The contract enforces a minimum deposit amount set by the owner.
- **Deposit and Withdrawals**: Users can deposit Ether into the contract and withdraw their balance.
- **Reentrancy Protection**: The contract uses OpenZeppelin's `ReentrancyGuard` to prevent reentrancy attacks during withdrawals.
- **Owner Control**: The contract owner can update the minimum deposit amount at any time.
- **Event Logging**: Events are emitted for deposits, withdrawals, and changes to the minimum deposit amount.

## Requirements

- **Solidity Version**: ^0.8.26
- **OpenZeppelin Contracts**: The contract uses the `ReentrancyGuard` from OpenZeppelin for security.

## Installation

1. Install the OpenZeppelin library to access the `ReentrancyGuard`:
   ```bash
   npm install @openzeppelin/contracts
   ```

2. Compile and deploy the contract on a supported Ethereum-compatible network.

## Contract Functions

### 1. `constructor(uint256 _initialMinimumDeposit)`
The constructor sets the contract owner to the address deploying the contract and initializes the minimum deposit requirement.

- **Parameters**:
  - `_initialMinimumDeposit`: The initial minimum deposit amount in wei.

### 2. `setMinimumDeposit(uint256 _amount)`
Allows the owner to change the minimum deposit amount.

- **Parameters**:
  - `_amount`: The new minimum deposit amount in wei.

### 3. `deposit()`
Users can deposit Ether into the contract. The deposit amount must be greater than or equal to the minimum deposit set by the owner.

- **Usage**: `contract.deposit()` with a value of Ether sent to the contract.

### 4. `withdraw(uint256 _amount)`
Users can withdraw a specific amount of Ether from their balance. The contract ensures the user has enough balance to withdraw and prevents reentrancy attacks.

- **Parameters**:
  - `_amount`: The amount of Ether to withdraw (in wei).

### 5. `getBalance()`
Allows users to check their balance within the contract.

- **Returns**: The balance of the caller in wei.

## Events

### 1. `Deposited(address indexed user, uint256 amount)`
Emitted when a user deposits Ether into the contract.

- **Parameters**:
  - `user`: The address of the user who deposited.
  - `amount`: The amount of Ether deposited.

### 2. `Withdrawn(address indexed user, uint256 amount)`
Emitted when a user withdraws Ether from the contract.

- **Parameters**:
  - `user`: The address of the user who withdrew.
  - `amount`: The amount of Ether withdrawn.

### 3. `MinimumDepositUpdated(uint256 newMinimum)`
Emitted when the contract owner updates the minimum deposit requirement.

- **Parameters**:
  - `newMinimum`: The new minimum deposit amount in wei.

## Security Considerations

- The contract uses `ReentrancyGuard` to protect against reentrancy attacks during withdrawals.
- Ensure that the owner’s address is secure, as they have the ability to modify the minimum deposit threshold.

## License

This contract is licensed under the MIT License.

