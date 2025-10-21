import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../theme_toggle.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    AppTheme.darkSurfaceColor,
                    AppTheme.darkSurfaceColor.withOpacity(0.95),
                  ]
                : [
                    AppTheme.surfaceColor,
                    AppTheme.surfaceColor.withOpacity(0.98),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            bottom: BorderSide(
              color: isDark
                  ? AppTheme.darkAccentColor.withOpacity(0.2)
                  : AppTheme.accentColor.withOpacity(0.1),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
      leading: Builder(
        builder: (context) => Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isDark
                  ? [
                      AppTheme.darkAccentColor.withOpacity(0.2),
                      AppTheme.darkAccentColor.withOpacity(0.1),
                    ]
                  : [
                      AppTheme.accentColor.withOpacity(0.15),
                      AppTheme.accentColor.withOpacity(0.05),
                    ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? AppTheme.darkAccentColor.withOpacity(0.3)
                  : AppTheme.accentColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: isDark ? AppTheme.darkAccentColor : AppTheme.accentColor,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              'assets/images/portfolio_logo.png',
              width: 28,
              height: 28,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [
                              AppTheme.darkAccentColor,
                              AppTheme.darkAccentColor.withOpacity(0.7)
                            ]
                          : [
                              AppTheme.accentColor,
                              AppTheme.accentColor.withOpacity(0.8)
                            ],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.code_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: isDark
                  ? [AppTheme.darkAccentColor, Colors.white]
                  : [AppTheme.primaryColor, AppTheme.accentColor],
            ).createShader(bounds),
            child: Text(
              'Youssef Salem',
              style: AppTheme.headingSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.15)
                  : Colors.black.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: const ThemeToggle(isCompact: true),
        ),
      ],
    );
  }
}
