import 'package:go_router/go_router.dart';

import 'app_routes.dart';

/// Maps portfolio scroll indices (0–6) to canonical URL paths and back.
///
/// Used by [GoRouter] and [PortfolioPage] for URL ↔ section sync.
abstract final class PortfolioSectionRoutes {
  PortfolioSectionRoutes._();

  /// [GoRoute] path with a constrained `:section` parameter (leading slash).
  static const canonicalSectionPath =
      '/:section(about|skills|experience|projects|certificates|contact)';

  /// Path parameter name on [canonicalSectionPath].
  static const sectionParam = 'section';

  static const List<String> _orderedSegments = [
    'about',
    'skills',
    'experience',
    'projects',
    'certificates',
    'contact',
  ];

  /// Canonical path for scroll index [index] ([AppRoutes.home] for 0).
  static String pathForIndex(int index) {
    if (index <= 0) {
      return AppRoutes.home;
    }
    if (index > _orderedSegments.length) {
      return AppRoutes.home;
    }
    return '/${_orderedSegments[index - 1]}';
  }

  /// Scroll index for a `:section` path parameter value, or null if unknown.
  static int? indexForSegment(String segment) {
    final i = _orderedSegments.indexOf(segment);
    if (i < 0) {
      return null;
    }
    return i + 1;
  }

  /// Initial scroll index from a portfolio shell [GoRouterState] (home or section route).
  static int initialIndexFromState(GoRouterState state) {
    final segment = state.pathParameters[sectionParam];
    if (segment != null) {
      return indexForSegment(segment) ?? 0;
    }
    return 0;
  }

  /// True if [path] is the home path (handles trailing slash).
  static bool isHomePath(String path) {
    final p = normalizePath(path);
    return p.isEmpty || p == '/';
  }

  /// Normalizes paths for comparison.
  static String normalizePath(String path) {
    if (path.isEmpty) {
      return '/';
    }
    if (path != '/' && path.endsWith('/')) {
      return path.substring(0, path.length - 1);
    }
    return path;
  }

  /// Whether [path] already matches the portfolio URL for [index].
  static bool pathMatchesIndex(String path, int index) {
    return normalizePath(path) == normalizePath(pathForIndex(index));
  }
}
