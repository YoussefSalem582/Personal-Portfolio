import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';

class SmartImage extends StatelessWidget {
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

  bool get _isNetworkImage =>
      imageUrl.startsWith('http') || imageUrl.startsWith('https');

  Widget _buildPlaceholder(BuildContext context) {
    if (placeholder != null) {
      return placeholder!;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.darkSurfaceColor.withOpacity(0.1)
            : AppTheme.surfaceColor.withOpacity(0.1),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                      .withOpacity(0.6),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Loading...',
              style: AppTheme.bodySmall.copyWith(
                color: isDark
                    ? AppTheme.darkTextSecondary.withOpacity(0.6)
                    : AppTheme.textSecondary.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    if (errorWidget != null) {
      return errorWidget!;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.darkSurfaceColor.withOpacity(0.1)
            : AppTheme.surfaceColor.withOpacity(0.1),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.broken_image_outlined,
              size: 32,
              color: isDark
                  ? AppTheme.darkTextSecondary.withOpacity(0.5)
                  : AppTheme.textSecondary.withOpacity(0.5),
            ),
            const SizedBox(height: 8),
            Text(
              'Image not found',
              style: AppTheme.bodySmall.copyWith(
                color: isDark
                    ? AppTheme.darkTextSecondary.withOpacity(0.5)
                    : AppTheme.textSecondary.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isNetworkImage) {
      // Use CachedNetworkImage for network URLs (Supabase)
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => _buildPlaceholder(context),
          errorWidget: (context, url, error) => _buildErrorWidget(context),
          fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 100),
        ),
      );
    } else {
      // Use Image.asset for local assets
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.asset(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) =>
              _buildErrorWidget(context),
        ),
      );
    }
  }
}
