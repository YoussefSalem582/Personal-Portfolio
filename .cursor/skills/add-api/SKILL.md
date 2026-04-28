---
name: add-api
description: Add or change an HTTP integration in the portfolio (usually Dio + remote datasource). This app has no generic ApiClient; mirror the contact form pattern.
---

# Add / change HTTP integration (portfolio)

> **Context:** **Youssef Hassan Portfolio** is Flutter Web. Outbound calls are rare; the main example is **Formspree** from `lib/features/contact/data/datasources/contact_remote_datasource_impl.dart`.

## When to use

- User wants a new POST/GET to a third-party or simple backend from the portfolio
- Extending the contact flow or adding another small integration

## Reference

Read `tech_readme_files/04_Contact_And_Deploy/CONTACT_FORM.md` and the existing `ContactRemoteDataSource` + `ContactRepository` + `ContactBloc` wiring.

## Typical steps

1. **Config** — Add non-secret defaults to `lib/config/api_keys.dart.template`; real values in `lib/config/api_keys.dart` (not committed if gitignored).
2. **Datasource** — Implement HTTP with `Dio` in `data/datasources/` (abstract + `*_impl.dart` if you split).
3. **Repository** — Map errors to `Either` or domain-friendly failures consistent with existing code.
4. **Use case** — Single purpose class in `domain/usecases/` if the feature already uses use cases.
5. **BLoC** — Events/states/handlers; show clear UI feedback on failure.
6. **DI** — Register in `lib/injection_container.dart` (singletons for repos/use cases, factory for BLoCs as elsewhere).
7. **Docs** — Update `CHANGELOG.md` and `tech_readme_files/` if behavior is non-trivial.

Prefer **`ContactRuntimeConfig`** (`lib/config/contact_runtime_config.dart`) and `--dart-define=FORMSPREE_ENDPOINT` / `CONTACT_RECIPIENT_EMAIL` for CI; fall back to `lib/config/api_keys.dart` for local defaults.

Do **not** assume `ApiClient`, `ApiResponse`, `OfflineQueue`, or `CachePolicy` exist in this repo unless you are introducing them.
