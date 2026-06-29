#!/bin/bash

# Discover Improvements Script
# Finds improvements made to orchestration system in product repos
# and prepares them to be shared back to template repo
#
# Usage: ./discover-improvements.sh [options]
# Options:
#   --output FILE    Save improvements to FILE (default: improvements.md)
#   --patch          Generate git patch file (default: improvements.patch)
#   --compare BRANCH Compare against BRANCH (default: origin/main)
#   --template-url   URL of template repo (default: https://github.com/karanbathijawork/ai-software-company.git)

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Configuration
OUTPUT_FILE="improvements.md"
GENERATE_PATCH=false
COMPARE_BRANCH="origin/main"
TEMPLATE_REPO="https://github.com/karanbathijawork/ai-software-company.git"
TEMPLATE_DIR="/tmp/ai-software-company-template"

# Directories that contain orchestration system (not product code)
ORCHESTRATION_DIRS=(
  "agents/"
  "templates/"
  "workflows/"
  "checklists/"
  "knowledge/"
  "skills/"
  "ai/"
  "mcp/"
  "memory/"
  "docs/getting-started/"
  "docs/architecture/"
  "ORCHESTRATION_SETUP_GUIDE.md"
  "START_BUILD.md"
  "CHOOSE_YOUR_PATH.md"
  "CLEANUP_MANIFEST.md"
  "CLEANUP_PHASE_SUMMARY.md"
)

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --output)
      OUTPUT_FILE="$2"
      shift 2
      ;;
    --patch)
      GENERATE_PATCH=true
      shift
      ;;
    --compare)
      COMPARE_BRANCH="$2"
      shift 2
      ;;
    --template-url)
      TEMPLATE_REPO="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"
echo -e "${BLUE}Discovering Improvements${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"
echo ""

# Get current directory
PRODUCT_REPO=$(pwd)
PRODUCT_NAME=$(basename "$PRODUCT_REPO")

echo -e "${YELLOW}Product repo:${NC} $PRODUCT_REPO"
echo -e "${YELLOW}Comparing against:${NC} $COMPARE_BRANCH"
echo -e "${YELLOW}Template repo:${NC} $TEMPLATE_REPO"
echo ""

# Check if we're in a git repo
if [ ! -d ".git" ]; then
  echo -e "${RED}Error: Not a git repository${NC}"
  exit 1
fi

# Clone template repo if not already present
if [ ! -d "$TEMPLATE_DIR" ]; then
  echo -e "${YELLOW}Cloning template repo...${NC}"
  git clone --quiet "$TEMPLATE_REPO" "$TEMPLATE_DIR"
else
  echo -e "${YELLOW}Updating template repo...${NC}"
  cd "$TEMPLATE_DIR"
  git pull --quiet origin main
  cd "$PRODUCT_REPO"
fi

echo ""
echo -e "${BLUE}Scanning for improvements...${NC}"
echo ""

# Collect all changes
IMPROVEMENTS_FOUND=0
IMPROVEMENTS_DATA=""

# For each orchestration directory, find changes
for dir in "${ORCHESTRATION_DIRS[@]}"; do
  # Check if directory/file exists in current repo
  if [ -e "$dir" ]; then
    # Get diff between template and current
    DIFF=$(git diff --no-color "$TEMPLATE_DIR/$dir" "$dir" 2>/dev/null || true)

    if [ -n "$DIFF" ]; then
      IMPROVEMENTS_FOUND=$((IMPROVEMENTS_FOUND + 1))

      # Count lines changed
      ADDED=$(echo "$DIFF" | grep -c "^+" || true)
      REMOVED=$(echo "$DIFF" | grep -c "^-" || true)

      echo -e "${GREEN}✓${NC} $dir"
      echo -e "  ${YELLOW}Added:${NC} $ADDED lines, ${YELLOW}Removed:${NC} $REMOVED lines"

      # Collect data for markdown report
      IMPROVEMENTS_DATA="${IMPROVEMENTS_DATA}
### $dir

**Lines changed:** +$ADDED / -$REMOVED

\`\`\`diff
${DIFF:0:500}...
\`\`\`

---
"
    fi
  fi
done

echo ""
echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"

if [ $IMPROVEMENTS_FOUND -eq 0 ]; then
  echo -e "${YELLOW}No improvements found in orchestration system${NC}"
  exit 0
fi

echo -e "${GREEN}✓ Found $IMPROVEMENTS_FOUND improvements${NC}"
echo ""

# Generate markdown report
echo -e "${YELLOW}Generating improvement report...${NC}"

cat > "$OUTPUT_FILE" << 'MARKDOWN_END'
# Improvements from [PRODUCT_NAME]

**Date:** $(date +%Y-%m-%d)
**Product:** PRODUCT_NAME
**Template Branch:** TEMPLATE_BRANCH
**Status:** Ready for review

---

## Summary

Found IMPROVEMENTS_COUNT improvements to orchestration system.

These changes improve the system for future products.

---

## Improvements

IMPROVEMENTS_DATA

---

## How to Share Back

1. Create a branch: `git checkout -b improvements/from-PRODUCT_NAME`
2. Create a patch: `git format-patch origin/main --stdout > improvements.patch`
3. Create PR at: https://github.com/karanbathijawork/ai-software-company/pulls
4. Include this report in PR description

---

## Checklist

- [ ] Changes are tested in PRODUCT_NAME build
- [ ] Changes don't include product-specific code
- [ ] Changes improve system for all future products
- [ ] Documentation is clear
- [ ] No secrets or sensitive data included

---

**Template repo:** https://github.com/karanbathijawork/ai-software-company

MARKDOWN_END

# Replace placeholders
sed -i "s/\[PRODUCT_NAME\]/$PRODUCT_NAME/g" "$OUTPUT_FILE"
sed -i "s/PRODUCT_NAME/$PRODUCT_NAME/g" "$OUTPUT_FILE"
sed -i "s/IMPROVEMENTS_COUNT/$IMPROVEMENTS_FOUND/g" "$OUTPUT_FILE"
sed -i "s/TEMPLATE_BRANCH/$COMPARE_BRANCH/g" "$OUTPUT_FILE"
sed -i "s/IMPROVEMENTS_DATA/$IMPROVEMENTS_DATA/g" "$OUTPUT_FILE"

echo -e "${GREEN}✓ Report saved to: $OUTPUT_FILE${NC}"

# Generate patch if requested
if [ "$GENERATE_PATCH" = true ]; then
  PATCH_FILE="${OUTPUT_FILE%.md}.patch"
  echo -e "${YELLOW}Generating patch file...${NC}"

  # Create improvements branch if it doesn't exist
  if ! git show-ref --quiet refs/heads/improvements/auto-discovered; then
    git checkout -b improvements/auto-discovered
  else
    git checkout improvements/auto-discovered
  fi

  # Create patch for orchestration changes only
  for dir in "${ORCHESTRATION_DIRS[@]}"; do
    if [ -e "$dir" ]; then
      git diff "$COMPARE_BRANCH" -- "$dir" >> "$PATCH_FILE" 2>/dev/null || true
    fi
  done

  echo -e "${GREEN}✓ Patch saved to: $PATCH_FILE${NC}"
  echo -e "${YELLOW}To apply patch in template repo:${NC}"
  echo -e "  git apply $PATCH_FILE"
fi

echo ""
echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Next steps:${NC}"
echo ""
echo "1. Review the improvements report:"
echo -e "   ${BLUE}cat $OUTPUT_FILE${NC}"
echo ""
echo "2. Create improvements branch:"
echo -e "   ${BLUE}git checkout -b improvements/from-$PRODUCT_NAME${NC}"
echo ""
echo "3. Commit improvements:"
echo -e "   ${BLUE}git add agents/ templates/ workflows/ ...${NC}"
echo -e "   ${BLUE}git commit -m 'Improvements: [describe changes]'${NC}"
echo ""
echo "4. Create PR at template repo:"
echo -e "   ${BLUE}https://github.com/karanbathijawork/ai-software-company/pulls${NC}"
echo ""
echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"

# Cleanup
rm -rf "$TEMPLATE_DIR"

echo ""
echo -e "${GREEN}✓ Discovery complete!${NC}"
