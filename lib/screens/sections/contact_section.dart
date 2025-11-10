import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/responsive_helper.dart';
import '../../widgets/contact_section/contact_info_widget.dart';
import '../../widgets/contact_section/contact_form_widget.dart';

import '../../theme/app_theme.dart';

/// The contact section of the portfolio displaying contact information and form.
///
/// This section provides two main components:
/// 1. ContactInfoWidget - Shows email, phone, location, and social media links
/// 2. ContactFormWidget - A form for visitors to send messages directly
///
/// The layout is responsive:
/// - Desktop: Side-by-side layout (info: 33%, form: 67%)
/// - Mobile: Stacked layout (info above form)
///
/// Features staggered animations for smooth entry effects.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions and responsive settings
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      // Light background tint in light mode, dark background in dark mode
      color: isDark
          ? AppColors.backgroundDark
          : AppColors.primaryLight.withValues(alpha: 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: ResponsiveHelper.getSectionSpacing(screenWidth) * 0.8,
      ),
      child: ConstrainedBox(
        // Constrain max width for better readability on large screens
        constraints: BoxConstraints(
          maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
        ),
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // Apply staggered animations to all children
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                // Main section heading
                Text(
                  'Get In Touch',
                  style: (isDark ? AppFonts.h1() : AppFonts.h1()).copyWith(
                    fontSize: isMobile
                        ? (isSmallMobile ? 28 : 32)
                        : ResponsiveHelper.getHeadingSize(screenWidth,
                            isLarge: false),
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: isMobile ? 8 : AppTheme.spacingS),

                // Decorative gradient underline
                Container(
                  width: isSmallMobile ? 45 : (isMobile ? 55 : 80),
                  height: isSmallMobile ? 3 : 4,
                  decoration: BoxDecoration(
                    gradient: isDark
                        ? AppColors.primaryGradientDark
                        : AppColors.primaryGradientLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                SizedBox(height: isMobile ? 10 : AppTheme.spacingM),

                // Section subtitle/description
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 16 : 0,
                  ),
                  child: Text(
                    'Let\'s discuss your next project or collaboration opportunity',
                    style:
                        (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
                            .copyWith(
                      fontSize: isMobile
                          ? (isSmallMobile ? 13 : 14)
                          : ResponsiveHelper.getBodySize(screenWidth,
                              isLarge: true),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                    height: isMobile
                        ? AppTheme.spacingL
                        : AppTheme.spacingXL * 1.5),

                // Contact content - responsive layout
                // Mobile: Stack vertically (info above form)
                if (isMobile)
                  const Column(
                    children: [
                      ContactInfoWidget(),
                      SizedBox(height: AppTheme.spacingXL),
                      ContactFormWidget(),
                    ],
                  )
                // Desktop: Display side by side (info 33% | form 67%)
                else
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Contact info on the left (1/3 width)
                      Expanded(flex: 1, child: ContactInfoWidget()),
                      SizedBox(width: AppTheme.spacingXXL),
                      // Contact form on the right (2/3 width)
                      Expanded(flex: 2, child: ContactFormWidget()),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
