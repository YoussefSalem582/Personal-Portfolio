import 'package:flutter/material.dart';
import '../common/interactive_list_item.dart';

/// A single contact information item widget.
///
/// Now uses the common InteractiveListItem component.
/// Displays an icon, label, and value in a consistent format with hover effects.
class ContactInfoItemWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const ContactInfoItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveListItem(
      icon: icon,
      label: label,
      value: value,
      onTap: onTap,
    );
  }
}
