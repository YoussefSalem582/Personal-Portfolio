// Export all data files for easy access
export 'personal_info_data.dart';
export 'skills_data.dart';
export 'projects_data.dart';
export 'certificates_data.dart';
export 'contact_data.dart';

import '../../models/project.dart';
import '../../models/skill.dart';
import '../../models/contact.dart';
import 'personal_info_data.dart';
import 'skills_data.dart';
import 'projects_data.dart';
import 'certificates_data.dart';
import 'contact_data.dart';

/// Main PortfolioData class that aggregates all data from separate files
/// This maintains backward compatibility while organizing data into sections
class PortfolioData {
  // Personal information - delegated to PersonalInfoData
  static const String fullName = PersonalInfoData.fullName;
  static const String title = PersonalInfoData.title;
  static const String subtitle = PersonalInfoData.subtitle;
  static const String bio = PersonalInfoData.bio;
  static const String email = PersonalInfoData.email;
  static const String phone = PersonalInfoData.phone;
  static const String location = PersonalInfoData.location;
  static const String portfolioUrl = PersonalInfoData.portfolioUrl;
  static const String resumeUrl = PersonalInfoData.resumeUrl;
  static const String profileImageUrl = PersonalInfoData.profileImageUrl;
  static const List<SocialLink> socialLinks = PersonalInfoData.socialLinks;

  // Skills - delegated to SkillsData
  static final List<SkillCategory> skills = SkillsData.skills;

  // Projects - delegated to ProjectsData (sorted by date, latest first)
  static final List<Project> projects = ProjectsData.projectsSortedByDate;
  static List<Project> get featuredProjects => ProjectsData.featuredProjects;

  // Certificates - delegated to CertificatesData
  static final certificates = CertificatesData.certificates;

  // Contact information - delegated to ContactData
  static final contactInfo = ContactData.contactInfo;

  // Get projects by category
  static List<Project> getProjectsByTechnology(String technology) {
    return ProjectsData.getProjectsByTechnology(technology);
  }
}
