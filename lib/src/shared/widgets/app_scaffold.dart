import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/theme_provider.dart';
import 'responsive_layout.dart';
import 'navigation_bar.dart';

/// Main scaffold wrapper for the application
class AppScaffold extends ConsumerWidget {
  final Widget child;

  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveLayout(
      mobile: _MobileScaffold(child: child),
      tablet: _TabletScaffold(child: child),
      desktop: _DesktopScaffold(child: child),
    );
  }
}

/// Mobile scaffold with bottom navigation
class _MobileScaffold extends ConsumerWidget {
  final Widget child;

  const _MobileScaffold({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youssef Hassan'),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeModeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: child,
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}

/// Tablet scaffold with navigation drawer
class _TabletScaffold extends ConsumerWidget {
  final Widget child;

  const _TabletScaffold({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youssef Salem Hassan'),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeModeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      drawer: const AppNavigationDrawer(),
      body: child,
    );
  }
}

/// Desktop scaffold with side navigation
class _DesktopScaffold extends ConsumerWidget {
  final Widget child;

  const _DesktopScaffold({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          const AppNavigationRail(),
          Expanded(
            child: Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  title: const Text('Youssef Salem Hassan - Flutter Developer'),
                  actions: [
                    IconButton(
                      icon: Icon(
                        ref.watch(themeModeProvider) == ThemeMode.dark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      onPressed: () =>
                          ref.read(themeModeProvider.notifier).toggleTheme(),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
