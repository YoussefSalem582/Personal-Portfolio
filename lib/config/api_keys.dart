/// API Keys Configuration
///
/// Defaults for the contact form. Prefer build-time overrides when deploying
/// from CI (`ContactRuntimeConfig` in `contact_runtime_config.dart`):
/// `--dart-define=FORMSPREE_ENDPOINT=...` and
/// `--dart-define=CONTACT_RECIPIENT_EMAIL=...`
///
/// Formspree form URLs are usually safe in client bundles; use defines if you
/// want the repo copy of this file to stay generic.
class ApiKeys {
  // Formspree Configuration (FREE, no domain restrictions.)
  // Sign up at https://formspree.io/ to get your own endpoint
  static const String formspreeEndpoint = 'https://formspree.io/f/mblprzva';

  // Email recipient (public information)
  static const String recipientEmail = 'youssef.salem.hassan582@gmail.com';
}
