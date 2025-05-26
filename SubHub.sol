// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubHub {
    address public owner;
    uint public subscriptionFee;
    uint public subscriptionDuration = 30 days;

    struct Subscriber {
        uint subscribedTill;
    }

    mapping(address => Subscriber) public subscribers;

    event Subscribed(address indexed user, uint till);
    event Unsubscribed(address indexed user);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner allowed");
        _;
    }

    modifier onlySubscribed() {
        require(isSubscribed(msg.sender), "Not subscribed");
        _;
    }

    constructor(uint _fee) {
        owner = msg.sender;
        subscriptionFee = _fee;
    }

    function subscribe() external payable {
        require(msg.value == subscriptionFee, "Incorrect fee");

        uint currentTime = block.timestamp;
        uint newExpiry;

        if (isSubscribed(msg.sender)) {
            // Extend subscription
            newExpiry = subscribers[msg.sender].subscribedTill + subscriptionDuration;
        } else {
            // New subscription
            newExpiry = currentTime + subscriptionDuration;
        }

        subscribers[msg.sender].subscribedTill = newExpiry;
        emit Subscribed(msg.sender, newExpiry);
    }

    function unsubscribe() external onlySubscribed {
        delete subscribers[msg.sender];
        emit Unsubscribed(msg.sender);
    }

    function isSubscribed(address user) public view returns (bool) {
        return subscribers[user].subscribedTill > block.timestamp;
    }

    function timeLeft(address user) external view returns (uint) {
        if (!isSubscribed(user)) return 0;
        return subscribers[user].subscribedTill - block.timestamp;
    }

    function changeSubscriptionFee(uint _newFee) external onlyOwner {
        subscriptionFee = _newFee;
    }

    function withdraw() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    function contractBalance() external view onlyOwner returns (uint) {
        return address(this).balance;
    }
}
