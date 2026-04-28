import 'package:shared_preferences/shared_preferences.dart';

import 'locale_local_datasource.dart';

class LocaleLocalDataSourceImpl implements LocaleLocalDataSource {
  LocaleLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _prefs = sharedPreferences;

  final SharedPreferences _prefs;

  static const String _key = 'portfolio_language_code';

  @override
  String? readLanguageCodeSync() => _prefs.getString(_key);

  @override
  Future<void> writeLanguageCode(String value) => _prefs.setString(_key, value);
}
