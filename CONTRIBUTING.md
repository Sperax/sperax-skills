# Contributing to Sperax Skills

Thank you for your interest in contributing to the Sperax Skills collection! This guide will help you add new skills or improve existing ones.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Adding a New Skill](#adding-a-new-skill)
- [Improving Existing Skills](#improving-existing-skills)
- [Frontmatter Reference](#frontmatter-reference)
- [Style Guide](#style-guide)
- [Security Checklist](#security-checklist)
- [Pull Request Process](#pull-request-process)

## Code of Conduct

This project follows our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold a respectful and inclusive environment.

## How to Contribute

1. **Fork** this repository
2. **Create a branch**: `git checkout -b feat/my-new-skill`
3. **Make your changes** following the guidelines below
4. **Validate**: `./bin/validate.sh`
5. **Commit** with gitmoji: `git commit -m "✨ feat: add new DeFi skill"`
6. **Push** and open a Pull Request

## Adding a New Skill

### 1. Create the Skill Folder

```bash
mkdir -p skills/my-skill-name
touch skills/my-skill-name/SKILL.md
```

Slug rules:
- Lowercase, URL-safe: `^[a-z0-9][a-z0-9-]*$`
- Use hyphens, not underscores
- Be descriptive: `defi-yield-strategies` not `yields`

### 2. Write the SKILL.md

Every skill must have:

```markdown
---
name: my-skill-name
description: One-line summary of what this skill teaches an AI agent.
metadata:
  openclaw:
    emoji: "📊"
    homepage: "https://sperax.io"
---

# Skill Title

Content here...
```

### 3. Content Structure

Follow this template:

```markdown
# Title

Brief intro (2-3 sentences).

## Core Concepts
## How It Works
## Step-by-Step / Practical Guide
## Risk Considerations
## Tools & Resources
## Quick Reference (tables, checklists)
```

### 4. Validate

```bash
./bin/validate.sh skills/my-skill-name
```

## Improving Existing Skills

- Fix factual errors or outdated information
- Add missing context or examples
- Improve clarity and structure
- Update protocol data (TVL, APY ranges, etc.)
- Add cross-references to related skills

## Frontmatter Reference

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Skill slug (must match folder name) |
| `description` | Yes | One-line summary for registry/search |
| `version` | No | Semver string (managed by publish scripts) |
| `metadata.openclaw.emoji` | Recommended | Display emoji |
| `metadata.openclaw.homepage` | Recommended | Link to related project |
| `metadata.openclaw.requires.env` | If needed | Required env vars |
| `metadata.openclaw.requires.bins` | If needed | Required CLI tools |

## Style Guide

### Tone
- **Educational, not promotional** — teach, don't sell
- **Neutral with organic mentions** — reference Sperax products naturally within DeFi context
- **Agent-friendly** — write for AI consumption: structured, factual, actionable

### Formatting
- Use Markdown tables for comparisons and reference data
- Use code blocks for formulas, API examples, addresses
- Use headers for clear section hierarchy
- Keep paragraphs short (3-5 sentences max)
- Include practical examples alongside theory

### Content Standards
- Minimum 100 lines per skill
- At least one comparison table
- At least one practical example or formula
- Cross-reference related skills where relevant
- Date-stamp volatile data (TVL, APY) or use ranges

### What NOT to Include
- Internal codebase details (file paths, package names)
- Private API endpoints or keys
- Implementation-specific architecture
- Unverified financial claims
- Investment advice (use disclaimers)

## Security Checklist

Before submitting, verify your skill contains **NONE** of the following:

- [ ] Internal file paths (`packages/`, `src/server/`, etc.)
- [ ] tRPC router or endpoint names
- [ ] Environment variable names (`NEXT_PUBLIC_*`, `S3_*`)
- [ ] Feature flag names
- [ ] Authentication implementation details
- [ ] Database schema or model details
- [ ] Internal package names
- [ ] Private API keys or secrets
- [ ] Personal information

## Pull Request Process

1. Ensure your skill passes `./bin/validate.sh`
2. Update the skill catalog in `README.md` if adding a new skill
3. Use gitmoji commit prefixes:
   - `✨ feat:` — new skill
   - `📝 docs:` — documentation improvement  
   - `🐛 fix:` — factual correction
   - `♻️ refactor:` — restructure without content change
4. PR title format: `✨ feat: add <skill-name>` or `📝 docs: improve <skill-name>`
5. Fill in the PR template
6. Wait for CI checks to pass
7. A maintainer will review and merge

## Questions?

- Open a [GitHub Issue](https://github.com/sperax/sperax-skills/issues)
- Join [Sperax Discord](https://discord.gg/sperax)
- Email: dev@sperax.io
