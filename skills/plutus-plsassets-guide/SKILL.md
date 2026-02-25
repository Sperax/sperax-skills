---
name: plutus-plsassets-guide
description: Detailed guide to Plutus plsASSETs — liquid governance aggregation tokens for Sperax (plsSPA), Camelot (plsGRAIL), Stryke (plsSYK), Berachain (plsBERA), Radiant (plsRDNT), and Plutus (plsPLUTUS). Covers minting, staking, overcollateralization, buybacks, fees, and liquidity pools. Use when explaining plsASSETs, comparing governance token strategies, or helping users enter/exit plsASSET positions.
metadata: {"openclaw":{"emoji":"🔮","homepage":"https://plutus.fi","requires":[]}}
---

# Plutus plsASSETs Guide

plsASSETs are **liquid, yield-bearing wrappers around locked governance tokens**. Instead of locking your tokens for years to earn max rewards, you deposit them into Plutus and receive a liquid plsASSET that earns the same (or better) yield — with the ability to trade, LP, or exit at any time.

```
  YOU                  PLUTUS                UNDERLYING PROTOCOL
  ───                  ──────                ───────────────────
  Deposit SPA    →  Lock as veSPA (4yr)  →  Earns max-lock rewards
  Receive plsSPA ←  Yield + overcollat   ←  Rewards flow back
  
  plsSPA is LIQUID — trade it, LP it, stake it
  veSPA is LOCKED — Plutus handles it forever
```

## How plsASSETs Work

### 1. Minting

Users deposit governance tokens (SPA, GRAIL, SYK, BERA, RDNT) into Plutus. These are permanently locked as their veToken equivalents. Plutus issues a 1:1 plsASSET receipt token.

**Recommended entry**: Use liquidity pools (swap on DEX) instead of direct minting — direct conversion often trades above market price.

### 2. Staking for Yield

Staking plsASSETs on Plutus earns:
- **Max-locked base yield** from the underlying protocol
- **PLS/PLUTUS emissions** from Plutus liquidity mining
- **Productive Treasury yield** — Plutus deploys treasury capital for additional returns

### 3. Overcollateralization

The secret sauce of plsASSETs. A portion of protocol fees buys plsASSETs off the open market, removing them from circulation. But the underlying locked assets still generate yield. Result: **fewer plsASSETs claiming rewards from the same yield pool → higher effective APY**.

```
Example:
  1000 veSPA locked (earning yield)
  900 plsSPA in circulation (staking for rewards)
  100 plsSPA bought back (not claiming)
  → Each circulating plsSPA earns 1000/900 = 1.11x yield
```

### 4. Buyback Soft Floor

Plutus maintains a **1:0.8 soft floor** on all plsASSETs. When the swap ratio drops below 0.8:1, treasury buybacks activate to support the price. Bought-back tokens feed into overcollateralization.

## plsASSET Catalog

### plsSPA — Sperax Governance

| Property | Value |
|----------|-------|
| Underlying | SPA → veSPA (4-year max lock) |
| Chain | Arbitrum |
| Fee | 12% on veSPA yield |
| Rewards | xSPA (single-stake); xSPA + plsSPA + SPA (Demeter farm) |
| Token | `0x0D111e482146fE9aC9cA3A65D92E65610BBC1Ba6` |

**Why plsSPA over veSPA?**
- 4-year veSPA lock earns ~14% APR vs ~3.3% for 1-year lock
- plsSPA gives you the 4-year yield tier **without** a 4-year lockup
- Fully liquid — trade on Camelot DEX at any time
- Overcollateralization means effective yield may exceed raw veSPA yield

**How to get plsSPA**:
1. **Swap** on [Camelot DEX](https://app.camelot.exchange/) (recommended — usually trades at a discount)
2. **LP** in the plsSPA/SPA pool on Sperax Demeter Farm for extra rewards
3. **Direct conversion** via Plutus contracts (not recommended — immediate value loss vs market)

**Staking options**:
- **Single-stake** on plutus.fi → earn xSPA rewards
- **Demeter Farm** on sperax.chat → provide plsSPA/SPA LP → earn xSPA + plsSPA + SPA

### plsBERA — Berachain

| Property | Value |
|----------|-------|
| Underlying | BERA/WBERA → sWBERA |
| Chain | Berachain |
| Fee | 12% on sWBERA yield |
| Rewards | sWBERA yield for token + LP rewards |
| Token | `0xc66D1a2460De7b96631f4AC37ce906aCFa6A3c30` |

- Stable equivalent to $BERA with $sWBERA yield
- "Double-dip" — earn both staking yield AND LP rewards
- Stake as single token or as LP tokens containing plsBERA

### plsGRAIL — Camelot Exchange

| Property | Value |
|----------|-------|
| Underlying | GRAIL → xGRAIL (permanent lock) |
| Chain | Arbitrum |
| Fee | 12% on xGRAIL yield |
| Rewards | GRAIL (from Camelot protocol earnings) |
| Token | `0x9e6B748d25Ed2600Aa0ce7Cbb42267adCF21Fd9B` |

- Earns xGRAIL yield while staying liquid
- Rewards paid in GRAIL based on Camelot's protocol earnings
- Camelot has $30B+ in cumulative trading volume

### plsSYK — Stryke (formerly Dopex)

| Property | Value |
|----------|-------|
| Underlying | SYK → xSYK (permanent lock) |
| Chain | Arbitrum |
| Fee | 12% on xSYK yield |
| Rewards | 50/50 split: plsSYK + SYK |
| Token | `0x68D6d2545f14751baF36c417c2CC7cdf8dA8a15b` |

- Leading Arbitrum platform for on-chain options trading
- Custom LP strategy on Camelot V3 with automated buybacks at 0.8:1 floor
- Balanced reward exposure (half wrapped, half native)

### plsRDNT — Radiant Capital

| Property | Value |
|----------|-------|
| Underlying | RDNT → dLP (max lock) |
| Chain | Arbitrum |
| Fee | 20% on dLP yield |
| Status | **⚠️ PAUSED** — Radiant suffered a $53M exploit (Oct 2024) |
| Token (v2) | `0x6dbf2155b0636cb3fd5359fccefb8a2c02b6cb51` |

- Currently not operational pending Radiant's market restoration
- Has buyback & burn mechanism + Balancer/Aura bribing strategy
- Will be reassessed once Radiant lending markets are fully restored

### plsPLUTUS — Plutus Native (Upcoming)

| Property | Value |
|----------|-------|
| Underlying | xPLUTUS |
| Status | **Slated for Q1 2026** |
| Fee | 12% on xPLUTUS yield |

- Liquid wrapper for Plutus's own xPLUTUS governance token
- Convert xPLUTUS ↔ plsPLUTUS at 1:1 ratio
- Earn overcollateralized yield without needing 180-day redemption vest

## Discontinued plsASSETs

| Token | Status | Action |
|-------|--------|--------|
| plsJONES | Unwound | Redemptions available |
| plsARB | Unwound | Redemptions available |
| plsDPX | Deprecated | Legacy — Dopex deprecated |

## Decision Framework

### When to use plsASSETs

✅ **Use plsASSETs when**:
- You want max-lock yields without locking capital
- You value liquidity and might need to exit
- You want to compound with overcollateralization
- You're OK forfeiting direct governance rights

❌ **Stick with native locking when**:
- You want direct governance voting power
- You're uncomfortable with a token that may trade below 1:1
- You need the exact underlying token (not a derivative)
- You want zero protocol-fee overhead

### Evaluating a plsASSET Position

```
Questions to ask:
1. What's the current plsASSET:ASSET swap ratio? (check Camelot/DEX)
2. Is it above or below 0.8? (below = buyback zone, potential upside)
3. What's the current overcollateralization level?
4. What APR does single-staking yield?
5. Is the underlying protocol healthy? (check TVL, revenue)
```

## Fees Summary

| plsASSET | Performance Fee | Notes |
|----------|----------------|-------|
| plsBERA | 12% | On sWBERA yield |
| plsGRAIL | 12% | On xGRAIL yield |
| plsSYK | 12% | On xSYK yield |
| plsSPA | 12% | Reduced from 20% in July 2025 |
| plsRDNT | 20% | On dLP yield (paused) |
| plsPLUTUS | 12% | On xPLUTUS yield (upcoming) |

All fees are directed to the Plutus treasury, which funds buybacks, overcollateralization, and xPLUTUS yield distribution.

## Links

- **Stake plsASSETs**: [plutus.fi/Assets](https://plutus.fi/Assets)
- **plsSPA on Camelot**: [app.camelot.exchange](https://app.camelot.exchange/?token1=0x5575552988a3a80504bbaeb1311674fcfd40ad4b&token2=0x0d111e482146fe9ac9ca3a65d92e65610bbc1ba6)
- **Sperax Demeter Farm**: [app.sperax.chat/farms](https://app.sperax.chat/farms)
- **Plutus Docs**: [docs.plutus.fi/products/plsassets](https://docs.plutus.fi/products/plsassets)
- **Discord**: [discord.gg/plutusdao-io](https://discord.gg/plutusdao-io)
