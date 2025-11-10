import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        // Image sizes for desktop and mobile
        final width = constraints.maxWidth > 540 ? 500.0 : 320.0;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isDark ? AppColors.accentDark : AppColors.accentLight,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? AppColors.accentDark.withOpacity(0.3)
                    : AppColors.accentLight.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(17),
            child: Image.asset(
              AppImages.profileImage,
              width: width,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: width,
                  height: width * 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: isDark
                        ? AppColors.accentDark.withOpacity(0.1)
                        : AppColors.accentLight.withOpacity(0.1),
                  ),
                  child: Icon(
                    AppIcons.user,
                    size: width * 0.3,
                    color:
                        isDark ? AppColors.accentDark : AppColors.accentLight,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
