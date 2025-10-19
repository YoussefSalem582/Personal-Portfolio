import 'package:get/get.dart';
import '../screens/portfolio_screen.dart';
import '../screens/project_case_study.dart';
import '../bindings/initial_bindings.dart';
import '../controllers/portfolio_controller.dart';
import 'app_routes.dart';
import 'admin_routes.dart';

/// Application pages configuration
///
/// Defines all routes and their corresponding pages with bindings
class AppPages {
  /// Initial route for the app
  static const initial = AppRoutes.home;

  /// List of all application routes (including admin routes)
  static final routes = [
    // Home/Portfolio Screen
    GetPage(
      name: AppRoutes.home,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Project Case Study Screen
    GetPage(
      name: AppRoutes.project,
      page: () {
        // Get project ID from route parameters
        final projectId = Get.parameters['id'] ?? '';
        final controller = Get.find<PortfolioController>();

        // Find the project by ID
        final project = controller.projects.firstWhere(
          (p) => p.id == projectId,
          orElse: () => controller.projects.first,
        );

        return ProjectCaseStudy(project: project);
      },
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Optional: Direct routes to sections (navigate to home for now)
    // Can be enhanced later to scroll to specific sections
    GetPage(
      name: AppRoutes.contact,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.about,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.skills,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.projects,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.certificates,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
    ),

    // Admin routes
    ...AdminPages.routes,
  ];

  /// Unknown route handler (404 page)
  static GetPage unknownRoute = GetPage(
    name: '/404',
    page: () => const PortfolioScreen(),
    transition: Transition.fadeIn,
  );
}
