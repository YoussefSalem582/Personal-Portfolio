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
            'title': 'Multimodal Data Integration',
            'description':
                'Combining audio and video processing required careful synchronization and data preprocessing to ensure accurate emotion detection across different modalities.',
          },
          {
            'title': 'Privacy-First Design',
            'description':
                'Implementing local processing while maintaining accuracy was challenging, but essential for user privacy in mental health applications.',
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
          'Deep understanding of machine learning model evaluation and performance metrics',
          'Experience with multimodal data processing and synchronization',
          'Privacy-first development approaches for sensitive applications',
          'Importance of comprehensive testing with diverse datasets',
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
      return 'Emosense represents the culmination of my academic journey, combining cutting-edge AI technology with real-world applications. '
          'This multimodal emotion recognition system demonstrates expertise in machine learning, computer vision, and audio processing. '
          'The project addresses critical needs in mental health monitoring and customer service enhancement through innovative technology.';
    }
    // Default: use project's standard description
    return description;
  }
}
