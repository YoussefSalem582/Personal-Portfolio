/// Helper class for project-specific content
///
/// Provides static methods to retrieve custom content for different projects.
/// This centralizes project-specific data and keeps the UI widgets generic.
///
/// Supported project IDs:
/// - 'emosense-app': AI emotion recognition system
/// - 'music-player': Audio player application
/// - 'default': Generic fallback for other projects
class ProjectContentHelper {
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
        return [
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
      case 'gogesh-marketplace':
        return [
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
      case 'music-player':
        return [
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
      default:
        return [
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
        return [
          '🏛️ Mastered Clean Architecture principles with BLoC/Cubit state management for enterprise applications',
          '⚡ Advanced Flutter optimization: eliminated opacity errors, achieved 60fps animations with proper lifecycle management',
          '🔧 Enterprise development patterns: dependency injection with GetIt, repository pattern, use case encapsulation',
          '🤖 Multi-modal AI integration: real-time emotion detection across text, voice, and video with 10-15s processing',
          '🚀 Production-ready features: role-based access control, live monitoring dashboard, advanced analytics suite',
          '🎓 Graduate-level research: academic methodology combined with practical business applications',
          '📊 Performance optimization: memory-efficient asset management, 95%+ code organization, comprehensive error handling',
          '💙 Modern Flutter 3.32.1: Material Design 3, responsive layouts, progressive web app capabilities',
        ];
      case 'gogesh-marketplace':
        return [
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
      case 'music-player':
        return [
          'Advanced state management patterns for complex audio applications',
          'Platform-specific optimizations for Flutter applications',
          'Audio processing and background task management',
          'Modern UI/UX design principles for media applications',
        ];
      default:
        return [
          'Flutter best practices for scalable application architecture',
          'Responsive design techniques for multi-platform support',
          'Performance optimization strategies for smooth user experience',
          'Modern development practices and testing methodologies',
        ];
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
    // Check for project-specific custom overview
    if (projectId == 'emosense-app') {
      // Custom overview for Emosense project highlighting its significance
      return '🚀 EmoSense is a cutting-edge enterprise-grade emotion recognition platform that revolutionizes customer service and human interaction analysis through advanced AI-powered sentiment monitoring. '
          'Built with Clean Architecture principles and Flutter, this comprehensive solution empowers businesses to understand, analyze, and improve customer interactions across multiple channels including text 📝, voice 🎤, and video 🎥.\n\n'
          '🏢 Perfect for enterprises like Amazon, Google, Microsoft, and Salesforce seeking data-driven customer insights, EmoSense features role-based access control with Admin Dashboard 👨‍💼 and Employee Portal 👩‍💻, '
          'advanced analytics suite 📊 with real-time sentiment monitoring and team performance tracking, multi-modal analysis tools for text/voice/social media, and enterprise features including live monitoring 📡, advanced reporting 📈, and system configuration ⚙️.\n\n'
          '🎓 This graduate-level research project from Nile University demonstrates theoretical foundation in emotion detection algorithms, technical implementation with Flutter 3.32.1 and BLoC/Cubit state management, '
          'and real-world business applicability. The platform achieves ⚡ 10-15 second video analysis, features 20+ professional screens with zero opacity errors ✅, and includes comprehensive enterprise features ready for production deployment 🎯.';
    } else if (projectId == 'gogesh-marketplace') {
      // Custom overview for Gogesh marketplace highlighting its comprehensive nature
      return '🌟 Gogesh is a comprehensive commercial marketplace platform connecting merchants and customers across the Gulf and Arab world through an intelligent, categorized directory of economic activities. '
          'Built with Flutter 3.3.0+ and BLoC Pattern, this enterprise-ready solution provides seamless business discovery, real-time communication, and secure transactions with complete Arabic (RTL) and English support.\n\n'
          '🏪 Perfect for businesses seeking digital presence and customers looking for local services, Gogesh features unified dual-role architecture for customers and merchants 👥, '
          'Google Maps integration with real-time navigation 🗺️, advanced search with smart filters 🔍, live chat for instant merchant-customer communication 💬, '
          'secure payment processing with multiple gateways 💳, tiered subscription packages (Silver/Gold/Platinum) 📊, and comprehensive analytics dashboards 📈.\n\n'
          '💼 My first freelance project (April 2025 - September 2025), this production-ready platform demonstrates full e-commerce development lifecycle: '
          '25,000+ lines of modular code, 40+ professional screens, 150+ reusable widgets, 200+ test cases, OAuth2 social authentication, Firebase Cloud Messaging for notifications, '
          'and enterprise-grade security with A+ rating 🔒. The app showcases advanced mobile development with location services, real-time features, and scalable architecture ready for regional expansion 🚀.';
    }
    // Default: use project's standard description
    return description;
  }
}
