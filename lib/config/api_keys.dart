/// API Keys Configuration
///
/// This file contains API configuration for the portfolio contact form.
///
/// IMPORTANT: Formspree endpoints are SAFE to commit publicly
/// - They are designed to be used in client-side code
/// - Formspree has built-in spam protection and rate limiting
/// - Only emails to your verified address will be sent
class ApiKeys {
  // Formspree Configuration (FREE, no domain restrictions.)
  // Sign up at https://formspree.io/ to get your own endpoint
  static const String formspreeEndpoint = 'https://formspree.io/f/mblprzva';

  // Email recipient (public information)
  static const String recipientEmail = 'youssef.salem.hassan582@gmail.com';
}
