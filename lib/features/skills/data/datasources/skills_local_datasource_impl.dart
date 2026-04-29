import '../local/skills_data.dart';
import '../../domain/entities/skills_content_entity.dart';
import 'skills_local_datasource.dart';

class SkillsLocalDataSourceImpl implements SkillsLocalDataSource {
  const SkillsLocalDataSourceImpl();

  @override
  SkillsContentEntity getContentSync() {
    return SkillsContentEntity(skillCategories: SkillsData.skills);
  }
}
