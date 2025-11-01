import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/data/portfolio_data.dart';
import '../theme_toggle.dart';
import 'navigation_item.dart';
import 'links_dropdown_button.dart';

class DesktopAppBar extends StatefulWidget {
  final Function(int) onItemSelected;
  final int currentIndex;

  const DesktopAppBar({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  State<DesktopAppBar> createState() => _DesktopAppBarState();
}

class _DesktopAppBarState extends State<DesktopAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
          vertical: 8,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [
                    AppColors.surfaceDark,
                    AppColors.surfaceDark.withOpacity(0.98),
                  ]
                : [
                    AppColors.white,
                    AppColors.surfaceLight.withOpacity(0.98),
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            bottom: BorderSide(
              color: isDark
                  ? AppColors.accentDark.withOpacity(0.15)
                  : AppColors.accentLight.withOpacity(0.08),
              width: 1.5,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? AppColors.black.withOpacity(0.4)
                  : AppColors.black.withOpacity(0.06),
              blurRadius: 16,
              offset: const Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            // Logo/Name with gradient effect
            _AppBarLogo(isDark: isDark, onTap: () => widget.onItemSelected(0)),

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
            _ThemeToggleButton(isDark: isDark),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNavigationItems(bool isVertical) {
    final items = [
      NavigationItem(
        title: 'Home',
        index: 0,
        isSelected: widget.currentIndex == 0,
        onTap: () => widget.onItemSelected(0),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'About',
        index: 1,
        isSelected: widget.currentIndex == 1,
        onTap: () => widget.onItemSelected(1),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Skills',
        index: 2,
        isSelected: widget.currentIndex == 2,
        onTap: () => widget.onItemSelected(2),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Expertise',
        index: 3,
        isSelected: widget.currentIndex == 3,
        onTap: () => widget.onItemSelected(3),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Projects',
        index: 4,
        isSelected: widget.currentIndex == 4,
        onTap: () => widget.onItemSelected(4),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Certificates',
        index: 5,
        isSelected: widget.currentIndex == 5,
        onTap: () => widget.onItemSelected(5),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: 'Contact',
        index: 6,
        isSelected: widget.currentIndex == 6,
        onTap: () => widget.onItemSelected(6),
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

// App Bar Logo Widget
class _AppBarLogo extends StatefulWidget {
  final bool isDark;
  final VoidCallback onTap;

  const _AppBarLogo({required this.isDark, required this.onTap});

  @override
  State<_AppBarLogo> createState() => _AppBarLogoState();
}

class _AppBarLogoState extends State<_AppBarLogo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Logo with hero animation - Opens image on click
              GestureDetector(
                onTap: () {
                  // Open the logo image in a dialog
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 600, maxHeight: 600),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImages.portfolioLogo,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'app_logo',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: (widget.isDark
                                  ? AppColors.accentDark
                                  : AppColors.accentLight)
                              .withOpacity(_isHovered ? 0.4 : 0.2),
                          blurRadius: _isHovered ? 12 : 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.portfolioLogo,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: widget.isDark
                                    ? [
                                        AppColors.accentDark,
                                        AppColors.accentDark.withOpacity(0.7)
                                      ]
                                    : [
                                        AppColors.accentLight,
                                        AppColors.accentLight.withOpacity(0.8)
                                      ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppIcons.flutterIconSvg,
                                width: 22,
                                height: 22,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Name with gradient - Navigates to top on click
              GestureDetector(
                onTap: widget.onTap,
                behavior: HitTestBehavior.opaque,
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: widget.isDark
                        ? [AppColors.accentDark, AppColors.white]
                        : [AppColors.primaryLight, AppColors.accentLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    PortfolioData.fullName,
                    style: AppFonts.h4().copyWith(
                      color: AppColors.white,
                      fontWeight: AppFonts.bold,
                      letterSpacing: -0.4,
                      height: 1.2,
                    ),
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Theme Toggle Button Widget
class _ThemeToggleButton extends StatelessWidget {
  final bool isDark;

  const _ThemeToggleButton({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  AppColors.white.withOpacity(0.08),
                  AppColors.white.withOpacity(0.04),
                ]
              : [
                  AppColors.black.withOpacity(0.04),
                  AppColors.black.withOpacity(0.02),
                ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? AppColors.white.withOpacity(0.12)
              : AppColors.black.withOpacity(0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withOpacity(0.2)
                : AppColors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const ThemeToggle(isCompact: true),
    );
  }
}
