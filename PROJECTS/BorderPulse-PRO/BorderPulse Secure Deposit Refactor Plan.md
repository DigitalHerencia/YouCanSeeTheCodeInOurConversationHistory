# BorderPulse Secure Deposit Refactor Plan

This assessment is based on direct inspection of the BorderPulse repo’s contract artifacts, docs, execution state, Prisma schema, booking/auth/discovery/host codepaths, tests, and Playwright smoke coverage. The repo is not a rewrite candidate; it is a scaffold with real architectural discipline, several implemented vertical slices, and an in-progress booking surface that can be redirected rather than discarded. fileciteturn91file0L1-L1 fileciteturn109file0L1-L1 fileciteturn32file0L1-L1 fileciteturn34file0L1-L1

## Diagnosis and triage

**Executive diagnosis**

BorderPulse already has the right macro-architecture for an incremental refactor: thin App Router pages, feature-owned orchestration, server-only fetchers and actions, Clerk-backed auth with a Prisma mirror, a preserved design system, and working discovery, host profile, host onboarding, host dashboard, guest inbox, and booking route shells. That is real momentum, not throwaway scaffolding. The booking flow is also already partially implemented end-to-end in the repo: request context, request submission, booking detail access control, cancellation, unit tests, and initial UI are all present. fileciteturn109file0L1-L1 fileciteturn32file0L1-L1 fileciteturn69file0L1-L1 fileciteturn70file0L1-L1 fileciteturn110file0L1-L1 fileciteturn112file0L1-L1 fileciteturn113file0L1-L1 fileciteturn114file0L1-L1 fileciteturn57file0L1-L1 fileciteturn58file0L1-L1 fileciteturn63file0L1-L1 fileciteturn65file0L1-L1

The solid parts are mostly the ones you explicitly wanted preserved. Auth and route protection are centralized and sane: `proxy.ts` protects private surfaces; `lib/auth/viewer.ts` resolves a Clerk-backed viewer with Prisma mirror fallback; `lib/fetchers/auth.ts` centralizes role and permission checks; and those foundations already have passing validation records for the auth rollout. Discovery and host profile are also safely reusable because they are public-read flows with app/feature separation already in place, and host dashboard is already a private operational surface rather than a marketing page. fileciteturn97file0L1-L1 fileciteturn52file0L1-L1 fileciteturn62file0L1-L1 fileciteturn36file0L1-L1 fileciteturn71file0L1-L1 fileciteturn72file0L1-L1 fileciteturn73file0L1-L1 fileciteturn74file0L1-L1 fileciteturn75file0L1-L1 fileciteturn76file0L1-L1

What is missing is the actual trust-layer domain. The current contracts, Prisma schema, booking action/fetcher flow, analytics contract, and Stripe integration all assume booking is the main canonical object and payments are either deferred or host-payout-oriented. There is no deposit model, no payment/deposit state machine, no Stripe PaymentIntent orchestration, no webhook-backed reconciliation path for holds/releases/refunds/forfeitures, and no deposit-aware permissions or analytics events. `lib/integrations/stripe.ts` is only a payout-readiness wrapper, not a transaction adapter. fileciteturn27file0L1-L1 fileciteturn41file0L1-L1 fileciteturn58file0L1-L1 fileciteturn57file0L1-L1 fileciteturn28file0L1-L1 fileciteturn60file0L1-L1

So the right diagnosis is: **deposits are structurally absent, but not structurally blocked**. The current repo can be extended into a deposit-centered product without a rewrite because the booking surfaces are already server-owned and the architecture already expects contract-driven feature work. The main problem is that repo contracts and implementation are presently pointing in the wrong product direction: “booking request now, payments later,” instead of “booking intent plus platform-controlled protected deposit hold now.” fileciteturn37file0L1-L1 fileciteturn30file0L1-L1 fileciteturn31file0L1-L1 fileciteturn34file0L1-L1 fileciteturn35file0L1-L1

**Keep / extend / change matrix**

| Keep as-is | Extend / refactor | Replace / rethink |
|---|---|---|
| `AGENTS.md`, `.agents/docs/design-system.md`, and the thin-route doctrine in `app/(app)/**/page.tsx`. These are aligned with the preservation goal and already enforced in code and docs. fileciteturn109file0L1-L1 fileciteturn33file0L1-L1 fileciteturn69file0L1-L1 fileciteturn70file0L1-L1 fileciteturn110file0L1-L1 fileciteturn112file0L1-L1 | `prisma/schema.prisma`, `.agents/contracts/domain-model.yaml`, `types/booking.ts`, `schemas/booking.ts`, `lib/fetchers/booking.ts`, and `lib/actions/booking.ts`. These are the natural insertion points for deposit-aware state, not reasons to start over. fileciteturn41file0L1-L1 fileciteturn27file0L1-L1 fileciteturn47file0L1-L1 fileciteturn59file0L1-L1 fileciteturn57file0L1-L1 fileciteturn58file0L1-L1 | The repo-wide product assumption that booking is primary and payment is later. That assumption exists in `.agents/docs/prd.md`, `.agents/docs/user-flows.md`, `.agents/instructions/booking.instructions.md`, and booking UI copy. It must be rewritten before more booking work lands. fileciteturn30file0L1-L1 fileciteturn31file0L1-L1 fileciteturn37file0L1-L1 fileciteturn64file0L1-L1 |
| `lib/auth/*`, `lib/fetchers/auth.ts`, `proxy.ts`, and the Clerk-to-Prisma mirror. This is already the correct trust boundary for a protected-deposit product. fileciteturn97file0L1-L1 fileciteturn52file0L1-L1 fileciteturn62file0L1-L1 fileciteturn41file0L1-L1 | `.agents/contracts/roles.yaml`, `.agents/contracts/authz.yaml`, and `lib/auth/roles.ts`. Roles and ownership rules exist, but the contract already has `booking_participant_or_admin` while the shared `OwnershipRule` type only knows `any | self`, so deposit-aware ownership will otherwise become more ad hoc. fileciteturn24file0L1-L1 fileciteturn25file0L1-L1 fileciteturn53file0L1-L1 | Treating `BookingStatus` as the only meaningful state bucket. Today `Booking` uses one enum for lifecycle and `CheckInSession.status` reuses that same enum, which is already a warning sign. Adding money state there would make the situation worse. fileciteturn41file0L1-L1 fileciteturn46file0L1-L1 |
| `features/discovery/*`, `features/host-profile/*`, and most of `features/host-dashboard/*` structure. These surfaces are good entry points into the deposit wedge and should be cosmetically adapted, not re-platformed. fileciteturn72file0L1-L1 fileciteturn74file0L1-L1 fileciteturn76file0L1-L1 | `features/booking/*`, `features/guest-inbox/*`, `features/admin/admin-page.tsx`, and `lib/fetchers/host-dashboard.ts`. These should become deposit-aware because they are the post-intent, post-confirmation, and moderation surfaces where trust actually shows up. fileciteturn63file0L1-L1 fileciteturn64file0L1-L1 fileciteturn65file0L1-L1 fileciteturn77file0L1-L1 fileciteturn78file0L1-L1 fileciteturn75file0L1-L1 fileciteturn116file0L1-L1 | The current money framing around “transparent payouts” and “clear earnings” as a primary value proposition. Keep payout onboarding for hosts, but demote it from the public wedge in marketing, launch copy, and dashboard framing. fileciteturn102file0L1-L1 fileciteturn103file0L1-L1 fileciteturn104file0L1-L1 |
| `lib/booking/pricing.ts` as a pure money utility. Its math helpers are reusable, but its outputs should stop implying they are the same thing as the protected deposit. fileciteturn56file0L1-L1 | `.agents/contracts/analytics.yaml` and `lib/integrations/analytics.ts`. Analytics exists, but it stops at booking request events and needs explicit deposit hold, release, refund, forfeiture, expiry, and dispute milestones. fileciteturn28file0L1-L1 fileciteturn61file0L1-L1 | `lib/integrations/stripe.ts` as the sole Stripe abstraction. It is too thin and too payout-centric to survive unchanged once deposit authorization/capture/refund/transfer behavior is added. Keep the file, but change its role to low-level config/client export and move transaction semantics elsewhere. fileciteturn60file0L1-L1 |

## Target architecture

**Deposit-centered target architecture**

The target should keep **Booking as the operational record** and introduce a separate **BookingDeposit** record as the monetary trust record. In other words: Booking answers *who, what, when, where, and lifecycle*; BookingDeposit answers *how much is protected, where it is in Stripe, what the hold/capture/refund state is, and why money moved*. That separation is the single most important architectural correction because the repo currently has only a booking lifecycle object plus quote-like pricing fields, and no separate money entity at all. fileciteturn41file0L1-L1 fileciteturn27file0L1-L1 fileciteturn47file0L1-L1

A minimal, repo-aligned target looks like this:

```text
/hosts/[slug] or /discover
  -> /bookings/new
      -> getBookingRequestContext()
      -> createBookingIntent()
          -> Booking
          -> BookingDeposit(HOLD_PENDING)
          -> Stripe deposit authorization
      -> on success
          -> Booking.status = PENDING_HOST_CONFIRMATION
          -> BookingDeposit.status = HOLD_SUCCEEDED
      -> /bookings/[bookingId]

/bookings/[bookingId]
  -> getBookingByIdWithDeposit()

Host decision
  -> confirmBooking()
  -> declineBooking()
  -> expireBooking()

Outcome handling
  -> releaseDeposit()
  -> refundDeposit()
  -> captureDepositForForfeiture()
  -> disputeDeposit()
```

I would add these Prisma objects first, and only these first: `BookingDeposit` as a one-to-one child of `Booking`, plus `BookingDepositEvent` as an append-only audit trail for Stripe/webhook/platform actions. Do **not** try to create a complete payments ledger in the first pass. The existing `Booking` pricing fields can stay temporarily as quote/economic snapshot fields to avoid broad churn, while the actual protected-deposit amount lives only on `BookingDeposit`. fileciteturn41file0L1-L1 fileciteturn58file0L1-L1

The cleanest file placement is:

| Responsibility | Recommended location | Why this location fits the repo |
|---|---|---|
| Booking lifecycle model | `prisma/schema.prisma` + `types/booking.ts` | Current booking lifecycle already lives here. Extend, do not relocate. fileciteturn41file0L1-L1 fileciteturn47file0L1-L1 |
| Deposit model and deposit event log | `prisma/schema.prisma` + `.agents/contracts/domain-model.yaml` | This keeps contracts and DB schema aligned with the repo’s explicit contract-first model. fileciteturn41file0L1-L1 fileciteturn27file0L1-L1 |
| Deposit policy rules | `lib/booking/deposit-policy.ts` | This keeps policy pure and testable, alongside existing booking math helpers. fileciteturn56file0L1-L1 |
| Booking/deposit state transition rules | `lib/booking/state.ts` or `lib/booking/transitions.ts` | Avoids burying lifecycle logic in UI or server actions. |
| Stripe low-level config/client | `lib/integrations/stripe.ts` | Keep this file, but reduce it to config and client bootstrap. fileciteturn60file0L1-L1 |
| Stripe deposit adapter | `lib/integrations/stripe-deposits.ts` | Adjacent to the existing Stripe integration, but clearly scoped to deposit orchestration. |
| Booking intent + host decision mutations | `lib/actions/booking.ts` | This is already the mutation boundary; it should call policy/adapters, not inline Stripe logic. fileciteturn58file0L1-L1 |
| Deposit-aware booking reads | `lib/fetchers/booking.ts` | This file already enforces ownership and shapes booking detail DTOs. Extend it instead of creating a parallel read path too early. fileciteturn57file0L1-L1 |
| Booking/deposit UI | `features/booking/*` | Booking UI already exists and should become deposit-aware instead of being replaced. fileciteturn63file0L1-L1 fileciteturn64file0L1-L1 fileciteturn65file0L1-L1 |

For Stripe, I would recommend **platform-controlled charges plus later transfer logic**, not a connected-account-first charge flow. The reason is product semantics: BorderPulse is supposed to be the trusted intermediary holding the protected deposit until outcome. Stripe’s separate-charges-and-transfers model keeps the charge on the platform and lets the platform decide if and when to transfer funds later; destination charges, by contrast, are optimized for immediately transferring funds to the connected account. Stripe also documents that refunds, disputes, and fees for destination charges and separate charges/transfers hit the platform balance, which matches the product wedge of platform-controlled trust and adjudication. citeturn0search0turn0search1turn0search2turn2search0

For the hold itself, the correct primitive is **PaymentIntent manual capture** for eligible payment methods, with explicit persistence of Stripe object IDs and `holdExpiresAt`. That recommendation needs an important caveat: Stripe’s standard online authorization windows are typically around 5–7 days for cards, and even extended authorization is a separate capability with limitations. Because BorderPulse availability windows are currently any future time `>= now`, the deposit architecture must either limit protected-hold bookings to windows inside the authorization horizon or add a re-authorization policy for longer lead times. This is not optional; it is the main external systems constraint in the refactor. fileciteturn57file0L1-L1 citeturn1search0turn1search2

Authz should remain **booking-first and ownership-enforced**, not deposit-ID-first. Concretely: a guest, the host owner of the booked experience, or an admin auditor can read a deposit only by reading it through the booking record they already own or are authorized to audit. No new UI should ever fetch `BookingDeposit` by naked ID from the client. Extend the shared ownership layer so the existing contract notion of `booking_participant_or_admin` is actually represented in shared auth code, then reuse that for deposit-aware fetchers and actions. fileciteturn25file0L1-L1 fileciteturn53file0L1-L1 fileciteturn57file0L1-L1

**Data model and state model recommendations**

The repo is already at risk of state overloading because `BookingStatus` is the only major lifecycle enum in play and `CheckInSession.status` currently reuses it. The deposit refactor should explicitly avoid repeating that pattern. **Do not collapse fulfillment state and money state into one giant enum.** fileciteturn41file0L1-L1

Recommended **booking lifecycle states**:

| Booking state | Meaning |
|---|---|
| `PENDING_HOST_CONFIRMATION` | Guest intent exists and protected deposit hold succeeded; waiting on host decision. |
| `CONFIRMED` | Host accepted; coordination can begin. |
| `CHECKED_IN` | Arrival/in-person state. |
| `COMPLETED` | Fulfillment completed normally. |
| `DECLINED` | Host rejected before fulfillment. |
| `CANCELED` | Canceled before fulfillment. |
| `NO_SHOW` | Outcome recorded as no-show. |
| `DISPUTED` | Booking outcome is under review. |

Recommended **deposit/payment states**:

| Deposit state | Meaning |
|---|---|
| `NOT_INITIATED` | Legacy booking or deposit not yet attempted. |
| `HOLD_PENDING` | Stripe authorization flow started but unresolved. |
| `HOLD_SUCCEEDED` | Funds are protected and capturable/releasable. |
| `HOLD_FAILED` | Authorization failed. |
| `HOLD_EXPIRED` | Authorization lapsed before outcome resolution. |
| `RELEASE_PENDING` | Platform is releasing or canceling the hold. |
| `RELEASED` | Hold released; guest funds no longer reserved. |
| `CAPTURE_PENDING` | Platform approved capture/forfeiture and is executing it. |
| `CAPTURED` | Deposit was captured. |
| `REFUND_PENDING` | Refund is being processed after capture. |
| `REFUNDED` | Captured deposit was refunded. |
| `PARTIALLY_REFUNDED` | Only part of the captured amount was refunded. |
| `PAYMENT_DISPUTED` | Cardholder dispute/chargeback is active. |

Recommended **host-side payout visibility states** for booking rows and host operations:

| Host payout visibility | Meaning |
|---|---|
| `HELD_BY_PLATFORM` | Deposit is authorized but not payable to host. |
| `AWAITING_OUTCOME` | Host has no claimable funds yet. |
| `ELIGIBLE_FOR_TRANSFER` | Outcome supports host entitlement after capture. |
| `TRANSFER_PENDING` | Platform has captured and is preparing transfer. |
| `TRANSFER_SENT` | Transfer to connected account has been created. |
| `TRANSFER_REVERSED` | Prior transfer was reversed because of refund/dispute adjustment. |

Recommended **resolution reasons** for release/refund/forfeiture logic:

| Resolution reason | Typical mapping |
|---|---|
| `HOST_DECLINED` | Release hold. |
| `GUEST_CANCELED_IN_POLICY` | Release hold or refund. |
| `HOST_NO_SHOW` | Release/refund in guest’s favor. |
| `GUEST_NO_SHOW` | Capture all or part of deposit according to policy. |
| `ADMIN_OVERRIDE` | Manual platform resolution. |
| `AUTH_EXPIRED` | Booking needs re-authorization or policy fallback. |
| `PAYMENT_DISPUTE` | Freeze host payout path and move to dispute workflow. |

## Refactor sequencing

**Segmented refactor phases**

The repo itself says `.agents/contracts` are canonical for agent decisions, and `TASK-014` is still marked `in_progress` while booking-related validation gates remain pending. That means the correct order is **audit and contract realignment first**, not “just wire Stripe into the current booking flow.” Otherwise you will harden the wrong semantics into code, tests, and execution state. fileciteturn109file0L1-L1 fileciteturn34file0L1-L1 fileciteturn36file0L1-L1

| Phase | Objective | Repo areas touched | Why this phase comes now | Main risks | Dependencies | Expected output artifacts |
|---|---|---|---|---|---|---|
| Booking foundation audit | Freeze current booking assumptions and mark what is reusable vs wrong. | `features/booking/*`, `lib/actions/booking.ts`, `lib/fetchers/booking.ts`, `tests/booking.test.ts`, `.agents/execution/backlog.json` | You already have in-progress booking work; audit prevents accidental deletion of reusable scaffolding. | Team continues coding against old semantics during the audit. | None. | Written audit notes, explicit keep/extend/replace list, temporary “do not deepen old booking semantics” note in execution state. |
| Contracts, docs, and execution alignment | Rewrite the product story from booking-first to deposit-first before more code lands. | `.agents/contracts/*.yaml`, `.agents/docs/*.md`, `.agents/execution/*.json`, `AGENTS.md` only if needed for language emphasis | This repo is contract-driven; if you skip this, Codegen/Copilot/Codex will keep reinforcing the old model. | Artifact drift if only some files update. | Audit complete. | Updated PRD, user flows, tech requirements, analytics, domain model, roles/authz, acceptance gates, new decision record, rewritten `TASK-014`. |
| Prisma and domain model refactor | Introduce `BookingDeposit` and `BookingDepositEvent`; separate lifecycle from money state. | `prisma/schema.prisma`, `.agents/contracts/domain-model.yaml`, `types/booking.ts`, `types/domain.ts`, `schemas/booking.ts` | Schema comes before orchestration so the rest of the app has a stable target. | Over-designing a ledger; destructive renames too early. | Contract phase complete. | Prisma migration plan, new enums/models/types, backward-compatible DTO strategy. |
| Stripe and deposit transaction layer | Stand up the server-side deposit adapter and policy boundary. | `lib/integrations/stripe.ts`, new `lib/integrations/stripe-deposits.ts`, new `lib/booking/deposit-policy.ts`, new `lib/booking/state.ts` | Actions should call a stable transaction boundary rather than inline Stripe code. | Picking the wrong charge flow; ignoring hold expiration. | Schema designed. | Platform charge strategy, PaymentIntent/manual-capture adapter, policy functions, webhook/reconciliation outline. |
| Booking fetcher and action refactor | Convert booking intent submission and detail reads into deposit-aware flows. | `lib/actions/booking.ts`, `lib/fetchers/booking.ts`, `schemas/booking.ts`, `types/booking.ts` | This is where product semantics become real app behavior. | Booking and deposit states get tangled; ownership leaks. | Schema + Stripe/policy boundary ready. | `createBookingIntent`, host decision actions, deposit-aware `getBookingById`, release/refund/forfeit orchestration hooks. |
| Booking UI refactor | Change request/detail UI from generic request flow to protected-deposit flow. | `app/(app)/bookings/new/page.tsx`, `app/(app)/bookings/[bookingId]/page.tsx`, `features/booking/*`, shared badges/cards | UI should reflect true money behavior only after backend semantics are correct. | UI copy lies about payment; client starts owning money logic. | Fetchers/actions stable. | Deposit hold step, dual booking/deposit status display, revised review cards, clearer post-confirmation outcome language. |
| Dashboard, messaging, and moderation touch-ups | Thread deposit trust through host operations, guest coordination, and admin review. | `features/host-dashboard/*`, `lib/fetchers/host-dashboard.ts`, `features/guest-inbox/*`, `lib/fetchers/guest-inbox.ts`, `features/admin/admin-page.tsx` | Deposit value is only real if downstream surfaces expose it. | Over-expanding scope into full inbox/admin subsystems. | Booking UI semantics stable. | Deposit-aware booking rows, “held by platform” visibility, dispute/review placeholders, moderation hooks. |
| Tests and acceptance gate updates | Rewrite validation around deposit-aware trust behavior. | `tests/*`, `e2e/*`, `.agents/contracts/acceptance-gates.yaml`, `.agents/execution/validation.json`, `lib/contracts/contracts.test.ts`, `scripts/validate-contracts.mjs` | Current booking validations are pending anyway; now is the time to define the right ones. | Test suite keeps green while semantics drift; contract validation remains too shallow. | All prior phases. | Updated unit/integration/e2e coverage, new/rewritten VAL gates, stronger contract assertions. |

This sequence preserves momentum because it **keeps the route shells, keeps the booking surfaces, keeps the tests that already express useful shapes, and only changes the domain contract at the narrow seams where money semantics belong**. It avoids the two bad extremes: full rewrite and superficial Stripe bolt-on. fileciteturn69file0L1-L1 fileciteturn70file0L1-L1 fileciteturn83file0L1-L1

## File-by-file impact map

**File-by-file refactor map**

The highest-priority files are the ones currently encoding the wrong product semantics: contracts, Prisma, booking fetchers/actions/types, Stripe integration, booking UI, and validation artifacts. Discovery, host profile, and most auth files are mainly late-touch or no-touch. fileciteturn27file0L1-L1 fileciteturn41file0L1-L1 fileciteturn57file0L1-L1 fileciteturn58file0L1-L1 fileciteturn60file0L1-L1 fileciteturn34file0L1-L1

**Prisma, schemas, and types**

| Path | Likely change | Safe to defer | Touch timing |
|---|---|---|---|
| `prisma/schema.prisma` | Add `BookingDeposit`, `BookingDepositEvent`, deposit enums, and possibly extend `BookingStatus` with `DECLINED`/`NO_SHOW`; do **not** merge money state into `BookingStatus`. fileciteturn41file0L1-L1 | No | Early |
| `schemas/booking.ts` | Replace pure booking-request validation with booking-intent + deposit-intent validation; add host decision and resolution schemas. fileciteturn59file0L1-L1 | No | Early |
| `types/booking.ts` | Add `deposit` sub-DTOs to request/detail views; keep view shape separation explicit. fileciteturn47file0L1-L1 | No | Early |
| `types/domain.ts` | Add deposit-related status/value types, but avoid turning it into a giant dumping ground. fileciteturn46file0L1-L1 | No | Early |
| `schemas/domain.ts` | Extend enum schemas to cover any new lifecycle/deposit enums. fileciteturn43file0L1-L1 | No | Early |
| `.agents/contracts/domain-model.yaml` | Mirror the new DB/domain objects exactly; this is the contract counterpart to the Prisma change. fileciteturn27file0L1-L1 | No | Very early |

**`lib/*`**

| Path | Likely change | Safe to defer | Touch timing |
|---|---|---|---|
| `lib/actions/booking.ts` | Biggest code refactor. Stop treating submit as “create Booking and redirect”; make it orchestrate booking intent + deposit lifecycle via services. fileciteturn58file0L1-L1 | No | Early |
| `lib/fetchers/booking.ts` | Join booking and deposit views; keep ownership checks here; surface deposit status, hold expiry, and resolution outcomes. fileciteturn57file0L1-L1 | No | Early |
| `lib/integrations/stripe.ts` | Narrow to config/client bootstrap; move operational deposit logic out. fileciteturn60file0L1-L1 | No | Early |
| `lib/integrations/analytics.ts` | Add deposit event helpers or typed wrappers; right now it is only a thin `track()` stub. fileciteturn61file0L1-L1 | Medium | Mid |
| `lib/booking/pricing.ts` | Keep math helpers, but clarify quote-vs-deposit semantics and add deposit amount derivation helpers. fileciteturn56file0L1-L1 | No | Early |
| `lib/fetchers/host-dashboard.ts` | Add deposit visibility to booking rows; keep payout-account readiness but demote it as the main operation signal. fileciteturn75file0L1-L1 | Medium | Mid/Late |
| `lib/fetchers/guest-inbox.ts` | Replace purely mock-centric thread shell assumptions with booking/deposit-linked coordination context. fileciteturn77file0L1-L1 | Yes | Late |
| `lib/auth/roles.ts` | Extend shared ownership-rule support or split ownership logic into a dedicated helper; current shared type is too narrow. fileciteturn53file0L1-L1 | No | Early |
| `proxy.ts`, `lib/auth/viewer.ts`, `lib/fetchers/auth.ts` | Mostly keep; only touch if new deposit routes/actions require explicit permission expansion. fileciteturn97file0L1-L1 fileciteturn52file0L1-L1 fileciteturn62file0L1-L1 | Yes | Late or no-touch |

**`app/*`**

| Path | Likely change | Safe to defer | Touch timing |
|---|---|---|---|
| `app/(app)/bookings/new/page.tsx` | Probably only prop-shape changes; keep as thin shell. fileciteturn69file0L1-L1 | No | Mid |
| `app/(app)/bookings/[bookingId]/page.tsx` | Same: thin shell remains, detail DTO grows deposit-aware. fileciteturn70file0L1-L1 | No | Mid |
| `app/(app)/host/dashboard/page.tsx` | Keep thin; maybe no direct refactor needed. fileciteturn113file0L1-L1 | Yes | Late |
| `app/(app)/guest/inbox/page.tsx` | Likely no direct change beyond feature props. fileciteturn114file0L1-L1 | Yes | Late |
| `app/(app)/discover/page.tsx`, `app/(app)/hosts/[slug]/page.tsx` | Preserve unchanged unless copy/CTA props need light edits. fileciteturn110file0L1-L1 fileciteturn112file0L1-L1 | Yes | Late |

**`features/*`**

| Path | Likely change | Safe to defer | Touch timing |
|---|---|---|---|
| `features/booking/booking-request-page.tsx` | Reframe page as booking intent + protected deposit context, not simple request. fileciteturn63file0L1-L1 | No | Mid |
| `features/booking/booking-request-form.tsx` | Highest-priority copy and UX change; current wording explicitly says “You will not be charged yet.” fileciteturn64file0L1-L1 | No | Mid |
| `features/booking/booking-details-page.tsx` | Add separate booking status and deposit status cards; next-step copy must become outcome-aware. fileciteturn65file0L1-L1 | No | Mid |
| `features/booking/booking-status-badge.tsx` | Split booking status badge from any future deposit status badge. fileciteturn66file0L1-L1 | No | Mid |
| `features/host-dashboard/host-dashboard-page.tsx` | Booking rows need “deposit protected / awaiting outcome / transferable” visibility. fileciteturn76file0L1-L1 | Medium | Late |
| `features/guest-inbox/guest-inbox-page.tsx` | Add deposit-related coordination and resolution messaging once live data exists. fileciteturn78file0L1-L1 | Yes | Late |
| `features/admin/admin-page.tsx` | Add deposit dispute/reversal/review posture to existing moderation shell. fileciteturn116file0L1-L1 | Yes | Late |
| `features/host-profile/host-profile-page.tsx` and `features/discovery/discovery-page.tsx` | Mostly keep; only update CTA framing and maybe deposit preview language. fileciteturn74file0L1-L1 fileciteturn72file0L1-L1 | Yes | Late |
| `features/marketing/*` | Public wedge must shift from generic discovery/payout framing to “protected deposits build trust.” fileciteturn102file0L1-L1 fileciteturn104file0L1-L1 | Medium | Mid/Late |

**`tests/*`**

| Path | Likely change | Safe to defer | Touch timing |
|---|---|---|---|
| `tests/booking.test.ts` | Rewrite heavily; it is the main unit harness for schemas, pricing, fetchers, and actions. fileciteturn83file0L1-L1 | No | Late but mandatory |
| `tests/host-dashboard.test.ts` | Extend booking row assertions to include deposit-visibility semantics. fileciteturn84file0L1-L1 | Yes | Late |
| `lib/contracts/contracts.test.ts` | Strengthen beyond “files load”; assert deposit entities, routes, analytics events, and permissions exist. fileciteturn85file0L1-L1 | No | Late |
| `e2e/smoke.spec.ts` | Add the protected-deposit path and revise old booking copy assumptions. fileciteturn101file0L1-L1 | No | Late |
| `playwright.config.ts`, `e2e/clerk.setup.ts` | Mostly keep. fileciteturn88file0L1-L1 fileciteturn115file0L1-L1 | Yes | Low priority |

**`.agents/*`**

| Path or folder | Likely change | Safe to defer | Touch timing |
|---|---|---|---|
| `.agents/contracts/roles.yaml`, `authz.yaml`, `routes.yaml`, `domain-model.yaml`, `analytics.yaml`, `acceptance-gates.yaml` | Core semantic rewrite. These must change first. fileciteturn24file0L1-L1 fileciteturn25file0L1-L1 fileciteturn26file0L1-L1 fileciteturn27file0L1-L1 fileciteturn28file0L1-L1 fileciteturn29file0L1-L1 | No | First |
| `.agents/docs/prd.md`, `user-flows.md`, `tech-requirements.md`, `launch-copy.md` | These currently encode the pre-deposit story and will otherwise keep misleading implementation work. fileciteturn30file0L1-L1 fileciteturn31file0L1-L1 fileciteturn32file0L1-L1 fileciteturn103file0L1-L1 | No | First |
| `.agents/execution/backlog.json`, `decisions.json`, `validation.json` | Rewrite `TASK-014`, add a new decision for the deposit pivot, and replace stale validation expectations. fileciteturn34file0L1-L1 fileciteturn35file0L1-L1 fileciteturn36file0L1-L1 | No | First |

## Product language and validation

**Product-language / UI copy corrections**

The repo’s language currently alternates between booking-request language and payout-language, which is exactly what will make the UI lie once deposit holds become real. The main correction is to recenter language around **protected deposit**, **platform-controlled hold**, **host confirmation after hold**, and **outcome-based release/refund/forfeiture**. fileciteturn64file0L1-L1 fileciteturn65file0L1-L1 fileciteturn102file0L1-L1 fileciteturn103file0L1-L1 fileciteturn104file0L1-L1

| Current wording or concept | Likely path | Why it is wrong now | New direction |
|---|---|---|---|
| “You will not be charged yet” | `features/booking/booking-request-form.tsx` fileciteturn64file0L1-L1 | Once deposits exist, this becomes false or at least materially misleading. | Replace with wording like “BorderPulse places a protected deposit hold” and explain release/refund/forfeiture rules. |
| “Host confirms availability before final confirmation” | `features/booking/booking-request-form.tsx` fileciteturn64file0L1-L1 | It omits the trust layer between guest intent and host confirmation. | “BorderPulse secures your protected deposit hold first; host confirmation comes next.” |
| “Booking request” / “Send booking request” | booking UI and `.agents/instructions/booking.instructions.md` fileciteturn63file0L1-L1 fileciteturn64file0L1-L1 fileciteturn37file0L1-L1 | Too generic; it describes a lead form, not the core product wedge. | Shift toward “booking intent” and “secure protected deposit.” |
| “Transparent payouts” as a public feature card | `features/marketing/marketing-content.ts`, `features/marketing/marketing-page.tsx` fileciteturn102file0L1-L1 fileciteturn104file0L1-L1 | Payout setup matters operationally, but it is not the guest-host trust wedge. | Demote payouts to host ops copy; promote protected deposits as the primary trust mechanism. |
| “clear earnings” / payout setup before publish | `.agents/docs/launch-copy.md` fileciteturn103file0L1-L1 | Again, host monetization is secondary to protected trust in the product story. | Keep for onboarding ops language, not hero/market wedge language. |
| “future payment handling” | `.agents/docs/prd.md`, `.agents/docs/user-flows.md`, booking detail copy fileciteturn30file0L1-L1 fileciteturn31file0L1-L1 fileciteturn65file0L1-L1 | The trust layer should not be “future”; it should be first-class in the core flow. | Replace with explicit deposit hold, host decision, and resolution language. |
| “payout status” as a key dashboard stat adjacent to bookings | `features/host-dashboard/host-dashboard-page.tsx` fileciteturn76file0L1-L1 | Useful for onboarding, but booking trust is missing from operational rows. | Keep payout-account readiness, but also add per-booking deposit protection visibility. |

**Testing and validation impact**

Current test coverage proves that the booking shell exists, not that the secure-deposit product works. `tests/booking.test.ts` validates request input, pricing snapshot math, ownership on booking details, booking creation, and pre-start cancellation. `e2e/smoke.spec.ts` covers discovery, host profile CTA visibility, auth redirects, and host onboarding, but it does **not** yet cover a deposit hold or any deposit-aware outcome flow. Meanwhile the booking validation gates in `.agents/execution/validation.json` are still pending. fileciteturn83file0L1-L1 fileciteturn101file0L1-L1 fileciteturn36file0L1-L1

The validation layer also needs cleanup before extension: `acceptance-gates.yaml` and `validation.json` already drift on the meaning of several `VAL-010` through `VAL-015` IDs, and `scripts/validate-contracts.mjs` plus `lib/contracts/contracts.test.ts` only verify file presence/basic shape, not semantic alignment. That means deposit work can appear “validated” while the repo drifts materially. fileciteturn29file0L1-L1 fileciteturn36file0L1-L1 fileciteturn87file0L1-L1 fileciteturn85file0L1-L1

Recommended updates:

| Existing structure | Update needed |
|---|---|
| `tests/booking.test.ts` | Add deposit policy tests, hold-expiry policy tests, booking/deposit transition tests, host decision tests, release/refund/forfeiture tests, and strict ownership tests for deposit reads. |
| `tests/host-dashboard.test.ts` | Assert deposit visibility states on host booking rows, not just booking status and payout account state. |
| `e2e/smoke.spec.ts` | Keep discovery/profile/auth smoke cases, but add a dedicated protected-deposit happy path and at least one failed/expired/forbidden case. |
| New e2e file such as `e2e/booking-deposit.spec.ts` | Cover: guest enters from host profile, sees deposit explanation, authorizes hold, lands on detail view, host confirms, guest sees post-confirmation coordination, and admin/forbidden access edge cases. |
| `.agents/contracts/acceptance-gates.yaml` | Rewrite `VAL-027` through `VAL-031` around deposit-aware semantics, and add new gates for webhook reconciliation and dashboard visibility. |
| `.agents/execution/validation.json` | Reset stale pending booking validations and align names/IDs to the rewritten gates. |
| `lib/contracts/contracts.test.ts` | Assert that deposit entities, deposit analytics events, and deposit-related route/authz semantics exist in contracts. |
| `scripts/validate-contracts.mjs` | Expand beyond presence/parse into required-key existence for deposit-related sections. |

A practical gate rewrite would keep the stable ID range where possible but update semantics. For example: `VAL-027` becomes booking-intent and deposit-policy tests; `VAL-028` becomes booking/deposit ownership tests; `VAL-029` becomes booking-plus-deposit persistence; `VAL-030` becomes release/refund/forfeiture rules; `VAL-031` becomes intent-to-detail e2e; then add `VAL-032` for Stripe webhook deposit reconciliation and `VAL-033` for dashboard/inbox/admin deposit visibility. fileciteturn29file0L1-L1 fileciteturn36file0L1-L1

## Risk and immediate action

**Refactor risk report**

| Risk | Why it is real in this repo | Consequence | Mitigation |
|---|---|---|---|
| Architecture drift | Contracts/docs/execution currently encode the old booking-first/payment-later story, and `TASK-014` is still in progress against that story. fileciteturn30file0L1-L1 fileciteturn31file0L1-L1 fileciteturn34file0L1-L1 fileciteturn35file0L1-L1 | More code lands on the wrong product model. | Freeze booking implementation expansion until artifacts are rewritten. |
| UI copy lying about payment behavior | The current booking form literally says “You will not be charged yet,” while marketing emphasizes payouts instead of protected trust. fileciteturn64file0L1-L1 fileciteturn102file0L1-L1 fileciteturn104file0L1-L1 | You will ship a trust product whose copy contradicts its money behavior. | Rewrite copy in the same PR as the domain pivot. |
| Stripe assumptions not matching product timing | Stripe manual capture uses authorization windows that typically expire within days, while current availability logic accepts any future slot. fileciteturn57file0L1-L1 citeturn1search0turn1search2 | Holds silently expire or product promises impossible protection. | Persist `holdExpiresAt`; constrain near-term holds or add a re-authorization policy. |
| Booking state and deposit state getting tangled | Current schema already leans on one `BookingStatus` enum, and `CheckInSession.status` reuses it. fileciteturn41file0L1-L1 | Future logic becomes brittle, untestable, and hard to reason about. | Split booking lifecycle, deposit lifecycle, and check-in lifecycle explicitly. |
| Ownership/authz leakage | Authz contracts already model `booking_participant_or_admin`, but the shared ownership helper only knows `any | self`; booking detail enforcement is partly bespoke in fetchers. fileciteturn25file0L1-L1 fileciteturn53file0L1-L1 fileciteturn57file0L1-L1 | Deposit reads/actions can sprawl into duplicated, inconsistent ownership logic. | Add shared participant/audit ownership utilities before deposit features spread. |
| Over-refactoring stable surfaces | Discovery, host profile, auth, and route shells are already good enough and aligned with the desired architecture. fileciteturn71file0L1-L1 fileciteturn74file0L1-L1 fileciteturn52file0L1-L1 fileciteturn69file0L1-L1 | Team burns time repainting stable surfaces instead of fixing the trust layer. | Treat those surfaces as mostly no-touch except for CTA/copy/DTO wiring. |
| Validation false confidence | Contract validation is shallow and execution validation IDs already drift. fileciteturn87file0L1-L1 fileciteturn85file0L1-L1 fileciteturn29file0L1-L1 fileciteturn36file0L1-L1 | Repo appears healthy while semantics diverge. | Strengthen contract tests and align acceptance/validation artifacts as part of the pivot. |

**Recommended immediate next action**

The single best immediate action is to land a **contract-first deposit-pivot PR** before any more booking implementation proceeds. Concretely: rewrite `.agents/contracts/{domain-model,roles,authz,routes,analytics,acceptance-gates}.yaml`, `.agents/docs/{prd,user-flows,tech-requirements,launch-copy}.md`, and `.agents/execution/{backlog,decisions,validation}.json` so that `TASK-014` no longer means “canonical Booking now, payment later” and instead means “booking intent plus protected deposit hold as the trust layer.” That one move preserves current momentum, stops further product drift, and gives every subsequent Prisma/action/UI/test change a correct target. fileciteturn34file0L1-L1 fileciteturn35file0L1-L1 fileciteturn30file0L1-L1 fileciteturn31file0L1-L1 fileciteturn32file0L1-L1 fileciteturn37file0L1-L1