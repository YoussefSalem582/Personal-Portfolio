# Codebase inventory

Structured checklist of **`lib/`** and **`test/`** as of the last doc refresh. Use this to find BLoCs, data layers, and tests quickly. Paths are relative to the repo root.

For how pieces fit together, see [OVERVIEW.md](OVERVIEW.md), [DEPENDENCY_INJECTION.md](DEPENDENCY_INJECTION.md), and [NAVIGATION.md](NAVIGATION.md).

---

## Entry points

| File | Role |
|------|------|
| `lib/main.dart` | `WidgetsFlutterBinding`, `AppBlocObserver`, web image cache caps, `initDependencies()`, `runApp` |
| `lib/app.dart` | `PortfolioApp`: global `ThemeBloc` / `LocaleBloc`, `MaterialApp.router`, `ResponsiveBreakpoints`, l10n |
| `lib/injection_container.dart` | GetIt `sl`; all registrations; `GoRouter` via `createPortfolioRouter` |

---

## Routing and app config

| File | Role |
|------|------|
| `lib/core/routes/app_routes.dart` | Path constants and helpers (`AppRoutes`) |
| `lib/core/routes/portfolio_section_routes.dart` | Landing section index ↔ canonical paths; `:section` route pattern |
| `lib/core/config/routes/app_router.dart` | `GoRouter` factory (`createPortfolioRouter`), redirects (invalid project, legacy aliases), stable portfolio shell page |
| `lib/core/config/contact_runtime_config.dart` | Formspree / recipient from `--dart-define` or `api_keys` |
| `lib/core/config/api_keys.dart` | Fallback Formspree URL and display email (template: `api_keys.dart.template`) |
| `lib/core/config/app_config.dart` | App-level URLs / constants (e.g. GitHub Pages base) |

---

## Core shared layer (`lib/core/`)

| Area | Location | Notes |
|------|-----------|--------|
| BLoC observer | `core/bloc/app_bloc_observer.dart` | Registered in `main.dart` |
| Domain error | `core/error/failures.dart` | Shared failure types |
| Use case typedef | `core/usecase/usecase.dart` | Shared `UseCase` contract |
| Locale (no `BuildContext`) | `core/locale/app_locale_binding.dart` | Updated from `LocaleBloc` in `app.dart` |
| Localized model copy | `core/localization/localized_extensions.dart` | AR overlays for entities |
| Theme | `core/theme/app_theme.dart` | Light / dark `ThemeData` |
| Responsive | `core/utils/responsive_helper.dart` | Breakpoint helpers |
| URLs | `core/utils/url_helper.dart` | External / document URLs |
| Design tokens & codegen | `core/utils/assets/` | `AppColors`, fonts, `assets.gen.dart`, `app_images.dart`, etc. |
| Widgets | `core/widgets/` | Navigation, sections (hero, about, skills, projects, certificates, contact), common, footer |

**Note:** Some legacy re-exports exist (e.g. `core/widgets/app_navigation.dart` alongside `core/widgets/navigation/`); prefer the navigation subfolder when adding imports.

---

## Features (`lib/features/`)

Legend: **BLoC** paths are `presentation/bloc/`. **DS** = datasource. **Repo** = `data/repositories/*_impl.dart`. **UC** = use case(s). **Local** = `data/local/*.dart`. **AR** = `data/localized/*` (Arabic or locale helpers).

### `about`

| Layer | Files |
|------|--------|
| BLoC | `about_bloc.dart`, `about_event.dart`, `about_state.dart` |
| Presentation | `about_section.dart` |
| DS | `about_local_datasource.dart`, `about_local_datasource_impl.dart` |
| Repo / UC | `about_repository.dart`, `about_repository_impl.dart`, `load_about_content_usecase.dart` |
| Domain entity | `about_content_entity.dart` |
| Local / AR | No `data/local`; impl aggregates `hero` / `projects` / `skills` local data |

### `certificates`

| Layer | Files |
|------|--------|
| BLoC | `certificates_bloc.dart`, `certificates_event.dart`, `certificates_state.dart` |
| Presentation | `certificates_section.dart` |
| DS | `certificates_local_datasource.dart`, `certificates_local_datasource_impl.dart` |
| Repo / UC | `certificates_repository.dart`, `certificates_repository_impl.dart`, `load_certificates_content_usecase.dart` |
| Entities | `certificate.dart`, `certificates_content_entity.dart` |
| Local | `data/local/certificates_data.dart` |
| AR | `data/localized/certificates_ar.dart` |

### `contact`

| Layer | Files |
|------|--------|
| BLoC | `contact_bloc.dart`, `contact_event.dart`, `contact_state.dart` |
| Presentation | `presentation/widgets/contact_section.dart` |
| DS | `contact_local_datasource.dart`, `contact_local_datasource_impl.dart`; `contact_remote_datasource.dart`, `contact_remote_datasource_impl.dart` (Dio) |
| Repo / UC | `contact_repository.dart`, `contact_repository_impl.dart`, `submit_contact_usecase.dart` |
| Domain | `contact_entities.dart`, `contact_submit_error.dart` |
| Local | `data/local/contact_data.dart` |

**Form UI (shared):** `lib/core/widgets/contact_section/contact_form_widget.dart` (and siblings: `submit_status_widget.dart`, etc.).

### `expertise`

| Layer | Files |
|------|--------|
| BLoC | `expertise_bloc.dart`, `expertise_event.dart`, `expertise_state.dart` |
| Presentation | `expertise_section.dart` |
| DS | `expertise_local_datasource.dart`, `expertise_local_datasource_impl.dart` |
| Repo / UC | `expertise_repository.dart`, `expertise_repository_impl.dart`, `load_expertise_content_usecase.dart` |
| Entities | `expertise.dart`, `expertise_content_entity.dart` |
| Local | `data/local/expertise_data.dart` |
| AR | `data/localized/expertise_ar.dart` |

### `hero`

| Layer | Files |
|------|--------|
| BLoC | `hero_bloc.dart`, `hero_event.dart`, `hero_state.dart` |
| Presentation | `hero_section.dart` |
| DS | `hero_local_datasource.dart`, `hero_local_datasource_impl.dart` |
| Repo / UC | `hero_repository.dart`, `hero_repository_impl.dart`, `load_hero_content_usecase.dart` |
| Entity | `hero_content_entity.dart` |
| Local | `data/local/personal_info_data.dart` |
| AR | `data/localized/personal_ar.dart`, `portfolio_strings.dart` |

### `home` (shell / section index)

| Layer | Files |
|------|--------|
| BLoC | `home_bloc.dart`, `home_event.dart`, `home_state.dart` — **not** registered on GetIt; provided by `PortfolioPage` |
| Page | `presentation/pages/portfolio_page.dart` |
| DS | `home_local_datasource.dart`, `home_local_datasource_impl.dart` |
| Repo / UC | `home_repository.dart`, `home_repository_impl.dart`, `resolve_initial_home_section_usecase.dart` |
| Entity | `home_layout.dart` |

### `locale`

| Layer | Files |
|------|--------|
| BLoC | `locale_bloc.dart`, `locale_event.dart`, `locale_state.dart` |
| Presentation | `locale_toggle_button.dart`, `locale_toggle_button_container.dart` |
| DS | `locale_local_datasource.dart`, `locale_local_datasource_impl.dart` |
| Repo / UC | `locale_repository.dart`, `locale_repository_impl.dart`, `load_initial_locale_usecase.dart`, `persist_locale_usecase.dart` |

### `projects`

| Layer | Files |
|------|--------|
| BLoC | `projects_bloc.dart`, `projects_event.dart`, `projects_state.dart` |
| Pages | `presentation/pages/project_case_study.dart` |
| Presentation widgets | `presentation/widgets/projects_section.dart`; `project_case_study/*` (gallery, documents, app bar, etc.); helpers e.g. `project_content_helper.dart` |
| DS | `projects_local_datasource.dart`, `projects_local_datasource_impl.dart` |
| Repo / UC | `projects_repository.dart`, `projects_repository_impl.dart`, `load_projects_content_usecase.dart` — **routing:** `resolveProjectSegment` |
| Domain | `domain/entities/project.dart`, `projects_content_entity.dart`; `domain/project_filter.dart` |
| Local | `data/local/projects_data.dart` |
| AR | `projects_ar.dart`, `project_case_study_data_ar.dart`, `case_study_documents_ar.dart`, `localized_gallery_category.dart`, `localized_project_filter.dart` |

### `skills`

| Layer | Files |
|------|--------|
| BLoC | `skills_bloc.dart`, `skills_event.dart`, `skills_state.dart` |
| Presentation | `skills_section.dart` |
| DS | `skills_local_datasource.dart`, `skills_local_datasource_impl.dart` |
| Repo / UC | `skills_repository.dart`, `skills_repository_impl.dart`, `load_skills_content_usecase.dart` |
| Entity | `skill.dart` |
| Local | `data/local/skills_data.dart` |
| AR | `data/localized/skills_category_ar.dart` |

### `theme`

| Layer | Files |
|------|--------|
| BLoC | `theme_bloc.dart`, `theme_event.dart`, `theme_state.dart` |
| Presentation | `theme_toggle.dart` |
| DS | `theme_local_datasource.dart`, `theme_local_datasource_impl.dart` |
| Repo / UC | `theme_repository.dart`, `theme_repository_impl.dart`, `load_initial_theme_mode_usecase.dart`, `persist_theme_mode_usecase.dart` |

---

## Localization (`lib/l10n/`)

| File | Role |
|------|------|
| `app_en.arb`, `app_ar.arb` | Source strings for codegen |
| `app_localizations.dart`, `app_localizations_en.dart`, `app_localizations_ar.dart` | Generated (`flutter gen-l10n`) |

---

## Tests (`test/`)

| File | Typical focus |
|------|----------------|
| `home_bloc_test.dart` | Home section bootstrap / routing |
| `projects_bloc_test.dart` | Projects listing / filters |
| `projects_repository_test.dart` | `ProjectsRepository` / segment resolution |
| `theme_bloc_test.dart` | Theme mode load / persist |

---

## Web and automation (repo root)

| Path | Role |
|------|------|
| `web/index.html`, `manifest.json`, `robots.txt`, `sitemap.xml` | Web shell, PWA, SEO |
| `web/service-worker.js` | Copied into `build/web` by CI / optimize scripts |
| `web/.htaccess`, `web/_headers` | Optional server hints |
| `scripts/build_optimized.ps1`, `scripts/build_optimized.sh` | Release build parity with CI |
| `.github/workflows/deploy.yml` | GitHub Pages deploy |

---

## GetIt registration summary

| Pattern | Registered types |
|---------|------------------|
| `registerSingleton` | `SharedPreferences` |
| `registerLazySingleton` | Repositories, most use cases, `ThemeBloc`, `LocaleBloc`, `GoRouter` |
| `registerFactory` | Section BLoCs: `ProjectsBloc`, `HeroBloc`, `AboutBloc`, `SkillsBloc`, `ExpertiseBloc`, `CertificatesBloc`, `ContactBloc` |

**Exception:** `HomeBloc` is constructed in `PortfolioPage` with `sl<ResolveInitialHomeSectionUseCase>()` and optional route section override.

---

## Maintenance

When you add or remove a feature file, update this inventory in the same PR. If the tree grows large, keep one row per feature in the summary tables and avoid duplicating every widget filename.
