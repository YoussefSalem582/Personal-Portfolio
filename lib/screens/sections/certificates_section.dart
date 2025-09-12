import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/certificate.dart';
import '../../utils/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../utils/responsive_helper.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: AppTheme.spacingXXL,
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: ResponsiveHelper.isMobile(screenWidth)
            ? _buildMobileLayout(context)
            : ResponsiveHelper.isTablet(screenWidth)
            ? _buildTabletLayout(context)
            : _buildDesktopLayout(context),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(),
        const SizedBox(height: AppTheme.spacingXL),
        _buildCertificatesGrid(context, crossAxisCount: 1),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(),
        const SizedBox(height: AppTheme.spacingXL),
        _buildCertificatesGrid(context, crossAxisCount: 2),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(),
        const SizedBox(height: AppTheme.spacingXL),
        _buildCertificatesGrid(context, crossAxisCount: 3),
      ],
    );
  }

  Widget _buildSectionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Certificates & Achievements', style: AppTheme.headingLarge),
        const SizedBox(height: AppTheme.spacingS),
        Text(
          'Professional certifications and achievements that showcase my continuous learning journey',
          style: AppTheme.bodyLarge.copyWith(color: AppTheme.textSecondary),
        ),
      ],
    );
  }

  Widget _buildCertificatesGrid(
    BuildContext context, {
    required int crossAxisCount,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: AppTheme.spacingL,
        mainAxisSpacing: AppTheme.spacingL,
        childAspectRatio: crossAxisCount == 1 ? 1.5 : 1.1,
      ),
      itemCount: PortfolioData.certificates.length,
      itemBuilder: (context, index) {
        return CertificateCard(certificate: PortfolioData.certificates[index]);
      },
    );
  }
}

class CertificateCard extends StatelessWidget {
  final Certificate certificate;

  const CertificateCard({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black12,
      child: InkWell(
        onTap: () => _showCertificateDetails(context),
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            gradient: AppTheme.cardGradient,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Certificate image or icon
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppTheme.radiusL),
                    ),
                    color: AppTheme.accentColor.withOpacity(0.1),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppTheme.radiusL),
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
                ),
              ),

              // Certificate info
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingM),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        certificate.title,
                        style: AppTheme.headingSmall.copyWith(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: AppTheme.spacingXS),

                      // Issuer
                      Text(
                        certificate.issuer,
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.accentColor,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: AppTheme.spacingS),

                      // Description
                      Expanded(
                        child: Text(
                          certificate.description,
                          style: AppTheme.bodySmall,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      const SizedBox(height: AppTheme.spacingS),

                      // Date
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: AppTheme.textSecondary,
                          ),
                          const SizedBox(width: AppTheme.spacingXS),
                          Text(
                            _formatDate(certificate.issueDate),
                            style: AppTheme.bodySmall.copyWith(
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.accentColor.withOpacity(0.1),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusL),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 40, color: AppTheme.accentColor),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            'Certificate',
            style: AppTheme.bodyMedium.copyWith(
              color: AppTheme.accentColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  void _showCertificateDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CertificateDetailsDialog(certificate: certificate),
    );
  }
}

class CertificateDetailsDialog extends StatelessWidget {
  final Certificate certificate;

  const CertificateDetailsDialog({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingM),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      certificate.title,
                      style: AppTheme.headingMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Certificate image
                    if (certificate.imageUrl != null)
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                          color: AppTheme.accentColor.withOpacity(0.1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                          child: Image.asset(
                            certificate.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.accentColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.radiusM,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.school,
                                    size: 50,
                                    color: AppTheme.accentColor,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    const SizedBox(height: AppTheme.spacingL),

                    // Issuer
                    Text('Issued by', style: AppTheme.headingSmall),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(certificate.issuer, style: AppTheme.bodyMedium),

                    const SizedBox(height: AppTheme.spacingL),

                    // Issue Date
                    Text('Issue Date', style: AppTheme.headingSmall),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(
                      _formatFullDate(certificate.issueDate),
                      style: AppTheme.bodyMedium,
                    ),

                    const SizedBox(height: AppTheme.spacingL),

                    // Description
                    Text('Description', style: AppTheme.headingSmall),
                    const SizedBox(height: AppTheme.spacingS),
                    Text(certificate.description, style: AppTheme.bodyMedium),
                  ],
                ),
              ),
            ),

            const Divider(height: 1),

            // Action buttons
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingM),
              child: Row(
                children: [
                  if (certificate.pdfUrl != null)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            UrlHelper.launchURL(certificate.pdfUrl!),
                        icon: const Icon(Icons.picture_as_pdf),
                        label: const Text('View PDF'),
                      ),
                    ),

                  if (certificate.pdfUrl != null &&
                      certificate.credentialUrl != null)
                    const SizedBox(width: AppTheme.spacingM),

                  if (certificate.credentialUrl != null)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            UrlHelper.launchURL(certificate.credentialUrl!),
                        icon: const Icon(Icons.link),
                        label: const Text('Verify'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatFullDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
