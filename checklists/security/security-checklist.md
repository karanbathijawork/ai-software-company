# Security Checklist

Use this checklist before shipping any new product or major feature.

Based on OWASP Top 10 and common startup security requirements.

---

## Authentication and Access Control

- Authentication is required for all protected routes and APIs
- Passwords are hashed with bcrypt, Argon2, or equivalent — never stored plain
- Session tokens are not stored in localStorage — use httpOnly cookies or server-side sessions
- Tokens expire and can be revoked
- Failed login attempts are rate-limited
- Admin or privileged routes require additional authorization checks beyond login

---

## Input Validation

- All user input is validated on the server side — never trust client-side validation alone
- File uploads are restricted to expected types and sizes
- User-supplied data is not used to construct file paths, shell commands, or SQL queries
- HTML input is sanitized before rendering to prevent XSS

---

## Data Handling

- Sensitive data (PII, financial data, health data) is encrypted at rest
- Data is transmitted over HTTPS only — no HTTP in production
- Logs do not contain passwords, tokens, or sensitive user data
- User data can be deleted on request (GDPR / right to erasure)
- Database backups are encrypted and access-controlled

---

## Dependencies

- All third-party packages are from trusted sources
- Dependencies are pinned to known-good versions
- No packages with known critical CVEs are in use
- Dependency audit is part of the CI pipeline

---

## Secrets Management

- No secrets in source code or version control
- Environment variables are used for all credentials and API keys
- Production secrets are stored in a secrets manager (Vault, AWS Secrets Manager, Vercel environment variables)
- `.env` files are in `.gitignore`

---

## Infrastructure

- Production environment is not directly accessible from the public internet except on required ports
- Unnecessary ports and services are closed
- Database is not exposed to the public internet — accessed only through the application layer
- Production logs are retained for at least 30 days

---

## Error Handling

- Error responses do not expose stack traces, internal paths, or database schemas to users
- Generic error messages are shown in the UI — detailed errors go to logs only

---

## Pre-Launch Gate

Do not launch until:
- All critical and high items above are confirmed satisfied
- The Security Engineer has reviewed the threat model
- Penetration testing or a manual security review has been completed for any product handling sensitive user data
