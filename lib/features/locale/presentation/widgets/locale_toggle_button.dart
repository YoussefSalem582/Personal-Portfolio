import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/assets/app_constants.dart';
import '../bloc/locale_bloc.dart';
import '../bloc/locale_event.dart';
import '../bloc/locale_state.dart';

/// Toggles between English and Arabic (persists via [LocaleBloc]).
class LocaleToggleButton extends StatelessWidget {
  final bool isDark;
  final bool isCompact;

  const LocaleToggleButton({
    super.key,
    required this.isDark,
    this.isCompact = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleUiState>(
      builder: (context, state) {
        final isArabic = state.locale.languageCode == 'ar';
        final l10n = AppLocalizations.of(context);
        return IconButton(
          onPressed: () =>
              context.read<LocaleBloc>().add(const LocaleToggled()),
          tooltip:
              isArabic ? l10n.tooltipSwitchToEnglish : l10n.tooltipSwitchToArabic,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: isCompact ? 32 : 40,
            minHeight: isCompact ? 32 : 40,
          ),
          icon: Text(
            isArabic ? 'EN' : 'عربي',
            style: AppFonts.labelMedium(
              color: isDark ? AppColors.accentDark : AppColors.accentLight,
            ).copyWith(
              fontWeight: AppFonts.semiBold,
              fontSize: isCompact ? 12 : 13,
            ),
          ),
        );
      },
    );
  }
}
