import '../../domain/entities/home_layout.dart';
import 'home_local_datasource.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  const HomeLocalDataSourceImpl();

  @override
  int bootstrapSectionIndex(int? routeSectionOverride) {
    if (routeSectionOverride == null) return 0;
    return HomeLayout.clampIndex(routeSectionOverride);
  }
}
