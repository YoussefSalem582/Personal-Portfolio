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
    // For web, if it's an asset path, use appropriate viewer
    if (kIsWeb) {
      if (url.startsWith('assets/')) {
        // Determine file type
        final isHtml = url.toLowerCase().endsWith('.html');
        final isPdf = url.toLowerCase().endsWith('.pdf');

        String viewerUrl;

        if (isPdf) {
          // Use Google Docs Viewer for PDFs (opens inline, no download)
          final githubRawUrl = AppConfig.getGithubRawUrl(url);
          viewerUrl =
              'https://docs.google.com/viewer?url=${Uri.encodeComponent(githubRawUrl)}&embedded=true';
        } else if (isHtml) {
          // For HTML files, use GitHub Pages URL directly
          viewerUrl = AppConfig.getGithubPagesAssetUrl(url);
        } else {
          // For other files, try GitHub Pages first
          viewerUrl = AppConfig.getGithubPagesAssetUrl(url);
        }

        try {
          web.window.open(viewerUrl, '_blank');
          return;
        } catch (e) {
          if (kDebugMode) {
            print('Failed to open via primary strategy: $e');
          }

          // Fallback: try relative asset path
          try {
            final webUrl = '/$url';
            web.window.open(webUrl, '_blank');
            return;
          } catch (e2) {
            if (kDebugMode) {
              print('Failed to open via relative path: $e2');
            }
            throw 'Could not open $url - tried all strategies';
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
