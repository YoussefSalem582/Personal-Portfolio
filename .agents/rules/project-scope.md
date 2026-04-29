# Project scope

**Repository**: Flutter Web portfolio (`youssef_hassan_portfolio`) at the repo root. Not the Technology 92 mobile codebase.

## Stack

- **UI**: Flutter Web, `responsive_framework`, shared widgets under `lib/core/widgets/`.
- **State**: `flutter_bloc` (feature/section BLoCs).
- **DI**: `get_it` — `lib/injection_container.dart`.
- **Routes**: `go_router` — `lib/core/config/routes/app_router.dart`; constants `lib/core/routes/app_routes.dart`.
- **Data**: Local datasources + `lib/features/<name>/data/local/`; **contact** uses Dio → Formspree (`lib/core/config/api_keys.dart` / `contact_runtime_config.dart`).
- **l10n**: `lib/l10n/app_en.arb`, `lib/l10n/app_ar.arb` → `flutter gen-l10n`.

## Entry points

`lib/main.dart` → `lib/app.dart` → `MaterialApp.router` + registered `GoRouter`.

## Feature modules

`lib/features/` — typical layout: `data/`, `domain/`, `presentation/` (bloc + widgets/pages). Examples: `hero`, `about`, `skills`, `expertise`, `projects`, `certificates`, `contact`, `home`, `theme`, `locale`.

See `tech_readme_files/DOCUMENTATION_MAP.md` and `AGENTS.md` for detail.
