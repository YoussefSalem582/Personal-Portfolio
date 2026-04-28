import '../repositories/home_repository.dart';

class ResolveInitialHomeSectionUseCase {
  const ResolveInitialHomeSectionUseCase(this._repository);

  final HomeRepository _repository;

  int call({int? routeOverride}) =>
      _repository.resolveInitialSectionIndex(routeOverride: routeOverride);
}
