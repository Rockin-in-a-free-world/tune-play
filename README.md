# tune-play

Personal music streaming POC: pay the artist for a single play, stream one track, and keep **public on-chain books** on Linea.

## Status

Day 0. Architecture and checklist live in [`docs/`](./docs/). Code packages will land here as sessions complete.

## Roles

| Role | Notes |
| --- | --- |
| Repository administrator | Google OAuth, Tailscale, store accounts (private runbook) |
| Crypto key holder, smart contract fee sign-off | masterbunny.eth |

## Docs

| Doc | Purpose |
| --- | --- |
| [Architecture](./docs/architecture.md) | Gateway, Pi, Linea ledger, apps |
| [User journey](./docs/user-journey.md) | Mobile and web flows |
| [Checklist](./docs/checklist.md) | Todos that build to the definition of done |
| [Style guide](./docs/style.mdc) | US English, formatting rules for humans and agents |

## Definition of done (summary)

Google OAuth **Expo** app (iOS and Android) and a public **gateway** that:

1. Streams **one POC track** (French Kiwi Juice, *Don't Wanna Go Home*).
2. Charges a **geo-based artist fee** on first play (fiat and/or crypto).
3. Writes every play to a **public Linea L2 ledger** anyone can audit.
4. Manages **signup and account lifecycle**.

Full checklist: [`docs/checklist.md`](./docs/checklist.md).

## Estimate

~31 working sessions at 20 to 40 minutes each (**10 to 21 hours** total).

## Related paths

| Path | Notes |
| --- | --- |
| `music-pi` (Raspberry Pi 3) | Navidrome, USB music library |
| `~/GitHub/stream-play/` | Early `PlaySpendAudit` contract work (may merge into this repo) |
