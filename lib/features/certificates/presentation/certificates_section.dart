import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../l10n/app_localizations.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/assets/app_constants.dart';
import '../../../utils/responsive_helper.dart';
import '../../../core/widgets/certificates_section/certificates_grid.dart';
import '../../../core/widgets/certificates_section/certificates_section_header.dart';
import '../../../core/widgets/custom_show_more_button.dart';
import 'bloc/certificates_bloc.dart';
import 'bloc/certificates_state.dart';

/// Certificates section with card grid and show-more.
class CertificatesSection extends StatefulWidget {
  const CertificatesSection({super.key});

  @override
  State<CertificatesSection> createState() => _CertificatesSectionState();
}

class _CertificatesSectionState extends State<CertificatesSection> {
  int _displayCount = 3;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(screenWidth);

    return BlocBuilder<CertificatesBloc, CertificatesState>(
      builder: (context, state) {
        if (state is CertificatesFailure) {
          return Center(child: Text(state.message));
        }
        if (state is! CertificatesLoaded) {
          return const Center(child: CircularProgressIndicator());
        }
        final all = state.content.certificates;
        final safeCount = _displayCount.clamp(0, all.length);
        final certificatesToShow = all.take(safeCount).toList();
        final hasMore = safeCount < all.length;

        return Container(
          width: double.infinity,
          color: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
          padding: EdgeInsets.symmetric(
            vertical: ResponsiveHelper.getSectionSpacing(screenWidth) * 0.8,
            horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.getMaxWidth(screenWidth),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CertificatesSectionHeader(),
                SizedBox(
                    height:
                        isMobile ? AppTheme.spacingXL : AppTheme.spacingXXL),
                CertificatesGrid(
                  certificates: certificatesToShow,
                  screenWidth: screenWidth,
                ),
                if (hasMore) ...[
                  const SizedBox(height: AppTheme.spacingXL),
                  CustomShowMoreButton(
                    label: l10n.showMore,
                    onPressed: () {
                      setState(() {
                        _displayCount =
                            (_displayCount + 3).clamp(0, all.length);
                      });
                    },
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
