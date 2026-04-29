# NexAuth

> Self-hosted authentication with AI-powered security. One line of code to integrate. Zero third-party data exposure.

<img width="1146" height="606" alt="image" src="https://github.com/user-attachments/assets/d22dbb36-e29c-4aaa-98ff-71f989c704ba" />

**Drop-in authentication SDK** + **Express backend** + **Real-time security dashboard**. Replace Firebase/Google Auth with a self-hosted, zero-dependency solution that detects anomalies, prevents brute-force attacks, and keeps user data private.

## Key Features

- **One-line SDK integration** — inject auth UI anywhere  
- **In-browser password hashing** — Web Crypto API, no plaintext transmission  
- **AI threat detection** — zero external services, pure JavaScript rules  
- **Real-time dashboard** — live login feed, risk metrics, anomaly detection  
- **JWT-based sessions** — browser localStorage + httpOnly support  
- **SQLite persistence** — no database setup required  

## How It Works

1. Website includes SDK (`<script src="...nexauth.js"></script>`)
2. SDK hashes password in-browser (SHA-256), sends to backend  
3. Backend bcrypt-hashes and verifies against SQLite  
4. AI rules evaluate for threats (brute-force, anomalies, bot signals)  
5. Success → JWT returned; dashboard streams updates via SSE  

## Project Structure

| Directory | Purpose |
|-----------|---------|
| `server/` | Express API, database, threat detection |
| `dashboard/` | React admin UI (real-time stats) |
| `sdk/` | Embedding script & test page |
| `demo/` | Integration examples |

## Quick Start

**Requirements:** Node.js 20+, npm

```bash
# Install dependencies
npm install --prefix server
npm install --prefix dashboard
cp config/.env.example .env

# Run both backend & dashboard
npx concurrently "node server/index.js" "npm start --prefix dashboard"
```

Dashboard: `http://localhost:3000`  
Backend API: `http://localhost:4000`  

## Try It Out

- **Web demo:** `demo/index.html` or `demo/ecommerce.html`  
- **SDK test:** `sdk/test.html`  
- **API tests:** `node server/testBackend.js`

## API Reference

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/auth/register` | POST | Create account |
| `/auth/login` | POST | Authenticate user |
| `/auth/verify` | GET | Verify JWT token |
| `/stats` | GET | Live attack summary |
| `/stats/live` | GET | Event stream (SSE) |

**Body format:** `{ email, hashedPassword, apiKey }`

## Configuration

| Variable | Default | Notes |
|----------|---------|-------|
| `PORT` | 4000 | Backend port |
| `JWT_SECRET` | nexauth-secret | Session signing key |

## Tech Stack

- **Frontend:** React, TailwindCSS  
- **Backend:** Node.js, Express  
- **Database:** SQLite (zero setup)  
- **Security:** SHA-256 (client), bcrypt + JWT (server)  
- **Detection:** Pure JavaScript rules (no ML frameworks, no external APIs)
