#!/usr/bin/env bash
# validate.sh — Validate skill folders for ClawHub compatibility
#
# Usage:
#   ./bin/validate.sh                    # Validate all skills
#   ./bin/validate.sh skills/my-skill    # Validate one skill

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

errors=0
warnings=0
validated=0

validate_skill() {
  local dir="$1"
  local slug
  slug=$(basename "$dir")
  local file="$dir/SKILL.md"

  # Must have SKILL.md
  if [ ! -f "$file" ]; then
    echo -e "${RED}❌ $slug: missing SKILL.md${NC}"
    errors=$((errors + 1))
    return
  fi

  # Check slug format
  if ! echo "$slug" | grep -qE '^[a-z0-9][a-z0-9-]*$'; then
    echo -e "${RED}❌ $slug: invalid slug (must be lowercase alphanumeric with hyphens)${NC}"
    errors=$((errors + 1))
  fi

  # Check frontmatter exists
  local first_line
  first_line=$(head -1 "$file")
  if [ "$first_line" != "---" ]; then
    echo -e "${RED}❌ $slug: missing YAML frontmatter${NC}"
    errors=$((errors + 1))
    return
  fi

  # Extract frontmatter
  local frontmatter
  frontmatter=$(sed -n '2,/^---$/p' "$file" | head -n -1)

  # Check required fields
  if ! echo "$frontmatter" | grep -q "^name:"; then
    echo -e "${RED}❌ $slug: missing 'name' in frontmatter${NC}"
    errors=$((errors + 1))
  else
    local fm_name
    fm_name=$(echo "$frontmatter" | grep "^name:" | head -1 | sed 's/name: *//')
    if [ "$fm_name" != "$slug" ]; then
      echo -e "${RED}❌ $slug: frontmatter name '$fm_name' doesn't match folder '$slug'${NC}"
      errors=$((errors + 1))
    fi
  fi

  if ! echo "$frontmatter" | grep -q "^description:"; then
    echo -e "${RED}❌ $slug: missing 'description' in frontmatter${NC}"
    errors=$((errors + 1))
  fi

  # Check minimum length
  local lines
  lines=$(wc -l < "$file")
  if [ "$lines" -lt 50 ]; then
    echo -e "${YELLOW}⚠️  $slug: only $lines lines (recommended: 100+)${NC}"
    warnings=$((warnings + 1))
  fi

  # Check for sensitive patterns
  local sensitive_patterns=(
    'NEXT_PUBLIC_'
    'packages/builtin-tool-'
    'src/server/'
    'src/store/'
    '/workspaces/'
  )

  for pattern in "${sensitive_patterns[@]}"; do
    if grep -q "$pattern" "$file" 2>/dev/null; then
      echo -e "${RED}❌ $slug: contains sensitive pattern '$pattern'${NC}"
      errors=$((errors + 1))
    fi
  done

  # Check has at least one heading
  if ! grep -q "^# " "$file"; then
    echo -e "${YELLOW}⚠️  $slug: no top-level heading found${NC}"
    warnings=$((warnings + 1))
  fi

  validated=$((validated + 1))
}

# Main
if [ $# -gt 0 ]; then
  # Validate specific skill(s)
  for arg in "$@"; do
    if [ -d "$arg" ]; then
      validate_skill "$arg"
    else
      echo -e "${RED}❌ Not a directory: $arg${NC}"
      errors=$((errors + 1))
    fi
  done
else
  # Validate all skills
  for skill_dir in skills/*/; do
    [ -d "$skill_dir" ] && validate_skill "$skill_dir"
  done
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  Validated: ${GREEN}$validated${NC}"
echo -e "  Warnings:  ${YELLOW}$warnings${NC}"
echo -e "  Errors:    ${RED}$errors${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $errors -gt 0 ]; then
  echo -e "\n${RED}Validation failed with $errors error(s).${NC}"
  exit 1
else
  echo -e "\n${GREEN}All skills valid! ✅${NC}"
fi
