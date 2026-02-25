---
name: plutus-protocol-overview
description: Comprehensive overview of Plutus — the multichain DeFi yield platform and Arbitrum-native governance aggregator. Covers plsASSETs, plvASSETs (vaults), tokenomics ($PLUTUS, $xPLUTUS), governance, and the community-led DAO structure. Use when explaining Plutus products, comparing governance aggregation strategies, or evaluating Plutus yield opportunities.
metadata: {"openclaw":{"emoji":"⚡","homepage":"https://plutus.fi","requires":[]}}
---

# Plutus Protocol Overview

Plutus is a **multichain DeFi yield platform and Arbitrum-native governance aggregator** that optimizes user rewards, maintains liquidity, and consolidates both governance power and protocol yield into the $xPLUTUS token.

```
┌───────────────────────────────────────────────────────────────┐
│                         PLUTUS DAO                            │
│        Multichain Yield Platform + Governance Aggregator      │
├──────────────────────┬────────────────────────────────────────┤
│     plsASSETs        │           plvASSETs (Vaults)           │
│  Governance Agg.     │         Yield Strategies               │
│                      │                                        │
│  plsBERA (Berachain) │  plvHEDGE (Multi-strategy)             │
│  plsGRAIL (Camelot)  │  plvDOLO  (Dolomite ecosystem)        │
│  plsSYK  (Stryke)    │  plvLOOP  (Multi-asset looping)        │
│  plsSPA  (Sperax)    │                                        │
│  plsRDNT (Radiant)   │  Chains: Arbitrum, Berachain,          │
│  plsPLUTUS (Q1 2026) │          Superseed, Botanix            │
├──────────────────────┴────────────────────────────────────────┤
│                    $PLUTUS / $xPLUTUS                          │
│         LayerZero OFT · Yield · DAO Governance                │
└───────────────────────────────────────────────────────────────┘
```

## Core Concept

Plutus lets users earn **max-locked veToken rewards without actually locking** their capital. By depositing governance tokens (SPA, GRAIL, SYK, RDNT, BERA) into Plutus, users receive liquid **plsASSETs** that represent permanently locked positions. These plsASSETs can be:

- **Staked** to earn max-lock yields + PLS emissions
- **Traded** on DEXs — maintaining full liquidity
- **LP'd** for additional farming rewards

Users forgo direct governance rights in exchange for liquidity and overcollateralized yields. That governance power is redirected through $xPLUTUS stakers.

## Product Categories

### 1. plsASSETs — Governance Aggregation

Liquid, yield-bearing wrappers around locked governance tokens:

| plsASSET | Underlying | Lock Type | Chain | Fee |
|----------|-----------|-----------|-------|-----|
| plsBERA | sWBERA | Staked WBERA | Berachain | 12% |
| plsGRAIL | xGRAIL | Permanent lock | Arbitrum | 12% |
| plsSYK | xSYK | Permanent lock | Arbitrum | 12% |
| plsSPA | veSPA | 4-year max lock | Arbitrum | 12% |
| plsRDNT | dLP | Max lock (paused) | Arbitrum | 20% |
| plsPLUTUS | xPLUTUS | Staked PLUTUS (upcoming) | TBD | 12% |

**Key mechanism — Overcollateralization**: Plutus uses a portion of fees to buy back plsASSETs off the market, removing them from circulation. Since the underlying assets still yield but the bought-back plsASSETs don't claim rewards, those rewards compound for remaining stakers.

**Buyback soft floor**: Plutus maintains a 1:0.8 soft floor on all plsASSETs — when the swap rate drops below this threshold, treasury buybacks kick in.

### 2. plvASSETs — Yield Vaults

Automated, actively managed strategy vaults:

| Vault | Strategy | Risk | Chains |
|-------|----------|------|--------|
| plvHEDGE | Multi-strategy (funding arb + more) | Medium | Arbitrum, Berachain, Superseed |
| plvDOLO | Dolomite ecosystem, slightly hedged | Medium-High | Arbitrum, Berachain, Botanix |
| plvLOOP | Multi-asset looping (ETH/BERA/BTC) | High | Arbitrum, Berachain, Botanix |

All vaults:
- 12% performance fee on realized profits (net values displayed)
- Fully automated — no user maintenance required
- Multi-chain accessible
- Audited by Omniscia and Cyberscope

## Tokenomics

### $PLUTUS
- LayerZero OFT (Omnichain Fungible Token)
- Cross-chain yield and governance layer
- Available on Arbitrum and Berachain
- Can be staked 1:1 into $xPLUTUS

### $xPLUTUS
- Yield-bearing escrowed token
- Earns $PLUTUS buyback yield from protocol revenue
- Each token = 1 DAO vote on Snapshot
- Redeemable: 14 days (0.5:1 ratio) → 180 days (1:1 ratio)

### Token Migration (from PLS)

| Old Token | New Token | Rate |
|-----------|-----------|------|
| PLS | PLUTUS | 1:1 |
| PLS | xPLUTUS | 1:1.11 |
| vlPLS | xPLUTUS | 1:1 |
| esPLS | xPLUTUS | 1:1 |

### Max Supply: 100,000,000

- Platform Rewards: 35%
- Liquidity Mining: 15%
- Operational: 13.8%
- Bonding: 10%
- Public TGE: 10%
- Private TGE: 4.2%
- Team: 12%

## Governance

Plutus is a fully community-led DAO since July 2024. Governance model:

1. **Proposals (PRFCs)** — written by team or holders with >1M $xPLUTUS
2. **Voting** — on Snapshot, 1 xPLUTUS = 1 vote
3. **Execution** — via multi-sig wallets (majority of signatories required)

Key governance milestones:
- May 2024: Team announced transition to community-led model
- July 2024: Formal Snapshot vote passed — community took full control
- Established transparent treasury management (weekly reviews, quarterly reports)

## Sperax × Plutus Connection

Plutus and Sperax have a deep integration through **plsSPA**:

- plsSPA is a liquid receipt for **4-year max-locked veSPA**
- Provides ~14% APR vs ~3.3% for a 1-year lock (4x+ higher)
- Staking options: plsSPA single-stake or Sperax Demeter Farm (plsSPA/SPA LP)
- Rewards paid in xSPA, plsSPA, and SPA
- Trading pair on Camelot DEX

## Fee Structure

All plsASSETs: 12% performance fee (except plsRDNT at 20%)
All plvASSETs: 12% performance fee on realized profits

Fees fund:
- Overcollateralization buybacks
- Liquidity provision
- Protocol treasury → xPLUTUS yield distribution

## Security

- plvHEDGE audited by [Omniscia](https://omniscia.io/reports/plutus-dao-hedge-vault-674de8fb6dc0450018dd65ec/)
- plvDOLO audited by Omniscia + [Cyberscope](https://www.cyberscope.io/audits/1-plutus)
- Multi-sig treasury wallets across all chains
- No custodial risk — all interactions are on-chain

## Contracts (Key)

| Contract | Address |
|----------|---------|
| PLUTUS (Arbitrum) | `0x8c1ea32448e09a59f36595abec6207c9ebd590a2` |
| xPLUTUS (Arbitrum) | `0x7f89c81561C1A56d983cc5682348310cC330bca7` |
| plsSPA | `0x0D111e482146fE9aC9cA3A65D92E65610BBC1Ba6` |
| plvHEDGE (Arbitrum) | `0x58BfC95a864e18E8F3041D2FCD3418f48393fE6A` |
| plvDOLO (Arbitrum) | `0xf84eaA0685626f84fE17bc6C3c9eb2Ac8a90d3C1` |
| plvLOOP (Arbitrum) | `0x4a15404235f4A0BC2CBCF5ba7E92763cB8335660` |

## Risk Disclaimers

- plsASSETs and vault deposits are **not insured** and may lose value
- Yields are estimates, not guarantees
- Risks include: smart contract vulnerabilities, oracle failures, market volatility, counterparty risk, leverage exposure
- plsASSET liquidity pools are not guaranteed to trade at 1:1

## Links

- **dApp**: [plutus.fi](https://plutus.fi)
- **Docs**: [docs.plutus.fi](https://docs.plutus.fi)
- **Snapshot (Governance)**: [snapshot.box/#/s:plutus-dao.eth](https://snapshot.box/#/s:plutus-dao.eth)
- **Discord**: [discord.gg/plutusdao-io](https://discord.gg/plutusdao-io)
- **Medium**: [medium.com/@plutus.fi](https://medium.com/@plutus.fi)
