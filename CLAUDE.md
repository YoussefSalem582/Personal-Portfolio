# Claude Instructions — Youssef Salem Portfolio

## Response style

- Be concise; prefer relative paths like `lib/injection_container.dart`.
- Ask before adding files that are not required.
- Finish one task before starting another.

## Environment

- **OS**: Windows — use PowerShell for scripts (`scripts/build_optimized.ps1`).
- **Flutter**: Web-first; `flutter run -d chrome` for local dev.
- **Safe commands** (no extra approval needed): `flutter pub get`, `flutter gen-l10n`, `flutter analyze`, `flutter test`, `dart format`, `flutter build web`.

## Project scope

Single Flutter package at repo root: **`youssef_salem_portfolio`** (`pubspec.yaml`). Not the Technology 92 monorepo; ignore any instructions that reference `technology_ninety_two_app/`, `ApiClient`, `EnvConfig`, Firebase, Sentry, or offline queues unless you are porting them in explicitly.

## Stack (short)

- BLoC + GetIt + GoRouter + Dio (contact) + `responsive_framework` + ARB l10n.
- Routes: `lib/core/routes/app_routes.dart`; router: `lib/core/config/routes/app_router.dart`.
- Shared UI: `lib/core/widgets/`; tokens/assets: `lib/core/utils/assets/`; theme: `lib/core/theme/app_theme.dart`.
- Static copy per feature: `lib/features/<name>/data/local/`.

## Design & code

- Reuse `AppColors` and patterns under `lib/core/utils/assets/` and `lib/core/widgets/`.
- User-facing strings: ARB + `flutter gen-l10n`.

## Secrets

Contact values: `lib/core/config/contact_runtime_config.dart` — optional `--dart-define=FORMSPREE_ENDPOINT` and `CONTACT_RECIPIENT_EMAIL`; otherwise `lib/core/config/api_keys.dart` (from `api_keys.dart.template`). Never commit unrelated production secrets.

## After substantive changes

1. **`CHANGELOG.md`** — Keep a Changelog–style entry under the current version.
2. **`tech_readme_files/`** — Update the relevant guide or `DOCUMENTATION_MAP.md` when behavior or workflow changes (this repo does not use `DOCUMENTATION_UPDATE_SUMMARY.md` / `CURRENT_STATUS.md` from other templates).

## Agent mirrors

`.agents/AGENTS.md` matches this project; `.cursor/rules/` holds Cursor-specific rule files.
