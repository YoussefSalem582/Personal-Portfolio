/// Static case study content for project detail (portfolio feature [`data`] layer).
///
/// Custom overview copy, challenges, and learnings keyed by project id.
library;

/// Model for a challenge/solution pair
class ProjectChallenge {
  final String title;
  final String description;

  const ProjectChallenge({
    required this.title,
    required this.description,
  });

  Map<String, String> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}

/// Helper class for project-specific content
///
/// Provides static methods to retrieve custom content for different projects.
/// This centralizes project-specific data and keeps the UI widgets generic.
///
/// Supported project IDs:
/// - 'emosense-app': AI emotion recognition system
/// - 'music-player': Audio player application
/// - 'gogesh-marketplace': Commercial marketplace platform
/// - 'technology-ninety-two-job-marketplace': Job marketplace (Technology 92)
/// - 'default': Generic fallback for other projects
class ProjectCaseStudyData {
  /// Gets project-specific challenges and solutions
  ///
  /// Returns a list of maps containing 'title' and 'description' keys
  /// for each challenge faced during the project development.
  ///
  /// Parameters:
  /// - [projectId]: Unique identifier for the project
  static List<Map<String, String>> getProjectChallenges(String projectId) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseChallenges;
      case 'gogesh-marketplace':
        return _gogeshChallenges;
      case 'flutter-mate':
        return _flutterMateChallenges;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Challenges;
      case 'music-player':
        return _musicPlayerChallenges;
      default:
        return _defaultChallenges;
    }
  }

  /// Gets project-specific key learnings
  ///
  /// Returns a list of lessons learned and skills gained from the project.
  /// Each string represents a specific learning or insight.
  ///
  /// Parameters:
  /// - [projectId]: Unique identifier for the project
  static List<String> getProjectLessons(String projectId) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseLessons;
      case 'gogesh-marketplace':
        return _gogeshLessons;
      case 'flutter-mate':
        return _flutterMateLessons;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Lessons;
      case 'music-player':
        return _musicPlayerLessons;
      default:
        return _defaultLessons;
    }
  }

  /// Gets project-specific overview text
  ///
  /// Returns a detailed overview paragraph for the project.
  /// Falls back to the standard description if no custom overview exists.
  ///
  /// Parameters:
  /// - [projectId]: Unique identifier for the project
  /// - [description]: Default description to use as fallback
  static String getProjectOverviewText(String projectId, String description) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseOverview;
      case 'gogesh-marketplace':
        return _gogeshOverview;
      case 'flutter-mate':
        return _flutterMateOverview;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Overview;
      default:
        // Default: use project's standard description
        return description;
    }
  }

  /// Gets project-specific key features
  ///
  /// Returns a list of maps containing 'icon' and 'title' and 'description' keys
  /// for each key feature of the project.
  ///
  /// Parameters:
  /// - [projectId]: Unique identifier for the project
  static List<Map<String, dynamic>>? getProjectFeatures(String projectId) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseFeatures;
      case 'gogesh-marketplace':
        return _gogeshFeatures;
      case 'flutter-mate':
        return _flutterMateFeatures;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Features;
      default:
        return null; // No custom features for other projects
    }
  }

  // ==================== EMOSENSE PROJECT DATA ====================

  static const String _emosenseOverview =
      '🚀 EmoSense is a cutting-edge enterprise-grade emotion recognition platform that revolutionizes customer service and human interaction analysis through advanced AI-powered sentiment monitoring. '
      'Built with Clean Architecture principles and Flutter, this comprehensive solution empowers businesses to understand, analyze, and improve customer interactions across multiple channels including text 📝, voice 🎤, and video 🎥.\n\n'
      '🏢 Perfect for enterprises like Amazon, Google, Microsoft, and Salesforce seeking data-driven customer insights, EmoSense features role-based access control with Admin Dashboard 👨‍💼 and Employee Portal 👩‍💻, '
      'advanced analytics suite 📊 with real-time sentiment monitoring and team performance tracking, multi-modal analysis tools for text/voice/social media, and enterprise features including live monitoring 📡, advanced reporting 📈, and system configuration ⚙️.\n\n'
      '🎓 This graduate-level research project from Nile University demonstrates theoretical foundation in emotion detection algorithms, technical implementation with Flutter 3.32.1 and BLoC/Cubit state management, '
      'and real-world business applicability. The platform achieves ⚡ 10-15 second video analysis, features 20+ professional screens with zero opacity errors ✅, and includes comprehensive enterprise features ready for production deployment 🎯.';

  static final List<Map<String, String>> _emosenseChallenges = [
    {
      'title': '🏗️ Enterprise-Scale Architecture',
      'description':
          'Implementing Clean Architecture with BLoC/Cubit state management for a production-ready enterprise application required careful planning of dependency injection, repository patterns, and use case encapsulation. Achieved 95%+ code organization with maintainable and testable codebase.',
    },
    {
      'title': '🤖 Multi-Modal AI Integration',
      'description':
          'Integrating real-time emotion detection across text, voice, and video streams while maintaining 10-15 second processing time required advanced optimization, careful synchronization, and efficient data preprocessing. Implemented batch processing capabilities for enterprise-scale analysis.',
    },
    {
      'title': '⚡ Animation Performance & Opacity Safety',
      'description':
          'Eliminated all opacity assertion errors by implementing custom animation controllers with safe curves and proper lifecycle management. Achieved smooth 60fps animations across all 20+ professional screens with memory-efficient cleanup and state persistence.',
    },
    {
      'title': '🔐 Role-Based Access Control',
      'description':
          'Designing separate Admin Dashboard and Employee Portal experiences with secure authentication and comprehensive user management required advanced state management, proper security boundaries, and enterprise-grade access control patterns.',
    },
  ];

  static const List<String> _emosenseLessons = [
    '🏛️ Mastered Clean Architecture principles with BLoC/Cubit state management for enterprise applications',
    '⚡ Advanced Flutter optimization: eliminated opacity errors, achieved 60fps animations with proper lifecycle management',
    '🔧 Enterprise development patterns: dependency injection with GetIt, repository pattern, use case encapsulation',
    '🤖 Multi-modal AI integration: real-time emotion detection across text, voice, and video with 10-15s processing',
    '🚀 Production-ready features: role-based access control, live monitoring dashboard, advanced analytics suite',
    '🎓 Graduate-level research: academic methodology combined with practical business applications',
    '📊 Performance optimization: memory-efficient asset management, 95%+ code organization, comprehensive error handling',
    '💙 Modern Flutter 3.32.1: Material Design 3, responsive layouts, progressive web app capabilities',
  ];

  static final List<Map<String, dynamic>> _emosenseFeatures = [
    {
      'icon':
          'flutter_icon_svg', // Will be resolved to AppIcons.flutterIconSvg in widget
      'title': 'Real-time Emotion Detection',
      'description':
          'Advanced ML models analyze facial expressions and vocal patterns for accurate emotion recognition'
    },
    {
      'icon': 'badge', // Will be resolved to AppIcons.badge in widget
      'title': 'Privacy-First Architecture',
      'description':
          'Built with privacy by design principles, ensuring user data protection and compliance'
    },
    {
      'icon': 'technology', // Will be resolved to AppIcons.technology in widget
      'title': 'Multimodal Analysis',
      'description':
          'Combines audio and video processing for comprehensive emotion understanding'
    },
    {
      'icon': 'dashboard', // Will be resolved to AppIcons.dashboard in widget
      'title': 'Advanced Analytics',
      'description':
          'Comprehensive emotion analytics dashboard with insights and reporting capabilities'
    },
  ];

  // ==================== GOGESH PROJECT DATA ====================

  static const String _gogeshOverview =
      '🌟 Gogesh is a comprehensive commercial marketplace platform connecting merchants and customers across the Gulf and Arab world through an intelligent, categorized directory of economic activities. '
      'Built with Flutter 3.3.0+ and BLoC Pattern, this enterprise-ready solution provides seamless business discovery, real-time communication, and secure transactions with complete Arabic (RTL) and English support.\n\n'
      '🏪 Perfect for businesses seeking digital presence and customers looking for local services, Gogesh features unified dual-role architecture for customers and merchants 👥, '
      'Google Maps integration with real-time navigation 🗺️, advanced search with smart filters 🔍, live chat for instant merchant-customer communication 💬, '
      'secure payment processing with multiple gateways 💳, tiered subscription packages (Silver/Gold/Platinum) 📊, and comprehensive analytics dashboards 📈.\n\n'
      '💼 My first freelance project (April 2025 - September 2025), this production-ready platform demonstrates full e-commerce development lifecycle: '
      '25,000+ lines of modular code, 40+ professional screens, 150+ reusable widgets, 200+ test cases, OAuth2 social authentication, Firebase Cloud Messaging for notifications, '
      'and enterprise-grade security with A+ rating 🔒. The app showcases advanced mobile development with location services, real-time features, and scalable architecture ready for regional expansion 🚀.';

  static final List<Map<String, String>> _gogeshChallenges = [
    {
      'title': '🌐 Bidirectional Language Support (RTL/LTR)',
      'description':
          'Implementing seamless Arabic (RTL) and English (LTR) support with SF Pro Display and Readex Pro fonts required careful text alignment, layout mirroring, and cultural design considerations. Achieved consistent UI/UX across both languages with proper text direction, number formatting, and date/time localization.',
    },
    {
      'title': '🗺️ Complex Google Maps Integration',
      'description':
          'Integrating Google Maps Flutter with Geolocator for real-time location services, interactive business markers, navigation, and location-based search required handling permissions, API security, marker clustering, and offline scenarios. Implemented secure API key management and optimized map performance.',
    },
    {
      'title': '🏗️ Dual User Role Architecture',
      'description':
          'Designing separate customer and merchant experiences within a unified app required sophisticated state management with BLoC Pattern, role-based navigation guards, and context-aware UI rendering. Built modular architecture with shared components and role-specific features.',
    },
    {
      'title': '💳 Multi-Gateway Payment Integration',
      'description':
          'Implementing secure payment processing with Flutter Credit Card integration across multiple payment gateways required PCI compliance, error handling, transaction verification, and support for various regional payment methods. Ensured secure data transmission with end-to-end encryption.',
    },
    {
      'title': '📊 Advanced Subscription Management',
      'description':
          'Building comprehensive Silver, Gold, and Platinum subscription tiers with feature gating, billing cycles, payment history, and upgrade/downgrade flows required complex business logic, state synchronization, and graceful handling of subscription changes and renewals.',
    },
    {
      'title': '🔔 Real-Time Notification System',
      'description':
          'Implementing Firebase Cloud Messaging (FCM) for push notifications with targeted campaigns, scheduling, and user preferences required handling notification permissions, background/foreground states, deep linking, and notification action handlers across platforms.',
    },
    {
      'title': '💬 Live Chat Infrastructure',
      'description':
          'Building real-time messaging between customers and merchants with typing indicators, read receipts, message persistence, and notification integration required WebSocket connections, efficient state updates, offline message queuing, and proper chat history management.',
    },
    {
      'title': '🎯 Smart Targeting & Analytics',
      'description':
          'Creating advanced advertisement targeting with location-based campaigns, audience segmentation, performance tracking, and ROI analytics required data aggregation, user behavior analysis, and comprehensive dashboard visualizations for merchant insights.',
    },
  ];

  static const List<String> _gogeshLessons = [
    '🌍 Mastered bidirectional UI design with complete Arabic (RTL) and English (LTR) support for global marketplaces',
    '🗺️ Advanced geolocation features: Google Maps integration, real-time navigation, and location-based search',
    '🏗️ Clean Architecture with BLoC Pattern: scalable state management for dual-role enterprise applications',
    '💳 Secure payment processing: multi-gateway integration with PCI compliance and regional payment methods',
    '🔐 Enterprise authentication: OAuth2 social login (Google, Apple, Facebook) with JWT security',
    '📊 Subscription business models: tiered packages with feature gating and comprehensive billing management',
    '💬 Real-time communication: WebSocket-based live chat with typing indicators and message persistence',
    '🎯 Data-driven marketing: advanced analytics, audience targeting, and merchant dashboard development',
    '🔔 Push notification strategies: FCM implementation with targeted campaigns and deep linking',
    '⚡ Performance optimization: 25,000+ lines of modular code with 150+ reusable widgets',
    '🧪 Quality assurance: 200+ test cases with BLoC Test and Mockito for production readiness',
    '🚀 Full development lifecycle: from requirements gathering to deployment in 2-month internship',
  ];

  static final List<Map<String, dynamic>> _gogeshFeatures = [
    {
      'icon': 'store',
      'title': 'Dual-Role Architecture',
      'description':
          'Seamless experience for both merchants and customers with role-specific dashboards and features'
    },
    {
      'icon': 'map_outlined',
      'title': 'Location-Based Discovery',
      'description':
          'Google Maps integration with geolocation for finding nearby businesses and services'
    },
    {
      'icon': 'chat',
      'title': 'Real-time Communication',
      'description':
          'Built-in live chat system connecting merchants and customers with instant messaging'
    },
    {
      'icon': 'payment',
      'title': 'Secure Payment Gateway',
      'description':
          'Integrated payment processing with multiple payment methods and subscription management'
    },
    {
      'icon': 'language',
      'title': 'Full Localization',
      'description':
          'Complete Arabic/English support with RTL layout for Gulf and Arab world markets'
    },
    {
      'icon': 'analytics',
      'title': 'Business Analytics',
      'description':
          'Comprehensive reporting and analytics dashboard for merchant performance tracking'
    },
  ];

  // ==================== TECHNOLOGY 92 PROJECT DATA ====================

  static const String _technology92Overview =
      'Technology 92 is a proprietary Flutter job marketplace client aligned with Clean Architecture: each feature owns domain contracts, repository implementations, and presentation with BLoC. '
      'Routing uses go_router; dependency injection uses GetIt; networking uses Dio against a Laravel backend with typed layers and Either-based failures.\n\n'
      'Major surfaces include authentication (credentials and Google Sign-In), a main shell with bottom navigation, rich profile viewing and editing, KPI definitions and entries with filtering, '
      'attendance flows including background timing and notifications, and a broad settings area (theme, locale, policies, account actions). '
      'Localization spans roughly 343 keys per language via ARB workflows with Arabic RTL and English LTR.\n\n'
      'Built for Flutter SDK ^3.10.3 at app version 0.4.2+7; targets Android, iOS, web, Linux, macOS, and Windows. Observability can integrate Talker-family loggers and Sentry alongside Firebase where configured.';

  static final List<Map<String, String>> _technology92Challenges = [
    {
      'title': 'Enterprise-scale Clean Architecture',
      'description':
          'Organizing seven feature modules with shared patterns for repositories, datasources, and use cases while keeping domain free of Flutter imports required disciplined layering and consistent failure mapping from Dio to domain types.',
    },
    {
      'title': 'Arabic / English product parity',
      'description':
          'Maintaining RTL and LTR layouts, typography, and semantics across 300+ strings per language needed structured ARB workflows, context-aware formatting, and regression checks on critical flows.',
    },
    {
      'title': 'Attendance and background behavior',
      'description':
          'Combining foreground services, timers, lock-screen visibility, and notification channels with correct platform policies demanded careful lifecycle handling and user-facing status clarity.',
    },
    {
      'title': 'Breadth of API integration',
      'description':
          'Coordinating 50+ endpoints for auth, profiles, KPIs, attendance, and settings required consistent error contracts, token refresh behavior, and resilient offline or degraded states where applicable.',
    },
  ];

  static const List<String> _technology92Lessons = [
    'Feature-first Clean Architecture at scale: domain entities, abstract repos, and testable use cases per module',
    'Production BLoC usage with equatable states and explicit events across auth, home, KPI, attendance, and profile',
    'Declarative navigation with go_router and typed route segments integrated with DI-resolved repositories',
    'Functional error handling with dartz (Either) from repository boundaries through UI feedback',
    'Intl / ARB bilingual workflows with RTL polish and shared copy discipline across large key sets',
    'Dio interceptors, environment-driven base URLs, and Laravel API integration patterns',
    'Cross-form concerns: formz-style validation, secure storage for tokens, and selective code generation (freezed/json_serializable)',
    'Multi-platform targets with shared UI while respecting desktop and web constraints where relevant',
  ];

  static final List<Map<String, dynamic>> _technology92Features = [
    {
      'icon': 'verified_user',
      'title': 'Auth & onboarding',
      'description':
          'Splash, onboarding, language selection, and credential plus Google Sign-In flows wired to secure token handling',
    },
    {
      'icon': 'home',
      'title': 'Shell & dashboard',
      'description':
          'Bottom navigation Home, KPIs, Attendance, and Settings with dashboard cards and live summaries',
    },
    {
      'icon': 'badge',
      'title': 'Profile & KPI',
      'description':
          'Deep profile viewing and editing modules plus KPI definitions, entries CRUD, and date-filtered listings',
    },
    {
      'icon': 'schedule',
      'title': 'Attendance',
      'description':
          'Clock in/out, status and history, background timer, and lock-screen notification experiences',
    },
    {
      'icon': 'language',
      'title': 'Localization',
      'description':
          'ARB-driven English and Arabic with RTL support and consistent Material 3 presentation',
    },
    {
      'icon': 'settings',
      'title': 'Settings suite',
      'description':
          'Theme and locale switches, policies, contact, About, notifications, rate app, delete account, and logout',
    },
  ];

  // ==================== FLUTTERMATE PROJECT DATA ====================

  static const String _flutterMateOverview =
      '📚 FlutterMate is your personal Flutter learning companion that transforms the journey from beginner to advanced developer through structured lessons, gamified progress tracking, and intelligent learning paths. '
      'Built with Clean Architecture and GetX state management, this comprehensive educational platform provides 22 meticulously crafted lessons across 3 difficulty levels, ensuring a smooth learning progression from fundamental concepts to advanced Flutter development.\n\n'
      '🎯 Perfect for aspiring Flutter developers and those seeking to level up their skills, FlutterMate features a smart prerequisite system that unlocks lessons as you progress 📈, '
      '25+ interactive quizzes with instant feedback and explanations 💡, comprehensive progress tracking with XP rewards and achievement badges 🏆, '
      'detailed lesson pages with curated resources and practice exercises 📖, beautiful Material 3 design with dark/light themes 🎨, '
      'and weekly progress visualizations to track your learning journey 📊.\n\n'
      '🚀 Currently in active development (November 2025), this platform demonstrates modern educational app architecture with '
      'feature-first organization, reactive state management, persistent progress storage, smooth animations with flutter_animate and Lottie, '
      'and responsive design for mobile, tablet, and web 💻. The app showcases full-stack Flutter development skills with clean code practices, '
      'automated deployment via GitHub Actions, and progressive web app capabilities ready for learners worldwide 🌍.';

  static final List<Map<String, String>> _flutterMateChallenges = [
    {
      'title': '🎓 Structured Learning Path Design',
      'description':
          'Designing a comprehensive curriculum with 22 lessons across 3 difficulty levels required careful content organization, time estimation accuracy, and prerequisite dependency mapping. Implemented smart unlock system ensuring learners build strong foundations before advancing to complex topics.',
    },
    {
      'title': '📊 Gamification & Motivation System',
      'description':
          'Creating an engaging progress tracking system with XP rewards, achievement badges, day streaks, and performance analytics required balancing motivation with learning effectiveness. Built comprehensive state management to track multiple progress metrics and visualize learning journey.',
    },
    {
      'title': '💡 Interactive Quiz Integration',
      'description':
          'Building 25+ quizzes with instant feedback, color-coded answers, explanations, and score tracking required careful question design, answer validation logic, and performance analytics. Implemented smart quiz system that adapts feedback based on learner performance.',
    },
    {
      'title': '⚡ Performance & State Persistence',
      'description':
          'Ensuring smooth animations while persisting complex learning progress (lessons, quizzes, XP, streaks) across app restarts required efficient SharedPreferences usage, optimized GetX state management, and careful memory management for 60fps animations.',
    },
    {
      'title': '🎨 Responsive Educational UI/UX',
      'description':
          'Designing an interface that works seamlessly across mobile, tablet, and web while maintaining educational clarity required adaptive layouts, proper information hierarchy, accessibility considerations, and intuitive navigation patterns for diverse learning contexts.',
    },
    {
      'title': '🚀 Automated Deployment Pipeline',
      'description':
          'Setting up GitHub Actions for automated Flutter web builds with CanvasKit renderer, PWA optimization, tree-shaking, and Vercel deployment required CI/CD configuration, build optimization strategies, and proper base-href routing for production deployment.',
    },
  ];

  static const List<String> _flutterMateLessons = [
    '🏗️ Clean Architecture mastery: feature-first organization with proper separation of concerns',
    '🔄 Advanced GetX state management: reactive programming, dependency injection, and route management',
    '📚 Educational platform development: curriculum design, prerequisite systems, and learning path optimization',
    '🎮 Gamification techniques: XP systems, achievement badges, progress tracking, and motivation patterns',
    '💾 Data persistence strategies: SharedPreferences for complex state, serialization, and migration handling',
    '🎨 Material Design 3: modern theming, dark/light modes, smooth animations, and responsive layouts',
    '⚡ Performance optimization: flutter_animate, Lottie integration, 60fps animations, and memory efficiency',
    '📊 Analytics & visualization: progress charts, performance metrics, and insightful learning dashboards',
    '🧪 Flutter testing: widget tests, unit tests, and quality assurance for educational content',
    '🚀 Modern deployment: GitHub Actions, Flutter web optimization, PWA features, and automated CI/CD',
    '📱 Multi-platform development: responsive design for mobile, tablet, and web with unified codebase',
    '🎯 User-centric design: intuitive navigation, clear information hierarchy, and accessibility best practices',
  ];

  static final List<Map<String, dynamic>> _flutterMateFeatures = [
    {
      'icon': 'school',
      'title': '22 Structured Lessons',
      'description':
          'Comprehensive curriculum across Beginner, Intermediate, and Advanced levels with time estimates and prerequisites'
    },
    {
      'icon': 'quiz',
      'title': 'Interactive Quiz System',
      'description':
          '25+ quizzes with instant feedback, explanations, score tracking, and XP rewards for correct answers'
    },
    {
      'icon': 'emoji_events',
      'title': 'Progress Tracking & Gamification',
      'description':
          'Real-time stats, achievement badges, day streaks, weekly charts, and comprehensive learning analytics'
    },
    {
      'icon': 'library_books',
      'title': 'Rich Lesson Content',
      'description':
          'Detailed overviews, learning objectives, curated resources, practice exercises, and difficulty indicators'
    },
    {
      'icon': 'palette',
      'title': 'Beautiful Material Design 3',
      'description':
          'Modern UI with dark/light themes, smooth animations, responsive layouts, and color-coded learning stages'
    },
    {
      'icon': 'devices',
      'title': 'Multi-Platform Support',
      'description':
          'Works seamlessly on mobile, tablet, and web with progressive web app capabilities'
    },
  ];

  // ==================== MUSIC PLAYER PROJECT DATA ====================

  static final List<Map<String, String>> _musicPlayerChallenges = [
    {
      'title': 'Background Audio Processing',
      'description':
          'Implementing smooth background playback while maintaining UI responsiveness required careful state management and audio session handling.',
    },
    {
      'title': 'Cross-Platform Audio Support',
      'description':
          'Ensuring consistent audio playback across different platforms required platform-specific optimizations and fallback mechanisms.',
    },
  ];

  static const List<String> _musicPlayerLessons = [
    'Advanced state management patterns for complex audio applications',
    'Platform-specific optimizations for Flutter applications',
    'Audio processing and background task management',
    'Modern UI/UX design principles for media applications',
  ];

  // ==================== DEFAULT PROJECT DATA ====================

  static final List<Map<String, String>> _defaultChallenges = [
    {
      'title': 'Performance Optimization',
      'description':
          'Ensuring smooth performance across different devices required careful optimization of rendering and state management.',
    },
    {
      'title': 'User Experience Design',
      'description':
          'Creating an intuitive interface that works well on both mobile and web platforms required responsive design considerations.',
    },
  ];

  static const List<String> _defaultLessons = [
    'Flutter best practices for scalable application architecture',
    'Responsive design techniques for multi-platform support',
    'Performance optimization strategies for smooth user experience',
    'Modern development practices and testing methodologies',
  ];
}
