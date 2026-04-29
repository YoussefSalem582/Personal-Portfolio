import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/assets/app_constants.dart';
import '../../../utils/url_helper.dart';
import 'package:youssef_hassan_portfolio/features/hero/data/local/personal_info_data.dart';
import '../../../features/locale/presentation/bloc/locale_bloc.dart';
import '../../../features/locale/presentation/bloc/locale_event.dart';
import '../../../features/locale/presentation/bloc/locale_state.dart';
import '../../../features/theme/presentation/widgets/theme_toggle.dart';
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
    final l10n = AppLocalizations.of(context);

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
                          PersonalInfoData.fullName,
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
                  ..._buildNavigationItems(context, true),

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
                          AppLocalizations.of(context).drawerTheme,
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

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: BlocBuilder<LocaleBloc, LocaleUiState>(
                      builder: (context, localeState) {
                        final isAr = localeState.locale.languageCode == 'ar';
                        final l10n = AppLocalizations.of(context);
                        return Container(
                          decoration: BoxDecoration(
                            color:
                                isDark ? AppColors.gray800 : AppColors.gray100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? AppColors.gray700
                                    : AppColors.gray200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.language_rounded,
                                color: AppColors.getTextSecondary(isDark),
                                size: 20,
                              ),
                            ),
                            title: Text(
                              l10n.tooltipLanguage,
                              style: AppFonts.bodyMedium(
                                color: AppColors.getTextPrimary(isDark),
                              ),
                            ),
                            trailing: Text(
                              isAr ? 'EN' : 'عربي',
                              style: AppFonts.labelLarge(
                                color: isDark
                                    ? AppColors.accentDark
                                    : AppColors.accentLight,
                              ),
                            ),
                            onTap: () => context
                                .read<LocaleBloc>()
                                .add(const LocaleToggled()),
                          ),
                        );
                      },
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
                                AppLocalizations.of(context).footerViewResume,
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

  List<Widget> _buildNavigationItems(BuildContext context, bool isVertical) {
    final l10n = AppLocalizations.of(context);
    final items = [
      NavigationItem(
        title: l10n.navHome,
        index: 0,
        isSelected: currentIndex == 0,
        onTap: () => onItemSelected(0),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: l10n.navAbout,
        index: 1,
        isSelected: currentIndex == 1,
        onTap: () => onItemSelected(1),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: l10n.navSkills,
        index: 2,
        isSelected: currentIndex == 2,
        onTap: () => onItemSelected(2),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: l10n.navExpertise,
        index: 3,
        isSelected: currentIndex == 3,
        onTap: () => onItemSelected(3),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: l10n.navProjects,
        index: 4,
        isSelected: currentIndex == 4,
        onTap: () => onItemSelected(4),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: l10n.navCertificates,
        index: 5,
        isSelected: currentIndex == 5,
        onTap: () => onItemSelected(5),
        isVertical: isVertical,
      ),
      NavigationItem(
        title: l10n.navContact,
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
      await UrlHelper.openFile(PersonalInfoData.resumeUrl);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).resumeOpening),
            backgroundColor: AppColors.successLight,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).resumeOpenErrorRetry),
            backgroundColor: AppColors.errorLight,
          ),
        );
      }
    }
  }
}
