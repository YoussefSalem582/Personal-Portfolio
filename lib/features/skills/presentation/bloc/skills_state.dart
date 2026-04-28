import 'package:equatable/equatable.dart';

import '../../domain/entities/skills_content_entity.dart';

abstract class SkillsState extends Equatable {
  const SkillsState();

  @override
  List<Object?> get props => [];
}

final class SkillsInitial extends SkillsState {
  const SkillsInitial();
}

final class SkillsLoading extends SkillsState {
  const SkillsLoading();
}

final class SkillsLoaded extends SkillsState {
  const SkillsLoaded(this.content);

  final SkillsContentEntity content;

  @override
  List<Object?> get props => [content];
}

final class SkillsFailure extends SkillsState {
  const SkillsFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
