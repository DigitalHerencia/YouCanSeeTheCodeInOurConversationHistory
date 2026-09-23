📦TheCodependentCodingWebAppArchitecture  
 ┣ 📂.agents  
 ┃ ┣ 📂contracts  
 ┃ ┃ ┣ 📜architecture.yaml  
 ┃ ┃ ┣ 📜product.yaml  
 ┃ ┃ ┗ 📜transition.yaml  
 ┃ ┣ 📂execution  
 ┃ ┃ ┣ 📜decisions.json  
 ┃ ┃ ┣ 📜handoff.json  
 ┃ ┃ ┗ 📜progress.json  
 ┃ ┣ 📂The Loaded Vibes™ Codex Plugin  
 ┃ ┃ ┣ 📂.docs  
 ┃ ┃ ┃ ┣ 📜README.agents.md  
 ┃ ┃ ┃ ┣ 📜README.background-agents.md  
 ┃ ┃ ┃ ┣ 📜README.blog.md  
 ┃ ┃ ┃ ┣ 📜README.cloud-agents.md  
 ┃ ┃ ┃ ┣ 📜README.collections.md  
 ┃ ┃ ┃ ┣ 📜README.custom-agents.md  
 ┃ ┃ ┃ ┣ 📜README.instructions.md  
 ┃ ┃ ┃ ┣ 📜README.MCP.md  
 ┃ ┃ ┃ ┣ 📜README.meetings.md  
 ┃ ┃ ┃ ┣ 📜README.portfolio.md  
 ┃ ┃ ┃ ┣ 📜README.projects.md  
 ┃ ┃ ┃ ┣ 📜README.prompts.md  
 ┃ ┃ ┃ ┣ 📜README.skills.md  
 ┃ ┃ ┃ ┣ 📜README.sops.md  
 ┃ ┃ ┃ ┣ 📜README.tasks.md  
 ┃ ┃ ┃ ┣ 📜README.teams.md  
 ┃ ┃ ┃ ┗ 📜README.tech-stack.md  
 ┃ ┃ ┣ 📂.eng  
 ┃ ┃ ┃ ┣ 📂lib  
 ┃ ┃ ┃ ┃ ┣ 📜external-plugin-source-ref-sha.mjs  
 ┃ ┃ ┃ ┃ ┣ 📜license.mjs  
 ┃ ┃ ┃ ┃ ┣ 📜markdown.mjs  
 ┃ ┃ ┃ ┃ ┗ 📜markdown.test.mjs  
 ┃ ┃ ┃ ┣ 📂utils  
 ┃ ┃ ┃ ┃ ┣ 📜git-dates.mjs  
 ┃ ┃ ┃ ┃ ┗ 📜graceful-shutdown.mjs  
 ┃ ┃ ┃ ┣ 📜add-missing-contributors.mjs  
 ┃ ┃ ┃ ┣ 📜agent-plugin-schema.mjs  
 ┃ ┃ ┃ ┣ 📜clean-materialized-plugins.mjs  
 ┃ ┃ ┃ ┣ 📜constants.mjs  
 ┃ ┃ ┃ ┣ 📜contributor-report.mjs  
 ┃ ┃ ┃ ┣ 📜create-plugin.mjs  
 ┃ ┃ ┃ ┣ 📜create-skill.mjs  
 ┃ ┃ ┃ ┣ 📜delete-gone-branches.sh  
 ┃ ┃ ┃ ┣ 📜extension-plugin-ownership.mjs  
 ┃ ┃ ┃ ┣ 📜extension-plugin-ownership.test.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-approval.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-intake-state.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-intake.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-intake.test.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-pr-quality-gates.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-quality-gates.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-quality-gates.test.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-rereview.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-validation.mjs  
 ┃ ┃ ┃ ┣ 📜external-plugin-validation.test.mjs  
 ┃ ┃ ┃ ┣ 📜fix-line-endings.sh  
 ┃ ┃ ┃ ┣ 📜generate-marketplace.mjs  
 ┃ ┃ ┃ ┣ 📜generate-open-pr-report.mjs  
 ┃ ┃ ┃ ┣ 📜generate-website-data.mjs  
 ┃ ┃ ┃ ┣ 📜materialize-plugins.mjs  
 ┃ ┃ ┃ ┣ 📜materialize-plugins.test.mjs  
 ┃ ┃ ┃ ┣ 📜pr-risk-scan.mjs  
 ┃ ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┃ ┣ 📜update-readme.mjs  
 ┃ ┃ ┃ ┣ 📜validate-plugins.mjs  
 ┃ ┃ ┃ ┣ 📜validate-plugins.test.mjs  
 ┃ ┃ ┃ ┣ 📜validate-skills.mjs  
 ┃ ┃ ┃ ┗ 📜yaml-parser.mjs  
 ┃ ┃ ┣ 📂.scripts  
 ┃ ┃ ┃ ┣ 📜constants.ts  
 ┃ ┃ ┃ ┣ 📜create-agent.ts  
 ┃ ┃ ┃ ┣ 📜create-collection.ts  
 ┃ ┃ ┃ ┣ 📜create-instructions.ts  
 ┃ ┃ ┃ ┣ 📜create-prompt.ts  
 ┃ ┃ ┃ ┣ 📜create-skill.ts  
 ┃ ┃ ┃ ┣ 📜export-notion.ts  
 ┃ ┃ ┃ ┣ 📜validate-agents.ts  
 ┃ ┃ ┃ ┣ 📜validate-collections.ts  
 ┃ ┃ ┃ ┣ 📜validate-frontmatter-schemas.ts  
 ┃ ┃ ┃ ┣ 📜validate-instructions.ts  
 ┃ ┃ ┃ ┣ 📜validate-prompts.ts  
 ┃ ┃ ┃ ┣ 📜validate-skills.ts  
 ┃ ┃ ┃ ┣ 📜validate.ts  
 ┃ ┃ ┃ ┗ 📜yaml-parser.ts  
 ┃ ┃ ┣ 📂LoadedPlugin  
 ┃ ┃ ┃ ┣ 📂agents  
 ┃ ┃ ┃ ┃ ┗ 📜loaded-vibes-stack.agent.md  
 ┃ ┃ ┃ ┣ 📂hooks  
 ┃ ┃ ┃ ┃ ┣ 📂attester-import-check  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜check-imports.py  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂dependency-license-checker  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜check-licenses.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂fix-broken-links  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜link-fix.ps1  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜link-fix.sh  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂governance-audit  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜audit-prompt.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜audit-session-end.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜audit-session-start.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂secrets-scanner  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜scan-secrets.sh  
 ┃ ┃ ┃ ┃ ┣ 📂session-auto-commit  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜auto-commit.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂session-logger  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜log-prompt.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜log-session-end.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜log-session-start.sh  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┗ 📂tool-guardian  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜guard-tool.sh  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜hooks.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┣ 📂instructions  
 ┃ ┃ ┃ ┃ ┣ 📜a11y.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜agent-skills.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜agents.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜ai-prompt-engineering-safety-best-practices.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜auth.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜ci-cd.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜code-review.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜configuration.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜context-engineering.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜context7.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜data.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜debug.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜deploy.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜documentation.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜draw-io.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜features.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜genaiscript.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜hooks.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜initialization.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜instructions.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜localization.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜markdown.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜nextjs-tailwind.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜nextjs.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜observability.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜performance.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜powershell.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜prompt.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜qa-engineering-best-practices.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜scaffolding.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜security.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜testing.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜updates.instructions.md  
 ┃ ┃ ┃ ┃ ┣ 📜validation.instructions.md  
 ┃ ┃ ┃ ┃ ┗ 📜verification.instructions.md  
 ┃ ┃ ┃ ┣ 📂plugins  
 ┃ ┃ ┃ ┃ ┣ 📂automate-this  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂context-engineering  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂diagram-viewer  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂frontend-web-dev  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂project-documenter  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂project-planning  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📂skill-image-gen  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┃ ┗ 📂software-engineering-team  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plugin.json  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┣ 📂prompts  
 ┃ ┃ ┃ ┃ ┣ 📜auth.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜ci-cd.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜code-review.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜configuration.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜data.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜debug.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜deploy.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜documentation.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜features.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜initialization.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜observability.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜performance.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜scaffolding.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜security.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜template.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜testing.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜updates.prompt.md  
 ┃ ┃ ┃ ┃ ┣ 📜validation.prompt.md  
 ┃ ┃ ┃ ┃ ┗ 📜verification.prompt.md  
 ┃ ┃ ┃ ┣ 📂scripts  
 ┃ ┃ ┃ ┃ ┣ 📜Analyze-Codebase.ps1  
 ┃ ┃ ┃ ┃ ┣ 📜Build-ContextChunks.ps1  
 ┃ ┃ ┃ ┃ ┣ 📜Get-SymbolMap.ps1  
 ┃ ┃ ┃ ┃ ┣ 📜Run-AllAnalysis.ps1  
 ┃ ┃ ┃ ┃ ┗ 📜Test-DevEnvironment.ps1  
 ┃ ┃ ┃ ┣ 📂skills  
 ┃ ┃ ┃ ┃ ┣ 📂acquire-codebase-knowledge  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂assets  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂templates  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜ARCHITECTURE.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CONCERNS.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜CONVENTIONS.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜INTEGRATIONS.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜STACK.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜STRUCTURE.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜TESTING.md  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂references  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜inquiry-checkpoints.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜stack-detection.md  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂scripts  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜scan.py  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂audit-integrity  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂references  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜anti-rationalization-guard.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜clarification-protocol.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜non-negotiable-behaviors.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜retry-protocol.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜self-critique-loop.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜self-learning-system.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜self-reflection-quality-gate.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂boost-prompt  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂context-map  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂create-github-action-workflow-specification  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂create-github-issue-feature-from-specification  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂create-github-issues-feature-from-implementation-plan  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂create-github-issues-for-unmet-specification-requirements  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂draw-io-diagram-generator  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂assets  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂templates  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜architecture.drawio  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜er-diagram.drawio  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜flowchart.drawio  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜sequence.drawio  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜uml-class.drawio  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂references  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜drawio-xml-schema.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜shape-libraries.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜style-reference.md  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂scripts  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜.gitignore  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜add-shape.py  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜validate-drawio.py  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂image-manipulation-image-magick  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂playwright-automation-fill-in-form  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂playwright-explore-website  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂playwright-generate-test  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂postgresql-code-review  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂postgresql-optimization  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂react19-concurrent-patterns  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂references  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜react19-actions.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜react19-suspense.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜react19-use.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂react19-source-patterns  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂references  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜api-migrations.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂react19-test-patterns  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┣ 📂secret-scanning  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂references  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜alerts-and-remediation.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜custom-patterns.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜push-protection.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┃ ┗ 📂what-context-needed  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜SKILL.md  
 ┃ ┃ ┃ ┣ 📂templates  
 ┃ ┃ ┃ ┃ ┣ 📜bootstrapper.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜custom_agent.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_cicd.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_code_review.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_configuration.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_data.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_debug.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_deploy.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_documentation.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_features.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_initialization.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_observability.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_performance.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_scaffolding.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_security.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_testing.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_updates.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_validation.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜devcycle_verification.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜global_instructions.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜local-project-instructions.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜phase_runner.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜profile.template.md  
 ┃ ┃ ┃ ┃ ┣ 📜prompt.template.md  
 ┃ ┃ ┃ ┃ ┗ 📜toolset.template.md  
 ┃ ┃ ┃ ┗ 📂toolsets  
 ┃ ┃ ┃ ┃ ┣ 📜auth.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜ci-cd.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜code-review.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜configuration.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜data.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜debug.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜deploy.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜documentation.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜features.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜initialization.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜observability.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜performance.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜scaffolding.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜security.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜template.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜testing.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜updates.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┣ 📜validation.toolset.jsonc  
 ┃ ┃ ┃ ┃ ┗ 📜verification.toolset.jsonc  
 ┃ ┃ ┗ 📜global.instructions.md  
 ┃ ┗ 📜AGENTS.md  
 ┣ 📂.github  
 ┃ ┗ 📂workflows  
 ┃ ┃ ┗ 📜ci.yml  
 ┣ 📂context  
 ┃ ┣ 📂docs  
 ┃ ┃ ┣ 📜architecture.md  
 ┃ ┃ ┣ 📜configuration.md  
 ┃ ┃ ┣ 📜documentation.md  
 ┃ ┃ ┣ 📜generator-cli.md  
 ┃ ┃ ┣ 📜product.md  
 ┃ ┃ ┣ 📜release.md  
 ┃ ┃ ┣ 📜repository-transition.md  
 ┃ ┃ ┣ 📜template.md  
 ┃ ┃ ┗ 📜web.md  
 ┃ ┣ 📂mockups  
 ┃ ┃ ┣ 📜builder.png  
 ┃ ┃ ┣ 📜ChatGPT Image Aug 15, 2026, 10_07_56 AM.png  
 ┃ ┃ ┣ 📜ChatGPT Image Aug 19, 2026, 08_24_06 PM.png  
 ┃ ┃ ┣ 📜ChatGPT Image Aug 19, 2026, 08_24_12 PM.png  
 ┃ ┃ ┣ 📜ChatGPT Image Aug 19, 2026, 08_24_39 PM.png  
 ┃ ┃ ┣ 📜config.png  
 ┃ ┃ ┣ 📜landing.png  
 ┃ ┃ ┣ 📜libraries.png  
 ┃ ┃ ┣ 📜Screenshot_20-8-2026_14846_thehipsterstack.vercel.app.jpeg  
 ┃ ┃ ┣ 📜Screenshot_20-8-2026_14917_thehipsterstack.vercel.app.jpeg  
 ┃ ┃ ┣ 📜Screenshot_20-8-2026_14945_thehipsterstack.vercel.app.jpeg  
 ┃ ┃ ┗ 📜Screenshot_20-8-2026_15115_thehipsterstack.vercel.app.jpeg  
 ┃ ┣ 📂specs  
 ┃ ┃ ┣ 📜HS-301-governance-product-identity.md  
 ┃ ┃ ┣ 📜HS-302-rename-generator-identifiers.md  
 ┃ ┃ ┣ 📜HS-303-web-design-foundation.md  
 ┃ ┃ ┣ 📜HS-304-web-shell-landing.md  
 ┃ ┃ ┣ 📜HS-305-interactive-docs.md  
 ┃ ┃ ┣ 📜HS-306-web-builder-composition.md  
 ┃ ┃ ┣ 📜HS-307-web-cleanup-conformance.md  
 ┃ ┃ ┣ 📜HS-308-application-definition-foundation.md  
 ┃ ┃ ┣ 📜LV-201-consolidate-master-template.md  
 ┃ ┃ ┣ 📜LV-202-simplify-configuration-core.md  
 ┃ ┃ ┣ 📜LV-203-one-template-generator.md  
 ┃ ┃ ┣ 📜LV-204-web-landing-configurator.md  
 ┃ ┃ ┣ 📜LV-205-end-user-docs.md  
 ┃ ┃ ┣ 📜LV-206-cli-package-polish.md  
 ┃ ┃ ┣ 📜LV-207-cleanup-release.md  
 ┃ ┃ ┣ 📜LV-208-web-shell-landing.md  
 ┃ ┃ ┣ 📜LV-209-web-libraries.md  
 ┃ ┃ ┣ 📜LV-210-web-builder-refresh.md  
 ┃ ┃ ┗ 📜README.md  
 ┃ ┣ 📜AGENTS.md  
 ┃ ┗ 📜README.md  
 ┣ 📂docs  
 ┃ ┣ 📂cli  
 ┃ ┃ ┣ 📜add.md  
 ┃ ┃ ┣ 📜create.md  
 ┃ ┃ ┣ 📜doctor.md  
 ┃ ┃ ┣ 📜explain.md  
 ┃ ┃ ┗ 📜index.md  
 ┃ ┣ 📂concepts  
 ┃ ┃ ┣ 📜configuration.md  
 ┃ ┃ ┣ 📜generated-project.md  
 ┃ ┃ ┗ 📜one-template.md  
 ┃ ┣ 📂configuration  
 ┃ ┃ ┣ 📜design.md  
 ┃ ┃ ┣ 📜identity.md  
 ┃ ┃ ┣ 📜integrations.md  
 ┃ ┃ ┣ 📜optional-surfaces.md  
 ┃ ┃ ┗ 📜project.md  
 ┃ ┣ 📜getting-started.md  
 ┃ ┣ 📜index.md  
 ┃ ┗ 📜troubleshooting.md  
 ┣ 📂packages  
 ┃ ┗ 📂TheHipsterStackTechnologyStack  
 ┃ ┃ ┣ 📂cli  
 ┃ ┃ ┃ ┣ 📂src  
 ┃ ┃ ┃ ┃ ┣ 📜cli.ts  
 ┃ ┃ ┃ ┃ ┗ 📜create-flow.ts  
 ┃ ┃ ┃ ┗ 📜package.json  
 ┃ ┃ ┣ 📂core  
 ┃ ┃ ┃ ┣ 📂src  
 ┃ ┃ ┃ ┃ ┣ 📂commands  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜add.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜create.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜doctor.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜explain.ts  
 ┃ ┃ ┃ ┃ ┣ 📂config  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜load.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜normalize.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜schema.ts  
 ┃ ┃ ┃ ┃ ┣ 📂generator  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜materialize.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜plan.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜transforms.ts  
 ┃ ┃ ┃ ┃ ┣ 📂lifecycle  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜git.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜install.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜run.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜validate.ts  
 ┃ ┃ ┃ ┃ ┣ 📂preflight  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜target.ts  
 ┃ ┃ ┃ ┃ ┣ 📜application-definition.ts  
 ┃ ┃ ┃ ┃ ┣ 📜browser.ts  
 ┃ ┃ ┃ ┃ ┣ 📜capabilities.ts  
 ┃ ┃ ┃ ┃ ┣ 📜errors.ts  
 ┃ ┃ ┃ ┃ ┣ 📜index.ts  
 ┃ ┃ ┃ ┃ ┣ 📜manifest.ts  
 ┃ ┃ ┃ ┃ ┣ 📜ownership.ts  
 ┃ ┃ ┃ ┃ ┣ 📜presets.ts  
 ┃ ┃ ┃ ┃ ┣ 📜project.ts  
 ┃ ┃ ┃ ┃ ┣ 📜recipe.ts  
 ┃ ┃ ┃ ┃ ┣ 📜template-artifact-catalog.ts  
 ┃ ┃ ┃ ┃ ┗ 📜template-metadata.ts  
 ┃ ┃ ┃ ┗ 📜package.json  
 ┃ ┃ ┗ 📂schema  
 ┃ ┃ ┃ ┣ 📂src  
 ┃ ┃ ┃ ┃ ┣ 📜application-definition.ts  
 ┃ ┃ ┃ ┃ ┣ 📜index.ts  
 ┃ ┃ ┃ ┃ ┗ 📜recipe.ts  
 ┃ ┃ ┃ ┗ 📜package.json  
 ┣ 📂public  
 ┣ 📂scripts  
 ┃ ┣ 📜inspect-pack.mjs  
 ┃ ┗ 📜smoke-packed-cli.mjs  
 ┣ 📂src  
 ┃ ┣ 📂CodebaseContextUtility-main  
 ┃ ┃ ┣ 📂.vscode  
 ┃ ┃ ┃ ┗ 📜mcp.json  
 ┃ ┃ ┣ 📂app  
 ┃ ┃ ┃ ┣ 📜globals.css  
 ┃ ┃ ┃ ┣ 📜layout.tsx  
 ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┣ 📂components  
 ┃ ┃ ┃ ┣ 📂ui  
 ┃ ┃ ┃ ┃ ┣ 📜alert.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜button.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜card.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜checkbox.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜dropdown-menu.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜label.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜progress.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜resizable.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜select.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜tabs.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜textarea.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜toast.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜toaster.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜use-toast-primitive.ts  
 ┃ ┃ ┃ ┃ ┗ 📜use-toast.ts  
 ┃ ┃ ┃ ┣ 📜advanced-search.tsx  
 ┃ ┃ ┃ ┣ 📜code-preview.tsx  
 ┃ ┃ ┃ ┣ 📜comments.tsx  
 ┃ ┃ ┃ ┣ 📜context-generator.tsx  
 ┃ ┃ ┃ ┣ 📜context-provider.tsx  
 ┃ ┃ ┃ ┣ 📜context-size-estimator.tsx  
 ┃ ┃ ┃ ┣ 📜dashboard.tsx  
 ┃ ┃ ┃ ┣ 📜drop-zone.tsx  
 ┃ ┃ ┃ ┣ 📜example-usage.tsx  
 ┃ ┃ ┃ ┣ 📜export-settings.tsx  
 ┃ ┃ ┃ ┣ 📜file-filter.tsx  
 ┃ ┃ ┃ ┣ 📜file-system-provider.tsx  
 ┃ ┃ ┃ ┣ 📜file-tree.tsx  
 ┃ ┃ ┃ ┣ 📜header.tsx  
 ┃ ┃ ┃ ┣ 📜llm-settings.tsx  
 ┃ ┃ ┃ ┣ 📜mode-toggle.tsx  
 ┃ ┃ ┃ ┣ 📜theme-provider.tsx  
 ┃ ┃ ┃ ┣ 📜toast-provider.tsx  
 ┃ ┃ ┃ ┗ 📜virtualized-file-tree.tsx  
 ┃ ┃ ┣ 📂hooks  
 ┃ ┃ ┃ ┗ 📜use-toast.ts  
 ┃ ┃ ┣ 📂lib  
 ┃ ┃ ┃ ┣ 📜contextGeneratorWrapper.ts  
 ┃ ┃ ┃ ┣ 📜file-system-access-types.ts  
 ┃ ┃ ┃ ┗ 📜utils.ts  
 ┃ ┃ ┣ 📂public  
 ┃ ┃ ┃ ┣ 📜placeholder-logo.png  
 ┃ ┃ ┃ ┣ 📜placeholder-logo.svg  
 ┃ ┃ ┃ ┣ 📜placeholder-user.jpg  
 ┃ ┃ ┃ ┣ 📜placeholder.jpg  
 ┃ ┃ ┃ ┣ 📜placeholder.svg  
 ┃ ┃ ┃ ┗ 📜Screenshot_4-9-2025_162543_codebase-context-utility.vercel.app.jpeg  
 ┃ ┃ ┣ 📂styles  
 ┃ ┃ ┃ ┗ 📜globals.css  
 ┃ ┃ ┣ 📂types  
 ┃ ┃ ┃ ┗ 📜codebase.ts  
 ┃ ┃ ┣ 📂utils  
 ┃ ┃ ┃ ┣ 📜architectureVisualizer.ts  
 ┃ ┃ ┃ ┣ 📜codeAnalyzer.ts  
 ┃ ┃ ┃ ┣ 📜codeSummarizer.ts  
 ┃ ┃ ┃ ┣ 📜contextGenerator.ts  
 ┃ ┃ ┃ ┣ 📜dependencyMapper.ts  
 ┃ ┃ ┃ ┣ 📜jsonFormatter.ts  
 ┃ ┃ ┃ ┣ 📜markdownFormatter.ts  
 ┃ ┃ ┃ ┗ 📜tokenCounter.ts  
 ┃ ┃ ┣ 📜.gitignore  
 ┃ ┃ ┣ 📜components.json  
 ┃ ┃ ┣ 📜eslint.config.js  
 ┃ ┃ ┣ 📜next.config.mjs  
 ┃ ┃ ┣ 📜package-lock.json  
 ┃ ┃ ┣ 📜package.json  
 ┃ ┃ ┣ 📜pnpm-lock.yaml  
 ┃ ┃ ┣ 📜postcss.config.js  
 ┃ ┃ ┣ 📜postcss.config.mjs  
 ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┣ 📜setup.bat  
 ┃ ┃ ┣ 📜setup.sh  
 ┃ ┃ ┣ 📜tailwind.config.ts  
 ┃ ┃ ┗ 📜tsconfig.json  
 ┃ ┣ 📂CodependentCoding-site  
 ┃ ┃ ┣ 📂app  
 ┃ ┃ ┃ ┣ 📂configure  
 ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┣ 📂docs  
 ┃ ┃ ┃ ┃ ┗ 📂[[…slug]]  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┣ 📂libraries  
 ┃ ┃ ┃ ┃ ┣ 📂[slug]  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┣ 📜base.css  
 ┃ ┃ ┃ ┣ 📜globals.css  
 ┃ ┃ ┃ ┣ 📜layout.tsx  
 ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┣ 📂components  
 ┃ ┃ ┃ ┣ 📂ui  
 ┃ ┃ ┃ ┃ ┣ 📜button.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜input.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜select.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜switch.tsx  
 ┃ ┃ ┃ ┣ 📜library-icon.tsx  
 ┃ ┃ ┃ ┣ 📜site-footer.tsx  
 ┃ ┃ ┃ ┗ 📜site-header.tsx  
 ┃ ┃ ┣ 📂content  
 ┃ ┃ ┃ ┣ 📂docs  
 ┃ ┃ ┃ ┃ ┣ 📜00-system-map.md  
 ┃ ┃ ┃ ┃ ┣ 📜01-knowledge-system-definition.md  
 ┃ ┃ ┃ ┃ ┣ 📜02-engineering-doctrine.md  
 ┃ ┃ ┃ ┃ ┣ 📜03-epistemology.md  
 ┃ ┃ ┃ ┃ ┣ 📜04-knowledge-modeling.md  
 ┃ ┃ ┃ ┃ ┣ 📜05-terminology-nomenclature.md  
 ┃ ┃ ┃ ┃ ┣ 📜10-loaded-vibes-architecture.md  
 ┃ ┃ ┃ ┃ ┣ 📜11-hipster-stack-tech-map.md  
 ┃ ┃ ┃ ┃ ┣ 📜12-layer-contracts.md  
 ┃ ┃ ┃ ┃ ┣ 📜13-system-lifecycles.md  
 ┃ ┃ ┃ ┃ ┣ 📜14-security-model.md  
 ┃ ┃ ┃ ┃ ┣ 📜15-governance-model.md  
 ┃ ┃ ┃ ┃ ┣ 📜16-specification-model.md  
 ┃ ┃ ┃ ┃ ┣ 📜17-validation-conformance.md  
 ┃ ┃ ┃ ┃ ┣ 📜18-agent-execution.md  
 ┃ ┃ ┃ ┃ ┗ 📜19-reference-implementations.md  
 ┃ ┃ ┃ ┣ 📂github  
 ┃ ┃ ┃ ┃ ┣ 📂ISSUE_TEMPLATE  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜config.yml  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜defect.yml  
 ┃ ┃ ┃ ┃ ┗ 📜pull_request_template.md  
 ┃ ┃ ┃ ┣ 📂governance  
 ┃ ┃ ┃ ┃ ┣ 📂contracts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜architecture.yaml  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜execution.yaml  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ontology.yaml  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜product.yaml  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜validation.yaml  
 ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┣ 📜MANIFEST.md  
 ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┣ 📂patterns  
 ┃ ┃ ┃ ┃ ┣ 📜01-fetcher.md  
 ┃ ┃ ┃ ┃ ┣ 📜02-server-action.md  
 ┃ ┃ ┃ ┃ ┣ 📜03-application-workflow.md  
 ┃ ┃ ┃ ┃ ┣ 📜04-transaction-helper.md  
 ┃ ┃ ┃ ┃ ┣ 📜05-auth-authz-policy.md  
 ┃ ┃ ┃ ┃ ┣ 📜06-webhook-processor.md  
 ┃ ┃ ┃ ┃ ┣ 📜07-route-feature-orchestration.md  
 ┃ ┃ ┃ ┃ ┣ 📜08-layer-contract.md  
 ┃ ┃ ┃ ┃ ┣ 📜09-system-lifecycle.md  
 ┃ ┃ ┃ ┃ ┣ 📜10-governance-system.md  
 ┃ ┃ ┃ ┃ ┣ 📜11-supporting-patterns.md  
 ┃ ┃ ┃ ┃ ┣ 📜11a-data-contract-patterns.md  
 ┃ ┃ ┃ ┃ ┣ 📜11b-presentation-patterns.md  
 ┃ ┃ ┃ ┃ ┣ 📜11c-infrastructure-integration-patterns.md  
 ┃ ┃ ┃ ┃ ┣ 📜11d-quality-policy-patterns.md  
 ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┗ 📂provenance  
 ┃ ┃ ┃ ┃ ┣ 📜conflict-resolution.md  
 ┃ ┃ ┃ ┃ ┣ 📜contract-traceability.md  
 ┃ ┃ ┃ ┃ ┣ 📜coverage-matrix.md  
 ┃ ┃ ┃ ┃ ┣ 📜lifecycle-traceability.md  
 ┃ ┃ ┃ ┃ ┣ 📜ontology-traceability.md  
 ┃ ┃ ┃ ┃ ┣ 📜pattern-traceability.md  
 ┃ ┃ ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📜source-provenance-ledger.md  
 ┃ ┃ ┃ ┃ ┗ 📜synthesis-decisions.md  
 ┃ ┃ ┣ 📂features  
 ┃ ┃ ┃ ┣ 📂constituter  
 ┃ ┃ ┃ ┃ ┣ 📜constituter-controls.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜constituter-preview.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜constituter.tsx  
 ┃ ┃ ┃ ┣ 📂libraries  
 ┃ ┃ ┃ ┃ ┣ 📜libraries-catalog.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜library-detail.tsx  
 ┃ ┃ ┃ ┗ 📂product  
 ┃ ┃ ┃ ┃ ┗ 📜product-landing.tsx  
 ┃ ┃ ┣ 📂lib  
 ┃ ┃ ┃ ┣ 📜configurator.ts  
 ┃ ┃ ┃ ┣ 📜docs.tsx  
 ┃ ┃ ┃ ┣ 📜libraries.ts  
 ┃ ┃ ┃ ┗ 📜utils.ts  
 ┃ ┃ ┣ 📜components.json  
 ┃ ┃ ┣ 📜next-env.d.ts  
 ┃ ┃ ┣ 📜next.config.ts  
 ┃ ┃ ┣ 📜package.json  
 ┃ ┃ ┣ 📜postcss.config.mjs  
 ┃ ┃ ┗ 📜tsconfig.json  
 ┃ ┣ 📂TheMaximalTemplate-demo  
 ┃ ┃ ┣ 📂.agents  
 ┃ ┃ ┃ ┣ 📂contracts  
 ┃ ┃ ┃ ┃ ┣ 📜architecture-boundaries.yml  
 ┃ ┃ ┃ ┃ ┣ 📜database-security.yaml  
 ┃ ┃ ┃ ┃ ┣ 📜domain-model.yaml  
 ┃ ┃ ┃ ┃ ┣ 📜integrations.yaml  
 ┃ ┃ ┃ ┃ ┣ 📜product.yaml  
 ┃ ┃ ┃ ┃ ┣ 📜quality-gates.yaml  
 ┃ ┃ ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┃ ┃ ┣ 📜routes.yaml  
 ┃ ┃ ┃ ┃ ┗ 📜server-operations.yaml  
 ┃ ┃ ┃ ┣ 📂execution  
 ┃ ┃ ┃ ┃ ┣ 📜decisions.json  
 ┃ ┃ ┃ ┃ ┣ 📜handoff.json  
 ┃ ┃ ┃ ┃ ┗ 📜progress.json  
 ┃ ┃ ┃ ┗ 📜AGENTS.md  
 ┃ ┃ ┣ 📂.github  
 ┃ ┃ ┃ ┗ 📂workflows  
 ┃ ┃ ┃ ┃ ┣ 📜pull-request-validation.yml  
 ┃ ┃ ┃ ┃ ┗ 📜secret-scan.yml  
 ┃ ┃ ┣ 📂app  
 ┃ ┃ ┃ ┣ 📂(admin)  
 ┃ ┃ ┃ ┃ ┣ 📂admin  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂billing  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂organizations  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂users  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂(auth)  
 ┃ ┃ ┃ ┃ ┣ 📂(presentation)  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂D1  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂sign-in  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂[[…sign-in]]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂sign-up  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂[[…sign-up]]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂(billing)  
 ┃ ┃ ┃ ┃ ┣ 📂canceled  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂checkout  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂success  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂(onboarding)  
 ┃ ┃ ┃ ┃ ┣ 📂onboarding  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂complete  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂organization  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂(presentation)  
 ┃ ┃ ┃ ┃ ┣ 📂auth-forms  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂catalog  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂config-page  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂cta-section  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂error-pages  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂faq-section  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂feature-grid  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂hero-section  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂invoice  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂onboarding-flow  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂process-panel  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂settings-page  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂stats-section  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂status  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜error.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜layout.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜loading.tsx  
 ┃ ┃ ┃ ┣ 📂(public)  
 ┃ ┃ ┃ ┃ ┣ 📂(presentation)  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂pA  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂pB  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂pC  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂contact  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂faq  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂pricing  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂privacy  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂terms  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂(tenant)  
 ┃ ┃ ┃ ┃ ┣ 📂(presentation)  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂tA  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂tB  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂tC  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂ai  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂dashboard  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂maps  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂projects  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂new  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂[projectId]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂settings  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂billing  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂developer  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂integrations  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂members  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂organization  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂profile  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂team  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂invitations  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜layout.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂uploads  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂api  
 ┃ ┃ ┃ ┃ ┣ 📂clerk  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┃ ┣ 📂cloudinary  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┃ ┣ 📂stripe  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂connect  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┃ ┗ 📜AGENTS.md  
 ┃ ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┃ ┣ 📜error.tsx  
 ┃ ┃ ┃ ┣ 📜global-error.tsx  
 ┃ ┃ ┃ ┣ 📜globals.css  
 ┃ ┃ ┃ ┣ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📜loading.tsx  
 ┃ ┃ ┃ ┣ 📜not-found.tsx  
 ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┣ 📂components  
 ┃ ┃ ┃ ┣ 📂(presentation)  
 ┃ ┃ ┃ ┃ ┣ 📜catalog-browser.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜presentation-header.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜presentation-shell.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜presentationOperations.ts  
 ┃ ┃ ┃ ┣ 📂app  
 ┃ ┃ ┃ ┃ ┗ 📜app-providers.tsx  
 ┃ ┃ ┃ ┣ 📂blocks  
 ┃ ┃ ┃ ┃ ┣ 📜auth-forms.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜cta-section.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜error-pages.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜faq-section.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜feature-grid.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜hero-section.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜invoice.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜onboarding-flow.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜page-hero.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜process-panel.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜settings-page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜stat-grid.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜stats-section.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜status.tsx  
 ┃ ┃ ┃ ┣ 📂brand  
 ┃ ┃ ┃ ┃ ┣ 📜logo-lockup.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜wordmark.tsx  
 ┃ ┃ ┃ ┣ 📂navigation  
 ┃ ┃ ┃ ┃ ┣ 📜auth-footer.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜auth-header.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜auth-shell.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜mobile-bottom-nav.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜presentation-header.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜presentation-shell.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜public-footer.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜public-header.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜public-shell.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜user-menu.tsx  
 ┃ ┃ ┃ ┣ 📂projects  
 ┃ ┃ ┃ ┃ ┣ 📜project-card.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜project-form.tsx  
 ┃ ┃ ┃ ┣ 📂shells  
 ┃ ┃ ┃ ┃ ┣ 📜auth-shell.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜public-shell.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜tenant-shell.tsx  
 ┃ ┃ ┃ ┗ 📂ui  
 ┃ ┃ ┃ ┃ ┣ 📜accordion.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜alert.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜avatar.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜badge.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜button.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜card.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜checkbox.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜dialog.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜dropdown-menu.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜empty-state.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜field.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜input.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜label.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜marquee.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜progress.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜separator.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜sheet.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜skeleton.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜switch.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜tabs.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜textarea.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜timeline.tsx  
 ┃ ┃ ┣ 📂content  
 ┃ ┃ ┃ ┣ 📂presentation  
 ┃ ┃ ┃ ┃ ┗ 📜registry.ts  
 ┃ ┃ ┃ ┣ 📜application.ts  
 ┃ ┃ ┃ ┣ 📜auth.ts  
 ┃ ┃ ┃ ┣ 📜loadedvibes.ts  
 ┃ ┃ ┃ ┣ 📜marketing.ts  
 ┃ ┃ ┃ ┣ 📜navigation.ts  
 ┃ ┃ ┃ ┗ 📜site.ts  
 ┃ ┃ ┣ 📂context  
 ┃ ┃ ┃ ┣ 📂docs  
 ┃ ┃ ┃ ┃ ┣ 📜architecture-governance.md  
 ┃ ┃ ┃ ┃ ┣ 📜architecture.md  
 ┃ ┃ ┃ ┃ ┣ 📜auth.md  
 ┃ ┃ ┃ ┃ ┣ 📜data-model.md  
 ┃ ┃ ┃ ┃ ┣ 📜integrations.md  
 ┃ ┃ ┃ ┃ ┣ 📜routes.md  
 ┃ ┃ ┃ ┃ ┗ 📜system-lifecycle.md  
 ┃ ┃ ┃ ┣ 📂instructions  
 ┃ ┃ ┃ ┃ ┗ 📜agent-architecture-rules.md  
 ┃ ┃ ┃ ┣ 📂patterns  
 ┃ ┃ ┃ ┃ ┣ 📜application-workflow.md  
 ┃ ┃ ┃ ┃ ┣ 📜auth-authz-boundary.md  
 ┃ ┃ ┃ ┃ ┣ 📜fetcher.md  
 ┃ ┃ ┃ ┃ ┣ 📜layer-contract.md  
 ┃ ┃ ┃ ┃ ┣ 📜route-feature-orchestration.md  
 ┃ ┃ ┃ ┃ ┣ 📜server-action.md  
 ┃ ┃ ┃ ┃ ┣ 📜transaction-helper.md  
 ┃ ┃ ┃ ┃ ┗ 📜webhook-processor.md  
 ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┣ 📂docs  
 ┃ ┃ ┃ ┣ 📂adr  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0001-layer-ownership.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0002-tenant-abstraction-and-naming.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0003-local-rbac.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0004-postgresql-rls-roles-and-context.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0005-clerk-identity-boundary.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0006-shared-webhook-ledger.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0007-stripe-subscription-billing.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0008-optional-stripe-connect.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0009-presentation-catalog-isolation.md  
 ┃ ┃ ┃ ┃ ┣ 📜adr-0010-ci-and-vercel-ownership.md  
 ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┣ 📂evidence  
 ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┣ 📂runbooks  
 ┃ ┃ ┃ ┃ ┗ 📜credential-incident.md  
 ┃ ┃ ┃ ┗ 📜stripe-connect-reference.md  
 ┃ ┃ ┣ 📂features  
 ┃ ┃ ┃ ┣ 📂admin  
 ┃ ┃ ┃ ┃ ┣ 📜admin-billing-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜admin-dashboard-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜admin-organizations-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜admin-users-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜admin-webhooks-feature.tsx  
 ┃ ┃ ┃ ┣ 📂ai  
 ┃ ┃ ┃ ┃ ┣ 📜inference-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜inference-form-client.tsx  
 ┃ ┃ ┃ ┣ 📂billing  
 ┃ ┃ ┃ ┃ ┣ 📜billing-settings-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜checkout-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜payment-success-feature.tsx  
 ┃ ┃ ┃ ┣ 📂dashboard  
 ┃ ┃ ┃ ┃ ┣ 📜dashboard-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜dashboard-skeleton.tsx  
 ┃ ┃ ┃ ┣ 📂maps  
 ┃ ┃ ┃ ┃ ┣ 📜location-search-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜map-feature.tsx  
 ┃ ┃ ┃ ┣ 📂members  
 ┃ ┃ ┃ ┃ ┣ 📜invitation-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜invitation-form-client.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜member-role-form-client.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜team-feature.tsx  
 ┃ ┃ ┃ ┣ 📂onboarding  
 ┃ ┃ ┃ ┃ ┣ 📜onboarding-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜onboarding-form.tsx  
 ┃ ┃ ┃ ┣ 📂presentation  
 ┃ ┃ ┃ ┃ ┣ 📜auth-formsFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜auth-formsFeatureClient.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜catalog-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜cta-sectionFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜cta-sectionFeatureClient.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜error-pagesFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜error-pagesFeatureClient.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜faq-sectionFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜faq-sectionFeatureClient.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜feature-gridFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜hero-sectionFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜invoiceFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜invoiceFeatureClient.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜onboarding-flowFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜onboarding-flowFeatureClient.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜process-panelFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜settings-pageFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜settings-pageFeatureClient.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜stats-sectionFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜status-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜statusFeatureClient.tsx  
 ┃ ┃ ┃ ┣ 📂projects  
 ┃ ┃ ┃ ┃ ┣ 📜new-project-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜project-detail-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜projects-feature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜projects-skeleton.tsx  
 ┃ ┃ ┃ ┣ 📂settings  
 ┃ ┃ ┃ ┃ ┣ 📜developer-settings-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜integration-settings-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜organization-settings-feature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜organization-settings-form-client.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜settings-feature.tsx  
 ┃ ┃ ┃ ┗ 📂uploads  
 ┃ ┃ ┃ ┃ ┣ 📜upload-client.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜upload-feature.tsx  
 ┃ ┃ ┣ 📂lib  
 ┃ ┃ ┃ ┣ 📂actions  
 ┃ ┃ ┃ ┃ ┣ 📜billingActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜capabilityActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜connectActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜organizationActions.ts  
 ┃ ┃ ┃ ┃ ┗ 📜projectActions.ts  
 ┃ ┃ ┃ ┣ 📂auth  
 ┃ ┃ ┃ ┃ ┗ 📜session.ts  
 ┃ ┃ ┃ ┣ 📂authz  
 ┃ ┃ ┃ ┃ ┣ 📜assertions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜capabilities.ts  
 ┃ ┃ ┃ ┃ ┣ 📜policies.ts  
 ┃ ┃ ┃ ┃ ┗ 📜tenant.ts  
 ┃ ┃ ┃ ┣ 📂billing  
 ┃ ┃ ┃ ┃ ┣ 📂workflows  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜billingWorkflows.ts  
 ┃ ┃ ┃ ┃ ┣ 📜billingState.ts  
 ┃ ┃ ┃ ┃ ┗ 📜entitlements.ts  
 ┃ ┃ ┃ ┣ 📂cache  
 ┃ ┃ ┃ ┃ ┣ 📜cache-tags.ts  
 ┃ ┃ ┃ ┃ ┗ 📜revalidate.ts  
 ┃ ┃ ┃ ┣ 📂capabilities  
 ┃ ┃ ┃ ┃ ┗ 📂workflows  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜capabilityWorkflows.ts  
 ┃ ┃ ┃ ┣ 📂connect  
 ┃ ┃ ┃ ┃ ┣ 📂workflows  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜connectWorkflows.ts  
 ┃ ┃ ┃ ┃ ┣ 📜policy.ts  
 ┃ ┃ ┃ ┃ ┗ 📜status.ts  
 ┃ ┃ ┃ ┣ 📂db  
 ┃ ┃ ┃ ┃ ┣ 📂dto  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin.mappers.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜capability.mappers.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜organization.mappers.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜project.mappers.ts  
 ┃ ┃ ┃ ┃ ┣ 📂selects  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜capability.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜organization.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜project.selects.ts  
 ┃ ┃ ┃ ┃ ┣ 📂transactions  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜auditTransactions.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜billingTransactions.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜capabilityTransactions.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜connectTransactions.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜organizationTransactions.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜projectTransactions.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜webhookTransactions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜prisma.ts  
 ┃ ┃ ┃ ┃ ┗ 📜withTenantContext.ts  
 ┃ ┃ ┃ ┣ 📂errors  
 ┃ ┃ ┃ ┃ ┗ 📜expectedActionError.ts  
 ┃ ┃ ┃ ┣ 📂fetchers  
 ┃ ┃ ┃ ┃ ┣ 📜adminFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜billingFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜capabilityFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜connectFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜dashboardFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜organizationFetchers.ts  
 ┃ ┃ ┃ ┃ ┗ 📜projectFetchers.ts  
 ┃ ┃ ┃ ┣ 📂integrations  
 ┃ ┃ ┃ ┃ ┣ 📂clerk  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜webhooks.ts  
 ┃ ┃ ┃ ┃ ┣ 📂cloudinary  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜delivery.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜signatures.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜uploads.ts  
 ┃ ┃ ┃ ┃ ┣ 📂huggingface  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜inference.ts  
 ┃ ┃ ┃ ┃ ┣ 📂mapbox  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜geocoding.ts  
 ┃ ┃ ┃ ┃ ┗ 📂stripe  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜billing.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜connect.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜connectWebhooks.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜subscriptionStatus.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜webhooks.ts  
 ┃ ┃ ┃ ┣ 📂organizations  
 ┃ ┃ ┃ ┃ ┗ 📂workflows  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜organizationWorkflows.ts  
 ┃ ┃ ┃ ┣ 📂presentation  
 ┃ ┃ ┃ ┃ ┗ 📜catalogAccess.ts  
 ┃ ┃ ┃ ┣ 📂projects  
 ┃ ┃ ┃ ┃ ┗ 📂workflows  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜projectWorkflows.ts  
 ┃ ┃ ┃ ┣ 📂webhooks  
 ┃ ┃ ┃ ┃ ┣ 📜clerkWebhookWorkflow.ts  
 ┃ ┃ ┃ ┃ ┣ 📜cloudinaryWebhookWorkflow.ts  
 ┃ ┃ ┃ ┃ ┣ 📜connectWebhookWorkflow.ts  
 ┃ ┃ ┃ ┃ ┗ 📜stripeWebhookWorkflow.ts  
 ┃ ┃ ┃ ┣ 📜env.ts  
 ┃ ┃ ┃ ┗ 📜utils.ts  
 ┃ ┃ ┣ 📂prisma  
 ┃ ┃ ┃ ┣ 📂migrations  
 ┃ ┃ ┃ ┃ ┣ 📂20260804062000_tenant_rls_baseline  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┣ 📂20260804065000_shared_webhook_claims  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┣ 📂20260804072000_stripe_subscription_billing  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┣ 📂20260804074500_stripe_connect_reference  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┣ 📂20260809090000_maximal_capability_surfaces  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┗ 📜migration_lock.toml  
 ┃ ┃ ┃ ┗ 📜schema.prisma  
 ┃ ┃ ┣ 📂public  
 ┃ ┃ ┃ ┗ 📜icon.svg  
 ┃ ┃ ┣ 📂schemas  
 ┃ ┃ ┃ ┣ 📜capabilitySchemas.ts  
 ┃ ┃ ┃ ┣ 📜clerkWebhookSchemas.ts  
 ┃ ┃ ┃ ┣ 📜connectSchemas.ts  
 ┃ ┃ ┃ ┣ 📜organizationSchemas.ts  
 ┃ ┃ ┃ ┣ 📜projectSchemas.ts  
 ┃ ┃ ┃ ┗ 📜stripeWebhookSchemas.ts  
 ┃ ┃ ┣ 📂scripts  
 ┃ ┃ ┃ ┣ 📜Invoke-SecretScan.ps1  
 ┃ ┃ ┃ ┣ 📜Test-ConnectRemoval.ps1  
 ┃ ┃ ┃ ┣ 📜Test-PostgresRls.ps1  
 ┃ ┃ ┃ ┣ 📜Test-RepositorySecurity.ps1  
 ┃ ┃ ┃ ┣ 📜Test-SecretScanner.ps1  
 ┃ ┃ ┃ ┣ 📜validate-architecture.mjs  
 ┃ ┃ ┃ ┗ 📜validate-contracts.mjs  
 ┃ ┃ ┣ 📂tests  
 ┃ ┃ ┃ ┣ 📂contract  
 ┃ ┃ ┃ ┃ ┣ 📜architecture-surface.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜architecture-validator.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜clerk-webhook-surface.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜database-security-surface.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜governance.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜presentation-catalog.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜pull-request-workflow.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜stripe-billing-surface.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜stripe-connect-surface.test.ts  
 ┃ ┃ ┃ ┃ ┗ 📜tenancy-surface.test.ts  
 ┃ ┃ ┃ ┣ 📂e2e  
 ┃ ┃ ┃ ┃ ┣ 📂fixtures  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜authenticated.ts  
 ┃ ┃ ┃ ┃ ┣ 📜presentation-catalog.spec.ts  
 ┃ ┃ ┃ ┃ ┗ 📜public-routes.spec.ts  
 ┃ ┃ ┃ ┣ 📂helpers  
 ┃ ┃ ┃ ┃ ┗ 📜server-only.ts  
 ┃ ┃ ┃ ┣ 📂integration  
 ┃ ┃ ┃ ┃ ┣ 📜postgres-rls.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜stripe-billing.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📜stripe-connect.test.ts  
 ┃ ┃ ┃ ┃ ┗ 📜webhook-processing.test.ts  
 ┃ ┃ ┃ ┗ 📂unit  
 ┃ ┃ ┃ ┃ ┣ 📂actions  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜expected-action-errors.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📂authz  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜capabilities.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜policies.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜tenant-context.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📂billing  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜billing-state.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜stripe-mapping.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜stripe-webhook-route.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜subscription-status.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📂connect  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜connect-mapping.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜connect-policy.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜connect-provider-operations.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜connect-webhook-mapping.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜connect-webhook-route.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📂dto  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜projectMappers.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📂integrations  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜cloudinary-signatures.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📂presentation  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜catalog-browser.test.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂schemas  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜organizationSchemas.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜projectSchemas.test.ts  
 ┃ ┃ ┃ ┃ ┣ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜clerk-webhook-mapping.test.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜clerk-webhook-route.test.ts  
 ┃ ┃ ┃ ┃ ┗ 📜utils.test.ts  
 ┃ ┃ ┣ 📂types  
 ┃ ┃ ┃ ┣ 📜actionResultTypes.ts  
 ┃ ┃ ┃ ┣ 📜adminTypes.ts  
 ┃ ┃ ┃ ┣ 📜auditTypes.ts  
 ┃ ┃ ┃ ┣ 📜authTypes.ts  
 ┃ ┃ ┃ ┣ 📜authzTypes.ts  
 ┃ ┃ ┃ ┣ 📜billingTypes.ts  
 ┃ ┃ ┃ ┣ 📜capabilityTypes.ts  
 ┃ ┃ ┃ ┣ 📜connectTypes.ts  
 ┃ ┃ ┃ ┣ 📜organizationTypes.ts  
 ┃ ┃ ┃ ┣ 📜presentationCatalogTypes.ts  
 ┃ ┃ ┃ ┣ 📜presentationPreviewTypes.ts  
 ┃ ┃ ┃ ┣ 📜projectTypes.ts  
 ┃ ┃ ┃ ┗ 📜webhookTypes.ts  
 ┃ ┃ ┣ 📜.editorconfig  
 ┃ ┃ ┣ 📜.env.example  
 ┃ ┃ ┣ 📜.gitattributes  
 ┃ ┃ ┣ 📜.gitignore  
 ┃ ┃ ┣ 📜.node-version  
 ┃ ┃ ┣ 📜.prettierignore  
 ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┣ 📜components.json  
 ┃ ┃ ┣ 📜eslint.config.mjs  
 ┃ ┃ ┣ 📜LICENSE  
 ┃ ┃ ┣ 📜next-env.d.ts  
 ┃ ┃ ┣ 📜next.config.ts  
 ┃ ┃ ┣ 📜package.json  
 ┃ ┃ ┣ 📜playwright.config.ts  
 ┃ ┃ ┣ 📜pnpm-lock.yaml  
 ┃ ┃ ┣ 📜pnpm-workspace.yaml  
 ┃ ┃ ┣ 📜postcss.config.mjs  
 ┃ ┃ ┣ 📜prettier.config.mjs  
 ┃ ┃ ┣ 📜prisma.config.ts  
 ┃ ┃ ┣ 📜proxy.ts  
 ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┣ 📜SECURITY.md  
 ┃ ┃ ┣ 📜tsconfig.json  
 ┃ ┃ ┣ 📜vercel.json  
 ┃ ┃ ┣ 📜vitest.config.ts  
 ┃ ┃ ┣ 📜vitest.integration.config.ts  
 ┃ ┃ ┗ 📜vitest.setup.ts  
 ┃ ┗ 📂TheMaximalTemplate-main  
 ┃ ┃ ┣ 📂.agents  
 ┃ ┃ ┃ ┣ 📂contracts  
 ┃ ┃ ┃ ┃ ┣ 📜design.yaml  
 ┃ ┃ ┃ ┃ ┣ 📜product.yaml  
 ┃ ┃ ┃ ┃ ┗ 📜validation.yaml  
 ┃ ┃ ┃ ┗ 📂execution  
 ┃ ┃ ┃ ┃ ┣ 📜decisions.json  
 ┃ ┃ ┃ ┃ ┣ 📜handoff.json  
 ┃ ┃ ┃ ┃ ┗ 📜progress.json  
 ┃ ┃ ┣ 📂.github  
 ┃ ┃ ┃ ┣ 📂ISSUE_TEMPLATE  
 ┃ ┃ ┃ ┃ ┣ 📜bug_report.yml  
 ┃ ┃ ┃ ┃ ┣ 📜chore_request.yml  
 ┃ ┃ ┃ ┃ ┗ 📜feature_request.yml  
 ┃ ┃ ┃ ┣ 📂workflows  
 ┃ ┃ ┃ ┃ ┗ 📜README.md  
 ┃ ┃ ┃ ┗ 📜PULL_REQUEST_TEMPLATE.md  
 ┃ ┃ ┣ 📂app  
 ┃ ┃ ┃ ┣ 📂(auth)  
 ┃ ┃ ┃ ┃ ┣ 📂sign-in  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂[[…sign-in]]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂sign-up  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂[[…sign-up]]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂(public)  
 ┃ ┃ ┃ ┃ ┣ 📂architecture  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂components  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂contact  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂explore  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂faq  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂features  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂integrations  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂pricing  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂privacy  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂terms  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜layout.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┣ 📂(tenant)  
 ┃ ┃ ┃ ┃ ┣ 📂admin  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂audit  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂records  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂users  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂ai  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂playground  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂usage  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂crm  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂accounts  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂[accountId]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂analytics  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂contacts  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂new  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂[contactId]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂edit  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂pipeline  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂dashboard  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂expenses  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂invoices  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂new  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂[invoiceId]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂marketing  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂analytics  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂audiences  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂campaigns  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂my-tasks  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂onboarding  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂portal  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂billing  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂documents  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂projects  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂[projectId]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂tasks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┃ ┣ 📂timeline  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂settings  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂billing  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂integrations  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂members  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂profile  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂social  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂calendar  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂compose  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂media  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┣ 📂support  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂analytics  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂inbox  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📂knowledge-base  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂tickets  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📂[ticketId]  
 ┃ ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜page.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜layout.tsx  
 ┃ ┃ ┃ ┣ 📂api  
 ┃ ┃ ┃ ┃ ┣ 📂ai  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂generate  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┃ ┣ 📂clerk  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┃ ┣ 📂sendgrid  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┃ ┗ 📂stripe  
 ┃ ┃ ┃ ┃ ┃ ┗ 📂webhooks  
 ┃ ┃ ┃ ┃ ┃ ┃ ┗ 📜route.ts  
 ┃ ┃ ┃ ┣ 📜global-error.tsx  
 ┃ ┃ ┃ ┣ 📜globals.css  
 ┃ ┃ ┃ ┣ 📜layout.tsx  
 ┃ ┃ ┃ ┗ 📜not-found.tsx  
 ┃ ┃ ┣ 📂components  
 ┃ ┃ ┃ ┣ 📂blocks  
 ┃ ┃ ┃ ┃ ┣ 📜application-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜bento-grids.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜changelog-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜comparison-tables.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contact-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜cta-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜error-states.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜faq-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜feature-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜footer-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜hero-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜invoice-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜loading-states.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜logo-clouds.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜pricing-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜stats-sections.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜team-sections.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜testimonial-sections.tsx  
 ┃ ┃ ┃ ┣ 📂brand  
 ┃ ┃ ┃ ┃ ┣ 📜logo-lockup.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜wordmark.tsx  
 ┃ ┃ ┃ ┣ 📂nav  
 ┃ ┃ ┃ ┃ ┣ 📜auth-footer.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜auth-header.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜mobile-bottom-nav.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜public-footer.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜public-header.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜user-menu.tsx  
 ┃ ┃ ┃ ┣ 📂shells  
 ┃ ┃ ┃ ┃ ┣ 📜auth-shell.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜portal-shell.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜public-shell.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜tenant-shell.tsx  
 ┃ ┃ ┃ ┣ 📂ui  
 ┃ ┃ ┃ ┃ ┣ 📂chart  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜annotations.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜container.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜donut-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜empty.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜funnel-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜gauge-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜heatmap-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜index.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜legend.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜loading.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜palettes.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜radar-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜radial-bar-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜sankey-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜sparkline.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜tooltip.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜treemap-chart.tsx  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜types.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜utils.ts  
 ┃ ┃ ┃ ┃ ┣ 📜accordion.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜alert-dialog.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜alert.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜ascii-shapes.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜aspect-ratio.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜avatar.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜badge.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜breadcrumb.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜button-group.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜button.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜calendar.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜card.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜carousel.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜chart-toolbar.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜chart.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜checkbox.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜collapsible.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜combobox.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜command.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜context-menu.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜data-table.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜date-picker.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜date-range-picker.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜dialog.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜drawer.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜dropdown-menu.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜dropzone.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜empty-state.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜field.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜hover-card.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜index.ts  
 ┃ ┃ ┃ ┃ ┣ 📜input-group.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜input-otp.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜input.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜kbd.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜label.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜layered-card.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜marquee.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜math-curve-background.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜math-curve-loader.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜math-curve-progress.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜menubar.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜motion.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜multi-step-form.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜native-select.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜navigation-menu.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜pagination.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜popover.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜progress.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜radio-group.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜rating.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜resizable.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜scroll-area.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜select.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜separator.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜shapes.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜sheet.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜sidebar.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜skeleton.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜slider.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜sonner.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜spinner.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜stat-card.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜stepper.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜sticker.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜switch.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜table.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜tabs.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜tag-input.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜textarea.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜time-picker.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜timeline.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜toggle-group.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜toggle.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜tooltip.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜tour.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜tree-view.tsx  
 ┃ ┃ ┃ ┗ 📜ErrorBoundary.tsx  
 ┃ ┃ ┣ 📂content  
 ┃ ┃ ┃ ┣ 📜application.ts  
 ┃ ┃ ┃ ┣ 📜auth.ts  
 ┃ ┃ ┃ ┗ 📜site.ts  
 ┃ ┃ ┣ 📂context  
 ┃ ┃ ┃ ┣ 📂docs  
 ┃ ┃ ┃ ┃ ┣ 📜architecture.md  
 ┃ ┃ ┃ ┃ ┣ 📜auth.md  
 ┃ ┃ ┃ ┃ ┣ 📜design.md  
 ┃ ┃ ┃ ┃ ┣ 📜prd.md  
 ┃ ┃ ┃ ┃ ┗ 📜tech-requirements.md  
 ┃ ┃ ┃ ┗ 📂specs  
 ┃ ┃ ┃ ┃ ┣ 📜00.architectural-contract.md  
 ┃ ┃ ┃ ┃ ┣ 📜01.route-topology-public-demo.md  
 ┃ ┃ ┃ ┃ ┣ 📜02.design-system.md  
 ┃ ┃ ┃ ┃ ┣ 📜03.block-library.md  
 ┃ ┃ ┃ ┃ ┣ 📜04.crm-golden-vertical-slice.md  
 ┃ ┃ ┃ ┃ ┣ 📜05.application-library-normalization.md  
 ┃ ┃ ┃ ┃ ┣ 📜06.maximal-template-explorer.md  
 ┃ ┃ ┃ ┃ ┗ 📜07.provider-integrations.md  
 ┃ ┃ ┣ 📂features  
 ┃ ┃ ┃ ┣ 📂admin  
 ┃ ┃ ┃ ┃ ┣ 📜auditFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜recordsFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜usersFeature.tsx  
 ┃ ┃ ┃ ┣ 📂ai  
 ┃ ┃ ┃ ┃ ┣ 📜generationFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜playgroundFeature.client.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜playgroundFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜usageFeature.tsx  
 ┃ ┃ ┃ ┣ 📂auth  
 ┃ ┃ ┃ ┃ ┣ 📜signInFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜signUpFeature.tsx  
 ┃ ┃ ┃ ┣ 📂crm  
 ┃ ┃ ┃ ┃ ┣ 📜accountFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactDetailFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactDetailSkeleton.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactEditFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactEditForm.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactNewForm.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactsClientFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactsFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜contactsSkeleton.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜crmAnalyticsFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜pipelineFeature.tsx  
 ┃ ┃ ┃ ┣ 📂dashboard  
 ┃ ┃ ┃ ┃ ┗ 📜dashboardFeature.tsx  
 ┃ ┃ ┃ ┣ 📂explorer  
 ┃ ┃ ┃ ┃ ┗ 📜maximalTemplateExplorer.tsx  
 ┃ ┃ ┃ ┣ 📂invoicing  
 ┃ ┃ ┃ ┃ ┣ 📜expensesFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜invoiceEditorFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜invoiceFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜invoicesFeature.tsx  
 ┃ ┃ ┃ ┣ 📂marketing  
 ┃ ┃ ┃ ┃ ┣ 📜audiencesFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜campaignEditorFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜campaignsFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜marketingAnalyticsFeature.tsx  
 ┃ ┃ ┃ ┣ 📂onboarding  
 ┃ ┃ ┃ ┃ ┗ 📜onboardingFeature.tsx  
 ┃ ┃ ┃ ┣ 📂portal  
 ┃ ┃ ┃ ┃ ┣ 📜billingFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜documentsFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜portalFeature.tsx  
 ┃ ┃ ┃ ┣ 📂projects  
 ┃ ┃ ┃ ┃ ┣ 📜projectFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜projectsFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜taskEditorFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜tasksFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜timelineFeature.tsx  
 ┃ ┃ ┃ ┣ 📂settings  
 ┃ ┃ ┃ ┃ ┣ 📜billingFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜integrationsFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜membersFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜profileFeature.tsx  
 ┃ ┃ ┃ ┣ 📂social  
 ┃ ┃ ┃ ┃ ┣ 📜calendarFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜composerFeature.client.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜composerFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜mediaLibraryFeature.tsx  
 ┃ ┃ ┃ ┗ 📂support  
 ┃ ┃ ┃ ┃ ┣ 📜inboxFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜knowledgeBaseFeature.tsx  
 ┃ ┃ ┃ ┃ ┣ 📜supportAnalyticsFeature.tsx  
 ┃ ┃ ┃ ┃ ┗ 📜ticketFeature.tsx  
 ┃ ┃ ┣ 📂hooks  
 ┃ ┃ ┃ ┗ 📜use-theme.ts  
 ┃ ┃ ┣ 📂lib  
 ┃ ┃ ┃ ┣ 📂actions  
 ┃ ┃ ┃ ┃ ┣ 📜aiActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜commonActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜crmActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜invoicingActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜marketingActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜portalActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜projectsActions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜socialActions.ts  
 ┃ ┃ ┃ ┃ ┗ 📜supportActions.ts  
 ┃ ┃ ┃ ┣ 📂auth  
 ┃ ┃ ┃ ┃ ┣ 📜clerkWebhook.ts  
 ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┣ 📜identity.ts  
 ┃ ┃ ┃ ┃ ┣ 📜organization.ts  
 ┃ ┃ ┃ ┃ ┣ 📜requireAuth.ts  
 ┃ ┃ ┃ ┃ ┣ 📜session.ts  
 ┃ ┃ ┃ ┃ ┗ 📜user.ts  
 ┃ ┃ ┃ ┣ 📂authz  
 ┃ ┃ ┃ ┃ ┣ 📜authorize.ts  
 ┃ ┃ ┃ ┃ ┣ 📜permissions.ts  
 ┃ ┃ ┃ ┃ ┣ 📜policies.ts  
 ┃ ┃ ┃ ┃ ┣ 📜resources.ts  
 ┃ ┃ ┃ ┃ ┗ 📜roles.ts  
 ┃ ┃ ┃ ┣ 📂cache  
 ┃ ┃ ┃ ┃ ┣ 📜invalidate.ts  
 ┃ ┃ ┃ ┃ ┣ 📜life.ts  
 ┃ ┃ ┃ ┃ ┗ 📜tags.ts  
 ┃ ┃ ┃ ┣ 📂constants  
 ┃ ┃ ┃ ┃ ┣ 📜limits.ts  
 ┃ ┃ ┃ ┃ ┣ 📜pagination.ts  
 ┃ ┃ ┃ ┃ ┗ 📜routes.ts  
 ┃ ┃ ┃ ┣ 📂db  
 ┃ ┃ ┃ ┃ ┣ 📂dto  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ai.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜common.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜crmDto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜invoicing.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜marketing.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜portal.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜projects.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜social.dto.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜support.dto.ts  
 ┃ ┃ ┃ ┃ ┣ 📂selects  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜admin.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜ai.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜common.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜crmSelects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜invoicing.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜marketing.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜portal.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜projects.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜social.selects.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜support.selects.ts  
 ┃ ┃ ┃ ┃ ┣ 📂transactions  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜add-portal-version.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜complete-ai-generation.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜create-invoice.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜errors.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜idempotency.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜schedule-social-post.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜sync-clerk-user.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜tenant-context.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜update-deal-stage.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜update-invoice-status.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜update-task-status.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜update-ticket-status.tx.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜webhook-event.tx.ts  
 ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┣ 📜provider.ts  
 ┃ ┃ ┃ ┃ ┗ 📜tenant.ts  
 ┃ ┃ ┃ ┣ 📂fetchers  
 ┃ ┃ ┃ ┃ ┣ 📜adminFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜aiFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜commonFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜crmFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜invoicingFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜marketingFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜portalFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜projectsFetchers.ts  
 ┃ ┃ ┃ ┃ ┣ 📜socialFetchers.ts  
 ┃ ┃ ┃ ┃ ┗ 📜supportFetchers.ts  
 ┃ ┃ ┃ ┣ 📂integrations  
 ┃ ┃ ┃ ┃ ┣ 📂cloudinary  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜transformations.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜upload.ts  
 ┃ ┃ ┃ ┃ ┣ 📂hugging-face  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜embeddings.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜inference.ts  
 ┃ ┃ ┃ ┃ ┣ 📂sendgrid  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜email.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜webhooks.ts  
 ┃ ┃ ┃ ┃ ┣ 📂stripe  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜checkout.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜portal.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜subscriptions.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜webhooks.ts  
 ┃ ┃ ┃ ┃ ┣ 📂vercel-blob  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜client.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜delete.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜upload.ts  
 ┃ ┃ ┃ ┃ ┗ 📜status.ts  
 ┃ ┃ ┃ ┣ 📂utils  
 ┃ ┃ ┃ ┃ ┣ 📜chartExport.ts  
 ┃ ┃ ┃ ┃ ┣ 📜cn.ts  
 ┃ ┃ ┃ ┃ ┣ 📜dates.ts  
 ┃ ┃ ┃ ┃ ┣ 📜index.ts  
 ┃ ┃ ┃ ┃ ┣ 📜mathCurves.ts  
 ┃ ┃ ┃ ┃ ┣ 📜money.ts  
 ┃ ┃ ┃ ┃ ┣ 📜motionCore.ts  
 ┃ ┃ ┃ ┃ ┗ 📜strings.ts  
 ┃ ┃ ┃ ┗ 📂workflows  
 ┃ ┃ ┃ ┃ ┣ 📂admin  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜classifyAuditEvent.ts  
 ┃ ┃ ┃ ┃ ┣ 📂ai  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateCredits.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateUsage.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜enforceRateLimit.ts  
 ┃ ┃ ┃ ┃ ┣ 📂crm  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜advanceDealStage.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculatePipelineValue.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateSalesVelocity.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜detectStalledDeal.ts  
 ┃ ┃ ┃ ┃ ┣ 📂invoicing  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateInvoiceTotals.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateTaxes.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜determineInvoiceStatus.ts  
 ┃ ┃ ┃ ┃ ┣ 📂marketing  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateAttribution.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateCampaignMetrics.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜evaluateAudienceRules.ts  
 ┃ ┃ ┃ ┃ ┣ 📂portal  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateProjectStatus.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜determineApprovalState.ts  
 ┃ ┃ ┃ ┃ ┣ 📂projects  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateMilestoneProgress.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateProjectHealth.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜resolveTaskDependencies.ts  
 ┃ ┃ ┃ ┃ ┣ 📂social  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜buildPlatformVariant.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜resolvePublishTime.ts  
 ┃ ┃ ┃ ┃ ┗ 📂support  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜calculateSla.ts  
 ┃ ┃ ┃ ┃ ┃ ┣ 📜determineEscalation.ts  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜prioritizeTickets.ts  
 ┃ ┃ ┣ 📂prisma  
 ┃ ┃ ┃ ┣ 📂migrations  
 ┃ ┃ ┃ ┃ ┣ 📂20260814000000_initial_maximal_foundation  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┣ 📂20260814000200_tenant_rls  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┣ 📂20260815000000_application_owned_tenancy  
 ┃ ┃ ┃ ┃ ┃ ┗ 📜migration.sql  
 ┃ ┃ ┃ ┃ ┗ 📜migration_lock.toml  
 ┃ ┃ ┃ ┣ 📜schema.prisma  
 ┃ ┃ ┃ ┗ 📜seed.ts  
 ┃ ┃ ┣ 📂schemas  
 ┃ ┃ ┃ ┣ 📜aiSchemas.ts  
 ┃ ┃ ┃ ┣ 📜commonSchemas.ts  
 ┃ ┃ ┃ ┣ 📜crmSchemas.ts  
 ┃ ┃ ┃ ┣ 📜invoicingSchemas.ts  
 ┃ ┃ ┃ ┣ 📜marketingSchemas.ts  
 ┃ ┃ ┃ ┣ 📜portalSchemas.ts  
 ┃ ┃ ┃ ┣ 📜projectsSchemas.ts  
 ┃ ┃ ┃ ┣ 📜socialSchemas.ts  
 ┃ ┃ ┃ ┗ 📜supportSchemas.ts  
 ┃ ┃ ┣ 📂tests  
 ┃ ┃ ┃ ┗ 📜authz.test.ts  
 ┃ ┃ ┣ 📂types  
 ┃ ┃ ┃ ┣ 📜access.ts  
 ┃ ┃ ┃ ┣ 📜adminTypes.ts  
 ┃ ┃ ┃ ┣ 📜aiTypes.ts  
 ┃ ┃ ┃ ┣ 📜commonTypes.ts  
 ┃ ┃ ┃ ┣ 📜crmTypes.ts  
 ┃ ┃ ┃ ┣ 📜invoicingTypes.ts  
 ┃ ┃ ┃ ┣ 📜marketingTypes.ts  
 ┃ ┃ ┃ ┣ 📜portalTypes.ts  
 ┃ ┃ ┃ ┣ 📜projectsTypes.ts  
 ┃ ┃ ┃ ┣ 📜socialTypes.ts  
 ┃ ┃ ┃ ┗ 📜supportTypes.ts  
 ┃ ┃ ┣ 📜.env.example  
 ┃ ┃ ┣ 📜.gitattributes  
 ┃ ┃ ┣ 📜.gitignore  
 ┃ ┃ ┣ 📜.prettierignore  
 ┃ ┃ ┣ 📜AGENTS.md  
 ┃ ┃ ┣ 📜ARCHITECTURE.md  
 ┃ ┃ ┣ 📜components.json  
 ┃ ┃ ┣ 📜eslint.config.mjs  
 ┃ ┃ ┣ 📜LICENSE  
 ┃ ┃ ┣ 📜next-env.d.ts  
 ┃ ┃ ┣ 📜next.config.ts  
 ┃ ┃ ┣ 📜package.json  
 ┃ ┃ ┣ 📜pnpm-lock.yaml  
 ┃ ┃ ┣ 📜pnpm-workspace.yaml  
 ┃ ┃ ┣ 📜postcss.config.mjs  
 ┃ ┃ ┣ 📜prisma.config.ts  
 ┃ ┃ ┣ 📜proxy.ts  
 ┃ ┃ ┣ 📜README.md  
 ┃ ┃ ┗ 📜tsconfig.json  
 ┣ 📂tests  
 ┃ ┣ 📂generated  
 ┃ ┃ ┗ 📜real-cli.test.ts  
 ┃ ┣ 📂integration  
 ┃ ┃ ┣ 📜add-module.test.ts  
 ┃ ┃ ┣ 📜diagnostics.test.ts  
 ┃ ┃ ┣ 📜materialize.test.ts  
 ┃ ┃ ┗ 📜template-ownership.test.ts  
 ┃ ┗ 📂unit  
 ┃ ┃ ┣ 📜application-definition.test.ts  
 ┃ ┃ ┣ 📜cli-flow.test.ts  
 ┃ ┃ ┣ 📜config.test.ts  
 ┃ ┃ ┣ 📜preflight.test.ts  
 ┃ ┃ ┣ 📜recipe-resolution.test.ts  
 ┃ ┃ ┗ 📜web-configurator.test.ts  
 ┣ 📜.gitattributes  
 ┣ 📜.gitignore  
 ┣ 📜.node-version  
 ┣ 📜.npmignore  
 ┣ 📜.prettierignore  
 ┣ 📜AGENTS.md  
 ┣ 📜CONTRIBUTING.md  
 ┣ 📜eslint.config.mjs  
 ┣ 📜LICENSE  
 ┣ 📜llms.txt  
 ┣ 📜MANIFEST.md  
 ┣ 📜package.json  
 ┣ 📜pnpm-lock.yaml  
 ┣ 📜pnpm-workspace.yaml  
 ┣ 📜prettier.config.mjs  
 ┣ 📜README.md  
 ┣ 📜SECURITY.md  
 ┣ 📜template-disposition.json  
 ┣ 📜tsconfig.json  
 ┣ 📜tsdown.config.ts  
 ┣ 📜vercel.json  
 ┗ 📜vitest.config.ts