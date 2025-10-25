import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/portfolio_screen.dart';
import '../screens/project_case_study.dart';
import '../bindings/initial_bindings.dart';
import '../controllers/portfolio_controller.dart';
import 'app_routes.dart';
// Admin routes disabled for static deployment
// import 'admin_routes.dart';

/// Application pages configuration
///
/// Defines all routes and their corresponding pages with bindings
class AppPages {
  // Prevent instantiation
  AppPages._();

  /// Initial route for the app
  static const initial = AppRoutes.home;

  /// Transition duration for all routes
  static const transitionDuration = Duration(milliseconds: 400);

  /// List of all application routes with enhanced transitions
  static final routes = [
    // ==================== Main Routes ====================

    // Home/Portfolio Screen
    GetPage(
      name: AppRoutes.home,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      curve: Curves.easeInOut,
      preventDuplicates: true,
    ),

    // ==================== Project Routes ====================

    // Project Case Study Screen (by ID)
    GetPage(
      name: AppRoutes.project,
      page: () {
        final projectId = Get.parameters['id'] ?? '';

        try {
          final controller = Get.find<PortfolioController>();

          final project = controller.projects.firstWhereOrNull(
            (p) => p.id == projectId,
          );

          if (project == null) {
            // Redirect to home if project not found
            Future.microtask(() => Get.offAllNamed(AppRoutes.home));
            return const PortfolioScreen();
          }

          return ProjectCaseStudy(project: project);
        } catch (e) {
          Future.microtask(() => Get.offAllNamed(AppRoutes.home));
          return const PortfolioScreen();
        }
      },
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubicEmphasized,
      customTransition: ProjectPageTransition(),
      opaque: true,
      fullscreenDialog: false,
    ),

    // Project Case Study Screen (by Slug - SEO friendly)
    GetPage(
      name: AppRoutes.projectSlug,
      page: () {
        final slug = Get.parameters['slug'] ?? '';
        final controller = Get.find<PortfolioController>();

        // Find project by slug or title match
        final project = controller.projects.firstWhereOrNull(
          (p) => p.title.toLowerCase().replaceAll(' ', '-') == slug,
        );

        if (project == null) {
          Future.microtask(() => Get.offAllNamed(AppRoutes.home));
          return const PortfolioScreen();
        }

        return ProjectCaseStudy(project: project);
      },
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubicEmphasized,
      customTransition: ProjectPageTransition(),
      opaque: true,
      fullscreenDialog: false,
    ),

    // ==================== Section Routes (Deep Linking) ====================

    // About Section
    GetPage(
      name: AppRoutes.about,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Skills Section
    GetPage(
      name: AppRoutes.skills,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Projects Section
    GetPage(
      name: AppRoutes.projects,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Certificates Section
    GetPage(
      name: AppRoutes.certificates,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Experience Section
    GetPage(
      name: AppRoutes.experience,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Education Section
    GetPage(
      name: AppRoutes.education,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Services Section
    GetPage(
      name: AppRoutes.services,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Contact Section
    GetPage(
      name: AppRoutes.contact,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // Blog Section
    GetPage(
      name: AppRoutes.blog,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
      preventDuplicates: true,
    ),

    // ==================== Legal & Info Routes ====================

    // Privacy Policy
    GetPage(
      name: AppRoutes.privacy,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),

    // Terms of Service
    GetPage(
      name: AppRoutes.terms,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: transitionDuration,
    ),

    // ==================== Error Routes ====================

    // 404 Not Found
    GetPage(
      name: AppRoutes.notFound,
      page: () => const PortfolioScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
    ),

    // Admin routes disabled for static deployment
    // Uncomment the line below to enable admin dashboard
    // ...AdminPages.routes,
  ];

  /// Unknown route handler (404 page)
  /// Redirects any unknown route to home page
  static GetPage unknownRoute = GetPage(
    name: '/404',
    page: () => const PortfolioScreen(),
    binding: InitialBindings(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 200),
  );

  /// Custom transition builder for advanced animations
  static Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )? customTransition(String routeName) {
    // Add custom transitions based on route
    if (routeName.contains('/project/')) {
      return (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubic;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      };
    }
    return null;
  }
}

/// Custom page transition for Project Case Study screen
///
/// Entrance: Slide from right to left with fade
/// Exit: Slide from left to right without fade
class ProjectPageTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve ?? Curves.easeInOutCubicEmphasized,
      reverseCurve: Curves.easeInOutCubic,
    );

    // Fade animation: opacity from 0 to 1 on enter, stays 1 on exit
    final fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    ));

    // Slide animation: right to left on enter, reverses on exit
    final slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0), // Start from right
      end: Offset.zero, // End at center
    ).animate(curvedAnimation);

    // Only apply fade on forward animation (entering)
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: child,
      ),
    );
  }
}
