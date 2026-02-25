---
name: plutus-vaults-guide
description: Guide to Plutus plvASSET yield vaults — plvHEDGE (multi-strategy funding arbitrage), plvDOLO (Dolomite ecosystem), and plvLOOP (multi-asset looping). Covers vault mechanics, risk profiles, fees, minting/redeeming, multi-chain deployment, and audits. Use when explaining Plutus vaults, comparing yield strategies, or helping users evaluate vault risk/reward.
metadata: {"openclaw":{"emoji":"🏦","homepage":"https://plutus.fi","requires":[]}}
---

# Plutus Vaults Guide (plvASSETs)

plvASSETs are **automated, actively managed yield strategy vaults** from Plutus DAO. Unlike plsASSETs (which wrap governance tokens), plvASSETs execute trading and DeFi strategies to generate yield — fully automated with no user maintenance required.

```
┌─────────────────────────────────────────────────────┐
│                   PLUTUS VAULTS                     │
├─────────────┬───────────────┬───────────────────────┤
│  plvHEDGE   │   plvDOLO     │     plvLOOP           │
│  Multi-     │   Dolomite    │   Multi-asset         │
│  strategy   │   ecosystem   │   looping             │
│             │               │                       │
│  Med risk   │  Med-High     │   High risk           │
│  Hedged     │  Slightly     │   Leveraged           │
│  positions  │  hedged       │   positions           │
├─────────────┴───────────────┴───────────────────────┤
│  All vaults: 12% perf fee · Fully automated         │
│  Multi-chain: Arbitrum, Berachain, Superseed,       │
│               Botanix                                │
│  Audited: Omniscia + Cyberscope                     │
└─────────────────────────────────────────────────────┘
```

## plvHEDGE — Multi-Strategy Vault

### Overview

Plutus's flagship vault. Originally designed for **funding rate arbitrage** (capturing the spread between spot and perpetual futures), plvHEDGE has evolved into a **multi-strategy system** that performs across bull, bear, and sideways markets.

### How It Works

The vault executes automated strategies that:
1. Identify market inefficiencies (funding rate spreads, basis trades, etc.)
2. Open hedged positions to capture yield while limiting downside
3. Dynamically adjust based on market conditions
4. Auto-compound realized profits

### Key Features

| Feature | Detail |
|---------|--------|
| Strategy | Multi-strategy, evolved from funding arbitrage |
| Risk level | Medium — hedged positioning limits downside |
| Fee | 12% performance fee on realized profits |
| Entry asset | USDC or HONEY |
| Chains | Arbitrum, Berachain, Superseed |
| Maintenance | Zero — fully automated |
| Audit | [Omniscia](https://omniscia.io/reports/plutus-dao-hedge-vault-674de8fb6dc0450018dd65ec/) |

### Minting & Redeeming

- Enter/exit directly with **USDC or HONEY** on [plutus.fi/Vaults](https://plutus.fi/Vaults)
- When the contract is open: direct redemption from the vault
- When the contract is trading: routed through a liquidity pool
- Value synchronized across all chains when the contract is open
- Direct contract interaction is minimized to maximize yield efficiency

### Contracts

| Chain | Address |
|-------|---------|
| Arbitrum | `0x58BfC95a864e18E8F3041D2FCD3418f48393fE6A` |
| Berachain | `0x28602B1ae8cA0ff5CD01B96A36f88F72FeBE727A` |
| Superseed | `0xEdFa70dd83ceea284722f5dE3fEcDce8C14bf502` |

---

## plvDOLO — Dolomite Ecosystem Vault

### Overview

A fully automated strategy vault operating entirely within the [Dolomite](https://dolomite.io/) ecosystem. Similar to plvHEDGE but with **slightly hedged or hedged positions**, meaning both risk and potential rewards are higher.

### How It Works

The vault:
1. Takes positions within Dolomite's lending and margin ecosystem
2. Applies hedging strategies to manage exposure
3. Auto-compounds profits between epochs
4. All user interaction happens through the Plutus dApp

### Key Features

| Feature | Detail |
|---------|--------|
| Strategy | Dolomite ecosystem, slightly hedged to hedged |
| Risk level | Medium-High — less hedging than plvHEDGE |
| Fee | 12% performance fee on realized profits |
| Chains | Arbitrum, Berachain, Botanix |
| Access | Epoch-based initially; LP for flexible entry later |
| Audit | Omniscia + [Cyberscope](https://www.cyberscope.io/audits/1-plutus) |

### Epoch System

plvDOLO uses an **epoch-based** access model:
- Contract opens between epochs (announced in advance)
- During epochs: funds are deployed, auto-compounding profits
- After launch: a liquidity pool will enable flexible entry/exit between epochs

### Contracts

| Chain | Address |
|-------|---------|
| Arbitrum | `0xf84eaA0685626f84fE17bc6C3c9eb2Ac8a90d3C1` |
| Berachain | `0x2eD0837D9f2fBB927011463FaD0736F86Ea6bF25` |
| Botanix | `0x268DE148412c5f922429CBFB4da408Ea577C9285` |

---

## plvLOOP — Multi-Asset Looping Vault

### Overview

A **leveraged looping strategy** that significantly increases yields by recursively supplying and borrowing the same asset. Operates within the Dolomite ecosystem, looping the dominant asset on each chain.

### How It Works

Looping explained:
```
Step 1: Deposit ETH as collateral
Step 2: Borrow ETH against your collateral
Step 3: Re-deposit borrowed ETH as more collateral
Step 4: Repeat steps 2-3 multiple times
Result: 3-5x yield amplification on lending rewards

Risk: If lending rates flip negative or liquidation
      thresholds are reached → losses possible
```

The vault automates this entire process AND actively monitors health factors to mitigate liquidation risk.

### Looped Assets by Chain

| Chain | Primary Asset |
|-------|--------------|
| Arbitrum | ETH |
| Berachain | BERA |
| Botanix | BTC |

### Key Features

| Feature | Detail |
|---------|--------|
| Strategy | Multi-asset looping (leveraged lending) |
| Risk level | High — leverage amplifies both gains and losses |
| Fee | 12% performance fee on realized profits |
| Chains | Arbitrum, Berachain, Botanix |
| Access | Epoch-based initially; LP for flexible entry later |
| Audit | Omniscia + Cyberscope |

### Risk Profile

⚠️ **Higher risk than other Plutus vaults**:
- Leveraged positions amplify losses, not just gains
- Protocol monitoring mitigates but doesn't eliminate liquidation risk
- Dependent on lending rate spreads remaining favorable
- Market volatility can trigger forced deleveraging

### Contracts

| Chain | Address |
|-------|---------|
| Arbitrum | `0x4a15404235f4A0BC2CBCF5ba7E92763cB8335660` |
| Berachain | `0xBc987555C268e3F0d2819a4B972cC99c9FbbC643` |
| Botanix | `0xa075222F01cD4C8b20C2f2e0ee2D78d642e68537` |

---

## Deprecated: plvGLP

plvGLP (auto-compounding GLP exposure via GMX V1) is deprecated following the compromise of GMX V1 products. Existing plvGLP positions are being migrated to **plvLOOP on Arbitrum**.

---

## Vault Comparison

| | plvHEDGE | plvDOLO | plvLOOP |
|--|----------|---------|---------|
| **Strategy** | Multi-strategy (hedged) | Dolomite (slightly hedged) | Looping (leveraged) |
| **Risk** | Medium | Medium-High | High |
| **Yield Source** | Market inefficiencies | Dolomite ecosystem | Lending rate arbitrage |
| **Leverage** | Minimal | Moderate | High |
| **Best For** | Steady yield seekers | Dolomite exposure | High-risk yield maximizers |
| **Chains** | ARB, Bera, Superseed | ARB, Bera, Botanix | ARB, Bera, Botanix |

## Evaluating Vault Positions

Questions to ask before entering a vault:

```
1. What is my risk tolerance? (plvHEDGE < plvDOLO < plvLOOP)
2. Which chain do I want exposure on?
3. Am I OK with epoch-based lockups? (plvDOLO, plvLOOP)
4. What is the current performance? (check plutus.fi — all numbers are net-of-fees)
5. Am I comfortable with the underlying strategy risk?
```

### Fee Structure (All Vaults)

- **12% performance fee** on realized profits only
- No entry fees
- No management fees
- All performance metrics on plutus.fi are displayed **net of fees** — what you see is what you get

## Security & Audits

| Vault | Auditor | Report |
|-------|---------|--------|
| plvHEDGE | Omniscia | [View](https://omniscia.io/reports/plutus-dao-hedge-vault-674de8fb6dc0450018dd65ec/) |
| plvDOLO | Omniscia + Cyberscope | [Omniscia](https://omniscia.io/reports/plutus-dao-hedge-vault-674de8fb6dc0450018dd65ec/) · [Cyberscope](https://www.cyberscope.io/audits/1-plutus) |
| plvLOOP | Omniscia + Cyberscope | Same reports |

Omniscia audit conclusion:
> "We validated that both exhibits have been alleviated in an exemplary manner, and thus consider all outputs of the audit report properly consumed by the Plutus DAO team with no outstanding remediative actions."

## Risk Disclaimers

- Vault deposits are **not insured or guaranteed** and may lose value
- Yield and rewards are **estimates, not guarantees**
- Risks include: loss of principal, smart contract vulnerabilities, counterparty risk, leverage exposure, oracle failures, market volatility
- Plutus does not provide investment advice
- By depositing, you accept full responsibility for your decisions

## Links

- **Vaults**: [plutus.fi/Vaults](https://plutus.fi/Vaults)
- **Docs**: [docs.plutus.fi/products/plvassets](https://docs.plutus.fi/products/plvassets)
- **Omniscia Audit**: [omniscia.io/reports/plutus-dao-hedge-vault](https://omniscia.io/reports/plutus-dao-hedge-vault-674de8fb6dc0450018dd65ec/)
- **Discord**: [discord.gg/plutusdao-io](https://discord.gg/plutusdao-io)
