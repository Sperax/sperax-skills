# CLAUDE.md — Guidelines for Claude Code

## What This Is

38 open-source AI agent skills (Markdown-based knowledge) for the ClawHub registry.
Each skill lives in `skills/<slug>/SKILL.md` with YAML frontmatter.

## Commands

```bash
./bin/validate.sh                    # Validate all skills
./bin/validate.sh skills/<slug>      # Validate one skill
./bin/publish-all.sh                 # Publish all to ClawHub
./bin/publish-all.sh --dry-run       # Dry run
./scripts/generate-llms-txt.sh       # Regenerate LLM context files
```

## Skill Format

```yaml
---
name: slug-name
description: One-line summary for search/registry.
metadata:
  openclaw:
    emoji: "📊"
    homepage: "https://sperax.io"
---

# Title

Content...
```

## Rules

- Skills are **read-only educational content** — no executable code
- **Public-safe** — never include internal file paths, API keys, env vars, or architecture
- Slug must match folder name: `^[a-z0-9][a-z0-9-]*$`
- Minimum 100 lines, structured with headers, tables, and examples
- Git commits use gitmoji prefixes (`✨ feat:`, `📝 docs:`, `🐛 fix:`)

## Adding a Skill

1. `mkdir skills/<slug>` and create `SKILL.md` with frontmatter
2. Run `./bin/validate.sh skills/<slug>`
3. Add entry to README.md catalog table
4. Commit: `git commit -m "✨ feat: add <slug>"`
