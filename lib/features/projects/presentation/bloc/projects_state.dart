import 'package:equatable/equatable.dart';

import '../../domain/entities/project.dart';
import '../../domain/project_filter.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object?> get props => [];
}

final class ProjectsInitial extends ProjectsState {
  const ProjectsInitial();
}

final class ProjectsLoading extends ProjectsState {
  const ProjectsLoading();
}

final class ProjectsFailure extends ProjectsState {
  const ProjectsFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

final class ProjectsReady extends ProjectsState {
  const ProjectsReady({
    required this.allProjects,
    required this.filters,
    required this.selectedFilter,
    required this.displayedCount,
  });

  final List<Project> allProjects;
  final List<String> filters;
  final String selectedFilter;
  final int displayedCount;

  static const initialDisplayCount = 6;
  static const incrementCount = 3;

  List<Project> get filteredVisible =>
      ProjectFilter.applyLimited(allProjects, selectedFilter, displayedCount);

  List<Project> get allFiltered =>
      ProjectFilter.apply(allProjects, selectedFilter);

  bool get canShowMore => allFiltered.length > displayedCount;

  ProjectsReady copyWith({
    String? selectedFilter,
    int? displayedCount,
  }) {
    return ProjectsReady(
      allProjects: allProjects,
      filters: filters,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      displayedCount: displayedCount ?? this.displayedCount,
    );
  }

  @override
  List<Object?> get props =>
      [allProjects, filters, selectedFilter, displayedCount];
}
