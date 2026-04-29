import '../../domain/entities/about_content_entity.dart';
import '../../../hero/data/local/personal_info_data.dart';
import '../../../projects/data/local/projects_data.dart';
import '../../../skills/data/local/skills_data.dart';
import 'about_local_datasource.dart';

class AboutLocalDataSourceImpl implements AboutLocalDataSource {
  const AboutLocalDataSourceImpl();

  @override
  AboutContentEntity getContentSync() {
    final techCount =
        SkillsData.skills.expand((cat) => cat.skills).length;
    return AboutContentEntity(
      email: PersonalInfoData.email,
      resumeUrl: PersonalInfoData.resumeUrl,
      socialLinks: PersonalInfoData.socialLinks,
      projectsCount: ProjectsData.projectsSortedByDate.length,
      technologiesCount: techCount,
    );
  }
}
