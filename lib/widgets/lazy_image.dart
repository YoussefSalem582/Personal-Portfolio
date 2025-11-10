import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/assets/app_constants.dart';

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

    return Shimmer.fromColors(
      baseColor: isDark
          ? AppColors.surfaceDark.withValues(alpha: 0.3)
          : AppColors.surfaceLight.withValues(alpha: 0.3),
      highlightColor: isDark
          ? AppColors.accentDark.withValues(alpha: 0.1)
          : AppColors.accentLight.withValues(alpha: 0.1),
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.surfaceDark.withValues(alpha: 0.2)
              : AppColors.surfaceLight.withValues(alpha: 0.2),
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
        color: AppColors.surfaceLight.withValues(alpha: 0.1),
        borderRadius: widget.borderRadius,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              AppIcons.error,
              size: 32,
              color: AppColors.textSecondaryLight.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 8),
            Text(
              'Image not found',
              style: AppFonts.bodySmall().copyWith(
                color: AppColors.textSecondaryLight.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.zero,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          // Show image immediately (asset images load synchronously)
          Image.asset(
            widget.imageUrl,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) {
                // Asset images load synchronously, so mark as loaded immediately
                if (!_isLoaded) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _onImageLoaded();
                  });
                }
                return child;
              }
              // For async loading (shouldn't happen with assets but keep as fallback)
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

          // Show placeholder overlay while loading (will fade out)
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
