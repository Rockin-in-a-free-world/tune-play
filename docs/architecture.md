# Architecture

Day 0 sketch. Details will change as packages land in this repo.

## Overview

```
Mobile app (Expo)          Web app (later)
       │                          │
       └──────────┬───────────────┘
                  │ Google Sign-In
                  ▼
         Public API gateway (HTTPS)
                  │ account lifecycle
                  │ geo fee quote (0x on Linea for crypto)
                  │ Subsonic stream proxy (one track)
                  │ fiat webhook → recordFiatPlaySpend
                  ▼
    Navidrome on music-pi (private, localhost:4533)
                  │
    PlaySpendAudit on Linea L2 (public books)
```

## Components

### Mobile app (`packages/mobile`, planned)

Expo (React Native) for iOS and Android store builds. Google OAuth via the gateway. Plays audio through the gateway stream URL, not direct Pi access.

### Internet / web app (planned, post-POC)

Same gateway API as mobile. Useful for admin, audits, and users who prefer a browser. Not required for store POC.

### Public API gateway (`packages/gateway`, planned)

- Validates Google JWTs.
- Creates and manages user accounts (Navidrome credentials provisioned server-side).
- Proxies **one** Navidrome track for the POC.
- Quotes fees from geo on the first request.
- Records **fiat** plays after payment provider confirmation.
- Accepts **crypto** play receipts and verifies Linea txs where needed.
- Calls `PlaySpendAudit` on Linea with a gateway-controlled signer key (approved by masterbunny.eth).

### Music storage (music-pi)

Raspberry Pi 3, USB library, Navidrome in Docker. Not exposed to the public internet. Gateway reaches Pi over Tailscale or private network.

### On-chain books (`packages/audit-contracts`, planned)

`PlaySpendAudit` on **Linea** (cheap L2). Append-only public ledger: every play, running totals by currency and payment rail. No PII on-chain (hashed user ids only).

## Payments

| Rail | Flow | On-chain rail |
| --- | --- | --- |
| Fiat | Stripe or store IAP, gateway webhook | `FiatReceipt` |
| Crypto | Optional wallet on Linea, 0x quote | `Crypto` |

Fiat is the primary path for app store review. Crypto is optional and signed off by masterbunny.eth.

## Administration

- **Repository administrator:** Google Cloud OAuth, Tailscale invites, store accounts, gateway deployment (private runbook).
- **masterbunny.eth:** deployer keys, gateway signer, smart contract fee policy.
