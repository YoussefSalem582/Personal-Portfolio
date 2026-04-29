import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/assets/app_constants.dart';
import '../../../utils/data/portfolio_data.dart';
import '../../../utils/responsive_helper.dart';
import '../common/theme_toggle_button_container.dart';

class MobileAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function(int) onItemSelected;

  const MobileAppBar({
    super.key,
    required this.onItemSelected,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<MobileAppBar> createState() => _MobileAppBarState();
}

class _MobileAppBarState extends State<MobileAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
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
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        toolbarHeight: kToolbarHeight,
        flexibleSpace: Container(
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
        ),
        leading: Builder(
          builder: (context) => _MenuButton(
            isDark: isDark,
            isSmallMobile: isSmallMobile,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: _AppBarTitle(
          isDark: isDark,
          isSmallMobile: isSmallMobile,
          onItemSelected: widget.onItemSelected,
        ),
        centerTitle: true,
        actions: [
          ThemeToggleButtonContainer(
            isDark: isDark,
            margin: EdgeInsets.only(
              right: isSmallMobile ? 6 : 8,
              top: isSmallMobile ? 6 : 8,
              bottom: isSmallMobile ? 6 : 8,
            ),
            padding: EdgeInsets.all(isSmallMobile ? 3 : 4),
          ),
        ],
      ),
    );
  }
}

// Menu Button Widget with ripple effect
class _MenuButton extends StatefulWidget {
  final bool isDark;
  final bool isSmallMobile;
  final VoidCallback onPressed;

  const _MenuButton({
    required this.isDark,
    required this.isSmallMobile,
    required this.onPressed,
  });

  @override
  State<_MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<_MenuButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context).tooltipOpenNavigationMenu,
      child: GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: EdgeInsets.all(widget.isSmallMobile ? 6 : 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.isDark
                ? [
                    AppColors.accentDark.withOpacity(_isPressed ? 0.3 : 0.2),
                    AppColors.accentDark.withOpacity(_isPressed ? 0.2 : 0.1),
                  ]
                : [
                    AppColors.accentLight.withOpacity(_isPressed ? 0.2 : 0.15),
                    AppColors.accentLight.withOpacity(_isPressed ? 0.1 : 0.05),
                  ],
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: widget.isDark
                ? AppColors.accentDark.withOpacity(_isPressed ? 0.5 : 0.3)
                : AppColors.accentLight.withOpacity(_isPressed ? 0.3 : 0.2),
            width: _isPressed ? 1.5 : 1,
          ),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: (widget.isDark
                            ? AppColors.accentDark
                            : AppColors.accentLight)
                        .withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Center(
          child: Icon(
            AppIcons.menu,
            size: widget.isSmallMobile ? 20 : 22,
            color: widget.isDark ? AppColors.accentDark : AppColors.accentLight,
          ),
        ),
      ),
    ),
    );
  }
}

// App Bar Title Widget
class _AppBarTitle extends StatelessWidget {
  final bool isDark;
  final bool isSmallMobile;
  final Function(int) onItemSelected;

  const _AppBarTitle({
    required this.isDark,
    required this.isSmallMobile,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo with subtle animation - Opens image on click
        Tooltip(
          message: l10n.tooltipViewFullLogo,
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 400, maxHeight: 400),
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
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: (isDark
                              ? AppColors.accentDark
                              : AppColors.accentLight)
                          .withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    AppImages.portfolioLogo,
                    width: isSmallMobile ? 30 : 32,
                    height: isSmallMobile ? 30 : 32,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: isSmallMobile ? 30 : 32,
                        height: isSmallMobile ? 30 : 32,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isDark
                                ? [
                                    AppColors.accentDark,
                                    AppColors.accentDark.withOpacity(0.7)
                                  ]
                                : [
                                    AppColors.accentLight,
                                    AppColors.accentLight.withOpacity(0.8)
                                  ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppIcons.flutterIconSvg,
                            width: isSmallMobile ? 16 : 18,
                            height: isSmallMobile ? 16 : 18,
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
        ),
        SizedBox(width: isSmallMobile ? 8 : 10),
        // Name with gradient - Navigates to top on click
        Flexible(
          child: GestureDetector(
            onTap: () => onItemSelected(0),
            behavior: HitTestBehavior.opaque,
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: isDark
                    ? [AppColors.accentDark, AppColors.white]
                    : [AppColors.primaryLight, AppColors.accentLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                PortfolioData.fullName,
                style: AppFonts.h5().copyWith(
                  color: AppColors.white,
                  fontWeight: AppFonts.bold,
                  fontSize: isSmallMobile ? 16 : 18,
                  letterSpacing: -0.3,
                  height: 1.2,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
