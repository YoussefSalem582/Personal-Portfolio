import '../models/project.dart';
import '../models/skill.dart';
import '../models/contact.dart';
import '../models/contact_form.dart';

class PortfolioData {
  // Personal information
  static const String fullName = 'Youssef Salem Hassan';
  static const String title = 'Flutter Developer';
  static const String subtitle = 'Mobile & Web Application Developer';
  static const String bio =
      'Passionate Flutter developer with expertise in creating beautiful, performant mobile and web applications. '
      'I specialize in cross-platform development using Flutter and Dart, with experience in AI integration, '
      'real-time applications, and modern UI/UX design.';

  static const String email = 'youssef.salem.hassan582@gmail.com';
  static const String phone = '+20 123 456 7890'; // Replace with actual phone
  static const String location = 'Egypt';
  static const String portfolioUrl =
      'https://v0-youssef-salem-hassan.vercel.app/';

  // Resume download URL
  static const String resumeUrl = 'assets/resume.pdf';

  // Social links
  static const List<SocialLink> socialLinks = [
    SocialLink(
      name: 'GitHub',
      url: 'https://github.com/YoussefSalem582',
      iconPath: 'assets/icons/github.svg',
    ),
    SocialLink(
      name: 'LinkedIn',
      url: 'https://www.linkedin.com/in/youssef-hassan-8529372b7/',
      iconPath: 'assets/icons/linkedin.svg',
    ),
    SocialLink(
      name: 'Portfolio',
      url: 'https://v0-youssef-salem-hassan.vercel.app/',
      iconPath: 'assets/icons/web.svg',
    ),
    SocialLink(
      name: 'Mostaql',
      url: 'https://mostaql.com/u/Youssef_Salem17',
      iconPath: 'assets/icons/mostaql.svg',
    ),
  ];

  // Skills
  static const List<SkillCategory> skills = [
    SkillCategory(
      name: 'Mobile Development',
      skills: [
        Skill(name: 'Flutter', category: 'Mobile', proficiency: 5),
        Skill(name: 'Dart', category: 'Mobile', proficiency: 5),
        Skill(name: 'Android', category: 'Mobile', proficiency: 4),
        Skill(name: 'iOS', category: 'Mobile', proficiency: 4),
        Skill(name: 'Firebase', category: 'Mobile', proficiency: 4),
      ],
    ),
    SkillCategory(
      name: 'Programming Languages',
      skills: [
        Skill(name: 'Dart', category: 'Language', proficiency: 5),
        Skill(name: 'Python', category: 'Language', proficiency: 4),
        Skill(name: 'JavaScript', category: 'Language', proficiency: 3),
        Skill(name: 'Java', category: 'Language', proficiency: 3),
        Skill(name: 'C++', category: 'Language', proficiency: 3),
      ],
    ),
    SkillCategory(
      name: 'Web Development',
      skills: [
        Skill(name: 'Flutter Web', category: 'Web', proficiency: 4),
        Skill(name: 'HTML/CSS', category: 'Web', proficiency: 4),
        Skill(name: 'JavaScript', category: 'Web', proficiency: 3),
        Skill(name: 'Responsive Design', category: 'Web', proficiency: 4),
      ],
    ),
    SkillCategory(
      name: 'AI & Machine Learning',
      skills: [
        Skill(name: 'Computer Vision', category: 'AI', proficiency: 4),
        Skill(name: 'TensorFlow', category: 'AI', proficiency: 3),
        Skill(name: 'OpenCV', category: 'AI', proficiency: 4),
        Skill(name: 'Machine Learning', category: 'AI', proficiency: 3),
      ],
    ),
    SkillCategory(
      name: 'Tools & Technologies',
      skills: [
        Skill(name: 'Git', category: 'Tool', proficiency: 4),
        Skill(name: 'VS Code', category: 'Tool', proficiency: 5),
        Skill(name: 'Android Studio', category: 'Tool', proficiency: 4),
        Skill(name: 'REST APIs', category: 'Tool', proficiency: 4),
        Skill(name: 'State Management', category: 'Tool', proficiency: 4),
      ],
    ),
  ];

  // Projects
  static final List<Project> projects = [
    Project(
      id: 'emosense',
      title: 'EmoSense App',
      shortDescription: 'AI-powered emotion detection mobile application',
      description:
          'An innovative mobile application that uses artificial intelligence to detect and analyze human emotions in real-time. The app features advanced computer vision algorithms, real-time emotion recognition, and intuitive user interface design.',
      technologies: [
        'Flutter',
        'Dart',
        'AI/ML',
        'Computer Vision',
        'TensorFlow',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/EmoSense-App',
      liveUrl: 'https://emosense-app-links.vercel.app/',
      imageUrl: 'assets/images/emosense.png',
      createdAt: DateTime(2024, 1, 15),
      isFeatured: true,
    ),
    Project(
      id: 'music-player',
      title: 'Music Player App',
      shortDescription: 'Feature-rich music player with modern UI',
      description:
          'A beautiful and functional music player application built with Flutter. Features include playlist management, audio visualization, background playback, and a sleek modern interface.',
      technologies: ['Flutter', 'Dart', 'Audio Processing', 'State Management'],
      githubUrl: 'https://github.com/YoussefSalem582/Music-Player-App',
      imageUrl: 'assets/images/music-player.png',
      createdAt: DateTime(2023, 11, 20),
      isFeatured: true,
    ),
    Project(
      id: 'chat-app',
      title: 'Real-time Chat App',
      shortDescription: 'Secure messaging application with real-time features',
      description:
          'A comprehensive chat application with real-time messaging, user authentication, media sharing, and group chat functionality. Built with modern security practices and responsive design.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Real-time Database',
        'Authentication',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/chat-app',
      imageUrl: 'assets/images/chat-app.png',
      createdAt: DateTime(2023, 9, 10),
      isFeatured: true,
    ),
    Project(
      id: 'quizhub',
      title: 'QuizHub App',
      shortDescription: 'Interactive quiz and learning platform',
      description:
          'An educational quiz application that provides interactive learning experiences. Features multiple quiz categories, progress tracking, leaderboards, and adaptive learning algorithms.',
      technologies: ['Flutter', 'Dart', 'SQLite', 'State Management'],
      githubUrl: 'https://github.com/YoussefSalem582/QuizHub-App',
      imageUrl: 'assets/images/quiz-hub.png',
      createdAt: DateTime(2023, 7, 5),
    ),
    Project(
      id: 'chargehub',
      title: 'ChargeHub App',
      shortDescription: 'Electric vehicle charging station locator',
      description:
          'A comprehensive app for electric vehicle owners to locate charging stations, check availability, and manage charging sessions. Includes real-time data and navigation integration.',
      technologies: ['Flutter', 'Dart', 'Maps API', 'REST API', 'GPS'],
      githubUrl: 'https://github.com/YoussefSalem582/ChargeHub-App',
      imageUrl: 'assets/images/charge-hub.png',
      createdAt: DateTime(2023, 5, 15),
    ),
    Project(
      id: 'market-we',
      title: 'Market WE App',
      shortDescription: 'E-commerce marketplace application',
      description:
          'A full-featured e-commerce application with product catalog, shopping cart, payment integration, and order management. Designed with modern UI/UX principles.',
      technologies: [
        'Flutter',
        'Dart',
        'REST API',
        'Payment Gateway',
        'State Management',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Market-WE-App',
      imageUrl: 'assets/images/market-we.png',
      createdAt: DateTime(2023, 3, 20),
    ),
    Project(
      id: 'quote-generator',
      title: 'Random Quote Generator',
      shortDescription: 'Inspirational quotes app with sharing features',
      description:
          'A simple yet elegant app that displays random inspirational quotes. Features include quote sharing, favorites, and a clean, minimalist design.',
      technologies: ['Flutter', 'Dart', 'REST API', 'Social Sharing'],
      githubUrl:
          'https://github.com/YoussefSalem582/Random-Quote-Generator-App',
      imageUrl: 'assets/images/quote-generator.png',
      createdAt: DateTime(2023, 2, 10),
    ),
    Project(
      id: 'facial-recognition',
      title: 'Facial Recognition System',
      shortDescription: 'AI-powered facial recognition and analysis',
      description:
          'An advanced facial recognition system using computer vision and machine learning. Capable of face detection, recognition, and analysis with high accuracy.',
      technologies: [
        'Python',
        'OpenCV',
        'TensorFlow',
        'Computer Vision',
        'AI/ML',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Facial-Recognition-System',
      imageUrl: 'assets/images/facial-recognition.png',
      createdAt: DateTime(2022, 12, 5),
    ),
    Project(
      id: 'sign-language-translator',
      title: 'Sign Language Translator',
      shortDescription:
          'AI system for sign language recognition and translation',
      description:
          'An innovative AI-powered system that recognizes sign language gestures and translates them to text or speech. Uses advanced computer vision and machine learning algorithms.',
      technologies: [
        'Python',
        'OpenCV',
        'TensorFlow',
        'Computer Vision',
        'NLP',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Sign-Language-Translator',
      imageUrl: 'assets/images/sign-language.png',
      createdAt: DateTime(2022, 10, 20),
    ),
    Project(
      id: 'road-condition-detector',
      title: 'Road Condition Detector',
      shortDescription: 'AI system for real-time road condition analysis',
      description:
          'An intelligent system that analyzes road conditions using computer vision and machine learning. Helps in traffic management and road safety assessment.',
      technologies: [
        'Python',
        'OpenCV',
        'TensorFlow',
        'Computer Vision',
        'Image Processing',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Road-Condition-Detector',
      imageUrl: 'assets/images/road-detector.png',
      createdAt: DateTime(2022, 8, 15),
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
