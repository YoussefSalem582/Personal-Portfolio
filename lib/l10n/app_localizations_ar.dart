// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'يوسف سالم - ملف أعمال';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navAbout => 'نبذة';

  @override
  String get navSkills => 'المهارات';

  @override
  String get navExpertise => 'الخبرات';

  @override
  String get navProjects => 'المشاريع';

  @override
  String get navCertificates => 'الشهادات';

  @override
  String get navContact => 'اتصل';

  @override
  String get sectionAboutTitle => 'من أنا';

  @override
  String get sectionProjectsTitle => 'مشاريعي';

  @override
  String get sectionProjectsSubtitle => 'بعض المشاريع التي عملت عليها';

  @override
  String get sectionSkillsTitle => 'تقنياتي';

  @override
  String get sectionSkillsSubtitle =>
      'مجموعة من التقنيات التي أجيدها والتي أستمتع بالعمل بها';

  @override
  String get sectionCertificatesTitle => 'الشهادات والإنجازات';

  @override
  String get sectionCertificatesSubtitle =>
      'شهادات مهنية تعكس التعلم المستمر والخبرة';

  @override
  String get sectionExpertiseTitle => 'خبراتي';

  @override
  String get sectionExpertiseSubtitle => 'دمج أحدث التقنيات مع حلول مبتكرة';

  @override
  String get sectionContactTitle => 'تواصل معي';

  @override
  String get sectionContactSubtitle => 'لنناقش مشروعك القادم أو فرصة تعاون';

  @override
  String get heroGreeting => 'مرحباً، أنا';

  @override
  String get heroRoleFlutterDeveloper => 'مطوّر Flutter';

  @override
  String get heroRoleMobileAppDeveloper => 'مطوّر تطبيقات جوال';

  @override
  String get heroRoleSoftwareEngineer => 'مهندس برمجيات';

  @override
  String get linksMenu => 'روابط';

  @override
  String get linksGithubProfile => 'ملف GitHub';

  @override
  String get linksLinkedIn => 'ملف LinkedIn';

  @override
  String get linksYoutube => 'قناة يوتيوب';

  @override
  String get linksResume => 'السيرة الذاتية';

  @override
  String get resumeOpenError => 'تعذّر فتح السيرة الذاتية';

  @override
  String get resumeOpening => 'جارٍ فتح السيرة الذاتية...';

  @override
  String get resumeOpenErrorRetry => 'تعذّر فتح السيرة الذاتية. حاول مرة أخرى.';

  @override
  String get filterAll => 'الكل';

  @override
  String copyrightNotice(int year, String name) {
    return '© $year $name. جميع الحقوق محفوظة.';
  }

  @override
  String get footerBuiltWith => 'بُني بـ';

  @override
  String get footerUsingFlutter => 'باستخدام Flutter';

  @override
  String get footerTagline =>
      'أصمم تطبيقات جميلة وعملية باستخدام Flutter. شغوف بالكود النظيف وتجارب المستخدم المميزة.';

  @override
  String get footerQuickLinks => 'روابط سريعة';

  @override
  String get footerGetInTouch => 'تواصل معي';

  @override
  String get footerFollowMe => 'تابعني';

  @override
  String get footerViewResume => 'عرض السيرة الذاتية';

  @override
  String get contactFormTitle => 'أرسل لي رسالة';

  @override
  String get contactFormSubtitle => 'سأرد خلال 24 ساعة';

  @override
  String get contactFieldName => 'اسمك';

  @override
  String get contactFieldNameHint => 'أدخل اسمك الكامل';

  @override
  String get contactValidationNameRequired => 'يرجى إدخال الاسم';

  @override
  String get contactFieldEmail => 'بريدك الإلكتروني';

  @override
  String get contactFieldEmailHint => 'أدخل عنوان بريدك';

  @override
  String get contactValidationEmailRequired => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get contactValidationEmailInvalid => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String get contactFieldSubject => 'الموضوع';

  @override
  String get contactFieldSubjectHint => 'بماذا تتعلق الرسالة؟';

  @override
  String get contactValidationSubjectRequired => 'يرجى إدخال الموضوع';

  @override
  String get contactFieldMessage => 'الرسالة';

  @override
  String get contactFieldMessageHint => 'صف مشروعك أو استفسارك...';

  @override
  String get contactValidationMessageRequired => 'يرجى إدخال الرسالة';

  @override
  String get contactValidationMessageMinLength =>
      'الرسالة يجب أن تكون 10 أحرف على الأقل';

  @override
  String get contactSendButton => 'إرسال الرسالة';

  @override
  String get contactSuccessMessage =>
      'تم إرسال الرسالة بنجاح! سأتواصل معك قريباً.';

  @override
  String get contactErrorGeneric => 'تعذّر إرسال الرسالة. ';

  @override
  String get contactErrorTimeout =>
      'انتهت مهلة الطلب. تحقق من اتصال الإنترنت وحاول مرة أخرى.';

  @override
  String contactErrorAuth(String email) {
    return 'مشكلة في مصادقة خدمة البريد. يرجى التواصل معي مباشرة على $email';
  }

  @override
  String contactError404(String email) {
    return 'إعداد خدمة البريد غير موجود. يرجى التواصل معي مباشرة على $email';
  }

  @override
  String get contactErrorInvalidForm =>
      'بيانات النموذج غير صالحة. تحقق من المدخلات وحاول مرة أخرى.';

  @override
  String contactErrorServer(String email) {
    return 'خدمة البريد غير متاحة مؤقتاً. حاول لاحقاً أو تواصل معي مباشرة على $email';
  }

  @override
  String contactErrorCors(String email) {
    return 'قيد أمني في المتصفح. حاول مرة أخرى أو تواصل معي مباشرة على $email';
  }

  @override
  String get contactErrorNetworkGen =>
      'مشكلة في الاتصال بالشبكة. تحقق من الإنترنت وحاول مرة أخرى.';

  @override
  String contactErrorTryDirect(String email) {
    return 'حاول مرة أخرى أو تواصل معي مباشرة على $email';
  }

  @override
  String get contactErrorNotConfigured =>
      'لم يُهيّأ نقطة إرسال النموذج. يرجى التواصل مع المسؤول.';

  @override
  String contactErrorFormDisabledWithEmail(String email) {
    return 'النموذج معطّل أو تم اكتشاف بريد مزعج. تواصل معي مباشرة على $email';
  }

  @override
  String get contactErrorRateLimit =>
      'طلبات كثيرة جداً. انتظر قليلاً ثم حاول مرة أخرى.';

  @override
  String contactErrorFailedWithCode(int code, String email) {
    return 'فشل إرسال الرسالة (خطأ $code). حاول مرة أخرى أو تواصل معي على $email';
  }

  @override
  String get contactErrorCertificate =>
      'خطأ في شهادة الأمان. يرجى التواصل مع المسؤول.';

  @override
  String get contactErrorNetworkSimple =>
      'خطأ في الشبكة. تحقق من الإنترنت وحاول مرة أخرى.';

  @override
  String get drawerTheme => 'المظهر';

  @override
  String get tooltipLightMode => 'الوضع الفاتح';

  @override
  String get tooltipDarkMode => 'الوضع الداكن';

  @override
  String get tooltipLanguage => 'اللغة';

  @override
  String get tooltipSwitchToEnglish => 'التبديل إلى الإنجليزية';

  @override
  String get tooltipSwitchToArabic => 'التبديل إلى العربية';

  @override
  String get aboutTagline => 'اكتشف رحلتي ومهاراتي وشغفي بالتقنية';

  @override
  String get bioWhoIAm => 'من أنا';

  @override
  String get bioIntro =>
      'كمطوّر Flutter وطالب علوم حاسوب في جامعة النيل، أشغف ببناء تطبيقات جوال عالية الأداء ومتعددة المنصات باستخدام Dart وFlutter. لدي خبرة عملية في تطبيقات مثل ChargeHub (مواقع شحن المركبات) ومنصة مشاركة الرحلات، وأجيد إدارة الحالة باستخدام BLoC وربط REST APIs وخدمات Firebase في الوقت الفعلي.';

  @override
  String get bioMobileDevTitle => 'تطوير تطبيقات الجوال';

  @override
  String get bioMobileDevBody =>
      'تركّز مشاريعي على بنية نظيفة وتصميم واجهات حديثة وتجارب مستخدم سلسة على أندرويد وiOS.';

  @override
  String get bioTechTitle => 'اهتمامات تقنية';

  @override
  String get bioTechBody =>
      'أهتم بتطوير معرفتي في معالجة اللغات الطبيعية والتعلم الآلي والرؤية الحاسوبية لدعم حلول تقنية مبتكرة.';

  @override
  String get bioSkillsTitle => 'المهارات والتواصل';

  @override
  String get bioSkillsBody =>
      'أطوّر تطبيقات غنية بالميزات من مشغلات موسيقى إلى متاجر إلكترونية، مع التركيز على قابلية الصيانة والممارسات المرنة.';

  @override
  String get bioHighlightClosing =>
      'أتطلع لأن أسهم بخبرتي في Flutter لابتكار حلول جوال تركّز على المستخدم وتدعم النمو والقابلية للتوسع.';

  @override
  String get bioClosingCta =>
      'يسعدني التواصل إن رغبت في مناقشة التقنية أو التصميم أو التعلم الآلي أو فرص التعاون!';

  @override
  String get statProjectsCompleted => 'مشروع مكتمل';

  @override
  String get statYearsExperience => 'سنوات خبرة';

  @override
  String get statTechnologies => 'تقنيات';

  @override
  String get statClientSatisfaction => 'رضا العملاء';

  @override
  String get contactInfoHeading => 'تواصل معي';

  @override
  String get contactInfoEmailLabel => 'البريد الإلكتروني';

  @override
  String get contactInfoLocationLabel => 'الموقع';

  @override
  String get contactCardTitle => 'معلومات التواصل';

  @override
  String get contactCardSubtitle => 'يسعدني تواصلك معي';

  @override
  String get contactSocialHeading => 'تواصل معي';

  @override
  String get projectDialogDescriptionHeading => 'الوصف';

  @override
  String get projectDialogTechnologiesHeading => 'التقنيات المستخدمة';

  @override
  String allProjectsDialogTitle(int count) {
    return 'كل المشاريع ($count)';
  }

  @override
  String get certificateDetailsHeading => 'تفاصيل الشهادة';

  @override
  String get certificateIssuedByLabel => 'الجهة المُصدِرة';

  @override
  String get certificateIssueDateLabel => 'تاريخ الإصدار';

  @override
  String get certificateDescriptionLabel => 'الوصف';

  @override
  String get certificateVerifiedTitle => 'شهادة موثّقة';

  @override
  String get certificateValidatedOnlineHint =>
      'يمكن التحقق من هذه الشهادة عبر الإنترنت';

  @override
  String get certificateVerifiedShort => 'موثّقة';

  @override
  String get labelPdf => 'PDF';

  @override
  String get labelHtml => 'HTML';

  @override
  String get caseStudyBackTooltip => 'العودة إلى المشاريع';

  @override
  String get caseStudySectionsMenuTooltip => 'قائمة الأقسام';

  @override
  String get caseStudySectionsSheetTitle => 'الأقسام';

  @override
  String get caseStudyNavOverview => 'نظرة عامة';

  @override
  String get caseStudyNavTechStack => 'التقنيات';

  @override
  String get caseStudyNavDocuments => 'المستندات';

  @override
  String get caseStudyNavGallery => 'المعرض';

  @override
  String get caseStudyNavChallenges => 'التحديات';

  @override
  String get caseStudyNavLearnings => 'الدروس المستفادة';

  @override
  String get caseStudySectionProjectOverview => 'نظرة عامة على المشروع';

  @override
  String get caseStudySectionKeyFeatures => 'الميزات الرئيسية';

  @override
  String get caseStudySectionTechnicalStack => 'التقنيات المستخدمة';

  @override
  String get caseStudySectionKeyLearnings => 'أهم التعلّمات';

  @override
  String get caseStudySectionChallengesSolutions => 'التحديات والحلول';

  @override
  String get caseStudySectionProjectDocuments => 'مستندات المشروع';

  @override
  String get caseStudyGalleryHeading => 'لقطات الشاشة والمعرض';

  @override
  String galleryImageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count صورة',
      many: '$count صورة',
      few: '$count صور',
      two: 'صورتان',
      one: 'صورة واحدة',
      zero: 'لا صور',
    );
    return '$_temp0';
  }

  @override
  String get diagramLabelUseCase => 'مخطط حالات الاستخدام';

  @override
  String get diagramLabelClass => 'مخطط الصفوف';

  @override
  String get diagramLabelSequence => 'مخطط التتابع';

  @override
  String get diagramLabelActivity => 'مخطط النشاط';

  @override
  String get diagramLabelState => 'مخطط الحالات';

  @override
  String get diagramLabelEr => 'مخطط العلاقات بين الكيانات';

  @override
  String get diagramLabelBlock => 'مخطط كتل';

  @override
  String get diagramLabelFlowchart => 'مخطط انسيابي';

  @override
  String get diagramLabelGeneric => 'مخطط';

  @override
  String get caseStudyCtaTitle => 'هل تريد معرفة المزيد؟';

  @override
  String get caseStudyCtaSubtitle =>
      'استكشف دراسة الحالة كاملة أو اطّلع على الشفرة المصدرية';

  @override
  String get caseStudyWatchDemoVideo => 'مشاهدة فيديو توضيحي';

  @override
  String get caseStudyWatchShortVideo => 'مشاهدة فيديو قصير';

  @override
  String get caseStudyViewSourceCode => 'عرض الشفرة المصدرية';

  @override
  String get liveUrlGooglePlayShort => 'Google Play';

  @override
  String get liveUrlGooglePlay => 'عرض على Google Play';

  @override
  String get liveUrlDemoShort => 'عرض تجريبي';

  @override
  String get liveUrlDemo => 'فتح العرض التجريبي';

  @override
  String get projectCardFeatured => 'مميز';

  @override
  String get projectCardViewProject => 'عرض المشروع';

  @override
  String get projectDialogViewCaseStudy => 'عرض دراسة الحالة';

  @override
  String get projectDialogViewCode => 'عرض الشفرة';

  @override
  String get projectsSeeMorePrompt => 'هل تود رؤية المزيد؟';

  @override
  String get projectsViewAll => 'عرض كل المشاريع';

  @override
  String get projectsVisitGitHub => 'زيارة GitHub';

  @override
  String get certificateViewPdf => 'عرض PDF';

  @override
  String get certificateVerify => 'التحقق من الشهادة';

  @override
  String get resumeCardTitle => 'عرض سيرتي الذاتية';

  @override
  String get resumeCardSubtitle => 'اكتشف مسيرتي المهنية ومهاراتي وإنجازاتي.';

  @override
  String get resumeViewCv => 'عرض السيرة الذاتية';

  @override
  String get heroViewProjects => 'عرض المشاريع';

  @override
  String projectsEmptyForFilter(String filterName) {
    return 'لا توجد مشاريع تحت \"$filterName\"';
  }

  @override
  String get showMore => 'عرض المزيد';

  @override
  String get imageNotFound => 'الصورة غير متوفرة';

  @override
  String get certificateImageUnavailable => 'صورة الشهادة';

  @override
  String get certificatePlaceholderShort => 'شهادة';

  @override
  String get contactFieldPhone => 'الهاتف';

  @override
  String get contactFieldPhoneHint => 'رقم هاتفك';

  @override
  String get projectFilterFlutter => 'Flutter';

  @override
  String get projectFilterGetX => 'GetX';

  @override
  String get projectFilterBlocCubit => 'BLoC / Cubit';

  @override
  String get projectFilterEcommerce => 'تجارة إلكترونية';

  @override
  String get projectFilterChatApps => 'تطبيقات دردشة';

  @override
  String get projectFilterEducation => 'تعليم';

  @override
  String get projectFilterFirebase => 'Firebase';

  @override
  String get projectFilterMapsGps => 'خرائط وGPS';

  @override
  String get projectFilterAiMl => 'ذكاء اصطناعي / تعلّم آلي';

  @override
  String get projectFilterCleanArchitecture => 'بنية نظيفة';

  @override
  String get projectFilterEnterprise => 'مؤسسات';

  @override
  String get galleryCatOnboardingAuth => 'التسجيل والمصادقة';

  @override
  String get galleryCatEmployeeHomeTools => 'الرئيسية للموظف والأدوات';

  @override
  String get galleryCatVideoAnalysis => 'تحليل الفيديو';

  @override
  String get galleryCatVoiceAnalysis => 'تحليل الصوت';

  @override
  String get galleryCatTextAnalysis => 'تحليل النص';

  @override
  String get galleryCatSupportTickets => 'تذاكر الدعم';

  @override
  String get galleryCatEmployeeProfile => 'ملف الموظف';

  @override
  String get galleryCatAdminPanel => 'لوحة الإدارة';

  @override
  String get galleryCatUserHomeShopping => 'الرئيسية والتسوق';

  @override
  String get galleryCatCategoriesProducts => 'الفئات والمنتجات';

  @override
  String get galleryCatFavoritesOffers => 'المفضلة والعروض';

  @override
  String get galleryCatChatNotifications => 'الدردشة والإشعارات';

  @override
  String get galleryCatMerchantDashboard => 'لوحة التاجر';

  @override
  String get galleryCatSplashOnboarding => 'شاشة البداية والتعريف';

  @override
  String get galleryCatAuthenticationFlow => 'مسار المصادقة';

  @override
  String get galleryCatLearningRoadmap => 'خارطة التعلم';

  @override
  String get galleryCatLessonsCourseContent => 'الدروس ومحتوى الدورة';

  @override
  String get galleryCatInteractiveQuizzes => 'اختبارات تفاعلية';

  @override
  String get galleryCatSkillAssessment => 'تقييم المهارات';

  @override
  String get galleryCatAnalyticsDashboard => 'لوحة التحليلات';

  @override
  String get galleryCatUserProfile => 'ملف المستخدم';

  @override
  String get galleryCatAiChatAssistant => 'مساعد الدردشة بالذكاء الاصطناعي';

  @override
  String get galleryCatCommunityFeatures => 'ميزات المجتمع';

  @override
  String get galleryCatDesktopExperience => 'تجربة سطح المكتب';

  @override
  String get galleryCatHomeDashboard => 'لوحة الرئيسية';

  @override
  String get galleryCatMealsModule => 'وحدة الوجبات';

  @override
  String get galleryCatMoodTracking => 'تتبع المزاج';

  @override
  String get galleryCatLocationMap => 'الموقع والخريطة';

  @override
  String get galleryCatFamilySocialWall => 'جدار العائلة الاجتماعي';

  @override
  String get galleryCatProfileSettings => 'الملف والإعدادات';

  @override
  String get galleryCatOnboardingShort => 'التعريف بالتطبيق';

  @override
  String get galleryCatUserAuthentication => 'مصادقة المستخدم';

  @override
  String get galleryCatDriverAuthentication => 'مصادقة السائق';

  @override
  String get galleryCatRideBookingFlow => 'حجز الرحلة';

  @override
  String get galleryCatTripManagement => 'إدارة الرحلات';

  @override
  String get galleryCatNavigationFeatures => 'التنقل والميزات';

  @override
  String get galleryCatUmlDiagrams => 'مخططات UML';

  @override
  String get galleryCatDatasetOverview => 'نظرة على مجموعة البيانات';

  @override
  String get galleryCatModelTrainingValidation => 'التدريب والتحقق من النموذج';

  @override
  String get galleryCatResultsAnalysis => 'النتائج والتحليل';

  @override
  String get galleryCatSystemArchitecture => 'هندسة النظام';

  @override
  String get galleryCatDatasetTraining => 'البيانات والتدريب';

  @override
  String get galleryCatResults => 'النتائج';

  @override
  String get galleryCatApplicationScreenshots => 'لقطات التطبيق';

  @override
  String get galleryCatAppScreenshots => 'لقطات التطبيق';

  @override
  String get galleryCatSystemInterface => 'واجهة النظام';

  @override
  String get galleryCatGallery => 'المعرض';

  @override
  String get projectUnderDevelopment => '🚧 قيد التطوير';

  @override
  String get tooltipCertificateOpenDetails => 'عرض تفاصيل الشهادة';

  @override
  String get tooltipClose => 'إغلاق';

  @override
  String get tooltipViewFullLogo => 'عرض الشعار بالحجم الكامل';

  @override
  String get tooltipOpenNavigationMenu => 'فتح قائمة التنقل';
}
