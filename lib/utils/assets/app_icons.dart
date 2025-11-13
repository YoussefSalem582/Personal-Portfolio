import 'package:flutter/material.dart';

/// App Icons - Centralized icon definitions and asset paths
/// Used throughout the app for consistent iconography
///
/// Usage:
/// ```dart
/// import '../utils/assets/app_icons.dart';
///
/// // Material Icons
/// Icon(AppIcons.home)
/// Icon(AppIcons.download)
///
/// // SVG Icons
/// SvgPicture.asset(AppIcons.githubIconSvg)
/// SvgPicture.asset(AppIcons.linkedinIconSvg)
/// ```
class AppIcons {
  // Prevent instantiation
  AppIcons._();

  // ==================== Icon Asset Paths ====================

  static const String _iconsPath = 'assets/icons/social';
  static const String _skillIconsPath = 'assets/icons/skills';

  // ==================== Social Media Icon Assets (SVG) ====================

  /// GitHub icon (SVG)
  static const String githubIconSvg = '$_iconsPath/github_icon.svg';

  /// LinkedIn icon (SVG)
  static const String linkedinIconSvg = '$_iconsPath/linkedin_icon.svg';

  /// YouTube icon (SVG)
  static const String youtubeIconSvg = '$_iconsPath/youtube_icon.svg';

  /// Upwork icon (SVG)
  static const String upworkIconSvg = '$_iconsPath/upwork_icon.svg';

  /// Mostaql icon (PNG)
  static const String mostaqlIconPng = '$_iconsPath/mostaql_Logo.png';

  // ==================== Other Icon Assets ====================

  /// CV icon (GIF)
  static const String cvIconGif = 'assets/icons/cv.gif';

  // ==================== Skill Icon Assets (SVG) ====================

  /// Dart icon (SVG)
  static const String dartIconSvg = '$_skillIconsPath/dart.svg';

  /// Python icon (SVG)
  static const String pythonIconSvg = '$_skillIconsPath/python.svg';

  /// Java icon (SVG)
  static const String javaIconSvg = '$_skillIconsPath/java.svg';

  /// Flutter icon (SVG)
  static const String flutterIconSvg = '$_skillIconsPath/flutter.svg';

  /// Firebase icon (SVG)
  static const String firebaseIconSvg = '$_skillIconsPath/firebase.svg';

  /// PostgreSQL icon (SVG)
  static const String pgsqlIconSvg = '$_skillIconsPath/pgsql.svg';

  /// REST API icon (SVG)
  static const String restApiIconSvg = '$_skillIconsPath/rest-api.svg';

  /// Vercel icon (SVG)
  static const String vercelIconSvg = '$_skillIconsPath/vercel.svg';

  /// GitHub icon (SVG) - for skills
  static const String githubSkillIconSvg = '$_iconsPath/github_icon.svg';

  /// Supabase icon (SVG)
  static const String supabaseIconSvg = '$_skillIconsPath/supabase_logo.svg';

  // ==================== Skill Icon Assets (PNG) ====================

  /// BLoC icon (PNG)
  static const String blocIconPng = '$_skillIconsPath/bloc_logo.png';

  /// GetX icon (PNG)
  static const String getxIconPng = '$_skillIconsPath/getx_logo.png';

  /// Figma icon (PNG)
  static const String figmaIconPng = '$_skillIconsPath/figma_logo.png';

  /// JavaScript icon (PNG)
  static const String javascriptIconPng =
      '$_skillIconsPath/javascript_logo.png';

  /// Firebase icon (PNG) - alternative
  static const String firebaseIconPng = '$_skillIconsPath/firebase_logo.png';

  // ==================== Navigation Icons ====================

  /// Home icon
  static const IconData home = Icons.home_outlined;

  /// About icon
  static const IconData about = Icons.person_outline;

  /// Projects icon
  static const IconData projects = Icons.work_outline;

  /// Skills icon
  static const IconData skills = Icons.code_outlined;

  /// Certificates icon
  static const IconData certificates = Icons.school_outlined;

  /// Experience icon
  static const IconData experience = Icons.business_center_outlined;

  /// Education icon
  static const IconData education = Icons.cast_for_education_outlined;

  /// Services icon
  static const IconData services = Icons.design_services_outlined;

  /// Contact icon
  static const IconData contact = Icons.email_outlined;

  /// Blog icon
  static const IconData blog = Icons.article_outlined;

  // ==================== Action Icons ====================

  /// Download icon
  static const IconData download = Icons.download_outlined;

  /// Share icon
  static const IconData share = Icons.share_outlined;

  /// Open external link
  static const IconData openExternal = Icons.open_in_new;

  /// View icon
  static const IconData view = Icons.visibility_outlined;

  /// Edit icon
  static const IconData edit = Icons.edit_outlined;

  /// Delete icon
  static const IconData delete = Icons.delete_outline;

  /// Save icon
  static const IconData save = Icons.save_outlined;

  /// Close icon
  static const IconData close = Icons.close;

  /// Back icon
  static const IconData back = Icons.arrow_back;

  /// Forward icon
  static const IconData forward = Icons.arrow_forward;

  /// Arrow right icon
  static const IconData arrowRight = Icons.arrow_forward_ios;

  /// Arrow down icon
  static const IconData arrowDown = Icons.keyboard_arrow_down;

  /// Arrow up icon
  static const IconData arrowUp = Icons.keyboard_arrow_up;

  /// Search icon
  static const IconData search = Icons.search;

  /// Filter icon
  static const IconData filter = Icons.filter_list;

  /// Sort icon
  static const IconData sort = Icons.sort;

  /// Refresh icon
  static const IconData refresh = Icons.refresh;

  // ==================== Theme Icons ====================

  /// Light mode icon
  static const IconData lightMode = Icons.light_mode_outlined;

  /// Dark mode icon
  static const IconData darkMode = Icons.dark_mode_outlined;

  /// Auto theme icon
  static const IconData autoTheme = Icons.brightness_auto_outlined;

  // ==================== Social Icons ====================

  /// Email icon
  static const IconData email = Icons.email_outlined;

  /// Phone icon
  static const IconData phone = Icons.phone_outlined;

  /// Location icon
  static const IconData location = Icons.location_on_outlined;

  /// Website icon
  static const IconData website = Icons.language;

  // ==================== Project Icons ====================

  /// Featured icon (star)
  static const IconData featured = Icons.star;

  /// Star outline
  static const IconData starOutline = Icons.star_outline;

  /// Demo/Live icon
  static const IconData demo = Icons.launch;

  /// Technology icon
  static const IconData technology = Icons.memory;

  /// Date icon
  static const IconData date = Icons.calendar_today;

  /// Image icon
  static const IconData image = Icons.image_outlined;

  /// Gallery icon
  static const IconData gallery = Icons.photo_library_outlined;

  // ==================== Form Icons ====================

  /// User icon
  static const IconData user = Icons.person_outline;

  /// Message icon
  static const IconData message = Icons.message_outlined;

  /// Subject icon
  static const IconData subject = Icons.subject;

  /// Send icon
  static const IconData send = Icons.send;

  /// Attach file icon
  static const IconData attach = Icons.attach_file;

  // ==================== Status Icons ====================

  /// Success icon
  static const IconData success = Icons.check_circle_outline;

  /// Error icon
  static const IconData error = Icons.error_outline;

  /// Warning icon
  static const IconData warning = Icons.warning_amber_outlined;

  /// Info icon
  static const IconData info = Icons.info_outline;

  /// Loading icon
  static const IconData loading = Icons.hourglass_empty;

  // ==================== UI Icons ====================

  /// Menu icon (hamburger)
  static const IconData menu = Icons.menu;

  /// More vertical
  static const IconData moreVertical = Icons.more_vert;

  /// More horizontal
  static const IconData moreHorizontal = Icons.more_horiz;

  /// Settings icon
  static const IconData settings = Icons.settings_outlined;

  /// Help icon
  static const IconData help = Icons.help_outline;

  /// Notification icon
  static const IconData notification = Icons.notifications_outlined;

  /// Dashboard icon
  static const IconData dashboard = Icons.dashboard_outlined;

  /// Folder icon
  static const IconData folder = Icons.folder_outlined;

  /// File icon
  static const IconData file = Icons.insert_drive_file_outlined;

  /// Document icon
  static const IconData document = Icons.article_outlined;

  // ==================== Animation Icons ====================

  /// Play icon
  static const IconData play = Icons.play_arrow;

  /// Pause icon
  static const IconData pause = Icons.pause;

  /// Stop icon
  static const IconData stop = Icons.stop;

  /// Fast forward icon
  static const IconData fastForward = Icons.fast_forward;

  /// Rewind icon
  static const IconData rewind = Icons.fast_rewind;

  // ==================== Certificate Icons ====================

  /// Certificate icon
  static const IconData certificate = Icons.workspace_premium_outlined;

  /// Award icon
  static const IconData award = Icons.emoji_events_outlined;

  /// Badge icon
  static const IconData badge = Icons.verified_outlined;

  /// PDF icon
  static const IconData pdf = Icons.picture_as_pdf_outlined;

  /// Credential icon
  static const IconData credential = Icons.card_membership_outlined;

  // ==================== Helper Methods ====================

  /// Get skill icon SVG path by skill ID
  static String? getSkillIconSvg(String skillId) {
    switch (skillId.toLowerCase()) {
      case 'dart':
        return dartIconSvg;
      case 'python':
        return pythonIconSvg;
      case 'java':
        return javaIconSvg;
      case 'javascript':
      case 'js':
        return javascriptIconPng;
      case 'flutter':
        return flutterIconSvg;
      case 'getx':
        return getxIconPng;
      case 'bloc':
        return blocIconPng;
      case 'provider':
      case 'riverpod':
        return flutterIconSvg; // Use Flutter icon for state management packages
      case 'firebase':
      case 'fcm':
        return firebaseIconPng;
      case 'supabase':
        return supabaseIconSvg;
      case 'postgresql':
      case 'pgsql':
      case 'postgres':
      case 'sql':
        return pgsqlIconSvg;
      case 'rest-api':
      case 'restful-api':
      case 'restful api':
      case 'api':
      case 'rest':
        return restApiIconSvg;
      case 'vercel':
        return vercelIconSvg;
      case 'github':
      case 'github-pages':
        return githubSkillIconSvg;
      case 'figma':
      case 'native-ui-ux':
        return figmaIconPng;
      default:
        return null; // Return null if no SVG icon available
    }
  }

  /// Get social icon SVG path by platform name
  static String? getSocialIconSvg(String platform) {
    switch (platform.toLowerCase()) {
      case 'github':
        return githubIconSvg;
      case 'linkedin':
        return linkedinIconSvg;
      case 'youtube':
        return youtubeIconSvg;
      case 'upwork':
        return upworkIconSvg;
      case 'mostaql':
        return mostaqlIconPng; // PNG format but treated as asset
      default:
        return null; // Return null if no SVG icon available
    }
  }

  /// Get navigation icon by route name
  static IconData getNavigationIcon(String route) {
    switch (route.toLowerCase()) {
      case 'home':
      case '/':
        return home;
      case 'about':
        return about;
      case 'projects':
        return projects;
      case 'skills':
        return skills;
      case 'certificates':
        return certificates;
      case 'experience':
        return experience;
      case 'education':
        return education;
      case 'services':
        return services;
      case 'contact':
        return contact;
      case 'blog':
        return blog;
      default:
        return home;
    }
  }
}
