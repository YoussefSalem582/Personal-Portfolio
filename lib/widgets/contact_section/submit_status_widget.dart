import 'package:flutter/material.dart';
import '../../utils/app_constants.dart';

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

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      decoration: BoxDecoration(
        // Background color: light red for errors, light green for success
        color: isError
            ? AppColors.errorLight.withValues(alpha: 0.1)
            : AppColors.successLight.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusS),
      ),
      child: Row(
        children: [
          // Icon: error icon for errors, check circle for success
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: isError ? AppColors.errorLight : AppColors.successLight,
          ),
          const SizedBox(width: AppTheme.spacingM),
          // Status message text
          Expanded(
            child: Text(
              statusMessage,
              style: AppFonts.bodyMedium().copyWith(
                color: isError ? AppColors.errorLight : AppColors.successLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
