import 'package:equatable/equatable.dart';

import '../../../../models/project.dart';

/// Read model for projects listing and case-study routing.
class ProjectsContentEntity extends Equatable {
  const ProjectsContentEntity({
    required this.projects,
    required this.featuredProjects,
  });

  final List<Project> projects;
  final List<Project> featuredProjects;

  @override
  List<Object?> get props => [projects, featuredProjects];
}
