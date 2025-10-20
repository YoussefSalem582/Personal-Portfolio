import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../controllers/portfolio_controller.dart';
// Admin controller disabled for static deployment
// import '../controllers/admin_controller.dart';

/// Initial bindings for GetX dependency injection
/// This class registers all controllers when the app starts
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Lazy load controllers (only instantiated when first used)
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<PortfolioController>(() => PortfolioController());

    // Admin controller disabled for static deployment
    // Uncomment to enable admin dashboard:
    // Get.lazyPut<AdminController>(() => AdminController());
  }
}
