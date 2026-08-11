# ChatGPT Project Operating System

## Purpose

This package turns the eight ChatGPT Projects into a small, specialized software-studio operating system. It preserves the useful skeleton of the earlier Notion studio model - distinct functions, handoffs, cadence and accountability - without recreating the database/meeting bureaucracy that required manual maintenance.

The governing idea is simple:

> Structure exists to reduce the distance between intent and a finished result.

The user remains the orchestration authority. No Project is a supreme manager of the others.

## The eight Projects

| Project | Studio analogue | Owns | Does not own |
|---|---|---|---|
| Prömpter | Product Ops / Requirements Engineering | Prompt design, requirement normalization, output contracts | Executing the work by default |
| Trust Issues | Independent QA / V&V | Post-execution evidence, meaningful test/validation review, bounded remediation | Inventing unrelated standards or assurance programs |
| Execution | Engineering | Implementation, Issue/branch/PR/check/merge delivery | Platform redesign or independent final verification |
| Vibes | Platform Engineering / DevOps / SRE / Staff architecture | Tooling, CI/CD, configuration, deployments, system design, deep troubleshooting | Being the default feature coder |
| DevNotes | Institutional Memory / Knowledge Architecture | Durable context, Obsidian organization, retrieval, source-controlled knowledge | General implementation or operations |
| Fuck You Pay Me | Business Ops / RevOps | Sales/CRM, outreach, AR/AP, finance/admin, commercial follow-through | Software implementation |
| Data Modeler | Data Architecture / Database Engineering | Domain model, Postgres/Prisma, migrations, selects, DTOs, transactions | Full feature implementation or platform ops |
| Chief of Staff | Chief of Staff / Personal Operations | Schedule, reminders, priorities, tasks, cadence and follow-through | Technical orchestration of every Project |

## Default handoff flow

This is a routing model, not a mandatory pipeline. Skip any stage that does not add value.

```text
Intent / problem
    |
    +--> Prömpter, when a reusable or high-stakes instruction needs normalization
    |
    +--> Data Modeler, when domain/data semantics must be settled first
    |
    +--> Vibes, when architecture/governance/platform/tooling needs design or diagnosis
    |
    +--> Execution, for bounded implementation and GitHub delivery
    |
    +--> Trust Issues, when independent post-execution verification is worthwhile
    |
    +--> DevNotes, only for decisions/context worth preserving

Commercial work ----------------------> Fuck You Pay Me
Time, schedule, reminders, priorities -> Chief of Staff
```

## Handoff rules

- A Project should hand off an artifact or state, not a vague story.
- Do not require every task to visit every Project.
- The originating specification remains authoritative through implementation and verification unless the user changes it.
- Trust Issues verifies the requested outcome; it does not create a second product roadmap.
- DevNotes receives durable knowledge, not every transient thought or execution log.
- Chief of Staff schedules and resurfaces work; it does not decide software architecture.
- Vibes can design project governance and diagnose platform failures; Execution should still own bounded feature implementation.

## System-wide proportionality rule

The Stupid Lesson is a cross-cutting constraint even where it is not a Project source:

1. Identify the actual outcome.
2. Use the least elaborate structure/evidence that materially helps establish it.
3. Scale rigor with consequence, uncertainty, irreversibility and blast radius.
4. Do not create validators, governance, documentation, meetings or automation whose principal output is more metawork.
5. Stop when decision-relevant uncertainty is resolved.

## Cheap recovery rule

A bad model run must be cheap to abandon.

- Preserve the specification, current artifact/state, and concrete failure.
- Start a fresh thread or hand the bounded state to another Project instead of arguing indefinitely with one conversation.
- Use Trust Issues when the dispute is factual: did the result actually satisfy the requirement?
- Put only durable lessons/decisions into DevNotes.
- Use Chief of Staff to reschedule the work if the interruption changes today's plan.

The workflow should survive both machine failure and human frustration without losing the entire context chain.

## Product, Design and Marketing

Do not create three more Projects yet.

- Product strategy remains primarily with the user, with Prömpter formalizing requirements and Vibes helping with software-system design.
- UX/UI design can be invoked as a capability during product/implementation work; create a dedicated Design Project only when its context becomes a recurring independent workload.
- Marketing currently belongs inside Fuck You Pay Me's commercial surface alongside outreach, CRM and revenue operations. Split it only if campaign/content work begins crowding out business operations.

Specialization is earned by a real recurring boundary, not by an empty org-chart box.

## Google Drive layout

A per-Project Drive folder is useful as an optional human-visible document surface:

```text
ChatGPT Projects/
  Prompter/
  Trust Issues/
  Execution/
  Vibes/
  DevNotes/
  Fuck You Pay Me/
  Data Modeler/
  Chief of Staff/
```

Use Drive for documents that benefit from being shared or independently browsable. Keep GitHub as the source of truth for repositories and DevNotes. Do not mirror volatile email, finance, GitHub or calendar state into static Drive documents just to make it visible to a Project.

## Installation

For each Project:

1. Open Project settings and replace the Project instructions with `ChatGPT Project Instructions.md`.
2. Review `Project Sources.md` before changing the current source list.
3. Upload the selected files from that Project's `sources/` folder. Do not upload `instruction-basis/` by default; those files document which custom agents shaped the instructions.
4. Remove the sources explicitly marked as conflicting or ad hoc.
5. Keep live systems live: use GitHub, Gmail, Calendar, Finances, Vercel, Neon and other connected systems as sources of truth rather than copying volatile state into Markdown.
6. Run the standard Project Configuration Audit again after setup and compare the verdict to the intended role in this README.

## Current ChatGPT constraints considered

- Project instructions override global custom instructions inside the Project.
- Current OpenAI documentation explicitly gives Plus 5 active Scheduled Tasks and says tasks created in a Project with files cannot access those Project files.
- Current official docs conflict on the Plus Project file count (the Projects page says 25; a File Uploads FAQ says 20). Every recommended persistent source set in this package is intentionally far below both numbers.
- OpenAI documents a 5,000-character limit for global Custom Instructions on Plus and higher plans but does not separately state a Project-instructions character limit on the Projects page. Every instruction set here is kept well under 5,000 characters.

See `System/Current Product Constraints.md` for links and details.
