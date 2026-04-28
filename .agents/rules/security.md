# Security

- **Contact form** — Prefer `ContactRuntimeConfig` + `--dart-define=FORMSPREE_ENDPOINT` / `CONTACT_RECIPIENT_EMAIL` (or GitHub Actions Secrets in CI); fall back to `lib/config/api_keys.dart`. Document placeholders in `api_keys.dart.template`.
- Keep `.env` out of git if used; never paste secrets into `CHANGELOG.md`, rules, or agent settings.
- **Sanitize** Claude or other tool `settings.json` files: do not store keystores, passwords, or machine-specific paths to other projects.
