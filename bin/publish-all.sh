#!/usr/bin/env bash
# publish-all.sh — Publish all skills to ClawHub registry
#
# Usage:
#   ./bin/publish-all.sh              # Publish all skills
#   ./bin/publish-all.sh --dry-run    # Preview without publishing
#   ./bin/publish-all.sh --changed    # Only publish changed skills

set -euo pipefail

DRY_RUN=false
CHANGED_ONLY=false
VERSION="1.0.0"
SKILLS_DIR="skills"

while [[ $# -gt 0 ]]; do
  case $1 in
    --dry-run) DRY_RUN=true; shift ;;
    --changed) CHANGED_ONLY=true; shift ;;
    --version) VERSION="$2"; shift 2 ;;
    --dir) SKILLS_DIR="$2"; shift 2 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# Check CLI is available
if ! command -v clawhub &>/dev/null; then
  echo "❌ ClawHub CLI not found. Install: npm install -g @openclaw/clawhub"
  exit 1
fi

# Check auth
if ! clawhub whoami &>/dev/null; then
  echo "❌ Not authenticated. Run: clawhub login"
  exit 1
fi

echo "🚀 Publishing Sperax Skills to ClawHub"
echo "   Version: $VERSION"
echo "   Dry run: $DRY_RUN"
echo "   Changed only: $CHANGED_ONLY"
echo ""

published=0
skipped=0
failed=0

for skill_dir in "$SKILLS_DIR"/*/; do
  [ -d "$skill_dir" ] || continue
  slug=$(basename "$skill_dir")

  # Skip if only publishing changed and no changes detected
  if [ "$CHANGED_ONLY" = true ]; then
    if ! git diff --name-only HEAD~1 | grep -q "$skill_dir"; then
      skipped=$((skipped + 1))
      continue
    fi
  fi

  # Derive display name from slug
  name=$(echo "$slug" | sed 's/-/ /g' | sed 's/\b\w/\u&/g')

  if [ "$DRY_RUN" = true ]; then
    echo "  [DRY RUN] Would publish: $slug v$VERSION ($name)"
    published=$((published + 1))
  else
    echo -n "  Publishing $slug v$VERSION... "
    if clawhub publish "$skill_dir" \
        --slug "$slug" \
        --name "$name" \
        --version "$VERSION" \
        --tags latest \
        --changelog "Published from sperax-skills repo" 2>/dev/null; then
      echo "✅"
      published=$((published + 1))
    else
      echo "❌"
      failed=$((failed + 1))
    fi
  fi
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Published: $published"
echo "  Skipped:   $skipped"
echo "  Failed:    $failed"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

[ $failed -gt 0 ] && exit 1 || exit 0
