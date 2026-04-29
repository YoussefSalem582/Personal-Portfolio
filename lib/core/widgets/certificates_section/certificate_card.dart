import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import 'package:youssef_hassan_portfolio/features/certificates/domain/entities/certificate.dart';
import '../../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';
import 'certificate_details_dialog.dart';
import 'certificate_card_image.dart';
import 'certificate_card_info.dart';

/// Modern certificate card with hover effects and smooth animations
class CertificateCard extends StatefulWidget {
  final Certificate certificate;

  const CertificateCard({super.key, required this.certificate});

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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
    final l10n = AppLocalizations.of(context);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusXL),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? accentColor.withOpacity(0.2)
                    : (isDark ? Colors.black38 : Colors.black12),
                blurRadius: _isHovered ? 24 : 12,
                offset: Offset(0, _isHovered ? 12 : 6),
              ),
            ],
          ),
          child: Card(
            elevation: 0,
            shadowColor: AppColors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusXL),
              side: BorderSide(
                color: _isHovered
                    ? accentColor.withOpacity(0.3)
                    : AppColors.transparent,
                width: 2,
              ),
            ),
            child: Semantics(
              button: true,
              label: l10n.tooltipCertificateOpenDetails,
              child: InkWell(
              onTap: () => _showCertificateDetails(context),
              borderRadius: BorderRadius.circular(AppTheme.radiusXL),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                  gradient: isDark
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.cardDark,
                            AppColors.cardDark.withOpacity(0.8),
                          ],
                        )
                      : null,
                  color: isDark ? null : AppColors.surfaceLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Certificate Image with Gradient Overlay
                    Expanded(
                      flex: 5,
                      child: CertificateCardImage(
                        certificate: widget.certificate,
                        accentColor: accentColor,
                        isDark: isDark,
                      ),
                    ),

                    // Certificate Info
                    Expanded(
                      flex: 4,
                      child: CertificateCardInfo(
                        certificate: widget.certificate,
                        accentColor: accentColor,
                        isDark: isDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
        ),
      ),
    );
  }

  /// Shows certificate details dialog
  void _showCertificateDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.black.withOpacity(0.6),
      builder: (context) => CertificateDetailsDialog(
        certificate: widget.certificate,
      ),
    );
  }
}
