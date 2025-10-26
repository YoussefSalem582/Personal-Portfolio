import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/assets/app_constants.dart';
import '../../utils/data/expertise_data.dart';
import '../../models/expertise.dart';

class ExpertiseSection extends StatelessWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 50 : 80,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.surfaceDark,
                  AppColors.cardDark.withOpacity(0.5),
                ],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.surfaceLight,
                  AppColors.gray50,
                ],
              ),
      ),
      child: Column(
        children: [
          // Section Header
          _buildSectionHeader(context, isDark, isMobile),
          SizedBox(height: isMobile ? 32 : 48),

          // Expertise Cards
          _buildExpertiseGrid(context, isDark, isMobile, isTablet),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDark, bool isMobile) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: isDark
                ? [AppColors.primaryLight, AppColors.accentLight]
                : [AppColors.accentLight, AppColors.primaryLight],
          ).createShader(bounds),
          child: Text(
            'My Expertise',
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: AppFonts.extraBold,
              letterSpacing: -1,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            'Combining cutting-edge technology with innovative solutions',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildExpertiseGrid(
      BuildContext context, bool isDark, bool isMobile, bool isTablet) {
    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    final maxWidth = isMobile ? double.infinity : 1200.0;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: AnimationLimiter(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: isMobile ? 16 : 20,
              mainAxisSpacing: isMobile ? 16 : 20,
              childAspectRatio: isMobile ? 1.8 : (isTablet ? 1.25 : 1.45),
            ),
            itemCount: ExpertiseData.expertiseList.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 600),
                columnCount: crossAxisCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: _buildExpertiseCard(
                      context,
                      ExpertiseData.expertiseList[index],
                      isDark,
                      isMobile,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildExpertiseCard(
      BuildContext context, Expertise expertise, bool isDark, bool isMobile) {
    final accentColor = expertise.iconColor ?? AppColors.accentLight;

    return Container(
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.cardDark,
                  AppColors.cardDark.withOpacity(0.8),
                ],
              )
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.white,
                  AppColors.gray50.withOpacity(0.5),
                ],
              ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? accentColor.withOpacity(0.2)
              : accentColor.withOpacity(0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.black.withOpacity(0.3)
                : accentColor.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: () {},
            hoverColor: accentColor.withOpacity(0.05),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 16 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Icon with gradient background
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          accentColor.withOpacity(0.15),
                          accentColor.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: accentColor.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: expertise.icon is String
                        ? SvgPicture.asset(
                            expertise.icon,
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              accentColor,
                              BlendMode.srcIn,
                            ),
                          )
                        : Icon(
                            expertise.icon,
                            size: 24,
                            color: accentColor,
                          ),
                  ),
                  const SizedBox(height: 12),

                  // Title
                  Text(
                    expertise.title,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 17,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      height: 1.3,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Description - Full text shown
                  Text(
                    expertise.description,
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 13.5,
                      color: isDark
                          ? AppColors.textSecondaryDark.withOpacity(0.85)
                          : AppColors.textSecondaryLight
                              .withOpacity(0.85),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
