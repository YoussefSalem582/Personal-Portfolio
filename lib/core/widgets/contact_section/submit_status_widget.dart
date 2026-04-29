import 'package:flutter/material.dart';
import '../../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// A widget that displays form submission status messages.
///
/// This widget shows either a success or error message after form submission.
/// Use [isError] so styling stays correct for all locales (do not rely on
/// English keywords in [statusMessage]).
class SubmitStatusWidget extends StatelessWidget {
  /// The status message to display (success or error message)
  final String statusMessage;
  final bool isError;

  const SubmitStatusWidget({
    super.key,
    required this.statusMessage,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isError
              ? [
                  AppColors.errorLight.withOpacity(0.15),
                  AppColors.errorLight.withOpacity(0.08),
                ]
              : [
                  AppColors.successLight.withOpacity(0.15),
                  AppColors.successLight.withOpacity(0.08),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: isError
              ? AppColors.errorLight.withOpacity(0.3)
              : AppColors.successLight.withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isError
                ? AppColors.errorLight.withOpacity(0.1)
                : AppColors.successLight.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon container with background
          Container(
            padding: const EdgeInsets.all(AppTheme.spacingS),
            decoration: BoxDecoration(
              color: isError
                  ? AppColors.errorLight.withOpacity(0.2)
                  : AppColors.successLight.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              boxShadow: [
                BoxShadow(
                  color: isError
                      ? AppColors.errorLight.withOpacity(0.2)
                      : AppColors.successLight.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              isError ? AppIcons.error : AppIcons.success,
              color: isError ? AppColors.errorLight : AppColors.successLight,
              size: 24,
            ),
          ),
          const SizedBox(width: AppTheme.spacingM),
          // Status message text
          Expanded(
            child: Text(
              statusMessage,
              style: AppFonts.bodyMedium().copyWith(
                color: isError ? AppColors.errorLight : AppColors.successLight,
                fontWeight: AppFonts.semiBold,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
