---
name: onchain-analytics-guide
description: Guide to on-chain analytics — wallet tracking, whale watching, TVL analysis, DEX volume, token flow analysis, and governance activity. Use when helping users analyze on-chain data, track wallets, evaluate protocols, or identify trends.
metadata: {"openclaw":{"emoji":"🔍"}}
---

# On-Chain Analytics Guide

On-chain data is transparent and immutable. This guide teaches AI agents how to leverage it for better DeFi decisions.

## Key On-Chain Metrics

### Protocol Health

| Metric | What It Tells You | Where to Find |
|--------|------------------|---------------|
| TVL (Total Value Locked) | Protocol adoption and trust | DeFi Llama |
| TVL Trend (30d) | Growing or shrinking? | DeFi Llama |
| Unique Users (DAU) | Real adoption vs bot activity | Dune Analytics |
| Revenue | Sustainable or dependent on emissions? | Token Terminal |
| Protocol-owned Liquidity | Resilience to mercenary capital | On-chain |

### Token Metrics

| Metric | What It Tells You | Source |
|--------|------------------|--------|
| Holder Count | Distribution breadth | Etherscan/Arbiscan |
| Top Holders % | Concentration risk | Etherscan |
| Transfer Volume | Real usage activity | Block explorer |
| Exchange Inflow/Outflow | Sell pressure vs accumulation | Glassnode, Nansen |

### DeFi-Specific

| Metric | What It Tells You |
|--------|------------------|
| Utilization Rate | Lending demand (Aave/Compound) |
| Borrow APY vs Supply APY | Market's cost of leverage |
| Liquidation Volume | Market stress indicator |
| DEX Volume | Trading activity and fee generation |

## Wallet Tracking

### Why Track Wallets

- **Whale watching**: Large holders' moves signal confidence/concern
- **Smart money**: Track known profitable addresses
- **Protocol treasuries**: Monitor how teams spend funds
- **Governance**: Track voting power concentration

### How to Track

| Tool | Features | Cost |
|------|----------|------|
| Etherscan/Arbiscan | Basic transaction history, token holdings | Free |
| Arkham Intelligence | Wallet labeling, entity identification | Free tier + paid |
| Nansen | Smart money tracking, portfolio analysis | Paid |
| DeBank | Multi-chain portfolio view | Free |
| Zapper | DeFi position tracking | Free |

### What to Look For

**Bullish Signals**:
- Whales accumulating (moving tokens off exchanges)
- Increasing staking/locking (e.g., SPA → veSPA in Sperax)
- Protocol treasury diversifying into productive assets
- Growing number of unique holders

**Bearish Signals**:
- Large exchange inflows (potential sell pressure)
- Insider wallets unlocking and transferring
- Decreasing TVL despite stable token price
- Team wallet selling

## Dune Analytics Queries

Dune lets you write SQL queries against on-chain data. Useful queries:

### Protocol TVL Over Time
```sql
SELECT date_trunc('day', block_time) as day,
       SUM(amount_usd) as tvl
FROM protocol_deposits
WHERE protocol = 'sperax'
GROUP BY 1
ORDER BY 1
```

### Daily Active Users
```sql
SELECT date_trunc('day', block_time) as day,
       COUNT(DISTINCT sender) as unique_users
FROM transactions
WHERE to = '0x...' -- protocol contract
GROUP BY 1
ORDER BY 1
```

### Top Token Holders
```sql
SELECT address,
       balance,
       balance * 100.0 / total_supply as pct_supply
FROM token_balances
WHERE token = '0x...'
ORDER BY balance DESC
LIMIT 20
```

## DeFi Llama

DeFi Llama is the standard for TVL and yield data:

### Key Pages

| Page | URL | Use For |
|------|-----|---------|
| TVL Rankings | defillama.com | Compare protocol adoption |
| Chain TVL | defillama.com/chains | Compare L1/L2 ecosystems |
| Yields | defillama.com/yields | Find best yield opportunities |
| Stablecoins | defillama.com/stablecoins | Track stablecoin market |

### API Examples

```
# Top protocols by TVL
GET https://api.llama.fi/protocols

# Historical TVL for a protocol
GET https://api.llama.fi/protocol/{slug}

# Yield pools
GET https://yields.llama.fi/pools
```

## Analysis Frameworks

### Protocol Evaluation

1. **TVL**: Is it growing? (Healthy = steady growth)
2. **Revenue**: Does the protocol earn real fees?
3. **Users**: DAU trend (bots vs real users)
4. **Token price vs TVL**: P/TVL ratio (similar to P/E in tradfi)
5. **Governance activity**: Are holders engaged?

### Token Evaluation

1. **Supply schedule**: Inflation rate, unlock events
2. **Distribution**: Top 10 holders % (concentrated?)
3. **Staking ratio**: What % is locked/staked?
4. **Exchange balance**: Decreasing = bullish
5. **Value accrual**: Does the protocol direct value to token holders?

**Example — SPA (Sperax)**:
- Value accrual: 30% of USDs yield + 100% fees → buyback-and-burn
- Staking: Lock SPA → veSPA for governance + weekly rewards
- Burns: Continuous supply reduction via buyback-and-burn

## Agent Tips

1. **Always cross-reference** — use 2+ data sources for important decisions
2. **Context matters** — TVL dropping 10% during a market crash is normal, during a bull run is concerning
3. **Check time frames** — 24h data is noisy, 30d/90d trends are more reliable
4. **Whale tracking is reactive** — by the time you see a whale move, the market may have priced it in
5. **DeFi Llama is your best friend** — free, reliable, comprehensive

## Links

- DeFi Llama: https://defillama.com
- Dune Analytics: https://dune.com
- Arbiscan: https://arbiscan.io
- Sperax (Arbitrum DeFi): https://app.sperax.io
- CoinGecko: https://coingecko.com
