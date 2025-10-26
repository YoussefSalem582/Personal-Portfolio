import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../utils/assets/app_constants.dart';

/// SmartImage widget - Simplified for static asset-only deployment
/// Now only handles local asset images (no network/Supabase images)
class SmartImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  const SmartImage({
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
  State<SmartImage> createState() => _SmartImageState();
}

class _SmartImageState extends State<SmartImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isLoaded = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
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
            ? AppColors.surfaceDark.withOpacity(0.3)
            : AppColors.surfaceLight.withOpacity(0.3),
        highlightColor: isDark
            ? AppColors.accentDark.withOpacity(0.1)
            : AppColors.accentLight.withOpacity(0.1),
        duration: const Duration(milliseconds: 1500),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.surfaceDark.withOpacity(0.2)
              : AppColors.surfaceLight.withOpacity(0.2),
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    if (widget.errorWidget != null) {
      return widget.errorWidget!;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.surfaceDark.withOpacity(0.1)
            : AppColors.surfaceLight.withOpacity(0.1),
        borderRadius: widget.borderRadius,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.image,
              size: 32,
              color: isDark
                  ? AppColors.textSecondaryDark.withOpacity(0.5)
                  : AppColors.textSecondaryLight.withOpacity(0.5),
            ),
            const SizedBox(height: 8),
            Text(
              'Image not found',
              style: AppFonts.bodySmall().copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark.withOpacity(0.5)
                    : AppColors.textSecondaryLight.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Only handle asset images (static deployment)
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          // Image loads immediately (asset images are synchronous)
          Image.asset(
            widget.imageUrl,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                // Asset images load synchronously
                if (!_isLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _onImageLoaded();
                  });
                }
                return child;
              }
              // Fallback for async loading
              if (frame != null) {
                if (!_isLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _onImageLoaded();
                  });
                }
                return child;
              }
              return _buildPlaceholder();
            },
            errorBuilder: (context, error, stackTrace) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _onImageError();
              });
              return _buildErrorWidget();
            },
          ),

          // Placeholder overlay (fades out)
          if (!_isLoaded && !_hasError)
            FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOut,
                ),
              ),
              child: _buildPlaceholder(),
            ),
        ],
      ),
    );
  }
}
