import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

/// Skills Section Header Widget
/// Displays the title and description for the skills section
class SkillsSectionHeader extends StatelessWidget {
  final bool isDark;
  final bool isMobile;

  const SkillsSectionHeader({
    super.key,
    required this.isDark,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          'My Tech Stack',
          style: isMobile
              ? AppFonts.h3(color: AppColors.getTextPrimary(isDark))
              : AppFonts.h2(color: AppColors.getTextPrimary(isDark)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        // Description
        Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Text(
            'A collection of technologies I am proficient in and enjoy working with.',
            style:
                AppFonts.bodyLarge(color: AppColors.getTextSecondary(isDark)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
