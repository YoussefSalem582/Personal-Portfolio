abstract class LocaleLocalDataSource {
  String? readLanguageCodeSync();

  Future<void> writeLanguageCode(String value);
}
