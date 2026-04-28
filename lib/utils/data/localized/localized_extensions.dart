import '../../../core/locale/app_locale_binding.dart';
import '../../../models/certificate.dart';
import '../../../models/expertise.dart';
import '../../../models/project.dart';
import '../../../models/skill.dart';
import 'certificates_ar.dart';
import 'expertise_ar.dart';
import 'projects_ar.dart';
import 'skills_category_ar.dart';

extension LocalizedProject on Project {
  String get localizedTitle {
    final ar = ProjectsAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return title;
    return ar.title;
  }

  String get localizedShortDescription {
    final ar = ProjectsAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return shortDescription;
    return ar.shortDescription;
  }

  String get localizedDescription {
    final ar = ProjectsAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return description;
    return ar.description;
  }
}

extension LocalizedCertificate on Certificate {
  String get localizedTitle {
    final ar = CertificatesAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return title;
    return ar.title;
  }

  String get localizedIssuer {
    final ar = CertificatesAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return issuer;
    return ar.issuer;
  }

  String get localizedDescription {
    final ar = CertificatesAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return description;
    return ar.description;
  }
}

extension LocalizedExpertise on Expertise {
  String get localizedTitle {
    final ar = ExpertiseAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return title;
    return ar.title;
  }

  String get localizedDescription {
    final ar = ExpertiseAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return description;
    return ar.description;
  }
}

extension LocalizedSkillCategory on SkillCategory {
  String get localizedName {
    final ar = SkillsCategoryAr.forId(id);
    if (!AppLocaleBinding.isArabic || ar == null) return name;
    return ar;
  }
}
