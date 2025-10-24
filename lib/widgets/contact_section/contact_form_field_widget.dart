import 'package:flutter/material.dart';
import '../../utils/assets/app_constants.dart';

import '../../theme/app_theme.dart';

/// A reusable, styled text form field widget for contact forms.
///
/// This widget provides a consistent design for form inputs with:
/// - Theme-aware styling (dark/light mode)
/// - Icon prefix
/// - Label and hint text
/// - Validation support
/// - Customizable keyboard type and line count
/// - Focused, enabled, and error border states
class ContactFormFieldWidget extends StatelessWidget {
  /// Controller for managing the text field's content
  final TextEditingController controller;

  /// The label text displayed above the field
  final String label;

  /// Placeholder text shown when field is empty
  final String hint;

  /// Icon displayed at the start of the field
  final IconData icon;

  /// Keyboard type for the input (e.g., email, phone)
  final TextInputType? keyboardType;

  /// Maximum number of lines for the input (1 for single line, >1 for textarea)
  final int maxLines;

  /// Validation function that returns error message or null if valid
  final String? Function(String?)? validator;

  const ContactFormFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // Get theme-specific colors for styling
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.accentDark : AppColors.accentLight;
    final textSecondary =
        isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
    final fillColor = isDark ? AppColors.surfaceDark : AppColors.surfaceLight;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: TextStyle(
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: textSecondary),
        hintStyle: TextStyle(color: textSecondary.withValues(alpha: 0.6)),
        prefixIcon: Icon(icon, color: accentColor),
        // Default border style
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(
            color: textSecondary.withValues(alpha: 0.3),
          ),
        ),
        // Border when field is focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(color: accentColor, width: 2),
        ),
        // Border when field is enabled but not focused
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(
            color: textSecondary.withValues(alpha: 0.3),
          ),
        ),
        // Border when field has validation error
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: const BorderSide(color: AppColors.errorLight),
        ),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }
}
