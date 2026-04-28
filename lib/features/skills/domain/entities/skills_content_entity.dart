import 'package:equatable/equatable.dart';

import '../../../../models/skill.dart';

class SkillsContentEntity extends Equatable {
  const SkillsContentEntity({required this.skillCategories});

  final List<SkillCategory> skillCategories;

  @override
  List<Object?> get props => [skillCategories];
}
