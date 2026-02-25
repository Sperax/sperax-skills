---
name: sperax-ecosystem-overview
description: High-level overview of the Sperax ecosystem — USDs auto-yield stablecoin, SPA/veSPA governance, Sperax Farms, ERC-8004 on-chain agent identity, and SperaxOS AI Agent Workspace. Use when giving ecosystem overviews, comparing DeFi products, or explaining how Sperax components work together.
metadata: {"openclaw":{"emoji":"🌐","homepage":"https://sperax.io"}}
---

# Sperax Ecosystem Overview

Sperax is a **DeFi + AI** ecosystem on Arbitrum with three interconnected layers:

```
┌──────────────────────────────────────────────────┐
│              SperaxOS Platform                    │
│          AI Agent Workspace (Frontend)           │
│  45+ DeFi Tools · Portfolio · Social · Agents    │
└──────────┬──────────────┬──────────────┬─────────┘
           │              │              │
      ┌────▼────┐   ┌────▼─────┐   ┌────▼────────┐
      │ Sperax  │   │ External │   │  ERC-8004   │
      │Protocol │   │   DeFi   │   │  On-Chain   │
      │         │   │          │   │  Identity   │
      │ USDs    │   │ Aave     │   │ 12 chains   │
      │ SPA     │   │ Uniswap  │   │ Agent NFTs  │
      │ veSPA   │   │ Compound │   │ Reputation  │
      │ Farms   │   │ Curve    │   │ Validation  │
      └─────────┘   └──────────┘   └─────────────┘
```

## 1. USDs — Auto-Yield Stablecoin

- **What**: Stablecoin that grows in your wallet automatically
- **Chain**: Arbitrum One
- **Backing**: 100% collateralized (USDC, USDC.e, USDT)
- **Yield**: 70% of DeFi strategy yield → holders, 30% → SPA burn
- **Max APY**: 25% cap
- **Strategies**: Aave, Compound, Fluid, Stargate, Curve

## 2. SPA — Governance Token

- **Value accrual**: Protocol fees + yield → buyback-and-burn
- **Staking**: Lock SPA → veSPA (7 days to 4 years)
- **veSPA power**: `SPA × (lockup_days / 365)`
- **Rewards**: Weekly USDs fees + 420K xSPA/week

## 3. Sperax Farms — No-Code Liquidity Farming

- Create reward programs for any LP pool
- Supported: Uniswap V2/V3, Camelot V2/V3, Balancer V2
- Up to 4 reward tokens per farm
- Cost: 100 USDs to create

## 4. ERC-8004 — On-Chain Agent Identity

Open standard for AI agent discovery + reputation on 12 chains:
- **Identity Registry**: ERC-721 NFT agent identities
- **Reputation Registry**: Quality signals (rating, uptime, latency, yield)
- **Validation Registry**: zkML, TEE, and staker attestations
- **Chains**: Ethereum, Arbitrum, Base, Optimism, Polygon, BNB Chain (mainnet + testnet)

## 5. SperaxOS — AI Agent Workspace

Open-source AI workspace combining conversational AI with DeFi:
- **45+ builtin tools**: Swaps, portfolio, lending, yield, analytics
- **30+ strategy templates**: Automated DeFi workflows
- **Multi-model AI**: Works with GPT, Claude, Gemini, and more
- **Agent marketplace**: Community-built agent skills
- **ERC-8004 integration**: Register agents on-chain

## Revenue & Token Flows

```
DeFi Strategy Yield (Aave, Compound, Curve, etc.)
        │
        ├── 70% → USDs holders (auto-rebase)
        └── 30% → SPA buyback-and-burn

Protocol Fees
        │
        └── 100% → veSPA stakers (weekly USDs)

xSPA Rewards (420K/week to veSPA stakers)
        │
        ├── Stake → veSPA (1:1, ≥180-day lock)
        └── Redeem → 0.5–1.0 SPA (15–180 day vest)
```

## Key Links

| Resource | URL |
|----------|-----|
| Sperax App | https://app.sperax.io |
| Sperax Docs | https://docs.sperax.io |
| SperaxOS | https://sperax.io |
| ERC-8004 Spec | https://eips.ethereum.org/EIPS/eip-8004 |
| Governance | https://snapshot.box/#/s:speraxdao.eth |
| GitHub | https://github.com/nicholasgriffintn/sperax |
