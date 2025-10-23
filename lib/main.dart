import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';
import 'bindings/initial_bindings.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';

/// Main entry point - Static Portfolio App
/// No backend dependencies - uses only local assets and data
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize bindings first
    InitialBindings().dependencies();

    return GetMaterialApp(
      title: 'Youssef Salem Hassan - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Use system theme by default
      initialBinding: InitialBindings(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
