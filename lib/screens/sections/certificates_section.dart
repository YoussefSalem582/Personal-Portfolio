import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../theme/app_theme.dart';
import '../../models/certificate.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../utils/responsive_helper.dart';

/// Certificates section displaying all professional certifications and achievements
/// with modern card-based design and smooth animations
class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isTablet = ResponsiveHelper.isTablet(screenWidth);

    // Responsive grid columns
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
            // Section Header
            _buildSectionHeader(context, isDark),

            const SizedBox(height: AppTheme.spacingXXL),

            // Certificates Grid with Staggered Animation
            AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: AppTheme.spacingL,
                  mainAxisSpacing: AppTheme.spacingL,
                  childAspectRatio: isMobile ? 0.9 : 0.75,
                ),
                itemCount: PortfolioData.certificates.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: crossAxisCount,
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: CertificateCard(
                          certificate: PortfolioData.certificates[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the section header with title, divider, and subtitle
  Widget _buildSectionHeader(BuildContext context, bool isDark) {
    return Column(
      children: [
        // Section Title
        Text(
          'Certificates & Achievements',
          style: (isDark
                  ? AppTheme.headingLargeForTheme(context)
                  : AppTheme.headingLarge)
              .copyWith(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Gradient Divider
        Container(
          width: 80,
          height: 5,
          decoration: BoxDecoration(
            gradient: isDark
                ? AppTheme.darkPrimaryGradient
                : AppTheme.primaryGradient,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color:
                    (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                        .withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Subtitle
        Text(
          'Professional certifications showcasing continuous learning and expertise',
          style: (isDark
                  ? AppTheme.bodyLargeForTheme(context)
                  : AppTheme.bodyLarge)
              .copyWith(
            color: isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

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
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;

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
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusXL),
              side: BorderSide(
                color: _isHovered
                    ? accentColor.withOpacity(0.3)
                    : Colors.transparent,
                width: 2,
              ),
            ),
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
                            AppTheme.darkCardColor,
                            AppTheme.darkCardColor.withOpacity(0.8),
                          ],
                        )
                      : null,
                  color: isDark ? null : AppTheme.surfaceColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Certificate Image with Gradient Overlay
                    Expanded(
                      flex: 5,
                      child: _buildCertificateImage(accentColor, isDark),
                    ),

                    // Certificate Info
                    Expanded(
                      flex: 4,
                      child:
                          _buildCertificateInfo(context, accentColor, isDark),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the certificate image section with gradient overlay and badges
  Widget _buildCertificateImage(Color accentColor, bool isDark) {
    return Stack(
      children: [
        // Image Container
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppTheme.radiusXL),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accentColor.withOpacity(0.15),
                accentColor.withOpacity(0.05),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppTheme.radiusXL),
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

        // Gradient Overlay
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppTheme.radiusXL),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
        ),

        // PDF Badge
        if (widget.certificate.pdfUrl != null)
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.shade600,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.picture_as_pdf,
                      size: 14, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    'PDF',
                    style: AppTheme.bodySmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Verified Badge
        if (widget.certificate.credentialUrl != null)
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.successColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.successColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.verified, size: 14, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    'Verified',
                    style: AppTheme.bodySmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  /// Builds the certificate information section
  Widget _buildCertificateInfo(
      BuildContext context, Color accentColor, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Certificate Title
          Text(
            widget.certificate.title,
            style: (isDark
                    ? AppTheme.headingSmallForTheme(context)
                    : AppTheme.headingSmall)
                .copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: AppTheme.spacingS),

          // Issuer with Icon
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      accentColor.withOpacity(0.15),
                      accentColor.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.business, size: 14, color: accentColor),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.certificate.issuer,
                  style: AppTheme.bodySmall.copyWith(
                    color: accentColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Date and Action Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Date Badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color:
                      isDark ? AppTheme.darkSurfaceColor : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isDark
                        ? AppTheme.darkTextSecondary.withOpacity(0.2)
                        : Colors.grey.shade300,
                  ),
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
                    const SizedBox(width: 6),
                    Text(
                      _formatDate(widget.certificate.issueDate),
                      style: AppTheme.bodySmall.copyWith(
                        color: isDark
                            ? AppTheme.darkTextSecondary
                            : AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // View Details Button
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accentColor, accentColor.withOpacity(0.8)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds placeholder icon when certificate image is not available
  Widget _buildPlaceholderIcon(Color accentColor) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withOpacity(0.15),
            accentColor.withOpacity(0.05),
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
                  accentColor.withOpacity(0.2),
                  accentColor.withOpacity(0.1),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.workspace_premium,
              size: 48,
              color: accentColor,
            ),
          ),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            'Certificate',
            style: AppTheme.bodyMedium.copyWith(
              color: accentColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  /// Formats date to "MMM YYYY" format
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

  /// Shows certificate details dialog
  void _showCertificateDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      builder: (context) => CertificateDetailsDialog(
        certificate: widget.certificate,
      ),
    );
  }
}

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
    final accentColor =
        isDark ? AppTheme.darkAccentColor : AppTheme.accentColor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding:
              EdgeInsets.all(isMobile ? AppTheme.spacingM : AppTheme.spacingXL),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 700,
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCardColor : AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(AppTheme.radiusXL + 4),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.2),
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
                _buildDialogHeader(context, isDark, accentColor),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(
                        isMobile ? AppTheme.spacingM : AppTheme.spacingL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Certificate Image
                        _buildCertificateImage(isDark, accentColor),

                        const SizedBox(height: AppTheme.spacingL),

                        // Info Cards
                        _buildInfoSection(context, isDark),
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                _buildActionButtons(context, isDark, accentColor, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the modern gradient header with close button
  Widget _buildDialogHeader(
      BuildContext context, bool isDark, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppTheme.darkAccentColor,
                  AppTheme.darkAccentColor.withOpacity(0.8),
                ],
              )
            : AppTheme.primaryGradient,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXL + 4),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.workspace_premium,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Certificate Details',
                  style: AppTheme.bodySmall.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.certificate.title,
                  style: AppTheme.headingMedium.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Close Button
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon:
                const Icon(Icons.close_rounded, color: Colors.white, size: 24),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the certificate image section
  Widget _buildCertificateImage(bool isDark, Color accentColor) {
    if (widget.certificate.imageUrl == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            accentColor.withOpacity(0.1),
            accentColor.withOpacity(0.05),
          ],
        ),
        border: Border.all(
          color: accentColor.withOpacity(0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusL),
        child: Image.asset(
          widget.certificate.imageUrl!,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.workspace_premium,
                    size: 80,
                    color: accentColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    'Certificate Image',
                    style: AppTheme.bodyLarge.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  /// Builds the information section with cards
  Widget _buildInfoSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Issuer Card
        _buildInfoCard(
          context,
          icon: Icons.business_rounded,
          title: 'Issued by',
          content: widget.certificate.issuer,
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Date Card
        _buildInfoCard(
          context,
          icon: Icons.calendar_today_rounded,
          title: 'Issue Date',
          content: _formatFullDate(widget.certificate.issueDate),
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Description Card
        _buildInfoCard(
          context,
          icon: Icons.description_rounded,
          title: 'Description',
          content: widget.certificate.description,
          isDark: isDark,
        ),

        // Verified Badge
        if (widget.certificate.credentialUrl != null) ...[
          const SizedBox(height: AppTheme.spacingM),
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.successColor.withOpacity(0.15),
                  AppTheme.successColor.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(
                color: AppTheme.successColor.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.successColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified_rounded,
                    color: AppTheme.successColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Verified Certificate',
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.successColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'This certificate can be validated online',
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.successColor.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  /// Builds individual info card
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
            ? AppTheme.darkSurfaceColor.withOpacity(0.5)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: isDark
              ? AppTheme.darkTextSecondary.withOpacity(0.15)
              : Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  accentColor.withOpacity(0.15),
                  accentColor.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 22, color: accentColor),
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
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: AppTheme.bodyMedium.copyWith(
                    color: isDark
                        ? AppTheme.darkTextPrimary
                        : AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds action buttons section
  Widget _buildActionButtons(
      BuildContext context, bool isDark, Color accentColor, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? AppTheme.spacingM : AppTheme.spacingL),
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.darkSurfaceColor.withOpacity(0.3)
            : Colors.grey.shade50,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(AppTheme.radiusXL + 4),
        ),
        border: Border(
          top: BorderSide(
            color: isDark
                ? AppTheme.darkTextSecondary.withOpacity(0.1)
                : Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                if (widget.certificate.pdfUrl != null)
                  _buildPDFButton(accentColor, true),
                if (widget.certificate.pdfUrl != null &&
                    widget.certificate.credentialUrl != null)
                  const SizedBox(height: AppTheme.spacingM),
                if (widget.certificate.credentialUrl != null)
                  _buildVerifyButton(accentColor, true),
              ],
            )
          : Row(
              children: [
                if (widget.certificate.pdfUrl != null)
                  Expanded(child: _buildPDFButton(accentColor, false)),
                if (widget.certificate.pdfUrl != null &&
                    widget.certificate.credentialUrl != null)
                  const SizedBox(width: AppTheme.spacingM),
                if (widget.certificate.credentialUrl != null)
                  Expanded(child: _buildVerifyButton(accentColor, false)),
              ],
            ),
    );
  }

  /// Builds PDF view button
  Widget _buildPDFButton(Color accentColor, bool fullWidth) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: ElevatedButton.icon(
        onPressed: () {
          if (widget.certificate.pdfUrl != null) {
            UrlHelper.openFile(widget.certificate.pdfUrl!);
          }
        },
        icon: const Icon(Icons.picture_as_pdf_rounded, size: 22),
        label: const Text('View PDF'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade600,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
          elevation: 0,
          shadowColor: Colors.red.withOpacity(0.3),
        ).copyWith(
          elevation: WidgetStateProperty.resolveWith<double>(
            (states) => states.contains(WidgetState.hovered) ? 8 : 0,
          ),
        ),
      ),
    );
  }

  /// Builds verify certificate button
  Widget _buildVerifyButton(Color accentColor, bool fullWidth) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: OutlinedButton.icon(
        onPressed: () {
          if (widget.certificate.credentialUrl != null) {
            UrlHelper.launchURL(widget.certificate.credentialUrl!);
          }
        },
        icon: const Icon(Icons.verified_user_rounded, size: 22),
        label: const Text('Verify Certificate'),
        style: OutlinedButton.styleFrom(
          foregroundColor: accentColor,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          side: BorderSide(color: accentColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (states) => states.contains(WidgetState.hovered)
                ? accentColor.withOpacity(0.1)
                : Colors.transparent,
          ),
        ),
      ),
    );
  }

  /// Formats date to "Month YYYY" format
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
