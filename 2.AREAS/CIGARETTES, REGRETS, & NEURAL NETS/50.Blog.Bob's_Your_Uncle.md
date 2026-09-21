# Codependent Coding

> [!truth] Source of Truth
> Software has always been easier to write than to understand.

We have spent decades inventing languages, frameworks, methodologies, tools, and abstractions intended to make software development more manageable. Some succeeded. Some merely gave us new names for old problems. And some gave us remarkably sophisticated ways to avoid writing the software.

The essential problem has remained stubbornly familiar.

We must decide what the system is supposed to do. We must understand the domain in which it operates. We must divide responsibilities carefully. We must establish boundaries. We must define the contracts across those boundaries. We must constrain behavior so that the important things remain true. And eventually, after all the diagrams and specifications and arguments are finished, we must write something that works.

Codependent Coding begins with that problem, but encounters it in a peculiar moment in the history of our profession.

The programmer is no longer necessarily the entity typing the program.

An individual developer can now describe a system to an artificial agent and receive thousands of lines of plausible implementation in return. This is enormously powerful. It is also enormously dangerous.

When producing code becomes inexpensive, deciding what code ought to exist becomes more important, not less.

	Architecture matters more.
	Boundaries matter more.
	Names matter more.
	Contracts matter more.
	Tests matter more.
	And human intent matters most of all.

The interesting proposition behind Codependent Coding is therefore not that artificial intelligence can write software. We already know that it can.

The proposition is that software development in an agentic world requires us to become considerably more deliberate about the systems surrounding the production of code.

An agent must know what exists in the domain. It must understand what those things mean. It must know which responsibilities belong together and which must remain separate. It must know which dependencies are permitted, which invariants may never be violated, which source is authoritative, and what evidence is sufficient before declaring its work complete.

In other words, the solution to unreliable automated programming is not a sufficiently clever prompt.

## It is discipline.

This explains some of the unusual vocabulary encountered in these pages.

- Ontology asks what exists.
- Epistemology asks what we are justified in claiming to know.
- Mereology asks what constitutes what.
- Topology asks how those constituents are connected.
- Semantics asks what our representations mean.
- Provenance asks where our knowledge came from.

These are not replacements for the familiar language of software development. We still need requirements, specifications, interfaces, modules, tests, repositories, commits, pull requests, and deployments.

Rather, these concepts expose questions that were always hiding underneath them.

A well-designed system has responsibilities. Those responsibilities are realized by modules. Modules expose interfaces. Interfaces are governed by contracts. Boundaries separate concerns. Constraints and invariants limit behavior. Patterns provide repeatable implementations.

And none of these abstractions excuse us from the final obligation:

## Build the damn thing

That may be the most important constraint in this entire system.

Architecture exists to make change safer and understanding easier. Governance exists to preserve intent. Documentation exists to preserve knowledge. Tests exist to provide evidence. None should become elaborate procedural representations of confidence that replace the simpler act of implementing something directly, verifying that it works, putting it in front of reality, and learning from what happens.

There is an old temptation in software development to mistake sophistication for quality.
Codependent Coding occasionally gives that temptation some spectacularly pretentious names.
At least it has the decency to make fun of itself while doing so.
Behind the terminology, however, is a serious idea.

A single person equipped with artificial agents can now command an amount of implementation capacity that once required a team. But implementation capacity without organization produces chaos faster. The limiting factor increasingly becomes the human ability to preserve intent, structure knowledge, assign responsibility, constrain behavior, evaluate evidence, and decide what should happen next.

	That changes the job.

Perhaps the developer of this new era is not principally the person who writes every function.
Perhaps the developer increasingly designs the environment in which correct functions can be produced.


> [!decision] Decision
> If so, clean code still matters.
> 
> SOLID principles still matter.
> 
> Separation of concerns still matters.
> 
> Tests still matter.
> 
> Professional discipline still matters.
> 
> The tools have changed.
> 
> The responsibility has not.

And eventually, after the ontology has been modeled, the architecture constituted, the contracts written, the agents instructed, the evidence gathered, the knowledge graph updated, and somebody has finally determined what the hell an **Anthimeria** is supposed to be—

**ship it.**