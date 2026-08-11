# Existing Project Source Audit

This audit covers every source name supplied in the original Project self-audits. Decisions are conservative: unknown/ambiguous sources are not assumed to contain something they do not. `Ad hoc` means keep outside persistent Project context and add only for a task that needs it.


## Prömpter

| Current source | Disposition | Reason |
|---|---|---|
| `ChatGPT Developer mode.md` | **Conditional** | Keep only if you routinely engineer Developer Mode prompts; verify live OpenAI behavior when used. |
| `Tasks in ChatGPT.md` | **Replace/conditional** | Use the current OpenAI reference/live docs instead of treating a static copy as current truth. |
| `ChatGPT agent.md` | **Conditional** | Keep only if agent-mode prompt engineering is common. |
| `Projects in ChatGPT.md` | **Replace** | Use the current OpenAI Projects reference in this package or refresh the source. |
| `Skills-&-Plugins.txt` | **Conditional** | Useful product vocabulary, but static and not controlling authority. |
| `Deep-research-in-ChatGPT.txt` | **Conditional** | Keep only if Deep Research prompting is common. |
| `ChatGPT-Work-and-Codex.txt` | **Keep/refresh** | Directly relevant to prompts for Work/Codex; refresh when product behavior matters. |
| `Prompts.txt` | **Keep** | Core prompt-engineering reference if its content remains useful. |
| `ai-prompt-engineering-safety-best-practices.instructions.md` | **Ad hoc** | Too broad as permanent context; add only for prompt-security/safety reviews. |
| `prompt-builder.agent.md` | **Remove** | Conflicts with desired lean behavior through mandatory research and Prompt Tester cycles. |

## Trust Issues

| Current source | Disposition | Reason |
|---|---|---|
| `ai-team-qa` | **Replace** | Use the QA Subagent instruction basis plus The Stupid Lesson unless this file contains unique required QA doctrine. |
| `The Stupid Lesson` | **Keep - primary** | Canonical proportional-verification doctrine. |
| `Doublecheck` | **Keep** | Useful adversarial claim/source checking, subordinate to originating requirements. |
| `Universal Janitor` | **Remove/ad hoc** | Invites broad cleanup unrelated to verification scope. |
| `QA` | **Replace/keep if unique** | Consolidate into the selected QA basis; avoid duplicate QA personas. |
| `Technical Debt Remediation Plan` | **Remove/ad hoc** | Technical-debt discovery is not default post-execution verification. |
| `technical-content-evaluator` | **Remove/ad hoc** | Only relevant when the artifact under review is technical content. |
| `Performance Optimization Best Practices` | **Remove/ad hoc** | Performance work must be required, not invented by QA. |
| `create-llms` | **Remove** | Unrelated to core verifier role. |
| `refactor-method-complexity-reduce` | **Remove/ad hoc** | Refactoring is not default remediation. |
| `update-llms` | **Remove** | Unrelated to core verifier role. |
| `Generic Code Review Instructions` | **Remove/ad hoc** | Broad code review can expand scope; load only for an explicit code-review task. |

## Vibes

| Current source | Disposition | Reason |
|---|---|---|
| `software-development.engineering-practice.descriptive-model.reference(1).md` | **Keep if still canonical** | Useful user-specific engineering language. |
| `software-development.system-architecture.terminology.reference(1).md` | **Keep if still canonical** | Useful terminology/architecture reference. |
| `web-development.knowledge-modeling.ontology-taxonomy.reference(1).md` | **Conditional** | Useful when designing system/governance; not necessary for every operational task. |
| `How-I-Build-Opinionated-SaaS-Applications.txt` | **Keep** | Strong user-specific doctrine. |
| `Codependent-Coding-Knowledge-System.txt` | **Prefer live repo** | Replace static copy with live CodependentCoding connector context where practical. |
| `SKILL(1).md` | **Replace/identify** | Ambiguous filename; replace with a descriptive curated source or rename the upload copy. |
| `dependencies.md` | **Replace/curate** | Likely GitHub/project support material; keep only if still used after curated GitHub sources. |
| `issue-types.md` | **Replace/curate** | Use curated GitHub work-management source if redundant. |
| `projects.md` | **Replace/curate** | Use curated GitHub work-management source if redundant. |
| `sub-issues.md` | **Replace/curate** | Use curated GitHub work-management source if redundant. |
| `images.md` | **Remove/ad hoc** | Not core platform-operations context unless current work requires issue images. |
| `templates.md` | **Conditional** | Keep only if Vibes regularly manages GitHub templates. |
| `issue-fields.md` | **Conditional/current-sensitive** | Preview/product behavior can change; verify current GitHub behavior. |
| `search.md` | **Conditional** | Useful mechanics but not mandatory persistent context. |
| `github-actions-expert.agent.md` | **Instruction basis, not persistent** | Included in this package under instruction-basis. |
| `neon-optimization-analyzer.agent.md` | **Ad hoc** | Load for actual Neon performance work, not every Vibes task. |
| `neon-migration-specialist.agent.md` | **Ad hoc** | Load for actual migration work or hand off to Data Modeler. |
| `SKILL(2).md` | **Replace/identify** | Ambiguous filename; curate/rename upload copy. |
| `update-docs-on-code-change.instructions.md` | **Remove/ad hoc** | Documentation updates should follow repository need, not automatic policy. |
| `performance-optimization.instructions.md` | **Remove/ad hoc** | Performance work only when required. |
| `security-and-owasp.instructions.md` | **Remove/ad hoc** | Security review only when relevant/consequential, not permanent scope expansion. |
| `code-review-generic.instructions.md` | **Remove/ad hoc** | Generic review is not the Project identity. |
| `context7.instructions.md` | **Conditional** | Use current-doc tooling when available; source file is not necessary if tool exists. |
| `deploy.sh` | **Remove as Project source** | Executable helper belongs in a repository/tool workflow, not broad persistent context unless specifically needed. |
| `SKILL(3).md` | **Replace/identify** | Ambiguous filename; curate/rename upload copy. |

## DevNotes

| Current source | Disposition | Reason |
|---|---|---|
| `README(1).md` | **Keep/refresh** | Canonical vault overview; prefer current live README. |
| `AGENTS(1).md` | **Keep/refresh** | Canonical agent operating rules; prefer current live AGENTS. |
| `obsidian.contracts.property-schema(2).md` | **Keep/refresh** | Canonical Obsidian Properties schema. |
| `obsidian.contracts.note-types(2).md` | **Keep/refresh** | Canonical note classification. |
| `obsidian.contracts.naming-standard(2).md` | **Keep/refresh** | Canonical durable naming standard. |
| `SKILL.md - Defuddle` | **Keep if used** | Useful for web-content extraction. |
| `EXAMPLES.md - JSON Canvas` | **Keep if used** | Useful Canvas examples. |
| `SKILL.md - JSON Canvas` | **Keep if used; rename upload copy** | Relevant, but duplicate filename is poor source manifest hygiene. |
| `FUNCTIONS_REFERENCE.md - Bases` | **Keep if used** | Relevant to Bases. |
| `SKILL(1).md - Bases` | **Keep if used; rename upload copy** | Relevant, but use a descriptive Project-source filename. |
| `SKILL(2).md - Obsidian CLI` | **Keep if used; rename upload copy** | Relevant when CLI is available. |
| `PROPERTIES.md` | **Keep** | Directly relevant Obsidian reference. |
| `EMBEDS.md` | **Keep** | Directly relevant Obsidian reference. |
| `CALLOUTS.md` | **Keep** | Directly relevant Obsidian reference. |
| `SKILL(3).md - Obsidian Markdown` | **Keep; rename upload copy** | Core Obsidian formatting reference. |

## Execution

| Current source | Disposition | Reason |
|---|---|---|
| `se-context-architect.md` | **Replace/instruction basis** | Context capability is useful, but use curated context-engineering plugin to avoid mandatory handoff ceremony. |
| `se-product-manager-advisor.md` | **Remove/ad hoc** | Product advice is not Execution primary role. |
| `se-responsible-ai-code.md` | **Remove/ad hoc** | Load only when AI-specific implementation risk is relevant. |
| `se-gitops-ci-specialist.md` | **Move to Vibes / instruction basis** | CI/GitOps expertise belongs primarily to Vibes; Execution can consume repository CI requirements. |
| `se-expert-react-frontend-engineer.md` | **Ad hoc** | Useful for UI-heavy implementation; not necessary as permanent source if Next.js expertise is in instruction basis. |
| `se-security-reviewer.md` | **Remove/ad hoc** | Security review is risk-triggered, not default scope. |
| `se-technical-writer.md` | **Remove/ad hoc** | Documentation is not primary implementation role. |
| `se-system-architecture-reviewer.md` | **Move to Vibes/ad hoc** | Architecture review belongs primarily to Vibes unless implementation needs it. |
| `se-ux-ui-designer.md` | **Ad hoc** | Invoke for UI/UX implementation when needed. |
| `plugin.json` | **Remove** | Plugin metadata does not add useful execution context. |
| `SKILL.md` | **Replace/identify** | Ambiguous; replace with curated named sources. |
| `SKILL(1).md` | **Replace/identify** | Ambiguous; replace with curated named sources. |
| `SKILL(2).md` | **Replace/identify** | Ambiguous; replace with curated named sources. |
| `SKILL(3).md` | **Replace/identify** | Ambiguous; replace with curated named sources. |
| `SKILL(4).md` | **Replace/identify** | Ambiguous; replace with curated named sources. |
| `SKILL(20260809-222011).md` | **Remove/identify first** | Timestamped duplicate indicates source drift; do not keep without unique value. |
| `unit-test-generation.prompt.md` | **Ad hoc** | Use when test generation is actually part of the Issue. |
| `README(20260809-222032).md` | **Remove/identify first** | Timestamped/ambiguous source; replace with canonical plugin README if redundant. |
| `expert-nextjs-developer.agent.md` | **Instruction basis, not persistent** | Included under instruction-basis in this package. |
| `codependentcoding.manifest.map.md` | **Prefer live repo** | Use live CodependentCoding when applicable. |
| `codependentcoding.docs.system-map.map.md` | **Prefer live repo** | Use live CodependentCoding when applicable. |
| `codependentcoding.docs.hipster-stack-tech.map.md` | **Prefer live repo** | Use live CodependentCoding when applicable. |
| `codependentcoding.readme.source-document.md` | **Prefer live repo** | Use live CodependentCoding when applicable. |
| `codependentcoding.patterns.catalog.map.md` | **Prefer live repo** | Use live CodependentCoding when applicable. |

## Fuck You Pay Me

| Current source | Disposition | Reason |
|---|---|---|
| `CodebaseContextUtility-main.zip` | **Remove** | Software codebase archive is unrelated to persistent business operations. |
| `Vouch-main (3).zip` | **Remove** | Software source archive is unrelated to persistent RevOps context. |
| `vouch-governance-artifacts.zip` | **Remove** | Software governance is unrelated to persistent RevOps context. |
| `Vouch-main (1).zip` | **Remove** | Duplicate software source archive. |
| `CtrlPlus-main.zip` | **Remove** | Software source archive is unrelated to persistent RevOps context. |
| `README(9).md` | **Remove/identify** | Ambiguous; keep only if it is genuinely a business-ops reference. |
| `Resume(6).pdf` | **Ad hoc** | Keep only when job/application work is active. |
| `05_ChatGPT_Sites_Build_Initiation_Prompt.md` | **Remove** | Portfolio/site build prompt is not business operations. |
| `README.md` | **Remove/identify** | Ambiguous; keep only if it is genuinely business-ops context. |
| `01_Ivan_Roman_Portfolio_Design_Narrative_and_Build_Governance(2).md` | **Remove** | Portfolio build governance is unrelated to persistent RevOps. |
| `04_Project_Folder_Instructions_Replacement.md` | **Remove** | Project-folder meta configuration is unrelated to business operations. |
| `00_Ivan_Roman_Portfolio_Canonical_Source_Index(2).md` | **Remove** | Portfolio construction source. |
| `02_Ivan_Roman_Career_Impact_Evidence_and_Scoreboard(2).md` | **Ad hoc** | Potentially useful for job/client pitching, but not permanent finance/CRM context. |
| `03_Ivan_Roman_Portfolio_Writing_Transitions_and_Quote_Map(2).md` | **Remove/ad hoc** | Writing asset only when marketing/job work needs it. |
| `BeyondReasonableDoubt` | **Remove/identify** | No demonstrated persistent business-ops need. |
| `Cigarettes, Regrets, and Neural Nets` | **Remove** | Creative/dev-blog material does not belong in persistent RevOps context. |

## Result

The most important source changes are: remove Prompt Builder as controlling Prömpter context; collapse Trust Issues to proportional QA; replace Execution's overlapping specialist pile with a bounded implementation source set; re-center Vibes on platform/system expertise; leave DevNotes mostly intact; and purge unrelated software/portfolio archives from Fuck You Pay Me.
