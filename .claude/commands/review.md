# Review code

Audit files or a feature against **Youssef Hassan Portfolio** conventions (Flutter Web).

## When to use

- User asks to review, audit, or inspect code before merge

## Checklist

### Architecture

- Domain importing Flutter or presentation improperly
- Presentation bypassing use cases to reach repositories (if the feature uses use cases)
- Dependency direction: presentation → domain ← data

### Design tokens

- Prefer `AppColors` (and existing theme/text helpers) over raw `Color(0xFF...)` / ad-hoc `Colors.*` for brand surfaces
- Prefer existing spacing/constants patterns in the file’s section over magic numbers when a shared constant already exists
- Route paths: prefer `AppRoutes` / helpers in `lib/routes/app_routes.dart` over scattered string literals

### Localization

- User-facing strings should go through ARB / generated l10n, not raw literals (unless truly debug-only)
- Keys synchronized between `lib/l10n/app_en.arb` and `lib/l10n/app_ar.arb`

### Security

- No Formspree secrets or private keys in committed source — use `api_keys.dart` pattern / template
- No unrelated production credentials in repo

### BLoC

- Events/states extend `Equatable` with correct `props` where used
- Loading/error/loaded patterns consistent with sibling BLoCs in the repo

### DI

- BLoCs typically `registerFactory` unless a singleton is intentional; repos/use cases usually lazy singletons — match `injection_container.dart` patterns

### Code style

- Import order: `dart:` → `package:flutter` → other `package:` → relative
- Prefer `camelCase` for constants per Dart style in this codebase

**Do not** flag missing Technology 92–only concepts: `AppLogger`, `CachePolicy`, `OfflineQueue`, `ConnectivityCubit`, `RouteNames`, `StorageKeys`, `FlutterSecureStorage`, etc., unless they exist in this repo.

## Output format

For each issue:

```
[SEVERITY] File:line — Description
  Rule: <convention>
  Fix: <suggestion>
```

Severity: `ERROR`, `WARNING`, `INFO`. End with a count summary.
