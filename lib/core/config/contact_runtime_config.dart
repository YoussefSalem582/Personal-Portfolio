import 'api_keys.dart';

/// Resolves contact form values for the running build.
///
/// **Compile-time overrides** (take precedence when non-empty):
/// - `--dart-define=FORMSPREE_ENDPOINT=https://formspree.io/f/...`
/// - `--dart-define=CONTACT_RECIPIENT_EMAIL=you@example.com`
///
/// Otherwise falls back to [ApiKeys] in [api_keys.dart] (typical local / fork setup).
abstract final class ContactRuntimeConfig {
  ContactRuntimeConfig._();

  static String get formspreeEndpoint {
    const fromEnv = String.fromEnvironment('FORMSPREE_ENDPOINT');
    if (fromEnv.isNotEmpty) return fromEnv;
    return ApiKeys.formspreeEndpoint;
  }

  static String get recipientEmail {
    const fromEnv = String.fromEnvironment('CONTACT_RECIPIENT_EMAIL');
    if (fromEnv.isNotEmpty) return fromEnv;
    return ApiKeys.recipientEmail;
  }
}
