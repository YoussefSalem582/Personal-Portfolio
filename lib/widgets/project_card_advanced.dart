import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
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
    with TickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _hoverController;
  late AnimationController _shimmerController;
  late AnimationController _pulseController;
  late AnimationController _rippleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // Hover animation controller
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Shimmer effect controller
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    // Pulse animation for featured badge
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.02,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -10),
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _shimmerController.dispose();
    _pulseController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final double cardHeight = widget.isCompact ? 320.0 : 380.0;

    return MouseRegion(
      onEnter: (_) {
        if (!_isHovered) {
          setState(() => _isHovered = true);
          _hoverController.forward();
          _rippleController.forward(from: 0);
        }
      },
      onExit: (_) {
        if (_isHovered) {
          setState(() => _isHovered = false);
          _hoverController.reverse();
        }
      },
      onHover: (_) {
        // Keep hover state active while mouse is moving over the card
        if (!_isHovered) {
          setState(() => _isHovered = true);
          _hoverController.forward();
        }
      },
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform.translate(
            offset: _slideAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotateAnimation.value * (widget.index.isEven ? 1 : -1),
                child: _buildCard(context, isDark, cardHeight),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, bool isDark, double cardHeight) {
    return GestureDetector(
      onTap: () => _showProjectDetails(context),
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                      .withOpacity(0.4)
                  : Colors.black.withOpacity(0.1),
              blurRadius: _isHovered ? 30 : 15,
              offset: Offset(0, _isHovered ? 15 : 8),
              spreadRadius: _isHovered ? 5 : 0,
            ),
            if (_isHovered)
              BoxShadow(
                color:
                    (isDark ? AppTheme.darkPrimaryColor : AppTheme.primaryColor)
                        .withOpacity(0.2),
                blurRadius: 40,
                offset: const Offset(0, 20),
                spreadRadius: 10,
              ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              // Glassmorphism background
              _buildGlassBackground(isDark),

              // Content
              Column(
                children: [
                  // Image Section with parallax effect
                  _buildImageSection(context, isDark),

                  // Content Section
                  _buildContentSection(isDark),
                ],
              ),

              // Animated border
              _buildAnimatedBorder(isDark),

              // Ripple effect on hover
              _buildRippleEffect(isDark),

              // Featured badge with animation
              if (widget.project.isFeatured) _buildFeaturedBadge(isDark),

              // Hover overlay with blur
              _buildHoverOverlay(context, isDark),

              // Shimmer effect on hover
              if (_isHovered) _buildShimmerEffect(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassBackground(bool isDark) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [
                      AppTheme.darkCardColor.withOpacity(0.8),
                      AppTheme.darkSurfaceColor.withOpacity(0.6),
                    ]
                  : [
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.7),
                    ],
            ),
            border: Border.all(
              color: (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                  .withOpacity(0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(24),
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
          // Image with parallax effect
          widget.project.imageUrl != null
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.identity()
                    ..translate(0.0, _isHovered ? -5.0 : 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          isDark
                              ? AppTheme.darkCardColor.withOpacity(0.3)
                              : Colors.grey.shade50,
                          isDark
                              ? AppTheme.darkCardColor.withOpacity(0.5)
                              : Colors.grey.shade100,
                        ],
                      ),
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

          // Gradient overlay with blur
          Positioned.fill(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    (isDark ? Colors.black : Colors.white).withOpacity(0.6),
                    (isDark ? Colors.black : Colors.white).withOpacity(0.9),
                  ],
                  stops: const [0.0, 0.4, 0.7, 1.0],
                ),
              ),
            ),
          ),

          // Interactive glow effect
          if (_isHovered)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.5,
                    colors: [
                      (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                          .withOpacity(0.3),
                      Colors.transparent,
                    ],
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

            // Project Stats Bar
            _buildStatsBar(isDark),

            const SizedBox(height: 12),

            // Technology chips with animation
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.project.technologies
                  .take(4)
                  .toList()
                  .asMap()
                  .entries
                  .map(
                    (entry) => TweenAnimationBuilder<double>(
                      duration: Duration(milliseconds: 300 + (entry.key * 50)),
                      tween: Tween<double>(
                        begin: 0.0,
                        end: _isHovered ? 1.0 : 0.8,
                      ),
                      curve: Curves.easeOutBack,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    (isDark
                                            ? AppTheme.darkAccentColor
                                            : AppTheme.accentColor)
                                        .withOpacity(0.2),
                                    (isDark
                                            ? AppTheme.darkPrimaryColor
                                            : AppTheme.primaryColor)
                                        .withOpacity(0.1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: (isDark
                                          ? AppTheme.darkAccentColor
                                          : AppTheme.accentColor)
                                      .withOpacity(0.4),
                                  width: 1.5,
                                ),
                                boxShadow: _isHovered
                                    ? [
                                        BoxShadow(
                                          color: (isDark
                                                  ? AppTheme.darkAccentColor
                                                  : AppTheme.accentColor)
                                              .withOpacity(0.3),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Text(
                                entry.value,
                                style: AppTheme.bodySmall.copyWith(
                                  color: isDark
                                      ? AppTheme.darkAccentColor
                                      : AppTheme.accentColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsBar(bool isDark) {
    final techCount = widget.project.technologies.length;
    final hasLiveDemo = widget.project.liveUrl?.isNotEmpty ?? false;
    final hasGithub = widget.project.githubUrl?.isNotEmpty ?? false;

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 10 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.05)
                    : Colors.black.withOpacity(0.03),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  _buildStatItem(
                    icon: Icons.code_rounded,
                    label: '$techCount Tech',
                    isDark: isDark,
                  ),
                  const SizedBox(width: 16),
                  if (hasLiveDemo)
                    _buildStatItem(
                      icon: Icons.public_rounded,
                      label: 'Live',
                      isDark: isDark,
                      color: Colors.green,
                    ),
                  if (hasLiveDemo && hasGithub) const SizedBox(width: 16),
                  if (hasGithub)
                    _buildStatItem(
                      svgAsset: 'assets/icons/github_icon.svg',
                      label: 'GitHub',
                      isDark: isDark,
                      color: Colors.purple,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem({
    IconData? icon,
    String? svgAsset,
    required String label,
    required bool isDark,
    Color? color,
  }) {
    final effectiveColor =
        color ?? (isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.9 + (0.1 * value),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: effectiveColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: effectiveColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (svgAsset != null)
                    SizedBox(
                      width: 14,
                      height: 14,
                      child: SvgPicture.asset(
                        svgAsset,
                        fit: BoxFit.contain,
                      ),
                    )
                  else if (icon != null)
                    Icon(
                      icon,
                      size: 14,
                      color: effectiveColor,
                    ),
                  const SizedBox(width: 4),
                  Text(
                    label,
                    style: AppTheme.bodySmall.copyWith(
                      color: effectiveColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedBorder(bool isDark) {
    return AnimatedBuilder(
      animation: _hoverController,
      builder: (context, child) {
        return Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                width: 2,
                color: _isHovered
                    ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                        .withOpacity(_fadeAnimation.value * 0.8)
                    : Colors.transparent,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRippleEffect(bool isDark) {
    return AnimatedBuilder(
      animation: _rippleController,
      builder: (context, child) {
        return Positioned.fill(
          child: CustomPaint(
            painter: RipplePainter(
              progress: _rippleController.value,
              color: isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeaturedBadge(bool isDark) {
    return Positioned(
      top: 16,
      right: 16,
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _pulseAnimation.value,
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 600),
              tween: Tween<double>(begin: 0.0, end: 1.0),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Transform.rotate(
                    angle: (1 - value) * 0.5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFFD700),
                            const Color(0xFFFFA500),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFFD700)
                                .withOpacity(0.5 * _pulseAnimation.value),
                            blurRadius: 12 + (8 * (_pulseAnimation.value - 1)),
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Featured',
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
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildHoverOverlay(BuildContext context, bool isDark) {
    return Positioned.fill(
      child: IgnorePointer(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _isHovered ? 1.0 : 0.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDark
                        ? [
                            AppTheme.darkAccentColor.withOpacity(0.3),
                            AppTheme.darkPrimaryColor.withOpacity(0.2),
                          ]
                        : [
                            AppTheme.accentColor.withOpacity(0.2),
                            AppTheme.primaryColor.withOpacity(0.15),
                          ],
                  ),
                ),
                child: Center(
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: (isDark
                                ? AppTheme.darkPrimaryColor
                                : AppTheme.primaryColor)
                            .withOpacity(0.9),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: (isDark
                                    ? AppTheme.darkAccentColor
                                    : AppTheme.accentColor)
                                .withOpacity(0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.visibility_rounded,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'View Project',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
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
        ),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return Positioned.fill(
      child: AnimatedBuilder(
        animation: _shimmerController,
        builder: (context, child) {
          return CustomPaint(
            painter: ShimmerPainter(
              animation: _shimmerController,
              color: Colors.white.withOpacity(0.3),
            ),
          );
        },
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
    debugPrint('🎯 Project tapped: ${widget.project.title}');
    debugPrint('📋 Project ID: ${widget.project.id}');
    debugPrint('⭐ Is Featured: ${widget.project.isFeatured}');

    // Navigate to case study page for featured projects
    if (widget.project.isFeatured) {
      // Use the helper method to construct the full route
      final route = AppRoutes.getProjectRoute(widget.project.id);
      debugPrint('🚀 Navigating to: $route');

      // Navigate directly to the constructed route (not using parameters)
      Get.toNamed(route);
    } else {
      debugPrint('💬 Opening dialog for non-featured project');
      // Show dialog for non-featured projects
      showDialog(
        context: context,
        builder: (context) => ProjectDetailsDialog(project: widget.project),
      );
    }
  }
}

// Custom shimmer painter
class ShimmerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  ShimmerPainter({required this.animation, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.transparent,
          color,
          Colors.transparent,
        ],
        stops: [
          animation.value - 0.3,
          animation.value,
          animation.value + 0.3,
        ].map((e) => e.clamp(0.0, 1.0)).toList(),
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant ShimmerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value;
  }
}

// Ripple Painter for hover effect
class RipplePainter extends CustomPainter {
  final double progress;
  final Color color;

  RipplePainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width > size.height ? size.width : size.height;

    // Draw multiple ripple circles
    for (int i = 0; i < 3; i++) {
      final rippleProgress = (progress - (i * 0.1)).clamp(0.0, 1.0);
      final radius = maxRadius * rippleProgress;
      final opacity = (1.0 - rippleProgress) * 0.3;

      final paint = Paint()
        ..color = color.withOpacity(opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant RipplePainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
