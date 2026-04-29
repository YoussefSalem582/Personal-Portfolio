# Architecture overview

## What this app is

- **Flutter Web** portfolio (single landing + project case-study routes).
- **Mostly static content**: Dart lists and strings under **`lib/features/<name>/data/local/`**; domain types (e.g. `Project`, `Certificate`, `Skill`) live in each feature’s **`domain/entities/`** (no central `lib/models/` folder).
- **Primary network call**: contact form submission (Formspree via Dio).

## Stack

| Concern | Package / approach |
|---------|-------------------|
| UI state (per section) | `flutter_bloc` |
| Global theme / locale | `ThemeBloc`, `LocaleBloc` in [lib/app.dart](../../lib/app.dart) |
| DI | `get_it` ([lib/injection_container.dart](../../lib/injection_container.dart)) |
| Routing | `go_router` ([lib/core/config/routes/app_router.dart](../../lib/core/config/routes/app_router.dart)) + [lib/core/routes/app_routes.dart](../../lib/core/routes/app_routes.dart) |
| Errors in domain | `dartz` `Either` + [lib/core/error/failures.dart](../../lib/core/error/failures.dart) (where used) |

## Layering (per feature)

Each feature under [lib/features/](../../lib/features/) typically follows:

1. **Domain** — repository interfaces, entities, use cases (minimal Flutter in domain).
2. **Data** — `*_local_datasource` (+ impl), optional **`data/local/`** static lists, `*_repository_impl`, optional remote datasource (contact).
3. **Presentation** — `presentation/bloc/` (`*_event.dart`, `*_state.dart`, `*_bloc.dart`), widgets/pages.

**Dependency rule:** presentation → domain ← data.

## Features (landing + infrastructure)

| Feature | Role |
|---------|------|
| `home` | [PortfolioPage](../../lib/features/home/presentation/pages/portfolio_page.dart), `HomeBloc`, scroll/shell |
| `hero`, `about`, `skills`, `expertise`, `projects`, `certificates` | Section content loaders + UI |
| `contact` | Contact info + Formspree submit |
| `projects` | Grid filters, dialogs, **case study** page; `ProjectsRepository.resolveProjectSegment` for routing |
| `theme`, `locale` | Preferences via `SharedPreferences` |

## Shared core

- [lib/core/locale/app_locale_binding.dart](../../lib/core/locale/app_locale_binding.dart) — read Arabic vs English without a `BuildContext` (updated when locale BLoC builds).
- [lib/core/localization/localized_extensions.dart](../../lib/core/localization/localized_extensions.dart) — localized titles/descriptions for models.
- [lib/core/widgets/](../../lib/core/widgets/) — shared section UI (navigation, cards, contact form, …).
- [lib/core/utils/assets/](../../lib/core/utils/assets/) — design tokens; [lib/core/theme/app_theme.dart](../../lib/core/theme/app_theme.dart) — `ThemeData`.

## Flow (read-only section)

```
Widget → Bloc → UseCase → Repository → LocalDataSource → features/<name>/data/local + models
```

## Flow (contact submit)

```
ContactFormWidget → ContactBloc → SubmitContactUseCase → ContactRepository → ContactRemoteDataSource (Dio)
```
