import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../screens/admin/admin_login_screen.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/admin/projects_management_screen.dart';
import '../screens/admin/certificates_management_screen.dart';
import '../bindings/initial_bindings.dart';
import '../controllers/admin_controller.dart';

class AdminRoutes {
  static const String login = '/admin/login';
  static const String dashboard = '/admin/dashboard';
  static const String projects = '/admin/projects';
  static const String certificates = '/admin/certificates';
  static const String skills = '/admin/skills';
  static const String personalInfo = '/admin/personal-info';
}

class AdminPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AdminRoutes.login,
      page: () => const AdminLoginScreen(),
      binding: InitialBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AdminRoutes.dashboard,
      page: () => const AdminDashboardScreen(),
      binding: InitialBindings(),
      middlewares: [AdminAuthMiddleware()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AdminRoutes.projects,
      page: () => const ProjectsManagementScreen(),
      binding: InitialBindings(),
      middlewares: [AdminAuthMiddleware()],
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AdminRoutes.certificates,
      page: () => const CertificatesManagementScreen(),
      binding: InitialBindings(),
      middlewares: [AdminAuthMiddleware()],
      transition: Transition.fadeIn,
    ),
  ];
}

/// Middleware to protect admin routes
class AdminAuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    final adminController = Get.find<AdminController>();

    // If not authenticated, redirect to login
    if (!adminController.isAuthenticated) {
      return const RouteSettings(name: AdminRoutes.login);
    }

    return null;
  }
}
