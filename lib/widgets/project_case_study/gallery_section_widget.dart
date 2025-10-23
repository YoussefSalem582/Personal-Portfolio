import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';
import '../lazy_image.dart';

import '../../theme/app_theme.dart';

/// Gallery section widget for project case study with categorized images
///
/// Displays a responsive grid of project screenshots organized by categories.
/// Features:
/// - Category-based organization with section headers
/// - Responsive grid layout (2 columns mobile, 3 columns desktop)
/// - Lightbox/modal view for full-screen image viewing
/// - Theme-aware styling with gradients and shadows
/// - Lazy loading for optimal performance
/// - Modern card design with borders and elevation
class GallerySectionWidget extends StatelessWidget {
  /// List of image URLs to display in the gallery
  final List<String> galleryImages;

  /// Whether the current device is mobile (affects grid columns)
  final bool isMobile;

  /// Project ID to determine which categories to show
  final String? projectId;

  const GallerySectionWidget({
    super.key,
    required this.galleryImages,
    required this.isMobile,
    this.projectId,
  });

  /// Returns categorized images for Emosense project
  Map<String, List<String>> _getCategorizedImages() {
    if (projectId == 'emosense-app') {
      return {
        'Onboarding & Authentication': galleryImages
            .where((img) =>
                img.contains('splash_screen') ||
                img.contains('onboarding') ||
                img.contains('signin') ||
                img.contains('login'))
            .toList(),
        'Employee Home & Tools': galleryImages
            .where((img) =>
                img.contains('employee_home_screen') ||
                img.contains('tools_screen'))
            .toList(),
        'Video Analysis': galleryImages
            .where((img) => img.contains('video_analysis'))
            .toList(),
        'Voice Analysis': galleryImages
            .where((img) => img.contains('voice_analysis'))
            .toList(),
        'Text Analysis': galleryImages
            .where((img) => img.contains('text_analysis'))
            .toList(),
        'Support Tickets': galleryImages
            .where((img) => img.contains('tickets_screen'))
            .toList(),
        'Employee Profile': galleryImages
            .where((img) => img.contains('profile') && img.contains('employee'))
            .toList(),
        'Admin Panel':
            galleryImages.where((img) => img.contains('admin/')).toList(),
      };
    }

    if (projectId == 'gogesh-marketplace') {
      return {
        'Onboarding & Authentication': galleryImages
            .where((img) =>
                img.contains('splash') ||
                img.contains('onboard') ||
                img.contains('login') ||
                img.contains('signup') ||
                img.contains('phone_login') ||
                img.contains('create_account'))
            .toList(),
        'User Home & Shopping': galleryImages
            .where((img) =>
                img.contains('user_home') ||
                img.contains('app_main_search') ||
                img.contains('product_screen') ||
                img.contains('filter'))
            .toList(),
        'Categories & Products': galleryImages
            .where((img) =>
                img.contains('category') ||
                img.contains('product') && !img.contains('merchant'))
            .toList(),
        'Favorites & Offers': galleryImages
            .where((img) =>
                img.contains('favorite') ||
                img.contains('offers') ||
                img.contains('ads'))
            .toList(),
        'Chat & Notifications': galleryImages
            .where(
                (img) => img.contains('chat') || img.contains('notification'))
            .toList(),
        'Merchant Dashboard': galleryImages
            .where((img) =>
                img.contains('merchant') ||
                img.contains('cta_button') ||
                img.contains('report'))
            .toList(),
      };
    }

    // For other projects, return all images in one category
    return {'Gallery': galleryImages};
  }

  @override
  Widget build(BuildContext context) {
    // Detect current theme mode for styling
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final categorizedImages = _getCategorizedImages();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Section Title
        _buildMainHeader(isDark),

        const SizedBox(height: AppTheme.spacingXL),

        // Categorized Gallery Sections
        ...categorizedImages.entries.map((entry) {
          if (entry.value.isEmpty) return const SizedBox.shrink();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Header
              if (categorizedImages.length > 1)
                _buildCategoryHeader(entry.key, isDark),

              if (categorizedImages.length > 1)
                const SizedBox(height: AppTheme.spacingM),

              // Category Image Grid
              _buildImageGrid(context, entry.value, isDark),

              const SizedBox(height: AppTheme.spacingXL),
            ],
          );
        }),
      ],
    );
  }

  /// Builds the main section header
  Widget _buildMainHeader(bool isDark) {
    return Row(
      children: [
        // Gradient icon container with photo library icon
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: isDark
                ? AppColors.primaryGradientDark
                : AppColors.primaryGradientLight,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                    .withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            AppIcons.gallery,
            color: AppColors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: AppTheme.spacingM),

        // Section title with gradient underline
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Screenshots & Gallery',
                style: AppFonts.h4(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ).copyWith(
                  fontWeight: AppFonts.extraBold,
                ),
              ),
              Container(
                height: 3,
                width: 60,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  gradient: isDark
                      ? AppColors.primaryGradientDark
                      : AppColors.primaryGradientLight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a category header with icon and title
  Widget _buildCategoryHeader(String title, bool isDark) {
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingM,
        vertical: AppTheme.spacingS,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            accentColor.withValues(alpha: 0.15),
            accentColor.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getCategoryIcon(title),
              color: accentColor,
              size: 20,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Text(
            title,
            style: AppFonts.h6(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ).copyWith(
              fontWeight: AppFonts.bold,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${_getCategoryImageCount(title)} ${_getCategoryImageCount(title) == 1 ? 'image' : 'images'}',
              style: AppFonts.labelSmall(
                color: accentColor,
              ).copyWith(
                fontWeight: AppFonts.semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Returns appropriate icon for category
  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'onboarding & authentication':
        return AppIcons.user;
      case 'employee home & tools':
        return AppIcons.home;
      case 'user home & shopping':
        return AppIcons.projects;
      case 'categories & products':
        return AppIcons.folder;
      case 'favorites & offers':
        return AppIcons.starOutline;
      case 'chat & notifications':
        return AppIcons.message;
      case 'merchant dashboard':
        return AppIcons.dashboard;
      case 'video analysis':
        return AppIcons.play;
      case 'voice analysis':
        return AppIcons.notification;
      case 'text analysis':
        return AppIcons.file;
      case 'support tickets':
        return AppIcons.help;
      case 'employee profile':
        return AppIcons.user;
      case 'admin panel':
        return AppIcons.settings;
      default:
        return AppIcons.gallery;
    }
  }

  /// Returns image count for category
  int _getCategoryImageCount(String category) {
    final categorizedImages = _getCategorizedImages();
    return categorizedImages[category]?.length ?? 0;
  }

  /// Builds the image grid for a category
  Widget _buildImageGrid(
      BuildContext context, List<String> images, bool isDark) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 2 : 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _showImageDialog(context, images, index),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              border: Border.all(
                color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                    .withValues(alpha: 0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: (isDark ? AppColors.black : AppColors.gray300)
                      .withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusL),
              child: LazyImage(
                imageUrl: images[index],
                fit: BoxFit.contain,
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Shows a full-screen lightbox dialog for viewing images
  void _showImageDialog(
      BuildContext context, List<String> images, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.black.withValues(alpha: 0.87),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Stack(
            children: [
              LazyImage(
                imageUrl: images[initialIndex],
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(AppIcons.close, color: AppColors.white),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.black.withValues(alpha: 0.54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
