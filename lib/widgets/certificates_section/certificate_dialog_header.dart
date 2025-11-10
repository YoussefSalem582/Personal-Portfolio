import 'package:flutter/material.dart';
import '../../models/certificate.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Certificate Dialog Header
/// Modern gradient header with icon, title, and close button
class CertificateDialogHeader extends StatelessWidget {
  final Certificate certificate;
  final Color accentColor;
  final bool isDark;

  const CertificateDialogHeader({
    super.key,
    required this.certificate,
    required this.accentColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.accentDark,
                  AppColors.accentDark.withValues(alpha: 0.8),
                ],
              )
            : AppColors.primaryGradientLight,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXL + 4),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Container
          _buildIconContainer(),
          const SizedBox(width: AppTheme.spacingM),

          // Title Section
          Expanded(
            child: _buildTitleSection(),
          ),

          // Close Button
          _buildCloseButton(context),
        ],
      ),
    );
  }

  Widget _buildIconContainer() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: const Icon(
        AppIcons.certificate,
        color: AppColors.white,
        size: 32,
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Certificate Details',
          style: AppFonts.labelMedium().copyWith(
            color: AppColors.white.withValues(alpha: 0.9),
            letterSpacing: 1,
            fontWeight: AppFonts.semiBold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          certificate.title,
          style: AppFonts.h3().copyWith(
            color: AppColors.white,
            fontWeight: AppFonts.extraBold,
            height: 1.2,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(AppIcons.close, color: AppColors.white, size: 24),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.white.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
