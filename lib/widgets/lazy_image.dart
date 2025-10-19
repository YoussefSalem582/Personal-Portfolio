import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../theme/app_theme.dart';

class LazyImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const LazyImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
  });

  @override
  State<LazyImage> createState() => _LazyImageState();
}

class _LazyImageState extends State<LazyImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isLoaded = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onImageLoaded() {
    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
      _animationController.forward();
    }
  }

  void _onImageError() {
    if (mounted) {
      setState(() {
        _hasError = true;
      });
    }
  }

  Widget _buildPlaceholder() {
    if (widget.placeholder != null) {
      return widget.placeholder!;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: isDark
            ? AppTheme.darkSurfaceColor.withValues(alpha: 0.3)
            : AppTheme.surfaceColor.withValues(alpha: 0.3),
        highlightColor: isDark
            ? AppTheme.darkAccentColor.withValues(alpha: 0.1)
            : AppTheme.accentColor.withValues(alpha: 0.1),
        duration: const Duration(milliseconds: 1500),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isDark
              ? AppTheme.darkSurfaceColor.withValues(alpha: 0.2)
              : AppTheme.surfaceColor.withValues(alpha: 0.2),
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    if (widget.errorWidget != null) {
      return widget.errorWidget!;
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor.withValues(alpha: 0.1),
        borderRadius: widget.borderRadius,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.broken_image_outlined,
              size: 32,
              color: AppTheme.textSecondary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 8),
            Text(
              'Image not found',
              style: AppTheme.bodySmall.copyWith(
                color: AppTheme.textSecondary.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Show placeholder while loading
        if (!_isLoaded && !_hasError) _buildPlaceholder(),

        // Show error widget if image failed to load
        if (_hasError) _buildErrorWidget(),

        // Show image when loaded
        if (!_hasError)
          FadeTransition(
            opacity: _fadeAnimation,
            child: ClipRRect(
              borderRadius: widget.borderRadius ?? BorderRadius.zero,
              child: Image.asset(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
                fit: widget.fit,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    _onImageLoaded();
                    return child;
                  }
                  if (frame != null && !_isLoaded) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _onImageLoaded();
                    });
                  }
                  return child;
                },
                errorBuilder: (context, error, stackTrace) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _onImageError();
                  });
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
      ],
    );
  }
}
