# Architecture overview

## What this app is

- **Flutter Web** portfolio (single landing + project case-study routes).
- **Mostly static content**: Dart lists and strings under [lib/utils/data/](../../lib/utils/data/) and models under [lib/models/](../../lib/models/).
- **Primary network call**: contact form submission (Formspree via Dio).

## Stack

| Concern | Package / approach |
|---------|-------------------|
| UI state (per section) | `flutter_bloc` |
| Global theme / locale | `ThemeBloc`, `LocaleBloc` in [lib/app.dart](../../lib/app.dart) |
| DI | `get_it` ([lib/injection_container.dart](../../lib/injection_container.dart)) |
| Routing | `go_router` ([lib/config/routes/app_router.dart](../../lib/config/routes/app_router.dart)) |
| Errors in domain | `dartz` `Either` + [lib/core/error/failures.dart](../../lib/core/error/failures.dart) (where used) |

## Layering (per feature)

Each feature under [lib/features/](../../lib/features/) typically follows:

1. **Domain** — repository interfaces, entities, use cases (no Flutter imports).
2. **Data** — `*_local_datasource` (+ impl), `*_repository_impl`, optional remote datasource (contact).
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

## Flow (read-only section)

```
Widget → Bloc → UseCase → Repository → LocalDataSource → utils/data / models
```

## Flow (contact submit)

```
ContactFormWidget → ContactBloc → SubmitContactUseCase → ContactRepository → ContactRemoteDataSource (Dio)
```
