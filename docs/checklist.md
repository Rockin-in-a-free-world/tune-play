# Checklist

Todos that build to the [definition of done](../README.md#definition-of-done-summary). Check items off in git as work lands.

## 1. On-chain audit (Linea)

- [ ] **1.1** Scaffold `PlaySpendAudit` contract in `packages/audit-contracts`
- [ ] **1.2** Unit tests: fiat, crypto, duplicate playId, public read access
- [ ] **1.3** Deploy to Linea Sepolia (masterbunny.eth sign-off)
- [ ] **1.4** Indexer or `readPublicBooks` wired to deployed address
- [ ] **1.5** Gateway signer key registered on contract (masterbunny.eth)

## 2. API gateway

- [ ] **2.1** `packages/gateway` scaffold, health route
- [ ] **2.2** Google JWT verification (JWKS)
- [ ] **2.3** Account create on first Google login
- [ ] **2.4** Navidrome Subsonic proxy for POC track
- [ ] **2.5** Geo fee quote + 0x on Linea
- [ ] **2.6** POST `/plays` fiat webhook → `recordFiatPlaySpend`
- [ ] **2.7** POST `/plays/crypto` → `recordCryptoPlaySpend`
- [ ] **2.8** Account profile, deactivate, delete

## 3. music-pi

- [ ] **3.1** Reboot Pi if kernel upgrade pending
- [ ] **3.2** `tailscale up` + `tailscale serve` for Navidrome
- [ ] **3.3** Tailscale admin: invite administrator Google account, tag Pi
- [ ] **3.4** POC track on USB, visible in Navidrome
- [ ] **3.5** Gateway env: Navidrome URL + service token

## 4. Mobile app (Expo)

- [ ] **4.1** `packages/mobile` Expo dev client
- [ ] **4.2** Google Sign-In → gateway session
- [ ] **4.3** Single-track UI + stream playback
- [ ] **4.4** Fiat pay sheet
- [ ] **4.5** Crypto pay sheet (Linea, optional)
- [ ] **4.6** Play → pay → stream → audit link
- [ ] **4.7** Account screen, sign out, delete

## 5. Store prep

- [ ] **5.1** Apple Developer + Google Play accounts (administrator)
- [ ] **5.2** Google Cloud OAuth clients (iOS bundle + Android SHA-1)
- [ ] **5.3** Privacy policy + rights statement
- [ ] **5.4** TestFlight internal build
- [ ] **5.5** Play internal testing track
- [ ] **5.6** Review notes (fiat primary, optional crypto, public audit)

## Definition of done gates

- [ ] One track streams end to end through the gateway
- [ ] Artist fee charged once per play using geo from first request
- [ ] Fiat and crypto rails both post to public Linea books
- [ ] Google signup and account lifecycle work
- [ ] Apps submitted to TestFlight and Play internal testing
