# Changelog

All notable changes to **Youssef Salem Portfolio** (Flutter Web) are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Added

- **Hosting (Vercel)** — Static Flutter Web deployed via GitHub Actions using **`vercel deploy --prod`** from `build/web`; [`vercel.json`](vercel.json) SPA rewrites copied into the output folder; optional **`SITE_BASE_URL`** repository secret / `--dart-define` for canonical [`AppConfig.siteBaseUrl`](lib/core/config/app_config.dart); optional **`VERCEL_TOKEN`**, **`VERCEL_ORG_ID`**, **`VERCEL_PROJECT_ID`** for CLI deploy.

- **SEO & discoverability** — Aligned [`web/robots.txt`](web/robots.txt) and [`web/sitemap.xml`](web/sitemap.xml) with path URLs for portfolio sections and project case studies; canonical link, `og:image` dimensions, JSON-LD `Person`/`WebSite` in [`web/index.html`](web/index.html); [`web/llms.txt`](web/llms.txt). Documented in [`tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md`](tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md).

- **Routing helpers** — `lib/core/routes/portfolio_section_routes.dart` and `test/core/routes/portfolio_section_routes_test.dart` (index ↔ canonical section paths).

- **Documentation** — `tech_readme_files/02_Architecture/CODEBASE_INVENTORY.md`: structured checklist of features, BLoCs, datasources, core layout, tests, and GetIt patterns; linked from `DOCUMENTATION_MAP.md`, `tech_readme_files/README.md`, and `tech_readme_files/02_Architecture/README.md`.

- **Contact form build overrides** — `lib/core/config/contact_runtime_config.dart` resolves Formspree URL and recipient email from optional `--dart-define=FORMSPREE_ENDPOINT` / `CONTACT_RECIPIENT_EMAIL`, falling back to `lib/core/config/api_keys.dart`. GitHub Actions workflow and `scripts/build_optimized.ps1` / `build_optimized.sh` pass defines when env/secrets are set. Documented in `tech_readme_files/04_Contact_And_Deploy/CONTACT_FORM.md` and root `README.md`.

### Changed

- **Deployment** — Replaced GitHub Pages (subpath `/Youssef-Salem-Portfolio/`) with **Vercel**; `--base-href "/"`; canonical URLs in [`web/index.html`](web/index.html), [`web/sitemap.xml`](web/sitemap.xml), [`web/robots.txt`](web/robots.txt), [`web/manifest.json`](web/manifest.json); portfolio [`liveUrl`](lib/features/projects/data/local/projects_data.dart); removed Pages-specific CI/scripts steps (`404.html` SPA fallback copy, `.nojekyll`). Documented in [`README.md`](README.md) and [`tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md`](tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md).

- **Branding & identifiers** — Public display name updated from “Youssef Hassan” to “Youssef Salem”; Dart package **`youssef_salem_portfolio`**; CI/CD workflows, manifests, robots/sitemap, case-study project slug **`youssef-salem-portfolio`**, and resume PDF path **`Youssef-Salem-cv.pdf`** aligned with repo **`Youssef-Salem-Portfolio`** (rename the repo on GitHub and add/rename the resume asset to match URLs).

- **SEO & accessibility** — Enriched [`web/index.html`](web/index.html) (`lang`, `meta robots`, `application-name`, `og:locale`/`og:locale:alternate`, `link rel="sitemap"`); expanded JSON-LD (`email`, `address`, broader `sameAs`); aligned [`web/manifest.json`](web/manifest.json) (path-based PWA shortcuts, `theme_color` / `description`). Expanded [`web/llms.txt`](web/llms.txt). [`LazyImage`](lib/core/widgets/lazy_image.dart) supports `semanticLabel` with labels on project cards, case-study hero/gallery, and hero profile image. [`tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md`](tech_readme_files/04_Contact_And_Deploy/DEPLOYMENT.md) SEO table updated accordingly.

- **Routing** — Portfolio shell uses `/` plus `/:section(about|skills|experience|projects|certificates|contact)` with a stable page key; `PortfolioPage` syncs the URL (`context.go` on nav/footer/hero/FAB, debounced updates on scroll) and reacts to `initialSectionIndex` changes (browser back/forward). Legacy paths (`/education` → `/about`, `/services` → `/projects`, `/blog` including `/blog/*`, `/privacy`, `/terms`, `/404` → `/`) redirect in `GoRouter`. Removed unused `AppRoutes.blogPost` / `getBlogPostRoute`.

- **Docs: domain entities vs `lib/models/`** — Removed outdated references to a central `lib/models/` folder; entities live under `lib/features/<name>/domain/entities/`. Updated `tech_readme_files/02_Architecture/OVERVIEW.md`, `03_Content_And_L10n/DATA_AND_LOCALIZATION.md`, root `README.md`, and `.github/copilot-instructions.md`.
- **Documentation & agent rules** — Aligned `AGENTS.md`, `CLAUDE.md`, `.agents/`, `.cursor/`, `.github/copilot-instructions.md`, root `README.md`, and `tech_readme_files/` with the current layout: `lib/core/routes/app_routes.dart`, `lib/core/config/routes/app_router.dart`, `lib/core/config/*` (api keys, contact runtime, app config), `lib/core/widgets/`, `lib/core/utils/`, `lib/core/theme/`, and per-feature `data/local/` for static content. Updated `.gitignore` optional `api_keys` path and `pubspec.yaml` `flutter_gen` output. Fixed `CONTACT_FORM.md` UI section heading.
- **Package metadata** — Replaced default `pubspec.yaml` description with a short portfolio summary.
- **Documentation & contributing** — Contributing pointers in root `README.md`; `tech_readme_files/README.md` IDE/AI table; `DOCUMENTATION_MAP.md` agent links; neutralized misleading `lib/core/` doc comments (`app_bloc_observer`, `usecase`, `failures`).
- **AI / editor tooling** — Realigned `.agents/`, `.cursor/rules`, `.cursor/skills`, ignore files, and `.claude/commands` with this repo; trimmed `.claude/settings.json` and `.claude/settings.local.json` (removed unsafe/third-project Bash allowlists). Updated `.claude/commands/test.md` for current `test/` layout and failure types.

Older commits may still contain a changelog for a different product; that history was removed from this file as misleading.

## [1.0.0]

### Added

- Baseline Flutter Web portfolio (projects, certificates, contact, bilingual content). See `README.md` and `tech_readme_files/` for architecture and deployment.
