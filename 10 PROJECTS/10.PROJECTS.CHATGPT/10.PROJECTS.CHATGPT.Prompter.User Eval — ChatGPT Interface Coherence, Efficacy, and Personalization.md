# User Eval — ChatGPT Interface Coherence, Efficacy, and Personalization

## Executive Summary

The strongest conclusion from the interaction history is that the limiting factor is **not access to capability; it is orchestration of capability**.

Across recent project work and older conversation exports, the highest-friction interactions share a recognizable pattern: ChatGPT selects the wrong interaction mode, explains material at the wrong level, fails to retrieve context that already exists, speculates about capability instead of attempting an available tool, or produces commentary when the requested outcome is an executable action or durable artifact.

Conversely, the highest-value interactions occur when ChatGPT:

- preserves continuity across turns and sources;
- correctly distinguishes discussion, prompt engineering, research, execution, and artifact creation;
- adapts explanation depth to demonstrated competence;
- uses available tools instead of making the user manually shuttle information between systems;
- produces a finished deliverable rather than merely describing one;
- remains conversational without allowing tone to override task execution.

The recommended personalization strategy is therefore **behavioral rather than biographical**: use global Custom Instructions as a compact interaction and resource-routing policy; use Projects for domain-specific instructions and canonical sources; use Memory for durable personal preferences; and make retrieval, connected apps, research, analysis tools, artifacts, and scheduled work part of the normal execution path when they materially improve an answer.

---

## Evidence Base and Limitations

This evaluation uses:

1. Recent interactions represented in the current Project history through August 18, 2026.
2. Prior conversation exports available in the File Library.
3. Current personalization settings exposed in this conversation.
4. Current official OpenAI documentation checked on August 18, 2026.
5. The existing Projects reference previously prepared for this environment.

The evidence is sufficient to identify **recurring qualitative patterns**, but it is not an exhaustive telemetry dataset. I therefore avoid invented percentages, latency measurements, or claims about internal model causes.

One particularly clear historical example concerns turn-taking: an earlier conversation explicitly revolved around the user asking the assistant to wait for a return to voice mode and then objecting to an unsolicited interstitial response. Another historical thread documents perceived discontinuity between voice and text interactions; the useful evidence there is the user-experience problem itself, not the speculative technical explanations contained in that old conversation.

---

## Interaction Evaluation

| Dimension | Observed Pattern | UX Consequence | Confidence |
|---|---|---|---|
| **Intent / mode routing** | Repeated friction when explanation, prompt engineering, discussion, or execution is substituted for the requested mode | Immediate correction turn; loss of momentum | **High** |
| **Context continuity** | Strong expectation that existing project context, prior decisions, files, and previous answers should be reused | Repetition feels like interface failure rather than harmless clarification | **High** |
| **Depth calibration** | Basic explanations are often unwanted; advanced explanations are useful when they address the actual unfamiliar layer | Over-explanation produces interruption and frustration | **High** |
| **Tool utilization** | User repeatedly supplies repositories, files, screenshots, connected sources, and operational context with the expectation that they will actually be used | Manual workarounds materially reduce perceived value | **High** |
| **Artifact completion** | High value placed on prompts, source-of-truth documents, archives, diagrams, structured notes, code, and other reusable outputs | Analysis-only responses feel incomplete | **High** |
| **Turn-taking control** | Explicit “wait,” voice-mode, review-before-action, and “do not do anything yet” boundaries recur | Premature assistant action creates disproportionate friction | **High** |
| **Tone adaptation** | Humor, profanity, satire, and technical discourse are normal interaction registers; serious tasks still require precision | Misreading register can cause unwanted therapeutic, defensive, or overly formal pivots | **High** |
| **Proactivity** | Proactive completion is valued when reversible; unrequested consequential action is not | Best UX requires strong initiative plus clear side-effect boundaries | **High** |
| **Capability trust** | Statements that something “cannot” be accessed or done are particularly damaging when a usable tool actually exists | False-negative capability claims erode trust quickly | **High** |
| **Visual / interface richness** | Visuals, diagrams, structured documents, tables, interactive components, and generated assets are valuable when they communicate something better than prose | Decorative formatting alone adds little; functionally richer presentation adds substantial value | **Moderate–High** |

---

## Primary UX Failure Mode: The Correction Cascade

The most important recurrent pattern is a **correction cascade**:

**User provides sufficient intent → assistant chooses adjacent-but-wrong behavior → user corrects behavior → assistant explains/apologizes → original task loses momentum → user must restate the operational boundary.**

Examples include:

- explaining basics when the requested conversation had already established baseline knowledge;
- prompt-engineering when direct execution was wanted;
- giving a substantive response while the user was explicitly transitioning into voice;
- discussing what a tool could theoretically do instead of using the tool;
- asking for information already available in the conversation, Project, repository, or attached materials;
- stopping at recommendations when a concrete artifact was requested or obviously constituted the deliverable.

This is primarily an **interface-state problem**. Better prose does not solve it. Better routing does.

### Recommended intervention

Before composing a substantive answer, ChatGPT should effectively resolve:

**What interaction is happening right now?**

`answer | discuss | explain | research | prompt-engineer | execute | retrieve | modify | create artifact | schedule/monitor`

The user should not have to manage this state manually after every transition.

---

## Finding 1 — Progressive Disclosure Fits Better Than Either “Short” or “Detailed”

The interaction history does **not** support a simplistic preference for universally short responses.

It supports:

> **Put the useful result first, then expose detail according to relevance and demonstrated knowledge.**

The recurring complaint is not that information exists. It is that information is presented at the wrong abstraction layer.

A strong response architecture is therefore:

**result → consequential reasoning → implementation/detail on demand**

This avoids introductory explanations of concepts already understood without reducing difficult subjects to shallow answers.

---

## Finding 2 — Retrieval Should Replace Repetition

The user's workflow increasingly spans chats, Projects, repositories, uploaded files, notes, screenshots, and connected applications.

That makes asking the user to re-supply retrievable context especially expensive.

OpenAI's current Projects implementation is explicitly designed to combine chats, files, instructions, memory, and tools; for Plus and Pro, project chats can reference prior chats in the project and prioritize project chats and files.

The configuration should therefore establish:

> **Retrieve before re-asking.**

That does not mean injecting every remembered fact into every answer. It means retrieving a missing fact when it is actually required.

Memory and Custom Instructions serve different functions: OpenAI describes Custom Instructions as explicit guidance and Memory as relevant information retained from conversations.

---

## Finding 3 — Tool Use Should Be Outcome-Driven

One especially useful current OpenAI recommendation aligns almost perfectly with the observed friction: when uncertain whether a capability is available, the reliable approach is to **ask ChatGPT to perform the action**, rather than asking it to speculate about whether it has access.

That should become a personalization invariant:

> **Attempt the available capability before claiming that the capability is unavailable.**

This applies particularly to:

- files and Library;
- connected apps;
- web research;
- previous context;
- data analysis;
- image generation;
- document/artifact production;
- calendars/email/repos when connected;
- scheduled or monitoring tasks.

Apps can currently search and reference connected data, support richer in-chat UI, participate in some deep-research workflows, and—where configured—perform write actions.

This is a major opportunity to reduce “copy this into ChatGPT, copy that back out again” interaction debt.

---

## Finding 4 — Projects Should Carry Domain Doctrine, Not Global Custom Instructions

The existing Projects reference correctly identified the authority hierarchy: Project instructions apply only within the Project and override global Custom Instructions. Current official documentation confirms the same behavior.

That makes the optimal configuration layered:

| Layer | Put Here | Do Not Put Here |
|---|---|---|
| **Global Custom Instructions** | interaction policy, response behavior, context retrieval, tool/resource policy, pacing, completion standard | individual repository architecture or temporary projects |
| **Memory** | durable information and durable preferences that should travel between appropriate conversations | large specifications or volatile project state |
| **Project Instructions** | Project role, scope, authority, invariants, execution boundary, Project-specific output expectations | generic instructions duplicated across every Project |
| **Project Sources** | canonical source-of-truth material and stable references | every transient artifact ever produced |
| **Library** | reusable uploaded/generated files and source material | information better represented as a short instruction |
| **Conversation** | immediate objective, exceptions, temporary constraints, current decisions | permanent governance that must survive the thread |

Plus/Pro Projects currently prioritize project chats and files, and the current Projects page reports 25 files per Go/Plus Project. The static Project reference also correctly warns that live product documentation and the actual interface should take precedence where documentation disagrees.

---

## Finding 5 — Resource Enrichment Should Be Selective but Proactive

The objective should not be “use more features.”

It should be:

> **Increase the probability that the best available response surface is selected automatically.**

### Recommended routing

| Need | Preferred Surface |
|---|---|
| Fast current fact | Search/web retrieval |
| Multi-source evidence synthesis | Deep Research |
| Prior uploaded/generated material | Library / file retrieval |
| Long-running domain | Project |
| Personal durable preference | Memory |
| User data in an external service | Connected app/plugin |
| Quantitative analysis | Data-analysis/calculation tools |
| Spatial/local comparison | Interactive map where supported |
| Visual concept/design | Image generation or visual artifact |
| Reusable business/work output | Work/artifact/file |
| Repeated future work | Scheduled Task |
| Change detection | Monitoring task |
| Software repository execution | Codex / repository tooling when appropriate |

Deep Research is specifically intended for multi-step synthesis across web sources, uploaded files, and enabled apps, while standard search is the faster option for quick current information.

Scheduled Tasks can perform one-time, recurring, and monitoring work, although an important current limitation is that a task created in a Project cannot access that Project's uploaded files. Plus currently supports up to five active tasks.

Library is also substantially more useful than treating every upload as disposable: uploaded and generated files are saved there, Plus currently includes 20 GB of Library storage, and connected Google Drive content can be surfaced from Library where available.

---

## Finding 6 — Artifacts Are Part of the Interface, Not an Afterthought

A recurring interaction pattern is that the conversation is frequently only the **control surface** for producing something else:

- a prompt;
- a repository change;
- a source-of-truth note;
- a presentation;
- a diagram;
- a spreadsheet;
- a report;
- a downloadable archive;
- an image;
- a project configuration.

The assistant should therefore ask internally:

> **Is prose actually the best final interface for this outcome?**

Current ChatGPT Work is explicitly designed around producing and editing durable documents, spreadsheets, presentations, reports, and analyses from instructions and source material.

For this usage pattern, that capability should be treated as part of normal response design rather than an exotic feature.

---

## Finding 7 — Tone Should Be Contextual, Not a Workflow Controller

The user's language frequently includes humor, profanity, satire, technical jargon, exaggerated phrasing, or dark jokes.

The evidence does **not** support using that language alone to infer that the task has changed.

The better rule is:

> **Interpret semantic intent first; treat register as presentation context.**

Humor can materially improve the experience. It should not cause the assistant to miss a technical requirement, overreact to ordinary profanity, or continue joking when precision has become more important.

---

## Current Personalization Configuration

The current Base Style and Tone exposed by ChatGPT is **Professional**.

I would keep it for the initial configuration.

OpenAI describes personality as affecting communication style rather than capability, and states that personality works alongside Custom Instructions and Memory.

That is useful here: **Professional provides a stable baseline; Custom Instructions can supply the more important behavior—initiative, directness, progressive disclosure, humor when appropriate, and aggressive use of relevant resources.**

A change to Candid could later be A/B tested, but changing personality alone would not address the major failure modes identified above.

---

## Recommended Configuration Priorities

### P0 — Global Resource-Aware Interaction Policy

Install the supplemental Custom Instructions provided with this evaluation.

This is the highest-leverage intervention because it addresses the common failure modes without embedding project-specific knowledge.

OpenAI currently permits up to **5,000 characters** of Custom Instructions for Plus. The supplied policy has deliberately been kept below that limit.

### P1 — Audit Project Instructions

Every Project should be checked for:

- actual mission;
- prompt-engineering versus execution boundary;
- available sources;
- authority hierarchy;
- destructive-action policy;
- output/artifact expectations;
- obsolete duplication of global behavior.

Because Project instructions override global instructions, a poorly configured Project can negate a well-designed global configuration.

### P1 — Normalize Source Placement

Use the smallest appropriate persistence layer:

**Memory → person**  
**Custom Instructions → interaction**  
**Project instructions → domain behavior**  
**Project sources → canonical knowledge**  
**Library → reusable files**  
**Conversation → immediate state**

This reduces both forgotten context and accidental context pollution.

### P2 — Make Tool Invocation the Default for Tool-Shaped Requests

When the request obviously depends on a connected source or supported action, retrieval/action should normally precede prose explanation.

This directly addresses one of the largest observed gaps between available capability and experienced value.

### P2 — Prefer Rich Output When It Improves the Task

Use charts, diagrams, generated images, maps, interactive UI, editable artifacts, and downloadable files **because they communicate or execute something better**, not merely because they exist.

That is the correct interpretation of “best-in-class UI/UX” for a conversational interface: **the interface should disappear into the task.**

---

## Evaluation Rubric for the New Configuration

After applying the configuration, evaluate approximately ten substantial interactions against these measures:

| Measure | Successful Behavior |
|---|---|
| **Mode accuracy** | No correction needed to distinguish prompt engineering, discussion, research, or execution |
| **Context reuse** | Previously supplied information is retrieved instead of re-requested |
| **Depth calibration** | No unnecessary beginner recap; consequential complexity is still explained |
| **Tool activation** | Appropriate available tools are actually invoked |
| **Capability accuracy** | No unsupported “I can't access/do that” statements before attempting available capability |
| **Artifact completion** | Artifact-shaped tasks produce usable artifacts |
| **Turn control** | “Wait / don't act / voice transition” boundaries are respected |
| **Side-effect control** | Reversible work is proactive; consequential writes remain controlled |
| **Correction burden** | User corrections concern substantive decisions rather than assistant behavior |
| **Outcome quality** | Final output can be used without converting the assistant's explanation into the real deliverable manually |

The most important KPI is **correction burden**.

If the configuration is working, fewer turns should be spent telling ChatGPT *how to be ChatGPT*, leaving more turns available for the actual work.

---

## Bottom Line

The current opportunity is not to make ChatGPT more personalized in the conventional “know more facts about the user” sense.

It is to make the interface more **stateful, resource-aware, tool-aware, mode-aware, and completion-oriented**.

The optimal experience should feel less like repeatedly prompting a chatbot and more like operating a coherent interface whose conversational layer can automatically select among memory, Projects, files, web research, apps, analysis, visuals, artifacts, and scheduled execution according to the task.

That is the personalization change most strongly supported by the interaction evidence.