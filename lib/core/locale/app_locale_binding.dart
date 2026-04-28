import 'package:flutter/material.dart';

/// Holds the active [Locale] synchronously so [AppFonts] can pick Tajawal vs Google Fonts
/// without a [BuildContext]. Updated from [LocaleBloc] before each [MaterialApp] build.
class AppLocaleBinding {
  AppLocaleBinding._();

  static Locale _locale = const Locale('en');

  static Locale get locale => _locale;

  static bool get isArabic => _locale.languageCode == 'ar';

  static void update(Locale locale) {
    _locale = locale;
  }
}
