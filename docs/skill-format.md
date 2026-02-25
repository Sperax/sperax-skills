# Skill Format Reference

Detailed format specification for ClawHub-compatible skills.

## On Disk

A skill is a folder under `skills/`:

```
skills/my-skill/
└── SKILL.md          # Required — content + frontmatter
```

## SKILL.md Structure

### YAML Frontmatter

```yaml
---
name: my-skill
description: Short summary of what this skill teaches an AI agent.
metadata:
  openclaw:
    emoji: "📊"
    homepage: "https://example.com"
---
```

### Required Fields

| Field | Type | Description |
|-------|------|-------------|
| `name` | `string` | Skill slug (must match folder name) |
| `description` | `string` | One-line summary for search/registry |

### Optional Fields

| Field | Type | Description |
|-------|------|-------------|
| `version` | `string` | Semver (managed by publish scripts) |
| `metadata.openclaw.emoji` | `string` | Display emoji |
| `metadata.openclaw.homepage` | `string` | Related project URL |
| `metadata.openclaw.requires.env` | `string[]` | Required env vars |
| `metadata.openclaw.requires.bins` | `string[]` | Required CLI tools |
| `metadata.openclaw.primaryEnv` | `string` | Main credential var |
| `metadata.openclaw.os` | `string[]` | OS restrictions |

### Full Example

```yaml
---
name: sperax-usds-guide
description: USDs auto-yield stablecoin — minting, redeeming, yield mechanics, collateral strategies, and integration with the Sperax DeFi ecosystem on Arbitrum.
metadata:
  openclaw:
    emoji: "💵"
    homepage: "https://sperax.io"
---

# USDs Auto-Yield Stablecoin Guide

Content here...
```

## Slug Rules

- Lowercase and URL-safe: `^[a-z0-9][a-z0-9-]*$`
- Use hyphens, not underscores
- Be descriptive: `defi-yield-strategies` not `yields`
- Prefix Sperax-specific skills: `sperax-*`

## Content Guidelines

- Minimum 100 lines
- At least one Markdown table
- At least one practical example or formula
- Structured with H2 sections
- No internal codebase details

## ClawHub Compatibility

These skills comply with the [ClawHub skill format](https://clawhub.ai/docs/skill-format):

- Valid YAML frontmatter
- `description` used for search/registry summary
- `metadata.openclaw` for runtime metadata
- Text-only files (no binary assets)
- Bundle size well under 50MB limit
