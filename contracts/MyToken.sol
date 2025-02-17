// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract FirstToken is ERC20, ERC20Permit {
    constructor() ERC20("FirstToken", "ft") ERC20Permit("FirstToken") {
        // 在部署时将 10 亿个代币 mint 给合约部署者
        uint256 totalSupply = 1_000_000_000 * (10 ** uint256(decimals())); // 10 亿个代币
        _mint(msg.sender, totalSupply);
    }
}