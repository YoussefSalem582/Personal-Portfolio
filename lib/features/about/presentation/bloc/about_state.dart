import 'package:equatable/equatable.dart';

import '../../domain/entities/about_content_entity.dart';

abstract class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object?> get props => [];
}

final class AboutInitial extends AboutState {
  const AboutInitial();
}

final class AboutLoading extends AboutState {
  const AboutLoading();
}

final class AboutLoaded extends AboutState {
  const AboutLoaded(this.content);

  final AboutContentEntity content;

  @override
  List<Object?> get props => [content];
}

final class AboutFailure extends AboutState {
  const AboutFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
