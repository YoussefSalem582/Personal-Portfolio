/// App Constants - Centralized access to colors, icons, fonts, images, and documents
///
/// This barrel file exports all styling and asset utilities for easy import.
///
/// Usage:
/// ```dart
/// import '../utils/assets/app_constants.dart';
///
/// // Use colors
/// color: AppColors.primaryLight
///
/// // Use icons
/// icon: AppIcons.home
///
/// // Use fonts
/// style: AppFonts.h1()
///
/// // Use images
/// Image.asset(AppImages.profileImage)
/// Image.asset(AppImages.projects.emosense.appIcon)
///
/// // Use documents
/// UrlHelper.openFile(AppDocuments.resume)
/// UrlHelper.openFile(AppDocuments.projects.emosenseApp)
/// ```
library;

export 'app_colors.dart';
export 'app_icons.dart';
export 'app_fonts.dart';
export 'app_images.dart';
export 'app_documents.dart';
export 'assets.dart';
