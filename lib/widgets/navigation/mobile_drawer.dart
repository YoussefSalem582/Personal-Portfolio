import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/url_helper.dart';
import '../../utils/data/portfolio_data.dart';
import '../theme_toggle.dart';
import 'navigation_item.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) onItemSelected;
  final int currentIndex;

  const MobileDrawer({
    super.key,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      backgroundColor: AppColors.getBackground(isDark),
      child: Container(
        color: AppColors.getBackground(isDark),
        child: Column(
          children: [
            // Simple Header with Dark Gradient
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.getPrimaryGradient(isDark),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo - Opens image on click
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              backgroundColor: Colors.transparent,
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      maxWidth: 500, maxHeight: 500),
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
                        behavior: HitTestBehavior.opaque,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            AppImages.portfolioLogo,
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.white.withOpacity(0.24),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SvgPicture.asset(
                                  AppIcons.flutterIconSvg,
                                  width: 32,
                                  height: 32,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Name - Navigates to top on click
                      GestureDetector(
                        onTap: () {
                          onItemSelected(0); // Navigate to home first
                          Navigator.of(context).pop(); // Then close drawer
                        },
                        behavior: HitTestBehavior.opaque,
                        child: Text(
                          PortfolioData.fullName,
                          style: AppFonts.h4(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Navigation items
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                children: [
                  ..._buildNavigationItems(true),

                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Divider(
                      color: isDark ? AppColors.gray800 : AppColors.gray200,
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Theme toggle - simple card
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.gray800 : AppColors.gray100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color:
                                isDark ? AppColors.gray700 : AppColors.gray200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.brightness_6_rounded,
                            color: AppColors.getTextSecondary(isDark),
                            size: 20,
                          ),
                        ),
                        title: Text(
                          'Theme',
                          style: AppFonts.bodyMedium(
                            color: AppColors.getTextPrimary(isDark),
                          ),
                        ),
                        trailing: const ThemeToggleSwitch(),
                        onTap: () {},
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // View Resume - gray/neutral button
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Material(
                      color: AppColors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Navigator.of(context).pop();
                          _openResume(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.getAccentGradient(isDark),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                AppIcons.blog,
                                color: AppColors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'View Resume',
                                style: AppFonts.button(
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                AppIcons.arrowRight,
                                color: AppColors.white,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
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

    return items;
  }

  void _openResume(BuildContext context) async {
    try {
      await UrlHelper.openFile(PortfolioData.resumeUrl);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Opening resume...'),
            backgroundColor: AppColors.successLight,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error opening resume. Please try again.'),
            backgroundColor: AppColors.errorLight,
          ),
        );
      }
    }
  }
}
