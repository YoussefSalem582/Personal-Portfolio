import 'package:equatable/equatable.dart';

abstract class SkillsEvent extends Equatable {
  const SkillsEvent();

  @override
  List<Object?> get props => [];
}

final class SkillsStarted extends SkillsEvent {
  const SkillsStarted();
}
