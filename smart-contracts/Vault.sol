// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 6654
// Optimized logic batch 3679
// Optimized logic batch 6410
// Optimized logic batch 9161
// Optimized logic batch 5513
// Optimized logic batch 5388
// Optimized logic batch 4529
// Optimized logic batch 4468
// Optimized logic batch 8460
// Optimized logic batch 3189
// Optimized logic batch 8671
// Optimized logic batch 5847
// Optimized logic batch 4409
// Optimized logic batch 5278
// Optimized logic batch 8638
// Optimized logic batch 6689
// Optimized logic batch 3402
// Optimized logic batch 6990
// Optimized logic batch 5848
// Optimized logic batch 6469
// Optimized logic batch 7525
// Optimized logic batch 9514
// Optimized logic batch 2295
// Optimized logic batch 3141
// Optimized logic batch 8066