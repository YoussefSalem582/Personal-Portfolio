import 'package:flutter/material.dart';
import '../../../../../core/utils/assets/app_constants.dart';

/// Modern glassmorphic back button widget
///
/// A floating back button positioned in the top-left corner of the screen.
/// Features:
/// - Glassmorphic design with semi-transparent background
/// - Rounded corners and subtle borders
/// - Shadow for depth and elevation
/// - Ripple animation on tap
/// - Safe area aware positioning
class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 24, // Position from top edge
      left: 24, // Position from left edge
      child: SafeArea(
        // Respect device safe areas (notch, status bar, etc.)
        child: Material(
          color: AppColors.transparent, // Transparent background for Material
          child: InkWell(
            onTap: () => Navigator.of(context).pop(), // Navigate back on tap
            borderRadius: BorderRadius.circular(16), // Rounded ripple effect
            child: Container(
              padding: const EdgeInsets.all(14), // Internal padding for icon
              // Glassmorphic styling
              decoration: BoxDecoration(
                color: AppColors.black
                    .withOpacity(0.7), // Semi-transparent dark background
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.white
                      .withOpacity(0.3), // Subtle white border
                  width: 1.5,
                ),
                // Elevation shadow for depth
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4), // Shadow offset downwards
                  ),
                ],
              ),
              child: const Icon(
                AppIcons.back, // Modern iOS-style back arrow
                color: AppColors.white,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
