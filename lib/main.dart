import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PersonalPortfolioApp(),
    ),
  );
}
