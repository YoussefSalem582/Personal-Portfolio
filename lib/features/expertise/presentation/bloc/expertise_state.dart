import 'package:equatable/equatable.dart';

import '../../domain/entities/expertise_content_entity.dart';

abstract class ExpertiseState extends Equatable {
  const ExpertiseState();

  @override
  List<Object?> get props => [];
}

final class ExpertiseInitial extends ExpertiseState {
  const ExpertiseInitial();
}

final class ExpertiseLoading extends ExpertiseState {
  const ExpertiseLoading();
}

final class ExpertiseLoaded extends ExpertiseState {
  const ExpertiseLoaded(this.content);

  final ExpertiseContentEntity content;

  @override
  List<Object?> get props => [content];
}

final class ExpertiseFailure extends ExpertiseState {
  const ExpertiseFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
