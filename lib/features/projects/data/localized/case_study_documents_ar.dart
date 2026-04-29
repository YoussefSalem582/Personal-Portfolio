import '../../../../core/utils/assets/app_documents.dart';

/// Arabic display strings for a document card.
class CaseStudyDocAr {
  final String title;
  final String description;

  const CaseStudyDocAr({required this.title, required this.description});
}

/// Arabic titles/descriptions for case-study document cards (paths match [ProjectDocuments]).
class CaseStudyDocumentsAr {
  CaseStudyDocumentsAr._();

  static const CaseStudyDocAr _projectDocs = CaseStudyDocAr(
    title: 'توثيق المشروع',
    description: 'شرح ميزات المشروع والبنية التقنية',
  );
  static const CaseStudyDocAr _technicalReport = CaseStudyDocAr(
    title: 'تقرير تقني',
    description: 'تقرير تفصيلي عن التنفيذ والهندسة',
  );
  static const CaseStudyDocAr _researchReport = CaseStudyDocAr(
    title: 'تقرير بحثي',
    description: 'تحليل مقارن لنماذج التعلم الآلي',
  );
  static const CaseStudyDocAr _sourceCode = CaseStudyDocAr(
    title: 'الشفرة المصدرية',
    description: 'تنفيذ كامل مع دفاتر الملاحظات',
  );

  static final Map<String, CaseStudyDocAr> _map = {
    ProjectDocuments.emosenseApp: _projectDocs,
    ProjectDocuments.emosenseAppReport: _technicalReport,
    ProjectDocuments.chatApp: const CaseStudyDocAr(
      title: 'توثيق المشروع',
      description: 'ميزات تطبيق الدردشة والبنية المعمارية',
    ),
    ProjectDocuments.musicApp: const CaseStudyDocAr(
      title: 'توثيق المشروع',
      description: 'توثيق تطبيق مشغل الموسيقى',
    ),
    ProjectDocuments.chargeHubApp: const CaseStudyDocAr(
      title: 'توثيق المشروع',
      description: 'توثيق تطبيق العثور على محطات الشحن',
    ),
    ProjectDocuments.gogeshApp: const CaseStudyDocAr(
      title: 'توثيق المشروع',
      description: 'توثيق منصة التجارة الإلكترونية',
    ),
    ProjectDocuments.carpoolRideSharingApp: const CaseStudyDocAr(
      title: 'تقرير المشروع',
      description: 'تقرير متكامل لمشروع مشاركة الرحلات',
    ),
    ProjectDocuments.potholeDetectionReport: _researchReport,
    ProjectDocuments.potholeDetectionCode: _sourceCode,
    ProjectDocuments.signLanguageTranslatorReport: const CaseStudyDocAr(
      title: 'تقرير المشروع',
      description: 'توثيق نظام التعرف على لغة الإشارة',
    ),
    ProjectDocuments.threejsProject: const CaseStudyDocAr(
      title: 'توثيق المشروع',
      description: 'توثيق مساعد التعلم ثلاثي الأبعاد',
    ),
    ProjectDocuments.facialRecognitionSystem: const CaseStudyDocAr(
      title: 'تقرير المشروع',
      description: 'توثيق وتحليل نظام التعرف على الوجوه',
    ),
  };

  static CaseStudyDocAr? forPath(String path) => _map[path];
}
