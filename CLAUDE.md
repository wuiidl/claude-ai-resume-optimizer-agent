# Resume Tailoring Agent - Documentation

## Overview

This project uses the Claude AI resume-optimizer agent to create ATS-optimized, keyword-matched resumes tailored to specific job postings.

## Agent Rules

### Core Principles

1. **NEVER fabricate statements or make up numbers**
   - Only use information from the provided resume data (`my_resume.json`)
   - Do not invent achievements, metrics, or experience
   - Use realistic language: "worked on", "built", "developed", "contributed to"

2. **ATS Optimization**
   - Extract keywords from job postings
   - Match skills and technologies naturally
   - Use standard section headers (Professional Summary, Experience, Skills, Education)
   - Maintain clean Markdown formatting for parsing

3. **Natural Language**
   - Avoid buzzwords and hyperbole
   - Use authentic, professional tone
   - Vary action verbs naturally
   - Keep it truthful and grounded

4. **Length Requirements**
   - Target 1-2 pages maximum
   - Condense older/less relevant roles
   - Prioritize most recent and relevant experience
   - Remove redundant sections

## File Organization

### Input Files

- **`my_resume.json`**: Master resume data containing all experience, education, skills
- **`job-postings/`**: Folder containing job posting text files
  - Example: `job-postings/meta-software-engineer.txt`
  - Example: `job-postings/netflix-job-ads.txt`

### Output Structure

Generated resumes are organized into company-specific folders:

```
output/
├── meta/
│   ├── tailored_resume.md
│   └── tailored_resume.pdf
├── netflix/
│   ├── tailored_resume.md
│   └── tailored_resume.pdf
└── ...
```

**Rules for output organization:**
- Create a subfolder for each company (lowercase company name)
- Each folder contains both `.md` and `.pdf` versions
- Use consistent naming: `tailored_resume.md` and `tailored_resume.pdf`

## Resume Data Structure

The `my_resume.json` file contains:

### Contact Information
- Name, email, phone, location
- LinkedIn profile
- Citizenship status (for security clearance roles)

### Professional Summary
- 2-4 sentences highlighting key expertise
- Include years of experience
- Mention key achievements/metrics

### Skills
- Programming languages (Java, Scala, Python, etc.)
- Technologies (AWS, Kubernetes, Docker, etc.)
- DevOps tools (Git, CircleCI, GitHub Actions, IaC)
- Leadership skills (Technical Leadership, Mentoring)

### Experience
For each role:
- Job title
- Company name
- Location
- Dates (start - end)
- 4-10 bullet points with:
  - Action verbs
  - Context and impact
  - Quantified results where possible

### Education
- Degrees (Bachelor's, Master's)
- Institution and location
- Graduation year
- Notable achievements/honors

### Projects (Optional)
- Open source contributions
- Notable personal projects

## Using the Resume-Optimizer Agent

### Running the Agent

Use Claude Code's Task tool with the `resume-optimizer` agent:

```
Task(
  subagent_type="resume-optimizer",
  prompt="Tailor resume for [Company] [Role] position.

  Resume data: my_resume.json
  Job posting: job-postings/[company]-job.txt
  Output: output/[company]/tailored_resume.md

  Requirements:
  - Extract keywords from job posting
  - Target 1-2 pages
  - Emphasize relevant experience
  - Maintain truthfulness"
)
```

### Generating PDFs

After generating Markdown, create PDF with pandoc:

```bash
pandoc output/[company]/tailored_resume.md \
  -o output/[company]/tailored_resume.pdf \
  --pdf-engine=pdflatex \
  -V geometry:margin=0.75in \
  -V fontsize=11pt \
  -V linestretch=1.15 \
  -V colorlinks=true \
  -V urlcolor=blue
```

## Tailoring Strategy

### For Each Job Posting

1. **Analyze Requirements**
   - Extract required skills and technologies
   - Identify key responsibilities
   - Note years of experience required
   - Find specific keywords (ATS optimization)

2. **Match Experience**
   - Prioritize most relevant roles
   - Emphasize matching technologies
   - Highlight similar responsibilities
   - Use matching terminology

3. **Optimize Content**
   - Lead with strongest matches
   - Quantify achievements
   - Show impact and scale
   - Demonstrate leadership where relevant

4. **Format for ATS**
   - Use standard headers
   - Include keywords naturally
   - Maintain clean structure
   - Avoid complex formatting

## Dependencies

### Required Software

- **pandoc**: For PDF generation
  ```bash
  brew install pandoc
  ```

- **BasicTeX or MacTeX**: LaTeX distribution for PDF rendering
  ```bash
  brew install --cask basictex
  ```

- **Claude Code**: For running the resume-optimizer agent

## Best Practices

1. **Keep my_resume.json Updated**
   - Add new achievements as they happen
   - Update metrics and numbers
   - Refine bullet points
   - Add new skills and technologies

2. **Review Generated Resumes**
   - Check for accuracy
   - Verify all numbers and dates
   - Ensure natural language flow
   - Validate PDF formatting

3. **Version Control**
   - Keep track of different versions
   - Save company-specific customizations
   - Document what works

4. **Iterate Based on Feedback**
   - Track which resumes get responses
   - Refine approaches for different roles
   - Update keywords based on industry trends

## Notes

- Always maintain truthfulness - never fabricate experience
- Keep resumes concise (1-2 pages)
- Emphasize impact and results
- Tailor for each specific role
- Optimize for both ATS and human readers
