/// Application Configuration
///
/// Contains app-wide configuration constants and settings
class AppConfig {
  AppConfig._();

  // ==================== GitHub Configuration ====================

  /// GitHub repository owner username
  static const String githubOwner = 'YoussefSalem582';

  /// GitHub repository name
  static const String githubRepo = 'Youssef-Hassan-Portfolio';

  /// GitHub repository branch (usually 'master' or 'main')
  static const String githubBranch = 'master';

  /// Base URL for GitHub raw content
  static const String githubRawBaseUrl =
      'https://raw.githubusercontent.com/$githubOwner/$githubRepo/$githubBranch';

  /// Base URL for GitHub Pages
  static const String githubPagesUrl =
      'https://$githubOwner.github.io/$githubRepo';

  // ==================== Asset Configuration ====================

  /// Get full GitHub raw URL for an asset path
  ///
  /// Example:
  /// ```dart
  /// getGitHubRawUrl('assets/documents/resume.pdf');
  /// // Returns: https://raw.githubusercontent.com/YoussefSalem582/Youssef-Hassan-Portfolio/master/assets/documents/resume.pdf
  /// ```
  static String getGithubRawUrl(String assetPath) {
    // Remove leading slash if present
    final cleanPath =
        assetPath.startsWith('/') ? assetPath.substring(1) : assetPath;
    return '$githubRawBaseUrl/$cleanPath';
  }

  /// Get GitHub Pages URL for an asset path
  ///
  /// Example:
  /// ```dart
  /// getGitHubPagesUrl('assets/documents/resume.pdf');
  /// // Returns: https://youssefsalem582.github.io/Youssef-Hassan-Portfolio/assets/documents/resume.pdf
  /// ```
  static String getGithubPagesAssetUrl(String assetPath) {
    // Remove leading slash if present
    final cleanPath =
        assetPath.startsWith('/') ? assetPath.substring(1) : assetPath;
    return '$githubPagesUrl/$cleanPath';
  }

  // ==================== App Information ====================

  /// Application name
  static const String appName = 'Youssef Hassan Portfolio';

  /// Application version
  static const String appVersion = '1.0.0';

  /// Contact email
  static const String contactEmail = 'youssef.salem.hassan582@gmail.com';

  // ==================== Social Media Links ====================

  /// LinkedIn profile URL
  static const String linkedInUrl =
      'https://www.linkedin.com/in/youssef-hassan-32408022b/';

  /// GitHub profile URL
  static const String githubProfileUrl = 'https://github.com/$githubOwner';

  /// Upwork profile URL
  static const String upworkUrl =
      'https://www.upwork.com/freelancers/~01db16e46b3a3c76e8';

  // ==================== Development Settings ====================

  /// Enable debug mode
  static const bool debugMode = false;

  /// Enable analytics
  static const bool enableAnalytics = true;

  /// Enable performance monitoring
  static const bool enablePerformanceMonitoring = true;
}
