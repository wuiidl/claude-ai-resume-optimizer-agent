#!/bin/bash

# Resume Optimizer Setup Script
# Installs dependencies for the AI-powered resume tailoring system

set -e  # Exit on error

echo "======================================"
echo "Resume Optimizer - Setup Script"
echo "======================================"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo -e "${GREEN}Detected OS: ${MACHINE}${NC}"
echo ""

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install on macOS
install_macos() {
    echo "Installing dependencies for macOS..."
    echo ""

    # Check for Homebrew
    if ! command_exists brew; then
        echo -e "${YELLOW}Homebrew not found. Installing Homebrew...${NC}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo -e "${GREEN}✓ Homebrew already installed${NC}"
    fi

    # Install Pandoc
    if ! command_exists pandoc; then
        echo -e "${YELLOW}Installing Pandoc...${NC}"
        brew install pandoc
    else
        echo -e "${GREEN}✓ Pandoc already installed ($(pandoc --version | head -n1))${NC}"
    fi

    # Install BasicTeX
    if ! command_exists pdflatex; then
        echo -e "${YELLOW}Installing BasicTeX (LaTeX distribution)...${NC}"
        echo -e "${YELLOW}This may take a few minutes...${NC}"
        brew install --cask basictex

        # Add to PATH for current session
        export PATH="/Library/TeX/texbin:$PATH"

        echo -e "${YELLOW}You may need to restart your terminal for LaTeX to be available${NC}"
    else
        echo -e "${GREEN}✓ LaTeX already installed ($(pdflatex --version | head -n1))${NC}"
    fi
}

# Function to install on Linux
install_linux() {
    echo "Installing dependencies for Linux..."
    echo ""

    # Detect package manager
    if command_exists apt-get; then
        PKG_MANAGER="apt-get"
        INSTALL_CMD="sudo apt-get install -y"
    elif command_exists yum; then
        PKG_MANAGER="yum"
        INSTALL_CMD="sudo yum install -y"
    elif command_exists pacman; then
        PKG_MANAGER="pacman"
        INSTALL_CMD="sudo pacman -S --noconfirm"
    else
        echo -e "${RED}✗ Could not detect package manager${NC}"
        exit 1
    fi

    echo -e "${GREEN}Using package manager: ${PKG_MANAGER}${NC}"
    echo ""

    # Update package lists
    if [ "$PKG_MANAGER" = "apt-get" ]; then
        echo "Updating package lists..."
        sudo apt-get update
    fi

    # Install Pandoc
    if ! command_exists pandoc; then
        echo -e "${YELLOW}Installing Pandoc...${NC}"
        $INSTALL_CMD pandoc
    else
        echo -e "${GREEN}✓ Pandoc already installed ($(pandoc --version | head -n1))${NC}"
    fi

    # Install LaTeX
    if ! command_exists pdflatex; then
        echo -e "${YELLOW}Installing LaTeX distribution...${NC}"
        if [ "$PKG_MANAGER" = "apt-get" ]; then
            $INSTALL_CMD texlive-latex-base texlive-fonts-recommended texlive-latex-extra
        elif [ "$PKG_MANAGER" = "yum" ]; then
            $INSTALL_CMD texlive texlive-latex
        elif [ "$PKG_MANAGER" = "pacman" ]; then
            $INSTALL_CMD texlive-core texlive-latexextra
        fi
    else
        echo -e "${GREEN}✓ LaTeX already installed ($(pdflatex --version | head -n1))${NC}"
    fi
}

# Main installation logic
echo "======================================"
echo "Step 1: Installing System Dependencies"
echo "======================================"
echo ""

case "${MACHINE}" in
    Mac)
        install_macos
        ;;
    Linux)
        install_linux
        ;;
    *)
        echo -e "${RED}✗ Unsupported operating system: ${MACHINE}${NC}"
        echo ""
        echo "Please install the following manually:"
        echo "  - Pandoc: https://pandoc.org/installing.html"
        echo "  - LaTeX: https://www.latex-project.org/get/"
        echo "  - Claude Code: https://docs.anthropic.com/claude/docs/claude-code"
        exit 1
        ;;
esac

echo ""
echo "======================================"
echo "Step 2: Verifying Claude Code"
echo "======================================"
echo ""

if command_exists claude-code || command_exists claude; then
    echo -e "${GREEN}✓ Claude Code is installed${NC}"
else
    echo -e "${YELLOW}⚠ Claude Code not found${NC}"
    echo ""
    echo "Please install Claude Code:"
    echo "  Visit: https://docs.anthropic.com/claude/docs/claude-code"
    echo ""
fi

echo ""
echo "======================================"
echo "Step 3: Setting Up Project Structure"
echo "======================================"
echo ""

# Create directories if they don't exist
mkdir -p job-postings
mkdir -p output

echo -e "${GREEN}✓ Created job-postings/ directory${NC}"
echo -e "${GREEN}✓ Created output/ directory${NC}"

# Check if my_resume.json exists
if [ ! -f "my_resume.json" ]; then
    echo ""
    echo -e "${YELLOW}⚠ my_resume.json not found${NC}"
    echo ""
    read -p "Would you like to copy the example template to get started? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp my_resume.json.example my_resume.json
        echo -e "${GREEN}✓ Created my_resume.json from template${NC}"
        echo -e "${YELLOW}  → Please edit my_resume.json with your actual information${NC}"
    fi
else
    echo -e "${GREEN}✓ my_resume.json already exists${NC}"
fi

echo ""
echo "======================================"
echo "Step 4: Verifying Installation"
echo "======================================"
echo ""

# Verify all dependencies
ERRORS=0

if command_exists pandoc; then
    echo -e "${GREEN}✓ Pandoc: $(pandoc --version | head -n1)${NC}"
else
    echo -e "${RED}✗ Pandoc not found${NC}"
    ERRORS=$((ERRORS + 1))
fi

if command_exists pdflatex; then
    echo -e "${GREEN}✓ LaTeX: $(pdflatex --version | head -n1)${NC}"
else
    echo -e "${RED}✗ LaTeX (pdflatex) not found${NC}"
    ERRORS=$((ERRORS + 1))
fi

if command_exists claude-code || command_exists claude; then
    echo -e "${GREEN}✓ Claude Code installed${NC}"
else
    echo -e "${YELLOW}⚠ Claude Code not found (install manually)${NC}"
fi

echo ""
echo "======================================"
echo "Setup Complete!"
echo "======================================"
echo ""

if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✓ All dependencies installed successfully!${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Edit my_resume.json with your information"
    echo "  2. Add job postings to job-postings/ folder"
    echo "  3. Run 'claude-code' to start generating resumes"
    echo ""
    echo "For more details, see README.md"
else
    echo -e "${RED}✗ ${ERRORS} error(s) occurred during installation${NC}"
    echo ""
    echo "Please fix the errors above and try again."
    echo "See README.md for manual installation instructions."
    exit 1
fi

echo ""
