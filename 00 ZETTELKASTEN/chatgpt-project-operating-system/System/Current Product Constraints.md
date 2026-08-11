# Current Product Constraints

Checked: 2026-08-11

## Projects
Official: https://help.openai.com/en/articles/10169521-projects-in-chatgpt

- Project instructions override global custom instructions inside the Project.
- Google Drive files/folders can be added as Project source links.
- Current Projects page reports 25 files for Go/Plus. A separate File Uploads FAQ currently reports 20 for Plus, so this package does not depend on the disputed edge of the limit.

## Instruction length
Official Custom Instructions: https://help.openai.com/en/articles/8096356-chatgpt-custom-instructions

- Plus/Pro/Enterprise/Business/Edu Custom Instructions currently support 5,000 characters.
- The Projects help page does not separately state a Project-instructions character limit.
- Package policy: keep every Project instruction set below 5,000 characters, with margin.

## Scheduled Tasks
Official: https://help.openai.com/en/articles/10291617-scheduled-tasks-in-chatgpt

- Plus: up to 5 active tasks.
- Tasks cannot run more often than hourly.
- A task created in a Project with files cannot access those Project files.
- Tasks can use supported connected apps such as Gmail when available/allowed.
- Tasks can work with configured Finances information.
- Tasks do not currently support webhooks.

## Finances
Official: https://help.openai.com/en/articles/20001222-finances-in-chatgpt

- Eligible Plus/Pro U.S. users can connect supported accounts via Plaid.
- It can analyze connected financial context but cannot move money, pay bills, place trades, change accounts or file taxes.

## GitHub capability observation in this session

The connected GitHub surface exposed read/write functions for Issues, branches, repository files, PR creation/review/merge, workflow runs/jobs/logs/artifacts, reruns and state read-back. Execution instructions still make this capability conditional because permissions and tool availability can differ by Project/session/repository.
