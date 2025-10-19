import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_theme.dart';
import '../models/project.dart';
import '../routes/app_routes.dart';
import 'lazy_image.dart';

class EnhancedProjectCard extends StatefulWidget {
  final Project project;
  final bool isCompact;

  const EnhancedProjectCard({
    super.key,
    required this.project,
    this.isCompact = false,
  });

  @override
  State<EnhancedProjectCard> createState() => _EnhancedProjectCardState();
}

class _EnhancedProjectCardState extends State<EnhancedProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _elevationAnimation = Tween<double>(
      begin: 4.0,
      end: 16.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.02),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SlideTransition(
            position: _slideAnimation,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                height: widget.isCompact ? 220 : 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark ? AppTheme.accentColor : Colors.black)
                          .withValues(alpha: _isHovered ? 0.3 : 0.1),
                      blurRadius: _elevationAnimation.value,
                      spreadRadius: _isHovered ? 2 : 0,
                      offset: Offset(0, _elevationAnimation.value / 2),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => _navigateToProject(),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isDark
                              ? [
                                  const Color(0xFF1E2330),
                                  const Color(0xFF151920),
                                ]
                              : [
                                  Colors.white,
                                  Colors.grey.shade50,
                                ],
                        ),
                        border: Border.all(
                          color: _isHovered
                              ? AppTheme.accentColor.withValues(alpha: 0.6)
                              : (isDark
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade200),
                          width: _isHovered ? 2 : 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildImageSection(isDark),
                            _buildContentSection(isDark),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageSection(bool isDark) {
    return Expanded(
      flex: widget.isCompact ? 2 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          widget.project.imageUrl != null
              ? LazyImage(
                  imageUrl: widget.project.imageUrl!,
                  fit: BoxFit.cover,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  errorWidget: _buildPlaceholder(isDark),
                )
              : _buildPlaceholder(isDark),

          // Gradient overlay
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isHovered ? 0.3 : 0.1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    (isDark ? Colors.black : Colors.grey.shade900),
                  ],
                ),
              ),
            ),
          ),

          // View Project overlay when hovered
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _isHovered ? 1.0 : 0.0,
            child: Container(
              color: AppTheme.accentColor.withValues(alpha: 0.2),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.accentColor.withValues(alpha: 0.5),
                        blurRadius: 12,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'View Project',
                        style: AppTheme.bodyMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
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
      flex: widget.isCompact ? 3 : 2,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title with animated color
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: AppTheme.headingSmall.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: _isHovered
                    ? AppTheme.accentColor
                    : (isDark
                        ? AppTheme.darkTextPrimary
                        : AppTheme.textPrimary),
              ),
              child: Text(
                widget.project.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 12),

            // Description
            Expanded(
              child: Text(
                widget.project.shortDescription,
                style: AppTheme.bodyMedium.copyWith(
                  color: isDark
                      ? AppTheme.darkTextSecondary
                      : AppTheme.textSecondary,
                  height: 1.5,
                ),
                maxLines: widget.isCompact ? 2 : 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 12),

            // Technologies with improved styling
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.project.technologies
                  .take(widget.isCompact ? 2 : 3)
                  .map((tech) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.accentColor.withValues(alpha: 0.15),
                              AppTheme.accentColor.withValues(alpha: 0.25),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppTheme.accentColor.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          tech,
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.accentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.accentColor.withValues(alpha: 0.1),
            AppTheme.accentColor.withValues(alpha: 0.2),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.code_rounded,
              size: 48,
              color: AppTheme.accentColor.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 12),
            Text(
              widget.project.title,
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.accentColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProject() {
    Get.toNamed(
      AppRoutes.project,
      parameters: {'id': widget.project.id},
    );
  }
}
