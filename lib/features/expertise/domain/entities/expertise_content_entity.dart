import 'package:equatable/equatable.dart';

import 'expertise.dart';

class ExpertiseContentEntity extends Equatable {
  const ExpertiseContentEntity({required this.items});

  final List<Expertise> items;

  @override
  List<Object?> get props => [items];
}
