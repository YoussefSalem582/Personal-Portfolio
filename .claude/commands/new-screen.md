# New screen / page

Add a **new page** inside an **existing** `lib/features/<feature>/` module (for a whole new module, use `/add-feature`).

## When to use

- User wants another route or full-screen view next to existing ones (e.g. another case-study layout under `projects`)

## Ask first

1. **Feature** — e.g. `projects`, `home`, `contact`
2. **Screen name** — file/widget naming
3. **Routing** — new path under `lib/routes/app_routes.dart` / `lib/config/routes/app_router.dart` if user-navigable

## Steps (portfolio)

1. **Page** — `lib/features/<feature>/presentation/pages/<name>_page.dart` (follow structure of `project_case_study.dart` or similar).
2. **BLoC** — If needed: `*_event.dart`, `*_state.dart`, `*_bloc.dart` next to existing blocs; inject via `sl` in the page with `BlocProvider`.
3. **DI** — `lib/injection_container.dart`: `registerFactory` for new BLoC if created.
4. **Routes** — Extend `AppRoutes` and `createPortfolioRouter()`; invalid paths should mirror `_portfolioRedirect` patterns where relevant.
5. **l10n** — `lib/l10n/app_en.arb` + `app_ar.arb`, then `flutter gen-l10n`.
6. **Docs** — `CHANGELOG.md` (+ `tech_readme_files/02_Architecture/NAVIGATION.md` if routes change meaningfully).

## Checklist

- [ ] Matches existing portfolio theme/widgets (`AppColors`, shared `lib/widgets/`)
- [ ] No hardcoded user-facing strings
- [ ] BLoC/dispose patterns consistent with sibling pages

This repo does **not** use `RouteNames`, `CustomAppBar` + `context.showError` globally, `AppLogger`, `CachePolicy`, or `OfflineQueue` unless you add them.
