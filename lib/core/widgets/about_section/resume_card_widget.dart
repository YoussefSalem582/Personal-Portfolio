import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/assets/app_constants.dart';
import '../../../utils/url_helper.dart';
import '../../theme/app_theme.dart';

/// A prominent card with a button to view the resume/CV.
///
/// Features:
/// - Modern glassmorphism effect with a subtle gradient
/// - Clean, professional layout with a clear call-to-action
/// - Subtle hover animations for an interactive feel
///
/// The resume URL is injected from [AboutContentEntity].
class ResumeCardWidget extends StatefulWidget {
  const ResumeCardWidget({super.key, required this.resumeUrl});

  final String resumeUrl;
  @override
  State<ResumeCardWidget> createState() => _ResumeCardWidgetState();
}

class _ResumeCardWidgetState extends State<ResumeCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => UrlHelper.openFile(widget.resumeUrl),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.identity()
            ..translate(0.0, _isHovered ? -8.0 : 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusXL),
            boxShadow: [
              BoxShadow(
                color: (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                    .withOpacity(_isHovered ? 0.3 : 0.15),
                blurRadius: _isHovered ? 24 : 16,
                offset: Offset(0, _isHovered ? 12 : 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusXL),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? AppTheme.spacingL : AppTheme.spacingXL,
                  vertical: isMobile ? AppTheme.spacingL : AppTheme.spacingXL,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                            AppColors.surfaceDark.withOpacity(0.8),
                            AppColors.cardDark.withOpacity(0.7),
                          ]
                        : [
                            AppColors.white.withOpacity(0.7),
                            AppColors.surfaceLight.withOpacity(0.6),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusXL),
                  border: Border.all(
                    color:
                        (isDark ? AppColors.accentDark : AppColors.accentLight)
                            .withOpacity(_isHovered ? 0.3 : 0.15),
                    width: 1.5,
                  ),
                ),
                child: isMobile
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Layout for desktop screens
  Widget _buildDesktopLayout(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(AppTheme.spacingM),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: isDark
                        ? [AppColors.accentDark, AppColors.primaryDark]
                        : [AppColors.accentLight, AppColors.primaryLight],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  AppIcons.document,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: AppTheme.spacingL),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.resumeCardTitle,
                      style: AppFonts.h4ForTheme(context)
                          .copyWith(fontWeight: AppFonts.bold),
                    ),
                    const SizedBox(height: AppTheme.spacingXS),
                    Text(
                      l10n.resumeCardSubtitle,
                      style: AppFonts.bodyForTheme(context, isSecondary: true),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppTheme.spacingL),
        // Button
        ElevatedButton.icon(
          onPressed: () => UrlHelper.openFile(widget.resumeUrl),
          icon: const Icon(AppIcons.view, size: 20),
          label: Text(l10n.resumeViewCv),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingXL,
              vertical: AppTheme.spacingL,
            ),
            backgroundColor:
                isDark ? AppColors.accentDark : AppColors.accentLight,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusM),
            ),
            textStyle: AppFonts.button().copyWith(fontWeight: AppFonts.bold),
          ),
        ),
      ],
    );
  }

  /// Layout for mobile screens
  Widget _buildMobileLayout(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Column(
      children: [
        Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(AppTheme.spacingS),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isDark
                      ? [AppColors.accentDark, AppColors.primaryDark]
                      : [AppColors.accentLight, AppColors.primaryLight],
                ),
              ),
              child: const Icon(
                AppIcons.document,
                color: AppColors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: AppTheme.spacingM),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.resumeCardTitle,
                    style: AppFonts.h5ForTheme(context)
                        .copyWith(fontWeight: AppFonts.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.resumeCardSubtitle,
                    style:
                        AppFonts.bodySmallForTheme(context, isSecondary: true),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingL),
        // Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => UrlHelper.openFile(widget.resumeUrl),
            icon: const Icon(AppIcons.view, size: 18),
            label: Text(l10n.resumeViewCv),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingM),
              backgroundColor:
                  isDark ? AppColors.accentDark : AppColors.accentLight,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusM),
              ),
              textStyle: AppFonts.button().copyWith(fontWeight: AppFonts.bold),
            ),
          ),
        ),
      ],
    );
  }
}
