/// Application route names
///
/// Centralized route management for GetX navigation
abstract class AppRoutes {
  // Prevent instantiation
  AppRoutes._();

  /// Home/Portfolio screen route
  static const home = '/';

  /// Project case study route with dynamic ID parameter
  /// Usage: Get.toNamed(AppRoutes.project, parameters: {'id': 'project_id'})
  static const project = '/project/:id';

  /// Project details with slug (SEO friendly)
  /// Usage: Get.toNamed(AppRoutes.projectSlug, parameters: {'slug': 'project-name'})
  static const projectSlug = '/project/:slug';

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

  /// Blog section direct route (for deep linking)
  static const blog = '/blog';

  /// Blog post detail route
  static const blogPost = '/blog/:id';

  /// Privacy policy route
  static const privacy = '/privacy';

  /// Terms of service route
  static const terms = '/terms';

  /// 404 Not found route
  static const notFound = '/404';

  /// Helper methods for navigation

  /// Navigate to project by ID
  static String getProjectRoute(String id) => '/project/$id';

  /// Navigate to project by slug
  static String getProjectSlugRoute(String slug) => '/project/$slug';

  /// Navigate to blog post
  static String getBlogPostRoute(String id) => '/blog/$id';

  /// Navigate to section with scroll
  static String getSectionRoute(String section) => '/$section';

  /// Check if route is a section route
  static bool isSectionRoute(String route) {
    return route == about ||
        route == skills ||
        route == projects ||
        route == certificates ||
        route == experience ||
        route == education ||
        route == services ||
        route == contact ||
        route == blog;
  }
}
