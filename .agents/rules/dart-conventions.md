# Dart conventions

## Imports

1. `dart:`
2. `package:flutter/...`
3. Other `package:...`
4. Relative imports (`../`, `../../`)

## Naming

- Files: `snake_case.dart`
- Classes: `PascalCase`
- Members: `camelCase`

## UI constants

- Prefer `AppColors` and existing helpers in `lib/core/utils/assets/` over raw `Color(0xFF...)`.
- Routes: use `AppRoutes` in `lib/core/routes/app_routes.dart`, not string literals.

## Localization

User-visible strings: ARB keys + generated `AppLocalizations`; run `flutter gen-l10n` after editing `lib/l10n/*.arb`.
