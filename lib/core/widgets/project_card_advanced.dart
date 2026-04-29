import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import '../../models/project.dart';
import 'package:youssef_hassan_portfolio/core/localization/localized_extensions.dart';
import '../routes/app_routes.dart';
import 'lazy_image.dart';
import 'project_card.dart'; // Import for ProjectDetailsDialog

class ProjectCardAdvanced extends StatefulWidget {
  final Project project;
  final bool isCompact;
  final int index;

  const ProjectCardAdvanced({
    super.key,
    required this.project,
    this.isCompact = false,
    this.index = 0,
  });

  @override
  State<ProjectCardAdvanced> createState() => _ProjectCardAdvancedState();
}

class _ProjectCardAdvancedState extends State<ProjectCardAdvanced>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Single hover animation controller for better performance
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.03,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final double cardHeight = widget.isCompact ? 320.0 : 380.0;

    return RepaintBoundary(
      child: MouseRegion(
        onEnter: (_) {
          if (!_isHovered) {
            setState(() => _isHovered = true);
            _hoverController.forward();
          }
        },
        onExit: (_) {
          if (_isHovered) {
            setState(() => _isHovered = false);
            _hoverController.reverse();
          }
        },
        cursor: SystemMouseCursors.click,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: _buildCard(context, isDark, cardHeight),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, bool isDark, double cardHeight) {
    final l10n = AppLocalizations.of(context);
    return Semantics(
      button: true,
      label:
          '${l10n.projectCardViewProject}: ${widget.project.localizedTitle}',
      child: GestureDetector(
        onTap: () => _showProjectDetails(context),
        child: Container(
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? (isDark ? AppColors.accentDark : AppColors.accentLight)
                        .withOpacity(0.25)
                    : AppColors.black.withOpacity(0.08),
                blurRadius: _isHovered ? 20 : 10,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Simple background
                Container(
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.cardDark : AppColors.white,
                    border: Border.all(
                      color: _isHovered
                          ? (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withOpacity(0.5)
                          : (isDark
                              ? AppColors.white.withOpacity(0.24)
                              : AppColors.black.withOpacity(0.12)),
                      width: 1,
                    ),
                  ),
                ),

                // Content
                Column(
                  children: [
                    // Image Section
                    _buildImageSection(context, isDark),

                    // Content Section
                    _buildContentSection(isDark),
                  ],
                ),

                // Featured badge
                if (widget.project.isFeatured)
                  _buildFeaturedBadge(context),

                // Hover overlay (simplified)
                if (_isHovered) _buildHoverOverlay(context, isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, bool isDark) {
    return Expanded(
      flex: 7,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          widget.project.imageUrl != null
              ? RepaintBoundary(
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.cardDark.withOpacity(0.3)
                          : AppColors.gray50,
                    ),
                    child: LazyImage(
                      imageUrl: widget.project.imageUrl!,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                )
              : _buildPlaceholderImage(isDark),

          // Simple gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.transparent,
                    AppColors.transparent,
                    (isDark ? AppColors.black : AppColors.white)
                        .withOpacity(0.5),
                    (isDark ? AppColors.black : AppColors.white)
                        .withOpacity(0.85),
                  ],
                  stops: const [0.0, 0.5, 0.8, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(bool isDark) {
    return Expanded(
      flex: 4,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(widget.isCompact ? 12.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title with icon
            Row(
              children: [
                Expanded(
                  child: AnimatedBuilder(
                    animation: _hoverController,
                    builder: (context, child) {
                      return ShaderMask(
                        shaderCallback: (bounds) {
                          if (!_isHovered) {
                            return LinearGradient(
                              colors: [
                                isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight,
                                isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight,
                              ],
                            ).createShader(bounds);
                          }
                          return LinearGradient(
                            colors: [
                              isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight,
                              isDark
                                  ? AppColors.primaryDark
                                  : AppColors.primaryLight,
                            ],
                          ).createShader(bounds);
                        },
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: AppFonts.labelLarge().copyWith(
                            fontSize: widget.isCompact ? 14 : null,
                            fontWeight: AppFonts.bold,
                            color: AppColors.white,
                            height: 1.2,
                            shadows: _isHovered
                                ? [
                                    Shadow(
                                      color: (isDark
                                              ? AppColors.accentDark
                                              : AppColors.accentLight)
                                          .withOpacity(0.5),
                                      blurRadius: 8,
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            widget.project.localizedTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (!widget.isCompact) ...[
                  const SizedBox(width: 8),
                  AnimatedRotation(
                    turns: _isHovered ? 0.125 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: _isHovered
                              ? [
                                  isDark
                                      ? AppColors.accentDark
                                      : AppColors.accentLight,
                                  isDark
                                      ? AppColors.primaryDark
                                      : AppColors.primaryLight,
                                ]
                              : [
                                  AppColors.transparent,
                                  AppColors.transparent,
                                ],
                        ),
                      ),
                      child: Icon(
                        AppIcons.arrowRight,
                        size: 16,
                        color: _isHovered
                            ? AppColors.white
                            : (isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight),
                      ),
                    ),
                  ),
                ],
              ],
            ),

            SizedBox(height: widget.isCompact ? 6 : 8),

            // Project Date
            Text(
              _getProjectDateText(context),
              style: AppFonts.bodySmall().copyWith(
                color: (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight)
                    .withOpacity(0.7),
                fontSize: widget.isCompact ? 11 : 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: widget.isCompact ? 6 : 8),

            // Description
            Expanded(
              child: Text(
                widget.project.localizedShortDescription,
                style: AppFonts.bodySmall().copyWith(
                  fontSize: widget.isCompact ? 12 : null,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  height: 1.4,
                ),
                maxLines: widget.isCompact ? 3 : 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Technology chips (hide on mobile)
            if (!widget.isCompact) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.project.technologies
                    .take(4)
                    .map(
                      (tech) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: (isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight)
                                .withOpacity(0.4),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          tech,
                          style: AppFonts.bodyXS().copyWith(
                            color: isDark
                                ? AppColors.accentDark
                                : AppColors.accentLight,
                            fontWeight: AppFonts.semiBold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedBadge(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Positioned(
      top: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          gradient: AppColors.goldGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.warningLight.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              AppIcons.featured,
              size: 14,
              color: AppColors.white,
            ),
            const SizedBox(width: 4),
            Text(
              l10n.projectCardFeatured,
              style: AppFonts.bodyXS().copyWith(
                color: AppColors.white,
                fontWeight: AppFonts.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoverOverlay(BuildContext context, bool isDark) {
    final l10n = AppLocalizations.of(context);
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: _isHovered ? 1.0 : 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withOpacity(0.1),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                          .withOpacity(0.95),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      AppIcons.view,
                      color: AppColors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.projectCardViewProject,
                      style: AppFonts.labelMedium().copyWith(
                        color: AppColors.white,
                        fontWeight: AppFonts.semiBold,
                      ),
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

  Widget _buildPlaceholderImage(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            (isDark ? AppColors.accentDark : AppColors.accentLight)
                .withOpacity(0.3),
            (isDark ? AppColors.primaryDark : AppColors.primaryLight)
                .withOpacity(0.2),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.code,
              size: 64,
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withOpacity(0.7),
            ),
            const SizedBox(height: 16),
            Text(
              widget.project.localizedTitle,
              style: AppFonts.bodyLarge().copyWith(
                color: isDark ? AppColors.accentDark : AppColors.accentLight,
                fontWeight: AppFonts.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showProjectDetails(BuildContext context) {
    // Navigate to case study page for projects with images
    if (widget.project.imageUrl != null ||
        (widget.project.galleryImages != null &&
            widget.project.galleryImages!.isNotEmpty)) {
      // Use the helper method to construct the full route
      final route = AppRoutes.getProjectRoute(widget.project.id);

      // Navigate directly to the constructed route
      context.push(route);
    } else {
      // Show dialog for projects without images
      showDialog(
        context: context,
        builder: (context) => ProjectDetailsDialog(project: widget.project),
      );
    }
  }

  /// Get project date text - shows "Under development" for current projects
  String _getProjectDateText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (widget.project.isUnderDevelopment) {
      return l10n.projectUnderDevelopment;
    }

    final now = DateTime.now();
    final projectDate = widget.project.createdAt;

    if (projectDate.year == now.year &&
        projectDate.month == now.month &&
        projectDate.day == now.day) {
      return l10n.projectUnderDevelopment;
    }

    return DateFormat.yMMMM(Localizations.localeOf(context).toString())
        .format(projectDate);
  }
}
