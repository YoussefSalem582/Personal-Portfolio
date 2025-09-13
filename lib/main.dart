import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'screens/portfolio_screen.dart';
import 'utils/portfolio_data.dart';
import 'providers/theme_provider.dart';
import 'providers/portfolio_data_provider.dart';
import 'services/supabase_service.dart';
import 'utils/supabase_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PortfolioDataProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: '${PortfolioData.fullName} - Portfolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          home: const PortfolioScreen(),
        );
      },
    );
  }
}
