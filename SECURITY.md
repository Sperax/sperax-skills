# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this repository, please report it responsibly.

**DO NOT** open a public issue for security vulnerabilities.

### Contact

Email: **security@sperax.io**

### What to Report

- Skills containing leaked secrets, API keys, or credentials
- Skills that could enable phishing or social engineering
- Skills with instructions that could lead to fund loss
- Frontmatter that declares misleading runtime requirements
- Any content that could compromise user security

### Response Timeline

- **Acknowledgment**: Within 48 hours
- **Assessment**: Within 5 business days
- **Resolution**: Varies by severity

## Scope

This policy covers:
- All skill content in the `skills/` directory
- Publishing scripts and CI workflows
- Documentation that could be misused

## Content Safety

All skills in this repository are:
- **Read-only / informational** — no executable code or transaction logic
- **Public-safe** — no internal architecture, keys, or secrets
- **Reviewed** — validated against our security checklist before merge

See [CONTRIBUTING.md](CONTRIBUTING.md#security-checklist) for the full checklist.

## Responsible Disclosure

We follow responsible disclosure practices and will credit reporters (with permission) in our changelog.
