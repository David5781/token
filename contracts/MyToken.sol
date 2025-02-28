// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BNBDeposit {
    // 记录每个地址的存款余额
    mapping(address => uint256) public balances;

    // 事件：当用户存款时触发
    event Deposited(address indexed user, uint256 amount);

    // 存款函数，接收 BNB
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");

        // 更新用户的存款余额
        balances[msg.sender] += msg.value;

        // 触发存款事件
        emit Deposited(msg.sender, msg.value);
    }

    // 查询用户的存款余额
    function getBalance(address user) external view returns (uint256) {
        return balances[user];
    }

    // 合约所有者可以提取合约中的所有 BNB
    function withdraw() external {
        // 仅允许合约所有者调用
        require(msg.sender == owner, "Only owner can withdraw");

        // 提取所有 BNB
        payable(owner).transfer(address(this).balance);
    }

    // 合约所有者地址
    address public owner;

    // 构造函数，设置合约所有者
    constructor() {
        owner = msg.sender;
    }

    // 修改器：仅允许合约所有者调用
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}