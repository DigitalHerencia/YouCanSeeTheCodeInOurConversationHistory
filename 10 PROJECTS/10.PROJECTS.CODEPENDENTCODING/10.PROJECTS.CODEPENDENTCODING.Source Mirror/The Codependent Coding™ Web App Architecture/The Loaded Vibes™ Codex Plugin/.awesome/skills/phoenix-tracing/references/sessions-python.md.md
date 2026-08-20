---
title: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\sessions-python.md'
type: source-document
scope: project
project: 'Codependent Coding'
domain: source
artifact: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\sessions-python.md'
kind: source-document
namespace: 'codependentcoding.source.the-loaded-vibes-codex-plugin.awesome.skills.phoenix-tracing.references.sessions-python.md'
status: active
authority: reference
parent:
depends_on: []
supersedes: []
tags:
  - projects/codependent-coding
  - source/mirror
  - source/the-loaded-vibes-codex-plugin
created: 2026-08-18
updated: 2026-08-18
source_path: 'The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\sessions-python.md'
source_file: 'sessions-python.md'
source_sha256: '2c95884e5c9e73b893177ef9ee3e30cc5196155d52d75ccfd2ca0bc6a0d54e51'
generated: true
---

# `sessions-python.md`

> [!info] Generated source mirror
> Original path: `The Loaded Vibes™ Codex Plugin\.awesome\skills\phoenix-tracing\references\sessions-python.md`
> SHA-256: `2c95884e5c9e73b893177ef9ee3e30cc5196155d52d75ccfd2ca0bc6a0d54e51`

````markdown
# Sessions (Python)

Track multi-turn conversations by grouping traces with session IDs.

## Setup

```python
from phoenix.otel import using_session

with using_session(session_id="user_123_conv_456"):
    response = llm.invoke(prompt)
```

## Best Practices

**Bad: Only parent span gets session ID**

```python
from phoenix.otel import SpanAttributes
from opentelemetry import trace

span = trace.get_current_span()
span.set_attribute(SpanAttributes.SESSION_ID, session_id)
response = client.chat.completions.create(...)
```

**Good: All child spans inherit session ID**

```python
with using_session(session_id):
    response = client.chat.completions.create(...)
    result = my_custom_function()
```

**Why:** `using_session()` propagates session ID to all nested spans automatically.

## Session ID Patterns

```python
import uuid

session_id = str(uuid.uuid4())
session_id = f"user_{user_id}_conv_{conversation_id}"
session_id = f"debug_{timestamp}"
```

Good: `str(uuid.uuid4())`, `"user_123_conv_456"`
Bad: `"session_1"`, `"test"`, empty string

## Multi-Turn Chatbot Example

```python
import uuid
from phoenix.otel import using_session

session_id = str(uuid.uuid4())
messages = []

def send_message(user_input: str) -> str:
    messages.append({"role": "user", "content": user_input})

    with using_session(session_id):
        response = client.chat.completions.create(
            model="gpt-4",
            messages=messages
        )

    assistant_message = response.choices[0].message.content
    messages.append({"role": "assistant", "content": assistant_message})
    return assistant_message
```

## Additional Attributes

```python
from phoenix.otel import using_attributes

with using_attributes(
    user_id="user_123",
    session_id="conv_456",
    metadata={"tier": "premium", "region": "us-west"}
):
    response = llm.invoke(prompt)
```

## LangChain Integration

LangChain threads are automatically recognized as sessions:

```python
from langchain.chat_models import ChatOpenAI

response = llm.invoke(
    [HumanMessage(content="Hi!")],
    config={"metadata": {"thread_id": "user_123_thread"}}
)
```

Phoenix recognizes: `thread_id`, `session_id`, `conversation_id`

## See Also

- **TypeScript sessions:** `sessions-typescript.md`
- **Session docs:** https://docs.arize.com/phoenix/tracing/sessions

````