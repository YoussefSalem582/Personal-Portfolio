# Copilot instructions (Flutter Web portfolio)

## Big picture
- Flutter Web single-page portfolio, deployed to **Vercel** (GitHub Actions builds Flutter; static output under `build/web`).
- Content is mostly **static**: per-feature Dart data under `lib/features/<name>/data/local/` (e.g. `projects_data.dart`, `personal_info_data.dart`) and types in each feature’s `domain/entities/` (no central `lib/models/`). The main **network** call is **contact form** submission (Formspree via Dio).

## Architecture
- **Entry:** [lib/main.dart](../lib/main.dart) — `WidgetsFlutterBinding`, `BlocObserver`, `initDependencies()`, `PortfolioApp`.
- **App shell:** [lib/app.dart](../lib/app.dart) — `MaterialApp.router`, global `ThemeBloc` + `LocaleBloc`; `AppLocaleBinding` updated from locale state.
- **Dependency injection:** [lib/injection_container.dart](../lib/injection_container.dart) — **GetIt** (`sl`). Registers repositories, use cases, and **factory** BLoCs for section-level features (hero, about, skills, expertise, projects, certificates, contact) plus theme/locale.
- **Routing:** [lib/core/config/routes/app_router.dart](../lib/core/config/routes/app_router.dart) — **go_router**. Path constants: [lib/core/routes/app_routes.dart](../lib/core/routes/app_routes.dart). Home is [lib/features/home/presentation/pages/portfolio_page.dart](../lib/features/home/presentation/pages/portfolio_page.dart). Project case study: [lib/features/projects/presentation/pages/project_case_study.dart](../lib/features/projects/presentation/pages/project_case_study.dart). Invalid `/project/:segment` redirects using `ProjectsRepository.resolveProjectSegment`.
- **Feature modules** (each uses **BLoC** with separate `*_event.dart` / `*_state.dart` / `*_bloc.dart` under `presentation/bloc/`, plus **`data/`** and **`domain/`**): `hero`, `about`, `skills`, `expertise`, `projects`, `certificates`, `contact`, `home` ([HomeBloc](../lib/features/home/presentation/bloc/home_bloc.dart) + `HomeRepository` / local datasource for bootstrap rules), `theme`, `locale`.

## Data and localization
- Static content: feature `data/local/*.dart` (e.g. [lib/features/projects/data/local/projects_data.dart](../lib/features/projects/data/local/projects_data.dart), [lib/features/hero/data/local/personal_info_data.dart](../lib/features/hero/data/local/personal_info_data.dart)).
- Entity types: per-feature `lib/features/<name>/domain/entities/` (e.g. [project.dart](../lib/features/projects/domain/entities/project.dart)).
- Arabic overlays for entities: per-feature `data/localized/*_ar.dart`.
- Shared extensions (localized titles, etc.): [lib/core/localization/localized_extensions.dart](../lib/core/localization/localized_extensions.dart).

## Contact form
- UI: [lib/core/widgets/contact_section/contact_form_widget.dart](../lib/core/widgets/contact_section/contact_form_widget.dart) dispatches to `ContactBloc`.
- Remote: [lib/features/contact/data/datasources/contact_remote_datasource_impl.dart](../lib/features/contact/data/datasources/contact_remote_datasource_impl.dart); URL from [lib/core/config/contact_runtime_config.dart](../lib/core/config/contact_runtime_config.dart) (`ContactRuntimeConfig.formspreeEndpoint`, optional `--dart-define`; fall back to [api_keys.dart](../lib/core/config/api_keys.dart)).

## Assets and web
- Constants/images: [lib/core/utils/assets/](../lib/core/utils/assets/).
- Theme: [lib/core/theme/app_theme.dart](../lib/core/theme/app_theme.dart).
- Document URLs: [lib/core/utils/url_helper.dart](../lib/core/utils/url_helper.dart) + [lib/core/config/app_config.dart](../lib/core/config/app_config.dart) (GitHub raw/Pages).

## Developer workflows
- Local: `flutter pub get`; `flutter run -d chrome`
- Tests: `flutter test` (e.g. [test/home_bloc_test.dart](../test/home_bloc_test.dart), [test/projects_bloc_test.dart](../test/projects_bloc_test.dart), [test/theme_bloc_test.dart](../test/theme_bloc_test.dart))
- Production web (example with Pages base-href): `flutter build web --release --base-href "/Youssef-Salem-Portfolio/" --no-source-maps`
- CI: [.github/workflows/deploy.yml](workflows/deploy.yml)
- Deep-dive docs for contributors: [tech_readme_files/README.md](../tech_readme_files/README.md)

## Repo hygiene
- Prefer editing under `lib/` and `web/`.
- The **`docs/`** folder is not kept in git (build output); production comes from GitHub Actions → **`build/web`**.
