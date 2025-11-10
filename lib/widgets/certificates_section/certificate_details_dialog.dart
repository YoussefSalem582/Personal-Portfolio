import 'package:flutter/material.dart';
import '../../models/certificate.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../theme/app_theme.dart';
import 'certificate_dialog_header.dart';
import 'certificate_dialog_image.dart';
import 'certificate_dialog_info_section.dart';
import 'certificate_dialog_actions.dart';

/// Modern certificate details dialog with glassmorphic design and improved UI
class CertificateDetailsDialog extends StatefulWidget {
  final Certificate certificate;

  const CertificateDetailsDialog({super.key, required this.certificate});

  @override
  State<CertificateDetailsDialog> createState() =>
      _CertificateDetailsDialogState();
}

class _CertificateDetailsDialogState extends State<CertificateDetailsDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          backgroundColor: AppColors.transparent,
          insetPadding:
              EdgeInsets.all(isMobile ? AppTheme.spacingM : AppTheme.spacingXL),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 700,
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            decoration: BoxDecoration(
              color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(AppTheme.radiusXL + 4),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.2),
                  blurRadius: 40,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Modern Header with Gradient
                CertificateDialogHeader(
                  certificate: widget.certificate,
                  accentColor: accentColor,
                  isDark: isDark,
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(
                        isMobile ? AppTheme.spacingM : AppTheme.spacingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Certificate Image
                        CertificateDialogImage(
                          certificate: widget.certificate,
                          accentColor: accentColor,
                          isDark: isDark,
                        ),

                        const SizedBox(height: AppTheme.spacingL),

                        // Info Cards
                        CertificateDialogInfoSection(
                          certificate: widget.certificate,
                          accentColor: accentColor,
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                CertificateDialogActions(
                  certificate: widget.certificate,
                  accentColor: accentColor,
                  isDark: isDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
