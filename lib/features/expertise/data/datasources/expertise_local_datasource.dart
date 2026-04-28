import '../../domain/entities/expertise_content_entity.dart';

abstract class ExpertiseLocalDataSource {
  ExpertiseContentEntity getContentSync();
}
