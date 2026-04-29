import 'package:youssef_hassan_portfolio/features/expertise/domain/entities/expertise.dart';
import 'package:flutter/material.dart';
import '../assets/app_constants.dart';

class ExpertiseData {
  static final List<Expertise> expertiseList = [
    const Expertise(
      id: 'ui-ux-design',
      title: 'UI/UX Design & Implementation',
      description:
          'Creating beautiful, user-friendly interfaces with Flutter widgets, custom animations, and responsive layouts that work seamlessly across different screen sizes.',
      icon: Icons.palette,
      iconColor: Color(0xFF9C27B0),
    ),
    const Expertise(
      id: 'app-design',
      title: 'Mobile App Design',
      description:
          'Building modern mobile applications with clean design principles, Material Design, and iOS-style interfaces using Flutter\'s rich widget library.',
      icon: Icons.phone_android,
      iconColor: Color(0xFF0D47A1),
    ),
    const Expertise(
      id: 'flutter-basics',
      title: 'Flutter Development',
      description:
          'Developing cross-platform mobile apps using Flutter and Dart, focusing on clean code structure and following best practices for maintainable applications.',
      icon: AppIcons.flutterIconSvg,
      iconColor: Color(0xFF02569B),
    ),
    const Expertise(
      id: 'state-management',
      title: 'State Management',
      description:
          'Managing app state efficiently using GetX, Provider, and other state management solutions to keep apps responsive and data synchronized across screens.',
      icon: Icons.sync,
      iconColor: Color(0xFF00BCD4),
    ),
    const Expertise(
      id: 'firebase-integration',
      title: 'Firebase Integration',
      description:
          'Integrating Firebase services including Authentication, Firestore database, Cloud Storage, and Push Notifications to build feature-rich mobile applications.',
      icon: Icons.cloud,
      iconColor: Color(0xFFFF9800),
    ),
    const Expertise(
      id: 'api-integration',
      title: 'API Integration',
      description:
          'Connecting apps to REST APIs, handling HTTP requests, parsing JSON data, and displaying dynamic content from backend services in the app.',
      icon: Icons.api,
      iconColor: Color(0xFF4CAF50),
    ),
  ];
}
