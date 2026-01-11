# Copilot instructions (Flutter Web portfolio)

## Big picture
- This is a Flutter Web single-page portfolio, deployed to GitHub Pages.
- Runtime architecture is intentionally **static**: UI reads from local data + local assets; the only network call is the **contact form** submission.

## Key architecture (start here)
- App entrypoint and app-wide wiring: [lib/main.dart](../lib/main.dart)
  - `GetMaterialApp` + `InitialBindings` + `AppPages.routes`
  - Responsive breakpoints via `responsive_framework`.
- Dependency injection (GetX): [lib/bindings/initial_bindings.dart](../lib/bindings/initial_bindings.dart)
  - Controllers are registered with `Get.put(..., permanent: true)`.
- Routing (GetX): [lib/routes/app_routes.dart](../lib/routes/app_routes.dart) and [lib/routes/app_pages.dart](../lib/routes/app_pages.dart)
  - `'/project/:id'` and SEO-friendly `'/project/:slug'` resolve a `Project` from `PortfolioController`.
- “Home page” is a sectioned single screen: [lib/screens/portfolio_screen.dart](../lib/screens/portfolio_screen.dart)
  - Uses `CustomScrollView` + `SliverToBoxAdapter` sections and a `ScrollController` to track the active section.

## Data model + content
- Portfolio content is **static** and centralized under [lib/utils/data](../lib/utils/data):
  - Aggregator: [lib/utils/data/portfolio_data.dart](../lib/utils/data/portfolio_data.dart)
  - Per-section data files: `personal_info_data.dart`, `projects_data.dart`, `skills_data.dart`, etc.
- UI reads content via `PortfolioController`: [lib/controllers/portfolio_controller.dart](../lib/controllers/portfolio_controller.dart)
  - Prefer updating `PortfolioData` (or its section files) over hardcoding strings in widgets.

## Assets + design system conventions
- Prefer the app’s centralized constants rather than raw literals:
  - Barrel: [lib/utils/assets/app_constants.dart](../lib/utils/assets/app_constants.dart)
  - Images: `AppImages.*` (see [lib/utils/assets/app_images.dart](../lib/utils/assets/app_images.dart))
  - Colors/typography: `AppColors`, `AppFonts` (same folder)
- Image widgets are optimized for assets-first rendering:
  - [lib/widgets/smart_image.dart](../lib/widgets/smart_image.dart) and [lib/widgets/lazy_image.dart](../lib/widgets/lazy_image.dart)
- There is also FlutterGen output ([lib/utils/assets.gen.dart](../lib/utils/assets.gen.dart)) — treat it as **generated code**.

## Contact form (only network integration)
- Contact form submits to **Formspree** using `Dio`:
  - [lib/widgets/contact_section/contact_form_widget.dart](../lib/widgets/contact_section/contact_form_widget.dart)
  - Endpoint config: [lib/config/api_keys.dart](../lib/config/api_keys.dart) (`ApiKeys.formspreeEndpoint`)
- File/document opening on web uses GitHub URLs (Pages/raw) via:
  - [lib/utils/url_helper.dart](../lib/utils/url_helper.dart) + [lib/config/app_config.dart](../lib/config/app_config.dart)
  - If you change repo/branch, update `AppConfig.githubOwner/githubRepo/githubBranch`.

## Developer workflows (commands that matter)
- Local dev: `flutter pub get`; `flutter run -d chrome`
- Tests: `flutter test` (see [test/portfolio_test.dart](../test/portfolio_test.dart))
- Production web build (GitHub Pages base-href is required):
  - `flutter build web --release --base-href "/Youssef-Hassan-Portfolio/" --no-source-maps`
- CI deploy: [\.github/workflows/deploy.yml](workflows/deploy.yml)

## Repo hygiene / gotchas
- Prefer editing sources under `lib/` + `web/`; `docs/` contains built web artifacts and is not the place to make feature changes.
- Some legacy/static-deployment comments exist (e.g., “Admin disabled”, Supabase references in skill lists); confirm real usage before reintroducing backend code.
