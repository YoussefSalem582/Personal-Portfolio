import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConfig {
  // Supabase project configuration
  static String get supabaseUrl =>
      dotenv.env['SUPABASE_URL'] ?? 'https://fllxvrbjobacfxqceyzw.supabase.co';

  static String get supabaseAnonKey =>
      dotenv.env['SUPABASE_ANON_KEY'] ??
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZsbHh2cmJqb2JhY2Z4cWNleXp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc3MjUyMTEsImV4cCI6MjA3MzMwMTIxMX0.2WA1MOniKxEIlMADW3eiOujHC03JSguwtgokGSa6LR4';

  // Storage bucket names
  static String get projectImagesBucket =>
      dotenv.env['PROJECT_IMAGES_BUCKET'] ?? 'project-images';

  static String get certificateImagesBucket =>
      dotenv.env['CERTIFICATE_IMAGES_BUCKET'] ?? 'certificate-images';

  static String get profileImagesBucket =>
      dotenv.env['PROFILE_IMAGES_BUCKET'] ?? 'profile-images';

  // Application configuration
  static String get appEnv => dotenv.env['APP_ENV'] ?? 'development';
  static String get appName =>
      dotenv.env['APP_NAME'] ?? 'Youssef Hassan Portfolio';
  static String get appUrl => dotenv.env['APP_URL'] ?? '';

  // Social media links
  static String get githubUrl => dotenv.env['GITHUB_URL'] ?? '';
  static String get linkedinUrl => dotenv.env['LINKEDIN_URL'] ?? '';
  static String get twitterUrl => dotenv.env['TWITTER_URL'] ?? '';
  static String get email => dotenv.env['EMAIL'] ?? '';

  // Contact form
  static String get contactFormEndpoint =>
      dotenv.env['CONTACT_FORM_ENDPOINT'] ?? '';
}
