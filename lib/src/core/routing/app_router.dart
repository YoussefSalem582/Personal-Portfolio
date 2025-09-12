import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/about/presentation/pages/about_page.dart';
import '../../features/projects/presentation/pages/projects_page.dart';
import '../../features/projects/presentation/pages/project_detail_page.dart';
import '../../features/experience/presentation/pages/experience_page.dart';
import '../../features/contact/presentation/pages/contact_page.dart';
import '../../features/blog/presentation/pages/blog_page.dart';
import '../../features/blog/presentation/pages/blog_detail_page.dart';
import '../../shared/widgets/app_scaffold.dart';

/// Provider for the app router
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return AppScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomePage(),
            ),
          ),
          GoRoute(
            path: '/about',
            name: 'about',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const AboutPage(),
              transitionsBuilder: _slideTransition,
            ),
          ),
          GoRoute(
            path: '/projects',
            name: 'projects',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const ProjectsPage(),
              transitionsBuilder: _slideTransition,
            ),
            routes: [
              GoRoute(
                path: ':projectId',
                name: 'project-detail',
                pageBuilder: (context, state) {
                  final projectId = state.pathParameters['projectId']!;
                  return CustomTransitionPage(
                    child: ProjectDetailPage(projectId: projectId),
                    transitionsBuilder: _slideTransition,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/experience',
            name: 'experience',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const ExperiencePage(),
              transitionsBuilder: _slideTransition,
            ),
          ),
          GoRoute(
            path: '/blog',
            name: 'blog',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const BlogPage(),
              transitionsBuilder: _slideTransition,
            ),
            routes: [
              GoRoute(
                path: ':blogId',
                name: 'blog-detail',
                pageBuilder: (context, state) {
                  final blogId = state.pathParameters['blogId']!;
                  return CustomTransitionPage(
                    child: BlogDetailPage(blogId: blogId),
                    transitionsBuilder: _slideTransition,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/contact',
            name: 'contact',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const ContactPage(),
              transitionsBuilder: _slideTransition,
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'The page "${state.uri.path}" could not be found.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});

/// Slide transition for page navigation
Widget _slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return SlideTransition(
    position: animation.drive(
      Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(
        CurveTween(curve: Curves.easeInOut),
      ),
    ),
    child: child,
  );
}

/// Route paths constants
class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String projects = '/projects';
  static const String experience = '/experience';
  static const String blog = '/blog';
  static const String contact = '/contact';

  static String projectDetail(String projectId) => '/projects/$projectId';
  static String blogDetail(String blogId) => '/blog/$blogId';
}
