import 'package:get/get.dart';
import '../models/project.dart';
import '../models/certificate.dart';
import '../models/skill.dart';
import '../utils/data/portfolio_data.dart';

/// Portfolio Controller - Static Data Version
/// This controller uses only local assets and static data
/// No backend/database dependencies required
class PortfolioController extends GetxController {
  // Loading state (for future enhancements if needed)
  final RxBool _isLoading = false.obs;

  // Getters - All data comes from PortfolioData
  bool get isLoading => _isLoading.value;

  List<Project> get projects => PortfolioData.projects;
  List<Certificate> get certificates => PortfolioData.certificates;
  List<SkillCategory> get skillCategories => PortfolioData.skills;

  String get fullName => PortfolioData.fullName;
  String get title => PortfolioData.title;
  String get subtitle => PortfolioData.subtitle;
  String get bio => PortfolioData.bio;
  String get email => PortfolioData.email;
  String get location => PortfolioData.location;
  String get portfolioUrl => PortfolioData.portfolioUrl;
  String get resumeUrl => PortfolioData.resumeUrl;
  String get profileImageUrl => PortfolioData.profileImageUrl;

  List<Map<String, dynamic>> get socialLinks => [
        {
          'platform': 'GitHub',
          'url': 'https://github.com/YoussefSalem582',
          'icon': 'github'
        },
        {
          'platform': 'LinkedIn',
          'url': 'https://linkedin.com/in/youssef-salem',
          'icon': 'linkedin'
        },
      ];

  /// Refresh - no-op for static data (can be extended later)
  @override
  Future<void> refresh() async {
    // Using static portfolio data
  }
}
