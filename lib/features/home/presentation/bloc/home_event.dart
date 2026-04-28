import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Updates the active landing section index (0–6) from scroll or nav.
final class HomeSectionIndexChanged extends HomeEvent {
  const HomeSectionIndexChanged(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}
