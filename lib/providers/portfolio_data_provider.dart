import 'package:flutter/material.dart';
import '../models/project.dart';
import '../models/certificate.dart';
import '../models/skill.dart';
import '../services/projects_service.dart';
import '../services/certificates_service.dart';
import '../services/skills_service.dart';
import '../services/personal_info_service.dart';
import '../utils/portfolio_data.dart';

class PortfolioDataProvider extends ChangeNotifier {
  bool _useSupabaseData = false;
  bool _isLoading = false;
  String? _error;

  // Data
  List<Project> _projects = [];
  List<Certificate> _certificates = [];
  List<SkillCategory> _skillCategories = [];
  Map<String, dynamic>? _personalInfo;
  List<Map<String, dynamic>> _socialLinks = [];

  // Getters
  bool get useSupabaseData => _useSupabaseData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<Project> get projects => _useSupabaseData ? _projects : PortfolioData.projects;
  List<Certificate> get certificates => _useSupabaseData ? _certificates : PortfolioData.certificates;
  List<SkillCategory> get skillCategories => _useSupabaseData ? _skillCategories : PortfolioData.skills;
  
  String get fullName => _useSupabaseData ? (_personalInfo?['full_name'] ?? 'Your Name') : PortfolioData.fullName;
  String get title => _useSupabaseData ? (_personalInfo?['title'] ?? 'Your Title') : PortfolioData.title;
  String get subtitle => _useSupabaseData ? (_personalInfo?['subtitle'] ?? 'Your Subtitle') : PortfolioData.subtitle;
  String get bio => _useSupabaseData ? (_personalInfo?['bio'] ?? 'Your Bio') : PortfolioData.bio;
  String get email => _useSupabaseData ? (_personalInfo?['email'] ?? 'your@email.com') : PortfolioData.email;
  String get phone => _useSupabaseData ? (_personalInfo?['phone'] ?? '+1234567890') : PortfolioData.phone;
  String get location => _useSupabaseData ? (_personalInfo?['location'] ?? 'Your Location') : PortfolioData.location;
  String get portfolioUrl => _useSupabaseData ? (_personalInfo?['portfolio_url'] ?? '#') : PortfolioData.portfolioUrl;
  String get resumeUrl => _useSupabaseData ? (_personalInfo?['resume_url'] ?? '#') : PortfolioData.resumeUrl;
  String get profileImageUrl => _useSupabaseData ? (_personalInfo?['profile_image_url'] ?? 'assets/profile.jpeg') : PortfolioData.profileImageUrl;

  List<Map<String, dynamic>> get socialLinks => _useSupabaseData ? _socialLinks : [
    {'platform': 'GitHub', 'url': 'https://github.com/YoussefSalem582', 'icon': 'github'},
    {'platform': 'LinkedIn', 'url': 'https://linkedin.com/in/youssef-salem', 'icon': 'linkedin'},
    // Add more static social links as needed
  ];

  // Toggle between static and Supabase data
  Future<void> toggleDataSource() async {
    _useSupabaseData = !_useSupabaseData;
    
    if (_useSupabaseData) {
      await loadSupabaseData();
    }
    
    notifyListeners();
  }

  // Load all data from Supabase
  Future<void> loadSupabaseData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Load data concurrently
      final results = await Future.wait([
        ProjectsService.getAllProjects(),
        CertificatesService.getAllCertificates(),
        SkillsService.getAllSkillCategories(),
        PersonalInfoService.getPersonalInfo(),
        PersonalInfoService.getSocialLinks(),
      ]);

      _projects = results[0] as List<Project>;
      _certificates = results[1] as List<Certificate>;
      _skillCategories = results[2] as List<SkillCategory>;
      _personalInfo = results[3] as Map<String, dynamic>?;
      _socialLinks = results[4] as List<Map<String, dynamic>>;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load data from Supabase: $e';
      _isLoading = false;
      _useSupabaseData = false; // Fall back to static data
      notifyListeners();
    }
  }

  // Refresh specific data types
  Future<void> refreshProjects() async {
    if (!_useSupabaseData) return;
    
    try {
      _projects = await ProjectsService.getAllProjects();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to refresh projects: $e';
      notifyListeners();
    }
  }

  Future<void> refreshCertificates() async {
    if (!_useSupabaseData) return;
    
    try {
      _certificates = await CertificatesService.getAllCertificates();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to refresh certificates: $e';
      notifyListeners();
    }
  }

  Future<void> refreshSkills() async {
    if (!_useSupabaseData) return;
    
    try {
      _skillCategories = await SkillsService.getAllSkillCategories();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to refresh skills: $e';
      notifyListeners();
    }
  }

  Future<void> refreshPersonalInfo() async {
    if (!_useSupabaseData) return;
    
    try {
      _personalInfo = await PersonalInfoService.getPersonalInfo();
      _socialLinks = await PersonalInfoService.getSocialLinks();
      notifyListeners();
    } catch (e) {
      _error = 'Failed to refresh personal info: $e';
      notifyListeners();
    }
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Initialize with fallback data loading
  Future<void> initialize() async {
    // Try to load Supabase data, but don't fail if it's not available
    try {
      await loadSupabaseData();
      _useSupabaseData = true;
    } catch (e) {
      // Fall back to static data
      _useSupabaseData = false;
      _isLoading = false;
      debugPrint('Supabase not available, using static data: $e');
    }
    notifyListeners();
  }
}
