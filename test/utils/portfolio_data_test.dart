import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/utils/portfolio_data.dart';

void main() {
  group('PortfolioData Tests', () {
    test('should have correct personal information', () {
      expect(PortfolioData.fullName, 'Youssef Salem Hassan');
      expect(PortfolioData.title, 'Flutter Developer');
      expect(PortfolioData.subtitle, 'Building fast cross-platform apps');
      expect(PortfolioData.email, 'youssef.salem.hassan582@gmail.com');
      expect(PortfolioData.bio.isNotEmpty, true);
    });

    test('should have valid social links', () {
      expect(PortfolioData.socialLinks.isNotEmpty, true);

      final githubLink = PortfolioData.socialLinks
          .where((link) => link.name == 'GitHub')
          .firstOrNull;
      expect(githubLink, isNotNull);
      expect(githubLink!.url, 'https://github.com/YoussefSalem582');

      final linkedinLink = PortfolioData.socialLinks
          .where((link) => link.name == 'LinkedIn')
          .firstOrNull;
      expect(linkedinLink, isNotNull);
      expect(
        linkedinLink!.url,
        'https://www.linkedin.com/in/youssef-hassan-8529372b7/',
      );
    });

    test('should have projects list', () {
      expect(PortfolioData.projects.isNotEmpty, true);
      expect(PortfolioData.projects.length, greaterThan(5));

      // Check if required projects are present
      final projectTitles = PortfolioData.projects.map((p) => p.title).toList();
      expect(
        projectTitles.any((title) => title.contains('Music Player')),
        true,
      );
      expect(projectTitles.any((title) => title.contains('Chat App')), true);
      expect(projectTitles.any((title) => title.contains('ChargeHub')), true);
    });

    test('should have featured projects', () {
      final featuredProjects = PortfolioData.featuredProjects;
      expect(featuredProjects.isNotEmpty, true);
      expect(featuredProjects.length, lessThanOrEqualTo(3));

      // All featured projects should have isFeatured = true
      for (final project in featuredProjects) {
        expect(project.isFeatured, true);
      }
    });

    test('should have skills categorized correctly', () {
      expect(PortfolioData.skills.isNotEmpty, true);

      final categoryNames = PortfolioData.skills
          .map((cat) => cat.name)
          .toList();
      expect(categoryNames.contains('Mobile Development'), true);
      expect(categoryNames.contains('Programming Languages'), true);
      expect(categoryNames.contains('AI & Machine Learning'), true);
    });

    test('should have certificates list', () {
      expect(PortfolioData.certificates.isNotEmpty, true);

      final certificateTitles = PortfolioData.certificates
          .map((c) => c.title)
          .toList();
      expect(certificateTitles.any((title) => title.contains('Flutter')), true);
      expect(
        certificateTitles.any((title) => title.contains('Machine Learning')),
        true,
      );
    });

    test('should filter projects by technology correctly', () {
      final flutterProjects = PortfolioData.getProjectsByTechnology('Flutter');
      expect(flutterProjects.isNotEmpty, true);

      for (final project in flutterProjects) {
        expect(project.technologies.contains('Flutter'), true);
      }

      final pythonProjects = PortfolioData.getProjectsByTechnology('Python');
      for (final project in pythonProjects) {
        expect(project.technologies.contains('Python'), true);
      }
    });

    test('should have valid contact information', () {
      final contactInfo = PortfolioData.contactInfo;
      expect(contactInfo.email, 'youssef.salem.hassan582@gmail.com');
      expect(contactInfo.github, 'https://github.com/YoussefSalem582');
      expect(
        contactInfo.linkedin,
        'https://www.linkedin.com/in/youssef-hassan-8529372b7/',
      );
      expect(contactInfo.location, 'Egypt');
    });

    test('should have valid resume URL', () {
      expect(PortfolioData.resumeUrl, 'assets/resume.pdf');
      expect(PortfolioData.profileImageUrl, 'assets/profile.jpeg');
    });
  });
}
