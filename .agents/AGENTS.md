# Youssef Hassan Portfolio — Agent Instructions

> **Scope**: This repository is the Flutter **Web** portfolio (`youssef_hassan_portfolio`). Work in the repo root (`lib/`, `web/`, `assets/`, `scripts/`, etc.). There is no nested `technology_ninety_two_app/` folder and no sibling backend/Next.js repos in this project.

## Project overview

- **Product**: Responsive portfolio site (hero, about, skills, expertise, projects, certificates, contact).
- **Platform**: Flutter Web (primary); PWA / GitHub Pages deployment.
- **State**: `flutter_bloc` — section/feature BLoCs.
- **DI**: `get_it` — registrations in `lib/injection_container.dart`.
- **Routing**: `go_router` — factory `createPortfolioRouter()`; path constants in `lib/routes/app_routes.dart` (use these, avoid hardcoded path strings).
- **Responsive**: `responsive_framework` + shared layout widgets under `lib/widgets/`.
- **Content**: Mostly local datasources under `lib/features/*/data/` plus JSON/asset-backed data; see `tech_readme_files/03_Content_And_L10n/`.
- **Contact**: Formspree (or compatible) HTTP POST via Dio — endpoint and keys in `lib/config/api_keys.dart` (copy from `api_keys.dart.template`; never commit secrets).
- **Localization**: ARB files `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` — run `flutter gen-l10n` after changes.
- **Assets**: Declared in `pubspec.yaml`; generated image class optional (`flutter_gen` → `lib/core/utils/` or `lib/utils/assets/app_images.dart` — follow existing imports in the file you edit).

## Entry points

| File | Role |
|------|------|
| `lib/main.dart` | `initDependencies()`, `runApp` |
| `lib/app.dart` | `MaterialApp.router`, theme, localization |
| `lib/injection_container.dart` | GetIt registrations |
| `lib/config/routes/app_router.dart` | `GoRouter` + deep links / project case study |
| `lib/features/home/presentation/pages/portfolio_page.dart` | Main scrolling portfolio shell |

## Feature layout

Features live under `lib/features/<name>/` with **data** (datasources, repositories impl), **domain** (entities, repository contracts, use cases), and **presentation** (bloc, pages, widgets). Shared UI belongs in `lib/widgets/` when reused across features.

Dependency direction: **presentation → domain ← data** (domain stays free of Flutter imports where possible).

## Conventions

- **Design tokens**: Use `AppColors`, typography/spacing helpers in `lib/utils/assets/` (and related theme code) — avoid raw hex in new UI unless extending `AppColors`.
- **Imports**: `dart:` → `package:flutter` → other `package:` → relative project imports.
- **Naming**: `snake_case` files, `PascalCase` types, `camelCase` members.
- **Routes**: `AppRoutes.home`, `AppRoutes.getProjectRoute(...)`, etc.

## Security

- Contact form URL and display email: prefer `ContactRuntimeConfig` with `--dart-define=FORMSPREE_ENDPOINT` / `CONTACT_RECIPIENT_EMAIL` for CI or local builds without editing files; otherwise `lib/config/api_keys.dart` (see `api_keys.dart.template`).
- Do not commit unrelated production secrets; use GitHub Actions **Secrets** for defines in Pages builds if you want values out of git.

## Tooling (approved without extra prompt)

`flutter pub get`, `flutter gen-l10n`, `flutter analyze`, `flutter test`, `dart format`, `flutter build web` (release pipeline may use `scripts/build_optimized.ps1`).

## Documentation

After meaningful changes, update `CHANGELOG.md`. For architecture or content workflow changes, adjust the relevant file under `tech_readme_files/` (see `tech_readme_files/DOCUMENTATION_MAP.md`).

## Skills / commands

Project-specific slash-command docs live in `.claude/commands/`. Legacy skills under `.agents/skills/` should be interpreted for **this** repo (Flutter Web portfolio), not the Technology 92 mobile app.
