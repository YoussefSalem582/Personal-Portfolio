import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../utils/data/localized/portfolio_strings.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';

class HeroTextWidget extends StatelessWidget {
  const HeroTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Greeting with decorative line (fixed LTR strip so layout matches design in Arabic)
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
            children: [
            Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isDark ? AppColors.accentDark : AppColors.accentLight,
                    (isDark ? AppColors.accentDark : AppColors.accentLight)
                        .withOpacity(0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: AppTheme.spacingS),
            Text(
              l10n.heroGreeting,
              style: AppFonts.bodyLarge().copyWith(
                color: isDark ? AppColors.accentDark : AppColors.accentLight,
                fontWeight: AppFonts.semiBold,
                letterSpacing: 1.2,
                fontSize: isMobile ? 20 : 26,
              ),
            ),
          ],
          ),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Name with gradient effect
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              isDark ? AppColors.accentDark : AppColors.accentLight,
            ],
          ).createShader(bounds),
          child: Text(
            PortfolioData.fullName,
            style: AppFonts.h1(
              color: AppColors.white,
            ).copyWith(
              fontWeight: AppFonts.bold,
              height: 1.2,
              letterSpacing: -0.5,
              fontSize: isMobile ? 52 : 84,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),

        const SizedBox(height: AppTheme.spacingL),

        // Animated role text with better styling
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingS,
          ),
          // decoration: BoxDecoration(
          //   color: (isDark ? AppColors.accentDark : AppColors.accentLight)
          //       .withOpacity(0.1),
          //   borderRadius: BorderRadius.circular(12),
          //   border: Border.all(
          //     color: (isDark ? AppColors.accentDark : AppColors.accentLight)
          //         .withOpacity(0.3),
          //     width: 1,
          //   ),
          // ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    l10n.heroRoleFlutterDeveloper,
                    textStyle: AppFonts.h4().copyWith(
                      color:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      fontWeight: AppFonts.semiBold,
                      fontSize: isMobile ? 24 : 36,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    l10n.heroRoleMobileAppDeveloper,
                    textStyle: AppFonts.h4().copyWith(
                      color:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      fontWeight: AppFonts.semiBold,
                      fontSize: isMobile ? 24 : 36,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    l10n.heroRoleSoftwareEngineer,
                    textStyle: AppFonts.h4().copyWith(
                      color:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      fontWeight: AppFonts.semiBold,
                      fontSize: isMobile ? 24 : 36,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 2000),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Bio with better readability
        Container(
          padding: EdgeInsets.only(
            left: isMobile ? 0 : AppTheme.spacingS,
          ),
          child: Text(
            PortfolioStrings.bio,
            style: AppFonts.bodyLarge().copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              height: 1.8,
              fontSize: isMobile ? 19 : 22,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ),
      ],
    );
  }
}
