class Skill {
  final String id;
  final String name;
  final String category;
  final int proficiency; // 1-100 scale for Supabase
  final String? iconPath;
  final String? description;

  const Skill({
    required this.id,
    required this.name,
    required this.category,
    required this.proficiency,
    this.iconPath,
    this.description,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category_id'] ?? json['category'] ?? '',
      proficiency: json['proficiency'] ?? 0,
      iconPath: json['icon_path'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_id': category,
      'proficiency': proficiency,
      'icon_path': iconPath,
      'description': description,
    };
  }
}

class SkillCategory {
  final String id;
  final String name;
  final String icon;
  final String? description;
  final List<Skill> skills;
  final int orderIndex;

  const SkillCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.skills,
    this.description,
    this.orderIndex = 0,
  });

  factory SkillCategory.fromJson(Map<String, dynamic> json) {
    final skillsList = json['skills'] as List<dynamic>? ?? [];
    return SkillCategory(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'],
      orderIndex: json['order_index'] ?? 0,
      skills: skillsList.map((skillJson) => Skill.fromJson(skillJson)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'description': description,
      'order_index': orderIndex,
      'skills': skills.map((skill) => skill.toJson()).toList(),
    };
  }
}
