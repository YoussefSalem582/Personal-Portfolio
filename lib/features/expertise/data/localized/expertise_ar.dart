/// Arabic expertise cards by [Expertise.id].
class ArExpertiseCopy {
  const ArExpertiseCopy({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
}

class ExpertiseAr {
  ExpertiseAr._();

  static const Map<String, ArExpertiseCopy> _byId = {
    'ui-ux-design': ArExpertiseCopy(
      title: 'تصميم وتنفيذ واجهات المستخدم',
      description:
          'تصميم واجهات جميلة وسهلة الاستخدام مع ويدجات Flutter وحركات مخصصة وتخطيطات متجاوبة عبر أحجام الشاشات.',
    ),
    'app-design': ArExpertiseCopy(
      title: 'تصميم تطبيقات الجوال',
      description:
          'بناء تطبيقات جوال حديثة بمبادئ تصميم نظيفة و Material Design وواجهات على طراز iOS باستخدام مكتبة ويدجات Flutter.',
    ),
    'flutter-basics': ArExpertiseCopy(
      title: 'تطوير Flutter',
      description:
          'تطوير تطبيقات متعددة المنصات بـ Flutter وDart مع تركيز على بنية كود نظيفة وأفضل الممارسات قابلة للصيانة.',
    ),
    'state-management': ArExpertiseCopy(
      title: 'إدارة الحالة',
      description:
          'إدارة حالة التطبيق بكفاءة باستخدام GetX وProvider وحلول أخرى للحفاظ على الاستجابة ومزامنة البيانات بين الشاشات.',
    ),
    'firebase-integration': ArExpertiseCopy(
      title: 'تكامل Firebase',
      description:
          'دمج خدمات Firebase: المصادقة وFirestore والتخزين السحابي والإشعارات الفورية لبناء تطبيقات غنية بالميزات.',
    ),
    'api-integration': ArExpertiseCopy(
      title: 'تكامل واجهات REST',
      description:
          'ربط التطبيقات بـ REST APIs ومعالجة HTTP وتحليل JSON وعرض محتوى ديناميكي من الخادم.',
    ),
  };

  static ArExpertiseCopy? forId(String id) => _byId[id];
}
