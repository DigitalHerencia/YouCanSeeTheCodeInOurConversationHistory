# Current OpenAI Finances Reference

Checked: 2026-08-11

Official source:
- https://help.openai.com/en/articles/20001222-finances-in-chatgpt

## Operational facts

- Finances is currently available in the U.S. to eligible Plus and Pro users on web, iOS, and Android, with gradual rollout.
- Supported accounts are connected through Plaid.
- Finances can ground analysis in spending, recurring bills/subscriptions, balances/net worth, investments, budgets, debt-payoff planning, and related financial context when the connected institution supplies the relevant data.
- Connected data can have limited historical coverage or missing fields depending on the institution.
- ChatGPT cannot move money, pay bills, change account settings, place trades, open/close accounts, change retirement contributions, or file taxes.
- ChatGPT is not a fiduciary, investment adviser, broker-dealer, tax preparer, law firm, or substitute for qualified professional advice.

## Design implication

Use Finances as the source of truth for the user's actual connected financial records. Use Gmail/Calendar/Contacts/Drive for operational context and correspondence. Do not invent financial state or claim transactional powers Finances does not have.
