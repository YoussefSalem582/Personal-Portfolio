/// Arabic titles and descriptions for portfolio projects (by [Project.id]).
class ArProjectCopy {
  const ArProjectCopy({
    required this.title,
    required this.shortDescription,
    required this.description,
  });

  final String title;
  final String shortDescription;
  final String description;
}

/// Lookup table for Arabic project copy. Fallback: English from [Project] if missing.
class ProjectsAr {
  ProjectsAr._();

  static const Map<String, ArProjectCopy> _byId = {
    'flutter-mate': ArProjectCopy(
      title: 'FlutterMate — مساعد تعلّم Flutter',
      shortDescription:
          '📚 رفيقك الشخصي لتعلّم Flutter مع دروس منظمة، تتبع التقدم، ومساعدة بالذكاء الاصطناعي',
      description:
          'FlutterMate مساعد تعليمي شامل يرشد المطوّرين من المبتدئين إلى المتقدمين عبر دروس منظمة واختبارات تفاعلية وتتبع للتقدم ونظام نقاط خبرة. '
          'يبنى بمعمارية نظيفة وGetX ويتضمن عشرات الدروس على مستويات صعوبة متعددة، مع واجهة Material 3 ودعم الويب والجوال.',
    ),
    'technology-ninety-two-job-marketplace': ArProjectCopy(
      title: 'Technology 92 — سوق عمل عبر التطبيق',
      shortDescription:
          'سوق وظائف بـ Flutter مع معمارية نظيفة وBLoC وDio وترجمة كاملة عربي/إنجليزي أمام API لـ Laravel',
      description:
          'تطبيق سوق عمل متعدد المنصات يتبع المعمارية النظيفة وBLoC وgo_router وDio لربط أكثر من 50 نقطة نهاية مع خادم Laravel. '
          'يغطي المصادقة والملف الشخصي والحضور والوظائف والإعدادات مع مئات مفاتيح الترجمة ودعم الاتجاه من اليمين لليسار.',
    ),
    'emosense-app': ArProjectCopy(
      title: 'EmoSense — منصة التعرف على المشاعر للمؤسسات',
      shortDescription:
          'منصة مؤسسية للتعرف على المشاعر وتحسين خدمة العملاء وتحليلات المزاج',
      description:
          'EmoSense منصة متقدمة للتعرف على المشاعر بمعمارية نظيفة وFlutter، تدعم تحليلاً متعدد الوسائط (نص/صوت/فيديو) '
          'وموارد إدارية وموظفين ولوحات مراقبة فورية — مشروع تخرج من جامعة النيل يجسد خبرة في الرؤية الحاسوبية والتعلم الآلي.',
    ),
    'music-player': ArProjectCopy(
      title: 'تطبيق مشغل موسيقى',
      shortDescription:
          'مشغل موسيقى بتجميعات قوائم وتحكم في التشغيل وبحث وواجهة حديثة',
      description:
          'تطبيق موسيقى مبني بـ Flutter مع قوائم تشغيل وعناصر تحكم وتصور صوتي وتشغيل في الخلفية وتجربة استخدام سلسة.',
    ),
    'chat-app': ArProjectCopy(
      title: 'تطبيق دردشة',
      shortDescription: 'دردشة متعددة المنصات مع Firebase والرسائل الفورية',
      description:
          'تطبيق محادثة عبر Firebase للمصادقة وقاعدة بيانات فورية مع أوضاع فاتح/داكن وواجهة مرتبة.',
    ),
    'youssef-salem-portfolio': ArProjectCopy(
      title: 'موقع ملف أعمال شخصي',
      shortDescription:
          'موقع ملف أعمال ويب متجاوب يعرض المشاريع والمهارات والخبرة',
      description:
          'موقع ملف أعمال حديث مبني بـ Flutter Web مع معارض مشاريع، بطاقات مهارات، شهادات، نموذج تواصل، '
          'تبديل سمة، وتحسينات أداء — منظومة معيارية جاهزة للنشر كموقع ثابت.',
    ),
    'sprints-shop': ArProjectCopy(
      title: 'تطبيق Sprints Shop',
      shortDescription:
          'تطبيق تسوق مع مصادقة وسلة ودفع وتجربة مستخدم كاملة',
      description:
          'تطبيق تجارة إلكترونية بـ Flutter يتضمن تسجيل الدخول وكتالوج منتجات وسلة ودفعات وترجمة عربية كاملة وتخطيطاً متجاوباً مع حركات انتقال سلسة.',
    ),
    'quizhub': ArProjectCopy(
      title: 'تطبيق QuizHub',
      shortDescription: 'منصة امتحانات عبر الإنترنت مع اختبارات تفاعلية',
      description:
          'تطبيق تعليمي للاختبارات مع فئات متعددة وتتبع للتقدم ومراجعة وإدارة امتحانات.',
    ),
    'gopooling-carpool': ArProjectCopy(
      title: 'GoPooling — مشاركة رحلات للجامعة',
      shortDescription:
          'منصة مشاركة رحلات لطلاب الجامعة لربط السائقين بالركاب',
      description:
          'تطبيق لمشاركة الرحلات داخل المجتمع الجامعي مع تتبع GPS ومطابقة سائق/راكب وتقييمات وسجل رحلات وتكامل دفعات آمن — مبني بـ Flutter وFirebase.',
    ),
    'chargehub': ArProjectCopy(
      title: 'تطبيق ChargeHub',
      shortDescription:
          'البحث عن محطات الشحن والوقود مع خرائط تفاعلية وBLoC',
      description:
          'تطبيق لاكتشاف محطات الشحن والوقود بخرائط تفاعلية وإدارة حالة BLoC وتكامل GPS لعرض التوفر القريب.',
    ),
    'gogesh-marketplace': ArProjectCopy(
      title: 'Gogesh — دليل تجاري شامل',
      shortDescription:
          '🌍 سوق يربط التجار والعملاء عبر الخليج والعالم العربي',
      description:
          'منصة سوق تجاري شاملة بـ Flutter وBLoC تربط التجار والعملاء مع خرائط Google ودردشة ودفعات واشتراكات '
          'ودعم عربي/إنجليزي كامل — أول مشروع عمل حر يظهر خبرة التجارة الإلكترونية.',
    ),
    'quotehub': ArProjectCopy(
      title: 'تطبيق QuoteHub',
      shortDescription: 'مولّد اقتباسات عشوائية مع فئات ومفضلة',
      description:
          'تطبيق بسيط وأنيق يعرض اقتباسات ملهمة مع تصنيفات ومشاركة ومفضلة وتصميم Minimal.',
    ),
    'facial-recognition': ArProjectCopy(
      title: 'نظام التعرف على الوجوه',
      shortDescription: 'تعرف على الوجوه وتحليل بالذكاء الاصطناعي',
      description:
          'نظام رؤية حاسوبية للتعرف على الوجوه باستخدام OpenCV وTensorFlow مع كشف وتحليل بدقة عالية.',
    ),
    'sign-language-translator': ArProjectCopy(
      title: 'مترجم لغة الإشارة',
      shortDescription: 'نظام ذكاء اصطناعي للتعرف على الإشارات وترجمتها',
      description:
          'نظام يتعرف على إشارات لغة الإشارة ويترجمها إلى نص أو كلام باستخدام رؤية حاسوبية وتعلم آلة في الوقت الفعلي تقريباً.',
    ),
    'pothole-detection': ArProjectCopy(
      title: 'تحليل مقارن لنماذج تعلم آلة لكشف حفر الشوارع',
      shortDescription:
          'ورقة بحث تقارن CNN وResNet-50 وأشجار قرار',
      description:
          'بحث يقارن نماذج تعلم آلة لكشف الحفر في الشوارع مع تقييم أداء شامل وتحليل بيانات.',
    ),
    'interactive-learning-assistant': ArProjectCopy(
      title: 'مساعد تعليمي تفاعلي بصور رمزية ثلاثية الأبعاد',
      shortDescription:
          'تعلم غامر مع صور رمزية قابلة للتخصيص وتفاعل عاطفي',
      description:
          'مساعد تعليمي بويب ثلاثي الأبعاد بـ Three.js وReact يزيد التفاعل عبر صور رمزية قابلة للتخصيص وردود فورية، '
          'مع قراءة نصوص صوتية وإرشادات دراسية — جسر بين ديناميكيات الصف التقليدي والتعلم عن بُعد.',
    ),
  };

  static ArProjectCopy? forId(String id) => _byId[id];
}
