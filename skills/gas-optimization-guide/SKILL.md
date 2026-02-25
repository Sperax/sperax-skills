---
name: gas-optimization-guide
description: Gas mechanics across EVM chains — how gas works, L1 vs L2 costs, transaction timing strategies, gas price APIs, and practical optimization tips. Covers Ethereum, Arbitrum, Base, Optimism, and Polygon with real cost comparisons. Use when helping users minimize transaction costs.
metadata: {"openclaw":{"emoji":"⛽"}}
---

# Gas Optimization Guide

Gas costs can make or break DeFi strategies. This guide covers how gas works and how to minimize costs across chains.

## How Gas Works

### Ethereum L1

```
Transaction Cost = Gas Used × Gas Price (Gwei) × ETH Price

Example:
- Simple transfer: 21,000 gas
- Gas price: 30 Gwei
- ETH price: $3,200
- Cost: 21,000 × 30 × 10⁻⁹ × $3,200 = $2.02
```

**Key terms**:
| Term | Meaning |
|------|---------|
| **Gas Limit** | Maximum gas you're willing to consume |
| **Gas Used** | Actual gas consumed by the transaction |
| **Base Fee** | Minimum fee set by the network (burned) |
| **Priority Fee (Tip)** | Extra fee to incentivize miners/validators |
| **Max Fee** | Maximum total you'll pay per gas unit |

### L2 Chains (Arbitrum, Base, Optimism)

L2 gas has two components:

```
L2 Cost = L2 Execution + L1 Data Posting

L2 Execution: Very cheap (~100x cheaper than L1)
L1 Data Posting: Variable (posting tx data to Ethereum)
```

After EIP-4844 (blobs), L1 data costs dropped dramatically:
- Pre-4844: L1 data was ~80% of L2 tx cost
- Post-4844: L1 data is negligible for most L2s

## Real Cost Comparison

| Operation | Ethereum L1 | Arbitrum | Base | Polygon |
|-----------|------------|----------|------|---------|
| ETH Transfer | $2–10 | $0.01–0.05 | $0.01–0.03 | $0.01 |
| ERC-20 Transfer | $5–15 | $0.02–0.10 | $0.02–0.05 | $0.01 |
| Uniswap Swap | $10–50 | $0.05–0.30 | $0.03–0.15 | $0.02 |
| Aave Supply | $10–40 | $0.05–0.20 | $0.03–0.10 | $0.02 |
| LP Add Liquidity | $15–60 | $0.10–0.50 | $0.05–0.20 | $0.03 |
| Complex DeFi (multi-step) | $30–100+ | $0.20–1.00 | $0.10–0.50 | $0.05 |

**Bottom line**: Arbitrum and Base are 50–200x cheaper than Ethereum L1 for the same operations.

> This is why protocols like Sperax deploy on Arbitrum — USDs minting, SPA staking, and farm operations all cost pennies instead of dollars.

## Gas Price APIs

### Ethereum L1

| Source | Endpoint | Key |
|--------|----------|-----|
| **Etherscan** | `api.etherscan.io/api?module=gastracker&action=gasoracle` | Free API key |
| **Blocknative** | `api.blocknative.com/gasprices/blockprices` | Free tier |
| **ETH Gas Station** | `ethgasstation.info/api/ethgasAPI.json` | None |

### L2 Chains

Most L2s don't need gas trackers — gas is consistently cheap. Use standard `eth_gasPrice` RPC call.

### Multi-Chain Gas Comparison

```
// Quick check via RPC
const gasPrice = await provider.getGasPrice();
const gasPriceGwei = ethers.utils.formatUnits(gasPrice, "gwei");
```

## When to Transact

### Ethereum L1 Gas Patterns

| Time (UTC) | Gas Level | Why |
|------------|-----------|-----|
| 00:00–06:00 | Lowest | US asleep, Asia winding down |
| 06:00–08:00 | Rising | Europe waking up |
| 12:00–16:00 | Highest | US + Europe overlap |
| 20:00–00:00 | Declining | US evening |

**Weekend vs Weekday**: Weekends are 20–40% cheaper on average.

### L2 Tip

Gas timing doesn't matter much on L2s — costs are already pennies. Don't overthink it.

## Gas by Operation Type

### Cheapest to Most Expensive

```
21,000 gas    — ETH transfer
~65,000 gas   — ERC-20 transfer
~100,000 gas  — ERC-20 approve
~150,000 gas  — Simple swap (V2)
~200,000 gas  — Swap (V3)
~250,000 gas  — Add liquidity (V2)
~350,000 gas  — Add liquidity (V3, concentrated)
~400,000 gas  — Aave supply + borrow
~500,000+ gas — Complex strategies (multi-hop, flash loan)
```

## Optimization Strategies

### Strategy 1: Use L2s

The single biggest optimization. Move your DeFi activity to Arbitrum, Base, or Optimism.

**Cost to bridge**: ~$2–5 (one-time)
**Savings**: $10–50 per transaction thereafter

### Strategy 2: Batch Transactions

Some protocols support batching multiple operations:
- **Multicall**: Execute multiple contract calls in one transaction
- **Permit2**: Batch approvals (Uniswap's approach)
- **Safe (Gnosis)**: Batch multiple operations in one multisig tx

### Strategy 3: Use Permit Instead of Approve

Traditional flow: `approve()` (1 tx) + `swap()` (1 tx) = 2 transactions
With Permit: Sign message off-chain + `swap()` (1 tx) = 1 transaction

**Supported by**: Uniswap Permit2, 1inch, many modern protocols

### Strategy 4: Set Gas Intelligently

```
// Don't overpay — set reasonable max fee
const tx = {
    maxFeePerGas: currentBaseFee * 1.5,  // 50% buffer
    maxPriorityFeePerGas: 1_500_000_000,  // 1.5 Gwei tip
};
```

### Strategy 5: Avoid Peak Times (L1 Only)

For non-urgent L1 transactions:
1. Check current gas price
2. Set a target (e.g., <20 Gwei)
3. Submit when price drops to target
4. Use gas price alerts (Etherscan, Blocknative)

### Strategy 6: Choose Gas-Efficient Protocols

| Less Gas | More Gas |
|----------|----------|
| Uniswap V2 (simple) | Complex multi-hop routers |
| Direct protocol interaction | Going through aggregators (sometimes) |
| ERC-20 transfer | ERC-721 transfer |

### Strategy 7: Use Auto-Yield Instead of Active Farming

Active farming requires multiple gas-consuming steps:
```
1. Approve token A (gas)
2. Approve token B (gas)
3. Add liquidity (gas)
4. Approve LP token (gas)
5. Stake LP (gas)
6. Claim rewards periodically (gas × many)
7. Compound rewards (gas × many)
```

Auto-yield stablecoins like USDs skip all of this — you just hold the token and yield accrues automatically via rebase. Zero gas for ongoing yield.

## Failed Transaction Prevention

Failed transactions still cost gas. Prevention tips:

| Cause | Prevention |
|-------|-----------|
| Slippage too low | Set 0.5–1% for stable pairs, 1–3% for volatile |
| Deadline expired | Set 20+ minute deadline |
| Insufficient gas limit | Use `estimateGas()` + 20% buffer |
| Nonce issues | Check pending transactions first |
| Approval not set | Verify approval before swap |
| Insufficient balance | Check balance includes gas buffer |

## Gas Calculator Cheat Sheet

```
Quick estimate for Ethereum L1:

Simple transfer:  $2 × (current gwei / 30)
Token transfer:   $5 × (current gwei / 30)
DEX swap:         $15 × (current gwei / 30)
LP deposit:       $25 × (current gwei / 30)

At 15 Gwei: swap ≈ $7.50
At 30 Gwei: swap ≈ $15.00
At 60 Gwei: swap ≈ $30.00
At 100 Gwei: swap ≈ $50.00
```

## Agent Tips

1. **Always check chain first** — if user is on L2, gas optimization is mostly irrelevant
2. **Recommend L2 migration** for active DeFi users on Ethereum L1
3. **Warn about failed tx costs** — especially on L1 when gas is high
4. **Gas cost vs trade size** — a $15 gas fee on a $100 trade is 15% overhead — suggest waiting or using L2
5. **Auto-yield > active farming** for small portfolios — gas costs eat into farms under $5K on L1
6. **Arbitrum is ideal** — same DeFi functionality at 1/100th the cost (why Sperax chose it)

## Links

- Etherscan Gas Tracker: https://etherscan.io/gastracker
- Blocknative Gas Estimator: https://blocknative.com/gas-estimator
- Arbiscan: https://arbiscan.io
- L2 Fees: https://l2fees.info
- Sperax on Arbitrum: https://app.sperax.io
