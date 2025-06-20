// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Project {\
    address public owner;
    
    event FundsLocked(address indexed owner, uint256 amount, uint256 unlockTim
    event FundsWithdrawn(address indexed owner, uint256 
    event TimelockExtended(uint256 newUnlockTime)
    modifier onlyOwner()
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    modifier canWithdraw() {
        require(block.timestamp >= unlockTime, "Funds are still locked");
        require(!fundsWithdrawn, "Funds already withdrawn");
        require(lockedAmount > 0, "No funds to withdraw");
        _;
    }
    
        require(lockedAmount == 0, "Funds already locked");
        
        lockedAmount = msg.value;
        emit FundsLocked(owner, msg.value, unlockTime);
    }
    
    /**
     * @dev Withdraw funds after unlock time expires
     * Core Function 2: Withdrawal mechanism
     */
    function withdraw() external onlyOwner canWithdraw {
        uint256 amount = lockedAmount;
        fundsWithdrawn = true;
        lockedAmount = 0;
        
        (bool success, ) = payable(owner).call{value: amount}("");
        require(success, "Transfer failed");
        
        emit FundsWithdrawn(owner, amount);

    
    /**
     * @dev Extend the lock time (can only increase, not decrease)
     * Core Function 3: Time extension mechanism
     */
    function extendLockTime(uint256 _additionalTime) external onlyOwner {
        require(_additionalTime > 0, "Additional time must be greater than 0");
        require(!fundsWithdrawn, "Cannot extend after withdrawal");
        require(lockedAmount > 0, "No funds locked");
        
        unlockTime += _additionalTime;
        emit TimelockExtended(unlockTime);
    }
    
    // View functions
    function timeUntilUnlock() external view returns (uint256) {
        if (block.timestamp >= unlockTime) {
            return 0;
        }
        return unlockTime - block.timestamp;
    }
    
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
    
    function canWithdrawNow() external view returns (bool) {
        return block.timestamp >= unlockTime && !fundsWithdrawn && lockedAmount > 0;
    }
    
    function getContractInfo() external view returns (
        address contractOwner,
        uint256 lockEndTime,
        uint256 locked,
        bool withdrawn,
        uint256 currentTime
    ) {
        return (owner, unlockTime, lockedAmount, fundsWithdrawn, block.timestamp);
    }
}
