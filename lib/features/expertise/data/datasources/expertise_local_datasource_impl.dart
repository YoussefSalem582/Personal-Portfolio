import '../local/expertise_data.dart';
import '../../domain/entities/expertise_content_entity.dart';
import 'expertise_local_datasource.dart';

class ExpertiseLocalDataSourceImpl implements ExpertiseLocalDataSource {
  const ExpertiseLocalDataSourceImpl();

  @override
  ExpertiseContentEntity getContentSync() {
    return ExpertiseContentEntity(items: ExpertiseData.expertiseList);
  }
}
