/// Arabic labels for [SkillCategory.id] (skill item names stay technical).
class SkillsCategoryAr {
  SkillsCategoryAr._();

  static const Map<String, String> _byId = {
    'languages': 'اللغات',
    'mobile-development': 'الأطر والمكتبات',
    'backend-cloud': 'متنوعات',
  };

  static String? forId(String id) => _byId[id];
}
