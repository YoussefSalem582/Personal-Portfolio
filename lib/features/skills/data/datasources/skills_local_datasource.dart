import '../../domain/entities/skills_content_entity.dart';

abstract class SkillsLocalDataSource {
  SkillsContentEntity getContentSync();
}
