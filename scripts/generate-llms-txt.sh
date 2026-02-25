#!/usr/bin/env bash
# generate-llms-txt.sh — Generate llms.txt and llms-full.txt from skills
#
# Usage: ./scripts/generate-llms-txt.sh

set -euo pipefail

SKILLS_DIR="skills"
SUMMARY_FILE="llms.txt"
FULL_FILE="llms-full.txt"

# Generate llms.txt (summary)
{
  echo "# Sperax Skills"
  echo ""
  echo "> 38 open-source AI agent skills for DeFi, Web3, and the Sperax ecosystem."
  echo "> Published to ClawHub (clawhub.ai). MIT licensed."
  echo ""
  echo "## Skills"
  echo ""

  for skill_dir in "$SKILLS_DIR"/*/; do
    [ -d "$skill_dir" ] || continue
    slug=$(basename "$skill_dir")
    file="$skill_dir/SKILL.md"
    [ -f "$file" ] || continue

    description=$(sed -n '/^---$/,/^---$/p' "$file" | grep "^description:" | head -1 | sed 's/description: *//')
    echo "- **$slug**: $description"
  done

  echo ""
  echo "## Links"
  echo ""
  echo "- Repository: https://github.com/sperax/sperax-skills"
  echo "- ClawHub: https://clawhub.ai"
  echo "- Sperax: https://sperax.io"
  echo "- Full context: llms-full.txt"
} > "$SUMMARY_FILE"

echo "✅ Generated $SUMMARY_FILE ($(wc -l < "$SUMMARY_FILE") lines)"

# Generate llms-full.txt (complete content)
{
  echo "# Sperax Skills — Complete Reference"
  echo ""
  echo "> Full content of all 38 skills. For summary, see llms.txt."
  echo ""

  for skill_dir in "$SKILLS_DIR"/*/; do
    [ -d "$skill_dir" ] || continue
    slug=$(basename "$skill_dir")
    file="$skill_dir/SKILL.md"
    [ -f "$file" ] || continue

    echo "---"
    echo ""
    echo "## Skill: $slug"
    echo ""
    # Strip frontmatter and output content
    sed '1{/^---$/!q};1,/^---$/d' "$file"
    echo ""
  done
} > "$FULL_FILE"

echo "✅ Generated $FULL_FILE ($(wc -l < "$FULL_FILE") lines)"
