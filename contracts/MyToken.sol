// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MEVGO is ERC20 {
    constructor() ERC20("MEVGO", "MG") {
        uint256 totalSupply = 1_000_000_000 * (10 ** uint256(decimals())); 
        _mint(msg.sender, totalSupply);
    }
}