import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:web/web.dart' as web show window;
import '../config/app_config.dart';
import '../../l10n/app_localizations.dart';

class UrlHelper {
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    String emailUrl = 'mailto:$email';
    List<String> params = [];

    if (subject != null && subject.isNotEmpty) {
      params.add('subject=${Uri.encodeComponent(subject)}');
    }

    if (body != null && body.isNotEmpty) {
      params.add('body=${Uri.encodeComponent(body)}');
    }

    if (params.isNotEmpty) {
      emailUrl += '?${params.join('&')}';
    }

    await launchURL(emailUrl);
  }

  static Future<void> launchPhone(String phoneNumber) async {
    final String phone = 'tel:$phoneNumber';
    await launchURL(phone);
  }

  static Future<void> downloadFile(String url) async {
    await launchURL(url);
  }

  /// Opens a file (like PDF) in a new tab or viewer
  /// For web, this opens in a new browser tab
  /// For mobile/desktop, uses the default file viewer
  static Future<void> openFile(String url) async {
    // For web, if it's an asset path, use appropriate viewer
    if (kIsWeb) {
      if (url.startsWith('assets/')) {
        // Determine file type
        final isHtml = url.toLowerCase().endsWith('.html');
        final isPdf = url.toLowerCase().endsWith('.pdf');

        String viewerUrl;

        if (isPdf) {
          // Use Mozilla's PDF.js viewer (handles large files better)
          final githubRawUrl = AppConfig.getGithubRawUrl(url);
          // Mozilla's PDF.js viewer is reliable and works with large files
          viewerUrl =
              'https://mozilla.github.io/pdf.js/web/viewer.html?file=${Uri.encodeComponent(githubRawUrl)}';
        } else if (isHtml) {
          // For HTML files, use GitHub raw URL directly
          final githubRawUrl = AppConfig.getGithubRawUrl(url);
          viewerUrl = githubRawUrl;
        } else {
          // For other files, try deployed origin first, then raw
          viewerUrl = AppConfig.getDeployedSiteAssetUrl(url);
        }

        try {
          web.window.open(viewerUrl, '_blank');
          return;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to open via primary strategy: $e');
          }

          // Fallback: try direct GitHub raw URL
          try {
            final githubRawUrl = AppConfig.getGithubRawUrl(url);
            web.window.open(githubRawUrl, '_blank');
            return;
          } catch (e2) {
            if (kDebugMode) {
              print('Failed to open via GitHub raw: $e2');
            }

            // Last resort: try relative asset path
            try {
              final webUrl = '/$url';
              web.window.open(webUrl, '_blank');
              return;
            } catch (e3) {
              if (kDebugMode) {
                print('Failed to open via relative path: $e3');
              }
              throw 'Could not open $url - tried all strategies';
            }
          }
        }
      } else {
        // For absolute URLs, open directly
        web.window.open(url, '_blank');
        return;
      }
    }

    // For mobile/desktop platforms
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not open $url';
    }
  }

  /// Label for project [liveUrl] buttons (Google Play listing vs deployed web app).
  static String liveUrlButtonLabel(
    AppLocalizations l10n,
    String url, {
    bool compact = false,
  }) {
    if (url.contains('play.google.com')) {
      return compact ? l10n.liveUrlGooglePlayShort : l10n.liveUrlGooglePlay;
    }
    return compact ? l10n.liveUrlDemoShort : l10n.liveUrlDemo;
  }
}
