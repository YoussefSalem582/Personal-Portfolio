import '../../models/project.dart';
import '../assets/app_constants.dart';

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
      imageUrl: EmosenseImages.appIcon,
      galleryImages: [
        // Onboarding & Authentication
        EmosenseEmployeeImages.splashScreen,
        EmosenseEmployeeImages.onboarding1,
        EmosenseEmployeeImages.onboarding2,
        EmosenseEmployeeImages.onboarding3,
        EmosenseEmployeeImages.onboarding4,
        EmosenseEmployeeImages.signinAndLogin,
        EmosenseEmployeeImages.signinEmployee,
        EmosenseEmployeeImages.login,
        EmosenseEmployeeImages.signinAdmin,

        // Employee Home & Tools
        EmosenseEmployeeImages.homeScreen,
        EmosenseEmployeeImages.toolsScreen,

        // Video Analysis
        EmosenseEmployeeImages.videoAnalysis,
        EmosenseEmployeeImages.videoAnalysis2,
        EmosenseEmployeeImages.videoAnalysis3,
        EmosenseEmployeeImages.videoAnalysis4,

        // Voice Analysis
        EmosenseEmployeeImages.voiceAnalysis,
        EmosenseEmployeeImages.voiceAnalysis2,
        EmosenseEmployeeImages.voiceAnalysis3,

        // Text Analysis
        EmosenseEmployeeImages.textAnalysis,
        EmosenseEmployeeImages.textAnalysis2,

        // Support Tickets
        EmosenseEmployeeImages.tickets,
        EmosenseEmployeeImages.tickets2,
        EmosenseEmployeeImages.tickets3,

        // Employee Profile
        EmosenseEmployeeImages.profile,
        EmosenseEmployeeImages.profile2,
        EmosenseEmployeeImages.profile3,

        // Admin Panel
        EmosenseAdminImages.homeScreen,
        EmosenseAdminImages.userManagement,
        EmosenseAdminImages.system,
        EmosenseAdminImages.system2,
        EmosenseAdminImages.supportTickets,
        EmosenseAdminImages.profile,
        EmosenseAdminImages.profile2,
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
      imageUrl: MusicAppImages.appLogo,
      galleryImages: [
        MusicAppImages.homePage,
        MusicAppImages.homeScreen1,
        MusicAppImages.homeScreen2,
        MusicAppImages.musicPlayerScreen,
        MusicAppImages.playlistScreen,
        MusicAppImages.likedSongsPage,
      ],
      createdAt: DateTime(2025, 3, 1),
      isFeatured: false,
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
      imageUrl: ChatAppImages.appLogo,
      galleryImages: [
        ChatAppImages.homePage,
        ChatAppImages.chat,
        ChatAppImages.login,
        ChatAppImages.register,
        ChatAppImages.lightmode,
        ChatAppImages.settingsPage,
        ChatAppImages.drawer,
      ],
      createdAt: DateTime(2025, 3, 1),
      isFeatured: false,
    ),
    Project(
      id: 'personal-portfolio',
      title: 'Personal Portfolio Website',
      shortDescription:
          'Responsive Flutter web portfolio showcasing projects, skills, and professional experience',
      description:
          'A modern, fully responsive portfolio website built with Flutter Web to showcase my software development journey and projects. '
          'Features include dynamic project galleries with categorized screenshots, interactive skill cards with proficiency levels, '
          'certificate showcase, contact form with EmailJS integration, smooth animations and transitions, dark/light theme toggle, '
          'SEO optimization with meta tags and sitemap, GetX state management for efficient routing and navigation, '
          'lazy loading and performance optimizations for fast load times, and modular architecture with clean separation of concerns. '
          'Deployed as a static site on GitHub Pages, demonstrating full-stack web development capabilities from design to deployment.',
      technologies: [
        'Flutter Web',
        'Dart',
        'GetX',
        'EmailJS',
        'Responsive Design',
        'State Management',
        'SEO',
        'GitHub Pages',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Personal-Portfolio',
      liveUrl: 'https://youssefsalem582.github.io/Personal-Portfolio/',
      imageUrl: AppImages.portfolioLogo,
      createdAt: DateTime(2025, 10, 1),
      isFeatured: true,
    ),
    Project(
      id: 'sprints-shop',
      title: 'Sprints Shop App',
      shortDescription:
          'Full-featured shopping app with authentication, cart, and payment integration',
      description:
          'A comprehensive Flutter shopping application built from core Dart principles to professional mobile development. '
          'Features include user authentication (sign-up/sign-in) with form validation, interactive product catalog with detailed product views, '
          'shopping cart functionality with real-time updates, secure payment processing, order management system, and complete Arabic localization using Flutter Intl. '
          'Implements responsive UI with stateless and stateful widgets, animated page transitions, custom fonts (Suwannaphum-Regular), and follows best practices with modular architecture. '
          'This project demonstrates the full mobile app development lifecycle from beginner to intermediate Flutter development.',
      technologies: [
        'Flutter',
        'Dart',
        'State Management',
        'Form Validation',
        'Internationalization',
        'Payment Integration',
        'Custom Fonts',
        'Animations',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/sprints_shop',
      imageUrl: SprintsShopImages.appLogo,
      galleryImages: [
        // Authentication
        SprintsShopImages.loginAndSignin,
        SprintsShopImages.login,
        SprintsShopImages.login2,
        SprintsShopImages.signUp,
        SprintsShopImages.loginAndSignUp2,

        // Shopping Experience
        SprintsShopImages.homeScreen,
        SprintsShopImages.productsScreen,
        SprintsShopImages.productDetailScreen,
        SprintsShopImages.cartScreen,

        // Order & Payment
        SprintsShopImages.orderScreen,
        SprintsShopImages.orderScreen2,
        SprintsShopImages.paymentScreen,
        SprintsShopImages.paymentScreen2,
      ],
      createdAt: DateTime(2025, 1, 15),
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
      imageUrl: QuizHubImages.quizAppLogo,
      galleryImages: [
        QuizHubImages.homeScreen,
        QuizHubImages.quiz,
        QuizHubImages.correctAnswer,
        QuizHubImages.incorrectAnswer,
        QuizHubImages.quiCompleted,
        QuizHubImages.reviewPage,
      ],
      createdAt: DateTime(2025, 3, 1),
    ),
    Project(
      id: 'gopooling-carpool',
      title: 'GoPooling Carpool Ride Sharing App',
      shortDescription:
          'University carpool platform connecting students for ride-sharing',
      description:
          'GoPooling is a comprehensive carpool ride-sharing application designed specifically for university students, faculty, and staff. '
          'The app facilitates convenient ride-sharing coordination within the campus community, featuring real-time GPS tracking, '
          'driver-passenger matching, rating system, ride history, and secure payment integration. Developed as a CSCI313 project '
          'with a complete software requirements specification, use cases, sequence diagrams, and comprehensive testing. '
          'Built with Flutter and Firebase, the app provides seamless booking, navigation, notifications, and emergency assistance features.',
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Google Maps API',
        'Figma',
        'Software Engineering',
        'UML Diagrams',
        'System Design',
      ],
      githubUrl: null,
      imageUrl: GoPoolingImages.appLogo,
      galleryImages: [
        // UML Diagrams
        GoPoolingImages.useCaseDiagram,
        GoPoolingImages.classDiagram,

        // Onboarding
        GoPoolingImages.onboarding1,
        GoPoolingImages.onboarding2,
        GoPoolingImages.onboarding3,

        // User Authentication
        GoPoolingImages.userLogin,
        GoPoolingImages.userSignup,

        // Driver Authentication
        GoPoolingImages.driverLogin,
        GoPoolingImages.driverSignup,

        // Ride Booking Flow
        GoPoolingImages.homeScreen,
        GoPoolingImages.pickupPlaceScreen,
        GoPoolingImages.selectYourRideScreen,
        GoPoolingImages.selectedRideDetailScreen,

        // Trip Management
        GoPoolingImages.myTripsScreen1,
        GoPoolingImages.myTripsScreen2,

        // Navigation & Other Features
        GoPoolingImages.notificationScreen,
        GoPoolingImages.sideDrawerNavigation,
      ],
      createdAt: DateTime(2023, 12, 30),
      isFeatured: false,
    ),
    Project(
      id: 'chargehub',
      title: 'ChargeHub App',
      shortDescription:
          'EV & gas station finder with interactive maps and BLoC-based state management',
      description:
          'EV & gas station finder with interactive maps and BLoC-based state management. Built in September 2024, '
          'this app helps users locate charging stations and gas stations with real-time availability.',
      technologies: [
        'Flutter',
        'Dart',
        'Maps API',
        'BLoC',
        'GPS',
        'flutter_map',
        'Firebase',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/ChargeHub-App',
      imageUrl: ChargeHubImages.chargeHub,
      galleryImages: [
        // Authentication
        ChargeHubImages.login,
        ChargeHubImages.signup,

        // Main Features
        ChargeHubImages.homescreen,
        ChargeHubImages.map,
        ChargeHubImages.cars,

        // Vehicle Types
        ChargeHubImages.evCar,
        ChargeHubImages.evCar1,
        ChargeHubImages.gasCar,
        ChargeHubImages.gasCar1,
      ],
      createdAt: DateTime(2024, 9, 15),
    ),
    Project(
      id: 'gogesh-marketplace',
      title: 'Gogesh Marketplace App',
      shortDescription:
          'Full-stack e-commerce marketplace connecting buyers and sellers with dual-interface support',
      description:
          'Gogesh is a comprehensive Flutter-based mobile marketplace platform connecting buyers and sellers with secure payment processing and real-time functionality. '
          'Built with cross-platform support for Android and iOS, the app features dual interfaces: a User Interface for browsing and purchasing products, and a Merchant Interface for sellers to manage inventory, track orders, and analyze sales. '
          'Integrated custom REST API backend for data management, Firebase for authentication and cloud storage, and Stripe for payment gateway. '
          'Implements BLoC state management pattern for efficient state handling across complex user flows. '
          'Key features include: onboarding screens, phone and email authentication, advanced product search with filtering and categories, product detail views with image galleries, '
          'shopping cart with persistent state, favorites/wishlist system, real-time chat support between buyers and sellers, push notifications for order updates, '
          'merchant dashboard with sales analytics, product listing management, order tracking system, advertisement placement, and user profile management. '
          'Applied lazy loading, pagination, and API caching strategies for optimized performance with large datasets. '
          'This project was developed during my WE Internship in September 2024, demonstrating professional e-commerce platform development skills.',
      technologies: [
        'Flutter',
        'Dart',
        'BLoC',
        'Firebase',
        'REST API',
        'Stripe',
        'Push Notifications',
        'State Management',
      ],
      //githubUrl: 'https://github.com/YoussefSalem582/Gogesh-App',
      imageUrl: GogeshImages.gogeshAppLogo,
      galleryImages: [
        // Onboarding & Splash
        GogeshImages.splash,
        GogeshImages.onboard1,
        GogeshImages.onboard2,
        GogeshImages.onboard3,

        // Authentication Flow
        GogeshImages.loginOrSignup,
        GogeshImages.phoneLogin,
        GogeshImages.phoneLogin2,
        GogeshImages.createAccountScreen,
        GogeshImages.signupScreen,
        GogeshImages.signupScreen2,
        GogeshImages.signupScreen3,
        GogeshImages.signupScreen4,
        GogeshImages.signupScreen5,
        GogeshImages.signupScreen6,
        GogeshImages.signupScreen7,
        GogeshImages.signupScreen8,
        GogeshImages.signupScreen9,
        GogeshImages.signupScreen10,
        GogeshImages.signupScreen11,
        GogeshImages.signupScreen12,
        GogeshImages.signupScreen13,
        GogeshImages.signupScreen14,

        // User Home & Shopping
        GogeshImages.userHomeScreen,
        GogeshImages.userHomeScreen2,
        GogeshImages.appMainSearch,

        // Categories & Products
        GogeshImages.categoryScreen,
        GogeshImages.categoryDetailScreen,
        GogeshImages.categoryResultScreen,
        GogeshImages.productScreen,
        GogeshImages.filter,
        GogeshImages.productFilter,

        // Favorites & Offers
        GogeshImages.favoriteScreen,
        GogeshImages.offersScreen,
        GogeshImages.adsScreen,

        // Communication
        GogeshImages.chatScreen,
        GogeshImages.chatScreen2,
        GogeshImages.notificationScreen,

        // Merchant Dashboard
        GogeshImages.merchantHomeScreen,
        GogeshImages.merchantProductDetailScreen,
        GogeshImages.merchantProfileScreen,
        GogeshImages.ctaButtonScreen,
        GogeshImages.ctaButtonScreen2,
        GogeshImages.ctaButtonScreen3,
        GogeshImages.report,
        GogeshImages.report2,
      ],
      createdAt: DateTime(2025, 8, 29),
      isFeatured: true,
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
      imageUrl: QuoteHubImages.qoutehubAppLogo,
      galleryImages: [
        QuoteHubImages.homeScreenWithQuotes,
        QuoteHubImages.homeScreen,
        QuoteHubImages.selectCategory,
        QuoteHubImages.favoritePage,
      ],
      createdAt: DateTime(2025, 3, 1),
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
      imageUrl: FacialRecognitionImages.homepage,
      galleryImages: [
        FacialRecognitionImages.homepage,
        FacialRecognitionImages.homepageExample,
      ],
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
      imageUrl: SignLanguageTranslatorImages.appLogo,
      galleryImages: [
        SignLanguageTranslatorImages.blockDiagram,
        SignLanguageTranslatorImages.flowchart,
        SignLanguageTranslatorImages.collectedSamples,
        SignLanguageTranslatorImages.creatingDatasets,
        SignLanguageTranslatorImages.results,
      ],
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
      imageUrl: PotholeDetectionImages.samples,
      galleryImages: [
        PotholeDetectionImages.samples,
        PotholeDetectionImages.imageCounts,
        PotholeDetectionImages.potholeImageDimensions,
        PotholeDetectionImages.noPotholeImageDimensions,
        PotholeDetectionImages.trainingAndValidation,
        PotholeDetectionImages.resultsAndAnalysis,
        PotholeDetectionImages.confusionMatrix,
        PotholeDetectionImages.decisionTreeVisualization,
      ],
      createdAt: DateTime(2024, 8, 15),
    ),
    Project(
      id: 'interactive-learning-assistant',
      title: 'Interactive Learning Assistant with Customizable 3D Avatars',
      shortDescription:
          'Immersive learning experience with customizable 3D avatars and emotional interaction',
      description:
          'An Interactive Learning Assistant designed to enhance engagement and motivation in online education through customizable 3D avatars. '
          'Built using Three.js and React, the assistant provides students with an immersive learning experience by adding emotional interaction and feedback to digital lessons. '
          'Users can customize their avatars to represent themselves and receive real-time emotional cues and encouragement throughout their study sessions.\n\n'
          'This tool addresses the challenge of sustaining student focus and motivation during remote learning, offering features such as text-to-speech reading for accessibility, '
          'guided study prompts, and avatar expressions that respond to user performance (e.g., smiling for correct answers or showing encouragement during challenging moments).\n\n'
          'By integrating seamlessly with existing learning management systems (LMS) or as a standalone web app, the Interactive Learning Assistant helps bridge the gap '
          'between traditional classroom dynamics and online education, making learning more engaging and personalized.',
      technologies: [
        'React',
        'Three.js',
        'JavaScript',
        '3D Graphics',
        'Text-to-Speech',
        'Web Development',
        'Educational Technology',
        'UI/UX',
      ],
      imageUrl: ThreeJsProjectImages.image1,
      galleryImages: [
        ThreeJsProjectImages.image1,
        ThreeJsProjectImages.image2,
        ThreeJsProjectImages.image3,
      ],
      createdAt: DateTime(2024, 12, 30),
      isFeatured: false,
    ),
  ];

  // Get all projects sorted by date (latest first)
  static List<Project> get projectsSortedByDate {
    final sortedProjects = List<Project>.from(projects);
    sortedProjects.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sortedProjects;
  }

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
