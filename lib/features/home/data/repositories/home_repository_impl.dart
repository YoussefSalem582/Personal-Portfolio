import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required HomeLocalDataSource local}) : _local = local;

  final HomeLocalDataSource _local;

  @override
  int resolveInitialSectionIndex({int? routeOverride}) {
    return _local.bootstrapSectionIndex(routeOverride);
  }
}
