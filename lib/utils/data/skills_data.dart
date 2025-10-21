import '../../models/skill.dart';

class SkillsData {
  static final List<SkillCategory> skills = [
    SkillCategory(
      id: 'mobile-dev',
      name: 'Mobile Development',
      icon: 'phone_android',
      skills: [
        Skill(
            id: 'flutter',
            name: 'Flutter',
            category: 'mobile-dev',
            proficiency: 90),
        Skill(
            id: 'dart', name: 'Dart', category: 'mobile-dev', proficiency: 90),
        Skill(
            id: 'android',
            name: 'Android',
            category: 'mobile-dev',
            proficiency: 80),
        Skill(id: 'ios', name: 'iOS', category: 'mobile-dev', proficiency: 75),
        Skill(
            id: 'firebase',
            name: 'Firebase',
            category: 'mobile-dev',
            proficiency: 80),
      ],
    ),
    SkillCategory(
      id: 'programming',
      name: 'Programming Languages',
      icon: 'code',
      skills: [
        Skill(
            id: 'dart-lang',
            name: 'Dart',
            category: 'programming',
            proficiency: 90),
        Skill(
            id: 'python',
            name: 'Python',
            category: 'programming',
            proficiency: 85),
        Skill(
            id: 'javascript',
            name: 'JavaScript',
            category: 'programming',
            proficiency: 70),
        Skill(
            id: 'java', name: 'Java', category: 'programming', proficiency: 70),
        Skill(id: 'cpp', name: 'C++', category: 'programming', proficiency: 65),
      ],
    ),
    SkillCategory(
      id: 'web-dev',
      name: 'Web Development',
      icon: 'web',
      skills: [
        Skill(
            id: 'flutter-web',
            name: 'Flutter Web',
            category: 'web-dev',
            proficiency: 80),
        Skill(
            id: 'html-css',
            name: 'HTML/CSS',
            category: 'web-dev',
            proficiency: 80),
        Skill(
            id: 'js-web',
            name: 'JavaScript',
            category: 'web-dev',
            proficiency: 70),
        Skill(
            id: 'responsive',
            name: 'Responsive Design',
            category: 'web-dev',
            proficiency: 80),
      ],
    ),
    SkillCategory(
      id: 'ai-ml',
      name: 'AI & Machine Learning',
      icon: 'psychology',
      skills: [
        Skill(
            id: 'computer-vision',
            name: 'Computer Vision',
            category: 'ai-ml',
            proficiency: 80),
        Skill(
            id: 'tensorflow',
            name: 'TensorFlow',
            category: 'ai-ml',
            proficiency: 75),
        Skill(id: 'opencv', name: 'OpenCV', category: 'ai-ml', proficiency: 80),
        Skill(
            id: 'ml',
            name: 'Machine Learning',
            category: 'ai-ml',
            proficiency: 75),
      ],
    ),
    SkillCategory(
      id: 'tools',
      name: 'Tools & Technologies',
      icon: 'build',
      skills: [
        Skill(id: 'git', name: 'Git', category: 'tools', proficiency: 80),
        Skill(
            id: 'vscode', name: 'VS Code', category: 'tools', proficiency: 90),
        Skill(
            id: 'android-studio',
            name: 'Android Studio',
            category: 'tools',
            proficiency: 80),
        Skill(
            id: 'rest-api',
            name: 'REST APIs',
            category: 'tools',
            proficiency: 80),
        Skill(
            id: 'state-mgmt',
            name: 'State Management',
            category: 'tools',
            proficiency: 80),
      ],
    ),
  ];
}
