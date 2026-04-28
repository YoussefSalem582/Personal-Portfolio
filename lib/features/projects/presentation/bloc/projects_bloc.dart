import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_projects_content_usecase.dart';
import 'projects_event.dart';
import 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc({required LoadProjectsContentUseCase loadProjectsContent})
      : _loadProjectsContent = loadProjectsContent,
        super(const ProjectsInitial()) {
    on<ProjectsStarted>(_onStarted);
    on<ProjectsFilterSelected>(_onFilter);
    on<ProjectsShowMoreTapped>(_onShowMore);
    add(const ProjectsStarted());
  }

  final LoadProjectsContentUseCase _loadProjectsContent;

  static const List<String> _filters = [
    'All',
    'Flutter',
    'GetX',
    'BLoC/Cubit',
    'E-commerce',
    'Chat Apps',
    'Education',
    'Firebase',
    'Maps & GPS',
    'AI/ML',
    'Clean Architecture',
    'Enterprise',
  ];

  Future<void> _onStarted(
    ProjectsStarted event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(const ProjectsLoading());
    final result = await _loadProjectsContent(const NoParams());
    result.fold(
      (f) => emit(ProjectsFailure(f.message)),
      (content) => emit(
        ProjectsReady(
          allProjects: content.projects,
          filters: _filters,
          selectedFilter: 'All',
          displayedCount: ProjectsReady.initialDisplayCount,
        ),
      ),
    );
  }

  void _onFilter(
    ProjectsFilterSelected event,
    Emitter<ProjectsState> emit,
  ) {
    final s = state;
    if (s is! ProjectsReady) return;
    emit(
      s.copyWith(
        selectedFilter: event.filter,
        displayedCount: ProjectsReady.initialDisplayCount,
      ),
    );
  }

  void _onShowMore(
    ProjectsShowMoreTapped event,
    Emitter<ProjectsState> emit,
  ) {
    final s = state;
    if (s is! ProjectsReady) return;
    emit(
      s.copyWith(
        displayedCount:
            s.displayedCount + ProjectsReady.incrementCount,
      ),
    );
  }
}
