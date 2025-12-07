# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- **Career Preferences Integration** (`career_preferences.json`) - NEW strategic career planning feature
  - Define target role types (e.g., "Distributed Systems Engineering", "Technical Leadership")
  - Specify role types to avoid (e.g., "8+ years ML required" when limited ML experience)
  - Current level and equivalent levels across companies for proper positioning
  - Key strengths and areas to develop for honest gap assessment
  - Company preferences and career goals (short-term and long-term)
  - Special considerations (clearance eligibility, privacy concerns, referrals)
  - Example file: `career_preferences.json.example`
- **Enhanced Resume Optimizer Agent** - Now reads career preferences before tailoring
  - Strategic fit assessment for each job (e.g., "85% match - strong fit, slight ML gap")
  - Level-specific tailoring strategy (same-level vs. level-up positioning)
  - Honest gap flagging when roles require expertise in "areas to develop"
  - Alignment with target_role_types for better experience highlighting
  - Respects privacy concerns and special considerations
- LinkedIn profile optimizer agent (`.claude/agents/linkedin-optimizer.md`)
- LinkedIn SEO and keyword optimization
- Privacy-focused job search recommendations
- Headline, about section, and experience bullet optimization
- Skills selection and endorsement strategy
- Profile completeness and recruiter visibility guidance
- Content and engagement strategy for LinkedIn
- **PDF regeneration script** (`regenerate-pdfs.sh`) - Automatically regenerates all PDFs from markdown resumes
  - Finds all .md files in output directory
  - Converts to PDF with consistent formatting
  - Overwrites existing PDFs
  - Color-coded progress output
  - Dependency checking (pandoc, LaTeX)
- **MIT License** - Open source license with attribution requirement
  - Allows free use, modification, and distribution
  - Requires copyright notice in all copies
  - Prevents others from claiming authorship
- **GitHub repository links** - Added throughout README
  - GitHub badges at top of README
  - Author section with GitHub profile link
  - Contributing section with repository link
  - Repository: https://github.com/wuiidl/resume-optimizer

### Changed
- **Resume formatting standards updated:**
  - Header format: Name as H1 title, location as bold subtitle
  - **ALL contact information on ONE line, separated by "|" (pipe character)** - NO line breaks between items
  - **NEVER use emojis ANYWHERE in resumes** - Professional service standard
  - No special characters or icons (standard punctuation only)
  - **Strict page length enforcement: 85 lines MAX (60-70 target = 2 pages)**
  - Current role: 6-8 bullets MAX, previous roles: 3-4 bullets MAX
  - Older roles (5+ years) should be condensed under "Earlier Experience" with 1 line each
- Updated resume-optimizer agent with strict professional formatting rules and line counting
- Updated CLAUDE.md documentation with professional standards section
- Emphasized NO emojis policy throughout all resume generation

### Fixed
- BasicTeX PATH issue on macOS - added documentation and automatic detection in setup script
- Setup script now detects if BasicTeX is installed but not in PATH
- Added PATH export instructions to README.md for BasicTeX users
- Improved troubleshooting section with permanent PATH configuration
- Resume header formatting: Clean layout with proper line wrapping

## [1.0.0] - 2025-12-05

### Added
- Initial release of Resume Optimizer
- Claude Code agent integration for AI-powered resume tailoring
- ATS optimization with keyword extraction and matching
- Automatic resume generation from job postings
- PDF generation using Pandoc with professional formatting
- JSON-based resume data structure (`my_resume.json`)
- Example resume template (`my_resume.json.example`)
- Automated setup script for macOS and Linux (`setup.sh`)
- Company-specific output organization (separate folders per company)
- Markdown and PDF output formats
- Comprehensive README with setup and usage instructions
- Troubleshooting guide for common issues
- `.gitignore` to protect personal information
- Agent configuration in `.claude/agents/resume-optimizer.md`
- CLAUDE.md documentation with agent rules and best practices
- CHANGELOG.md for version tracking

### Core Features
- **Never fabricates**: Only uses information from your resume data
- **Natural language**: Avoids buzzwords, uses authentic professional tone
- **ATS-optimized**: Extracts and matches keywords naturally
- **Multi-format**: Generates both Markdown and PDF versions
- **Privacy-first**: Personal data stays local, gitignored from version control
- **Automated setup**: One-command installation of all dependencies

### Dependencies
- Claude Code CLI
- Pandoc (for PDF generation)
- LaTeX (BasicTeX on macOS, texlive on Linux)

[1.0.0]: https://github.com/yourusername/resume-optimizer/releases/tag/v1.0.0
