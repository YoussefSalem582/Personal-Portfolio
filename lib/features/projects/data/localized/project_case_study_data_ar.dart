/// Arabic case-study body copy (challenges, lessons, features, overviews).
/// Mirrors [ProjectCaseStudyData] structure and counts.
library;

class ProjectCaseStudyDataAr {
  ProjectCaseStudyDataAr._();

  static List<Map<String, String>> getProjectChallenges(String projectId) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseChallenges;
      case 'gogesh-marketplace':
        return _gogeshChallenges;
      case 'flutter-mate':
        return _flutterMateChallenges;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Challenges;
      case 'music-player':
        return _musicPlayerChallenges;
      default:
        return _defaultChallenges;
    }
  }

  static List<String> getProjectLessons(String projectId) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseLessons;
      case 'gogesh-marketplace':
        return _gogeshLessons;
      case 'flutter-mate':
        return _flutterMateLessons;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Lessons;
      case 'music-player':
        return _musicPlayerLessons;
      default:
        return _defaultLessons;
    }
  }

  static String getProjectOverviewText(String projectId, String description) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseOverview;
      case 'gogesh-marketplace':
        return _gogeshOverview;
      case 'flutter-mate':
        return _flutterMateOverview;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Overview;
      default:
        return description;
    }
  }

  static List<Map<String, dynamic>>? getProjectFeatures(String projectId) {
    switch (projectId) {
      case 'emosense-app':
        return _emosenseFeatures;
      case 'gogesh-marketplace':
        return _gogeshFeatures;
      case 'flutter-mate':
        return _flutterMateFeatures;
      case 'technology-ninety-two-job-marketplace':
        return _technology92Features;
      default:
        return null;
    }
  }

  // --- EmoSense ---
  static const String _emosenseOverview =
      '🚀 EmoSense منصة مؤسسية متقدمة لالتعرف على المشاعر وتحليل تفاعل العملاء عبر النص والصوت والفيديو. '
      'بُنيت بفصل طبقات واضح وBLoC/Cubit وواجهات لمسؤولي النظام والموظفين، مع لوحات تحليلات ومؤشرات أداء وتقارير.\n\n'
      '🎓 مشروع تخرج من جامعة النيل يجمع الأساس النظري بخبرة تنفيذ على Flutter 3.32.1، مع معالجة تدريجية للفيديو في نحو 10–15 ثانية وعشرات الشاشات الجاهزة للإنتاج.';

  static final List<Map<String, String>> _emosenseChallenges = [
    {
      'title': 'هندسة على مستوى المؤسسات',
      'description':
          'تصميم بنية نظيفة مع BLoC/Cubit وحقن تبعيات ومستودعات وحالات استخدام بحدود واضحة لاختبار أعلى وصيانة أسهل.',
    },
    {
      'title': 'دمج ذكاء اصطناعي متعدد الوسائط',
      'description':
          'معالجة النص والصوت والفيديو مع الحفاظ على زمن استجابة مقبول عبر مهام غير متزامنة وتجميد معالجة فعّالة.',
    },
    {
      'title': 'أداء الحركة وسلامة الشفافية',
      'description':
          'إزالة أخطاء opacity وتحقيق حركة سلسة عبر شاشات كثيرة مع إدارة دورة حياة سليمة للمتحكمات.',
    },
    {
      'title': 'صلاحيات وتجارب مستخدم حسب الدور',
      'description':
          'فصل لوحة الإدارة عن بوابة الموظف مع حدود أمان وحالات تطبيق واضحة لكل دور.',
    },
  ];

  static const List<String> _emosenseLessons = [
    'إتقان البنية النظيفة مع BLoC/Cubit في تطبيقات المؤسسات',
    'تحسين أداء واجهة Flutter وإدارة الحركة بدون تحذيرات الشفافية',
    'أنماط حقن التبعيات ومستودعات الطبقة البيانات',
    'ربط نماذج تقدير المشاعر عبر قنوات متعددة',
    'ميزات إنتاجية: صلاحيات، مراقبة مباشرة، تحليلات وتقارير',
    'دمج منهجية بحثية مع متطلبات عمل حقيقية',
    'تحسين الذاكرة وتنظيم الشفرة لسهولة الصيانة',
    'اعتماد Material 3 وتخطيطات متجاوبة',
  ];

  static final List<Map<String, dynamic>> _emosenseFeatures = [
    {
      'icon': 'flutter_icon_svg',
      'title': 'كشف المشاعر لحظيًا',
      'description':
          'نماذج تقدّر تعابير الوجه وأنماط الصوت لتحسين دقة التعرف على الحالة',
    },
    {
      'icon': 'badge',
      'title': 'خصوصية في التصميم',
      'description': 'اعتبارات حماية البيانات والامتثال مبكرة في التصميم',
    },
    {
      'icon': 'technology',
      'title': 'تحليل متعدد الوسائط',
      'description': 'دمج معالجة الصوت والفيديو لفهم أوضح للسياق',
    },
    {
      'icon': 'dashboard',
      'title': 'تحليلات متقدمة',
      'description': 'لوحات تعرض اتجاهات المشاعر ومؤشرات الأداء',
    },
  ];

  // --- Gogesh ---
  static const String _gogeshOverview =
      '🌟 Gogesh منصة سوقية تربط التجار والعملاء بدعم عربي كامل (RTL) وإنجليزي (LTR). '
      'تشمل الخرائط والبحث والمحادثة الفورية والدفع والاشتراكات المتدرجة ولوحات تحليل للتاجر.\n\n'
      '💼 مشروع عمل حرّ (2025) يُظهر دورة تطوير كاملة: عشرات الشاشات، اختبارات واسعة، وإشعارات Firebase وأمان قوي.';

  static final List<Map<String, String>> _gogeshChallenges = [
    {
      'title': 'دعم ثنائي الاتجاه RTL/LTR',
      'description':
          'محاذاة النصوص وعكس التخطيط والخطوط المناسبة للعربية مع تجربة متناسقة بالإنجليزية.',
    },
    {
      'title': 'تكامل خرائط Google',
      'description':
          'صلاحيات الموقع، العلامات، التنقل، والأداء مع مفاتيح API آمنة.',
    },
    {
      'title': 'بنية مستخدم مزدوج (عميل/تاجر)',
      'description':
          'BLoC، حراسة تنقل، وواجهات مشتركة مع مسارات مخصّصة لكل دور.',
    },
    {
      'title': 'بوابات دفع متعددة',
      'description':
          'معالجة آمنة للمعاملات ودعم وسائل دفع إقليمية مع معالجة أخطاء واضحة.',
    },
    {
      'title': 'إدارة اشتراكات',
      'description':
          'باقات فضية/ذهبية/بلاتينية مع تقييد ميزات ودورات فوترة وتجديد.',
    },
    {
      'title': 'إشعارات فورية',
      'description':
          'FCM مع تفضيلات المستخدم والروابط العميقة والحالات أمام الخلفية.',
    },
    {
      'title': 'دردشة حية',
      'description':
          'رسائل لحظية، قوائم انتظار، وسجل مع تنبيهات موثوقة.',
    },
    {
      'title': 'استهداف وإحصاءات',
      'description':
          'تقسيم جمهور، حملات، ومؤشرات أداء للتاجر.',
    },
  ];

  static const List<String> _gogeshLessons = [
    'تصميم واجهات RTL/LTR كامل لأسواق المنطقة',
    'خدمات الموقع والخرائط والبحث الجغرافي',
    'BLoC مع بنية قابلة للتوسع لأدوار مزدوجة',
    'دمج دفع آمن مع متطلبات متعددة المنصات',
    'مصادقة اجتماعية وJWT وحماية المسارات',
    'نماذج اشتراك مع بوابات ميزات',
    'محادثات WebSocket مع مؤشرات كتابة وسجل',
    'لوحات تسويق وتحليلات للتاجر',
    'استراتيجيات إشعار وربط عميق',
    'أداء وحدات واجهة قاب لإعادة الاستخدام',
    'جودة عالية عبر اختبارات وحدات وBLoC',
    'من المتطلبات إلى الإصدار في دورة عمل كاملة',
  ];

  static final List<Map<String, dynamic>> _gogeshFeatures = [
    {
      'icon': 'store',
      'title': 'بنية مزدوجة الأدوار',
      'description': 'تجربة مخصّصة للتاجر والعميل ضمن تطبيق واحد',
    },
    {
      'icon': 'map_outlined',
      'title': 'اكتشاف بالموقع',
      'description': 'خرائط Google وتحديد موقع للأعمال القريبة',
    },
    {
      'icon': 'chat',
      'title': 'تواصل لحظي',
      'description': 'دردشة مباشرة بين الطرفين',
    },
    {
      'icon': 'payment',
      'title': 'دفع آمن',
      'description': 'بوابات متعددة وإدارة اشتراكات',
    },
    {
      'icon': 'language',
      'title': 'توطين كامل',
      'description':
          'عربي وإنجليزي مع RTL لأسواق الخليج والعالم العربي',
    },
    {
      'icon': 'analytics',
      'title': 'تحليلات الأعمال',
      'description': 'تقارير أداء ومبيعات للتاجر',
    },
  ];

  // --- Technology 92 ---
  static const String _technology92Overview =
      'Technology 92 عميل وظائف مبني ببنية نظيفة: عقود النطاق، مستودعات، وBLoC لكل ميزة. '
      'التوجيه بgo_router، الحقن بGetIt، والشبكة بDio مع خلفية Laravel. '
      'يشمل مصادقة، ملفًا شخصيًا، مؤشرات أداء، حضورًا بخدمات خلفية، وإعدادات واسعة مع مئات مفاتيح الترجمة عربي/إنجليزي.';

  static final List<Map<String, String>> _technology92Challenges = [
    {
      'title': 'بنية نظيفة واسعة النطاق',
      'description':
          'سبع وحدات ميزات مع أنماط مستودعات ومصادر بيانات متسقة وتخطيط أخطاء موحّد.',
    },
    {
      'title': 'تكافؤ المنتج عربي/إنجليزي',
      'description':
          'RTL وLTR ونحو 300+ نص لكل لغة مع جداول ARB وتدقيق انحدار.',
    },
    {
      'title': 'الحضور والسلوك في الخلفية',
      'description':
          'مزامنة المؤقتات والإشعارات مع سياسات المنصّة ووضوح للمستخدم.',
    },
    {
      'title': 'تكامل API واسع',
      'description':
          'عشرات النقاط الطرفية مع تحديث الرموز وحالات لا اتصال معقولة.',
    },
  ];

  static const List<String> _technology92Lessons = [
    'بنية نظيفة موجّهة بالميزات مع حدود المستودع القابلة للاختبار',
    'BLoC إنتاجي مع حالات متساوية القيم وأحداث صريحة',
    'go_router مع مسارات مميّزة وحقن المستودعات',
    'معالجة أخطاء وظيفية عبر Either من الطبقة البيانات للواجهة',
    'سير عمل intl/الـARB لثنائية اللغة على مستوى كبير',
    'Dio، عناوين بيئة، وأنماط Laravel API',
    'تحقق من النماذج وتخزين آمن للرموز',
    'استهداف منصات متعددة مع قيود سطح المكتب والويب حيث يلزم',
  ];

  static final List<Map<String, dynamic>> _technology92Features = [
    {
      'icon': 'verified_user',
      'title': 'المصادقة والتعريف',
      'description':
          'شاشات البداية واختيار اللغة والدخول وبريد Google مع تخزين آمن للرموز',
    },
    {
      'icon': 'home',
      'title': 'القشرة والرئيسية',
      'description': 'تنقل سفلي وبطاقات ملخص ومسارات رئيسية',
    },
    {
      'icon': 'badge',
      'title': 'الملف ومؤشرات الأداء',
      'description': 'عرض وتعديل الملف، تعريفات KPI، وقوائم مفلترة',
    },
    {
      'icon': 'schedule',
      'title': 'الحضور',
      'description': 'تسجيل دخول/خروج، سجل، مؤقت، وإشعارات الشاشة المقفلة',
    },
    {
      'icon': 'language',
      'title': 'الترجمة',
      'description': 'عربي وإنجليزي مع RTL وتجربة Material 3 متناسقة',
    },
    {
      'icon': 'settings',
      'title': 'الإعدادات',
      'description': 'المظهر، اللغة، السياسات، الحساب، التقييم، الحذف، والخروج',
    },
  ];

  // --- FlutterMate ---
  static const String _flutterMateOverview =
      '📚 FlutterMate رفيق تعلم Flutter بمسارات دروس منظمة، اختبارات، ومتابعة تقدّم. '
      'مبنية ببنية نظيفة وGetX مع دروس ومتطلبات مسبقة ولوحات تقدم.\n\n'
      '🚀 قيد التطوير النشط مع واجهة Material 3 ووضع مظلم/فاتح ودعم جوال وتابلت وويب.';

  static final List<Map<String, String>> _flutterMateChallenges = [
    {
      'title': 'تصميم مسار تعلم منظم',
      'description':
          '22 درسًا عبر مستويات مع المتطلبات المسبقة وتقدير زمني منطقي.',
    },
    {
      'title': 'التلعيب والتحفيز',
      'description':
          'نقاط خبرة، شارات، سلاسل أيام، ومخططات دون إرهاق الواجهة.',
    },
    {
      'title': 'اختبارات تفاعلية',
      'description':
          '25+ اختبارًا مع تغذية راجعة فورية وتفسيرات ونتائج موثوقة.',
    },
    {
      'title': 'الأداء واستمرارية الحالة',
      'description':
          'SharedPreferences لحفظ تقدم غني مع حركة سلسة وذاكرة مستقرة.',
    },
    {
      'title': 'واجهة تعليمية متجاوبة',
      'description':
          'تسلسل معلومات واضح على الهاتف والتابلت والويب مع سهولة وصول.',
    },
    {
      'title': 'نشر آلي',
      'description':
          'GitHub Actions لبناء Flutter web وتحسين الأصول ونشر الصفحات.',
    },
  ];

  static const List<String> _flutterMateLessons = [
    'تنظيم الميزات ضمن بنية نظيفة وحدود واضحة',
    'GetX للحالة والحقن والمسارات التفاعلية',
    'منصات تعليمية مع نظام دروس ومتطلبات مسبقة',
    'تقنيات تلعيب: نقاط، شارات، تتبع تقدم',
    'استراتيجيات حفظ للحالة المعقّدة باستمرارية',
    'Material 3 وسمات فاتحة/داكنة وتجربة سلسة',
    'flutter_animate ولottie مع أهداف أداء 60 إطارًا',
    'مخططات ولوحات لفهم رحلة المتعلم',
    'اختبارات واجهة ووحدات لمحتوى تعليمي موثوق',
    'CI/CD لـ Flutter web وPWA',
    'تصميم متجاوب عبر المنصات من شفرة واحدة',
    'تجربة مستخدم مركّزة على الوضوح والوصول',
  ];

  static final List<Map<String, dynamic>> _flutterMateFeatures = [
    {
      'icon': 'school',
      'title': '22 درسًا منظمًا',
      'description': 'مستويات مبتدئ/متوسط/متقدم مع تقدير زمني ومتطلبات',
    },
    {
      'icon': 'quiz',
      'title': 'نظام اختبارات',
      'description': 'اختبارات مع تصحيح فوري وتفسير ومكافآت',
    },
    {
      'icon': 'emoji_events',
      'title': 'تتبع وتلعيب',
      'description': 'إحصاءات، شارات، سلاسل، ومخططات أسبوعية',
    },
    {
      'icon': 'library_books',
      'title': 'محتوى درس غني',
      'description': 'أهداف، موارد، تمارين، ومستويات صعوبة',
    },
    {
      'icon': 'palette',
      'title': 'Material 3 جميل',
      'description': 'سمات، حركة، وتخطيطات مرنة',
    },
    {
      'icon': 'devices',
      'title': 'متعدد المنصات',
      'description': 'جوال وتابلت وويب مع قدرات PWA',
    },
  ];

  // --- Music player ---
  static final List<Map<String, String>> _musicPlayerChallenges = [
    {
      'title': 'معالجة الصوت في الخلفية',
      'description':
          'تشغيل مستمر مع بقاء الواجهة سريعة الاستجابة وجلسة صوتية مستقرة.',
    },
    {
      'title': 'دعم صوتي عبر المنصات',
      'description':
          'سلوك متسق مع تحسينات خاصة بالمنصة ومسارات احتياطية.',
    },
  ];

  static const List<String> _musicPlayerLessons = [
    'إدارة حالة معقّدة لتطبيقات الوسائط',
    'تحسينات خاصة بالمنصة في Flutter',
    'معالجة الصوت ومهام الخلفية',
    'مبادئ واجهة حديثة لتطبيقات الوسائط',
  ];

  // --- Default ---
  static final List<Map<String, String>> _defaultChallenges = [
    {
      'title': 'تحسين الأداء',
      'description':
          'ضمان سلاسة على أجهزة مختلفة عبر تحسين الرسم وحالة التطبيق.',
    },
    {
      'title': 'تصميم تجربة المستخدم',
      'description':
          'واجهة بديهية تعمل على الجوال والويب بتخطيط متجاوب.',
    },
  ];

  static const List<String> _defaultLessons = [
    'أفضل ممارسات Flutter لبنية قابلة للتوسع',
    'تقنيات تصميم متجاوب لعدة منصات',
    'استراتيجيات تحسين أداء تجربة المستخدم',
    'ممارسات تطوير حديثة واختبار',
  ];
}
