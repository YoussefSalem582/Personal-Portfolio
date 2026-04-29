import 'package:youssef_hassan_portfolio/features/projects/domain/entities/project.dart';
import '../assets/app_constants.dart';

class ProjectsData {
  static final List<Project> projects = [
    Project(
      id: 'flutter-mate',
      title: 'FlutterMate - Flutter Learning Companion',
      shortDescription:
          '📚 Your personal Flutter learning companion with structured lessons, progress tracking, and AI-powered assistance',
      description:
          'FlutterMate is a comprehensive learning assistant designed to guide developers from Flutter beginner to advanced through structured lessons, progress tracking, and AI-powered assistance. '
          'Built with Clean Architecture and GetX state management, the app features 22 comprehensive lessons across 3 difficulty levels (Beginner: 8 lessons/245 min, Intermediate: 6 lessons/345 min, Advanced: 6 lessons/440 min). '
          'The prerequisite system ensures proper learning progression by unlocking lessons as you advance, while time estimates help learners plan their study sessions.\n\n'
          'The interactive quiz system includes 25+ questions covering all lessons and topics, providing instant feedback with color-coded answers and explanations. '
          'Learners earn XP rewards for correct answers, track their quiz performance, view completion rates and average scores, and receive personalized feedback based on performance. '
          'The comprehensive progress tracking displays real-time stats for lessons completed, projects built, and XP earned, along with quiz analytics, stage completion progress bars, '
          'achievement badges, day streak tracking, activity feeds, and weekly progress charts.\n\n'
          'Each lesson detail page offers rich content with detailed overviews and objectives, curated learning resources and documentation links, hands-on practice exercises, '
          'integrated quizzes, completion tracking, difficulty indicators (Easy/Medium/Hard), and visible XP rewards. The beautiful Material 3 design features dark/light themes with automatic persistence, '
          'smooth animations and delightful transitions, fully responsive layouts for all screen sizes, and color-coded stages for visual learning hierarchy. '
          'An AI assistant is coming soon to provide context-aware help based on learning progress, code examples, and explanations through an interactive chat interface.',
      technologies: [
        'Flutter 3.0+',
        'Dart 3.0+',
        'Clean Architecture',
        'GetX 4.6.6',
        'State Management',
        'flutter_animate 4.5.0',
        'Lottie 3.1.0',
        'shared_preferences 2.2.2',
        'Material Design 3',
        'GitHub Pages',
        'GitHub Actions',
        'Responsive Design',
        'Progressive Web App',
      ],
      githubUrl: 'https://github.com/YoussefSalem582/flutter_mate',
      liveUrl: 'https://youssefsalem582.github.io/flutter_mate/',
      imageUrl: FlutterMateImages.appLogo,
      galleryImages: [
        // Splash & Onboarding
        FlutterMateImages.splashScreen,
        FlutterMateImages.onboardingScreen,
        FlutterMateImages.onboardingScreen2,
        FlutterMateImages.onboardingScreen3,

        // Authentication
        FlutterMateImages.loginScreen,
        FlutterMateImages.signupScreen,

        // Roadmap
        FlutterMateImages.roadmapScreen,
        FlutterMateImages.roadmapScreen2,

        // Lessons
        FlutterMateImages.lessonScreen,
        FlutterMateImages.lessonScreen2,
        FlutterMateImages.lessonScreen3,

        // Lesson Details (12 screens)
        FlutterMateImages.lessonDetailScreen,
        FlutterMateImages.lessonDetailScreen2,
        FlutterMateImages.lessonDetailScreen3,
        FlutterMateImages.lessonDetailScreen4,
        FlutterMateImages.lessonDetailScreen5,
        FlutterMateImages.lessonDetailScreen6,
        FlutterMateImages.lessonDetailScreen7,
        FlutterMateImages.lessonDetailScreen8,
        FlutterMateImages.lessonDetailScreen9,
        FlutterMateImages.lessonDetailScreen10,
        FlutterMateImages.lessonDetailScreen11,
        FlutterMateImages.lessonDetailScreen12,

        // Lesson Quizzes
        FlutterMateImages.lessonQuizScreen,
        FlutterMateImages.lessonQuizScreen2,
        FlutterMateImages.lessonQuizScreen3,
        FlutterMateImages.lessonQuizScreen4,

        // Skill Assessment
        FlutterMateImages.skillAssessmentScreen,
        FlutterMateImages.skillAssessmentScreen2,
        FlutterMateImages.skillAssessmentScreen3,
        FlutterMateImages.skillAssessmentScreen4,

        // Analytics/Progress
        FlutterMateImages.analyticsScreen,
        FlutterMateImages.analyticsScreen2,
        FlutterMateImages.analyticsScreen3,

        // Profile
        FlutterMateImages.profileScreen,
        FlutterMateImages.profileScreen2,
        FlutterMateImages.profileScreen3,
        FlutterMateImages.profileScreen4,

        // AI Chat
        FlutterMateImages.aiChatScreen,
        FlutterMateImages.aiChatScreen2,

        // Community
        FlutterMateImages.communityScreen,
        FlutterMateImages.communityScreen2,

        // Desktop View
        FlutterMateImages.desktopScreenView,
      ],
      createdAt: DateTime(2025, 11, 1),
      isFeatured: true,
      isUnderDevelopment: true,
    ),
    Project(
      id: 'technology-ninety-two-job-marketplace',
      title: 'Technology 92 — Job Marketplace App',
      shortDescription:
          'Flutter job marketplace with Clean Architecture, BLoC, Dio, and full Arabic / English localization against a Laravel API',
      description:
          'Technology 92 is a cross-platform job marketplace mobile app built with Clean Architecture (domain / data / presentation per feature), BLoC state management, '
          '`go_router` navigation, GetIt dependency injection, and functional error handling with `dartz` (Either). '
          'It integrates with the Technology 92 Laravel backend via Dio across 50+ API endpoints covering authentication (including Google Sign-In), profiles, KPIs, '
          'attendance with background timers and notifications, jobs and marketplace flows, settings, and more.\n\n'
          'The presentation layer ships multiple feature modules—including auth, home shell with bottom navigation, profile (view and edit), KPIs, attendance, and settings—with '
          'about 343 localization keys per language using Flutter `intl` and ARB files for Arabic and English, including RTL. '
          'The stack uses Material 3 styling, cached images, forms and validation tooling, observability helpers (talker family), Firebase and Sentry where configured, and dev tooling such as '
          'freezed/json_serializable/injectable for generated code.\n\n'
          'Designed for Android, iOS, web, and desktop targets; proprietary codebase (not on pub.dev). Version 0.4.2+7 at Flutter SDK ^3.10.3.',
      technologies: [
        'Flutter',
        'Dart',
        'flutter_bloc',
        'BLoC/Cubit',
        'Clean Architecture',
        'go_router',
        'get_it',
        'dio',
        'dartz',
        'intl / ARB',
        'Arabic / English',
        'Laravel API',
        'Enterprise',
      ],
      liveUrl:
          'https://play.google.com/store/apps/details?id=com.technology92.employee',
      imageUrl: Technology92Images.appLogo,
      galleryImages: [
        Technology92Images.p1,
        Technology92Images.p2,
        Technology92Images.p3,
        Technology92Images.p4,
        Technology92Images.p5,
      ],
      createdAt: DateTime(2026, 3, 11),
      isFeatured: true,
    ),
    Project(
      id: 'emosense-app',
      title: 'EmoSense - Enterprise Emotion Recognition Platform',
      shortDescription:
          'Enterprise-grade emotion recognition platform for customer service optimization and sentiment analytics',
      description:
          'EmoSense is a cutting-edge enterprise-grade emotion recognition platform built with Clean Architecture and Flutter. '
          'Features multi-modal AI analysis (text, voice, video), role-based access control (Admin/Employee portals), '
          'real-time sentiment monitoring, and comprehensive analytics. Graduate-level research project from Nile University '
          'demonstrating advanced emotion detection with 10-15 second processing, 20+ professional screens, and production-ready features.',
      technologies: [
        'Flutter 3.32.1',
        'Dart 3.0+',
        'Clean Architecture',
        'BLoC/Cubit',
        'Python',
        'TensorFlow',
        'Computer Vision',
        'Audio Processing',
        'Machine Learning',
        'REST API',
        'Repository Pattern',
        'Material Design 3',
        'GetIt DI',
        'Animation System',
        'State Management',
        'Enterprise Security'
      ],
      githubUrl: 'https://github.com/YoussefSalem582/Emosense-App',
      videoUrl: 'https://youtu.be/dENKfUHi_dg?si=qGTGXdMrMFc08uVB',
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
      videoUrl: 'https://youtu.be/l9mvtCu3DTk?si=7emI--sdnxEFwK4X',
      shortVideoUrl:
          'https://youtube.com/shorts/AhamfMRMiNo?si=HwZOLhlWWglxZMDM',
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
      videoUrl: 'https://youtu.be/3Ku8HG4AtEM?si=_wH3ErCMbEZGvJEB',
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
      id: 'youssef-hassan-portfolio',
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
      githubUrl: 'https://github.com/YoussefSalem582/Youssef-Hassan-Portfolio',
      liveUrl: 'https://youssefsalem582.github.io/Youssef-Hassan-Portfolio/',
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
      videoUrl: 'https://youtu.be/Q5koHfQddy8?si=MDzNcbonIxnq-sq_',
      shortVideoUrl:
          'https://youtube.com/shorts/yEkSYYxftA8?si=zzjFzFsX9COxErOM',
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
      title: 'Gogesh - Comprehensive Commercial Directory',
      shortDescription:
          '🌍 Your comprehensive marketplace connecting merchants and customers across the Gulf and Arab world',
      description:
          'Gogesh is a comprehensive commercial marketplace platform connecting merchants and customers across the Gulf and Arab world. '
          'Built with Flutter and BLoC Pattern, it features dual-role architecture, Google Maps integration, live chat, secure payments, '
          'subscription tiers, and full Arabic/English localization. My first freelance project showcasing enterprise e-commerce development.',
      technologies: [
        'Flutter 3.3.0+',
        'Dart',
        'BLoC Pattern',
        'Google Maps',
        'Geolocator',
        'Firebase',
        'REST API',
        'JWT Auth',
        'OAuth2',
        'Payment Gateway',
        'Push Notifications',
        'Material Design 3',
        'RTL Support',
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
