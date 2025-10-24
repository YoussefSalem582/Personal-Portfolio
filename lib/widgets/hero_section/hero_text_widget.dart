import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../../utils/responsive_helper.dart';

class HeroTextWidget extends StatelessWidget {
  const HeroTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Greeting with decorative line
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            Container(
              width: 40,
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isDark ? AppColors.accentDark : AppColors.accentLight,
                    (isDark ? AppColors.accentDark : AppColors.accentLight)
                        .withValues(alpha: 0.3),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: AppTheme.spacingS),
            Text(
              'Hello, I\'m',
              style: AppFonts.bodyLarge().copyWith(
                color: isDark ? AppColors.accentDark : AppColors.accentLight,
                fontWeight: AppFonts.semiBold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),

        const SizedBox(height: AppTheme.spacingM),

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
          decoration: BoxDecoration(
            color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                .withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: (isDark ? AppColors.accentDark : AppColors.accentLight)
                  .withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppIcons.flutterIconSvg,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isDark ? AppColors.accentDark : AppColors.accentLight,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                'A ',
                style: AppFonts.h4().copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  fontWeight: AppFonts.medium,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter Developer',
                    textStyle: AppFonts.h4().copyWith(
                      color:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      fontWeight: AppFonts.semiBold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Mobile App Developer',
                    textStyle: AppFonts.h4().copyWith(
                      color:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      fontWeight: AppFonts.semiBold,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'AI Enthusiast',
                    textStyle: AppFonts.h4().copyWith(
                      color:
                          isDark ? AppColors.accentDark : AppColors.accentLight,
                      fontWeight: AppFonts.semiBold,
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
            PortfolioData.bio,
            style: AppFonts.bodyLarge().copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              height: 1.8,
              fontSize: 17,
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
