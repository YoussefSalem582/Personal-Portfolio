import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/certificate.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../utils/responsive_helper.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isTablet = ResponsiveHelper.isTablet(screenWidth);

    // Determine grid columns
    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      width: double.infinity,
      color: isDark ? AppTheme.darkBackgroundColor : AppTheme.backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: AppTheme.spacingXXL,
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Section title
            Text(
              'Certificates & Achievements',
              style: (isDark
                      ? AppTheme.headingLargeForTheme(context)
                      : AppTheme.headingLarge)
                  .copyWith(fontSize: 36),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingS),

            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppTheme.darkPrimaryGradient
                    : AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            const SizedBox(height: AppTheme.spacingM),

            Text(
              'Professional certifications showcasing continuous learning',
              style: (isDark
                      ? AppTheme.bodyLargeForTheme(context)
                      : AppTheme.bodyLarge)
                  .copyWith(
                color: isDark
                    ? AppTheme.darkTextSecondary
                    : AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppTheme.spacingXXL),

            // Certificates Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: AppTheme.spacingL,
                mainAxisSpacing: AppTheme.spacingL,
                childAspectRatio: isMobile ? 1.2 : 0.85,
              ),
              itemCount: PortfolioData.certificates.length,
              itemBuilder: (context, index) {
                return CertificateCard(
                  certificate: PortfolioData.certificates[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CertificateCard extends StatefulWidget {
  final Certificate certificate;

  const CertificateCard({super.key, required this.certificate});

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -8.0 : 0.0, 0.0),
        child: Card(
          elevation: _isHovered ? 12 : 4,
          shadowColor: isDark ? Colors.black45 : Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
          ),
          child: InkWell(
            onTap: () => _showCertificateDetails(context),
            borderRadius: BorderRadius.circular(AppTheme.radiusL),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.radiusL),
                color: isDark ? AppTheme.darkCardColor : AppTheme.surfaceColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Certificate image with overlay
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(AppTheme.radiusL),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                accentColor.withValues(alpha: 0.2),
                                accentColor.withValues(alpha: 0.05),
                              ],
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(AppTheme.radiusL),
                            ),
                            child: widget.certificate.imageUrl != null
                                ? Image.asset(
                                    widget.certificate.imageUrl!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return _buildPlaceholderIcon(accentColor);
                                    },
                                  )
                                : _buildPlaceholderIcon(accentColor),
                          ),
                        ),

                        // Verified badge
                        if (widget.certificate.credentialUrl != null)
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.successColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppTheme.successColor
                                        .withValues(alpha: 0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Verified',
                                    style: AppTheme.bodySmall.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Certificate info
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.spacingM),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            widget.certificate.title,
                            style: (isDark
                                    ? AppTheme.headingSmallForTheme(context)
                                    : AppTheme.headingSmall)
                                .copyWith(fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: AppTheme.spacingXS),

                          // Issuer with icon
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: accentColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  Icons.business,
                                  size: 12,
                                  color: accentColor,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  widget.certificate.issuer,
                                  style: AppTheme.bodySmall.copyWith(
                                    color: accentColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          // Date and action button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Date
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppTheme.darkSurfaceColor
                                      : Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      size: 12,
                                      color: isDark
                                          ? AppTheme.darkTextSecondary
                                          : AppTheme.textSecondary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _formatDate(widget.certificate.issueDate),
                                      style: AppTheme.bodySmall.copyWith(
                                        color: isDark
                                            ? AppTheme.darkTextSecondary
                                            : AppTheme.textSecondary,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // View details button
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: accentColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: accentColor,
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
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon(Color accentColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withValues(alpha: 0.2),
            accentColor.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusL),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.workspace_premium, size: 40, color: accentColor),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            'Certificate',
            style: AppTheme.bodyMedium.copyWith(
              color: accentColor,
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
      barrierDismissible: true,
      builder: (context) =>
          CertificateDetailsDialog(certificate: widget.certificate),
    );
  }
}

class CertificateDetailsDialog extends StatelessWidget {
  final Certificate certificate;

  const CertificateDetailsDialog({super.key, required this.certificate});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppTheme.spacingM),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCardColor : AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusXL),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black45 : Colors.black26,
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with gradient
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              decoration: BoxDecoration(
                gradient: isDark
                    ? AppTheme.darkPrimaryGradient
                    : AppTheme.primaryGradient,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppTheme.radiusXL),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.workspace_premium,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Certificate Details',
                          style: AppTheme.bodySmall.copyWith(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          certificate.title,
                          style: AppTheme.headingSmall.copyWith(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Certificate image with modern design
                    if (certificate.imageUrl != null)
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppTheme.radiusL),
                          color: accentColor.withValues(alpha: 0.1),
                          border: Border.all(
                            color: accentColor.withValues(alpha: 0.2),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppTheme.radiusL),
                          child: Image.asset(
                            certificate.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Icon(
                                  Icons.workspace_premium,
                                  size: 80,
                                  color: accentColor.withValues(alpha: 0.5),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    const SizedBox(height: AppTheme.spacingL),

                    // Info cards
                    _buildInfoCard(
                      context,
                      icon: Icons.business,
                      title: 'Issued by',
                      content: certificate.issuer,
                      isDark: isDark,
                    ),

                    const SizedBox(height: AppTheme.spacingM),

                    _buildInfoCard(
                      context,
                      icon: Icons.calendar_today,
                      title: 'Issue Date',
                      content: _formatFullDate(certificate.issueDate),
                      isDark: isDark,
                    ),

                    const SizedBox(height: AppTheme.spacingM),

                    _buildInfoCard(
                      context,
                      icon: Icons.description,
                      title: 'Description',
                      content: certificate.description,
                      isDark: isDark,
                    ),

                    if (certificate.credentialUrl != null) ...[
                      const SizedBox(height: AppTheme.spacingM),
                      Container(
                        padding: const EdgeInsets.all(AppTheme.spacingM),
                        decoration: BoxDecoration(
                          color: AppTheme.successColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppTheme.radiusM),
                          border: Border.all(
                            color: AppTheme.successColor.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.verified,
                              color: AppTheme.successColor,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'This certificate is verified and can be validated online',
                                style: AppTheme.bodySmall.copyWith(
                                  color: AppTheme.successColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Action buttons
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              decoration: BoxDecoration(
                color: isDark
                    ? AppTheme.darkSurfaceColor.withValues(alpha: 0.5)
                    : Colors.grey.shade50,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(AppTheme.radiusXL),
                ),
              ),
              child: Row(
                children: [
                  if (certificate.credentialUrl != null)
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () =>
                            UrlHelper.launchURL(certificate.credentialUrl!),
                        icon: const Icon(Icons.verified_user, size: 20),
                        label: const Text('Verify Certificate'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusM),
                          ),
                        ),
                      ),
                    ),
                  if (certificate.pdfUrl != null &&
                      certificate.credentialUrl != null)
                    const SizedBox(width: AppTheme.spacingM),
                  if (certificate.pdfUrl != null)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () =>
                            UrlHelper.launchURL(certificate.pdfUrl!),
                        icon: const Icon(Icons.picture_as_pdf, size: 20),
                        label: const Text('View PDF'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: accentColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: BorderSide(color: accentColor, width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusM),
                          ),
                        ),
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

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    required bool isDark,
  }) {
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.darkSurfaceColor.withValues(alpha: 0.5)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: isDark
              ? AppTheme.darkTextSecondary.withValues(alpha: 0.1)
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: accentColor,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.bodySmall.copyWith(
                    color: isDark
                        ? AppTheme.darkTextSecondary
                        : AppTheme.textSecondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: AppTheme.bodyMedium.copyWith(
                    color: isDark
                        ? AppTheme.darkTextPrimary
                        : AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
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
