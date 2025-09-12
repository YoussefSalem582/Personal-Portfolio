class Project {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final String? imageUrl;
  final DateTime createdAt;
  final bool isFeatured;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.imageUrl,
    required this.createdAt,
    this.isFeatured = false,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      shortDescription: json['shortDescription'],
      technologies: List<String>.from(json['technologies']),
      githubUrl: json['githubUrl'],
      liveUrl: json['liveUrl'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      isFeatured: json['isFeatured'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'shortDescription': shortDescription,
      'technologies': technologies,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
      'isFeatured': isFeatured,
    };
  }
}
