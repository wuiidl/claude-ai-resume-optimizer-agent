#!/bin/bash

# Resume PDF Regeneration Script
# Regenerates all PDF files from markdown resumes in the output folder

set -e  # Exit on error

echo "======================================"
echo "Resume PDF Regeneration"
echo "======================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Add BasicTeX to PATH if available
if [ -d "/Library/TeX/texbin" ]; then
    export PATH="/Library/TeX/texbin:$PATH"
fi

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check dependencies
echo "Checking dependencies..."
MISSING_DEPS=0

if ! command_exists pandoc; then
    echo -e "${RED}✗ Pandoc not found${NC}"
    echo "  Install with: brew install pandoc"
    MISSING_DEPS=$((MISSING_DEPS + 1))
else
    echo -e "${GREEN}✓ Pandoc found${NC}"
fi

if ! command_exists xelatex && ! command_exists pdflatex; then
    echo -e "${RED}✗ LaTeX not found${NC}"
    echo "  Install with: brew install --cask basictex"
    echo "  Then add to PATH: export PATH=\"/Library/TeX/texbin:\$PATH\""
    MISSING_DEPS=$((MISSING_DEPS + 1))
else
    if command_exists xelatex; then
        PDF_ENGINE="xelatex"
        echo -e "${GREEN}✓ LaTeX found (xelatex)${NC}"
    else
        PDF_ENGINE="pdflatex"
        echo -e "${GREEN}✓ LaTeX found (pdflatex)${NC}"
    fi
fi

if [ $MISSING_DEPS -gt 0 ]; then
    echo ""
    echo -e "${RED}Missing dependencies. Please install and try again.${NC}"
    exit 1
fi

echo ""
echo "======================================"
echo "Finding markdown resumes..."
echo "======================================"
echo ""

# Find all markdown files in output directory
MD_FILES=$(find output -type f -name "*.md" 2>/dev/null)

if [ -z "$MD_FILES" ]; then
    echo -e "${YELLOW}No markdown files found in output/ directory${NC}"
    exit 0
fi

# Count total files
TOTAL=$(echo "$MD_FILES" | wc -l | tr -d ' ')
CURRENT=0
SUCCESS=0
FAILED=0

echo -e "${BLUE}Found $TOTAL markdown file(s) to convert${NC}"
echo ""

# Process each markdown file
while IFS= read -r MD_FILE; do
    CURRENT=$((CURRENT + 1))

    # Get the PDF filename (replace .md with .pdf)
    PDF_FILE="${MD_FILE%.md}.pdf"

    # Get just the filename for display
    BASENAME=$(basename "$MD_FILE")

    echo -e "${BLUE}[$CURRENT/$TOTAL]${NC} Converting: $BASENAME"

    # Convert to PDF
    if pandoc "$MD_FILE" \
        -o "$PDF_FILE" \
        --pdf-engine="$PDF_ENGINE" \
        -V geometry:margin=0.75in \
        -V fontsize=11pt \
        -V linestretch=1.15 \
        -V colorlinks=true \
        -V urlcolor=blue \
        2>/dev/null; then

        echo -e "${GREEN}  ✓ Success: $(basename "$PDF_FILE")${NC}"
        SUCCESS=$((SUCCESS + 1))
    else
        echo -e "${RED}  ✗ Failed: $(basename "$PDF_FILE")${NC}"
        FAILED=$((FAILED + 1))
    fi
    echo ""
done <<< "$MD_FILES"

# Summary
echo "======================================"
echo "Summary"
echo "======================================"
echo ""
echo -e "Total files:    ${BLUE}$TOTAL${NC}"
echo -e "Successful:     ${GREEN}$SUCCESS${NC}"
echo -e "Failed:         ${RED}$FAILED${NC}"
echo ""

if [ $FAILED -gt 0 ]; then
    echo -e "${YELLOW}Some conversions failed. Check the output above for details.${NC}"
    exit 1
else
    echo -e "${GREEN}All PDFs regenerated successfully!${NC}"
fi
