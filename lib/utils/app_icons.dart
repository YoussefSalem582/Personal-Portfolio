import 'package:flutter/material.dart';

/// App Icons - Centralized icon definitions
/// Used throughout the app for consistent iconography
class AppIcons {
  // Prevent instantiation
  AppIcons._();

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

  /// GitHub icon (using code icon as fallback)
  static const IconData github = Icons.code;

  /// LinkedIn icon (using work icon as fallback)
  static const IconData linkedin = Icons.work;

  /// Email icon
  static const IconData email = Icons.email_outlined;

  /// Phone icon
  static const IconData phone = Icons.phone_outlined;

  /// Location icon
  static const IconData location = Icons.location_on_outlined;

  /// Website icon
  static const IconData website = Icons.language;

  /// YouTube icon
  static const IconData youtube = Icons.play_circle_outline;

  /// Twitter icon
  static const IconData twitter = Icons.public;

  // ==================== Project Icons ====================

  /// Featured icon (star)
  static const IconData featured = Icons.star;

  /// Star outline
  static const IconData starOutline = Icons.star_outline;

  /// GitHub repository
  static const IconData githubRepo = Icons.code;

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

  // ==================== Skill Icons ====================

  /// Dart icon
  static const IconData dart = Icons.flutter_dash;

  /// Python icon
  static const IconData python = Icons.pets;

  /// Java icon
  static const IconData java = Icons.coffee;

  /// C++ icon
  static const IconData cpp = Icons.code;

  /// JavaScript icon
  static const IconData javascript = Icons.javascript;

  /// SQL/Database icon
  static const IconData sql = Icons.storage;

  /// Flutter icon
  static const IconData flutter = Icons.flutter_dash;

  /// Mobile icon
  static const IconData mobile = Icons.phone_android;

  /// Web icon
  static const IconData web = Icons.language;

  /// Design icon
  static const IconData design = Icons.design_services;

  /// API icon
  static const IconData api = Icons.api;

  /// Firebase icon
  static const IconData firebase = Icons.local_fire_department;

  /// Cloud icon
  static const IconData cloud = Icons.cloud;

  /// Server icon
  static const IconData server = Icons.dns;

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

  /// Get skill icon by skill ID
  static IconData getSkillIcon(String skillId) {
    switch (skillId.toLowerCase()) {
      case 'dart':
        return dart;
      case 'python':
        return python;
      case 'java':
        return java;
      case 'cpp':
      case 'c++':
        return cpp;
      case 'javascript':
      case 'js':
        return javascript;
      case 'sql':
        return sql;
      case 'flutter':
        return flutter;
      case 'native-ui-ux':
      case 'ui-ux':
        return design;
      case 'responsive-web':
      case 'web':
        return web;
      case 'getx':
      case 'bloc':
      case 'provider':
      case 'riverpod':
        return flutter;
      case 'rest-api':
      case 'api':
        return api;
      case 'firebase':
        return firebase;
      case 'supabase':
        return cloud;
      case 'custom-backend':
      case 'backend':
        return server;
      case 'github-pages':
      case 'github':
        return github;
      case 'vercel':
        return cloud;
      case 'emailjs':
      case 'email':
        return email;
      case 'fcm':
        return notification;
      default:
        return technology;
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

  /// Get social icon by platform name
  static IconData getSocialIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'github':
        return github;
      case 'linkedin':
        return linkedin;
      case 'email':
        return email;
      case 'phone':
        return phone;
      case 'website':
      case 'portfolio':
        return website;
      case 'youtube':
        return youtube;
      case 'twitter':
        return twitter;
      default:
        return website;
    }
  }
}
