import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        // Increased sizes: 400px for desktop (was 300), 280px for mobile (was 200)
        final size = constraints.maxWidth > 600 ? 400.0 : 280.0;

        return ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isDark
                  ? AppColors.primaryGradientDark
                  : AppColors.primaryGradientLight,
              boxShadow: [
                BoxShadow(
                  color: isDark
                      ? AppColors.accentDark.withValues(alpha: 0.4)
                      : AppColors.accentLight.withValues(alpha: 0.3),
                  blurRadius: 30,
                  spreadRadius: 8,
                ),
                BoxShadow(
                  color: isDark
                      ? AppColors.primaryDark.withValues(alpha: 0.3)
                      : AppColors.primaryLight.withValues(alpha: 0.2),
                  blurRadius: 60,
                  spreadRadius: 15,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.jpeg',
                  width: size - 10,
                  height: size - 10,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: size - 10,
                      height: size - 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDark
                            ? AppColors.accentDark.withValues(alpha: 0.1)
                            : AppColors.accentLight.withValues(alpha: 0.1),
                      ),
                      child: Icon(
                        AppIcons.user,
                        size: size * 0.3,
                        color: isDark
                            ? AppColors.accentDark
                            : AppColors.accentLight,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
