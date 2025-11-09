import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/responsive_helper.dart';
import '../../theme/app_theme.dart';
import '../../widgets/certificates_section/certificates_section_header.dart';
import '../../widgets/certificates_section/certificates_grid.dart';
import '../../widgets/custom_show_more_button.dart';

/// Certificates section displaying all professional certifications and achievements
/// with modern card-based design and smooth animations
class CertificatesSection extends StatefulWidget {
  const CertificatesSection({super.key});

  @override
  State<CertificatesSection> createState() => _CertificatesSectionState();
}

class _CertificatesSectionState extends State<CertificatesSection> {
  int _displayCount = 3; // Initially show 3 certificates

  void _showMore() {
    setState(() {
      _displayCount =
          (_displayCount + 3).clamp(0, PortfolioData.certificates.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    final certificatesToShow =
        PortfolioData.certificates.take(_displayCount).toList();
    final hasMore = _displayCount < PortfolioData.certificates.length;

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      padding: EdgeInsets.symmetric(
        vertical: ResponsiveHelper.getSectionSpacing(screenWidth) * 0.8,
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section Header
            const CertificatesSectionHeader(),

            SizedBox(
                height: isMobile ? AppTheme.spacingXL : AppTheme.spacingXXL),

            // Certificates Grid with Staggered Animation
            CertificatesGrid(
              certificates: certificatesToShow,
              screenWidth: screenWidth,
            ),

            // Show More Button
            if (hasMore) ...[
              const SizedBox(height: AppTheme.spacingXL),
              CustomShowMoreButton(onPressed: _showMore),
            ],
          ],
        ),
      ),
    );
  }
}
