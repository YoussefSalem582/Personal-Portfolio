import 'package:flutter/material.dart';

/// Model for expertise/service items
class Expertise {
  final String id;
  final String title;
  final String description;
  final dynamic icon; // Can be IconData or String (SVG path)
  final Color? iconColor;

  const Expertise({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.iconColor,
  });
}
