import 'package:url_launcher/url_launcher.dart';

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
}
