import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:web/web.dart' as web show window;
import '../config/app_config.dart';

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
    // For web, if it's an asset path, use GitHub raw content URL
    if (kIsWeb) {
      if (url.startsWith('assets/')) {
        // Strategy 1: Use GitHub raw content URL (works for all file types including PDFs)
        final githubRawUrl = AppConfig.getGithubRawUrl(url);

        // Strategy 2: Try GitHub Pages URL as fallback
        final githubPagesUrl = AppConfig.getGithubPagesAssetUrl(url);

        // Strategy 3: Try relative asset path
        final webUrl = '/$url';

        // Try each strategy in order
        try {
          web.window.open(githubRawUrl, '_blank');
          return;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to open via GitHub raw: $e');
          }

          try {
            web.window.open(githubPagesUrl, '_blank');
            return;
          } catch (e2) {
            if (kDebugMode) {
              print('Failed to open via GitHub Pages: $e2');
            }

            try {
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
}
