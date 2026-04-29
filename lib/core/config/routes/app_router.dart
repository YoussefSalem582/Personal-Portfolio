import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/home/presentation/pages/portfolio_page.dart';
import '../../../features/projects/domain/repositories/projects_repository.dart';
import '../../../features/projects/presentation/pages/project_case_study.dart';
import '../../../injection_container.dart';
import '../../routes/app_routes.dart';
import '../../routes/portfolio_section_routes.dart';

/// Root navigator (snackbars, dialogs that need app-level context).
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

const ValueKey<String> _portfolioShellPageKey =
    ValueKey<String>('portfolio-shell');

/// Invalid `/project/:segment` → home when no project matches.
/// Legacy section aliases → canonical paths.
String? _portfolioGlobalRedirect(BuildContext context, GoRouterState state) {
  final segments = state.uri.pathSegments;
  if (segments.length >= 2 &&
      segments[0] == 'project' &&
      segments[1].isNotEmpty) {
    final segment = segments[1];
    if (sl<ProjectsRepository>().resolveProjectSegment(segment) == null) {
      return AppRoutes.home;
    }
    return null;
  }

  final path = PortfolioSectionRoutes.normalizePath(state.uri.path);

  if (path == PortfolioSectionRoutes.normalizePath(AppRoutes.education)) {
    return AppRoutes.about;
  }
  if (path == PortfolioSectionRoutes.normalizePath(AppRoutes.services)) {
    return AppRoutes.projects;
  }
  if (path == PortfolioSectionRoutes.normalizePath(AppRoutes.blog) ||
      path.startsWith(
          '${PortfolioSectionRoutes.normalizePath(AppRoutes.blog)}/')) {
    return AppRoutes.home;
  }
  if (path == PortfolioSectionRoutes.normalizePath(AppRoutes.privacy)) {
    return AppRoutes.home;
  }
  if (path == PortfolioSectionRoutes.normalizePath(AppRoutes.terms)) {
    return AppRoutes.home;
  }
  if (path == PortfolioSectionRoutes.normalizePath(AppRoutes.notFound)) {
    return AppRoutes.home;
  }

  return null;
}

Widget _projectCaseStudyTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOutCubicEmphasized,
    reverseCurve: Curves.easeInOutCubic,
  );

  final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: animation,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ),
  );

  final slideAnimation = Tween<Offset>(
    begin: const Offset(1.0, 0.0),
    end: Offset.zero,
  ).animate(curvedAnimation);

  return SlideTransition(
    position: slideAnimation,
    child: FadeTransition(
      opacity: fadeAnimation,
      child: child,
    ),
  );
}

NoTransitionPage<void> _portfolioShellPage({required int initialSectionIndex}) {
  return NoTransitionPage<void>(
    key: _portfolioShellPageKey,
    child: PortfolioPage(initialSectionIndex: initialSectionIndex),
  );
}

GoRouter createPortfolioRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    redirect: _portfolioGlobalRedirect,
    errorBuilder: (context, state) => const PortfolioPage(),
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => _portfolioShellPage(
          initialSectionIndex:
              PortfolioSectionRoutes.initialIndexFromState(state),
        ),
      ),
      GoRoute(
        path: PortfolioSectionRoutes.canonicalSectionPath,
        name: 'portfolio_section',
        pageBuilder: (context, state) => _portfolioShellPage(
          initialSectionIndex:
              PortfolioSectionRoutes.initialIndexFromState(state),
        ),
      ),
      GoRoute(
        path: '${AppRoutes.projectPrefix}/:pid',
        name: 'project_detail',
        pageBuilder: (context, state) {
          final segment = state.pathParameters['pid']!;
          final project =
              sl<ProjectsRepository>().resolveProjectSegment(segment)!;
          return CustomTransitionPage<void>(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 600),
            child: ProjectCaseStudy(project: project),
            transitionsBuilder: _projectCaseStudyTransition,
          );
        },
      ),
    ],
  );
}
