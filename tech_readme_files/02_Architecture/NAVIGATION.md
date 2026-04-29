# Routing and deep links

Path constants and helpers live in [lib/core/routes/app_routes.dart](../../lib/core/routes/app_routes.dart). Section index ↔ URL mapping for the landing scroll lives in [lib/core/routes/portfolio_section_routes.dart](../../lib/core/routes/portfolio_section_routes.dart).

Router construction: [lib/core/config/routes/app_router.dart](../../lib/core/config/routes/app_router.dart).

## Portfolio shell

- **Home** — path `/`; scroll index `0` (hero).
- **Sections** — single route `/:section(about|skills|experience|projects|certificates|contact)`; indices `1`–`6` match the vertical order on [PortfolioPage](../../lib/features/home/presentation/pages/portfolio_page.dart).
- **Page** — `NoTransitionPage` uses a stable `ValueKey` so section changes update the same shell where possible.
- **URL sync** — Choosing a section (app bar, drawer, footer, hero, FAB) calls `context.go` to the canonical path. Scrolling updates the URL after a short debounce when the visible section changes.
- **Legacy redirects** — `/education` → `/about`, `/services` → `/projects`, `/blog` and `/blog/*` → `/`, `/privacy`, `/terms`, `/404` → `/`.

Invalid `/project/:slug` values redirect home when `ProjectsRepository.resolveProjectSegment` returns null.

## Project case study

`GoRoute` path `${AppRoutes.projectPrefix}/:pid` (i.e. `/project/:pid`); opened with `context.push` so the system back gesture/button returns to the previous location.
