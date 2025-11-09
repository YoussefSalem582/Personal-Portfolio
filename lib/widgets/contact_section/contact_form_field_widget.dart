import 'package:flutter/material.dart';
import '../common/styled_text_field.dart';

/// A reusable, styled text form field widget for contact forms.
///
/// This widget provides a consistent design for form inputs.
/// Now uses the common StyledTextField component.
class ContactFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
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
    return StyledTextField(
      controller: controller,
      label: label,
      hint: hint,
      icon: icon,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
    );
  }
}
