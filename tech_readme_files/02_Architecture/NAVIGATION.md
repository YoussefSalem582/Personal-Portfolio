# Routing and deep links

Path constants and helpers live in [lib/core/routes/app_routes.dart](../../lib/core/routes/app_routes.dart).

Router construction: [lib/core/config/routes/app_router.dart](../../lib/core/config/routes/app_router.dart).

Invalid `/project/:slug` values redirect home when `ProjectsRepository.resolveProjectSegment` returns null.

Section paths (e.g. `/about`, `/skills`) map to scroll indices on [PortfolioPage](../../lib/features/home/presentation/pages/portfolio_page.dart) via `_sectionPathToIndex` inside the router file.
