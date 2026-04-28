import 'package:shared_preferences/shared_preferences.dart';

import 'theme_local_datasource.dart';

/// Persists theme mode preference for [portfolio_theme_mode] ([ThemeLocalDataSourceImpl] style).
class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  ThemeLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _prefs = sharedPreferences;

  final SharedPreferences _prefs;

  static const String _key = 'portfolio_theme_mode';

  @override
  String? readThemeModeRawSync() => _prefs.getString(_key);

  @override
  Future<void> writeThemeModeRaw(String value) => _prefs.setString(_key, value);
}
