import 'package:equatable/equatable.dart';

import '../../../../models/contact.dart';

class HeroContentEntity extends Equatable {
  const HeroContentEntity({
    required this.fullName,
    required this.socialLinks,
  });

  final String fullName;
  final List<SocialLink> socialLinks;

  @override
  List<Object?> get props => [fullName, socialLinks];
}
