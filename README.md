# 🤖 Awesome Dev Agents — GitHub Copilot Custom Agents for Software Development

<div align="center">

![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Agents](https://img.shields.io/badge/agents-9-00e5cc?style=flat-square)
![GitHub Copilot](https://img.shields.io/badge/GitHub%20Copilot-Custom%20Agents-7c6af7?style=flat-square)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen?style=flat-square)

**9 battle-tested custom agents for the complete software development lifecycle.**  
Drop these `.agent.md` files into your repo and ship better software, faster.

[**→ View Interactive Showcase**](https://tanish.dev/copilot-agents) · [**Browse Agents**](#agents) · [**Quick Start**](#quick-start) · [**Contribute**](CONTRIBUTING.md)

</div>

---

## Why This Exists

GitHub Copilot's custom agent mode is incredibly powerful, but most people use generic prompts. These agents are **purpose-built roles** with specific rules, toolsets, and expertise — so you get consistent, high-quality output every time without re-explaining your stack.

Each agent:
- Has a **focused domain** (no jack-of-all-trades agents)
- Comes with **opinionated rules** that enforce good engineering practices
- Includes **example trigger phrases** so you know exactly when to invoke it
- Is **ready to use** — no modification needed, just copy and go

---

## Agents

| Agent | Domain | Key Technologies |
|-------|--------|------------------|
| [🤖 AI Engineer](#-ai-engineer) | LLMs, RAG, Inference | LangChain, FastAPI, PyTorch, YOLO, OCR |
| [⚡ Full Stack Dev](#-full-stack-dev) | Frontend + Backend | React, Node.js, Docker, SQL, REST APIs |
| [🧠 ML Researcher](#-ml-researcher) | Classical ML, Data Science | scikit-learn, XGBoost, Pandas, Notebooks |
| [🔍 Code Reviewer](#-code-reviewer) | Code Quality | Python, JS/TS, C++, Java (all languages) |
| [🏗️ System Designer](#️-system-designer) | Architecture | REST, Microservices, Mermaid, DB Schemas |
| [📝 Doc Writer](#-doc-writer) | Documentation | README, Proposals, IEEE Papers, Docstrings |
| [🛡️ Security Auditor](#️-security-auditor) | Security | OWASP Top 10, Secrets, Injection, CVEs |
| [🌍 Open Source Contributor](#-open-source-contributor) | Open Source | Codebase navigation, PRs, Proposals, Beginner guide |
| [🎨 UI Designer](#-ui-designer) | Frontend Design | Design extraction, Screenshot-to-code, CSS systems |

---

> **9 agents** covering every phase of software development.

## Quick Start

### Option A: VS Code (Workspace Agent)

1. Open **Copilot Chat** → click the **agents dropdown** → **Configure Custom Agents…**
2. Choose **Workspace** (repo-specific) or **User Profile** (global)
3. Paste the agent config from the relevant file in `/agents/`
4. Save → the agent appears in the dropdown immediately

### Option B: One Command (Recommended)

This creates `.github/agents/` in your repo and installs all agents in one go.

**Mac/Linux:**
```bash
curl -fsSL https://raw.githubusercontent.com/Tanish-Dev/copilot-agents/main/install-global.sh | bash -s -- --project .
```

**Windows (PowerShell):**
```powershell
New-Item -Path .github\agents -ItemType Directory -Force; Invoke-RestMethod https://api.github.com/repos/Tanish-Dev/copilot-agents/contents/agents | Where-Object {$_.name -match '\.agent\.md$'} | ForEach-Object { Invoke-WebRequest $_.download_url -OutFile ".github\agents\$($_.name)" }
```

You can also run locally after cloning this repo:

```bash
./install-global.sh --project /path/to/your-project
```

After that, agents can be used in GitHub Copilot Chat (with any supported Copilot model) and Copilot CLI.

### Option C: Manual (Any Editor)

1. Copy the `.agent.md` files you want into `.github/agents/` in your repo:
```bash
mkdir -p .github/agents
cp agents/*.agent.md .github/agents/
```
2. Commit and push to your default branch
3. Done — agents are now available in Copilot Chat and CLI

### Option D: GitHub CLI

```bash
# Clone this repo and copy all agents to your project
git clone https://github.com/YOUR_USERNAME/awesome-dev-agents.git
mkdir -p your-project/.github/agents
cp awesome-dev-agents/agents/*.agent.md your-project/.github/agents/
```

### Option E: GitHub Copilot CLI

```bash
# Use a specific agent from CLI
copilot --agent=ai-engineer --prompt "build a RAG pipeline for my PDF docs"
copilot --agent=code-reviewer --prompt "review all files in /src"
```

---

## Repo Structure

```
copilot-agents/
├── agents/                         # ← The actual agent files (use these!)
│   ├── ai-engineer.agent.md
│   ├── fullstack-dev.agent.md
│   ├── ml-researcher.agent.md
│   ├── code-reviewer.agent.md
│   ├── system-designer.agent.md
│   ├── doc-writer.agent.md
│   ├── security-auditor.agent.md
│   ├── open-source-contributor.agent.md
│   └── ui-designer.agent.md
├── docs/                           # Interactive web showcase
│   └── index.html
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

---

## Agents

### 🤖 AI Engineer

> **File:** [`agents/ai-engineer.agent.md`](agents/ai-engineer.agent.md)

Expert in building production-grade LLM applications, RAG pipelines, agentic systems, and computer vision workflows.

**Stack:** Python · LangChain · FastAPI · PyTorch · TensorFlow · YOLO · EasyOCR · Hugging Face · Docker

**When to use:**
- Building or debugging a LangChain / LangGraph pipeline
- Creating FastAPI inference endpoints
- Setting up RAG with vector stores
- Working with OCR, YOLO, or multimodal models

**Try saying:**
```
build a RAG pipeline for my PDF knowledge base
add an async LLM endpoint to this FastAPI app
improve this YOLO model's inference speed
create a LangChain agent that can call my custom tools
```

---

### ⚡ Full Stack Dev

> **File:** [`agents/fullstack-dev.agent.md`](agents/fullstack-dev.agent.md)

Builds complete, production-ready features across the full stack — from pixel-perfect React components to robust REST APIs.

**Stack:** React · Tailwind CSS · Node.js · Express · FastAPI · Flask · PostgreSQL · Docker · JWT

**When to use:**
- Building new UI components or pages
- Creating or debugging API routes
- Setting up authentication
- Fixing responsive layout issues

**Try saying:**
```
build a dashboard component with charts for this data
create a REST API route for user authentication
fix the mobile layout on the settings page
add JWT auth middleware to this Express app
```

---

### 🧠 ML Researcher

> **File:** [`agents/ml-researcher.agent.md`](agents/ml-researcher.agent.md)

Runs rigorous ML experiments with proper methodology — always EDA first, cross-validation, and clear evaluation metrics.

**Stack:** scikit-learn · XGBoost · LightGBM · PyTorch · Pandas · NumPy · Jupyter

**When to use:**
- Kaggle-style data science work
- Improving model accuracy with feature engineering
- Running proper experiments with evaluation
- Debugging training pipelines

**Try saying:**
```
improve the accuracy of this classifier
analyze feature importance for this dataset
add cross-validation to this training script
fix the class imbalance in this pipeline
```

---

### 🔍 Code Reviewer

> **File:** [`agents/code-reviewer.agent.md`](agents/code-reviewer.agent.md)

Reviews code for correctness, performance, security, and readability. Outputs structured `[CRITICAL / WARN / SUGGESTION]` reports.

**Languages:** Python · JavaScript/TypeScript · C++ · Java · Go

**When to use:**
- Before submitting a PR
- Before a demo or client delivery
- Reviewing LeetCode solutions for complexity
- Any time you want a second opinion

**Try saying:**
```
review this file for bugs and performance issues
check the time and space complexity of this solution
find security issues in /src/api/
review this PR diff for clean code violations
```

---

### 🏗️ System Designer

> **File:** [`agents/system-designer.agent.md`](agents/system-designer.agent.md)

Produces comprehensive architecture documents: Mermaid diagrams, API endpoint tables, DB schemas, and scalability analysis.

**Domains:** REST API Design · Microservices · Event-Driven Systems · Database Design · Docker Orchestration

**When to use:**
- Planning a new system before writing code
- Designing database schemas
- Creating architecture documentation
- Preparing for system design interviews

**Try saying:**
```
design the system architecture for a ride-sharing app
create an API schema for a multi-tenant SaaS platform
draw a Mermaid diagram of this microservices setup
design the database schema for this e-commerce backend
```

---

### 📝 Doc Writer

> **File:** [`agents/doc-writer.agent.md`](agents/doc-writer.agent.md)

Produces professional, human-sounding technical documentation — READMEs, proposals, research papers, and docstrings.

**Output types:** README · GSoC Proposals · IEEE Papers · Google-style Docstrings · Changelogs · ADRs

**When to use:**
- Writing or improving a project README
- Drafting open-source or grant proposals
- Adding docstrings to a codebase
- Preparing academic/technical writing

**Try saying:**
```
write a README with badge, install steps, and usage examples
improve this GSoC proposal — make it sound like a real student
add Google-style docstrings to all functions in this file
write a changelog entry for this release
```

---

### 🛡️ Security Auditor

> **File:** [`agents/security-auditor.agent.md`](agents/security-auditor.agent.md)

Audits code against OWASP Top 10, checks for exposed secrets, injection risks, and broken auth. Produces severity-graded reports.

**Covers:** Secrets · SQL/Command Injection · XSS/CSRF · Broken Auth · Dependency CVEs · LLM Prompt Injection

**When to use:**
- Before any public deployment
- Before open-sourcing a project
- After adding new auth or API routes
- Checking LLM apps for prompt injection

**Try saying:**
```
secaudit the entire /src directory
check for hardcoded API keys before I open-source this
audit the auth flow in this FastAPI app
check my LangChain agent for prompt injection vulnerabilities
```

---

### 🌍 Open Source Contributor

> **File:** [`agents/open-source-contributor.agent.md`](agents/open-source-contributor.agent.md)

Guides you through the entire open-source contribution journey — from finding the right project, understanding the codebase, making your first PR, to writing program proposals (GSoC, Outreachy, etc). Beginner-friendly but deep enough for experienced contributors.

**When to use:**
- You want to start contributing to open source but don't know where to begin
- Exploring or understanding a new unfamiliar codebase
- Writing your first (or tenth) PR for an open-source project
- Drafting a GSoC/Outreachy/similar program proposal
- Writing a maintainer discussion post or issue comment

**Try saying:**
```
help me find a good open source project to contribute to given my Python skills
help me understand how this codebase is structured before I start coding
review my PR before I open it — does it match the project's conventions?
write a GSoC proposal for this project idea
help me write a maintainer discussion post for this issue
```

---

### 🎨 UI Designer

> **File:** [`agents/ui-designer.agent.md`](agents/ui-designer.agent.md)

Extracts the design language from a reference screenshot or URL — fonts, colors, spacing rhythm, card patterns, motion — and applies it precisely to your actual content and code. Produces frontends that look deliberately crafted, not AI-generated.

**When to use:**
- You have a screenshot of a design you love and want to apply its style to your project
- Your UI looks generic and you want to upgrade it to match a specific aesthetic
- You want a proper CSS token system extracted from a reference design
- Redesigning a page while keeping content identical

**Try saying:**
```
[attach screenshot] — make my dashboard look like this, same fonts and color system
extract the design language from linear.app and apply it to my settings page
my site looks too AI-generated — redesign it to match this reference style
convert this Figma screenshot's design tokens into CSS custom properties
```

---

## Workflow Combos

These agent combinations work especially well together:

| Goal | Agent Chain |
|------|------------|
| New feature | System Designer → Full Stack Dev → Code Reviewer |
| AI/ML project | AI Engineer → ML Researcher → Security Auditor → Doc Writer |
| Open source contribution | Open Source Contributor → Code Reviewer → Doc Writer |
| Secure deployment | Full Stack Dev → Security Auditor → Doc Writer |
| Research project | ML Researcher → System Designer → Doc Writer |
| Frontend redesign | UI Designer → Full Stack Dev → Code Reviewer |
| First OSS contribution | Open Source Contributor → Code Reviewer → Doc Writer |

---

## Agent File Format

Every agent follows this structure:

```markdown
---
name: Agent Name
description: What I do and the trigger keywords that activate me.
tools: ['read', 'edit', 'search', 'create', 'run_command']
model: claude-sonnet-4-5   # optional
---

# System prompt (plain markdown, up to 30,000 chars)
# Define: persona, rules, output format, examples
```

**Choosing tools:**
| Tool | When to include |
|------|----------------|
| `read` | Always |
| `edit` | Agent modifies files |
| `create` | Agent creates new files |
| `search` | Agent needs to find files/code |
| `run_command` | Agent runs shell commands (tests, builds) |
| `fetch` | Agent needs to read URLs/docs |

---

## Contributing

Want to add your own agent? See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

Quick steps:
1. Fork this repo
2. Add your `.agent.md` file to `/agents/`
3. Add an entry to this README
4. Open a PR with a short description of the agent's use case

---

## License

MIT — use freely, modify openly, contribute back.

---

<div align="center">
<b>Star ⭐ this repo if it saved you time.</b><br>
Built for developers who want AI to work at their level, not the other way around.
</div>
