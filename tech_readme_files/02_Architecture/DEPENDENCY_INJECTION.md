# Dependency injection (GetIt)

## Access

Global locator: **`sl`** in [lib/injection_container.dart](../../lib/injection_container.dart).

```dart
import 'package:youssef_hassan_portfolio/injection_container.dart';

final repo = sl<ProjectsRepository>();
```

`initDependencies()` is awaited in [lib/main.dart](../../lib/main.dart) before `runApp`.

## Registration patterns

| Registration | Used for |
|--------------|----------|
| `registerSingleton<SharedPreferences>` | Single prefs instance |
| `registerLazySingleton<SomeRepository>` | One repository / use case for app lifetime |
| `registerLazySingleton` **ThemeBloc** / **LocaleBloc** | Single global bloc instances |
| `registerFactory(() => XBloc(...))` | **New BLoC per creation** — section blocs (hero, projects, …) so each visit to the home shell gets fresh state |

## Home shell exception

[HomeBloc](../../lib/features/home/presentation/bloc/home_bloc.dart) is **not** registered as a factory on GetIt. It needs `routeSectionOverride` from [PortfolioPage](../../lib/features/home/presentation/pages/portfolio_page.dart), so it is constructed in `BlocProvider(create: …)` while still using **`sl<ResolveInitialHomeSectionUseCase>()`** for the resolve use case.

## GoRouter

`GoRouter` is registered as `registerLazySingleton<GoRouter>(createPortfolioRouter)`.

The router uses `sl<ProjectsRepository>()` for invalid `/project/:segment` redirects.

## Adding a new feature service

1. Define **domain** repository + use case(s).
2. Implement **data** datasource + repository impl.
3. Register interfaces → impls → use cases → blocs in `initDependencies()` in dependency order.
4. Provide the bloc with `BlocProvider` on [PortfolioPage](../../lib/features/home/presentation/pages/portfolio_page.dart) (or app root for truly global blocs only).
