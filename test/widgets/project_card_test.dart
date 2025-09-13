import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/widgets/project_card.dart';
import 'package:personal_portfolio/models/project.dart';

void main() {
  group('ProjectCard Widget Tests', () {
    late Project testProject;

    setUp(() {
      testProject = Project(
        id: 'test-project',
        title: 'Test Project',
        description: 'A comprehensive test project with detailed description',
        shortDescription: 'Test project for widget testing',
        technologies: ['Flutter', 'Dart', 'Firebase'],
        githubUrl: 'https://github.com/test/project',
        liveUrl: 'https://test-project.com',
        imageUrl: 'assets/images/test.png',
        galleryImages: ['assets/images/test1.png', 'assets/images/test2.png'],
        createdAt: DateTime(2025, 1, 1),
        isFeatured: true,
      );
    });

    Widget createTestWidget(Widget child) {
      return MaterialApp(home: Scaffold(body: child));
    }

    testWidgets('should display project information correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ProjectCard(project: testProject)),
      );

      // Check if project title is displayed
      expect(find.text('Test Project'), findsOneWidget);

      // Check if short description is displayed
      expect(find.text('Test project for widget testing'), findsOneWidget);

      // Check if technologies are displayed
      expect(find.text('Flutter'), findsOneWidget);
      expect(find.text('Dart'), findsOneWidget);
      expect(find.text('Firebase'), findsOneWidget);
    });

    testWidgets('should display compact version when isCompact is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ProjectCard(project: testProject, isCompact: true)),
      );

      // Check if the card is rendered
      expect(find.byType(ProjectCard), findsOneWidget);
      expect(find.text('Test Project'), findsOneWidget);
    });

    testWidgets('should open project details dialog when tapped', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ProjectCard(project: testProject)),
      );

      // Tap on the project card specifically (first InkWell)
      await tester.tap(find.byType(InkWell).first);
      await tester.pumpAndSettle();

      // Check if the details dialog is opened
      expect(find.byType(ProjectDetailsDialog), findsOneWidget);
      expect(
        find.text('A comprehensive test project with detailed description'),
        findsOneWidget,
      );
    });

    testWidgets('should display placeholder when image fails to load', (
      WidgetTester tester,
    ) async {
      final projectWithoutImage = Project(
        id: 'test-project-no-image',
        title: 'Test Project No Image',
        description: 'Test project without image',
        shortDescription: 'No image project',
        technologies: ['Flutter'],
        createdAt: DateTime(2025, 1, 1),
      );

      await tester.pumpWidget(
        createTestWidget(ProjectCard(project: projectWithoutImage)),
      );

      // Check if placeholder icon is displayed
      expect(find.byIcon(Icons.code), findsOneWidget);
    });

    testWidgets('should limit displayed technologies in compact mode', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ProjectCard(project: testProject, isCompact: true)),
      );

      // In compact mode, only 2 technologies should be displayed
      final chipWidgets = tester.widgetList(find.byType(Chip));
      expect(chipWidgets.length, lessThanOrEqualTo(2));
    });
  });

  group('ProjectDetailsDialog Widget Tests', () {
    late Project testProject;

    setUp(() {
      testProject = Project(
        id: 'test-project',
        title: 'Test Project Details',
        description: 'A detailed description for testing the dialog',
        shortDescription: 'Test project',
        technologies: ['Flutter', 'Dart', 'Firebase', 'BLoC'],
        githubUrl: 'https://github.com/test/project',
        liveUrl: 'https://test-project.com',
        imageUrl: 'assets/images/test.png',
        createdAt: DateTime(2025, 1, 1),
      );
    });

    Widget createTestWidget(Widget child) {
      return MaterialApp(home: Scaffold(body: child));
    }

    testWidgets('should display project details correctly', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ProjectDetailsDialog(project: testProject)),
      );

      // Check if project title is displayed
      expect(find.text('Test Project Details'), findsOneWidget);

      // Check if description is displayed
      expect(
        find.text('A detailed description for testing the dialog'),
        findsOneWidget,
      );

      // Check if technologies section is displayed
      expect(find.text('Technologies Used'), findsOneWidget);

      // Check if all technologies are displayed
      expect(find.text('Flutter'), findsOneWidget);
      expect(find.text('Dart'), findsOneWidget);
      expect(find.text('Firebase'), findsOneWidget);
      expect(find.text('BLoC'), findsOneWidget);
    });

    testWidgets('should display action buttons when URLs are provided', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(ProjectDetailsDialog(project: testProject)),
      );

      // Check if action buttons are displayed
      expect(find.text('View Code'), findsOneWidget);
      expect(find.text('Live Demo'), findsOneWidget);
    });

    testWidgets('should close dialog when close button is pressed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => ProjectDetailsDialog(project: testProject),
                ),
                child: const Text('Open Dialog'),
              ),
            ),
          ),
        ),
      );

      // Open the dialog
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      // Check if dialog is open
      expect(find.byType(ProjectDetailsDialog), findsOneWidget);

      // Tap close button
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      // Check if dialog is closed
      expect(find.byType(ProjectDetailsDialog), findsNothing);
    });
  });
}
