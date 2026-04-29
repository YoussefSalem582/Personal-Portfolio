/// Assets - Centralized asset management
///
/// This barrel file exports all asset-related utilities for easy import.
///
/// Usage:
/// ```dart
/// import '../utils/assets/assets.dart';
///
/// // Use images
/// Image.asset(AppImages.profileImage)
/// Image.asset(AppImages.projects.emosense.appIcon)
///
/// // Use documents
/// UrlHelper.openFile(AppDocuments.resume)
/// UrlHelper.openFile(AppDocuments.projects.emosenseApp)
///
/// // Use icons (from app_icons.dart)
/// Icon(AppIcons.home)
///
/// // Use fonts (from app_fonts.dart)
/// Text('Hello', style: AppFonts.h1())
/// ```
library;

export 'app_images.dart';
export 'app_documents.dart';
export 'app_icons.dart';
export 'app_fonts.dart';

/// Asset utility class for common asset operations
class Assets {
  // Prevent instantiation
  Assets._();

  /// Check if a path is a valid asset
  static bool isValidAsset(String path) {
    return path.startsWith('assets/');
  }

  /// Get asset type from path
  static AssetType getAssetType(String path) {
    if (path.startsWith('assets/images/')) return AssetType.image;
    if (path.startsWith('assets/documents/')) return AssetType.document;
    if (path.startsWith('assets/icons/')) return AssetType.icon;
    if (path.startsWith('assets/fonts/')) return AssetType.font;
    return AssetType.unknown;
  }

  /// Get file extension from path
  static String getExtension(String path) {
    return path.split('.').last.toLowerCase();
  }

  /// Get file name from path (with extension)
  static String getFileName(String path) {
    return path.split('/').last;
  }

  /// Get file name without extension
  static String getFileNameWithoutExtension(String path) {
    final name = getFileName(path);
    return name.substring(0, name.lastIndexOf('.'));
  }

  /// Check if asset is an image
  static bool isImage(String path) {
    final ext = getExtension(path);
    return ['png', 'jpg', 'jpeg', 'gif', 'webp', 'svg'].contains(ext);
  }

  /// Check if asset is a document
  static bool isDocument(String path) {
    final ext = getExtension(path);
    return ['pdf', 'doc', 'docx', 'txt'].contains(ext);
  }

  /// Check if asset is an icon
  static bool isIcon(String path) {
    return path.startsWith('assets/icons/');
  }

  /// Check if asset is a font
  static bool isFont(String path) {
    final ext = getExtension(path);
    return ['ttf', 'otf', 'woff', 'woff2'].contains(ext);
  }
}

/// Asset type enumeration
enum AssetType {
  image,
  document,
  icon,
  font,
  unknown,
}

/// Asset category for organization
enum AssetCategory {
  profile,
  project,
  certificate,
  icon,
  document,
  other,
}

/// Helper extension for AssetType
extension AssetTypeExtension on AssetType {
  /// Get display name for asset type
  String get displayName {
    switch (this) {
      case AssetType.image:
        return 'Image';
      case AssetType.document:
        return 'Document';
      case AssetType.icon:
        return 'Icon';
      case AssetType.font:
        return 'Font';
      case AssetType.unknown:
        return 'Unknown';
    }
  }

  /// Get icon representation
  String get icon {
    switch (this) {
      case AssetType.image:
        return '🖼️';
      case AssetType.document:
        return '📄';
      case AssetType.icon:
        return '✨';
      case AssetType.font:
        return '🔤';
      case AssetType.unknown:
        return '❓';
    }
  }
}
