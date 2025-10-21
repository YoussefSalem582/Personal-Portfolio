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
    // Put controllers permanently (persist across routes)
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<PortfolioController>(PortfolioController(), permanent: true);
  }
}
