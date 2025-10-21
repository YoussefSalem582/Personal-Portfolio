import '../../models/project.dart';

class ProjectsData {
  static final List<Project> projects = [
    Project(
      id: 'emosense-app',
      title: 'Emosense App',
      shortDescription:
          'AI-powered emotion recognition app for mental health and customer service',
      description:
          'Emosense is an innovative AI-powered mobile application that analyzes audio and video to detect emotions in real-time. '
          'Designed for mental health monitoring and customer service enhancement, it features multimodal ML models, '
          'privacy-first architecture, and comprehensive emotion analytics. My graduation project completed in July 2025.',
      technologies: [
        'Python',
        'TensorFlow',
        'Computer Vision',
        'Audio Processing',
        'Machine Learning',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Emosense-App',
      imageUrl:
          'assets/images/projects/app_images/emosense_photos/app_icon.png',
      galleryImages: [
        // Onboarding & Authentication
        'assets/images/projects/app_images/emosense_photos/employee/splash_screen.png',
        'assets/images/projects/app_images/emosense_photos/employee/onboarding_1.png',
        'assets/images/projects/app_images/emosense_photos/employee/onboarding_2.png',
        'assets/images/projects/app_images/emosense_photos/employee/onboarding_3.png',
        'assets/images/projects/app_images/emosense_photos/employee/onboarding_4.png',
        'assets/images/projects/app_images/emosense_photos/employee/signin_and_login.png',
        'assets/images/projects/app_images/emosense_photos/employee/signin_employee.png',
        'assets/images/projects/app_images/emosense_photos/employee/login.png',
        'assets/images/projects/app_images/emosense_photos/employee/signin_admin.png',

        // Employee Home & Tools
        'assets/images/projects/app_images/emosense_photos/employee/employee_home_screen.png',
        'assets/images/projects/app_images/emosense_photos/employee/tools_screen.png',

        // Video Analysis
        'assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen.png',
        'assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen_2.png',
        'assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen_3.png',
        'assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen_4.png',

        // Voice Analysis
        'assets/images/projects/app_images/emosense_photos/employee/voice_analysis_screen.png',
        'assets/images/projects/app_images/emosense_photos/employee/voice_analysis_screen_2.png',
        'assets/images/projects/app_images/emosense_photos/employee/voice_analysis_screen_3.png',

        // Text Analysis
        'assets/images/projects/app_images/emosense_photos/employee/text_analysis_screen.png',
        'assets/images/projects/app_images/emosense_photos/employee/text_analysis_screen_2.png',

        // Support Tickets
        'assets/images/projects/app_images/emosense_photos/employee/tickets_screen.png',
        'assets/images/projects/app_images/emosense_photos/employee/tickets_screen_2.png',
        'assets/images/projects/app_images/emosense_photos/employee/tickets_screen_3.png',

        // Employee Profile
        'assets/images/projects/app_images/emosense_photos/employee/profiel_screen.png',
        'assets/images/projects/app_images/emosense_photos/employee/profile_sceen_2.png',
        'assets/images/projects/app_images/emosense_photos/employee/profile_screen_3.png',

        // Admin Panel
        'assets/images/projects/app_images/emosense_photos/admin/amin_home_screen.png',
        'assets/images/projects/app_images/emosense_photos/admin/user_managment_screen.png',
        'assets/images/projects/app_images/emosense_photos/admin/system_screen.png',
        'assets/images/projects/app_images/emosense_photos/admin/system_screen._2.png',
        'assets/images/projects/app_images/emosense_photos/admin/support_tickets_screen.png',
        'assets/images/projects/app_images/emosense_photos/admin/profile_screen.png',
        'assets/images/projects/app_images/emosense_photos/admin/profile_screen__2.png',
      ],
      createdAt: DateTime(2025, 7, 1),
      isFeatured: true,
    ),
    Project(
      id: 'music-player',
      title: 'Music Player App',
      shortDescription:
          'Flutter music player with playlists, playback controls, search, and modern UI',
      description:
          'Flutter music player with playlists, playback controls, search, and a modern UI — built during an internship in March 2025. '
          'Features include audio visualization, background playback, and seamless user experience.',
      technologies: ['Flutter', 'Dart', 'Audio Processing', 'State Management'],
      githubUrl: 'https://github.com/YoussefSalem582/Music-Player-App',
      imageUrl: 'assets/images/projects/app_images/music_app/home_page.png',
      galleryImages: [
        'assets/images/projects/app_images/music_app/home_page.png',
        'assets/images/projects/app_images/music_app/Home Screen 1.png',
        'assets/images/projects/app_images/music_app/Home Screen 2.png',
        'assets/images/projects/app_images/music_app/Music player screen.png',
        'assets/images/projects/app_images/music_app/playlist screen.png',
        'assets/images/projects/app_images/music_app/liked songs page.png',
      ],
      createdAt: DateTime(2025, 3, 1),
      isFeatured: true,
    ),
    Project(
      id: 'chat-app',
      title: 'Chat App',
      shortDescription:
          'Cross-platform chat using Firebase Auth and Realtime messaging',
      description:
          'Cross-platform chat using Firebase Auth and Realtime messaging; includes light/dark modes and a polished UI. '
          'Built in March 2025 with comprehensive real-time features.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Real-time Database',
        'Authentication',
        'BLoC',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/chat-app',
      imageUrl: 'assets/images/projects/app_images/chat_app/home_page.png',
      galleryImages: [
        'assets/images/projects/app_images/chat_app/home_page.png',
        'assets/images/projects/app_images/chat_app/chat.png',
        'assets/images/projects/app_images/chat_app/login.png',
        'assets/images/projects/app_images/chat_app/register.png',
        'assets/images/projects/app_images/chat_app/lightmode.png',
        'assets/images/projects/app_images/chat_app/settings_page.png',
        'assets/images/projects/app_images/chat_app/drawer.png',
      ],
      createdAt: DateTime(2025, 3, 1),
      isFeatured: true,
    ),
    Project(
      id: 'quizhub',
      title: 'QuizHub App',
      shortDescription: 'Online Exam platform with interactive quiz features',
      description:
          'An educational quiz application providing interactive learning experiences. Features multiple quiz categories, '
          'progress tracking, review functionality, and comprehensive exam management.',
      technologies: ['Flutter', 'Dart', 'SQLite', 'State Management'],
      githubUrl: 'https://github.com/YoussefSalem582/QuizHub-App',
      imageUrl: 'assets/images/projects/app_images/quiz_hub/home_screen.png',
      galleryImages: [
        'assets/images/projects/app_images/quiz_hub/home_screen.png',
        'assets/images/projects/app_images/quiz_hub/quiz.png',
        'assets/images/projects/app_images/quiz_hub/correct_answer.png',
        'assets/images/projects/app_images/quiz_hub/incorrect_answer.png',
        'assets/images/projects/app_images/quiz_hub/qui_completed.png',
        'assets/images/projects/app_images/quiz_hub/review_page.png',
      ],
      createdAt: DateTime(2024, 1, 1),
    ),
    Project(
      id: 'chargehub',
      title: 'ChargeHub App',
      shortDescription:
          'EV & gas station finder with interactive maps and BLoC-based state management',
      description:
          'EV & gas station finder with interactive maps and BLoC-based state management. Built in September 2024, '
          'this app helps users locate charging stations and gas stations with real-time availability.',
      technologies: ['Flutter', 'Dart', 'Maps API', 'BLoC', 'GPS'],
      githubUrl: 'https://github.com/YoussefSalem582/ChargeHub-App',
      imageUrl: 'assets/images/projects/app_images/chargehub/homescreen.png',
      galleryImages: [
        'assets/images/projects/app_images/chargehub/homescreen.png',
        'assets/images/projects/app_images/chargehub/Map.png',
        'assets/images/projects/app_images/chargehub/login.png',
        'assets/images/projects/app_images/chargehub/signup.png',
        'assets/images/projects/app_images/chargehub/EV car.png',
        'assets/images/projects/app_images/chargehub/gas car.png',
      ],
      createdAt: DateTime(2024, 9, 1),
    ),
    Project(
      id: 'gogesh-marketplace',
      title: 'Gogesh Marketplace App',
      shortDescription:
          'Comprehensive e-commerce marketplace with modern UI/UX',
      description:
          'A full-featured e-commerce marketplace application with product catalog, shopping cart, '
          'user authentication, order management, and payment integration. Features modern UI/UX design principles.',
      technologies: [
        'Flutter',
        'Dart',
        'REST API',
        'State Management',
        'Firebase',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Gogesh-App',
      imageUrl: 'assets/images/projects/app_images/gogesh/app_main_search.png',
      galleryImages: [
        'assets/images/projects/app_images/gogesh/app_main_search.png',
        'assets/images/projects/app_images/gogesh/category.png',
        'assets/images/projects/app_images/gogesh/product_screen.png',
        'assets/images/projects/app_images/gogesh/filter.png',
        'assets/images/projects/app_images/gogesh/chat.png',
        'assets/images/projects/app_images/gogesh/favorite_screen.png',
        'assets/images/projects/app_images/gogesh/create.png',
        'assets/images/projects/app_images/gogesh/login_or_signup.png',
      ],
      createdAt: DateTime(2024, 8, 29),
    ),
    Project(
      id: 'quotehub',
      title: 'QuoteHub App',
      shortDescription: 'Random quote generator with categories and favorites',
      description:
          'A simple yet elegant app that displays random inspirational quotes with category selection. '
          'Features include quote sharing, favorites, category filtering, and a clean, minimalist design.',
      technologies: ['Flutter', 'Dart', 'REST API', 'Local Storage'],
      githubUrl:
          'https://github.com/YoussefSalem582/Random-Quote-Generator-App',
      imageUrl:
          'assets/images/projects/app_images/QuoteHub/Home Screen with Quotes.png',
      galleryImages: [
        'assets/images/projects/app_images/QuoteHub/Home Screen with Quotes.png',
        'assets/images/projects/app_images/QuoteHub/Home Screen.png',
        'assets/images/projects/app_images/QuoteHub/Select Category.png',
        'assets/images/projects/app_images/QuoteHub/Favorite Page.png',
      ],
      createdAt: DateTime(2024, 2, 10),
    ),
    Project(
      id: 'facial-recognition',
      title: 'Facial Recognition System',
      shortDescription: 'AI-powered facial recognition and analysis',
      description:
          'An advanced facial recognition system using computer vision and machine learning. '
          'Capable of face detection, recognition, and analysis with high accuracy using OpenCV and TensorFlow.',
      technologies: [
        'Python',
        'OpenCV',
        'TensorFlow',
        'Computer Vision',
        'Machine Learning',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Facial-Recognition-System',
      imageUrl: null, // No specific image available
      createdAt: DateTime(2024, 12, 5),
    ),
    Project(
      id: 'sign-language-translator',
      title: 'Sign Language Translator',
      shortDescription:
          'AI system for sign language recognition and translation',
      description:
          'An innovative AI-powered system that recognizes sign language gestures and translates them to text or speech. '
          'Uses advanced computer vision and machine learning algorithms for real-time gesture recognition.',
      technologies: [
        'Python',
        'OpenCV',
        'TensorFlow',
        'Computer Vision',
        'Machine Learning',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Sign-Language-Translator',
      imageUrl: null, // No specific image available
      createdAt: DateTime(2024, 10, 20),
    ),
    Project(
      id: 'pothole-detection',
      title: 'Comparative Analysis of ML Models for Street Pothole Detection',
      shortDescription:
          'Research paper comparing CNN, ResNet-50, and Decision Trees',
      description:
          'Comparative research evaluating CNN, ResNet-50, and Decision Trees for pothole detection. '
          'Shows ML and data-focused experience with comprehensive model evaluation and performance analysis.',
      technologies: [
        'Python',
        'TensorFlow',
        'CNN',
        'ResNet-50',
        'Machine Learning',
      ],
      githubUrl:
          'https://github.com/YoussefSalem582/Street-Pothole-Detection-Research',
      imageUrl: null, // No specific image available
      createdAt: DateTime(2024, 8, 15),
    ),
  ];

  // Featured projects (first 3)
  static List<Project> get featuredProjects =>
      projects.where((project) => project.isFeatured).take(3).toList();

  // Get projects by category
  static List<Project> getProjectsByTechnology(String technology) {
    return projects
        .where((project) => project.technologies.contains(technology))
        .toList();
  }
}
