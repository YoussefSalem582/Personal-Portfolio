# Changelog

All notable changes to **Youssef Hassan Portfolio** (Flutter Web) are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added

- **Contact form build overrides** — `lib/config/contact_runtime_config.dart` resolves Formspree URL and recipient email from optional `--dart-define=FORMSPREE_ENDPOINT` / `CONTACT_RECIPIENT_EMAIL`, falling back to `lib/config/api_keys.dart`. GitHub Actions workflow and `scripts/build_optimized.ps1` / `build_optimized.sh` pass defines when env/secrets are set. Documented in `tech_readme_files/04_Contact_And_Deploy/CONTACT_FORM.md` and root `README.md`.

### Changed

- **Docs (contact / deploy)** — Expanded `tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md` with GitHub Actions secrets; linked `contact_runtime_config.dart` and [`.env.example`](.env.example) from `DOCUMENTATION_MAP.md`, `CONTACT_FORM.md`, `04_Contact_And_Deploy/README.md`, and root `README.md`.
- **Package metadata** — Replaced default `pubspec.yaml` description with a short portfolio summary.
- **Documentation & contributing** — Contributing pointers in root `README.md`; `tech_readme_files/README.md` IDE/AI table; `DOCUMENTATION_MAP.md` agent links; neutralized misleading `lib/core/` doc comments (`app_bloc_observer`, `usecase`, `failures`).
- **AI / editor tooling** — Realigned `.agents/`, `.cursor/rules`, `.cursor/skills`, ignore files, and `.claude/commands` with this repo; trimmed `.claude/settings.json` and `.claude/settings.local.json` (removed unsafe/third-project Bash allowlists). Updated `.claude/commands/test.md` for current `test/` layout and failure types.

Older commits may still contain a changelog for a different product; that history was removed from this file as misleading.

## [1.0.0]

### Added

- Baseline Flutter Web portfolio (projects, certificates, contact, bilingual content, GitHub Pages deployment). See `README.md` and `tech_readme_files/` for architecture and deployment.
