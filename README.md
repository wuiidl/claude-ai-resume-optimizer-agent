# Resume Optimizer - AI-Powered ATS Resume Tailoring & LinkedIn Optimization

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub](https://img.shields.io/badge/GitHub-wuiidl%2Fresume--optimizer-blue)](https://github.com/wuiidl/resume-optimizer)

An intelligent career optimization system powered by Claude Code that generates ATS-optimized, keyword-matched resumes and optimizes LinkedIn profiles for recruiter visibility. Uses Claude AI agents to analyze job requirements and create customized career materials while maintaining authenticity and never fabricating information.

## 🎯 What This Does

This project uses Claude Code's agent system to:

### Resume Optimization
1. **Analyze job postings** - Extract key requirements, skills, and keywords from job descriptions
2. **Tailor your resume** - Customize your resume content to match each specific role
3. **Optimize for ATS** - Format resumes to pass Applicant Tracking Systems
4. **Generate PDFs** - Create professional PDF versions using Pandoc
5. **Maintain authenticity** - Never fabricates achievements or makes up numbers

### LinkedIn Optimization
1. **Recruiter search optimization** - Keyword strategy and LinkedIn SEO
2. **Profile analysis** - Headline, about section, experience bullets, skills selection
3. **Privacy-first job searching** - Get found by recruiters without alerting colleagues
4. **Content strategy** - Posting and engagement recommendations
5. **Complete profile rewrites** - Ready-to-use optimized sections

### Key Features

- ✅ **AI-powered tailoring** - Claude AI agent analyzes job postings and your experience
- ✅ **ATS optimization** - Keyword matching, standard formatting, proper section headers
- ✅ **Natural language** - Avoids buzzwords, uses authentic professional tone
- ✅ **Multi-format output** - Generates both Markdown and PDF versions
- ✅ **Organized outputs** - Separate folders for each company/role
- ✅ **No fabrication** - Only uses information from your resume data

## 📋 Requirements

### Software Dependencies

1. **Claude Code** - [Download here](https://docs.anthropic.com/claude/docs/claude-code)
   - This project requires Claude Code CLI to run the resume-optimizer agent

2. **Pandoc** - For PDF generation
   ```bash
   # macOS
   brew install pandoc

   # Ubuntu/Debian
   sudo apt-get install pandoc
   ```

3. **LaTeX** - For PDF rendering:
   ```bash
   # macOS (recommended: smaller install)
   brew install --cask basictex
   # After install, add to PATH:
   export PATH="/Library/TeX/texbin:$PATH"
   # Or restart your terminal

   # Ubuntu/Debian
   sudo apt-get install texlive-latex-base texlive-fonts-recommended
   ```

## 🚀 Quick Start

### Automated Setup (Recommended)

For macOS and Linux users, we provide an installation script that automatically installs all dependencies:

```bash
git clone <your-repo-url>
cd resume
chmod +x setup.sh
./setup.sh
```

The setup script will:
- ✅ Install Pandoc
- ✅ Install LaTeX (BasicTeX on macOS, texlive on Linux)
- ✅ Check for Claude Code
- ✅ Create necessary directories
- ✅ Optionally create `my_resume.json` from template

### Manual Setup

If you prefer to install dependencies manually, follow these steps:

### 1. Clone this repository

```bash
git clone <your-repo-url>
cd resume
```

### 2. Create your resume data file

Create a file called `my_resume.json` in the root directory with your information:

```json
{
  "contact": {
    "name": "Your Name",
    "email": "your.email@example.com",
    "phone": "+1 555 123 4567",
    "location": "City, State",
    "linkedin": "https://www.linkedin.com/in/yourprofile/",
    "github": "https://github.com/yourusername",
    "website": "https://yourwebsite.com"
  },
  "summary": "Brief professional summary highlighting your expertise and experience...",
  "skills": {
    "languages": ["Python", "Java", "JavaScript"],
    "frameworks": ["React", "Spring Boot", "Django"],
    "tools": ["AWS", "Docker", "Kubernetes"],
    "concepts": ["Distributed Systems", "Microservices", "CI/CD"]
  },
  "experience": [
    {
      "company": "Company Name",
      "title": "Your Title",
      "location": "City, State",
      "start_date": "Month Year",
      "end_date": "Month Year",
      "achievements": [
        "Achievement with quantified impact (e.g., 'Reduced costs by $500K')",
        "Another achievement with metrics",
        "Technical accomplishment"
      ]
    }
  ],
  "education": [
    {
      "institution": "University Name",
      "degree": "Degree Name",
      "field": "Field of Study",
      "graduation_date": "Year",
      "details": ["Relevant coursework", "Awards", "GPA (if strong)"]
    }
  ],
  "projects": [
    {
      "name": "Project Name",
      "description": "Brief description",
      "technologies": ["Tech1", "Tech2"],
      "achievements": ["Impact or result"]
    }
  ]
}
```

**Important**: The `my_resume.json` file is gitignored - your personal data stays private.

### 3. Add job postings

The `job-postings/` directory already exists. Add job descriptions as `.txt` files (e.g., `company-role-name.txt`):

```
job-postings/
├── meta-software-engineer.txt
├── netflix-distributed-systems.txt
└── google-staff-engineer.txt
```

Simply paste the job description text into each file.

### 4. Configure the agent

The `.claude/resume-optimizer-agent.md` file contains the agent configuration and instructions. You can customize the agent behavior by editing this file, but the defaults work well for most use cases.

## 💻 Usage

### Running the Resume Optimizer

1. **Start Claude Code** in this directory:
   ```bash
   claude-code
   ```

2. **Invoke the resume-optimizer agent**:
   ```
   Can you generate tailored resumes for all the job postings in the job-postings folder?
   ```

   Or for a specific job:
   ```
   Can you generate a tailored resume for the Meta software engineer role?
   ```

3. **The agent will**:
   - Read your `my_resume.json` file
   - Analyze each job posting in `job-postings/`
   - Extract keywords and requirements
   - Generate tailored resumes matching each role
   - Create both Markdown (.md) and PDF (.pdf) versions
   - Organize outputs into `output/company-name/` folders

### Running the LinkedIn Optimizer

1. **Start Claude Code** in this directory:
   ```bash
   claude-code
   ```

2. **Invoke the linkedin-optimizer agent**:
   ```
   Can you help me optimize my LinkedIn profile for [target role]?
   ```

   Or for specific sections:
   ```
   Can you help me write a better LinkedIn headline for senior software engineer roles?
   ```

   Or for privacy-focused optimization:
   ```
   I want recruiters to find me but I don't want my manager to know I'm looking
   ```

3. **The agent will**:
   - Analyze your current profile or resume data
   - Provide keyword optimization recommendations
   - Rewrite headline, about section, or experience bullets
   - Suggest skills to add/remove and top 3 to pin
   - Recommend privacy settings for discreet job searching
   - Provide content and engagement strategy

### Output Structure

```
output/
├── meta/
│   ├── meta-software-engineer.md
│   └── meta-software-engineer.pdf
├── netflix/
│   ├── netflix-distributed-systems.md
│   └── netflix-distributed-systems.pdf
└── google/
    ├── google-staff-engineer.md
    └── google-staff-engineer.pdf
```

### Regenerating PDFs

If you make changes to markdown resumes and want to regenerate all PDFs:

```bash
./regenerate-pdfs.sh
```

This script will:
- Find all `.md` files in `output/` directory
- Regenerate PDFs with consistent formatting
- Overwrite existing PDF files
- Show progress with color-coded output

## 📁 Project Structure

```
resume/
├── .claude/
│   └── agents/
│       ├── resume-optimizer.md       # Resume tailoring agent
│       └── linkedin-optimizer.md     # LinkedIn optimization agent
├── .gitignore                        # Excludes personal data
├── README.md                         # This file
├── CHANGELOG.md                      # Version history
├── CLAUDE.md                         # Agent rules and documentation
├── setup.sh                          # Automated setup script (macOS/Linux)
├── regenerate-pdfs.sh                # Regenerate all PDFs from markdown
├── my_resume.json                    # Your resume data (gitignored)
├── my_resume.json.example            # Template to get started
├── job-postings/                     # Job descriptions (gitignored)
│   ├── company1-role.txt
│   └── company2-role.txt
└── output/                           # Generated resumes (gitignored)
    ├── company1/
    └── company2/
```

## 🎨 Customization

### Modifying Agent Behavior

Edit `.claude/resume-optimizer-agent.md` to customize:
- Resume length targets (default: 1-2 pages)
- Formatting preferences
- Keyword extraction rules
- Writing style guidelines

### Resume Template

The agent uses the structure defined in `CLAUDE.md`. You can modify:
- Section order
- Bullet point styles
- Header formatting
- PDF styling (via Pandoc options)

## 🔒 Privacy & Security

- ✅ All personal data (`my_resume.json`, job postings, outputs) is gitignored
- ✅ No data is sent anywhere except to Claude AI for resume generation
- ✅ Generated resumes stay local on your machine
- ✅ Safe to push this repository to GitHub (personal data excluded)

## 📝 Agent Rules & Principles

The resume-optimizer agent follows these core principles (defined in `CLAUDE.md`):

1. **Never fabricate** - Only uses information from your resume data
2. **Natural language** - Avoids buzzwords, uses authentic professional tone
3. **ATS optimization** - Extracts keywords and matches them naturally
4. **Quantified impact** - Emphasizes metrics and measurable results
5. **Concise format** - Targets 1-2 pages maximum

## 🛠️ Troubleshooting

### Setup script fails

**Issue**: Setup script doesn't run or has permission errors

**Solution**:
```bash
# Make sure script is executable
chmod +x setup.sh

# Run the script
./setup.sh
```

### PDF generation fails

**Error**: `pdflatex not found`

**Solution**: Install LaTeX (see Requirements section)

```bash
# macOS
brew install --cask basictex

# After installing BasicTeX, add to PATH:
export PATH="/Library/TeX/texbin:$PATH"

# Or add permanently to your shell profile (~/.zshrc or ~/.bash_profile):
echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.zshrc

# Linux (Ubuntu/Debian)
sudo apt-get install texlive-latex-base texlive-fonts-recommended

# Test installation
pdflatex --version
```

**Note**: After installing BasicTeX on macOS, you need to either:
1. Run `export PATH="/Library/TeX/texbin:$PATH"` in your current terminal, OR
2. Restart your terminal to pick up the PATH automatically

### Agent not found

**Error**: `resume-optimizer agent not found`

**Solution**: Ensure you're in the correct directory with `.claude/agents/resume-optimizer.md`

```bash
# Check you're in the right directory
ls .claude/agents/

# Should show: resume-optimizer.md
```

### Empty or incomplete resumes

**Issue**: Generated resumes missing content

**Solution**: Check your `my_resume.json` structure matches the template format above

## 🤝 Contributing

Contributions are welcome! Please visit the [GitHub repository](https://github.com/wuiidl/resume-optimizer) to:

- Report bugs or issues
- Suggest new features
- Submit pull requests
- Share feedback

**Areas for improvement:**
- Additional resume templates
- Support for more output formats (LaTeX, HTML)
- Cover letter generation agent
- Interview preparation agent
- Additional LinkedIn optimization features
- Job application tracking system
- Salary negotiation guidance

**How to contribute:**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

Copyright (c) 2025 Walter Gugenberger

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

## 🙏 Acknowledgments

- Built with [Claude Code](https://docs.anthropic.com/claude/docs/claude-code) by Anthropic
- PDF generation powered by [Pandoc](https://pandoc.org/)

---

## 👤 Author

**Walter Gugenberger**
- GitHub: [@wuiidl](https://github.com/wuiidl)
- LinkedIn: [waltergugenberger](https://www.linkedin.com/in/waltergugenberger/)

---

**Note**: This project uses Claude AI to analyze and tailor resumes. The quality of output depends on the quality and completeness of your `my_resume.json` data. Be thorough and honest in documenting your achievements!
