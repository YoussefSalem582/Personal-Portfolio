/// Application route names
///
/// Centralized route management for GetX navigation
abstract class AppRoutes {
  /// Home/Portfolio screen route
  static const home = '/';

  /// Project case study route with dynamic ID parameter
  /// Usage: Get.toNamed(AppRoutes.project, parameters: {'id': 'project_id'})
  static const project = '/project/:id';

  /// Contact section direct route (optional - for deep linking)
  static const contact = '/contact';

  /// About section direct route (optional - for deep linking)
  static const about = '/about';

  /// Skills section direct route (optional - for deep linking)
  static const skills = '/skills';

  /// Certificates section direct route (optional - for deep linking)
  static const certificates = '/certificates';

  /// Projects section direct route (optional - for deep linking)
  static const projects = '/projects';
}
