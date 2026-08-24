# Folder Nomenclature and Information Architecture

## Primary classifier

```text
primary responsibility → role folder
project/product         → workspace property
reusable doctrine       → system property
domain/layer/surface    → facets
semantic dependency     → typed relationship
```

## Prefix grammar

### `.name`
Machine-readable deterministic representation: contracts, schemas, registries, state, validation.

### `Name`
Human-readable durable knowledge.

### `_name`
Operational/interface/support assets: templates, Bases, scripts, mounts, CSS, media.

Machine-readable does **not** mean epistemically superior.

## Namespace

Stable semantic identity:

```text
<system>.<role>.<domain-or-artifact>.<kind>
```

Examples:

```text
codependent.execution.application-workflow.pattern
codependent.vibes.webapp-architecture.source-document
devnotes.prompter.interproject-handoff.contract
```

Moving a file should not redefine its semantic identity.

## Two navigation axes

### Responsibility
Role folders.

### Objective
Workspace views in Hearth/Bases.

The user should not need to remember the physical path to work on a project.
