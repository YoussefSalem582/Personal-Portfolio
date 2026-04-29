import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/assets/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../core/widgets/contact_section/contact_form_widget.dart';
import '../../../../core/widgets/contact_section/contact_info_widget.dart';
import '../bloc/contact_bloc.dart';
import '../bloc/contact_state.dart';

/// Contact section: info + form, driven by [ContactBloc] from a parent provider.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);
    final isSmallMobile = ResponsiveHelper.isSmallMobile(screenWidth);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          color: isDark
              ? AppColors.backgroundDark
              : AppColors.primaryLight.withOpacity(0.02),
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
            vertical: ResponsiveHelper.getSectionSpacing(screenWidth) * 0.8,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
            ),
            child: AnimationLimiter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    Text(
                      AppLocalizations.of(context).sectionContactTitle,
                      style: (isDark ? AppFonts.h1() : AppFonts.h1()).copyWith(
                        fontSize: isMobile
                            ? (isSmallMobile ? 28 : 32)
                            : ResponsiveHelper.getHeadingSize(screenWidth,
                                isLarge: false),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: isMobile ? 8 : AppTheme.spacingS),
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 0,
                      ),
                      child: Text(
                        AppLocalizations.of(context).sectionContactSubtitle,
                        style: (isDark ? AppFonts.bodyLarge() : AppFonts.bodyLarge())
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
                    if (isMobile)
                      Column(
                        children: [
                          ContactInfoWidget(contactInfo: state.contactInfo),
                          const SizedBox(height: AppTheme.spacingXL),
                          const ContactFormWidget(),
                        ],
                      )
                    else
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child:
                                ContactInfoWidget(contactInfo: state.contactInfo),
                          ),
                          const SizedBox(width: AppTheme.spacingXXL),
                          const Expanded(
                            flex: 2,
                            child: ContactFormWidget(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
