import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import '../../utils/assets/app_constants.dart';
import '../../theme/app_theme.dart';

/// Reusable Styled Text Form Field
/// Consistent input field design across the app
class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool enabled;
  final EdgeInsets? contentPadding;

  const StyledTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
    this.enabled = true,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
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
      enabled: enabled,
      style: TextStyle(
        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: textSecondary),
        hintStyle: TextStyle(color: textSecondary.withOpacity(0.6)),
        prefixIcon: Icon(icon, color: accentColor),
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(
            color: textSecondary.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(color: accentColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(
            color: textSecondary.withOpacity(0.3),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: BorderSide(
            color: textSecondary.withOpacity(0.2),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusS),
          borderSide: const BorderSide(color: AppColors.errorLight),
        ),
        filled: true,
        fillColor: enabled ? fillColor : fillColor.withOpacity(0.5),
      ),
    );
  }
}

/// Email Text Field with validation
class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? customValidator;

  const EmailTextField({
    super.key,
    required this.controller,
    this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return StyledTextField(
      controller: controller,
      label: l10n.contactFieldEmail,
      hint: l10n.contactFieldEmailHint,
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: customValidator ??
          (value) => _defaultEmailValidator(value, l10n),
    );
  }

  String? _defaultEmailValidator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.contactValidationEmailRequired;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return l10n.contactValidationEmailInvalid;
    }
    return null;
  }
}

/// Phone Text Field with validation
class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? customValidator;

  const PhoneTextField({
    super.key,
    required this.controller,
    this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return StyledTextField(
      controller: controller,
      label: l10n.contactFieldPhone,
      hint: l10n.contactFieldPhoneHint,
      icon: Icons.phone_outlined,
      keyboardType: TextInputType.phone,
      validator: customValidator,
    );
  }
}

/// Message Text Field (multiline)
class MessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final int maxLines;
  final String? Function(String?)? customValidator;

  const MessageTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.maxLines = 5,
    this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return StyledTextField(
      controller: controller,
      label: label ?? l10n.contactFieldMessage,
      hint: hint ?? l10n.contactFieldMessageHint,
      icon: Icons.message_outlined,
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      validator: customValidator ??
          (value) => _defaultMessageValidator(value, l10n),
    );
  }

  String? _defaultMessageValidator(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.contactValidationMessageRequired;
    }
    if (value.length < 10) {
      return l10n.contactValidationMessageMinLength;
    }
    return null;
  }
}
