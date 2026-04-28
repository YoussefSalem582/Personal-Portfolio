---
name: add-feature
description: Scaffold a new portfolio feature (data / domain / presentation), wire GetIt, routing, and ARB strings. Use for new sections or major UI areas.
---

# Add new feature (portfolio)

> **Context:** **Youssef Hassan Portfolio** — Flutter Web, repo root `lib/features/<name>/`.

## When to use

- New scroll section, page, or self-contained area with its own state

## Primary reference

`tech_readme_files/02_Architecture/FEATURE_MODULES.md` and an existing feature such as `lib/features/about/` or `lib/features/projects/`.

## Folder shape

```
lib/features/<feature_name>/
├── data/
│   ├── datasources/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/    # optional
    └── widgets/  # optional
```

## Guidelines

1. **Domain** — Entities + abstract repository + use cases (`Either` via `dartz` matches existing code).
2. **Data** — Local datasources (Dart/maps/assets) and/or remote (see contact feature); repository impl maps errors to failures.
3. **Presentation** — `*_event.dart`, `*_state.dart`, `*_bloc.dart`; use `BlocProvider` where the UI subtree needs the bloc (see `portfolio_page.dart` patterns).
4. **DI** — `lib/injection_container.dart`: lazy singletons for repos/use cases, `registerFactory` for BLoCs unless a singleton is clearly intended.
5. **Routes** — If a new path is needed: add to `lib/routes/app_routes.dart` and `lib/config/routes/app_router.dart` (and deep-link / section map if applicable).
6. **Strings** — `lib/l10n/app_en.arb` and `lib/l10n/app_ar.arb`, then `flutter gen-l10n`.
7. **Shared UI** — Prefer `lib/widgets/` for reusable pieces.

## Checklist

- [ ] Three layers consistent with sibling features
- [ ] Registered in `injection_container.dart`
- [ ] BLoC provided where the UI mounts
- [ ] Routes updated if user-navigable
- [ ] ARB + `flutter gen-l10n`
- [ ] `CHANGELOG.md` (+ `tech_readme_files/` if architecture docs change)

Do **not** assume `RouteNames`, `lib/shared/widgets/`, `ApiClient`, offline queue, or cache policy exist here.
