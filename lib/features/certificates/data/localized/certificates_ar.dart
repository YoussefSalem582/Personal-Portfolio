/// Arabic certificate copy by [Certificate.id].
class ArCertificateCopy {
  const ArCertificateCopy({
    required this.title,
    required this.issuer,
    required this.description,
  });

  final String title;
  final String issuer;
  final String description;
}

class CertificatesAr {
  CertificatesAr._();

  static const Map<String, ArCertificateCopy> _byId = {
    'route-flutter-diploma': ArCertificateCopy(
      title: 'دبلوم تطوير Flutter',
      issuer: 'مركز Route لتدريب تقنية المعلومات',
      description:
          'شهادة تطوير Flutter شاملة تغطي تطبيقات الجوال وإدارة الحالة وتصميم واجهات المستخدم.\n\n'
          'المدة: فبراير 2025 – يونيو 2025 (4 أشهر)',
    ),
    'ml-depi': ArCertificateCopy(
      title: 'مهندس تعلم آلة Microsoft — مبادرة رواد مصر الرقمية',
      issuer: 'مبادرة رواد مصر الرقمية (DEPI)',
      description:
          'مسار Microsoft لتعلم آلة يركز على تحويل البيانات إلى نماذج علم بيانات قابلة للتوسع باستخدام Azure، وبناء خوارزميات وبرامج تستخرج الأنماط من البيانات.\n\n'
          'المدة: أكتوبر 2024 – مايو 2025 (8 أشهر)',
    ),
    'codealpha-certificate': ArCertificateCopy(
      title: 'متدرّب تطوير تطبيقات جوال',
      issuer: 'CodeAlpha',
      description:
          'تدريب عملي على تطوير تطبيقات Flutter والبرمجة التطبيقية.\n\n'
          'المدة: 1 مارس 2025 – 30 مارس 2025 (شهر)',
    ),
    'codealpha-lor': ArCertificateCopy(
      title: 'رسالة توصية من CodeAlpha',
      issuer: 'CodeAlpha',
      description:
          'رسالة توصية تعترف بالأداء والمساهمات أثناء تدريب تطوير تطبيقات الجوال.\n\n'
          'المدة: 1 مارس 2025 – 30 مارس 2025 (شهر)',
    ),
    'uneeq-internship': ArCertificateCopy(
      title: 'متدرّب تطوير تطبيقات Flutter',
      issuer: 'UneeQ Interns',
      description:
          'تدريب على تطوير تطبيقات الجوال باستخدام Flutter.\n\n'
          'المدة: 1 مارس 2025 – 25 مارس 2025 (شهر)',
    ),
    'ecpc': ArCertificateCopy(
      title: 'مسابقة البرمجة الجامعية المصرية',
      issuer: 'ECPC',
      description:
          'شهادة مشاركة في المسابقة الجامعية للبرمجة تظهر مهارات حل المسائل.',
    ),
    'intro-jupyter': ArCertificateCopy(
      title: 'مقدمة إلى Jupyter Notebook',
      issuer: 'Coursera',
      description:
          'إتمام دورة مقدمة في Jupyter Notebook يغطي أساسيات علم البيانات واستخدام الدفاتر.',
    ),
    'intro-python': ArCertificateCopy(
      title: 'مقدمة إلى بايثون',
      issuer: 'Coursera',
      description:
          'إتمام دورة مقدمة في لغة بايثون تشمل المفاهيم الأساسية والصياغة.',
    ),
    'ugrf-1': ArCertificateCopy(
      title: 'شهادة UGRF',
      issuer: 'UGRF (ملتقى البحث الجامعي)',
      description:
          'شهادة مشاركة في بحث جامعي تعترف بالمساهمة الأكاديمية.',
    ),
    'ugrf-2': ArCertificateCopy(
      title: 'تقدير UGRF',
      issuer: 'UGRF (ملتقى البحث الجامعي)',
      description:
          'شهادة تقدير إضافية لعمل بحثي جامعي متميز.',
    ),
    'we-certificate': ArCertificateCopy(
      title: 'مطوّر تطبيقات جوال بـ Flutter',
      issuer: 'المصرية للاتصالات',
      description:
          'تدريب عملي على تطوير تطبيقات الجوال باستخدام إطار Flutter في شركة المصرية للاتصالات.\n\n'
          'المدة: يوليو 2024 – سبتمبر 2024 (3 أشهر)',
    ),
    'sprints-microsoft-summer-camp-mobile-dev': ArCertificateCopy(
      title: 'معسكر Sprints ومايكروسوفت الصيفي — تطوير الجوال',
      issuer: 'Sprints × Microsoft',
      description:
          'مسار تعليمي لتطوير الجوال يغطي أساسيات التطبيقات، لغة Dart، وأساسيات Flutter، مع مشروع تطبيق تسوق نهائي '
          'ومتطلبات التعلم عبر Microsoft Learn.',
    ),
  };

  static ArCertificateCopy? forId(String id) => _byId[id];
}
