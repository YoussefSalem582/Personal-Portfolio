import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../utils/assets/app_constants.dart';
import '../bloc/theme_bloc.dart';
import '../bloc/theme_event.dart';
import '../bloc/theme_state.dart';

class ThemeToggle extends StatelessWidget {
  final bool isCompact;

  const ThemeToggle({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeUiState>(
      builder: (context, state) {
        final isDark = context.read<ThemeBloc>().isDarkModeEffective(context);
        final l10n = AppLocalizations.of(context);

        return IconButton(
          icon: Icon(
            isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            size: isCompact ? 20 : 22,
          ),
          color: isDark ? AppColors.accentDark : AppColors.accentLight,
          onPressed: () => context.read<ThemeBloc>().add(
                ThemeToggleSubmitted(
                  ambientBrightness: Theme.of(context).brightness,
                ),
              ),
          tooltip: isDark ? l10n.tooltipLightMode : l10n.tooltipDarkMode,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(
            minWidth: isCompact ? 32 : 40,
            minHeight: isCompact ? 32 : 40,
          ),
        );
      },
    );
  }
}

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeUiState>(
      builder: (context, state) {
        final isDark =
            context.read<ThemeBloc>().isDarkModeEffective(context);

        return Container(
          width: 56,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: isDark
                ? AppColors.accentDark
                : AppColors.accentLight.withOpacity(0.3),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left: isDark ? 30 : 2,
                top: 2,
                child: GestureDetector(
                  onTap: () => context.read<ThemeBloc>().add(
                        ThemeToggleSubmitted(
                          ambientBrightness: Theme.of(context).brightness,
                        ),
                      ),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.surfaceDark
                          : AppColors.surfaceLight,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Icon(
                      isDark ? AppIcons.darkMode : AppIcons.lightMode,
                      size: 14,
                      color: isDark
                          ? AppColors.accentDark
                          : AppColors.accentLight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
