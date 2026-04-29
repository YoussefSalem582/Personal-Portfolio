import 'package:youssef_salem_portfolio/core/locale/app_locale_binding.dart';
import 'package:youssef_salem_portfolio/features/certificates/data/localized/certificates_ar.dart';
import 'package:youssef_salem_portfolio/features/expertise/data/localized/expertise_ar.dart';
import 'package:youssef_salem_portfolio/features/projects/data/localized/projects_ar.dart';
import 'package:youssef_salem_portfolio/features/skills/data/localized/skills_category_ar.dart';
import 'package:youssef_salem_portfolio/features/certificates/domain/entities/certificate.dart';
import 'package:youssef_salem_portfolio/features/expertise/domain/entities/expertise.dart';
import 'package:youssef_salem_portfolio/features/projects/domain/entities/project.dart';
import 'package:youssef_salem_portfolio/features/skills/domain/entities/skill.dart';

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
