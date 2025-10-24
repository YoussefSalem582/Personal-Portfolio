import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../theme_toggle.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    AppColors.surfaceDark,
                    AppColors.surfaceDark.withValues(alpha: 0.95),
                  ]
                : [
                    AppColors.surfaceLight,
                    AppColors.surfaceLight.withValues(alpha: 0.98),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            bottom: BorderSide(
              color: isDark
                  ? AppColors.accentDark.withValues(alpha: 0.2)
                  : AppColors.accentLight.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? AppColors.black.withValues(alpha: 0.3)
                  : AppColors.black.withValues(alpha: 0.08),
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
                      AppColors.accentDark.withValues(alpha: 0.2),
                      AppColors.accentDark.withValues(alpha: 0.1),
                    ]
                  : [
                      AppColors.accentLight.withValues(alpha: 0.15),
                      AppColors.accentLight.withValues(alpha: 0.05),
                    ],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? AppColors.accentDark.withValues(alpha: 0.3)
                  : AppColors.accentLight.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: IconButton(
            icon: Icon(
              AppIcons.menu,
              color: isDark ? AppColors.accentDark : AppColors.accentLight,
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
              AppImages.portfolioLogo,
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
                              AppColors.accentDark,
                              AppColors.accentDark.withValues(alpha: 0.7)
                            ]
                          : [
                              AppColors.accentLight,
                              AppColors.accentLight.withValues(alpha: 0.8)
                            ],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.flutterIconSvg,
                    width: 16,
                    height: 16,
                    colorFilter: const ColorFilter.mode(
                      AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: isDark
                    ? [AppColors.accentDark, AppColors.white]
                    : [AppColors.primaryLight, AppColors.accentLight],
              ).createShader(bounds),
              child: Text(
                PortfolioData.fullName,
                style: AppFonts.h5().copyWith(
                  color: AppColors.white,
                  fontWeight: AppFonts.bold,
                  letterSpacing: -0.2,
                ),
                overflow: TextOverflow.visible,
                maxLines: 1,
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
                ? AppColors.white.withValues(alpha: 0.1)
                : AppColors.black.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark
                  ? AppColors.white.withValues(alpha: 0.15)
                  : AppColors.black.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          child: const ThemeToggle(isCompact: true),
        ),
      ],
    );
  }
}
