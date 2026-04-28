import '../../../../utils/data/portfolio_data.dart';
import '../../domain/entities/about_content_entity.dart';
import 'about_local_datasource.dart';

class AboutLocalDataSourceImpl implements AboutLocalDataSource {
  const AboutLocalDataSourceImpl();

  @override
  AboutContentEntity getContentSync() {
    final techCount =
        PortfolioData.skills.expand((cat) => cat.skills).length;
    return AboutContentEntity(
      email: PersonalInfoData.email,
      resumeUrl: PersonalInfoData.resumeUrl,
      socialLinks: PersonalInfoData.socialLinks,
      projectsCount: PortfolioData.projects.length,
      technologiesCount: techCount,
    );
  }
}
