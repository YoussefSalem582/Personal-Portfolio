class Project {
  final String id;
  final String title;
  final String description;
  final String shortDescription;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final String? videoUrl;
  final String? shortVideoUrl;
  final String? imageUrl;
  final List<String>? galleryImages;
  final DateTime createdAt;
  final bool isFeatured;
  final bool isUnderDevelopment;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.videoUrl,
    this.shortVideoUrl,
    this.imageUrl,
    this.galleryImages,
    required this.createdAt,
    this.isFeatured = false,
    this.isUnderDevelopment = false,
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
      videoUrl: json['videoUrl'],
      shortVideoUrl: json['shortVideoUrl'],
      imageUrl: json['imageUrl'],
      galleryImages: json['galleryImages'] != null
          ? List<String>.from(json['galleryImages'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      isFeatured: json['isFeatured'] ?? false,
      isUnderDevelopment: json['isUnderDevelopment'] ?? false,
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
      'videoUrl': videoUrl,
      'shortVideoUrl': shortVideoUrl,
      'imageUrl': imageUrl,
      'galleryImages': galleryImages,
      'createdAt': createdAt.toIso8601String(),
      'isFeatured': isFeatured,
      'isUnderDevelopment': isUnderDevelopment,
    };
  }
}
