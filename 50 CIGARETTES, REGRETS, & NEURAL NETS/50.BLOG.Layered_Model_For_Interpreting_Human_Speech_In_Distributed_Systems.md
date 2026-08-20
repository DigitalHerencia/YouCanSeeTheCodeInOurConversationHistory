## **Abstract**

Human communication is commonly treated as a direct transmission of meaning.  
In practice, it behaves more like a multi-layer protocol stack operating over unreliable media, with significant ambiguity introduced at each stage.

This document outlines a seven-layer model—loosely analogous to the OSI stack—for how spoken language is received, transformed, and acted upon in human systems.

---

## **Layer 1 — Physical**

Transmission medium:

- pressure waves in air
    
- photons on a screen
    
- electrical signals from a notification device
    

At this layer, the system handles:

- amplitude
    
- frequency
    
- signal integrity
    

No semantic information is present.  
Two statements with opposite intent can be physically indistinguishable.

Example:

A parent calling your full name from another room.  
No content. Still triggers immediate escalation.

---

## **Layer 2 — Data Link**

Signal gating and prioritization.

The receiver decides:

- whether to attend
    
- whether to suppress competing inputs
    
- whether the signal is worth processing
    

Examples:

- ignoring dozens of messages, noticing one instantly
    
- hearing your name in a crowded room
    
- reacting to a tone before processing words
    

The system has now established:

> this signal matters

Still no interpretation.

---

## **Layer 3 — Network**

Segmentation into recognizable units.

The system maps raw signal into:

- phonemes
    
- words
    
- short phrases
    

Examples:

- “we should talk”
    
- “it’s fine”
    
- “ship it”
    

At this layer, routing decisions are made based on familiarity, not intent.

Ambiguity remains high.  
Known phrases are often overloaded with multiple meanings.

---

## **Layer 4 — Transport**

Sequencing and short-term buffering.

Responsibilities include:

- maintaining word order
    
- preserving sentence structure
    
- holding context long enough to complete parsing
    

Failure cases:

- responding to partial input
    
- misremembering what was said seconds earlier
    
- dropping qualifiers (“don’t”, “unless”, “later”)
    

Example:

A teammate says:

> “Don’t merge that until after the migration.”

The “don’t” is dropped in transit.  
The merge proceeds.

---

## **Layer 5 — Session**

Interaction context negotiation.

The system establishes:

- relationship between participants
    
- expected tone
    
- conversational mode
    

Examples:

- casual vs formal
    
- joking vs serious
    
- supportive vs adversarial
    

Identical inputs yield different interpretations depending on session state.

Example:

“Interesting.”

- In a code review: concern
    
- In a family conversation: polite acknowledgment
    
- In a relationship: problem detected
    

---

## **Layer 6 — Presentation**

Semantic transformation.

Incoming sequences are mapped to internal representations using:

- prior experience
    
- cultural context
    
- current emotional state
    

Examples:

- “I’m fine” → state unresolved
    
- “do what you want” → constrained choice set
    
- “we’ll circle back” → deferred indefinitely
    

At this stage, meaning is constructed, not recovered.

Different systems will produce different outputs from identical inputs.

---

## **Layer 7 — Application**

Behavioral integration.

The interpreted signal is:

- incorporated into belief structures
    
- assigned emotional weight
    
- used to generate action
    

Examples:

- defensive response
    
- agreement without understanding
    
- long-term reinterpretation of the interaction
    

At this layer, the system commits.

---

## **Observations**

1. **No layer guarantees correctness**  
    Each stage introduces transformation and potential loss.
    
2. **Errors compound upward**  
    Early ambiguity becomes confident interpretation.
    
3. **Layer boundaries are implicit**  
    Systems assume shared progression through the stack.
    
4. **Divergence is normal**  
    Identical input does not imply identical output.
    

---

## **Example: End-to-End Failure**

Input:

> “We should revisit this.”

Layer progression:

- Physical: signal received
    
- Data Link: flagged as relevant
    
- Network: parsed as known phrase
    
- Transport: preserved correctly
    
- Session: interpreted as critique
    
- Presentation: mapped to negative evaluation
    
- Application: triggers defensive response
    

Sender intent:

> schedule follow-up

Receiver action:

> argument initiated

---

## **Implications for Software Development**

- Communication errors are not anomalies; they are expected behavior
    
- “Clear” language does not bypass the stack
    
- Alignment requires verification at the application layer
    

Practical mitigation:

- restate intent explicitly
    
- confirm interpretation before acting
    
- assume partial failure in all transmissions
    

---

## **On Predictive Systems**

If a language model predicts the next token based on prior context:

Human systems predict:

- intent
    
- tone
    
- implication
    

using similarly incomplete information.

The primary difference is not mechanism, but:

- confidence
    
- emotional coupling
    
- downstream consequence
    

---

## **Conclusion**

Human communication does not transmit meaning.

It transmits signal, which is:

> incrementally transformed into interpretation through layered inference

Systems that assume direct meaning transfer will exhibit consistent failure under load.

Systems that acknowledge the stack can:

- reduce ambiguity
    
- improve coordination
    
- avoid unnecessary escalation
    

---

No call to action.  
No summary.

Just a model.

Use it or don’t.