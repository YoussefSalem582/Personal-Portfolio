import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/portfolio/domain/repositories/portfolio_repository.dart';
import '../../features/portfolio/presentation/pages/portfolio_page.dart';
import '../../features/portfolio/presentation/pages/project_case_study.dart';
import '../../injection_container.dart';
import '../../routes/app_routes.dart';

/// Root navigator (snackbars, dialogs that need app-level context).
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// Section index map for [PortfolioPage] scroll (matches section order).
const Map<String, int> _sectionPathToIndex = {
  AppRoutes.about: 1,
  AppRoutes.skills: 2,
  AppRoutes.experience: 3,
  AppRoutes.projects: 4,
  AppRoutes.certificates: 5,
  AppRoutes.contact: 6,
  AppRoutes.education: 1,
  AppRoutes.services: 4,
  AppRoutes.blog: 0,
  AppRoutes.privacy: 0,
  AppRoutes.terms: 0,
  AppRoutes.notFound: 0,
};

/// Invalid `/project/:pid` → home (legacy GetX parity).
String? _portfolioRedirect(GoRouterState state) {
  final segments = state.uri.pathSegments;
  if (segments.length >= 2 &&
      segments[0] == 'project' &&
      segments[1].isNotEmpty) {
    final segment = segments[1];
    if (sl<PortfolioRepository>().resolveProjectSegment(segment) == null) {
      return AppRoutes.home;
    }
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

NoTransitionPage<void> _portfolioHomePage({int? initialSectionIndex}) {
  return NoTransitionPage<void>(
    child: PortfolioPage(initialSectionIndex: initialSectionIndex),
  );
}

GoRouter createPortfolioRouter() {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    redirect: (context, state) => _portfolioRedirect(state),
    errorBuilder: (context, state) => const PortfolioPage(),
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => _portfolioHomePage(),
      ),
      GoRoute(
        path: AppRoutes.about,
        name: 'about',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.about]),
      ),
      GoRoute(
        path: AppRoutes.skills,
        name: 'skills',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.skills]),
      ),
      GoRoute(
        path: AppRoutes.experience,
        name: 'experience',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.experience]),
      ),
      GoRoute(
        path: AppRoutes.projects,
        name: 'projects_list',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.projects]),
      ),
      GoRoute(
        path: AppRoutes.certificates,
        name: 'certificates',
        pageBuilder: (context, state) => _portfolioHomePage(
          initialSectionIndex: _sectionPathToIndex[AppRoutes.certificates],
        ),
      ),
      GoRoute(
        path: AppRoutes.contact,
        name: 'contact',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.contact]),
      ),
      GoRoute(
        path: AppRoutes.education,
        name: 'education',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.education]),
      ),
      GoRoute(
        path: AppRoutes.services,
        name: 'services',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.services]),
      ),
      GoRoute(
        path: AppRoutes.blog,
        name: 'blog',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.blog]),
      ),
      GoRoute(
        path: AppRoutes.privacy,
        name: 'privacy',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.privacy]),
      ),
      GoRoute(
        path: AppRoutes.terms,
        name: 'terms',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.terms]),
      ),
      GoRoute(
        path: AppRoutes.notFound,
        name: 'not_found',
        pageBuilder: (context, state) =>
            _portfolioHomePage(initialSectionIndex: _sectionPathToIndex[AppRoutes.notFound]),
      ),
      GoRoute(
        path: '${AppRoutes.projectPrefix}/:pid',
        name: 'project_detail',
        pageBuilder: (context, state) {
          final segment = state.pathParameters['pid']!;
          final project =
              sl<PortfolioRepository>().resolveProjectSegment(segment)!;
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
