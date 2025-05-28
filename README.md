## Project Description

Simple Timelock is a smart contract solution designed to provide time-based access control for digital assets. The contract allows users to lock their funds for a predetermined period, ensuring that the assets cannot be accessed until the specified unlock time has passed. This creates a trustless escrow mechanism that operates entirely on-chain without requiring third-party intervention.

The contract is built with security and simplicity in mind, featuring essential timelock functionality while maintaining gas efficiency and user-friendly operations.

## Project Vision

Our vision is to provide a foundational building block for decentralized finance (DeFi) applications that require time-based restrictions. By offering a simple, secure, and reliable timelock mechanism, we aim to enable developers and users to implement various use cases such as:

- **Savings Plans**: Enforce disciplined saving by preventing early withdrawal
- **Vesting Schedules**: Implement token or fund vesting for team members or investors  
- **Security Delays**: Add time delays for critical operations as a security measure
- **DeFi Protocols**: Serve as a primitive for more complex financial instruments

We envision this contract being used as a foundation for more sophisticated DeFi protocols while maintaining its core principle of simplicity and reliability.

## Key Features

### 🔒 **Secure Fund Locking**
- Lock ETH for a predetermined duration set during contract deployment
- Funds are completely inaccessible until the unlock time is reached
- Only the contract owner can lock and withdraw funds

### ⏰ **Flexible Time Management**
- Set custom lock durations during deployment
- Extend lock time if needed (security feature - can only increase, not decrease)
- Real-time tracking of remaining lock time

### 🛡️ **Security-First Design**
- Owner-only access controls prevent unauthorized operations
- Reentrancy protection and safe transfer mechanisms
- Prevention of double-spending and multiple withdrawals
- Comprehensive input validation

### 📊 **Transparent Operations**
- Complete visibility into contract status and locked funds
- Event logging for all major operations (locking, withdrawal, time extensions)
- Public view functions for checking contract state

### ⚡ **Gas Optimized**
- Efficient code structure minimizes transaction costs
- Optimized storage usage reduces deployment and interaction costs
- Clean, readable code that's easy to audit and verify

## Future Scope

### 🔄 **Multi-Asset Support**
- Extend functionality to support ERC-20 tokens alongside ETH
- Multi-token timelock capabilities for diversified holdings
- Integration with popular DeFi tokens and protocols

### 👥 **Multi-Signature Integration**
- Support for multiple owners/beneficiaries
- Configurable signature requirements for enhanced security
- Role-based access controls for different operations

### 📈 **Advanced Features**
- **Partial Withdrawals**: Allow percentage-based withdrawals after unlock
- **Automatic Renewals**: Option to automatically extend lock periods
- **Interest Integration**: Connect with yield-farming protocols for locked funds
- **NFT Receipts**: Issue NFTs as proof of locked funds

### 🌐 **Cross-Chain Expansion**
- Deploy on multiple blockchain networks
- Cross-chain timelock synchronization
- Bridge compatibility for multi-chain operations

### 🔧 **Developer Tools**
- SDK development for easy integration
- Template contracts for common use cases
- Comprehensive testing frameworks and documentation
- Integration guides for popular DeFi protocols

### 📱 **User Experience**
- Web3 frontend interface for easy interaction
- Mobile-responsive design and mobile app development
- Integration with popular Web3 wallets
- User-friendly dashboards for managing multiple timelocks

---

## Installation & Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd simple-timelock

Install dependencies
bashnpm install

Configure environment
bashcp .env.example .env
# Edit .env file with your private key

Compile contracts
bashnpm run compile

Deploy to Core Testnet 2
bashnpm run deploy


Usage
Deployment
The contract constructor requires a lock duration in seconds:
javascript// Deploy with 1 hour lock time
const lockDuration = 3600; // 1 hour in seconds
const timelock = await Project.deploy(lockDuration);
![Screenshot (1)](https://github.com/user-attachments/assets/772b29bf-e70d-4036-8d56-592eb5aaee10)
