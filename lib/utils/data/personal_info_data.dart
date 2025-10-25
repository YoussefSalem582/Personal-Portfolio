import '../../models/contact.dart';
import '../assets/app_constants.dart';

class PersonalInfoData {
  // Personal information
  static const String fullName = 'Youssef Hassan';
  static const String title = 'Flutter Developer';
  static const String subtitle = 'Building fast cross-platform apps';
  static const String bio =
      'Flutter developer and ML practitioner. I build cross-platform mobile & web apps, '
      'and integrate machine learning into real-world applications (facial recognition, emotion analysis).';

  static const String email = 'youssef.salem.hassan582@gmail.com';
  static const String phone = '+20 1026855881'; // Replace with actual phone
  static const String location = 'Egypt';
  static const String portfolioUrl =
      'https://v0-youssef-salem-hassan.vercel.app/';

  // Resume download URL - Using centralized asset management
  static const String resumeUrl = AppDocuments.resume;
  static const String profileImageUrl = AppImages.profileImage;

  // Social links - Using centralized asset management
  static const List<SocialLink> socialLinks = [
    SocialLink(
      name: 'GitHub',
      url: 'https://github.com/YoussefSalem582',
      iconPath: AppIcons.githubIconSvg,
    ),
    SocialLink(
      name: 'LinkedIn',
      url: 'https://www.linkedin.com/in/youssef-hassan-8529372b7/',
      iconPath: AppIcons.linkedinIconSvg,
    ),
    SocialLink(
      name: 'YouTube',
      url: 'https://www.youtube.com/@JoeCodezFlutter',
      iconPath: AppIcons.youtubeIconSvg,
    ),
    SocialLink(
      name: 'Upwork',
      url: 'https://www.upwork.com/freelancers/~0124b005ef2bb3f524',
      iconPath: AppIcons.upworkIconSvg,
    ),
    SocialLink(
      name: 'Mostaql',
      url: 'https://mostaql.com/u/Youssef_Salem17',
      iconPath: AppIcons.mostaqlIconPng,
    ),
  ];
}
