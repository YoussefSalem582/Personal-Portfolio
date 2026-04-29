/// Application Configuration
///
/// Contains app-wide configuration constants and settings
class AppConfig {
  AppConfig._();

  // ==================== GitHub Configuration ====================

  /// GitHub repository owner username
  static const String githubOwner = 'YoussefSalem582';

  /// GitHub repository name
  static const String githubRepo = 'Youssef-Salem-Portfolio';

  /// GitHub repository branch (usually 'master' or 'main')
  static const String githubBranch = 'master';

  /// Base URL for GitHub raw content
  static const String githubRawBaseUrl =
      'https://raw.githubusercontent.com/$githubOwner/$githubRepo/$githubBranch';

  /// Canonical deployed site origin (production).
  ///
  /// Override with `--dart-define=SITE_BASE_URL=https://your-domain.com`
  /// (GitHub Actions uses repository secret `SITE_BASE_URL` when set).
  static const String siteBaseUrl = String.fromEnvironment(
    'SITE_BASE_URL',
    defaultValue: 'https://youssef-salem-portfolio.vercel.app',
  );

  // ==================== Asset Configuration ====================

  /// Get full GitHub raw URL for an asset path
  ///
  /// Example:
  /// ```dart
  /// getGitHubRawUrl('assets/documents/resume.pdf');
  /// // Returns: https://raw.githubusercontent.com/YoussefSalem582/Youssef-Salem-Portfolio/master/assets/documents/resume.pdf
  /// ```
  static String getGithubRawUrl(String assetPath) {
    // Remove leading slash if present
    final cleanPath =
        assetPath.startsWith('/') ? assetPath.substring(1) : assetPath;
    return '$githubRawBaseUrl/$cleanPath';
  }

  /// Absolute URL for an asset on the deployed site (same origin as [siteBaseUrl]).
  ///
  /// Example:
  /// ```dart
  /// getDeployedSiteAssetUrl('assets/documents/resume.pdf');
  /// ```
  static String getDeployedSiteAssetUrl(String assetPath) {
    final cleanPath =
        assetPath.startsWith('/') ? assetPath.substring(1) : assetPath;
    return '$siteBaseUrl/$cleanPath';
  }

  // ==================== App Information ====================

  /// Application name
  static const String appName = 'Youssef Salem Portfolio';

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
