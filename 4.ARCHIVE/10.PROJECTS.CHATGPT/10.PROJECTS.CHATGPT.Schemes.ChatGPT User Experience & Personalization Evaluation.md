# ChatGPT User Experience & Personalization Evaluation

**Evaluation focus:** interface coherence, task efficacy, context continuity, epistemic reliability, output fit, and utilization of ChatGPT resources.

## Executive finding

The central issue is **not insufficient use of ChatGPT**. It is that a high-volume, multi-project workflow is frequently being operated through an interface that still makes the user perform too much of the orchestration manually.

A historical usage snapshot records **1,150 chats, 43.87K messages, top-1% message volume, and 51 generated images**. Recent interactions add sustained use of Projects, Codex, uploaded repositories/documents, Voice, web research, image generation, artifacts, scheduled work, and specialized project instructions.

The highest-leverage personalization change is therefore:

> **Move from “ChatGPT follows my prompt” to “ChatGPT identifies and activates the best available resource for my prompt.”**

The ideal interface behaves less like a text box requiring command syntax and more like an intelligent task router.

---

## 1. Evaluation model

For this review:

**Coherence** means that context, instructions, sources, tone, previous decisions, interface mode, and current task all remain aligned.

**Efficacy** means that the interaction produces the intended outcome with minimal correction, repetition, prompting overhead, or unnecessary user work.

This distinction matters because a response may be individually competent while the overall interaction is inefficient.

---

# 2. Evidence-supported findings

| Dimension | Finding | Confidence | Consequence |
|---|---|---:|---|
| Context continuity | Strong when Projects/sources are deliberately configured; weaker across fragmented long chats and technical interruptions | High | Repeated restatement and recovery work |
| Instruction adherence | Usually good on explicit technical constraints, less reliable on conversational scope and response depth | High | Correction loops |
| Epistemic reliability | Significant sensitivity to unsupported personalization and inference | High | Trust degradation |
| Tool/resource activation | Considerable capability exists, but the user frequently has to explicitly request the tool or source | High | Unnecessary prompting overhead |
| Artifact production | High-value when the assistant actually produces the requested finished object | High | Major positive leverage |
| Conversational calibration | Historically inconsistent | High | Responses can become patronizing, over-interpretive, or stylistically intrusive |
| Long-workflow recoverability | Insufficiently explicit | High | State can become unclear after errors or long branches |
| Feature utilization | Broad but not systematically routed | High | Paid capabilities are used opportunistically rather than automatically |

---

# 3. The strongest positive pattern: structured workspaces work

The user's natural working model already maps unusually well to Projects: named roles, source-of-truth files, governance, specialized instructions, reusable outputs, and multiple conversations around one evolving body of work.

That is exactly what Projects are intended to support. Project instructions override global instructions, projects retain their own chats/files/context, connected-app links can become sources, and useful ChatGPT responses can themselves be saved as project sources.

This means the existing strategy behind projects such as specialized verification, repository operations, prompting, and domain modeling is fundamentally sound.

### Improvement

**Global instructions should contain behavior.  
Project instructions should contain domain authority.  
Project sources should contain evidence.  
The current prompt should contain the immediate objective.**

That separation reduces collisions between unrelated contexts.

---

# 4. The most damaging pattern: speculative personalization

One archived interaction is exceptionally diagnostic. The assistant invented a detailed explanation of why a particular conversational persona supposedly suited the user. The user estimated that **95–99% of it was hallucinated**; the assistant then admitted it had been speculative rather than grounded in authoritative information.

A different interaction shows the same broader concern: after a technical error, the user explicitly objected to inaccurate mental models and described the need to push back because conclusions could affect real-world decisions.

### UX implication

The failure is not merely factual hallucination.

It is **false coherence**: the interface sounds as though it understands the user better than the evidence warrants.

That can be more corrosive than an ordinary factual mistake because it contaminates subsequent recommendations.

### Recommended rule

Never infer durable psychological traits, motivations, deficiencies, emotional states, or life narratives merely to make an answer feel personalized.

Instead classify material as:

- **Retrieved fact**
- **User-provided fact**
- **Inference**
- **Recommendation**
- **Unknown / requires verification**

Do **not** manufacture percentage confidence scores. Source provenance is more useful than pseudo-precision.

---

# 5. Conversational calibration has caused avoidable friction

Recent interactions repeatedly show irritation when responses explain concepts the user already understands—for example, explaining ordinary project-management concepts instead of helping configure the actual system being discussed.

There is also historical evidence of a stronger boundary failure. After the user explicitly said “stop responding,” the assistant replied with a representation of silence and then continued interacting.

That is a straightforward interface-coherence defect: the model privileged maintaining conversational performance over following the user's interaction boundary.

### Recommended behavioral rules

When the user says:

- **wait / don't do anything yet** → perform no task.
- **I know that already** → stop teaching that layer immediately.
- **short / seed discussion / voice mode** → aggressively compress.
- **full artifact / complete code / definitive document** → stop summarizing and produce the object.
- **stop** → stop adding conversational flourishes.
- profanity or dark humor → interpret contextually rather than automatically converting the interaction into emotional analysis.

---

# 6. Long conversations need explicit recoverability

One archived interaction followed a technical error with the user saying they no longer knew which response had been received or where the process stood.

Given the unusually high depth and size of many current conversations, this is predictable.

### Add a lightweight checkpoint protocol

After substantial multi-step work, interruptions, errors, or major decisions, provide:

**State checkpoint**
- Objective
- Decisions locked
- Completed
- Current state
- Remaining work
- Next executable step

Do **not** append this to every ordinary answer.

Its value is recoverability, not ceremony.

---

# 7. The principal feature-utilization gap is resource routing

The existing personalization already tells ChatGPT to use tools, complete work, reduce burden, create artifacts, and act proactively.

What it does **not** define sharply enough is **which resource should activate under which conditions**.

That is the missing abstraction.

## Recommended routing policy

### Chat
Use for discussion, quick analysis, conceptual work, brainstorming, and bounded questions.

### Work
Use for longer multi-step execution and finished deliverables—documents, spreadsheets, presentations, reports, and other involved artifacts. OpenAI currently positions Work specifically as the longer-running execution surface, separate from ordinary Chat and Codex.

This is one of the highest-value changes available for this workflow: many requests currently pushed through enormous ordinary chat threads are structurally **Work tasks**.

### Codex
Use when the outcome is actual software engineering: inspecting repositories, writing/debugging code, running tests or commands, reviewing changes, or shipping implementation.

### Web Search
Automatically use for current, unstable, niche, or externally verifiable claims.

### Deep Research
Escalate when the question requires aggregation across multiple sources, reconciliation, a literature/market/repository investigation, or a durable cited report.

Deep Research can work across the public web, uploaded files, selected websites, and supported connected apps; its research plan can be reviewed and redirected while it runs.

This is particularly well matched to repository comparisons, product research, architecture precedent research, competitive reviews, and evidence-heavy evaluations.

### File Library
Before asking for a document that may already exist, search the Library.

Plus currently receives **20 GB of Library storage**, and uploaded/created files can be found and reused from later conversations. Connected Google Drive material can also be surfaced there.

Given the repeated re-uploading and reuse of governance files, repo exports, screenshots, prompts, and reference documents, Library should become a default retrieval layer rather than an afterthought.

### Connected Apps
When the answer depends on the user's own Gmail, Calendar, Drive, GitHub, or other connected data, retrieve it rather than asking the user to manually reproduce it.

Apps can search/retrieve information, participate in Deep Research, sync some sources, expose rich UI, and—where supported—perform write actions. Permission controls determine when approval is required.

Important current limitation: **Voice does not support apps.**

### Scheduled Tasks
Use for future reminders, recurring briefings, and monitoring for meaningful changes.

Plus currently supports up to **five active Scheduled Tasks**; monitoring tasks can remember previous checks and alert only when something worth reporting changes. Tasks cannot access project files, so a scheduled workflow should not depend on information available only through those files.

### Data Analysis
Automatically prefer the analytical tool path for datasets, CSVs, quantitative comparisons, statistical questions, or chart-ready information rather than attempting arithmetic or tabular analysis purely in prose.

### Image generation / visual responses
Use when the desired output is itself visual or when a visual design exploration would materially improve a UI/UX discussion—not merely because images are available.

---

# 8. Project memory should be selected intentionally

Current Projects allow switching between **default memory** and **project-only memory**. Project-only memory prevents chats in that project from drawing on outside conversations and prevents outside conversations from drawing from the project.

There is an important current tradeoff:

**ChatGPT Work is unavailable inside a project using project-only memory.**

Therefore:

| Project type | Recommended memory |
|---|---|
| Narrow verifier / audit / legal-like boundary / isolated specialist | Project-only |
| Execution-heavy project where Work should create substantial artifacts | Default |
| General personal workspace benefiting from broader memory | Default |
| Project where cross-domain personalization would contaminate decisions | Project-only |

This should be a deliberate architectural decision rather than a universal preference.

---

# 9. Personalization settings

The current selected personality is **Professional**.

**Recommendation: keep it.**

The recurring problems are not that responses are insufficiently quirky or insufficiently terse. They are scope control, tool routing, unsupported inference, and completion discipline. Changing personality would attack the wrong layer.

If **Characteristics** are present on the account, OpenAI now allows finer adjustments to brevity, formatting, tone, emoji usage, and related response properties.

Recommended direction:

- structured formatting: **more**
- emoji: **less**
- brevity: **slightly more, not maximum**
- warmth: **neutral to slightly more**
- enthusiasm: **neutral**
- professional/direct tone: preserve

Project instructions should remain authoritative where a specific mode needs more humor, more severity, terse Voice behavior, or a specialized professional role.

---

# 10. Global instructions should become smaller and more operational

Plus currently allows up to **5,000 characters** of Custom Instructions.

The existing instructions contain strong principles, but they mix:

- behavioral expectations
- artifact standards
- expertise assumptions
- tool policy
- style guidance
- workflow philosophy

The best revision is not to add more prose.

It is to make them function like a **routing and execution policy**.

---

# 11. Highest-priority changes

## Priority 1 — Resource activation policy
Tell ChatGPT explicitly when to use Search, Library, Apps, Deep Research, Work, Codex, Data Analysis, Images, and Scheduled Tasks.

**Expected effect:** fewer prompts spent telling the assistant how to help.

## Priority 2 — Epistemic contract
Require retrieved facts, user facts, inference, and recommendations to remain distinguishable.

**Expected effect:** materially lower risk of false personalization and recommendation cascades.

## Priority 3 — Scope calibration
Require the model to infer the user's demonstrated expertise from the current conversation and avoid introductory explanations unless needed.

**Expected effect:** lower irritation and shorter correction cycles.

## Priority 4 — Artifact completion
When a reusable artifact is clearly the goal, produce it rather than describing one.

**Expected effect:** greater tangible value per interaction.

## Priority 5 — Recovery checkpoints
Use concise state summaries at transition/error boundaries.

**Expected effect:** much better resilience in long-running work.

## Priority 6 — Better Project architecture
Use project instructions for domain behavior and sources for authoritative facts. Save exceptionally useful outputs back into the project.

**Expected effect:** increasingly valuable Projects instead of increasingly long chats.

---

# 12. Overall assessment

The user is already operating ChatGPT much closer to a **personal computing environment** than to a chatbot.

The current interface succeeds when it behaves accordingly: persistent context, source-backed reasoning, specialization, repository access, artifact production, and tool execution.

It fails when it falls back to the conversational-chatbot default:

- inventing a plausible interpretation,
- explaining instead of doing,
- teaching before determining whether teaching is needed,
- requiring manual tool activation,
- over-personalizing,
- or losing operational state across a long conversation.

The best next configuration is therefore not “more personality.”

It is an **execution substrate with explicit routing, provenance, scope control, and completion semantics**.