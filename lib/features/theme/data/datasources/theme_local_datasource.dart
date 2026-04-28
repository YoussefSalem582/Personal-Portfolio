/// Key–value persistence for appearance ([ThemeLocalDataSource] analogue).
abstract class ThemeLocalDataSource {
  String? readThemeModeRawSync();

  Future<void> writeThemeModeRaw(String value);
}
