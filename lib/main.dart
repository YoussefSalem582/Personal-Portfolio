import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'theme/app_theme.dart';
import 'bindings/initial_bindings.dart';
import 'services/supabase_service.dart';
import 'utils/supabase_test.dart';
import 'routes/app_pages.dart';
import 'config/supabase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
    debugPrint('✅ Environment variables loaded');
  } catch (e) {
    debugPrint('⚠️ .env file not found, using default configuration: $e');
    // Continue with default values from SupabaseConfig
  }

  // Initialize Supabase
  try {
    await SupabaseService.initialize();
    debugPrint('✅ Supabase initialized successfully');

    // Test connection in debug mode
    if (kDebugMode) {
      await SupabaseTest.testConnection();
    }
  } catch (e) {
    debugPrint('❌ Supabase initialization failed: $e');
    // Continue with app initialization - will use static data
  }

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize bindings first
    InitialBindings().dependencies();

    return GetMaterialApp(
      title: SupabaseConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode
          .dark, // Use Get.find<ThemeController>().themeMode after binding
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
