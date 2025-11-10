import 'package:flutter/material.dart';
import '../../models/certificate.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';
import 'certificate_card_badges.dart';

/// Certificate Card Image Section
/// Displays certificate image with gradient overlay and badges
class CertificateCardImage extends StatelessWidget {
  final Certificate certificate;
  final Color accentColor;
  final bool isDark;

  const CertificateCardImage({
    super.key,
    required this.certificate,
    required this.accentColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image Container
        _buildImageContainer(),

        // Gradient Overlay
        _buildGradientOverlay(),

        // PDF Badge
        if (certificate.pdfUrl != null) const PdfBadge(),

        // Verified Badge
        if (certificate.credentialUrl != null) const VerifiedBadge(),
      ],
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXL),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withValues(alpha: 0.15),
            accentColor.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXL),
        ),
        child: certificate.imageUrl != null
            ? Image.asset(
                certificate.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderIcon();
                },
              )
            : _buildPlaceholderIcon(),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXL),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.transparent,
            AppColors.black.withValues(alpha: 0.3),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withValues(alpha: 0.15),
            accentColor.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  accentColor.withValues(alpha: 0.2),
                  accentColor.withValues(alpha: 0.1),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              AppIcons.certificate,
              size: 48,
              color: accentColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            'Certificate',
            style: AppFonts.bodyMedium().copyWith(
              color: accentColor,
              fontWeight: AppFonts.bold,
            ),
          ),
        ],
      ),
    );
  }
}
