import '../models/project.dart';
import '../models/skill.dart';
import '../models/contact.dart';
import '../models/contact_form.dart';
import '../models/certificate.dart';

class PortfolioData {
  // Personal information
  static const String fullName = 'Youssef Salem Hassan';
  static const String title = 'Flutter Developer';
  static const String subtitle = 'Building fast cross-platform apps';
  static const String bio =
      'Flutter developer and ML practitioner. I build cross-platform mobile & web apps, '
      'and integrate machine learning into real-world applications (facial recognition, emotion analysis).';

  static const String email = 'youssef.salem.hassan582@gmail.com';
  static const String phone = '+20 123 456 7890'; // Replace with actual phone
  static const String location = 'Egypt';
  static const String portfolioUrl =
      'https://v0-youssef-salem-hassan.vercel.app/';

  // Resume download URL
  static const String resumeUrl = 'assets/resume.pdf';
  static const String profileImageUrl = 'assets/profile.jpeg';

  // Social links
  static const List<SocialLink> socialLinks = [
    SocialLink(
      name: 'GitHub',
      url: 'https://github.com/YoussefSalem582',
      iconPath: 'assets/icons/github_icon.svg',
    ),
    SocialLink(
      name: 'LinkedIn',
      url: 'https://www.linkedin.com/in/youssef-hassan-8529372b7/',
      iconPath: 'assets/icons/linkedin_icon.svg',
    ),
    SocialLink(
      name: 'YouTube',
      url:
          'https://youtube.com/@YourChannel', // Update with your YouTube channel
      iconPath: 'assets/icons/youtube_icon.svg',
    ),
    SocialLink(
      name: 'Upwork',
      url:
          'https://www.upwork.com/freelancers/~yourprofile', // Update with your Upwork profile
      iconPath: 'assets/icons/upwork_icon.svg',
    ),
  ];

  // Skills
  static final List<SkillCategory> skills = [
    SkillCategory(
      id: 'mobile-dev',
      name: 'Mobile Development',
      icon: 'phone_android',
      skills: [
        Skill(
            id: 'flutter',
            name: 'Flutter',
            category: 'mobile-dev',
            proficiency: 90),
        Skill(
            id: 'dart', name: 'Dart', category: 'mobile-dev', proficiency: 90),
        Skill(
            id: 'android',
            name: 'Android',
            category: 'mobile-dev',
            proficiency: 80),
        Skill(id: 'ios', name: 'iOS', category: 'mobile-dev', proficiency: 75),
        Skill(
            id: 'firebase',
            name: 'Firebase',
            category: 'mobile-dev',
            proficiency: 80),
      ],
    ),
    SkillCategory(
      id: 'programming',
      name: 'Programming Languages',
      icon: 'code',
      skills: [
        Skill(
            id: 'dart-lang',
            name: 'Dart',
            category: 'programming',
            proficiency: 90),
        Skill(
            id: 'python',
            name: 'Python',
            category: 'programming',
            proficiency: 85),
        Skill(
            id: 'javascript',
            name: 'JavaScript',
            category: 'programming',
            proficiency: 70),
        Skill(
            id: 'java', name: 'Java', category: 'programming', proficiency: 70),
        Skill(id: 'cpp', name: 'C++', category: 'programming', proficiency: 65),
      ],
    ),
    SkillCategory(
      id: 'web-dev',
      name: 'Web Development',
      icon: 'web',
      skills: [
        Skill(
            id: 'flutter-web',
            name: 'Flutter Web',
            category: 'web-dev',
            proficiency: 80),
        Skill(
            id: 'html-css',
            name: 'HTML/CSS',
            category: 'web-dev',
            proficiency: 80),
        Skill(
            id: 'js-web',
            name: 'JavaScript',
            category: 'web-dev',
            proficiency: 70),
        Skill(
            id: 'responsive',
            name: 'Responsive Design',
            category: 'web-dev',
            proficiency: 80),
      ],
    ),
    SkillCategory(
      id: 'ai-ml',
      name: 'AI & Machine Learning',
      icon: 'psychology',
      skills: [
        Skill(
            id: 'computer-vision',
            name: 'Computer Vision',
            category: 'ai-ml',
            proficiency: 80),
        Skill(
            id: 'tensorflow',
            name: 'TensorFlow',
            category: 'ai-ml',
            proficiency: 75),
        Skill(id: 'opencv', name: 'OpenCV', category: 'ai-ml', proficiency: 80),
        Skill(
            id: 'ml',
            name: 'Machine Learning',
            category: 'ai-ml',
            proficiency: 75),
      ],
    ),
    SkillCategory(
      id: 'tools',
      name: 'Tools & Technologies',
      icon: 'build',
      skills: [
        Skill(id: 'git', name: 'Git', category: 'tools', proficiency: 80),
        Skill(
            id: 'vscode', name: 'VS Code', category: 'tools', proficiency: 90),
        Skill(
            id: 'android-studio',
            name: 'Android Studio',
            category: 'tools',
            proficiency: 80),
        Skill(
            id: 'rest-api',
            name: 'REST APIs',
            category: 'tools',
            proficiency: 80),
        Skill(
            id: 'state-mgmt',
            name: 'State Management',
            category: 'tools',
            proficiency: 80),
      ],
    ),
  ];

  // Projects
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
          'assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162654.png',
      galleryImages: [
        'assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162654.png',
        'assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162719.png',
        'assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162750.png',
        'assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162801.png',
        'assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162813.png',
        'assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163525.png',
        'assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163542.png',
        'assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163552.png',
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

  // Certificates and achievements
  static final List<Certificate> certificates = [
    Certificate(
      id: 'route-flutter-diploma',
      title: 'Flutter Diploma Certificate',
      issuer: 'Route Academy',
      description:
          'Comprehensive Flutter development certification covering mobile app development, state management, and UI/UX design.',
      issueDate: DateTime(2025, 1, 1),
      pdfUrl:
          'assets/images/certificates/route_flutter_diploma_certificate.pdf',
      imageUrl:
          'assets/images/certificates/photos/Route Flutter Diploma Certificate.png',
    ),
    Certificate(
      id: 'ml-depi',
      title: 'Machine Learning Certificate',
      issuer: 'DEPI (Digital Egypt Pioneers Initiative)',
      description:
          'Advanced machine learning certification covering neural networks, deep learning, and AI model development.',
      issueDate: DateTime(2024, 12, 1),
      pdfUrl: 'assets/images/certificates/ml_depi_certificate.pdf',
      imageUrl: 'assets/images/certificates/photos/ml_depi_certificate.png',
    ),
    Certificate(
      id: 'codealpha-certificate',
      title: 'CodeAlpha Internship Certificate',
      issuer: 'CodeAlpha',
      description:
          'Software development internship focusing on mobile app development and practical programming skills.',
      issueDate: DateTime(2024, 11, 1),
      pdfUrl: 'assets/images/certificates/CodeAlpha Certificate.pdf',
      imageUrl: 'assets/images/certificates/photos/CodeAlpha Certificate.png',
    ),
    Certificate(
      id: 'uneeq-internship',
      title: 'Uneeq Internship Certificate',
      issuer: 'Uneeq',
      description:
          'Internship certificate for software development and professional experience at Uneeq.',
      issueDate: DateTime(2024, 11, 15),
      imageUrl:
          'assets/images/certificates/photos/uneeq_intern_certificate.png',
    ),
    Certificate(
      id: 'ecpc',
      title: 'Egyptian Collegiate Programming Contest',
      issuer: 'ECPC',
      description:
          'Participation certificate in the Egyptian Collegiate Programming Contest demonstrating problem-solving skills.',
      issueDate: DateTime(2024, 10, 1),
      pdfUrl: 'assets/images/certificates/ECPC.pdf',
      imageUrl: 'assets/images/certificates/photos/ECPC.jpg',
    ),
    Certificate(
      id: 'ugrf-1',
      title: 'UGRF Certificate',
      issuer: 'UGRF (Undergraduate Research Forum)',
      description:
          'Undergraduate research participation certificate recognizing academic contribution.',
      issueDate: DateTime(2024, 9, 1),
      imageUrl: 'assets/images/certificates/photos/UGRF 1.jpg',
    ),
    Certificate(
      id: 'ugrf-2',
      title: 'UGRF Recognition',
      issuer: 'UGRF (Undergraduate Research Forum)',
      description:
          'Additional recognition certificate for outstanding undergraduate research work.',
      issueDate: DateTime(2024, 9, 1),
      imageUrl: 'assets/images/certificates/photos/UGRF .jpg',
    ),
    Certificate(
      id: 'we-certificate',
      title: 'WE Certificate',
      issuer: 'WE (Telecom Egypt)',
      description: 'Technology and telecommunications industry certificate.',
      issueDate: DateTime(2024, 6, 1),
      pdfUrl: 'assets/images/certificates/we_certificate.pdf',
      imageUrl: 'assets/images/certificates/photos/we_certificate.png',
    ),
  ];

  // Featured projects (first 3)
  static List<Project> get featuredProjects =>
      projects.where((project) => project.isFeatured).take(3).toList();

  // Contact information
  static final ContactInfo contactInfo = ContactInfo(
    email: 'youssef.salem.hassan582@gmail.com',
    phone: '+20 123 456 7890', // Replace with actual phone
    location: 'Egypt',
    github: 'https://github.com/YoussefSalem582',
    linkedin: 'https://www.linkedin.com/in/youssef-hassan-8529372b7/',
    twitter: '', // Add if available
  );

  // Get projects by category
  static List<Project> getProjectsByTechnology(String technology) {
    return projects
        .where((project) => project.technologies.contains(technology))
        .toList();
  }
}
