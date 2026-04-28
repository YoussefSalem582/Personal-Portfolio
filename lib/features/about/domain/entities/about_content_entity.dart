import 'package:equatable/equatable.dart';

import '../../../../models/contact.dart';

class AboutContentEntity extends Equatable {
  const AboutContentEntity({
    required this.email,
    required this.resumeUrl,
    required this.socialLinks,
    required this.projectsCount,
    required this.technologiesCount,
  });

  final String email;
  final String resumeUrl;
  final List<SocialLink> socialLinks;
  final int projectsCount;
  final int technologiesCount;

  @override
  List<Object?> get props =>
      [email, resumeUrl, socialLinks, projectsCount, technologiesCount];
}
