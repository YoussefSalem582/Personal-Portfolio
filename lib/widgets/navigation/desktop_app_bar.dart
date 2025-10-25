import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/data/portfolio_data.dart';
import '../theme_toggle.dart';
import 'navigation_item.dart';
import 'links_dropdown_button.dart';

class DesktopAppBar extends StatelessWidget {
  final Function(int) onItemSelected;
  final int currentIndex;

  const DesktopAppBar({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(
          MediaQuery.of(context).size.width,
        ),
        vertical: 8,
      ),
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
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo/Name with gradient effect
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImages.portfolioLogo,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 40,
                        height: 40,
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.flutterIconSvg,
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: isDark
                          ? [AppColors.accentDark, AppColors.white]
                          : [AppColors.primaryLight, AppColors.accentLight],
                    ).createShader(bounds),
                    child: Text(
                      PortfolioData.fullName,
                      style: AppFonts.h4().copyWith(
                        color: AppColors.white,
                        fontWeight: AppFonts.bold,
                        letterSpacing: -0.3,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Navigation items - wrapped in Flexible to prevent overflow
          Flexible(
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: _buildNavigationItems(false),
            ),
          ),

          const SizedBox(width: 20),

          // Links dropdown button
          LinksDropdownButton(isDark: isDark),

          const SizedBox(width: 16),

          // Theme toggle with better styling
          Container(
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
      ),
    );
  }

  List<Widget> _buildNavigationItems(bool isVertical) {
    final items = [
      NavigationItem(
        title: 'Home',
        index: 0,
        isSelected: currentIndex == 0,
        onTap: () => onItemSelected(0),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'About',
        index: 1,
        isSelected: currentIndex == 1,
        onTap: () => onItemSelected(1),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Skills',
        index: 2,
        isSelected: currentIndex == 2,
        onTap: () => onItemSelected(2),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Expertise',
        index: 3,
        isSelected: currentIndex == 3,
        onTap: () => onItemSelected(3),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Projects',
        index: 4,
        isSelected: currentIndex == 4,
        onTap: () => onItemSelected(4),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Certificates',
        index: 5,
        isSelected: currentIndex == 5,
        onTap: () => onItemSelected(5),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Contact',
        index: 6,
        isSelected: currentIndex == 6,
        onTap: () => onItemSelected(6),
        isVertical: isVertical,
      ),
    ];

    if (isVertical) {
      return items;
    } else {
      return items
          .expand((item) => [item, const SizedBox(width: 32)])
          .take(items.length * 2 - 1)
          .toList();
    }
  }
}
