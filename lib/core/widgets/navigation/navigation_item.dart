import 'package:flutter/material.dart';
import '../../../utils/assets/app_constants.dart';

class NavigationItem extends StatelessWidget {
  final String title;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isVertical;

  const NavigationItem({
    super.key,
    required this.title,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.isVertical,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isVertical) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () {
              onTap();
              Navigator.of(context).pop(); // Close drawer
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? (isDark
                        ? AppColors.white.withOpacity(0.08)
                        : AppColors.black.withOpacity(0.06))
                    : AppColors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: isSelected
                    ? Border.all(
                        color: isDark
                            ? AppColors.white.withOpacity(0.3)
                            : AppColors.black.withOpacity(0.2),
                        width: 2,
                      )
                    : null,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  if (isSelected)
                    Container(
                      width: 3,
                      height: 18,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.white : AppColors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  Text(
                    title,
                    style: AppFonts.labelLarge().copyWith(
                      color: isSelected
                          ? (isDark ? AppColors.white : AppColors.black)
                          : (isDark
                              ? AppColors.white.withOpacity(0.6)
                              : AppColors.black.withOpacity(0.54)),
                      fontWeight:
                          isSelected ? AppFonts.semiBold : AppFonts.regular,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          hoverColor: (isDark ? AppColors.accentDark : AppColors.accentLight)
              .withOpacity(0.1),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: isSelected
                  ? LinearGradient(
                      colors: isDark
                          ? [
                              AppColors.accentDark.withOpacity(0.2),
                              AppColors.accentDark.withOpacity(0.1),
                            ]
                          : [
                              AppColors.accentLight.withOpacity(0.15),
                              AppColors.accentLight.withOpacity(0.08),
                            ],
                    )
                  : null,
              border: isSelected
                  ? Border.all(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.4),
                      width: 1.5,
                    )
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: (isDark
                                ? AppColors.accentDark
                                : AppColors.accentLight)
                            .withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              title,
              style: AppFonts.labelLarge().copyWith(
                color: isSelected
                    ? (isDark ? AppColors.accentDark : AppColors.accentLight)
                    : (isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight),
                fontWeight: isSelected ? AppFonts.bold : AppFonts.regular,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      );
    }
  }
}
