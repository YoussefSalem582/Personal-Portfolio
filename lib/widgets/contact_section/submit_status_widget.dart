import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// A widget that displays form submission status messages.
///
/// This widget shows either a success or error message after form submission.
/// The styling (color, icon) automatically adjusts based on whether the
/// message indicates an error or success. Errors are detected by checking
/// if the message contains the word "Error".
class SubmitStatusWidget extends StatelessWidget {
  /// The status message to display (success or error message)
  final String statusMessage;

  const SubmitStatusWidget({
    super.key,
    required this.statusMessage,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if this is an error message by checking for "Error" keyword
    final isError = statusMessage.contains('Error');

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(AppTheme.spacingL),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isError
              ? [
                  AppColors.errorLight.withValues(alpha: 0.15),
                  AppColors.errorLight.withValues(alpha: 0.08),
                ]
              : [
                  AppColors.successLight.withValues(alpha: 0.15),
                  AppColors.successLight.withValues(alpha: 0.08),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusM),
        border: Border.all(
          color: isError
              ? AppColors.errorLight.withValues(alpha: 0.3)
              : AppColors.successLight.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isError
                ? AppColors.errorLight.withValues(alpha: 0.1)
                : AppColors.successLight.withValues(alpha: 0.1),
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
                  ? AppColors.errorLight.withValues(alpha: 0.2)
                  : AppColors.successLight.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppTheme.radiusS),
              boxShadow: [
                BoxShadow(
                  color: isError
                      ? AppColors.errorLight.withValues(alpha: 0.2)
                      : AppColors.successLight.withValues(alpha: 0.2),
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
