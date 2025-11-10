import 'package:flutter/material.dart';
import '../../models/project.dart';
import '../../utils/assets/app_constants.dart';
import '../lazy_image.dart';

import '../../theme/app_theme.dart';

/// Hero section widget for project case study
///
/// Displays a full-width hero image with gradient overlays and project information.
/// Features:
/// - Responsive height (60% of screen, clamped between 400-600px)
/// - Gradient overlays for text readability
/// - Page indicator for image galleries
/// - Bold typography with shadows for emphasis
/// - Theme-aware styling
class HeroSectionWidget extends StatelessWidget {
  /// Project data to display
  final Project project;

  /// Current page index in the PageView (for page indicator)
  final int currentPage;

  /// Screen height for calculating hero section height
  final double screenHeight;

  const HeroSectionWidget({
    super.key,
    required this.project,
    required this.currentPage,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate total pages (main image + gallery images)
    final totalPages = (project.galleryImages?.length ?? 0) + 1;

    // Calculate hero height: 60% of screen, clamped between 400-600px
    final heroHeight = screenHeight * 0.6;
    final clampedHeight = heroHeight.clamp(400.0, 600.0);

    return Container(
      width: double.infinity,
      height: clampedHeight,
      // Base gradient background (visible if no image)
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryLight.withOpacity(0.3),
            AppColors.accentLight.withOpacity(0.3),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background Image - Full width project image
          if (project.imageUrl != null)
            Positioned.fill(
              child: LazyImage(
                imageUrl: project.imageUrl!,
                width: double.infinity,
                height: clampedHeight,
                fit: BoxFit.contain, // Maintain aspect ratio
              ),
            ),

          // Gradient Overlay - Ensures text readability
          // Gradient Overlay - Ensures text readability
          // Top: subtle overlay, Bottom: darker for text contrast
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.black.withOpacity(0.2), // Subtle top overlay
                    AppColors.black.withOpacity(0.8), // Darker bottom for text
                  ],
                  stops: const [0.5, 1.0], // Gradient transition point
                ),
              ),
            ),
          ),

          // Page indicator badge - Shows current position in gallery (e.g., "1 / 9")
          if (totalPages > 1)
            Positioned(
              top: 24,
              right: 24,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  // Glassmorphic pill-shaped badge
                  decoration: BoxDecoration(
                    color: AppColors.black
                        .withOpacity(0.7), // Semi-transparent background
                    borderRadius: BorderRadius.circular(24), // Pill shape
                    border: Border.all(
                      color: AppColors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    '${currentPage + 1} / $totalPages',
                    style: AppFonts.labelMedium(
                      color: AppColors.white,
                    ).copyWith(
                      fontWeight: AppFonts.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),

          // Title and Description - Positioned at bottom with gradient background
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(AppTheme.spacingXL),
                // Additional gradient for text area
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.transparent,
                      AppColors.black
                          .withOpacity(0.9), // Dark background for readability
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Project Title - Large, bold, with text shadow
                    Text(
                      project.title,
                      style: AppFonts.h2(
                        color: AppColors.white,
                      ).copyWith(
                        fontWeight: AppFonts.black, // Extra bold
                        height: 1.1, // Tight line height
                        letterSpacing:
                            -0.5, // Slight negative spacing for modern look
                        // Text shadow for depth and readability
                        shadows: const [
                          Shadow(
                            color: AppColors.gray700,
                            blurRadius: 16,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingM),

                    // Short Description - Medium weight with shadow
                    Text(
                      project.shortDescription,
                      style: AppFonts.bodyMedium(
                        color: AppColors.white,
                      ).copyWith(
                        height: 1.5, // Comfortable line height for readability
                        // Text shadow for depth
                        shadows: [
                          Shadow(
                            color: AppColors.black.withOpacity(0.6),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      maxLines: 3, // Limit to 3 lines
                      overflow:
                          TextOverflow.ellipsis, // Show ellipsis if too long
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
