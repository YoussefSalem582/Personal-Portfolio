import 'package:flutter/material.dart';

/// Model for expertise/service items
class Expertise {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color? iconColor;

  const Expertise({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.iconColor,
  });
}
