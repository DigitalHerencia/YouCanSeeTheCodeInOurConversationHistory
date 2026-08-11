# Current OpenAI Projects Reference

Checked: 2026-08-11

Official sources:
- https://help.openai.com/en/articles/10169521-projects-in-chatgpt
- https://help.openai.com/en/articles/8096356-chatgpt-custom-instructions

## Operational facts

- Project instructions apply only inside their Project and override global custom instructions.
- Projects can include uploaded files and supported app links. The current Projects help page lists Google Drive files/folders and Slack channels as supported source links.
- OpenAI's current Projects page says Go/Plus projects support 25 files. A separate File Uploads FAQ still reports 20 for Plus, so treat the actual Project UI as operational truth and keep persistent source sets comfortably below either number.
- OpenAI explicitly documents a 5,000-character limit for Custom Instructions on Plus/Pro/Enterprise/Business/Edu. It does not separately document a Project-instructions character limit on the Projects page. The instructions in this package are deliberately kept well below 5,000 characters as a conservative design target.

## Authority rule for this system

Static product references are supporting context, not live truth. When a prompt depends on current ChatGPT/OpenAI behavior, verify current official OpenAI documentation and the tools actually available in the conversation.
