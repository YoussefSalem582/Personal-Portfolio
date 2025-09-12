class Skill {
  final String name;
  final String category;
  final int proficiency; // 1-5 scale
  final String? iconPath;

  const Skill({
    required this.name,
    required this.category,
    required this.proficiency,
    this.iconPath,
  });
}

class SkillCategory {
  final String name;
  final List<Skill> skills;

  const SkillCategory({required this.name, required this.skills});
}
