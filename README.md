# SubHub 🧾 | Ethereum Subscription Smart Contract

**SubHub** is a simple, secure, and gas-efficient smart contract built with Solidity for handling recurring subscription payments on the Ethereum blockchain.

---

## 🔍 Overview

SubHub allows users to:

- Subscribe to a service by paying a fixed monthly fee (30 days).
- Extend their subscription anytime.
- Check subscription status and time left.
- Cancel subscriptions anytime.
- Allows contract owner to update subscription fee and withdraw funds.

---

## 💻 Demo

Try the contract on [Remix IDE](https://remix.ethereum.org).  
Use MetaMask to simulate real Ethereum accounts.

---

## 🛠 Tech Stack

- **Solidity** ^0.8.0
- **Remix IDE** (for development and testing)
- **MetaMask** (for transaction signing)

---
Transanction link:https://scan.test2.btcs.network/tx/0x5b127d6af2db38ab0d1f6e10ddf4223b8e36e8be5d2f85684bbcb1149b0e3807

## 📁 Contract Details

```solidity
Contract Name: SubHub
Subscription Period: 30 Days
Functions: subscribe(), unsubscribe(), isSubscribed(), timeLeft(), withdraw(), changeSubscriptionFee()
