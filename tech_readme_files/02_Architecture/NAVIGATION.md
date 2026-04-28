# Navigation (go_router)

## Definitions

Path constants and helpers live in [lib/routes/app_routes.dart](../../lib/routes/app_routes.dart).

Router construction: [lib/config/routes/app_router.dart](../../lib/config/routes/app_router.dart).

## Main routes

| Path | Screen / behavior |
|------|-------------------|
| `/` | [PortfolioPage](../../lib/features/home/presentation/pages/portfolio_page.dart) (hero first; optional initial section via query-less home) |
| `/about`, `/skills`, `/experience`, `/projects`, `/certificates`, `/contact`, … | Same `PortfolioPage` with `initialSectionIndex` mapped from `_sectionPathToIndex` |
| `/project/:pid` | [ProjectCaseStudy](../../lib/features/projects/presentation/pages/project_case_study.dart); `pid` is **id or title slug** |
| `/404` | Portfolio shell with mapped section index |

## Project resolution

Invalid project segments redirect to home:

- [ProjectsRepository.resolveProjectSegment](../../lib/features/projects/domain/repositories/projects_repository.dart) is called from `_portfolioRedirect` in `app_router.dart`.
- Injection: `sl<ProjectsRepository>()`.

## Transitions

Case study uses a custom `CustomTransitionPage` (slide + fade). Home shell uses `NoTransitionPage` for section routes to avoid flashing.

## Root navigator

`rootNavigatorKey` in `app_router.dart` is used for overlays that need the root `Navigator` context.
