import '../local/personal_info_data.dart';
import '../../domain/entities/hero_content_entity.dart';
import 'hero_local_datasource.dart';

class HeroLocalDataSourceImpl implements HeroLocalDataSource {
  const HeroLocalDataSourceImpl();

  @override
  HeroContentEntity getContentSync() {
    return const HeroContentEntity(
      fullName: PersonalInfoData.fullName,
      socialLinks: PersonalInfoData.socialLinks,
    );
  }
}
