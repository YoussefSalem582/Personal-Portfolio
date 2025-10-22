import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../models/project.dart';
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
    return GestureDetector(
      onTap: () => _showProjectDetails(context),
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                      .withOpacity(0.25)
                  : Colors.black.withOpacity(0.08),
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
                  color: isDark ? AppTheme.darkCardColor : Colors.white,
                  border: Border.all(
                    color: _isHovered
                        ? (isDark
                                ? AppTheme.darkAccentColor
                                : AppTheme.accentColor)
                            .withOpacity(0.5)
                        : (isDark ? Colors.white24 : Colors.black12),
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
              if (widget.project.isFeatured) _buildFeaturedBadge(isDark),

              // Hover overlay (simplified)
              if (_isHovered) _buildHoverOverlay(context, isDark),
            ],
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
                          ? AppTheme.darkCardColor.withOpacity(0.3)
                          : Colors.grey.shade50,
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
                    Colors.transparent,
                    Colors.transparent,
                    (isDark ? Colors.black : Colors.white).withOpacity(0.5),
                    (isDark ? Colors.black : Colors.white).withOpacity(0.85),
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
        padding: const EdgeInsets.all(20.0),
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
                                    ? AppTheme.darkTextPrimary
                                    : AppTheme.textPrimary,
                                isDark
                                    ? AppTheme.darkTextPrimary
                                    : AppTheme.textPrimary,
                              ],
                            ).createShader(bounds);
                          }
                          return LinearGradient(
                            colors: [
                              isDark
                                  ? AppTheme.darkAccentColor
                                  : AppTheme.accentColor,
                              isDark
                                  ? AppTheme.darkPrimaryColor
                                  : AppTheme.primaryColor,
                            ],
                          ).createShader(bounds);
                        },
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: AppTheme.headingSmall.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                            shadows: _isHovered
                                ? [
                                    Shadow(
                                      color: (isDark
                                              ? AppTheme.darkAccentColor
                                              : AppTheme.accentColor)
                                          .withOpacity(0.5),
                                      blurRadius: 8,
                                    ),
                                  ]
                                : null,
                          ),
                          child: Text(
                            widget.project.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                                    ? AppTheme.darkAccentColor
                                    : AppTheme.accentColor,
                                isDark
                                    ? AppTheme.darkPrimaryColor
                                    : AppTheme.primaryColor,
                              ]
                            : [
                                Colors.transparent,
                                Colors.transparent,
                              ],
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: _isHovered
                          ? Colors.white
                          : (isDark
                              ? AppTheme.darkTextSecondary
                              : AppTheme.textSecondary),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Description
            Expanded(
              child: Text(
                widget.project.shortDescription,
                style: AppTheme.bodyMedium.copyWith(
                  color: isDark
                      ? AppTheme.darkTextSecondary
                      : AppTheme.textSecondary,
                  height: 1.4,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 8),

            // Technology chips (simplified)
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
                                ? AppTheme.darkAccentColor
                                : AppTheme.accentColor)
                            .withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: (isDark
                                  ? AppTheme.darkAccentColor
                                  : AppTheme.accentColor)
                              .withOpacity(0.4),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        tech,
                        style: AppTheme.bodySmall.copyWith(
                          color: isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.accentColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedBadge(bool isDark) {
    return Positioned(
      top: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFD700), Color(0xFFFFA500)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFD700).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star_rounded,
              size: 14,
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              'Featured',
              style: AppTheme.bodySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHoverOverlay(BuildContext context, bool isDark) {
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: _isHovered ? 1.0 : 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                  .withOpacity(0.1),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: (isDark
                          ? AppTheme.darkPrimaryColor
                          : AppTheme.primaryColor)
                      .withOpacity(0.95),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.accentColor)
                          .withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.visibility_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'View Project',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
            (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                .withOpacity(0.3),
            (isDark ? AppTheme.darkPrimaryColor : AppTheme.primaryColor)
                .withOpacity(0.2),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.code_rounded,
              size: 64,
              color: (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                  .withOpacity(0.7),
            ),
            const SizedBox(height: 16),
            Text(
              widget.project.title,
              style: AppTheme.bodyLarge.copyWith(
                color: isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
                fontWeight: FontWeight.bold,
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
      Get.toNamed(route);
    } else {
      // Show dialog for projects without images
      showDialog(
        context: context,
        builder: (context) => ProjectDetailsDialog(project: widget.project),
      );
    }
  }
}
