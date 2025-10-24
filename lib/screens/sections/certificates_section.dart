import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/assets/app_constants.dart';
import '../../models/certificate.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/url_helper.dart';
import '../../utils/responsive_helper.dart';

import '../../theme/app_theme.dart';

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
    final isTablet = ResponsiveHelper.isTablet(screenWidth);

    // Responsive grid columns
    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    final certificatesToShow =
        PortfolioData.certificates.take(_displayCount).toList();
    final hasMore = _displayCount < PortfolioData.certificates.length;

    return Container(
      width: double.infinity,
      color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
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
                itemCount: certificatesToShow.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: crossAxisCount,
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: CertificateCard(
                          certificate: certificatesToShow[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Show More Button
            if (hasMore) ...[
              const SizedBox(height: AppTheme.spacingXL),
              Center(
                child: _buildShowMoreButton(isDark),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildShowMoreButton(bool isDark) {
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

    return OutlinedButton.icon(
      onPressed: _showMore,
      icon: const Icon(AppIcons.arrowDown, size: 20),
      label: const Text('Show More'),
      style: OutlinedButton.styleFrom(
        foregroundColor: accentColor,
        side: BorderSide(color: accentColor, width: 2),
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
          style: AppFonts.h1().copyWith(
            fontWeight: AppFonts.black,
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
                ? AppColors.primaryGradientDark
                : AppColors.primaryGradientLight,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                    .withValues(alpha: 0.3),
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
          style: AppFonts.bodyLarge().copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
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
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

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
                    ? accentColor.withValues(alpha: 0.2)
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
                    ? accentColor.withValues(alpha: 0.3)
                    : AppColors.transparent,
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
                            AppColors.cardDark,
                            AppColors.cardDark.withValues(alpha: 0.8),
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
                accentColor.withValues(alpha: 0.15),
                accentColor.withValues(alpha: 0.05),
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
                AppColors.transparent,
                AppColors.black.withValues(alpha: 0.3),
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
                color: AppColors.errorLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.errorLight.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcons.pdf, size: 14, color: AppColors.white),
                  const SizedBox(width: 4),
                  Text(
                    'PDF',
                    style: AppFonts.bodyXS().copyWith(
                      color: AppColors.white,
                      fontWeight: AppFonts.bold,
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
                color: AppColors.successLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.successLight.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcons.badge, size: 14, color: AppColors.white),
                  const SizedBox(width: 4),
                  Text(
                    'Verified',
                    style: AppFonts.bodyXS().copyWith(
                      color: AppColors.white,
                      fontWeight: AppFonts.bold,
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
            style: AppFonts.h4().copyWith(
              fontWeight: AppFonts.bold,
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
                      accentColor.withValues(alpha: 0.15),
                      accentColor.withValues(alpha: 0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(AppIcons.experience, size: 14, color: accentColor),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.certificate.issuer,
                  style: AppFonts.labelMedium().copyWith(
                    color: accentColor,
                    fontWeight: AppFonts.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Duration and Action Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Duration Badge (if available)
              if (_extractDuration() != null)
                Flexible(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.surfaceDark : AppColors.gray100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isDark
                            ? AppColors.textSecondaryDark.withValues(alpha: 0.2)
                            : AppColors.gray300,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          AppIcons.date,
                          size: 12,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            _extractDuration()!,
                            style: AppFonts.bodySmall().copyWith(
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                              fontWeight: AppFonts.semiBold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              if (_extractDuration() != null) const SizedBox(width: 8),

              // View Details Button
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [accentColor, accentColor.withValues(alpha: 0.8)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  AppIcons.arrowRight,
                  size: 18,
                  color: AppColors.white,
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

  /// Extracts duration information from certificate description
  String? _extractDuration() {
    final description = widget.certificate.description;

    // Look for "Duration: " pattern in the description
    final durationRegex = RegExp(r'Duration:\s*(.+?)(?:\n|$)', multiLine: true);
    final match = durationRegex.firstMatch(description);

    if (match != null && match.groupCount > 0) {
      return match.group(1)?.trim();
    }

    return null;
  }

  /// Shows certificate details dialog
  void _showCertificateDetails(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.black.withValues(alpha: 0.6),
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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Icon(
              AppIcons.certificate,
              color: AppColors.white,
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
                  style: AppFonts.labelMedium().copyWith(
                    color: AppColors.white.withValues(alpha: 0.9),
                    letterSpacing: 1,
                    fontWeight: AppFonts.semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.certificate.title,
                  style: AppFonts.h3().copyWith(
                    color: AppColors.white,
                    fontWeight: AppFonts.extraBold,
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
            icon: Icon(AppIcons.close, color: AppColors.white, size: 24),
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white.withValues(alpha: 0.2),
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
            accentColor.withValues(alpha: 0.1),
            accentColor.withValues(alpha: 0.05),
          ],
        ),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.2),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.1),
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
                    AppIcons.certificate,
                    size: 80,
                    color: accentColor.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    'Certificate Image',
                    style: AppFonts.bodyLarge().copyWith(
                      color: accentColor,
                      fontWeight: AppFonts.semiBold,
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
          icon: AppIcons.experience,
          title: 'Issued by',
          content: widget.certificate.issuer,
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Date Card
        _buildInfoCard(
          context,
          icon: AppIcons.date,
          title: 'Issue Date',
          content: _formatFullDate(widget.certificate.issueDate),
          isDark: isDark,
        ),

        const SizedBox(height: AppTheme.spacingM),

        // Description Card
        _buildInfoCard(
          context,
          icon: AppIcons.blog,
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
                  AppColors.successLight.withValues(alpha: 0.15),
                  AppColors.successLight.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
              border: Border.all(
                color: AppColors.successLight.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.successLight.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    AppIcons.badge,
                    color: AppColors.successLight,
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
                        style: AppFonts.labelLarge().copyWith(
                          color: AppColors.successLight,
                          fontWeight: AppFonts.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'This certificate can be validated online',
                        style: AppFonts.bodySmall().copyWith(
                          color: AppColors.successLight.withValues(alpha: 0.8),
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
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.surfaceDark.withValues(alpha: 0.5)
            : AppColors.gray50,
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: isDark
              ? AppColors.textSecondaryDark.withValues(alpha: 0.15)
              : AppColors.gray200,
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
                  accentColor.withValues(alpha: 0.15),
                  accentColor.withValues(alpha: 0.05),
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
                  style: AppFonts.bodySmall().copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    fontWeight: AppFonts.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style: AppFonts.bodyMedium().copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                    fontWeight: AppFonts.regular,
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
            ? AppColors.surfaceDark.withValues(alpha: 0.3)
            : AppColors.gray50,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(AppTheme.radiusXL + 4),
        ),
        border: Border(
          top: BorderSide(
            color: isDark
                ? AppColors.textSecondaryDark.withValues(alpha: 0.1)
                : AppColors.gray200,
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
        icon: Icon(AppIcons.pdf, size: 22),
        label: const Text('View PDF'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.errorLight,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
          ),
          elevation: 0,
          shadowColor: AppColors.errorLight.withValues(alpha: 0.3),
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
        icon: Icon(AppIcons.badge, size: 22),
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
                ? accentColor.withValues(alpha: 0.1)
                : AppColors.transparent,
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
