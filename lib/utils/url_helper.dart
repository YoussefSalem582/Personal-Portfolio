import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web/web.dart' as web show window;

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
    // For web, if it's an asset path, construct the proper URL
    if (kIsWeb) {
      if (url.startsWith('assets/')) {
        // On Flutter web, assets are served from the root with /assets/ prefix
        // So 'assets/documents/file.pdf' becomes '/assets/documents/file.pdf'
        final webUrl = '/$url';
        try {
          web.window.open(webUrl, '_blank');
          return;
        } catch (e) {
          // If that fails, try without the leading slash
          try {
            web.window.open(url, '_blank');
            return;
          } catch (e2) {
            throw 'Could not open $url';
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
