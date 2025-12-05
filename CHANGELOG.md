# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
