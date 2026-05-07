## Related

## Type

- note
  Good. This is the right move.

You should split it into **two prompts**:

1. **Codex prep prompt**
   For local automation and repo preparation in the elevated/full-access environment

2. **Deep research prompt**
   For the “generate the bible” stage, using the artifacts Codex created

That keeps the prep deterministic and the research high-signal. Humans do love turning one job into three, but in this case it’s actually correct.

---

# 1. Codex prep prompt

Paste this into Codex.

```text
You are operating in a full-access, elevated local development environment on Windows 11 Pro.

Your job is to prepare a clean research workspace for a solo developer who is building a personal infrastructure + security + observability + AI-assisted dev system.

## Objectives

You must fully automate these steps:

1. Generate `current-state.md`
2. Create a new local git repo named `infra-lab`
3. Clone `wg-easy` as a reference repo only
4. Create an organized folder structure inside `infra-lab`
5. Add starter docs and placeholders
6. Initialize git, commit, and push to GitHub if credentials and remote creation are available
7. If GitHub remote creation is not available locally, still fully prepare the repo and clearly document the exact next manual command needed

## Environment assumptions

Assume:
- Windows 11 Pro
- PowerShell 7 is available
- Git is installed
- VS Code is installed
- WSL may be installed
- Docker may be installed
- Node may be installed
- GitHub auth may or may not already be configured
- GitHub Copilot Pro and ChatGPT Plus exist as accounts but are not directly relevant to local prep unless needed for docs
- This machine may already have `gh` (GitHub CLI), but do not assume it without checking

## Required behavior

- Prefer PowerShell-native commands
- Use safe, idempotent operations where possible
- Do not download random ZIP files when `git clone` is sufficient
- Do not create unnecessary temp folders
- Do not overcomplicate the setup
- Do not ask for confirmation unless absolutely required by a hard blocker
- If something already exists, inspect it and reuse it when safe
- If a step cannot be completed, continue with the rest and leave a clear note in `docs/setup-notes.md`

## Workspace target

Create this structure:

infra-lab/
  README.md
  current-state.md
  docs/
    setup-notes.md
    architecture/
      README.md
    runbooks/
      README.md
    security/
      README.md
    observability/
      README.md
    agents/
      README.md
    adr/
      README.md
  scripts/
    Generate-CurrentState.ps1
  references/
    wg-easy/   <-- cloned reference repo
  .gitignore

## Step-by-step tasks

### Task 1: Create or prepare workspace root
- Create a folder named `infra-lab` in the current working directory unless it already exists
- If it already exists, inspect contents and continue safely

### Task 2: Generate `current-state.md`
Create both:
- `infra-lab/current-state.md`
- `infra-lab/scripts/Generate-CurrentState.ps1`

The script should:
- detect PowerShell version
- detect Node version if present
- detect Docker version if present
- detect Git version if present
- detect WSL distros if present
- include a practical markdown summary of:
  - machine
  - installed tools
  - dev environment
  - known accounts/services as static entries:
    - GitHub (Copilot Pro)
    - ChatGPT Plus
    - Vercel
    - Vultr (planned)
  - goals
  - constraints
  - current gaps
- write valid UTF-8 markdown

Then run the script so that `current-state.md` is actually generated and populated

### Task 3: Clone reference repo
- Clone `https://github.com/wg-easy/wg-easy.git` into `infra-lab/references/wg-easy`
- If the folder already exists and is a git repo, pull latest instead of recloning
- This repo is reference-only and must not become the main repo root

### Task 4: Create starter files
Create practical starter files with concise content:

#### README.md
Explain:
- purpose of infra-lab
- what belongs here
- that `references/wg-easy` is reference-only

#### docs/setup-notes.md
Include:
- date/time created
- what was automated
- any blockers encountered
- next steps for deep research submission

#### docs/*/README.md
Each should briefly explain the folder purpose:
- architecture
- runbooks
- security
- observability
- agents
- adr

#### .gitignore
Include sensible entries for:
- node_modules
- .env*
- .DS_Store
- Thumbs.db
- .vscode/*
  but do NOT ignore all of `.vscode` blindly if there may later be intentional shared settings
- logs
- temp files

### Task 5: Initialize git
- Initialize git repo in `infra-lab` if not already initialized
- Stage all created files
- Commit with a message like:
  `chore: initialize infra-lab research workspace`

### Task 6: Attempt GitHub remote setup
Check whether GitHub CLI (`gh`) is installed and authenticated.

If yes:
- create a new private GitHub repo named `infra-lab`
- add the remote
- push the initial commit
- record the resulting repo URL in `docs/setup-notes.md`

If `gh` is not available or not authenticated:
- do NOT fail the whole task
- instead record exactly what remains to be done in `docs/setup-notes.md`
- include the exact commands the user should run later

### Task 7: Final output
When finished:
- print a concise summary of what was created
- print the local path to `infra-lab`
- print whether GitHub remote creation/push succeeded
- print the path to `current-state.md`
- print the path to `references/wg-easy`

## Quality bar

This is not a toy scaffold.
Make the repo clean, predictable, and usable as the basis for:
- deep research attachments
- future infra docs
- runbooks
- agent instruction files
- implementation plans

Favor correctness, clarity, and maintainability over cleverness.
```

---

# 2. Revised deep research prompt

Use this **after** Codex finishes and after you attach:

- `infra-lab/current-state.md`

- optionally `infra-lab/docs/setup-notes.md`

- and, if the platform supports it, link the GitHub repo Codex created/pushed

```markdown
You are a principal engineer, infrastructure architect, and security-minded developer mentor.

I need a comprehensive, execution-focused operating manual for a solo developer building a personal infrastructure + security + observability + AI-assisted dev system.

## Grounding artifacts

Use the attached artifacts as primary grounding context:

- `current-state.md`
- `setup-notes.md` if attached
- linked GitHub repo for `infra-lab` if available

Treat these artifacts as the source of truth for current environment and project intent.

---

## CONTEXT

I am:

- Windows 11 Pro user
- Using PowerShell 7 + VS Code
- Using WSL (Ubuntu)
- Using Docker
- Using GitHub (Copilot Pro)
- Using ChatGPT Plus + desktop app
- Using Vercel for frontend/serverless
- Planning to use a low-cost VPS (likely Vultr)
- Building production-grade B2B SaaS with a modern TypeScript / Next.js / PostgreSQL workflow

I am not a beginner, but I am actively leveling up in:

- infrastructure
- networking
- security
- observability
- AI-assisted development systems

---

## OBJECTIVE

Design a complete, practical system that I can:

1. implement incrementally
2. use as a dev + infra lab
3. extend into production systems
4. use to derive:
    - repo structures
    - scripts
    - configs
    - runbooks
    - specs
    - agent instruction files
    - ADRs
    - implementation plans

The output must be directly usable.

---

## SYSTEM SCOPE

You must design and integrate these layers.

### 1. Local Development Layer

Cover:

- Windows 11 Pro
- PowerShell 7
- VS Code
- VS Code Profiles
- WSL
- Docker / Dev Containers
- local secret handling
- local environment isolation
- local webhook testing
- ngrok vs VPS-based tunnels
- when WSL is enough vs when a VPS is clearly the right tool

### 2. VPS / Remote Lab Layer

Assume Vultr is the likely first VPS choice, but compare budget alternatives only where useful.

Cover:

- why a VPS matters for this use case
- SSH key-only auth
- UFW
- fail2ban
- WireGuard
- Docker on the VPS
- Netdata or best lightweight monitoring option
- reverse tunnels
- local/remote port forwarding
- dynamic SOCKS proxy use cases
- minimal reverse proxy usage
- health checks and uptime strategy
- safe experimentation patterns

### 3. Security Baseline

Define a minimum viable but serious security posture for a solo developer:

- attack surface reduction
- least privilege
- secret handling
- SSH hygiene
- firewall posture
- Docker/container safety
- reverse proxy safety
- webhook endpoint validation and idempotency
- safe experimentation patterns
- what not to expose
- common self-inflicted failures

### 4. Observability Layer

Design observability across:

- local dev
- VPS
- Docker services
- Vercel-hosted apps

Cover:

- logs
- metrics
- health checks
- uptime checks
- structured JSON logging conventions
- minimal dashboards
- incident triage for one person
- sample `/healthz` and `/readyz` patterns
- sample log schemas

### 5. GitHub as Source of Truth

Design:

- repo structure for infra + docs + scripts + agents
- GitHub Projects workflow
- issues, labels, milestones, templates
- CI/CD patterns appropriate for a solo dev and this stack
- when infra belongs in same repo vs separate repo
- how to store runbooks, ADRs, security docs, observability docs
- which GitHub repos are worth directly using vs only referencing

### 6. AI Tooling Operating Model

Define the best division of labor between:

- GitHub Copilot Pro in VS Code
- Copilot chat / agent workflows
- Codex
- ChatGPT desktop app
- ChatGPT Projects
- deep research workflows

Cover:

- which tool should do what
- prompt/context strategies
- when work should remain local
- when to delegate to agents
- how to avoid overlap and confusion
- how to structure instruction files and agent customization

### 7. MCP Strategy

Explain MCP clearly for this use case and recommend a sane strategy.

Cover:

- what MCP is
- best MCP categories/servers for:
    - GitHub
    - docs lookup
    - Vercel
    - filesystem
    - databases
    - terminal/dev workflows
- MCP in VS Code / Copilot / OpenAI ecosystem
- when to add MCP
- when not to add MCP
- security considerations for exposing tools to agents
- sample MCP architecture/config patterns

### 8. Vercel Integration

Define what belongs on:

- Vercel
- the VPS
- local machine

Cover:

- frontend/runtime boundaries
- logs/observability expectations
- background job separation
- secrets handling
- preview/prod workflow
- keeping Vercel simple while the VPS handles long-running or edge/lab use cases

### 9. Learning Roadmap

Create a roadmap optimized for this exact user and stack.

Include:

- week 1
- week 2
- week 3
- month 2
- quarter 2

For each phase include:

- objectives
- milestones
- deliverables
- mini-projects / lab exercises
- anti-patterns
- what “done” looks like

Balance:

- dev productivity
- infra literacy
- security hygiene
- observability
- AI-assisted development
- maintainability

### 10. Knowledge and Project Management System

Design a practical operating system for tracking this work using:

- GitHub Projects
- repo `/docs`
- ChatGPT Projects
- templates
- ADRs
- runbooks
- weekly reviews
- implementation notes
- change logs / operating journal

Recommend:

- folder structures
- naming conventions
- issue types
- ADR format
- runbook format
- security checklist format
- weekly review format
- change log format

---

## Constraints

Optimize for:

- solo developer
- budget-conscious
- high technical literacy
- Windows-first workstation
- modern web dev stack
- safe experimentation
- low unnecessary complexity
- strong defaults
- future-proofing without overengineering

Avoid:

- enterprise-only solutions
- compliance theater
- giant observability stacks by default
- privacy theater
- Kubernetes unless there is a very strong justification
- vague advice
- generic listicles

---

## Research requirements

Use current official documentation and primary sources wherever possible.

Prioritize sources in this order:

1. official product documentation
2. official GitHub repos
3. official help center / vendor docs
4. reputable technical writeups only when official docs are missing or insufficient

Clearly separate:

- facts
- recommendations
- assumptions
- tradeoffs
- risks
- open questions

Call out recent changes where relevant.

---

## Required deliverable format

Return a structured technical manual with:

1. Executive Summary
2. Recommended Target Architecture
3. Layer-by-Layer System Design
4. Recommended Tool Stack
5. Recommended Repo and Docs Structure
6. Security Baseline
7. Observability Baseline
8. AI Tooling Operating Model
9. MCP Strategy
10. Vercel vs VPS Responsibilities
11. 30/60/90-Day Roadmap
12. Knowledge and Project Tracking System
13. Reference Implementation Plan
14. Risk Register
15. Appendix

---

## Appendix requirements

Include the following.

### A. Official source index

A categorized list of official docs and canonical references with links.

### B. Recommended GitHub repos

For each repo include:

- why it matters
- what it is good for
- whether to use it directly, fork it, study it, or only reference it

### C. Code and config examples

Provide concise but real examples for:

- SSH config
- WireGuard config
- UFW rules
- fail2ban baseline
- Docker Compose skeleton
- Netdata install/usage
- `/healthz` and `/readyz` endpoints
- structured JSON logging
- GitHub issue template
- ADR template
- runbook template
- VS Code settings/profile examples
- PowerShell helper scripts
- WSL commands
- sample MCP config patterns where appropriate

### D. Implementation checklists

Provide phased checklists for:

- day 1
- week 1
- month 1
- before exposing a service publicly
- before trusting an AI agent with repo write access
- before moving a local experiment to the VPS

### E. Agent customization seeds

Generate starter content for:

- a global engineering/system instruction file
- a repo-level instruction file
- an infra/security agent instruction file
- an observability/runbooks instruction file
- a research prompt template
- a spec generation template

---

## Output quality bar

The report must feel like it was written by:

- a senior infrastructure-minded product engineer
- who understands Windows + WSL + modern TS/Next.js workflows
- who understands solo developer constraints
- who respects budget limits
- who can distinguish between lab infrastructure, production infrastructure, and AI-assisted workflow design

Make it dense, structured, practical, and directly usable.

Do not give me a shallow overview.
Do not give me a generic “top tools” article.
Give me an operating manual I can use to derive specs, repos, scripts, agent files, and implementation plans.
```

---

# Recommended execution order

Use this order exactly:

## Step 1

Run the **Codex prep prompt**

## Step 2

Confirm Codex created:

- `infra-lab/current-state.md`

- `infra-lab/docs/setup-notes.md`

- `infra-lab/references/wg-easy`

- git repo initialized

- optional GitHub push completed

## Step 3

Open your **Deep Research** workspace

## Step 4

Submit the **deep research prompt**

## Step 5

Attach:

- `current-state.md`

- `setup-notes.md`

- repo link, if Codex pushed it

---

# Small but important note

If Codex successfully creates and pushes the repo, that repo becomes a much better anchor than random attachments alone. Not because the machine is magical, but because linked structure beats loose scraps every time.

That’s your clean two-stage workflow:

- **Codex prepares reality**

- **Deep Research interprets reality**

Much better than asking one giant model blob to hallucinate your filesystem into existence.
