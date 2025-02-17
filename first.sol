// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 导入 OpenZeppelin 的 ERC-20 实现
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 自定义代币合约
contract FirstToken is ERC20 {
    // 构造函数，初始化代币名称、符号和总量
    constructor() ERC20("FirstToken", "ft") {
        // 在部署时将 10 亿个代币 mint 给合约部署者
        uint256 totalSupply = 1_000_000_000 * (10 ** uint256(decimals())); // 10 亿个代币
        _mint(msg.sender, totalSupply);
    }
}