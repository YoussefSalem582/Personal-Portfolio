import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/project.dart';
import '../models/certificate.dart';
import '../models/skill.dart';
import '../services/projects_service.dart';
import '../services/certificates_service.dart';
import '../services/skills_service.dart';
import '../services/personal_info_service.dart';
import '../utils/portfolio_data.dart';

class PortfolioController extends GetxController {
  // Observables
  final RxBool _useSupabaseData = false.obs;
  final RxBool _isLoading = false.obs;
  final RxnString _error = RxnString();

  // Data observables
  final RxList<Project> _projects = <Project>[].obs;
  final RxList<Certificate> _certificates = <Certificate>[].obs;
  final RxList<SkillCategory> _skillCategories = <SkillCategory>[].obs;
  final Rxn<Map<String, dynamic>> _personalInfo = Rxn<Map<String, dynamic>>();
  final RxList<Map<String, dynamic>> _socialLinks =
      <Map<String, dynamic>>[].obs;

  // Getters
  bool get useSupabaseData => _useSupabaseData.value;
  bool get isLoading => _isLoading.value;
  String? get error => _error.value;

  List<Project> get projects =>
      _useSupabaseData.value ? _projects : PortfolioData.projects;

  List<Certificate> get certificates =>
      _useSupabaseData.value ? _certificates : PortfolioData.certificates;

  List<SkillCategory> get skillCategories =>
      _useSupabaseData.value ? _skillCategories : PortfolioData.skills;

  String get fullName => _useSupabaseData.value
      ? (_personalInfo.value?['full_name'] ?? 'Your Name')
      : PortfolioData.fullName;

  String get title => _useSupabaseData.value
      ? (_personalInfo.value?['title'] ?? 'Your Title')
      : PortfolioData.title;

  String get subtitle => _useSupabaseData.value
      ? (_personalInfo.value?['subtitle'] ?? 'Your Subtitle')
      : PortfolioData.subtitle;

  String get bio => _useSupabaseData.value
      ? (_personalInfo.value?['bio'] ?? 'Your Bio')
      : PortfolioData.bio;

  String get email => _useSupabaseData.value
      ? (_personalInfo.value?['email'] ?? 'your@email.com')
      : PortfolioData.email;

  String get phone => _useSupabaseData.value
      ? (_personalInfo.value?['phone'] ?? '+1234567890')
      : PortfolioData.phone;

  String get location => _useSupabaseData.value
      ? (_personalInfo.value?['location'] ?? 'Your Location')
      : PortfolioData.location;

  String get portfolioUrl => _useSupabaseData.value
      ? (_personalInfo.value?['portfolio_url'] ?? '#')
      : PortfolioData.portfolioUrl;

  String get resumeUrl => _useSupabaseData.value
      ? (_personalInfo.value?['resume_url'] ?? '#')
      : PortfolioData.resumeUrl;

  String get profileImageUrl => _useSupabaseData.value
      ? (_personalInfo.value?['profile_image_url'] ?? 'assets/profile.jpeg')
      : PortfolioData.profileImageUrl;

  List<Map<String, dynamic>> get socialLinks => _useSupabaseData.value
      ? _socialLinks
      : [
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

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  /// Load portfolio data with loading state
  Future<void> _loadData() async {
    _isLoading.value = true;
    _error.value = null;

    try {
      await initialize();
    } catch (e) {
      _error.value = 'Failed to load portfolio data: $e';
      debugPrint('❌ Error loading portfolio data: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  /// Refresh portfolio data
  @override
  Future<void> refresh() async {
    await _loadData();
  }

  // Toggle between static and Supabase data
  Future<void> toggleDataSource() async {
    _useSupabaseData.value = !_useSupabaseData.value;

    if (_useSupabaseData.value) {
      await loadSupabaseData();
    }
  }

  // Load all data from Supabase
  Future<void> loadSupabaseData() async {
    _isLoading.value = true;
    _error.value = null;

    try {
      // Load data concurrently with better error handling
      final results = await Future.wait([
        ProjectsService.getAllProjects().catchError((_) => <Project>[]),
        CertificatesService.getAllCertificates()
            .catchError((_) => <Certificate>[]),
        SkillsService.getAllSkillCategories()
            .catchError((_) => <SkillCategory>[]),
        PersonalInfoService.getPersonalInfo()
            .catchError((_) => <String, dynamic>{}),
        PersonalInfoService.getSocialLinks()
            .catchError((_) => <Map<String, dynamic>>[]),
      ]);

      _projects.value = results[0] as List<Project>;
      _certificates.value = results[1] as List<Certificate>;
      _skillCategories.value = results[2] as List<SkillCategory>;
      _personalInfo.value = results[3] as Map<String, dynamic>?;
      _socialLinks.value = results[4] as List<Map<String, dynamic>>;

      _isLoading.value = false;

      // Only show success if we actually got data
      if (_projects.isNotEmpty || _certificates.isNotEmpty) {
        debugPrint('✅ Supabase data loaded successfully');
      }
    } catch (e) {
      _error.value = 'Failed to load data from Supabase: $e';
      _isLoading.value = false;
      _useSupabaseData.value = false; // Fall back to static data

      debugPrint('⚠️ Supabase unavailable, using static data');
      // Don't show snackbar on initial load to avoid annoying users
    }
  }

  // Refresh specific data types
  Future<void> refreshProjects() async {
    if (!_useSupabaseData.value) return;

    try {
      _projects.value = await ProjectsService.getAllProjects();

      Get.snackbar(
        'Success',
        'Projects refreshed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      _error.value = 'Failed to refresh projects: $e';

      Get.snackbar(
        'Error',
        'Failed to refresh projects',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> refreshCertificates() async {
    if (!_useSupabaseData.value) return;

    try {
      _certificates.value = await CertificatesService.getAllCertificates();

      Get.snackbar(
        'Success',
        'Certificates refreshed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      _error.value = 'Failed to refresh certificates: $e';

      Get.snackbar(
        'Error',
        'Failed to refresh certificates',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> refreshSkills() async {
    if (!_useSupabaseData.value) return;

    try {
      _skillCategories.value = await SkillsService.getAllSkillCategories();

      Get.snackbar(
        'Success',
        'Skills refreshed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      _error.value = 'Failed to refresh skills: $e';

      Get.snackbar(
        'Error',
        'Failed to refresh skills',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> refreshPersonalInfo() async {
    if (!_useSupabaseData.value) return;

    try {
      _personalInfo.value = await PersonalInfoService.getPersonalInfo();
      _socialLinks.value = await PersonalInfoService.getSocialLinks();

      Get.snackbar(
        'Success',
        'Personal info refreshed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.primary,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      _error.value = 'Failed to refresh personal info: $e';

      Get.snackbar(
        'Error',
        'Failed to refresh personal info',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
        duration: const Duration(seconds: 3),
      );
    }
  }

  // Clear error
  void clearError() {
    _error.value = null;
  }

  // Initialize with fallback data loading
  Future<void> initialize() async {
    // Try to load Supabase data, but gracefully fall back to static data
    try {
      await loadSupabaseData();
      // Only use Supabase data if we successfully loaded something
      if (_projects.isNotEmpty || _personalInfo.value != null) {
        _useSupabaseData.value = true;
        debugPrint('📊 Using Supabase data');
      } else {
        _useSupabaseData.value = false;
        debugPrint('📁 Using static data (no Supabase data found)');
      }
    } catch (e) {
      // Fall back to static data
      _useSupabaseData.value = false;
      _isLoading.value = false;
      debugPrint('📁 Using static data (Supabase not configured): $e');
    }
  }

  // Refresh all data
  Future<void> refreshAll() async {
    if (_useSupabaseData.value) {
      await loadSupabaseData();
    }
  }
}
