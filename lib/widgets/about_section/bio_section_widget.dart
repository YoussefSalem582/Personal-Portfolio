import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../utils/data/portfolio_data.dart';
import 'contact_info_list_widget.dart';

/// Widget displaying the biographical information section.
///
/// This widget shows:
/// - "Who I Am" heading
/// - Main bio text from portfolio data
/// - Additional descriptive text about specialization
/// - Contact information list
///
/// Used in both mobile and desktop layouts of the about section.
class BioSectionWidget extends StatelessWidget {
  const BioSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section heading
        Text('Who I Am', style: AppTheme.headingMedium),

        const SizedBox(height: AppTheme.spacingL),

        // Main bio text from portfolio data
        Text(PortfolioData.bio, style: AppTheme.bodyLarge),

        const SizedBox(height: AppTheme.spacingL),

        // Additional descriptive text (italic style)
        Text(
          'I specialize in creating beautiful, performant applications that provide excellent user experiences. '
          'My passion lies in solving complex problems through code and bringing innovative ideas to life.',
          style: AppTheme.bodyLarge.copyWith(fontStyle: FontStyle.italic),
        ),

        const SizedBox(height: AppTheme.spacingXL),

        // Contact information list
        const ContactInfoListWidget(),
      ],
    );
  }
}
