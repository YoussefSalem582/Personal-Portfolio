import '../../models/expertise.dart';
import 'package:flutter/material.dart';
import '../assets/app_constants.dart';

class ExpertiseData {
  static final List<Expertise> expertiseList = [
    Expertise(
      id: 'mobile-dev',
      title: 'Professional Mobile App Development',
      description:
          'I create high-performance, cross-platform apps with Flutter and Dart, delivering clean code, modern UI/UX, and seamless user experiences across Android & iOS platforms.',
      icon: Icons.phone_android,
      iconColor: const Color(0xFF3498DB),
    ),
    Expertise(
      id: 'flutter-expert',
      title: 'Flutter Architecture & Best Practices',
      description:
          'Expert in Flutter development with clean architecture, implementing SOLID principles, design patterns, and state management solutions (GetX, BLoC, Riverpod) for maintainable codebases.',
      icon: AppIcons.flutterIconSvg,
      iconColor: const Color(0xFF02569B),
    ),
    Expertise(
      id: 'ai-ml',
      title: 'AI & Machine Learning Integration',
      description:
          'I develop innovative AI applications using Python, TensorFlow, and PyTorch, specializing in computer vision, facial recognition, and seamless ML model integration into mobile apps.',
      icon: AppIcons.technology,
      iconColor: const Color(0xFFE91E63),
    ),
    Expertise(
      id: 'performance',
      title: 'Performance Optimization & Testing',
      description:
          'Expert in app optimization, memory management, and comprehensive testing strategies. I ensure smooth 60fps animations, efficient API integration, and robust error handling.',
      icon: AppIcons.featured,
      iconColor: const Color(0xFFFF9800),
    ),
    Expertise(
      id: 'custom-solutions',
      title: 'Full-Stack Development Solutions',
      description:
          'Experienced in building complete solutions from backend APIs to frontend mobile apps, utilizing Firebase, Supabase, and REST APIs with secure authentication and real-time data sync.',
      icon: Icons.cloud,
      iconColor: const Color(0xFF00BCD4),
    ),
    Expertise(
      id: 'full-lifecycle',
      title: 'Agile Development & CI/CD',
      description:
          'From concept to production, I follow agile methodologies with Git workflows, automated testing, continuous integration, and deployment to Play Store, App Store, and web platforms.',
      icon: AppIcons.featured,
      iconColor: const Color(0xFF9C27B0),
    ),
  ];
}
