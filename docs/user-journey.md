# User journey

Short day-0 flows for the two client surfaces. Wording will tighten once UI exists.

## Mobile app (POC)

1. User installs the app from TestFlight or Play internal testing.
2. User taps **Sign in with Google**. Gateway creates an account on first login.
3. Home shows **one track**: French Kiwi Juice, *Don't Wanna Go Home*.
4. User taps **Play**. App requests a fee quote (geo from first request in session).
5. User pays via **fiat** (default) or **crypto** (optional, Linea wallet).
6. Gateway confirms payment, writes a row to the **public Linea ledger**, and returns a stream URL.
7. App plays the track (`expo-av`). User can open an explorer link to the audit entry.
8. User can view account info, sign out, or delete their account.

## Internet / web app (later)

Same backend as mobile, browser UI:

1. Sign in with Google at the gateway.
2. See the same single-track catalog.
3. Pay and play in the browser (HTML audio or embedded player).
4. Link to the public on-chain audit entry for that play.

Web is not in the store POC scope but shares auth, payments, and streaming with mobile.

## What we are not doing in POC

- Full catalog browsing.
- Social or broadcast features (personal listening only).
- Requiring Tailscale on the user device (gateway is the public edge).
