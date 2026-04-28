import '../../../core/locale/app_locale_binding.dart';
import '../personal_info_data.dart';
import 'personal_ar.dart';

/// Locale-aware strings for personal headline fields used outside [AppLocalizations].
class PortfolioStrings {
  PortfolioStrings._();

  static bool get _ar => AppLocaleBinding.isArabic;

  static String get title =>
      _ar ? PersonalInfoAr.title : PersonalInfoData.title;

  static String get subtitle =>
      _ar ? PersonalInfoAr.subtitle : PersonalInfoData.subtitle;

  static String get bio => _ar ? PersonalInfoAr.bio : PersonalInfoData.bio;

  static String get locationDisplay =>
      _ar ? PersonalInfoAr.location : PersonalInfoData.location;
}
