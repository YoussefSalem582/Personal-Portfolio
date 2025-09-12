import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/models/project.dart';

void main() {
  group('Project Model Tests', () {
    test('should create Project instance correctly', () {
      final project = Project(
        id: 'test-project',
        title: 'Test Project',
        description: 'A test project description',
        shortDescription: 'Test project',
        technologies: ['Flutter', 'Dart'],
        githubUrl: 'https://github.com/test/project',
        liveUrl: 'https://test-project.com',
        imageUrl: 'assets/images/test.png',
        galleryImages: ['assets/images/test1.png', 'assets/images/test2.png'],
        createdAt: DateTime(2025, 1, 1),
        isFeatured: true,
      );

      expect(project.id, 'test-project');
      expect(project.title, 'Test Project');
      expect(project.description, 'A test project description');
      expect(project.shortDescription, 'Test project');
      expect(project.technologies, ['Flutter', 'Dart']);
      expect(project.githubUrl, 'https://github.com/test/project');
      expect(project.liveUrl, 'https://test-project.com');
      expect(project.imageUrl, 'assets/images/test.png');
      expect(project.galleryImages, [
        'assets/images/test1.png',
        'assets/images/test2.png',
      ]);
      expect(project.createdAt, DateTime(2025, 1, 1));
      expect(project.isFeatured, true);
    });

    test('should create Project with default isFeatured value', () {
      final project = Project(
        id: 'test-project',
        title: 'Test Project',
        description: 'A test project description',
        shortDescription: 'Test project',
        technologies: ['Flutter', 'Dart'],
        createdAt: DateTime(2025, 1, 1),
      );

      expect(project.isFeatured, false);
    });

    test('should convert Project to JSON correctly', () {
      final project = Project(
        id: 'test-project',
        title: 'Test Project',
        description: 'A test project description',
        shortDescription: 'Test project',
        technologies: ['Flutter', 'Dart'],
        githubUrl: 'https://github.com/test/project',
        imageUrl: 'assets/images/test.png',
        galleryImages: ['assets/images/test1.png'],
        createdAt: DateTime(2025, 1, 1),
        isFeatured: true,
      );

      final json = project.toJson();

      expect(json['id'], 'test-project');
      expect(json['title'], 'Test Project');
      expect(json['technologies'], ['Flutter', 'Dart']);
      expect(json['galleryImages'], ['assets/images/test1.png']);
      expect(json['isFeatured'], true);
    });

    test('should create Project from JSON correctly', () {
      final json = {
        'id': 'test-project',
        'title': 'Test Project',
        'description': 'A test project description',
        'shortDescription': 'Test project',
        'technologies': ['Flutter', 'Dart'],
        'githubUrl': 'https://github.com/test/project',
        'liveUrl': 'https://test-project.com',
        'imageUrl': 'assets/images/test.png',
        'galleryImages': ['assets/images/test1.png', 'assets/images/test2.png'],
        'createdAt': '2025-01-01T00:00:00.000',
        'isFeatured': true,
      };

      final project = Project.fromJson(json);

      expect(project.id, 'test-project');
      expect(project.title, 'Test Project');
      expect(project.galleryImages, [
        'assets/images/test1.png',
        'assets/images/test2.png',
      ]);
      expect(project.isFeatured, true);
    });

    test('should handle null galleryImages in fromJson', () {
      final json = {
        'id': 'test-project',
        'title': 'Test Project',
        'description': 'A test project description',
        'shortDescription': 'Test project',
        'technologies': ['Flutter', 'Dart'],
        'createdAt': '2025-01-01T00:00:00.000',
        'isFeatured': false,
      };

      final project = Project.fromJson(json);

      expect(project.galleryImages, null);
    });
  });
}
