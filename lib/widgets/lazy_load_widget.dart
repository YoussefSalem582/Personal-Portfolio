import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Lazy loading wrapper that only builds its child when visible
/// Improves performance by deferring heavy widget builds
class LazyLoadWidget extends StatefulWidget {
  final Widget child;
  final Widget? placeholder;
  final double visibilityThreshold;
  final Duration? debounceTime;

  const LazyLoadWidget({
    super.key,
    required this.child,
    this.placeholder,
    this.visibilityThreshold = 0.1,
    this.debounceTime,
  });

  @override
  State<LazyLoadWidget> createState() => _LazyLoadWidgetState();
}

class _LazyLoadWidgetState extends State<LazyLoadWidget> {
  bool _hasBeenVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('lazy_${widget.key?.toString() ?? widget.hashCode.toString()}'),
      onVisibilityChanged: (info) {
        if (!_hasBeenVisible &&
            info.visibleFraction >= widget.visibilityThreshold) {
          if (mounted) {
            setState(() {
              _hasBeenVisible = true;
            });
          }
        }
      },
      child: _hasBeenVisible
          ? widget.child
          : widget.placeholder ?? const SizedBox.shrink(),
    );
  }
}

/// Optimized image loading with lazy loading and caching
class OptimizedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OptimizedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    // For local assets
    if (imageUrl.startsWith('assets/')) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        cacheWidth: width?.toInt(),
        cacheHeight: height?.toInt(),
        errorBuilder: (context, error, stackTrace) {
          return errorWidget ??
              Container(
                width: width,
                height: height,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, color: Colors.grey),
              );
        },
      );
    }

    // For network images (if used in future)
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: width?.toInt(),
      cacheHeight: height?.toInt(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            Container(
              width: width,
              height: height,
              color: Colors.grey.shade200,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            Container(
              width: width,
              height: height,
              color: Colors.grey.shade300,
              child: const Icon(Icons.broken_image, color: Colors.grey),
            );
      },
    );
  }
}

/// Section placeholder while content is loading
class SectionPlaceholder extends StatelessWidget {
  final double height;
  final Color? color;

  const SectionPlaceholder({
    super.key,
    this.height = 400,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: height,
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              isDark ? Colors.blue.shade400 : Colors.blue.shade600,
            ),
          ),
        ),
      ),
    );
  }
}

/// Animated fade in for lazy loaded content
class FadeInContent extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const FadeInContent({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  State<FadeInContent> createState() => _FadeInContentState();
}

class _FadeInContentState extends State<FadeInContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
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
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
