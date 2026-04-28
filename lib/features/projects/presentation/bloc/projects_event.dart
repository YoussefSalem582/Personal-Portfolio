import 'package:equatable/equatable.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object?> get props => [];
}

final class ProjectsStarted extends ProjectsEvent {
  const ProjectsStarted();
}

final class ProjectsFilterSelected extends ProjectsEvent {
  const ProjectsFilterSelected(this.filter);

  final String filter;

  @override
  List<Object?> get props => [filter];
}

final class ProjectsShowMoreTapped extends ProjectsEvent {
  const ProjectsShowMoreTapped();
}
