import '../../models/skill.dart';

class SkillsData {
  static final List<SkillCategory> skills = [
    // Column 1: Languages & Core Technologies
    const SkillCategory(
      id: 'languages',
      name: 'Languages',
      icon: 'code',
      skills: [
        Skill(id: 'dart', name: 'Dart', category: 'languages'),
        Skill(id: 'python', name: 'Python', category: 'languages'),
        Skill(id: 'java', name: 'Java', category: 'languages'),
        Skill(id: 'cpp', name: 'C++', category: 'languages'),
        Skill(id: 'javascript', name: 'JavaScript', category: 'languages'),
        Skill(id: 'sql', name: 'SQL', category: 'languages'),
      ],
    ),

    // Column 2: Mobile Development & State Management
    const SkillCategory(
      id: 'mobile-development',
      name: 'Frameworks & Libraries',
      icon: 'phone_android',
      skills: [
        Skill(id: 'flutter', name: 'Flutter', category: 'mobile-development'),
        Skill(
            id: 'native-ui-ux',
            name: 'Native UI/UX Design',
            category: 'mobile-development'),
        Skill(
            id: 'responsive-web',
            name: 'Responsive Web Apps',
            category: 'mobile-development'),
        Skill(id: 'getx', name: 'GetX', category: 'mobile-development'),
        Skill(id: 'bloc', name: 'BLoC Pattern', category: 'mobile-development'),
        Skill(id: 'provider', name: 'Provider', category: 'mobile-development'),
        Skill(id: 'riverpod', name: 'Riverpod', category: 'mobile-development'),
      ],
    ),

    // Column 3: Backend, Cloud & Communication
    const SkillCategory(
      id: 'backend-cloud',
      name: 'Miscellaneous',
      icon: 'cloud',
      skills: [
        Skill(id: 'rest-api', name: 'RESTful API', category: 'backend-cloud'),
        Skill(id: 'firebase', name: 'Firebase', category: 'backend-cloud'),
        Skill(id: 'supabase', name: 'Supabase', category: 'backend-cloud'),
        Skill(
            id: 'custom-backend',
            name: 'Custom Backend',
            category: 'backend-cloud'),
        Skill(id: 'github', name: 'GitHub', category: 'backend-cloud'),
        Skill(id: 'vercel', name: 'Vercel', category: 'backend-cloud'),
        Skill(id: 'emailjs', name: 'EmailJS', category: 'backend-cloud'),
        Skill(id: 'fcm', name: 'Firebase Messaging', category: 'backend-cloud'),
      ],
    ),
  ];
}
