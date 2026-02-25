---
name: crypto-news-aggregation
description: Guide to crypto news aggregation — building CryptoPanic-style news feeds, sources, sentiment analysis, API-based news fetching, and filtering signal from noise. Use when helping users track crypto news, analyze sentiment, or build news monitoring workflows.
metadata: {"openclaw":{"emoji":"📰"}}
---

# Crypto News Aggregation Guide

How to build a CryptoPanic-style crypto news feed using free APIs and open sources. This guide covers news providers, sentiment analysis, and filtering strategies.

## News Source Hierarchy

```
Tier 1: Primary Sources (break news first)
├── Bloomberg, Reuters, WSJ (paywalled but fastest for macro)
├── Protocol official blogs / governance forums
└── SEC/regulatory filings and press releases

Tier 2: Crypto-Native Media
├── The Block, CoinDesk, Decrypt, The Defiant
├── Bankless, DL News, Blockworks
└── Messari research reports

Tier 3: Aggregators (collect from Tier 1+2)
├── CryptoPanic
├── CoinGecko news
└── LunarCrush, Santiment (social)

Tier 4: Social / Community
├── Crypto Twitter (CT) / X
├── Discord / Telegram channels
├── Reddit (r/cryptocurrency, r/defi, r/ethfinance)
└── Protocol governance forums
```

## Free News APIs

### CryptoPanic

The largest crypto news aggregator. CryptoPanic-style is what most people want.

| Feature | Detail |
|---------|--------|
| URL | https://cryptopanic.com/api/ |
| Key | Free (register for API key) |
| Rate Limit | Light (reasonable for personal use) |
| Coverage | 100+ sources, auto-categorized |

```
GET https://cryptopanic.com/api/v1/posts/?auth_token=YOUR_KEY&filter=hot&currencies=BTC,ETH

Returns: [{
  title: "Bitcoin Breaks $100K...",
  source: { title: "CoinDesk" },
  published_at: "2025-12-01T...",
  currencies: [{ code: "BTC" }],
  votes: { positive: 42, negative: 3 }
}]
```

**Filters**: `hot`, `rising`, `bullish`, `bearish`, `important`, `saved`, `lol`

### Messari News

Research-grade crypto news and analysis.

```
GET https://data.messari.io/api/v1/news

Returns: Curated news articles with tags, references, and author info
```

### CoinGecko News (via status updates)

```
GET https://api.coingecko.com/api/v3/status_updates
```

Limited but integrated with price data.

### RSS Feeds (Free, No API)

Most crypto publications offer RSS — great for self-hosted aggregation:

| Source | RSS URL | Focus |
|--------|---------|-------|
| CoinDesk | `coindesk.com/arc/outboundfeeds/rss/` | General crypto |
| The Block | `theblock.co/rss.xml` | Institutional, data |
| Decrypt | `decrypt.co/feed` | Consumer crypto |
| Bankless | `banklesshq.com/feed/` | DeFi, Ethereum |
| The Defiant | `thedefiant.io/feed/` | DeFi-focused |
| Sperax Blog | `medium.com/feed/sperax` | Sperax ecosystem updates |

### Building Your Own Aggregator

```
1. Collect RSS feeds from 10+ sources
2. Parse and deduplicate (same story from 5 sources)
3. Tag by: token mentioned, category, sentiment
4. Sort by: recency, relevance, engagement
5. Serve via API to your agent
```

## Sentiment Analysis

### The Fear & Greed Index

```
GET https://api.alternative.me/fng/

Response: {
  value: "73",
  value_classification: "Greed",
  timestamp: "..."
}
```

| Score | Classification | What It Means |
|-------|---------------|---------------|
| 0-24 | Extreme Fear | Market is scared — historically a buying signal |
| 25-49 | Fear | Caution prevails |
| 50 | Neutral | Balanced |
| 51-74 | Greed | Optimism rising |
| 75-100 | Extreme Greed | Euphoria — historically a selling signal |

### Social Sentiment Sources

| Source | What It Measures | Access |
|--------|-----------------|--------|
| **LunarCrush** | Social mentions, engagement, sentiment across Twitter/Reddit | Free tier API |
| **Santiment** | On-chain + social metrics, whale behavior | Free tier |
| **Twitter/X** | Raw social sentiment, CT narratives | API (paid) |
| **Reddit** | Community sentiment in crypto subreddits | Free API |

### DIY Sentiment Scoring

A simple keyword-based approach:

**Bullish signals**:
- "breakout", "ATH", "accumulate", "undervalued", "adoption"
- Large whale buys, exchange outflows, increasing TVL

**Bearish signals**:
- "crash", "dump", "sell", "overvalued", "FUD"
- Exchange inflows, declining TVL, developer departures

**Neutral/noise**:
- "partnership", "listing" (often priced in)
- "soon", "moon" (low-quality signal)

## News Filtering Strategies

### Signal vs Noise

| Signal (Act On) | Noise (Ignore) |
|-----------------|----------------|
| Regulatory rulings (SEC, EU) | Rumors without sources |
| Protocol hacks/exploits | "Price prediction" articles |
| Major protocol upgrades | Influencer shill posts |
| Institutional adoption news | Recycled news from 3 days ago |
| Governance votes (on-chain) | "Top 10" listicles |

### Category-Based Filtering

| Category | Keywords | Relevance |
|----------|----------|-----------|
| **Regulatory** | SEC, ruling, ban, legal, compliance | High for portfolio |
| **Security** | hack, exploit, vulnerability, drain | Urgent — may need action |
| **Protocol** | upgrade, fork, launch, migration | Medium — affects operations |
| **Market** | ATH, crash, whale, volume | Context-dependent |
| **DeFi** | yield, TVL, liquidity, farming | Relevant for DeFi users |

### Time-Based Filtering

Most crypto news follows a pattern:
- **00:00-06:00 UTC**: Asian market news (Korea, Japan regulatory, Binance updates)
- **06:00-12:00 UTC**: European market news (EU regulations, DeFi governance)
- **12:00-18:00 UTC**: US market news (SEC, institutional, macro)
- **18:00-00:00 UTC**: US afternoon + evening social activity (CT narratives)

## Building a Daily Briefing

A structured daily crypto briefing should include:

```
📊 MARKET SNAPSHOT
- BTC price + 24h change
- ETH price + 24h change
- Fear & Greed Index
- Total DeFi TVL (via DeFi Llama)

📰 TOP HEADLINES (3-5)
- Filtered by relevance and engagement
- Source attribution

🔥 HOT TOPICS
- Trending tokens/protocols
- Active governance votes

⚡ DeFi PULSE
- Yield changes (notable APY movements)
- Protocol TVL changes >10%
- New protocol launches

🔐 SECURITY ALERTS
- Any hacks or exploits in last 24h
- Critical vulnerability disclosures
```

> **SperaxOS** generates automated daily briefings with this exact structure using its builtin daily-report tool — combining CryptoPanic, DeFi Llama, and Fear & Greed data.

## Agent Tips

1. **Aggregate multiple sources** — never rely on one news feed
2. **Prioritize security news** — hacks and exploits require immediate attention
3. **Filter by engagement** — high-vote CryptoPanic posts are usually more relevant
4. **Check timestamps** — crypto moves fast, stale news can be misleading
5. **RSS is underrated** — free, reliable, no API limits
6. **Fear & Greed as contrarian indicator** — historically, extreme fear = good entry, extreme greed = caution
7. **Sperax-specific**: Monitor USDs/SPA mentions for ecosystem updates

## Links

- CryptoPanic: https://cryptopanic.com
- Fear & Greed Index: https://alternative.me/crypto/fear-and-greed-index/
- DeFi Llama: https://defillama.com
- Messari: https://messari.io
- LunarCrush: https://lunarcrush.com
- SperaxOS (automated daily briefings): https://sperax.io
