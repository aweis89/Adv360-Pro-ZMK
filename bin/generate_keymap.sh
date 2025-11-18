#!/bin/bash
set -e

# Script to generate keymap visualization using keymap-drawer
# This creates a 2-column layout PNG showing all keyboard layers

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Generating keymap visualization...${NC}"

# Check if keymap-drawer is installed
if ! command -v keymap &> /dev/null; then
    echo -e "${RED}Error: keymap-drawer is not installed${NC}"
    echo "Please install it with: pip install keymap-drawer"
    exit 1
fi

# Check if rsvg-convert is installed
if ! command -v rsvg-convert &> /dev/null; then
    echo -e "${RED}Error: rsvg-convert is not installed${NC}"
    echo "Please install it with: brew install librsvg"
    exit 1
fi

# Navigate to repo root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR/.."

# Step 1: Parse the ZMK keymap to YAML
echo -e "${YELLOW}Step 1: Parsing ZMK keymap...${NC}"
keymap parse -z config/adv360.keymap -o keymap.yaml

# Step 2: Generate SVG with 2-column layout
echo -e "${YELLOW}Step 2: Generating SVG (2-column layout)...${NC}"
keymap -c keymap-drawer-config.yaml draw keymap.yaml -z adv360 -o keymap-2col.svg

# Step 3: Convert SVG to PNG
echo -e "${YELLOW}Step 3: Converting to PNG...${NC}"
rsvg-convert -w 2000 keymap-2col.svg -o keymap-2col.png

# Also generate single base layer for quick reference
echo -e "${YELLOW}Step 4: Generating base layer...${NC}"
keymap draw keymap.yaml -z adv360 -s Base -o keymap-base.svg
rsvg-convert -w 1200 keymap-base.svg -o keymap-base.png

echo -e "${GREEN}✓ Keymap generation complete!${NC}"
echo ""
echo "Generated files:"
echo "  - keymap-2col.png  (All layers, 2 columns)"
echo "  - keymap-2col.svg  (SVG version)"
echo "  - keymap-base.png  (Base layer only)"
echo "  - keymap-base.svg  (SVG version)"
echo "  - keymap.yaml      (Parsed keymap data)"
