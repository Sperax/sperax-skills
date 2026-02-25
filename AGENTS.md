# AGENTS.md — Repository Guidelines

## Project Overview

This repository contains 38 open-source AI agent skills for DeFi, Web3, and the Sperax ecosystem.
Skills are Markdown-based knowledge files designed for the [ClawHub](https://clawhub.ai) registry.

## Structure

```
sperax-skills/
├── skills/               # 38 skill folders, each containing SKILL.md
├── bin/                  # CLI scripts (publish, validate)
├── docs/                 # Contributor documentation
├── scripts/              # Development utilities
├── .github/              # CI workflows, templates
└── .well-known/          # ClawHub discovery metadata
```

## Commands

```bash
# Validate all skills
./bin/validate.sh

# Validate one skill
./bin/validate.sh skills/sperax-usds-guide

# Publish all skills to ClawHub
./bin/publish-all.sh

# Dry-run publish
./bin/publish-all.sh --dry-run

# Generate llms.txt / llms-full.txt
./scripts/generate-llms-txt.sh
```

## Skill Format

Each skill is a folder under `skills/` containing a `SKILL.md` with:

```yaml
---
name: skill-slug
description: One-line summary.
metadata:
  openclaw:
    emoji: "📊"
    homepage: "https://sperax.io"
---
```

## Content Rules

- **Read-only / educational** — no execution, no transaction logic
- **Public-safe** — no internal paths, keys, schemas, or architecture
- **Agent-friendly** — structured Markdown with tables, formulas, examples
- **Minimum 100 lines** per skill, at least one table, one practical example

## Commit Style

Use gitmoji prefixes:
- `✨ feat:` — new skill
- `📝 docs:` — documentation
- `🐛 fix:` — factual correction
- `♻️ refactor:` — restructure
- `🔧 chore:` — tooling/config
