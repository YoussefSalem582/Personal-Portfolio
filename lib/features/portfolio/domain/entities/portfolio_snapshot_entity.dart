import 'package:equatable/equatable.dart';

import '../../../../models/certificate.dart';
import '../../../../models/contact.dart';
import '../../../../models/contact_form.dart';
import '../../../../models/project.dart';
import '../../../../models/skill.dart';
import '../../../../utils/data/portfolio_data.dart';

/// Aggregate read model for the static portfolio ([technology_ninety_two] entity style).
class PortfolioSnapshotEntity extends Equatable {
  const PortfolioSnapshotEntity({
    required this.projects,
    required this.featuredProjects,
    required this.certificates,
    required this.skillCategories,
    required this.fullName,
    required this.title,
    required this.subtitle,
    required this.bio,
    required this.email,
    required this.location,
    required this.portfolioUrl,
    required this.resumeUrl,
    required this.profileImageUrl,
    required this.socialLinks,
    required this.contactInfo,
  });

  final List<Project> projects;
  final List<Project> featuredProjects;
  final List<Certificate> certificates;
  final List<SkillCategory> skillCategories;

  final String fullName;
  final String title;
  final String subtitle;
  final String bio;
  final String email;
  final String location;
  final String portfolioUrl;
  final String resumeUrl;
  final String profileImageUrl;

  final List<SocialLink> socialLinks;
  final ContactInfo contactInfo;

  List<Project> projectsByTechnology(String technology) =>
      PortfolioData.getProjectsByTechnology(technology);

  factory PortfolioSnapshotEntity.fromPortfolioData() {
    return PortfolioSnapshotEntity(
      projects: PortfolioData.projects,
      featuredProjects: PortfolioData.featuredProjects,
      certificates: PortfolioData.certificates,
      skillCategories: PortfolioData.skills,
      fullName: PortfolioData.fullName,
      title: PortfolioData.title,
      subtitle: PortfolioData.subtitle,
      bio: PortfolioData.bio,
      email: PortfolioData.email,
      location: PortfolioData.location,
      portfolioUrl: PortfolioData.portfolioUrl,
      resumeUrl: PortfolioData.resumeUrl,
      profileImageUrl: PortfolioData.profileImageUrl,
      socialLinks: PortfolioData.socialLinks,
      contactInfo: PortfolioData.contactInfo,
    );
  }

  @override
  List<Object?> get props => [
        projects,
        featuredProjects,
        certificates,
        skillCategories,
        fullName,
        title,
        subtitle,
        bio,
        email,
        location,
        portfolioUrl,
        resumeUrl,
        profileImageUrl,
        socialLinks,
        contactInfo,
      ];
}
