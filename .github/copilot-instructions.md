# Copilot instructions (Flutter Web portfolio)

## Big picture
- Flutter Web single-page portfolio, deployed to GitHub Pages.
- Content is mostly **static** (local Dart data under `lib/utils/data/` and `lib/models/`). The main **network** call is **contact form** submission (Formspree via Dio).

## Architecture
- **Entry:** [lib/main.dart](../lib/main.dart) — `WidgetsFlutterBinding`, `BlocObserver`, `initDependencies()`, `PortfolioApp`.
- **App shell:** [lib/app.dart](../lib/app.dart) — `MaterialApp.router`, global `ThemeBloc` + `LocaleBloc`; `AppLocaleBinding` updated from locale state.
- **Dependency injection:** [lib/injection_container.dart](../lib/injection_container.dart) — **GetIt** (`sl`). Registers repositories, use cases, and **factory** BLoCs for section-level features (hero, about, skills, expertise, projects, certificates, contact) plus theme/locale.
- **Routing:** [lib/config/routes/app_router.dart](../lib/config/routes/app_router.dart) — **go_router**. Home is [lib/features/home/presentation/pages/portfolio_page.dart](../lib/features/home/presentation/pages/portfolio_page.dart). Project case study: [lib/features/projects/presentation/pages/project_case_study.dart](../lib/features/projects/presentation/pages/project_case_study.dart). Invalid `/project/:segment` redirects using `ProjectsRepository.resolveProjectSegment`.
- **Feature modules** (each uses **BLoC** with separate `*_event.dart` / `*_state.dart` / `*_bloc.dart` under `presentation/bloc/`, plus **`data/`** and **`domain/`**): `hero`, `about`, `skills`, `expertise`, `projects`, `certificates`, `contact`, `home` ([HomeBloc](../lib/features/home/presentation/bloc/home_bloc.dart) + `HomeRepository` / local datasource for bootstrap rules), `theme`, `locale`.

## Data and localization
- Static content files: [lib/utils/data/](../lib/utils/data/) (e.g. `projects_data.dart`, `personal_info_data.dart`).
- Models: [lib/models/](../lib/models/).
- Arabic overlays for entities: per-feature `data/localized/*_ar.dart`.
- Shared extensions (localized titles, etc.): [lib/core/localization/localized_extensions.dart](../lib/core/localization/localized_extensions.dart).

## Contact form
- UI: [lib/widgets/contact_section/contact_form_widget.dart](../lib/widgets/contact_section/contact_form_widget.dart) dispatches to `ContactBloc`.
- Remote: [lib/features/contact/data/datasources/contact_remote_datasource_impl.dart](../lib/features/contact/data/datasources/contact_remote_datasource_impl.dart); URL from [lib/config/contact_runtime_config.dart](../lib/config/contact_runtime_config.dart) (`ContactRuntimeConfig.formspreeEndpoint`, with optional `--dart-define` overrides; fall back to [api_keys.dart](../lib/config/api_keys.dart)).

## Assets and web
- Constants/images: [lib/utils/assets/](../lib/utils/assets/).
- Document URLs: [lib/utils/url_helper.dart](../lib/utils/url_helper.dart) + [lib/config/app_config.dart](../lib/config/app_config.dart) (GitHub raw/Pages).

## Developer workflows
- Local: `flutter pub get`; `flutter run -d chrome`
- Tests: `flutter test` (e.g. [test/home_bloc_test.dart](../test/home_bloc_test.dart), [test/projects_bloc_test.dart](../test/projects_bloc_test.dart), [test/theme_bloc_test.dart](../test/theme_bloc_test.dart))
- Production web (example with Pages base-href): `flutter build web --release --base-href "/Youssef-Hassan-Portfolio/" --no-source-maps`
- CI: [.github/workflows/deploy.yml](workflows/deploy.yml)
- Deep-dive docs for contributors: [tech_readme_files/README.md](../tech_readme_files/README.md)

## Repo hygiene
- Prefer editing under `lib/` and `web/`.
- The **`docs/`** folder is not kept in git (build output); production comes from GitHub Actions → **`build/web`**.
