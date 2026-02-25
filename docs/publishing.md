# Publishing Guide

How to publish Sperax Skills to ClawHub and other registries.

## Prerequisites

1. A [GitHub](https://github.com) account
2. [ClawHub CLI](https://clawhub.ai) installed
3. Contributor access to the `sperax/sperax-skills` repository

## ClawHub CLI Setup

```bash
# Install
npm install -g @openclaw/clawhub

# Login (opens browser for GitHub OAuth)
clawhub login

# Verify
clawhub whoami
```

## Publishing a Single Skill

```bash
clawhub publish skills/sperax-usds-guide \
  --slug sperax-usds-guide \
  --name "Sperax USDs Guide" \
  --version 1.0.0 \
  --tags latest \
  --changelog "Initial release"
```

## Publishing All Skills

```bash
# Dry run first
./bin/publish-all.sh --dry-run

# Publish for real
./bin/publish-all.sh --version 1.0.0
```

## Updating a Skill

1. Edit the `SKILL.md` content
2. Validate: `./bin/validate.sh skills/<slug>`
3. Bump version and publish:

```bash
clawhub publish skills/<slug> \
  --slug <slug> \
  --version 1.1.0 \
  --tags latest \
  --changelog "Updated APY ranges and added new protocol"
```

## Version Strategy

- **Major** (2.0.0): Restructure, significant content changes
- **Minor** (1.1.0): New sections, updated data, added examples
- **Patch** (1.0.1): Typo fixes, minor corrections

## CI/CD Publishing

The `publish.yml` GitHub Action can publish automatically on release:

1. Create a GitHub release with a semver tag (e.g., `v1.1.0`)
2. The workflow authenticates with `CLAWHUB_TOKEN` secret
3. All skills are published with the release version

### Setting Up the Secret

1. Get a ClawHub API token: ClawHub Settings → API Tokens
2. Add to repo secrets: Settings → Secrets → `CLAWHUB_TOKEN`

## Other Registries

Skills are standard Markdown with YAML frontmatter. They can be submitted to:

- **ClawHub** (clawhub.ai) — primary target
- **GitHub Marketplace** — as a repository template
- **HuggingFace** — as a dataset
- **Any agent framework** that consumes Markdown knowledge files
