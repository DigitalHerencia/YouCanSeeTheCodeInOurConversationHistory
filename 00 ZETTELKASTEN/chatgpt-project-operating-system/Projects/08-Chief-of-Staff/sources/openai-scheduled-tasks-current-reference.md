# Current OpenAI Scheduled Tasks Reference

Checked: 2026-08-11

Official source:
- https://help.openai.com/en/articles/10291617-scheduled-tasks-in-chatgpt

## Operational facts

- Scheduled Tasks support one-off reminders, recurring work, and monitoring for meaningful changes.
- The Scheduled page can create, open, pause, resume, edit, and delete tasks.
- Plus currently supports up to 5 active tasks. Tasks cannot run more often than once per hour.
- If a task is created in a Project that has files, the task cannot access those Project files. Write scheduled-task prompts so they are self-contained.
- Tasks can use supported connected apps such as Gmail when available and permitted.
- Tasks can work with Finances information when Finances is configured.
- Scheduled Tasks do not currently support webhooks.
- Voice chats and GPTs are not supported inside Tasks.

## Design implication

Use scarce active-task slots for high-value reminders, recurring reviews, and monitoring with clear end conditions. Prefer a one-time reminder over a permanent recurring task when recurrence is not necessary.
