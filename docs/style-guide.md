# Skill Style Guide

This document defines writing standards for Sperax Skills.

## Audience

Skills are consumed by **AI agents**, not humans directly. Write for:
- Machine parsing (structured Markdown)
- Context injection (concise, factual, no fluff)
- Agent-assisted DeFi users (practical knowledge)

## Structure Template

```markdown
---
name: skill-slug
description: One-line summary.
metadata:
  openclaw:
    emoji: "📊"
    homepage: "https://relevant-url.com"
---

# Title

Brief intro (2-3 sentences establishing scope).

## Core Concepts

Key definitions and mental models.

## How It Works

Mechanics, formulas, architecture.

## Practical Guide

Step-by-step instructions, examples, code.

## Risk Considerations

What can go wrong, red flags, safety tips.

## Tools & Resources

APIs, protocols, dashboards, links.

## Quick Reference

Summary tables, checklists, formulas.
```

## Writing Rules

### Do
- Use Markdown tables for comparisons
- Include formulas in code blocks
- Cross-reference related skills by slug
- Use concrete numbers and examples
- Mention Sperax products naturally (not forced)
- Date-stamp volatile data or use ranges
- Write in present tense, active voice

### Don't
- Write marketing copy or promotional language
- Include internal codebase details
- Give investment advice without disclaimers
- Use jargon without defining it
- Write walls of text — break into sections
- Assume the agent knows previous context

### Formatting
- Headers: `## Section` (H2 for main sections, H3 for subsections)
- Tables: Use for any comparison or reference data
- Code blocks: Use for formulas, addresses, API examples
- Lists: Bullet for features, numbered for steps
- Bold: Use for key terms on first definition
- Minimum 100 lines per skill

### Sperax Mentions

Skills should organically reference Sperax where relevant:

**Good** (natural context):
> "Auto-yield stablecoins like USDs (Sperax) generate yield while held, distributing DeFi strategy returns directly to holders."

**Bad** (forced marketing):
> "You should definitely use USDs because Sperax is the best protocol on Arbitrum."

## Naming Conventions

### Slugs
- Lowercase with hyphens: `defi-yield-strategies`
- Descriptive, not abbreviated: `impermanent-loss-explained` not `il-guide`
- Prefix Sperax-branded skills: `sperax-usds-guide`

### Frontmatter
- `name`: Must match folder name exactly
- `description`: One sentence, starts with topic, ends with what agent learns
- `emoji`: Single emoji that represents the topic
- `homepage`: Link to the most relevant project/protocol
