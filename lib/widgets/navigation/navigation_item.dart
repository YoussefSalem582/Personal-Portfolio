import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

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
          color: Colors.transparent,
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
                        ? Colors.white.withOpacity(0.08)
                        : Colors.black.withOpacity(0.06))
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: isSelected
                    ? Border.all(
                        color: isDark
                            ? Colors.white.withOpacity(0.3)
                            : Colors.black.withOpacity(0.2),
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
                        color: isDark ? Colors.white : Colors.black87,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  Text(
                    title,
                    style: TextStyle(
                      color: isSelected
                          ? (isDark ? Colors.white : Colors.black87)
                          : (isDark ? Colors.white60 : Colors.black54),
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 15,
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
          onTap: () {
            print('Navigation item tapped: $title');
            onTap();
          },
          borderRadius: BorderRadius.circular(10),
          hoverColor: (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
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
                              AppTheme.darkAccentColor.withOpacity(0.2),
                              AppTheme.darkAccentColor.withOpacity(0.1),
                            ]
                          : [
                              AppTheme.accentColor.withOpacity(0.15),
                              AppTheme.accentColor.withOpacity(0.08),
                            ],
                    )
                  : null,
              border: isSelected
                  ? Border.all(
                      color: (isDark
                              ? AppTheme.darkAccentColor
                              : AppTheme.accentColor)
                          .withOpacity(0.4),
                      width: 1.5,
                    )
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: (isDark
                                ? AppTheme.darkAccentColor
                                : AppTheme.accentColor)
                            .withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Text(
              title,
              style: AppTheme.bodyMedium.copyWith(
                color: isSelected
                    ? (isDark ? AppTheme.darkAccentColor : AppTheme.accentColor)
                    : (isDark
                        ? AppTheme.darkTextPrimary
                        : AppTheme.textPrimary),
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                fontSize: 15,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),
      );
    }
  }
}
