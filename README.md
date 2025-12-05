# Resume Optimizer - AI-Powered ATS Resume Tailoring

An intelligent resume optimization system powered by Claude Code that generates ATS-optimized, keyword-matched resumes tailored to specific job postings. Uses Claude AI agents to analyze job requirements and create customized resumes while maintaining authenticity and never fabricating information.

## 🎯 What This Does

This project uses Claude Code's agent system to:

1. **Analyze job postings** - Extract key requirements, skills, and keywords from job descriptions
2. **Tailor your resume** - Customize your resume content to match each specific role
3. **Optimize for ATS** - Format resumes to pass Applicant Tracking Systems
4. **Generate PDFs** - Create professional PDF versions using Pandoc
5. **Maintain authenticity** - Never fabricates achievements or makes up numbers

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

## 📁 Project Structure

```
resume/
├── .claude/
│   └── resume-optimizer-agent.md    # Agent configuration
├── .gitignore                        # Excludes personal data
├── README.md                         # This file
├── CLAUDE.md                         # Agent rules and documentation
├── my_resume.json                    # Your resume data (gitignored)
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

# Linux (Ubuntu/Debian)
sudo apt-get install texlive-latex-base texlive-fonts-recommended

# Test installation
pdflatex --version
```

**Note**: After installing LaTeX, you may need to restart your terminal.

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

Contributions are welcome! Areas for improvement:

- Additional resume templates
- Support for more output formats (LaTeX, HTML)
- Cover letter generation
- Interview preparation guides
- LinkedIn profile optimization

## 📄 License

MIT License - feel free to use this for your own job search!

## 🙏 Acknowledgments

- Built with [Claude Code](https://docs.anthropic.com/claude/docs/claude-code) by Anthropic
- PDF generation powered by [Pandoc](https://pandoc.org/)

---

**Note**: This project uses Claude AI to analyze and tailor resumes. The quality of output depends on the quality and completeness of your `my_resume.json` data. Be thorough and honest in documenting your achievements!
