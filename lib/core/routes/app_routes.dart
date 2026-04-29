/// Application routes (paths for [GoRouter])
abstract class AppRoutes {
  // Prevent instantiation
  AppRoutes._();

  /// Home/Portfolio screen route
  static const home = '/';

  /// Path segment for project case study URLs: `{projectPrefix}/:pid`
  static const projectPrefix = '/project';

  /// Contact section direct route (for deep linking)
  static const contact = '/contact';

  /// About section direct route (for deep linking)
  static const about = '/about';

  /// Skills section direct route (for deep linking)
  static const skills = '/skills';

  /// Certificates section direct route (for deep linking)
  static const certificates = '/certificates';

  /// Projects section direct route (for deep linking)
  static const projects = '/projects';

  /// Experience section direct route (for deep linking)
  static const experience = '/experience';

  /// Education section direct route (for deep linking)
  static const education = '/education';

  /// Services section direct route (for deep linking)
  static const services = '/services';

  /// Blog section direct route (legacy; redirects to [home] in router)
  static const blog = '/blog';

  /// Privacy policy route
  static const privacy = '/privacy';

  /// Terms of service route
  static const terms = '/terms';

  /// 404 Not found route
  static const notFound = '/404';

  /// Helper methods for navigation

  /// Navigate to project by ID or title slug.
  static String getProjectRoute(String id) => '$projectPrefix/$id';

  /// Alias for [getProjectRoute]; IDs and slugs share the same path shape.
  static String getProjectSlugRoute(String slug) => '$projectPrefix/$slug';

  /// Canonical path for a named section segment (e.g. `about` → `/about`).
  static String getSectionRoute(String section) {
    final s = section.startsWith('/') ? section.substring(1) : section;
    return '/$s';
  }

  /// Whether [route] is a primary portfolio section path (deep links).
  static bool isSectionRoute(String route) {
    var r = route;
    if (r.isEmpty) {
      return false;
    }
    if (r != '/' && r.endsWith('/')) {
      r = r.substring(0, r.length - 1);
    }
    return r == about ||
        r == skills ||
        r == projects ||
        r == certificates ||
        r == experience ||
        r == contact;
  }
}
