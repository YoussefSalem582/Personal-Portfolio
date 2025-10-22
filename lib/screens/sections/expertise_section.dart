import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../theme/app_theme.dart';
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
        vertical: isMobile ? 60 : 100,
        horizontal: isMobile ? 20 : 40,
      ),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.darkSurfaceColor,
                  AppTheme.darkCardColor.withOpacity(0.5),
                ],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.surfaceColor,
                  Colors.grey.shade50,
                ],
              ),
      ),
      child: Column(
        children: [
          // Section Header
          _buildSectionHeader(context, isDark, isMobile),
          SizedBox(height: isMobile ? 40 : 60),

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
                ? [AppTheme.primaryColor, AppTheme.accentColor]
                : [AppTheme.accentColor, AppTheme.primaryColor],
          ).createShader(bounds),
          child: Text(
            'My Expertise',
            style: TextStyle(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              color: Colors.white,
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
              color:
                  isDark ? AppTheme.darkTextSecondary : AppTheme.textSecondary,
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
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.15 : (isTablet ? 0.95 : 0.85),
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
    final accentColor = expertise.iconColor ?? AppTheme.accentColor;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkCardColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            hoverColor: accentColor.withOpacity(0.05),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 20 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      expertise.icon,
                      size: 32,
                      color: accentColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Text(
                    expertise.title,
                    style: TextStyle(
                      fontSize: isMobile ? 18 : 20,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? AppTheme.darkTextPrimary
                          : AppTheme.textPrimary,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Expanded(
                    child: Text(
                      expertise.description,
                      style: TextStyle(
                        fontSize: isMobile ? 14 : 15,
                        color: isDark
                            ? AppTheme.darkTextSecondary
                            : AppTheme.textSecondary,
                        height: 1.6,
                      ),
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
